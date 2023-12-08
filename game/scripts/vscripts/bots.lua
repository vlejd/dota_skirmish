require("internal/adv_log")
require("internal/globals")
require("game_states/game_reader")
require("internal/util")
require("time_utils")
require("neutral_items") -- TODO: add check for this


if Bots == nil then
	Bots = class({})
	Bots.bot_last_human_command = {}
	Bots.player_ids = {}
end

function Bots:MakeBotsControllable()
	-- Looks like this is not needed
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

	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime);

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		local humans = {}
		local bots = {}
		for i = 1, DOUBLE_MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				local player_steam_id = PlayerResource:GetSteamAccountID(playerID)
				if player_steam_id == 0 then -- this is a bot
					local bot_hero_name = PlayerResource:GetSelectedHeroEntity(playerID):GetUnitName()
					Bots.bot_last_human_command[bot_hero_name] = -100
				else
					Bots.player_ids[playerID] = true
				end
			end
		end
	end


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

		if is_move_order then
			if issued_by_player then -- exec move order made by player and remeber time for obedience
				for _, entity_index in pairs(order.units) do
					local entity = EntIndexToHScript(entity_index)
					local unit_name = entity:GetUnitName()
					if Bots.bot_last_human_command[unit_name] ~= nil then
						-- this unit is a bot, update skirmish time
						Bots.bot_last_human_command[unit_name] = time.skirmishTime;

					end
				end
				return true
			else -- bots are trying to move on their own, allow only if they dont need to be obedient.
				--BOT_OBEDIENCE_TIME
				for _, entity_index in pairs(order.units) do
					local entity = EntIndexToHScript(entity_index)
					local unit_name = entity:GetUnitName()
					if Bots.bot_last_human_command[unit_name] ~= nil then
						if time.skirmishTime > Bots.bot_last_human_command[unit_name] + BOT_OBEDIENCE_TIME then
							return true
						else
							return false
						end
					end
				end
			end
		end
		return true
	end, self);
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
