if SkirmishGameMode == nil then
	SkirmishGameMode = class({})
	SkirmishGameMode.num_human_players = nil
	SkirmishGameMode.num_spectators = nil
	SkirmishGameMode.random_hero_to_playerID = {}
	SkirmishGameMode.hero_selection_ended = false
	SkirmishGameMode.human_player_names = {}
	SkirmishGameMode.masterTime = nil
end

isRoshanDead = true
local waypointPossitions = {}

require("internal/util")
require("libraries/adv_log")
require("string")
require("game_states/game_reader")

local waypoints = require("waypoints")
require("neutral_items")
require("hero_selection")
require("scenario_selection")
require("internal/globals")
require("time_utils")

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
		local replaced = tablelength(HeroSelection.heroes_replaced)
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
		SkirmishGameMode:initWaypoints()
		SkirmishGameMode:ReportLoadingProgress("Smacking buildings")
		SkirmishGameMode:FixBuildings()
		SkirmishGameMode:ReportLoadingProgress("Reshufling outposts")
		SkirmishGameMode:FixOutposts()
		SkirmishGameMode:ReportLoadingProgress("Warding")
		SkirmishGameMode:FixWards()
		setup_stage = 25
		return 0.1

	elseif setup_stage == 25 then
		SkirmishGameMode:ReportLoadingProgress("Massaging players")
		SkirmishGameMode:FixPlayers()
		NeutralItems:Setup(SkirmishGameMode.masterTime)
		setup_stage = 3
		return 0.1

	elseif setup_stage == 3 then
		SkirmishGameMode:ReportLoadingProgress("Raising creeps")
		SkirmishGameMode:MakeCreeps()
		SkirmishGameMode:ReportLoadingProgress("Stealing neutral items")
		SkirmishGameMode:FixNeutrals()
		SkirmishGameMode:ReportLoadingProgress("Summoning Roshan")
		SkirmishGameMode:InitialRoshanSetup()
		setup_stage = 4
		return 0.1

	elseif setup_stage == 4 then
		setup_stage = 5
		SkirmishGameMode:ReportLoadingProgress("Hiding items in the forest")
		SkirmishGameMode:FixNeutralItems()
		SkirmishGameMode:ReportLoadingProgress("Contemplating life")
		SkirmishGameMode:AddThinkers()
		SkirmishGameMode:ReportLoadingProgress("Venesecting")
		SkirmishGameMode:FixFirstBlood()
		SkirmishGameMode:ReportLoadingProgress("Putting shinny stones in the river")
		SkirmishGameMode:FixRunes()
		SkirmishGameMode:ReportLoadingProgress("Making sure you can win")
		SkirmishGameMode:SetWinconText()
		-- GameRules:GetGameModeEntity():SetDaynightCycleDisabled(false)
		-- GameRules:SetTimeOfDay(140)
		print("make_screen_not_dark")
		local data = {}
		SkirmishGameMode:ReportLoadingProgress("Let there be light!")
		CustomGameEventManager:Send_ServerToAllClients("make_screen_not_dark", data)
		print("master time")
		print(TimeUtils:GetMasterTime(SkirmishGameMode.masterTime))
		-- TODO wait with pause until buffer time is over
		if START_WITH_PAUSE then
			PauseGame(true)
		end
		return 2
	elseif setup_stage == 5 then
		SkirmishGameMode:SetGliphCooldowns()
		return nil
	else
		print("Unexpected state: setup_stage", setup_stage)
		return nil
	end
end

function SkirmishGameMode:FixRunes()
	print("Fixing runes")
	local gameModeEnt = GameRules:GetGameModeEntity()
	gameModeEnt:SetUseDefaultDOTARuneSpawnLogic(false)		-- true = river runes spawn at 2:00, all runes. false = required to disable runes, they start at 0:00

	local rune_state = false
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_DOUBLEDAMAGE , rune_state) --Double Damage
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_HASTE, rune_state) --Haste
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_ILLUSION, rune_state) --Illusion
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_INVISIBILITY, rune_state) --Invis
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_REGENERATION, rune_state) --Regen
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_ARCANE, rune_state) --Arcane
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_BOUNTY, rune_state) --Bounty
		-- gameModeEnt:ClearRuneSpawnFilter()
		-- gameModeEnt:SetBountyRuneSpawnInterval()
		-- gameModeEnt:SetPowerRuneSpawnInterval()
		-- gameModeEnt:SetNextBountyRuneSpawnTime()
		-- gameModeEnt:SetNextRuneSpawnTime()

	gameModeEnt:SetThink("RuneSpawner", self, "RuneSpawnerGlobalThink", 0.1)
end


local next_minute = nil

function SkirmishGameMode:RuneSpawner()
	local time = TimeUtils:GetMasterTime(SkirmishGameMode.masterTime)
	print("rune spawner")

	if next_minute == nil then
		next_minute = math.floor(time.skirmishTime / 60) * 60 + 60
	end

	if time.skirmishTime < next_minute then
		return next_minute - time.skirmishTime
	end
	local min_num = next_minute / 60

	next_minute = next_minute + 60
	print("min_num", min_num)
	-- bounty runes every 3 minutes
	-- power runes every 2 minutes after min 4, dissapears
	-- water runes - not for now

	if min_num > 4 and min_num % 2 == 0 then
		print("spawning rune power ")
		-- kill old ones
		local runes = Entities:FindAllByClassname("dota_item_rune")
		print(#runes)
		for i = 1, #runes do
			local rune = runes[i]
			if string.find(rune:GetModelName(), "rune_goldxp") == nil then
				rune:RemoveSelf()
			end
		end
		-- CDOTA_Item_Rune
		local rune_names = {"item_rune_arcane", "item_rune_doubledamage", "item_rune_haste"}
		Entities:FindAllByName("dota_item_rune_spawner_powerup")

		-- spawn new runes
		local rune_options = {DOTA_RUNE_DOUBLEDAMAGE, DOTA_RUNE_HASTE, DOTA_RUNE_ILLUSION, DOTA_RUNE_INVISIBILITY,
                        DOTA_RUNE_REGENERATION, DOTA_RUNE_ARCANE}
		local power_rune_spawners = Entities:FindAllByName("dota_item_rune_spawner_powerup")
		local spawner = getRandomValueFromArray(power_rune_spawners)
		local rune_type = getRandomValueFromArray(rune_options)
		CreateRune(spawner:GetAbsOrigin(), rune_type)
	end

	if min_num > 2 and min_num % 3 == 0 then
		print("spawning rune bounty")
		local bounty_rune_spawners = Entities:FindAllByName("dota_item_rune_spawner_bounty")
		for i = 1, #bounty_rune_spawners do
			local spawner = bounty_rune_spawners[i]
			CreateRune(spawner:GetAbsOrigin(), DOTA_RUNE_BOUNTY)
		end
	end

	return 10
end

function dump_runes()
	print("dump_runes")
	local runes = Entities:FindAllByClassname("dota_item_rune")
	print(#runes)
	for i = 1, #runes do
		local rune = runes[i]
		print(rune)
		print(rune:GetModelName())
		print(rune:GetName())
		print(rune:GetAbsOrigin())
		
	end
end


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

function fixPosition(poz)
	print("fixPosition")
	print(type(poz))
	print(poz)
	if type(poz) == "userdata" then  -- hope this is Vector
		print("udata")
		return poz
	end
	if type(poz) == "table" then
		print("table")
		if poz["0"] then
			if tablelength(poz) == 2 then
				return Vector(poz["0"], poz["1"])
			elseif tablelength(poz) == 3 then
				return Vector(poz["0"], poz["1"], poz["2"])
			else
				print("ERROR invalid vector")
				return Vector(100,100)
			end
		else
			if tablelength(poz) == 2 then
				return Vector(poz[1], poz[2])
			elseif tablelength(poz) == 3 then
				return Vector(poz[1], poz[2], poz[3])
			else
				print("ERROR invalid vector")
				return Vector(100,100)
			end
		end
		
	end
end

creeps_to_kill = nil
local next_wave_time = nil


function SkirmishGameMode:LaneCreepSpawner()
	-- Spawn enemy creeps for a moment on every wave spawn to fix their agro behavior
	local time = TimeUtils:GetMasterTime(SkirmishGameMode.masterTime)
	print("LaneCreepSpawner", time.skirmishTime, next_wave_time)

	if next_wave_time == nil then
		next_wave_time = SkirmishGameMode.masterTime.skirmishNextWave
	end


	if time.skirmishTime < next_wave_time then
		print("No time yet, waiting precise", time.skirmishTime, next_wave_time)
		return next_wave_time - time.skirmishTime
	end

	next_wave_time = next_wave_time + 30

	local raxes = {good={}, bad={}}

	for _, lane in pairs({"bot", "mid", "top"}) do
		for _, team in pairs({"good", "bad"}) do
			for _, rax_type in pairs({"melee", "range"}) do
				-- good_rax_melee_mid
				local rax_name = team .. "_rax_" .. rax_type .. "_" .. lane
				local rax = Entities:FindByName(nil, rax_name)
				if rax ~= nil then
					raxes[team][rax_name] = 1
				end
			end
		end
	end
	print("raxes", raxes)

	for _, lane in pairs({"bot", "mid", "top"}) do
		for _, team in pairs({"good", "bad"}) do
			local spawn_name = "lane_" .. lane .. "_" .. team .. "guys_melee_spawner"
			local spawner = Entities:FindByName(nil, spawn_name)
			local other_team = ""
			local other_team_int = 0
			local team_int = 0

			if team == "good" then
				other_team = "bad"
				other_team_int = DOTA_TEAM_BADGUYS
				team_int = DOTA_TEAM_GOODGUYS
			else
				other_team = "good"
				other_team_int = DOTA_TEAM_GOODGUYS
				team_int = DOTA_TEAM_BADGUYS
			end

			local cPoz = spawner:GetAbsOrigin()
			-- "npc_dota_creep_" .. team .. "guys_ranged", "npc_dota_creep_" .. team .. "guys_melee"
			

			local num_melee_creeps = 3
			local num_range_creeps = 1
			local num_siege_creeps = 0
			local num_flag_creeps = 0
			

			if time.skirmishTime >= 15*60 then
				num_melee_creeps = num_melee_creeps + 1
			end
			if time.skirmishTime >= 30*60 then
				num_melee_creeps = num_melee_creeps + 1
			end
			if time.skirmishTime >= 45*60 then
				num_melee_creeps = num_melee_creeps + 1
			end
			if time.skirmishTime >= 40*60 then
				num_range_creeps = num_range_creeps + 1
			end

			local wave_num = math.floor(time.skirmishTime/30)
			if wave_num % 10 == 0  and wave_num > 0  then
				num_siege_creeps = num_siege_creeps + 1
				if time.skirmishTime >= 35*60 then
					num_siege_creeps = num_siege_creeps + 1
				end
			end
			
			if wave_num % 2 == 0  and wave_num >= 4  then
				num_flag_creeps = num_flag_creeps + 1
				num_melee_creeps = num_melee_creeps - 1
			end

			local range_upgrade = ""
			local melee_upgrade = ""
			local siege_upgrade = ""
			local flag_upgrade = ""
			
			-- if this lane has range
			-- good_rax_melee_mid
			if raxes[other_team][other_team .. "_rax_melee_" .. lane] == nil then
				melee_upgrade = "_upgraded"
				flag_upgrade = "_upgraded"
			end
			if raxes[other_team][other_team .. "_rax_range_" .. lane] == nil then
				range_upgrade = "_upgraded"
				siege_upgrade = "_upgraded"
			end
			if tablelength(raxes[other_team]) == 0 then
				melee_upgrade = "_upgraded_mega"
				flag_upgrade = "_upgraded_mega"
				melee_upgrade = "_upgraded_mega"
				siege_upgrade = "_upgraded_mega"
			end
			 

			local what_to_spawn = {}
			table_multiinsert(what_to_spawn, "npc_dota_creep_" .. team .. "guys_ranged" .. range_upgrade, num_range_creeps)
			table_multiinsert(what_to_spawn, "npc_dota_creep_" .. team .. "guys_melee" .. melee_upgrade, num_melee_creeps)
			table_multiinsert(what_to_spawn, "npc_dota_" .. team .. "guys_siege" .. siege_upgrade, num_siege_creeps)
			table_multiinsert(what_to_spawn, "npc_dota_creep_" .. team .. "guys_flagbearer" .. flag_upgrade, num_flag_creeps)			
			
			-- TODO proper creep positions

			for _, creep_type in pairs(what_to_spawn) do
				local hCreep = CreateUnitByName(creep_type, spawner:GetAbsOrigin(), true, nil,
					nil, team_int)
				print(hCreep, creep_type)
				local waypointName = getClosestWaypointNext(hCreep:GetAbsOrigin(), team_int)
				local waypoint = Entities:FindByName(nil, waypointName)
				hCreep:SetInitialGoalEntity(waypoint)
				hCreep:SetMustReachEachGoalEntity(true)
			end
		end
	end
	return 5

end

function table_multiinsert(table_dest, what, how_many)
	for i = 1, how_many, 1 do
		table.insert(table_dest, what)
	end
end


function SkirmishGameMode:SetWinconText()
	if GameReader:GetWinCondition() ~= nil then
		local end_time = (
			SkirmishGameMode.masterTime.skirmishStartTime + 
			GameReader:GetWinCondition().time)
		local data = {text = "Ends at", time = end_time }
		CustomGameEventManager:Send_ServerToAllClients("set_timer_msg", data)
	end
end

function SkirmishGameMode:SetGliphCooldowns()
	local time = TimeUtils:GetMasterTime(SkirmishGameMode.masterTime)

	if time.realGameTime > 5 then
		-- TODO get real glyph cooldowns
		GameRules:SetGlyphCooldown(DOTA_TEAM_GOODGUYS, 0)
		GameRules:SetGlyphCooldown(DOTA_TEAM_BADGUYS, 0)
		return nil
	else
		return 0.5
	end
end

function SkirmishGameMode:InitialRoshanSetup()
	local GameMode = GameRules:GetGameModeEntity()
	SkirmishGameMode:FixRoshanStatsDrops()

	if GameReader:GetRoshanInfo()["alive"] then
		local hRosh = Entities:FindByName(nil, "npc_dota_roshan")
		if GameReader:GetRoshanInfo()["rosh_hp"] ~= nil then
			hRosh:SetHealth(GameReader:GetRoshanInfo()["rosh_hp"])
		end
		SkirmishGameMode:FixRoshan()
		GameMode:SetThink("FixRoshan", self, "FixRoshanGlobalThink", 1)
	else
		local hRosh = Entities:FindByName(nil, "npc_dota_roshan")
		hRosh:SetAbsOrigin(Vector(20000, 20000))
		local time_passed = GameReader:GetRoshanInfo()["time_since_death"]
		local rosh_sudo_respaun = RandomInt(math.max(0, (8 * 60) - time_passed), math.max(0, (11 * 60) - time_passed))
		print("respawn time", rosh_sudo_respaun)
		GameMode:SetThink("PutRoshanBack", self, "PutRoshBackTinker", rosh_sudo_respaun)
	end
end

function SkirmishGameMode:PutRoshanBack()
	local GameMode = GameRules:GetGameModeEntity()
	local hRosh = Entities:FindByName(nil, "npc_dota_roshan")
	local hRoshanSpawner = Entities:FindByName(nil, "roshan_location")
	print("hRoshanSpawner", hRoshanSpawner)
	print(hRosh:GetAbsOrigin())
	FindClearSpaceForUnit(hRosh, hRoshanSpawner:GetAbsOrigin(), true)
	SkirmishGameMode:FixRoshan()
	GameMode:SetThink("FixRoshan", self, "FixRoshanGlobalThink", 1)
	return nil
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

function getClosestWaypointNext(cPoz, team)
	local teamName = ""
	if team == 2 then
		teamName = "goodguys"
	else
		teamName = "badguys"
	end

	local bestDist = 9999999;
	local bestWaypoint = "lane_mid_pathcorner_" .. teamName .. "_3";

	for _, path in pairs(waypoints[teamName]) do
		for i = 1, #path - 1 do
			local waypointPoz = waypointPossitions[path[i]];
			local dist = dist2(waypointPoz, cPoz);
			if dist <= bestDist then
				bestWaypoint = path[i + 1];
				bestDist = dist;
			end
		end
	end
	return bestWaypoint;
end

function SkirmishGameMode:MakeCreeps()
	print("making creepes")
	for _, creepData in pairs(GameReader:GetCreepsInfo() or {}) do
		
		local skip = false
		local skip_list = {"npc_dota_visage_familiar", "npc_dota_broodmother_web"}
		for _, skip_name in pairs(skip_list) do
			local find_res = string.find(creepData["name"], skip_name) 
			if find_res ~= nil then
				skip = true
			end
		end

		if skip then
			-- TODO fix later

		else
			
			local cPoz = fixPosition(creepData["position"])
			local hCreep = CreateUnitByName(creepData["name"], cPoz, true, nil, nil, creepData["team"])

			if creepData["health"] ~= nil then
				hCreep:SetHealth(creepData["health"])
			end
			if creepData["mana"] ~= nil then
				hCreep:SetMana(creepData["mana"])
			end

			if creepData["type"] == "lane" then
				local waypointName = getClosestWaypointNext(hCreep:GetAbsOrigin(), creepData["team"])
				local waypoint = Entities:FindByName(nil, waypointName)
				hCreep:SetInitialGoalEntity(waypoint)
				hCreep:SetMustReachEachGoalEntity(true)

			elseif creepData["type"] == "controlled" then
				if creepData["owner"] then
					if creepData["owner"]["type"] == "hero" then
						local hero_name = creepData["owner"]["refname"]
						local hero_entity = Entities:FindByName(nil, hero_name)
						local player_id = hero_entity:GetPlayerOwnerID()
						hCreep:SetOwner(hero_entity)
						hCreep:SetControllableByPlayer(player_id, false)

						if string.find(creepData["name"], "npc_dota_eidolon") then
							-- TODO add proper duration
							-- TODO add the split thing
							-- check this: https://github.com/CryDeS/Angel-Arena-Reborn/search?q=modifier_eidolons_attack_counter
							hCreep:AddNewModifier(hero_entity, nil, "modifier_demonic_conversion", {duration = 40})
							hCreep:AddNewModifier(hero_entity, nil, "modifier_eidolons_splitting", {duration = 40})
							
							-- hCreep:ForceKill(false)
						end
						-- hCreep:AddNewModifier(hero_entity, nil, "modifier_chen_holy_persuasion", {})						
					else
						print("ERROR unexpected controller type")
					end

				else
					print("ERROR controlled unit does not have owner")
				end
			end
		end
	end
end

function SkirmishGameMode:FixWards()
	print("fixing wards")

	for _, ward in pairs(GameReader:GetWardsInfo() or {}) do
		-- npc_dota_observer_wards
		-- npc_dota_sentry_wards
		local hWard = CreateUnitByName(ward["type"], fixPosition(ward["position"]), true, nil, nil, ward["team"])
		if ward["type"] == "npc_dota_observer_wards" then
			local kill_buff = hWard:AddNewModifier(hWard, nil, "modifier_kill", {
				duration = 360
			})
			local ward_buff = hWard:AddNewModifier(hWard, nil, "modifier_item_buff_ward", {})
			print(kill_buff, ward_buff)
		elseif ward["type"] == "npc_dota_sentry_wards" then
			local kill_buff = hWard:AddNewModifier(hWard, nil, "modifier_kill", {
				duration = 420
			})
			local ward_buff = hWard:AddNewModifier(hWard, nil, "modifier_item_buff_ward", {})
			local sentry_buff = hWard:AddNewModifier(hWard, nil, "modifier_item_ward_true_sight", {
				true_sight_range = 900
			})
			print(kill_buff, ward_buff, sentry_buff)

		else
			print("Unexpected ward type", ward["type"])
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

function SkirmishGameMode:FixNeutralItems()
	print("fixing neutral items")
	for _, item in pairs(GameReader:GetRadiantNeutralItemsInfo() or {}) do
		print("good", item)
		NeutralItems:AddItemToStash(item, DOTA_TEAM_GOODGUYS)
	end

	for _, item in pairs(GameReader:GetDireNeutralItemsInfo() or {}) do
		print("bad", item)
		NeutralItems:AddItemToStash(item, DOTA_TEAM_BADGUYS)
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
	FindClearSpaceForUnit(hHero, fixPosition(heroData["position"]), true)

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

	print("cooldown", heroData["name"], tablelength(heroData["cooldowns"]))
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

function SkirmishGameMode:FixRoshan()
	local hRosh = Entities:FindByName(nil, "npc_dota_roshan")
	if hRosh == nil then
		if isRoshanDead then
			-- pass
			return 0.1
		else
			print("roshan just died")
			isRoshanDead = true
			GameReader:SetRoshanInfo(GameReader:GetRoshanInfo()["deaths"] + 1)
			return 300
		end
	else
		if isRoshanDead then
			print("roshan just respawned")
			isRoshanDead = false
			SkirmishGameMode:FixRoshanStatsDrops()
		end
		SkirmishGameMode:FixRoshanHealth()
		return 0.001
	end
end

function SkirmishGameMode:DamageFilterRoshan(keys)
	if keys.entindex_attacker_const and keys.entindex_victim_const then
		attacker = EntIndexToHScript(keys.entindex_attacker_const)
		victim = EntIndexToHScript(keys.entindex_victim_const)
		if victim:GetName() == "npc_dota_roshan" then
			SkirmishGameMode:FixRoshanHealth()
		end
	else
		return true
	end
	return true
end

function SkirmishGameMode:FixRoshanStatsDrops()
	print("fixing roshan")
	local time = TimeUtils:GetMasterTime(SkirmishGameMode.masterTime)
	local mins = math.floor(time.skirmishTime / 60)

	local hRosh = Entities:FindByName(nil, "npc_dota_roshan") --
	if hRosh ~= nil then
		print("rosh", hRosh)
		hRosh:SetPhysicalArmorBaseValue(20 + mins * 0.325)
		hRosh:SetBaseDamageMax(75 + 6 * mins)
		hRosh:SetBaseDamageMin(75 + 6 * mins)
		hRosh:SetDeathXP(400 + 20 * mins)

		-- TODO attack speed

		for i = 0, 20 do
			local hItem = hRosh:GetItemInSlot(i)
			if hItem ~= nil then
				hRosh:RemoveItem(hItem)
			end
		end

		local roshan_items = {"item_aegis"}
		if GameReader:GetRoshanDeaths() >= 1 then
			table.insert(roshan_items, "item_cheese")
		end
		if GameReader:GetRoshanDeaths() == 1 then
			table.insert(roshan_items, "item_aghanims_shard_roshan")
		end
		if GameReader:GetRoshanDeaths() == 2 then
			local rng = RandomInt(0, 1)
			if rng == 0 then
				table.insert(roshan_items, "item_refresher_shard")
			else
				table.insert(roshan_items, "item_ultimate_scepter_roshan")
			end
		end
		if GameReader:GetRoshanDeaths() >= 3 then
			table.insert(roshan_items, "item_refresher_shard")
			table.insert(roshan_items, "item_ultimate_scepter_roshan")
		end

		for _, itemName in pairs(roshan_items) do
			hRosh:AddItemByName(itemName)
		end

		return 0.1
	end

	return 0.1
end

function SkirmishGameMode:FixRoshanHealth()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		local time = TimeUtils:GetMasterTime(SkirmishGameMode.masterTime)
		local mins = math.floor(time.skirmishTime / 60)
		local secs = math.floor(time.skirmishTime)

		local hRosh = Entities:FindByName(nil, "npc_dota_roshan")

		if hRosh ~= nil then
			local desired_max_health = 6000 + mins * 115

			local current_max_health = hRosh:GetMaxHealth()
			local current_health = hRosh:GetHealth()
			hRosh:SetMaxHealth(desired_max_health)
			local new_health = math.floor(current_health / current_max_health * desired_max_health)
			if last_secs ~= secs then
				new_health = new_health + 20
			end
			hRosh:SetHealth(new_health)
			last_secs = secs

			return 0.001
		end
		return 0.1
	else
		return 1
	end
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
						desired_hero_name = getRandomValueFromArray(available_heroes)
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
	GameMode:SetThink("LaneCreepSpawner", self, "LaneCreepSpawnerGlobalThink", 1)

	GameMode:SetDamageFilter(Dynamic_Wrap(self, "DamageFilterRoshan"), self)
end

function SkirmishGameMode:UpdateTime()
	if SkirmishGameMode.masterTime == nil then
		print("SkirmishGameMode.masterTime not initialized yet")
		return 1
	end
	local time = TimeUtils:GetMasterTime(SkirmishGameMode.masterTime)
	local data = {time = time.skirmishTime}
	CustomGameEventManager:Send_ServerToAllClients("update_game_time", data)
	return 0.001 
end

function SkirmishGameMode:CheckWinCondition()
	local time = TimeUtils:GetMasterTime(SkirmishGameMode.masterTime)
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

function SkirmishGameMode:initWaypoints()
	for _, team in pairs({"goodguys", "badguys"}) do
		for _, path in pairs(waypoints[team]) do
			for _, point in pairs(path) do
				local waypoint = Entities:FindByName(nil, point)
				local poz = waypoint:GetAbsOrigin();
				waypointPossitions[point] = poz
			end
		end
	end
end

function SkirmishGameMode:FixFirstBlood()
	local kills = 0
	for hero_name, herodata in pairs(GameReader:GetHeroesInfo()) do
		if herodata.kills then
			kills = kills + herodata.kills
		end
	end
	print("found kills", kills)
	if kills > 0 then
		print("first blood disabled")
		GameRules:SetFirstBloodActive(false)
	else
		print("first blood active")
		GameRules:SetFirstBloodActive(true)
	end

end


function SkirmishGameMode:FixNeutrals()
	GameRules:SpawnNeutralCreeps()
	-- neutralcamp_good_8
	
	for i = 1, 10, 1 do
		-- camps are evil vs good vs bad. omggg
		local spawner_name = "neutralcamp_evil_"..i
		local spawner = Entities:FindByName(nil, spawner_name)
		print("spawner", spawner_name, spawner)
		if spawner ~= nil then
			--spawner.SpawnNextBatch(false)
		end
	end

end


function SkirmishGameMode:InitializeTime()
	print("InitializeTime")
	SkirmishGameMode.masterTime = TimeUtils:InitialTimeComputations()
	print(SkirmishGameMode.masterTime)
	GameRules:SetPreGameTime(SkirmishGameMode.masterTime.realPregameLength)
end
