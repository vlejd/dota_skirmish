require("internal/adv_log")
require("internal/globals")
require("game_states/game_reader")
require("internal/util")
require("time_utils")
require("neutral_items") -- TODO: add check for this

BOT_STATE_OBEY = 0
BOT_STATE_OBEY_NOT_MOVE = 1
BOT_STATE_READY = 2

if Bots == nil then
	Bots = class({})
	Bots.bot_last_human_command = {}
	Bots.bot_state = {}
	Bots.bot_state_data = {}
	Bots.player_ids = {}
	Bots.good_base = nil
	Bots.bad_base = nil
end

function Bots:MakeBotsControllable()
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		local humans = {}
		local bots = {}
		for i = 1, DOUBLE_MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				local player_steam_id = PlayerResource:GetSteamAccountID(playerID)
				if player_steam_id == 0 then -- this is a bot
					table.insert(bots, playerID)
				else
					table.insert(humans, playerID)
				end
			end
		end
		print("team", teamNum)
		print("humans", humans)
		print("bots", bots)

		for _, botID in pairs(bots) do
			local bot_hero = PlayerResource:GetSelectedHeroEntity(botID)
			bot_hero:SetControllableByPlayer(-1, true)
			
			for _, humanID in pairs(humans) do
				bot_hero:SetControllableByPlayer(humanID, false)
			end 
		end
	end
	GameRules:GetGameModeEntity():SetBotThinkingEnabled(WORKING_BOTS)
end

function Bots:MakeBotsSmart()
	if not WORKING_BOTS then return nil end
	Bots:Init()
	Bots:SetOrderFilter()
	GameRules:GetGameModeEntity():SetThink("CustomBotAI", self, "CustomBotAIThink", 1)

end

function Bots:CustomBotAI()
	--GameRules:GetGameModeEntity():SetBotThinkingEnabled(WORKING_BOTS)

	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime);
	print(Bots.bot_state)
	local enemy_in_base = {}
	for team = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		enemy_in_base[team] = Bots:FindEnemyInBase(team)
	end

	for bot_unit_name, current_state in pairs(Bots.bot_state) do
		if current_state == BOT_STATE_OBEY then
			if time.skirmishTime > Bots.bot_last_human_command[bot_unit_name] + 2 then
				Bots.bot_state[bot_unit_name] = BOT_STATE_OBEY_NOT_MOVE
			end
		end
		if current_state == BOT_STATE_OBEY_NOT_MOVE then
			if time.skirmishTime > Bots.bot_last_human_command[bot_unit_name] + 10 then
				Bots.bot_state[bot_unit_name] = BOT_STATE_READY
			end
		end
		if current_state == BOT_STATE_READY then
			local hBot = Entities:FindByName(nil, bot_unit_name)
			if hBot == nil or (not hBot:IsAlive()) then
				goto next_unit
			end
			
			local enemy = nil

			local is_in_base = Bots:IsInBase(hBot)

			-- if something near by
			enemy = Bots:FindEnemyNearBy(hBot)
			if enemy ~= nil then
				print(hBot:GetUnitName(), "killing nearby", enemy:GetUnitName(), enemy:IsAlive())
				BotExecuteOrderFromTable({
					UnitIndex=hBot:entindex(),
					OrderType=DOTA_UNIT_ORDER_ATTACK_TARGET,
					TargetIndex=enemy:entindex(),
				})
				BotExecuteOrderFromTable({
					UnitIndex=hBot:entindex(),
					OrderType=DOTA_UNIT_ORDER_ATTACK_MOVE,
					TargetIndex=enemy:entindex(),
				})

				goto next_unit
			end

			-- if enemy in base
			enemy = enemy_in_base[hBot:GetTeamNumber()]
			-- if something near by
			if enemy ~= nil then
				if Bots.bot_state_data[bot_unit_name]["deffender"] == nil then
					Bots.bot_state_data[bot_unit_name]["deffender"] = (RandomInt(1, 3) == 1)
				end
				print(hBot:GetUnitName(), "killing in base")
				if Bots.bot_state_data[bot_unit_name]["deffender"] or is_in_base then
					print("defending", Bots.bot_state_data[bot_unit_name]["deffender"], is_in_base)
					-- TODO add port.

					BotExecuteOrderFromTable({
						UnitIndex=hBot:entindex(),
						OrderType=DOTA_UNIT_ORDER_MOVE_TO_TARGET,
						TargetIndex=enemy:entindex(),
					})
					goto next_unit
				else
					print("Base on fire, I attack")
				end
			else
				Bots.bot_state_data[bot_unit_name]["deffender"] = nil
			end

			-- if nothing to do, go to enemy base :D
			Bots:GoToEnemyAncient(hBot)

		end
		::next_unit::
	end

	return 1
end

function Bots:IsInBase(hBot)
	local my_base = nil
	if hBot:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
		my_base = Bots.good_base
	else
		my_base = Bots.bad_base
	end

	local dist_to_base = Util:dist2(hBot:GetAbsOrigin(), my_base:GetAbsOrigin())
	return dist_to_base < 3000*2

end

function BotExecuteOrderFromTable(order_table)
	-- ExecuteOrderFromTable still go through order filter. funny
	-- signals to order filter that this order must be obeyed.
	order_table["AbilityIndex"] = -2
	ExecuteOrderFromTable(order_table)
end

function Bots:GoToEnemyAncient(hBot)
	-- If nothing to do, run to enemy base :D
	-- if you have nothing to do, got to enemy ancient :D
	local enemy_base = nil
	if hBot:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
		enemy_base = Bots.bad_base
	else
		enemy_base = Bots.good_base
	end
	print(hBot:GetUnitName(), "moving to enemy", enemy_base:entindex(),  enemy_base:GetOrigin())
	BotExecuteOrderFromTable({
		UnitIndex=hBot:entindex(),
		OrderType=DOTA_UNIT_ORDER_MOVE_TO_TARGET,
		-- Position=enemy_base:GetOrigin(),
		TargetIndex = enemy_base:entindex(),
		Queue = false,
	})
end

function get_priority(target)
	if target:IsHero() then return 0 end
	if target:IsCreep() then return 1 end
	if target:IsBuilding() then return 2 end
	return 3
end	

function Bots:FindEnemyNearBy(hBot)
	local search_radius = 1000 
	local targets = FindUnitsInRadius(
		hBot:GetTeamNumber(),	-- int, your team number
		hBot:GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		search_radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_ALL,	-- int, type filter
		DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_NOT_ATTACK_IMMUNE,	-- int, flag filter
		FIND_CLOSEST,	-- int, order filter
		false	-- bool, can grow cache
	)
	if targets == nil or #targets == 0 then
		return nil
	end
	table.sort(targets, function(a,b) return get_priority(a)<get_priority(b) end)
	return targets[1]
end

function Bots:FindEnemyInBase(team)
	local base_poz = nil
	if team == DOTA_TEAM_GOODGUYS then
		base_poz = Bots.good_base:GetOrigin()
	else
		base_poz = Bots.bad_base:GetOrigin()
	end
	local search_radius = 2500.0
	local targets = FindUnitsInRadius(
		team,	-- int, your team number
		base_poz,	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		search_radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_ALL,	-- int, type filter
		DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS + DOTA_UNIT_TARGET_FLAG_NOT_ATTACK_IMMUNE,	-- int, flag filter
		FIND_CLOSEST,	-- int, order filter
		false	-- bool, can grow cache
	)
	if targets == nil or #targets == 0 then
		return nil
	end
	table.sort(targets, function(a,b) return get_priority(a)<get_priority(b) end)
	return targets[1]
end


function Bots:SetOrderFilter()
	GameRules:GetGameModeEntity():SetExecuteOrderFilter(function (ctx, order)
		-- looks like DOTA_UNIT_ORDER_PING_ABILITY is not it.
		local time = TimeUtils:GetMasterTime(TimeUtils.masterTime);
		if time == nil then return true end

		local player_id = order.issuer_player_id_const
		local is_move_order = (
			order.order_type == DOTA_UNIT_ORDER_MOVE_TO_POSITION or
			order.order_type == DOTA_UNIT_ORDER_MOVE_TO_TARGET or
			order.order_type == DOTA_UNIT_ORDER_ATTACK_MOVE or
			order.order_type == DOTA_UNIT_ORDER_MOVE_TO_DIRECTION or
			order.order_type == DOTA_UNIT_ORDER_MOVE_TO_RELATIVE or
			order.order_type == DOTA_UNIT_ORDER_PATROL
		)
		local issued_by_player = (Bots.player_ids[player_id] ~= nil)


		if issued_by_player then -- exec move order made by player and remeber time for obedience
			for _, entity_index in pairs(order.units) do
				local entity = EntIndexToHScript(entity_index)
				local unit_name = entity:GetUnitName()
				if Bots.bot_last_human_command[unit_name] ~= nil then
					-- this unit is a bot, update skirmish time
					Bots.bot_last_human_command[unit_name] = time.skirmishTime;
					Bots.bot_state[unit_name] = BOT_STATE_OBEY
					Bots.bot_state_data[unit_name] = {}
				end
			end
			return true
		end

		-- order done by custom ai
		if order.entindex_ability == -2 then
			return true
		end

		-- bots are trying to do something on their own, allow only if they dont need to be obedient.
		-- BOT_OBEDIENCE_TIME
		for _, entity_index in pairs(order.units) do
			local entity = EntIndexToHScript(entity_index)
			local unit_name = entity:GetUnitName()
			if Bots.bot_last_human_command[unit_name] ~= nil then
				if Bots.bot_state[unit_name] == BOT_STATE_OBEY then
					return false
				end
				if is_move_order then
					return false
				end
				
				-- bots often get stucked on this... like picking up gem when the already have one.
				if order.order_type == DOTA_UNIT_ORDER_PICKUP_ITEM then  
					return false
				end
				return true
			end
		end
		
		return true
	end, self);
end

function Bots:Init()
	-- initialize bots
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime);
	Bots.good_base = Entities:FindByName(nil, "dota_goodguys_fort")
	Bots.bad_base = Entities:FindByName(nil, "dota_badguys_fort")

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		local humans = {}
		local bots = {}
		for i = 1, DOUBLE_MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				local player_steam_id = PlayerResource:GetSteamAccountID(playerID)
				if player_steam_id == 0 then -- this is a bot
					local bot_hero_name = PlayerResource:GetSelectedHeroEntity(playerID):GetUnitName()
					Bots.bot_state[bot_hero_name] = BOT_STATE_READY
					Bots.bot_last_human_command[bot_hero_name] = -100
					Bots.bot_state_data[bot_hero_name] = {}
				else
					Bots.player_ids[playerID] = true
				end
			end
		end
	end
end




function Bots:AddBots()
	print("AddBots")
	-- Adding player SteamID 0 to PlayerID 1 FakeClient=1, preferred PlayerID = -1
	-- the is IsFakeClient PlayerID
	local n_good_players = 0
	local n_bad_players = 0

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, DOUBLE_MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				if teamNum == DOTA_TEAM_GOODGUYS then
					n_good_players = n_good_players + 1
				else
					n_bad_players = n_bad_players + 1
				end
			end
		end
	end
	print("n_good_players: "..n_good_players, " n_bad_players: "..n_bad_players)
	
	for i = 1, (5 - n_good_players) do
		print("good bot")
		Tutorial:AddBot("", "", "", true)
	end

	for i = 1, (5 - n_bad_players) do
		print("bad bot")
		Tutorial:AddBot("", "", "", false)
	end

	Tutorial:StartTutorialMode();
	GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(true)
	GameRules:GetGameModeEntity():SetBotsInLateGame(true)
	GameRules:GetGameModeEntity():SetBotsMaxPushTier(-1)
end
