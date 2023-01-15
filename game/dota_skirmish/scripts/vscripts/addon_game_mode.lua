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
require("player_recreation")
require("bots")


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
		SkirmishGameMode:ReportLoadingProgress("Mastering time")
		GameRules:GetGameModeEntity():SetThink("UpdateTime", self, "UpdateTimeGlobalThink", 0.1)
		SkirmishGameMode:ReportLoadingProgress("Planting flowers")
		CreepReconstruction:initWaypoints()
		SkirmishGameMode:ReportLoadingProgress("Smacking buildings")
		GameStateRecreationFunctions:FixBuildings()
		SkirmishGameMode:ReportLoadingProgress("Reshufling outposts")
		GameStateRecreationFunctions:FixOutposts()
		SkirmishGameMode:ReportLoadingProgress("Warding")
		GameStateRecreationFunctions:FixWards()
		SkirmishGameMode:ReportLoadingProgress("Neutralizing items")
		NeutralItems:Setup(TimeUtils.masterTime)
		
		setup_stage = setup_stage + 1
		return 0.01 

	elseif setup_stage == 1 then

		SkirmishGameMode:ReportLoadingProgress("Stealing neutral items")
		GameStateRecreationFunctions:FixNeutralCreeps()
		SkirmishGameMode:ReportLoadingProgress("Summoning Roshan")
		Roshan:InitialRoshanSetup()

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

		setup_stage = setup_stage + 1
		return 0.01 
	elseif setup_stage == 2 then

		SkirmishGameMode:ReportLoadingProgress("Waiting for players to load")
		local num_players = SkirmishGameMode:LoadedHeroes()
		if num_players < 10 then
			print("Waiting for unloaded players", num_players, 10)
			-- return nil
			return 0.1
		else
			print("players loaded")
			PlayerRecreation:SpawnDesiredHeroes(SkirmishGameMode.random_hero_to_playerID)
			setup_stage = setup_stage + 1
			return 0.01
		end
		return 0.01 
	elseif setup_stage == 3 then
		SkirmishGameMode:ReportLoadingProgress("Spawning correct heroes")
		local replaced = Util:tablelength(HeroSelection.heroes_replaced)
		print(replaced)
		if replaced < 10 then
			print("waiting for hero replacements")
			return 0.1
		else
			print("all heroes replaced")
			setup_stage = setup_stage + 1
			return 0.01
		end

	elseif setup_stage == 4 then

		SkirmishGameMode:ReportLoadingProgress("Scolding Aghanim")
		PlayerRecreation:FixUpgrades();
		SkirmishGameMode:ReportLoadingProgress("Massaging players")
		PlayerRecreation:FixPlayers()
		SkirmishGameMode:ReportLoadingProgress("Making bots obedient")
		Bots:MakeBotsControllable()
		SkirmishGameMode:ReportLoadingProgress("Raising creeps")
		CreepReconstruction:MakeCreeps()

		setup_stage = setup_stage + 1
		return 0.01 

	elseif setup_stage == 5 then
		local data = {}
		SkirmishGameMode:ReportLoadingProgress("Let there be light!")
		CustomGameEventManager:Send_ServerToAllClients("make_screen_not_dark", data)
		print("master time")
		print(TimeUtils:GetMasterTime(TimeUtils.masterTime))

		if START_WITH_PAUSE then
			PauseGame(true)
		end
		setup_stage = setup_stage + 1
		return 5
		
	elseif setup_stage == 6 then
		GameStateRecreationFunctions:SetGlyphCooldowns()
		setup_stage = setup_stage + 1
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
		-- TODO, test if this changes the playerID 
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
	Bots:AddBots(SkirmishGameMode.num_human_players)
	-- select heros for bots
	HeroSelection:TotalyRandomForNoHeroSelected()
	-- start game
	SkirmishGameMode.hero_selection_ended = true
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



function SkirmishGameMode:InitializeTime()
	print("InitializeTime")
	TimeUtils:InitialTimeComputations()
	GameRules:SetPreGameTime(TimeUtils.masterTime.realPregameLength)
end
