if SkirmishGameMode == nil then
	SkirmishGameMode = class({})
	SkirmishGameMode.num_human_players = nil
	SkirmishGameMode.num_spectators = nil
	SkirmishGameMode.random_hero_to_playerID = {}
	SkirmishGameMode.hero_selection_ended = false
	SkirmishGameMode.human_player_names = {}
end



require("internal/util")
require("internal/adv_log")
require("string")
require("game_states/game_reader")

require("neutral_items")
require("hero_selection")
require("scenario_selection")
require("internal/globals")
require("time_utils")
require("roshan")
require("game_state_recreation_functions")
require("creep_reconstruction")

LinkLuaModifier("modifier_eidolons_splitting","mechanics/modifier_eidolons_splitting",LUA_MODIFIER_MOTION_NONE)

function Precache(context)
	PrecacheResource("model", "*.vmdl", context)
	PrecacheResource("soundfile", "*.vsndevts", context)
	PrecacheResource("particle", "*.vpcf", context)
	PrecacheResource("particle_folder", "particles/folder", context)
end

function Activate()
	print("Activate")
	GameRules.AddonTemplate = SkirmishGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function CastToBool(something)
	if type(something) == "boolean" then
		return something
	end
	if type(something) == "number" then
		return something == 1
	end
	if type(something) == "string" then
		return something ~=""
	end
	
end

function SkirmishGameMode:InitGameMode()
	print("InitGameMode.")
	-- LockCustomGameSetupTeamAssignment
	-- SetIgnoreLobbyTeamsInCustomGame
	GameRules:EnableCustomGameSetupAutoLaunch(false)
	-- GameRules:SetCustomGameSetupAutoLaunchDelay(0.0)
	GameRules:SetHeroSelectionTime(SCENARIO_SELECTION_LENGTH + HERO_SELECTION_LENGTH)
	GameRules:SetStrategyTime(0.0)
	GameRules:SetShowcaseTime(0.0)
	-- GameRules:SetPreGameTime(60)
	GameRules:SetPostGameTime(30.0)
	GameRules:GetGameModeEntity():SetTowerBackdoorProtectionEnabled(true)
	GameRules:GetGameModeEntity():SetBotThinkingEnabled(true)
	-- GameRules:GetGameModeEntity():SetCustomGameForceHero("npc_dota_hero_wisp") -- Disable vanilla hero selection
	GameRules:SetCreepSpawningEnabled(false)
	ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(self, "OnStateChange"), self)

	HeroSelection:ListenToHeroPick()
	ScenarioSelection:ListenToScenarioPick()

	-- GameRules:SetCustomGameTeamMaxPlayers(1, 10)
	-- GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_GOODGUYS, DOUBLE_MAX_PLAYERS)
	-- GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_BADGUYS, DOUBLE_MAX_PLAYERS)

end

function Spawn()
	local gameModeEnt = GameRules:GetGameModeEntity()	
	print("spawn")
	GameRules:SetCustomGameTeamMaxPlayers(1, 10)
	GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_GOODGUYS, 5)
	GameRules:SetCustomGameTeamMaxPlayers(DOTA_TEAM_BADGUYS, 5)


end

setup_stage = -1

function SkirmishGameMode:ReportLoadingProgress(loading_text)
	print(text)
	local data = {
		text = loading_text
	}
	CustomGameEventManager:Send_ServerToAllClients("set_loading_text", data)
end

function SkirmishGameMode:WaitForSetup()
	print("SkirmishGameMode:WaitForSetup " .. GameRules:State_Get() .. "  " .. setup_stage)
	if setup_stage == -1 then
		print("")
		SkirmishGameMode:ReportLoadingProgress("Waiting for hero selection")
		if SkirmishGameMode.hero_selection_ended then
			print("Hero selection ended")
			setup_stage = 0
			return 0.01
		else
			print("Hero selection not ended yet")
			return 0.1
		end

	elseif setup_stage == 0 then
		SkirmishGameMode:ReportLoadingProgress("Waiting for players to load")
		local num_players = SkirmishGameMode:LoadedHeroes()
		if num_players < 10 then
			print("Waiting for unloaded players", num_players, 10)
			-- return nil
			return 0.1
		else
			print("players loaded")
			SkirmishGameMode:HandleGameStart()
			setup_stage = 1
			return 0.01
		end
	elseif setup_stage == 1 then
		SkirmishGameMode:ReportLoadingProgress("Spawning correct heroes")
		local replaced = Util:tablelength(HeroSelection.heroes_replaced)
		print(replaced)
		if replaced < 10 then
			print("waiting for hero replacements")
			return 0.1
		else
			print("all heroes replaced")
			setup_stage = 2
			return 0.1
		end
	elseif setup_stage == 2 then
		SkirmishGameMode:ReportLoadingProgress("Mastering time")
		GameRules:GetGameModeEntity():SetThink("UpdateTime", self, "UpdateTimeGlobalThink", 0.1)
		SkirmishGameMode:ReportLoadingProgress("Making bots obedient")
		SkirmishGameMode:MakeBotsControllable()

		SkirmishGameMode:ReportLoadingProgress("Scolding Aghanim")
		SkirmishGameMode:FixUpgrades();
		SkirmishGameMode:ReportLoadingProgress("Planting flowers")
		CreepReconstruction:initWaypoints()
		SkirmishGameMode:ReportLoadingProgress("Smacking buildings")
		SkirmishGameMode:FixBuildings()
		SkirmishGameMode:ReportLoadingProgress("Reshufling outposts")
		SkirmishGameMode:FixOutposts()
		SkirmishGameMode:ReportLoadingProgress("Warding")
		GameStateRecreationFunctions:FixWards()
		setup_stage = 25
		return 0.1

	elseif setup_stage == 25 then
		SkirmishGameMode:ReportLoadingProgress("Massaging players")
		NeutralItems:Setup(TimeUtils.masterTime)
		SkirmishGameMode:FixPlayers()
		setup_stage = 3
		return 0.1

	elseif setup_stage == 3 then
		SkirmishGameMode:ReportLoadingProgress("Raising creeps")
		CreepReconstruction:MakeCreeps()
		SkirmishGameMode:ReportLoadingProgress("Stealing neutral items")
		GameStateRecreationFunctions:FixNeutralCreeps()
		SkirmishGameMode:ReportLoadingProgress("Summoning Roshan")
		Roshan:InitialRoshanSetup()
		setup_stage = 4
		return 0.1

	elseif setup_stage == 4 then
		setup_stage = 5
		SkirmishGameMode:ReportLoadingProgress("Hiding items in the forest")
		GameStateRecreationFunctions:FixNeutralItems()
		SkirmishGameMode:ReportLoadingProgress("Contemplating life")
		SkirmishGameMode:AddThinkers()
		SkirmishGameMode:ReportLoadingProgress("Venesecting")
		GameStateRecreationFunctions:FixFirstBlood()
		SkirmishGameMode:ReportLoadingProgress("Putting shinny stones in the river")
		GameStateRecreationFunctions:FixRunes()
		SkirmishGameMode:ReportLoadingProgress("Making sure you can win")
		GameStateRecreationFunctions:SetWinconText()
		print("make_screen_not_dark")
		local data = {}
		SkirmishGameMode:ReportLoadingProgress("Let there be light!")
		CustomGameEventManager:Send_ServerToAllClients("make_screen_not_dark", data)
		print("master time")
		print(TimeUtils:GetMasterTime(TimeUtils.masterTime))
		-- TODO wait with pause until buffer time is over
		if START_WITH_PAUSE then
			PauseGame(true)
		end
		return 2
	elseif setup_stage == 5 then
		GameStateRecreationFunctions:SetGlyphCooldowns()
		return nil
	else
		print("Unexpected state: setup_stage", setup_stage)
		return nil
	end
end


local next_minute = nil


function SkirmishGameMode:LoadedHeroes()
	local num_players = 0
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				local old_hero = PlayerResource:GetSelectedHeroEntity(playerID)
				if old_hero ~= nil then
					num_players = num_players + 1
				end
			end
		end
	end
	return num_players
end




function SkirmishGameMode:FixUpgrades()
	print("fixing upgrades")

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				if PlayerResource:HasSelectedHero(playerID) then
					local heroName = PlayerResource:GetSelectedHeroName(playerID)
					local hHero = PlayerResource:GetSelectedHeroEntity(playerID)
					local niceHeroName = heroName:sub(15)
					print(heroName, hHero, niceHeroName)
					if GameReader:GetHeroInfo(niceHeroName) ~= nil then
						local heroData = GameReader:GetHeroInfo(niceHeroName)
						if CastToBool(heroData["has_shard"]) then
							hHero:AddItemByName("item_aghanims_shard")
						end
						if CastToBool(heroData["has_ags"]) then
							hHero:AddItemByName("item_ultimate_scepter_2")
						end
						if CastToBool(heroData["has_moon_shard"]) then
							hHero:AddItemByName("item_moon_shard")
							local hMoonShard = hHero:FindItemInInventory("item_moon_shard")
							ExecuteOrderFromTable({
								UnitIndex = hHero:entindex(),
								OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
								AbilityIndex = hMoonShard:entindex(),
								TargetIndex = hHero:entindex()
							})
						end

						local hTP = hHero:FindItemInInventory("item_tpscroll")
						if hTP then
							hTP:EndCooldown()
						else
							hTP = hHero:AddItemByName("item_tpscroll")
							if hTP then
								hTP:SetCurrentCharges(1)
								hTP:EndCooldown()
							end
						end
					else
						print("CRITICAL ERROR")
					end
				else
					print("CRITICAL ERROR")
				end
			else
				print("CRITICAL ERROR")
			end
		end
	end
end



function SkirmishGameMode:FixBuildings()
	print("fixing buildlings")

	for _, building in pairs(GameReader:GetBuildingsInfo() or {}) do
		local hBuilding = Entities:FindByName(nil, building["name"])
		if building["health"] ~= -1 then
			if building["health"] == 0 then
				hBuilding:Kill(nil, nil)
			else
				hBuilding:SetHealth(building["health"])
			end
		end
	end
end

function SkirmishGameMode:FixOutposts()
	print("fixing outposts")

	for _, building in pairs(GameReader:GetOutpostsInfo() or {}) do
		local hBuilding = Entities:FindByName(nil, building["name"])
		hBuilding:SetTeam(building["team"])
	end
end


function SkirmishGameMode:FixPlayers()
	print("fixing players")

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				if PlayerResource:HasSelectedHero(playerID) then
					local heroName = PlayerResource:GetSelectedHeroName(playerID)
					local hPlayer = PlayerResource:GetPlayer(playerID)
					local hHero = PlayerResource:GetSelectedHeroEntity(playerID)
					local niceHeroName = heroName:sub(15)
					if GameReader:GetHeroInfo(niceHeroName) ~= nil then
						local heroData = GameReader:GetHeroInfo(niceHeroName)
						-- TODO add items to courier. 
						if heroData["team"] == DOTA_TEAM_GOODGUYS then
							hPlayer:SpawnCourierAtPosition(Vector(-7071, -6625, 128))
						elseif heroData["team"] == DOTA_TEAM_BADGUYS then
							hPlayer:SpawnCourierAtPosition(Vector(7233, 6476, 128))
						else
							print("invalid player team")
						end
						SkirmishGameMode:FixHero(heroData, hHero)
					end
				else
					print("CRITICAL ERROR")
				end
			else
				print("CRITICAL ERROR")
			end
		end
	end
end

function SkirmishGameMode:FixHero(heroData, hHero)
	FindClearSpaceForUnit(hHero, Util:fixPosition(heroData["position"]), true)

	for i = 2, heroData["level"] do
		hHero:HeroLevelUp(false)
	end

	for i = 0, 20 do
		local hItem = hHero:GetItemInSlot(i)
		if hItem ~= nil then
			hHero:RemoveItem(hItem)
		end
	end

	for _, item in pairs(heroData["items"] or {}) do
		if type(item) == "table" then
			print("Complex item")
			local item_name = item["name"]

			if NeutralItems:IsItemNeutral(item_name) then
				NeutralItems:AddNeutralItemToHero(hHero, item_name)
			end
			local hItem = hHero:AddItemByName(item_name)
			print(hItem)
			if hItem then
				hItem:SetCurrentCharges(item["charges"])
				hItem:EndCooldown()
				hItem:StartCooldown(item["cooldown"] + 0.0)
				hItem:SetLevel(item["level"]+0.0)
				hItem:SetPurchaseTime(item["acquire_time"])
			end
		else
			if NeutralItems:IsItemNeutral(item) then
				print("AddNeutralItemToHero", heroData["name"], item)
				NeutralItems:AddNeutralItemToHero(hHero, item)
				hHero:AddItemByName(item)
			else
				hHero:AddItemByName(item)
			end
		end

	end

	local entityIndex = hHero:GetEntityIndex()
	if heroData["talents"] ~= nil then
		for _, talentIndex in pairs(heroData["talents"] or {}) do
			local hAbility = hHero:GetAbilityByIndex(talentIndex) -- starts from 0!
			local abilityEntityIndex = hAbility:GetEntityIndex()
			local newOrder = {
				UnitIndex = entityIndex,
				OrderType = DOTA_UNIT_ORDER_TRAIN_ABILITY,
				AbilityIndex = abilityEntityIndex
			}
			ExecuteOrderFromTable(newOrder)
		end
	end

	print("cooldown", heroData["name"], Util:tablelength(heroData["cooldowns"]))
	print(heroData["cooldowns"])
	for cooldown_index, cooldown_value in pairs(heroData["cooldowns"]) do
		if type(cooldown_index) == "string" then
			cooldown_index = tonumber(cooldown_index)+1  -- TODO what the hell is happening here?!?!
		end
		local hAbility = hHero:GetAbilityByIndex(cooldown_index-1) -- starts from 0!
		print(i, hAbility)
		if hAbility ~= nil then
			hAbility:EndCooldown()
			print(cooldown_value)
			hAbility:StartCooldown(cooldown_value + 0.0)
		end
	end

	print("is_dead", heroData["is_dead"], type(heroData["is_dead"]))
	if CastToBool(heroData["is_dead"]) then
		hHero:ForceKill(true)
		hHero:SetTimeUntilRespawn(heroData["respawn_time"])
	end

	if heroData["gold_reliable"] ~= nil then
		hHero:SetGold(heroData["gold_reliable"], true)
	end
	if heroData["gold_unreliable"] ~= nil then
		hHero:SetGold(heroData["gold_unreliable"], false)
	end

	if heroData["health"] ~= nil then
		hHero:SetHealth(heroData["health"])
	end

	if heroData["mana"] ~= nil then
		hHero:SetMana(heroData["mana"])
	end
	
	if heroData["buyback_cooldown"] ~= nil and heroData["buyback_cooldown"] ~=0 then
		hHero:SetBuybackCooldownTime(heroData["buyback_cooldown"])
	end

	if heroData["buffs"] ~= nil then
		for _, buff_data in pairs(heroData["buffs"]) do
			print(buff_data)
			local buff = hHero:AddNewModifier(hero_entity, nil, buff_data["name"], {})
			buff:SetStackCount(buff_data["stacks"])
		end
	end

end

last_secs = 0


function SkirmishGameMode:OnStateChange()
	print("state change", GameRules:State_Get())

	if false then
		print("nope")
	elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_INIT then
	elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_WAIT_FOR_PLAYERS_TO_LOAD then
	elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP then
	elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_HERO_SELECTION then
		print("DOTA_GAMERULES_STATE_HERO_SELECTION")
		-- SkirmishGameMode:MakeEveryoneRadiant()
		SkirmishGameMode:SetHumanPlayersCount()
		ScenarioSelection:StartScenarioSelection(TriggerStartHeroSelection, SkirmishGameMode.num_human_players)

	elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_STRATEGY_TIME then
	elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_TEAM_SHOWCASE then
	elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_WAIT_FOR_MAP_TO_LOAD then
	elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_PRE_GAME then
		local data = {}
		print("make_screen_dark")
		CustomGameEventManager:Send_ServerToAllClients("make_screen_dark", data)
		GameRules:GetGameModeEntity():SetThink("WaitForSetup", self, "WaitForSetupGlobalThink", 0.1)

	elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_SCENARIO_SETUP then
	elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
	end
end

function SkirmishGameMode:HandleGameStart()
	print("HandleGameStart")
	-- Make screen dark to hide the magic!
	-- replace heroes with the desired ones ...
	print(SkirmishGameMode.random_hero_to_playerID)
	print(HeroSelection.player_to_hero)

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				if PlayerResource:HasSelectedHero(playerID) then
					local current_hero_name = PlayerResource:GetSelectedHeroName(playerID)
					local original_playerID = SkirmishGameMode.random_hero_to_playerID[current_hero_name]
					print(current_hero_name, playerID, original_playerID)
					local desired_hero_name = "wisp"

					if original_playerID == nil then
						print("this is a bot", teamNum, i, playerID)
						print(HeroSelection.heroes_picked)
						-- it is a bot
						local available_heroes = {}
						for hname, _ in pairs(HeroSelection.heroes_picked) do
							local picked = HeroSelection.heroes_picked[hname]
							if not picked and GameReader:GetHeroTeam(hname) == teamNum then
								table.insert(available_heroes, hname)
							end
						end
						desired_hero_name = Util:getRandomValueFromArray(available_heroes)
						print(available_heroes)
						print(desired_hero_name)
						HeroSelection.heroes_picked[desired_hero_name] = true
					else
						print("this is not a bot", teamNum, i, playerID, original_playerID)
						desired_hero_name = HeroSelection.player_to_hero[original_playerID]
					end
					local hero_name = "npc_dota_hero_" .. desired_hero_name

					PrecacheUnitByNameAsync(hero_name, function()
						local old_hero = PlayerResource:GetSelectedHeroEntity(playerID)
						print(old_hero, playerID, hero_name)
						if old_hero ~= nil then
							local new_hero = PlayerResource:ReplaceHeroWith(playerID, hero_name, 0, 0)
							HeroSelection.heroes_replaced[hero_name] = true
							GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("delay_ui_creation"), function()
								if old_hero then
									UTIL_Remove(old_hero)
								end
							end, 1.0)
						else
							print("CRITICAL ERROR")
						end
					end)

				else
					print("CRITICAL ERROR")
				end
			end
		end
	end
	-- Random for bots ...

	-- do the remaining setup
	-- Show screen!
	return nil
end

function TriggerStartHeroSelection(fast)
	SkirmishGameMode:InitializeTime()
	GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("delay_ui_creation"), function()
		print("Create Hero UI!")
		HeroSelection:StartHeroSelection(OnHeroSelectionEnd, SkirmishGameMode.num_human_players, fast)
	end, 0.01)
end

function OnHeroSelectionEnd()
	print("OnHeroSelectionEnd")
	HeroSelection:TotalyRandomForNoHeroSelected()
	-- make hero to player id mapping

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, DOUBLE_MAX_PLAYERS do  -- CHECK: SUPER_MAX_PLAYERS
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				if PlayerResource:HasSelectedHero(playerID) then
					local hPlayer = PlayerResource:GetPlayer(playerID)
					if hPlayer ~= nil then
						SkirmishGameMode.random_hero_to_playerID[PlayerResource:GetSelectedHeroName(playerID)] = playerID
					end
				else
					print("CRITICAL ERROR, someone does not have a hero")
				end
			else
				print("Nill player", teamNum, i)
			end
		end
	end
	print(SkirmishGameMode.random_hero_to_playerID)
	print(HeroSelection.player_to_hero)

	
	if CAN_PICK_FROM_OTHER_TEAM then
		print("reasigning teams")
		-- reassign teams based on current hero => player id => desired hero => desired team
		local need_fix = true
		while need_fix do
			print("need_fix")
			need_fix = false
			for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
				for i = 1, DOUBLE_MAX_PLAYERS do
					local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
					if playerID ~= nil and playerID ~= -1 then
						if PlayerResource:HasSelectedHero(playerID) then
							local selected_hero = PlayerResource:GetSelectedHeroName(playerID)
							local original_playerID = SkirmishGameMode.random_hero_to_playerID[selected_hero]
							local desired_hero = HeroSelection.player_to_hero[original_playerID]
							print(playerID, original_playerID, desired_hero)
							local desired_team = GameReader:GetHeroTeam(desired_hero)
							local current_team = PlayerResource:GetTeam(playerID)
							if (desired_team ~= current_team) then
								print("player needs team fix", playerID)
								need_fix = true
								PlayerResource:SetCustomTeamAssignment(playerID, desired_team)
							end
						else
							print("CRITICAL ERROR")
						end
					end
				end
			end
		end
	end
	FinishOnHeroSelectionEnd()
end

function FinishOnHeroSelectionEnd()
	print("FinishOnHeroSelectionEnd")
	-- add bots
	SkirmishGameMode:AddBots()
	-- select heros for bots
	HeroSelection:TotalyRandomForNoHeroSelected()
	-- start game
	SkirmishGameMode.hero_selection_ended = true
end

function SkirmishGameMode:MakeBotsControllable()
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
end

function SkirmishGameMode:AddThinkers()
	local GameMode = GameRules:GetGameModeEntity()
	-- Add thinkers
	GameMode:SetThink("CheckWinCondition", self, "CheckWinConditionGlobalThink", 1)
	GameMode:SetThink("LaneCreepSpawner", CreepReconstruction, "LaneCreepSpawnerGlobalThink", 1)
end

function SkirmishGameMode:UpdateTime()
	if TimeUtils.masterTime == nil then
		print("TimeUtils.masterTime not initialized yet")
		return 1
	end
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)
	local data = {time = time.skirmishTime}
	CustomGameEventManager:Send_ServerToAllClients("update_game_time", data)
	return 0.001 
end

function SkirmishGameMode:CheckWinCondition()
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)
	if GameReader:GetWinCondition() ~= nil then
		if time.realGameTime >= GameReader:GetWinTimeCondition() then
			GameRules:SetGameWinner(GameReader:GetDefaultWinner())
			return nil
		end
		return 0.1
	else
		return nil
	end
end

function SkirmishGameMode:SetHumanPlayersCount()
	local num_human_players = 0
	local num_spectators = 0

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, DOUBLE_MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				local hPlayer = PlayerResource:GetPlayer(playerID)
				print("playerID", playerID, hPlayer)
				if hPlayer ~= nil then
					num_human_players = num_human_players + 1
				end
			end
		end
	end
	SkirmishGameMode.num_human_players = num_human_players
	
	-- spectators
	for i = 1, DOUBLE_MAX_PLAYERS do
		local playerID = PlayerResource:GetNthPlayerIDOnTeam(1, i)
		if playerID ~= nil and playerID ~= -1 then
			local hPlayer = PlayerResource:GetPlayer(playerID)
			print("playerID", playerID, hPlayer)
			if hPlayer ~= nil then
				num_spectators = num_spectators + 1
			end
		end
	end
	SkirmishGameMode.num_spectators = num_spectators

	print("SetHumanPlayersCount human players", SkirmishGameMode.num_human_players)
	print("SetHumanPlayersCount spectators", SkirmishGameMode.num_spectators)
end

function SkirmishGameMode:AddBots()
	print("AddBots")
	local n_good_players = 0;
	local n_bad_players = 0;

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, DOUBLE_MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				local hPlayer = PlayerResource:GetPlayer(playerID)
				if hPlayer ~= nil then
					if teamNum == DOTA_TEAM_GOODGUYS then
						n_good_players = n_good_players + 1
					else
						n_bad_players = n_bad_players + 1
					end
				end
			end
		end
	end

	if not SkirmishGameMode.num_human_players == n_good_players + n_bad_players then
		print("CRITICAL ERROR")
	end

	print(n_good_players, n_bad_players)
	for i = 1, (5 - n_good_players) do
		print("good bot")
		Tutorial:AddBot("", "", "", true)
	end

	for i = 1, (5 - n_bad_players) do
		print("good bot")
		Tutorial:AddBot("", "", "", false)
	end

	Tutorial:StartTutorialMode();
	GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(true)
	GameRules:GetGameModeEntity():SetBotsInLateGame(true)
	GameRules:GetGameModeEntity():SetBotsMaxPushTier(-1)
	GameRules:GetGameModeEntity():SetBotThinkingEnabled(true)
end

function SkirmishGameMode:InitializeTime()
	print("InitializeTime")
	TimeUtils:InitialTimeComputations()
	GameRules:SetPreGameTime(TimeUtils.masterTime.realPregameLength)
end
