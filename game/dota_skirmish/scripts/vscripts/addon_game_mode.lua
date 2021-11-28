if SkirmishGameMode == nil then
	SkirmishGameMode = class({})
	SkirmishGameMode.num_human_players = nil
	SkirmishGameMode.random_hero_to_playerID = {}
	SkirmishGameMode.hero_selection_ended = false
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
	GameRules:EnableCustomGameSetupAutoLaunch(true)
	GameRules:SetCustomGameSetupAutoLaunchDelay(0.0)
	GameRules:SetHeroSelectionTime(SCENARIO_SELECTION_LENGTH + HERO_SELECTION_LENGTH)
	GameRules:SetStrategyTime(0.0)
	GameRules:SetShowcaseTime(0.0)
	GameRules:SetPreGameTime(3)
	GameRules:SetPostGameTime(30.0)
	GameRules:GetGameModeEntity():SetTowerBackdoorProtectionEnabled(true)
	GameRules:GetGameModeEntity():SetBotThinkingEnabled(true)
	GameRules:SetFirstBloodActive(false)  -- TODO add to game state
	-- GameRules:GetGameModeEntity():SetCustomGameForceHero("npc_dota_hero_wisp") -- Disable vanilla hero selection
	GameRules:SetCreepSpawningEnabled(false)
	ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(self, "OnStateChange"), self)

	HeroSelection:ListenToHeroPick()
	ScenarioSelection:ListenToScenarioPick()

	for team = 0, (DOTA_TEAM_COUNT - 1) do
		GameRules:SetCustomGameTeamMaxPlayers(team, DOUBLE_MAX_PLAYERS)
	end

end

creeps_to_kill = nil
local last_min = 1

function SkirmishGameMode:AgroFixer()
	-- Spawn enemy creeps for a moment on every wave spawn to fix their agro behavior
	print("AgroFixer")
	if creeps_to_kill == nil then
		local time = GameRules:GetDOTATime(false, false)
		if time < last_min * 30 then
			print("No time yet", time)
			return 1
		end
		print("Time to spawn creeps")

		GameRules:SpawnAndReleaseCreeps()
		creeps_to_kill = {}
		for _, lane in pairs({"bot", "mid", "top"}) do
			for _, team in pairs({"good", "bad"}) do
				local spawn_name = "lane_" .. lane .. "_" .. team .. "guys_melee_spawner"
				local spawner = Entities:FindByName(nil, spawn_name)
				local other_team = ""
				local other_team_int = 0

				if team == "good" then
					other_team = "bad"
					other_team_int = DOTA_TEAM_BADGUYS
				else
					other_team = "good"
					other_team_int = DOTA_TEAM_GOODGUYS
				end

				local hCreep = CreateUnitByName("npc_dota_creep_" .. other_team .. "guys_ranged", spawner:GetAbsOrigin(), true, nil,
					nil, other_team_int)
				table.insert(creeps_to_kill, hCreep)
			end
		end
		return 0.1
	else
		print("Killing creeps")
		for _, hCreep in pairs(creeps_to_kill) do
			hCreep:ForceKill(false)
		end
		last_min = last_min + 1
		creeps_to_kill = nil
		return 1
	end
end

function getNextWaveTimeDiff()
	local time = GameRules:GetDOTATime(false, false)
	local ret = 0
	if time < 0 then
		ret = 0 - time
	else
		local offset = time % 30
		ret = 1 + 30 - offset
	end
	print(ret)
	return ret
end

function SkirmishGameMode:SetGliphOneTimeThinker()
	--	print("SetGliphOneTimeThinker", time)
	local time = GameRules:GetDOTATime(false, false)

	if time > 5 then
		print("SetGliphOneTimeThinker")
		GameRules:SetGlyphCooldown(DOTA_TEAM_GOODGUYS, 0)
		GameRules:SetGlyphCooldown(DOTA_TEAM_BADGUYS, 0)
		return nil
	else
		return 0.5
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

setup_stage = -1

function SkirmishGameMode:WaitForSetup()
	print("SkirmishGameMode:WaitForSetup " .. GameRules:State_Get() .. "  " .. setup_stage)
	if setup_stage == -1 then
		if SkirmishGameMode.hero_selection_ended then
			print("Hero selection not ended yet")
			setup_stage = 0
			return 0.01
		else
			print("Hero selection ended")
			return 0.1
		end

	elseif setup_stage == 0 then
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
		SkirmishGameMode:FixUpgrades();
		SkirmishGameMode:initWaypoints()
		SkirmishGameMode:FixBuildings()
		SkirmishGameMode:FixWards()
		NeutralItems:Setup(GameReader:GetGameTime())
		setup_stage = 3
		return 0.1

	elseif setup_stage == 3 then
		SkirmishGameMode:MakeCreeps()
		SkirmishGameMode:FixPlayers()
		GameRules:SpawnNeutralCreeps()
		SkirmishGameMode:InitialRoshanSetup()
		setup_stage = 4
		return 0.1

	elseif setup_stage == 4 then
		setup_stage = 5
		SkirmishGameMode:FixNeutralItems()
		SkirmishGameMode:AddThinkers()
		-- GameRules:GetGameModeEntity():SetDaynightCycleDisabled(false)
		-- GameRules:SetTimeOfDay(140)
		print("make_screen_not_dark")
		local data = {}
		CustomGameEventManager:Send_ServerToAllClients("make_screen_not_dark", data)
		PauseGame(true)
		return 2
	elseif setup_stage == 5 then
		SkirmishGameMode:SetGliphCooldowns()
		return nil
	else
		print("Unexpected state: setup_stage", setup_stage)
		return nil
	end
end

function SkirmishGameMode:SetGliphCooldowns()
	local time = GameRules:GetDOTATime(false, false)

	if time > 5 then
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
						if heroData["has_shard"] then
							hHero:AddItemByName("item_aghanims_shard")
						end
						if heroData["has_ags"] then
							hHero:AddItemByName("item_ultimate_scepter_2")
						end
						if heroData["has_moon_shard"] then
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
		local cPoz = creepData["position"]
		local hCreep = CreateUnitByName(creepData["name"], cPoz, true, nil, nil, creepData["team"])
		local waypointName = getClosestWaypointNext(hCreep:GetAbsOrigin(), creepData["team"])
		local waypoint = Entities:FindByName(nil, waypointName)
		hCreep:SetInitialGoalEntity(waypoint)
		hCreep:SetMustReachEachGoalEntity(true)
	end
end

function SkirmishGameMode:FixWards()
	print("fixing wards")

	for _, ward in pairs(GameReader:GetWardsInfo() or {}) do
		-- npc_dota_observer_wards
		-- npc_dota_sentry_wards
		local hWard = CreateUnitByName(ward["type"], ward["position"], true, nil, nil, ward["team"])
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
	if heroData["gold_reliable"] ~= nil then
		hHero:SetGold(heroData["gold_reliable"], true)
	end
	if heroData["gold_unreliable"] ~= nil then
		hHero:SetGold(heroData["gold_unreliable"], true)  -- should be false
	end

	FindClearSpaceForUnit(hHero, heroData["position"], true)

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
		if NeutralItems:IsItemNeutral(item) then
			print("AddNeutralItemToHero", heroData["name"], item)
			NeutralItems:AddNeutralItemToHero(hHero, item)
			hHero:AddItemByName(item)
		else
			hHero:AddItemByName(item)
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

	for i = 1, #heroData["cooldowns"] do
		local hAbility = hHero:GetAbilityByIndex(i - 1) -- starts from 0!
		if hAbility ~= nil then
			hAbility:EndCooldown()
			hAbility:StartCooldown(heroData["cooldowns"][i])
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
	local gameTime = GameRules:GetDOTATime(false, false)
	local realTime = gameTime + GameReader:GetGameTime()
	local mins = math.floor(realTime / 60)

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
		local gameTime = GameRules:GetDOTATime(false, false)
		local realTime = gameTime + GameReader:GetGameTime()
		local mins = math.floor(realTime / 60)
		local secs = math.floor(realTime)

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
		SkirmishGameMode:MakeEveryoneRadiant()
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

function SkirmishGameMode:MakeEveryoneRadiant()
	for teamNum = DOTA_TEAM_FIRST, DOTA_TEAM_COUNT do
		for i = 1, MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				print("making player radiant", playerID)
				PlayerResource:SetCustomTeamAssignment(playerID, DOTA_TEAM_GOODGUYS)
			end
		end
	end
end

function SkirmishGameMode:HandleGameStart()
	print("HandleGameStart")
	-- Make screen dark to hide the magic! TODO
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
					print(current_hero_name, playerID)
					local desired_hero_name = "wisp"

					if original_playerID == nil then
						print("this is a bot")
						print(HeroSelection.heroes_picked)
						-- it is a bot TODO
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
						desired_hero_name = HeroSelection.player_to_hero[original_playerID]
					end
					local hero_name = "npc_dota_hero_" .. desired_hero_name

					PrecacheUnitByNameAsync(hero_name, function()
						local old_hero = PlayerResource:GetSelectedHeroEntity(playerID)
						if old_hero ~= nil then
							local new_hero = PlayerResource:ReplaceHeroWith(playerID, hero_name, 0, 0)
							HeroSelection.heroes_replaced[hero_name] = true
							-- TODO -> check if all heroeas are loaded properly
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

function TriggerStartHeroSelection()
	GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("delay_ui_creation"), function()
		print("Create Hero UI!")
		HeroSelection:StartHeroSelection(OnHeroSelectionEnd, SkirmishGameMode.num_human_players)
	end, 0.01)
end

function OnHeroSelectionEnd()
	print("OnHeroSelectionEnd")
	HeroSelection:TotalyRandomForNoHeroSelected()
	-- make hero to player id mapping

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, DOUBLE_MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				if PlayerResource:HasSelectedHero(playerID) then
					local hPlayer = PlayerResource:GetPlayer(playerID)
					if hPlayer ~= nil then
						SkirmishGameMode.random_hero_to_playerID[PlayerResource:GetSelectedHeroName(playerID)] = playerID
					end
				else
					print("CRITICAL ERROR")
				end
			end
		end
	end
	print(SkirmishGameMode.random_hero_to_playerID)
	print(HeroSelection.player_to_hero)

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
	FinishOnHeroSelectionEnd()
end

function FinishOnHeroSelectionEnd()
	-- add bots
	SkirmishGameMode:AddBots()
	-- select heros for bots
	HeroSelection:TotalyRandomForNoHeroSelected()
	-- start game
	SkirmishGameMode.hero_selection_ended = true
end

function SkirmishGameMode:AddThinkers()
	local GameMode = GameRules:GetGameModeEntity()
	-- Add thinkers
	GameMode:SetThink("CheckWinCondition", self, "CheckWinConditionGlobalThink", 1)
	GameMode:SetThink("AgroFixer", self, "AgroFixerGlobalThink", 1)
	GameMode:SetThink("UpdateTime", self, "UpdateTimeGlobalThink", 0.1)

	GameMode:SetDamageFilter(Dynamic_Wrap(self, "DamageFilterRoshan"), self)
end

function SkirmishGameMode:UpdateTime()
	local game_start_time = GameReader:GetGameTime()
	local game_elapsed_time = GameRules:GetDOTATime(false, false)
	local data = {time = game_start_time + game_elapsed_time}
	CustomGameEventManager:Send_ServerToAllClients("update_game_time", data)
	return 0.1
end

function SkirmishGameMode:CheckWinCondition()
	local gameTime = GameRules:GetDOTATime(false, false)
	if GameReader:GetWinCondition() ~= nil then
		if gameTime >= GameReader:GetWinTimeCondition() then
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
	print("SetHumanPlayersCount", SkirmishGameMode.num_human_players)
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
	GameRules:GetGameModeEntity():SetBotsMaxPushTier(4)
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
