if SkirmishGameMode == nil then
	SkirmishGameMode = class({})
	SkirmishGameMode.player_picked_hero = {}
	SkirmishGameMode.heroes_picked = {}
	SkirmishGameMode.heroes_replaced = {}
	SkirmishGameMode.numPlayers = 0
end

isRoshanDead = true
local waypointPossitions = {}


require("internal/util")
require("libraries/adv_log")
require("string")
require("game_states/game_reader")

local waypoints = require("waypoints")
require("neutral_items")

function Precache( context )
	PrecacheResource( "model", "*.vmdl", context )
	PrecacheResource( "soundfile", "*.vsndevts", context )
	PrecacheResource( "particle", "*.vpcf", context )
	PrecacheResource( "particle_folder", "particles/folder", context )
end


function Activate()
	print("Activate")
	GameRules.AddonTemplate = SkirmishGameMode()
	GameRules.AddonTemplate:InitGameMode()
end


function SkirmishGameMode:InitGameMode()
	print( "InitGameMode." )
	GameRules:EnableCustomGameSetupAutoLaunch(true)
	GameRules:SetCustomGameSetupAutoLaunchDelay(0.0)
	GameRules:SetStrategyTime(0.0)
	GameRules:SetPreGameTime(60.0)
	GameRules:SetShowcaseTime(0.0)
	GameRules:SetPostGameTime(30.0)	
	GameRules:GetGameModeEntity():SetTowerBackdoorProtectionEnabled(true)
	GameRules:GetGameModeEntity():SetBotThinkingEnabled(true)
	GameRules:GetGameModeEntity():SetCustomGameForceHero("npc_dota_hero_wisp") -- Disable vanilla hero selection
	GameRules:SetCreepSpawningEnabled(false)
	ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(self, "OnStateChange"), self)

	CustomGameEventManager:RegisterListener("request_hero_pick", Dynamic_Wrap(SkirmishGameMode, "RequestHeroPick"))
	for team = 0, (DOTA_TEAM_COUNT-1) do
		GameRules:SetCustomGameTeamMaxPlayers(team, 10)
	end

end

creeps_to_kill = nil

function SkirmishGameMode:AgroFixer()
	-- Spawn enemy creeps for a moment on every wave spawn to fix their agro behavior
	print("AgroFixer")
	if creeps_to_kill == nil then
		GameRules:SpawnAndReleaseCreeps()
		creeps_to_kill = {}
		for _, lane in pairs({"bot", "mid", "top"}) do
			for _, team in pairs({"good", "bad"}) do
				local spawn_name = "lane_"..lane.."_"..team.."guys_melee_spawner" 
				local spawner = Entities:FindByName ( nil, spawn_name )
				local other_team = ""
				local other_team_int = 0

				if team == "good" then 
					other_team = "bad"
					other_team_int = DOTA_TEAM_BADGUYS
				else
					other_team = "good"
					other_team_int = DOTA_TEAM_GOODGUYS
				end

				local hCreep = CreateUnitByName(
					"npc_dota_creep_"..other_team.."guys_ranged", 
					spawner:GetAbsOrigin(), true, nil, nil, other_team_int)
				table.insert(creeps_to_kill, hCreep)
			end
		end
		return 0.001
	else
		for _, hCreep in pairs(creeps_to_kill) do
			hCreep:ForceKill(false)
		end

		creeps_to_kill = nil
		return getNextWaveTimeDiff() + 0.1
	end
end


function getNextWaveTimeDiff()
	local time = GameRules:GetDOTATime(false, false)
	if time < 0 then
		return 0 - time
	end
	local offset = time%30
	return 30-offset
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


function SkirmishGameMode:CountPlayers()
	local num_players = 0
	local maxPlayers = 5
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i=1, maxPlayers do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				num_players = num_players + 1
			end
		end
	end
	return num_players
end

setup_stage = 0


function SkirmishGameMode:WaitForSetup()
	print("SkirmishGameMode:WaitForSetup "..GameRules:State_Get() .. "  " .. setup_stage)
	if setup_stage == 0 then
		local num_players = SkirmishGameMode:CountPlayers()
		if num_players > tablelength(SkirmishGameMode.heroes_replaced) then
			print("Waiting for unloaded players")
			--return nil
			return 0.1
		else
			print("players loaded")
			setup_stage = 1
			return 0.01
		end
	elseif setup_stage == 1 then
		SkirmishGameMode:AddBots()
		setup_stage = 101
		return 0.1
	elseif setup_stage == 101 then
		setup_stage = 102
		SkirmishGameMode:FixBotHeroes()
		return 0.001
	elseif setup_stage == 102 then
		if 10 > tablelength(SkirmishGameMode.heroes_replaced) then
			print("Waiting for unloaded bots")
			--return nil
			return 0.1
		else
			print("bots loaded")
			setup_stage = 2
			return 0.001
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
		local GameMode = GameRules:GetGameModeEntity() 

		SkirmishGameMode:MakeCreeps()							
		SkirmishGameMode:FixPlayers()
		GameRules:SpawnNeutralCreeps()
		GameMode:SetThink( "FixRoshan", self, "FixRoshanGlobalThink", 1 )
		SkirmishGameMode:FixRoshanStatsDrops()
		setup_stage = 4
		return 0.1

	elseif setup_stage == 4 then
		setup_stage = 5
		SkirmishGameMode:FixNeutralItems()
		SkirmishGameMode:AddThinkers()
		GameRules:GetGameModeEntity():SetDaynightCycleDisabled(false)
		GameRules:SetTimeOfDay(140)
		CustomGameEventManager:Send_ServerToAllClients("finish_hero_selection", pls)
		PauseGame(true)
		return 4
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
	if GameState["roshan"]["alive"] then
		GameMode:SetThink( "FixRoshan", self, "FixRoshanGlobalThink", 1 )
	else
		local hRosh = Entities:FindByName(nil, "npc_dota_roshan")
		hRosh:SetAbsOrigin(Vector(20000,20000))
		local time_passed = GameState["roshan"]["time_since_death"]
		local rosh_sudo_respaun = RandomInt(math.max(0, 8*60-time_passed), math.max(0, 11*60-time_passed))
		print("respawn time", rosh_sudo_respaun)
		GameMode:SetThink( "PutRoshanBack", self, "PutRoshBackTinker", rosh_sudo_respaun)
	end
end


function SkirmishGameMode:PutRoshanBack()
	local GameMode = GameRules:GetGameModeEntity()
	local hRosh = Entities:FindByName(nil, "npc_dota_roshan")
	local hRoshanSpawner = Entities:FindByName( nil, "roshan_location" )
	print("hRoshanSpawner", hRoshanSpawner)
	print(hRosh:GetAbsOrigin())
	FindClearSpaceForUnit(hRosh, hRoshanSpawner:GetAbsOrigin(), true)
	GameMode:SetThink( "FixRoshan", self, "FixRoshanGlobalThink", 1 )
	return nil
end


function SkirmishGameMode:HasUnloadedPlayer()
	--	print("Checking for unloaded players.")
--	print("Checking for unloaded players.")
	local unloaded_player = false
	for hID = 0, 9 do
		local hHero = HeroList:GetHero(hID)
		if hHero == nil then
			unloaded_player = true
	--			print("Unloaded player", hID)
--			print("Unloaded player", hID)
		end
	end
	return unloaded_player
end

function SkirmishGameMode:FixUpgrades()
	print("fixing upgrades")
	for hID = 0, 9 do
		local hHero = HeroList:GetHero(hID)
		if hHero ~= nil then
			local heroName = hHero:GetUnitName()
			local playerID = hHero:GetPlayerID()
			local hPlayer = PlayerResource:GetPlayer(playerID)
			local niceHeroName = heroName:sub(15)
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
					local hMoonShard = hHero:FindItemInInventory( "item_moon_shard" )
					ExecuteOrderFromTable( {
						UnitIndex = hHero:entindex(),
						OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
						AbilityIndex = hMoonShard:entindex(),
						TargetIndex = hHero:entindex()
					} )
				end

				local hTP = hHero:FindItemInInventory( "item_tpscroll" )
				if hTP then
					hTP:EndCooldown()
				else
					hTP = hHero:AddItemByName( "item_tpscroll" )
					if hTP then
						hTP:SetCurrentCharges( 1 )
						hTP:EndCooldown()
					end
				end
			end
		end
	end
end


function sqr(a)
	return a*a;
end


function dist2(a,b)
	return sqr(a.x-b.x) + sqr(a.y-b.y);
end


function getClosestWaypoint(cPoz, team)
	local teamName = ""
	if team == 2 then
		teamName = "goodguys"
	else
		teamName = "badguys"
	end

	local bestDist = 9999999;
	local bestWaypoint = "lane_mid_pathcorner_"..teamName.."_3";

	for _, path in pairs(waypoints[teamName]) do
		for _, waypoint in pairs(path) do
			local waypointPoz = waypointPossitions[waypoint];
			local dist = dist2(waypointPoz, cPoz);
			if dist <= bestDist then
				bestWaypoint = waypoint;
				bestDist = dist;
			end
		end
	end
	return bestWaypoint;
end

function getClosestWaypointNext(cPoz, team)
	local teamName = ""
	if team == 2 then
		teamName = "goodguys"
	else
		teamName = "badguys"
	end

	local bestDist = 9999999;
	local bestWaypoint = "lane_mid_pathcorner_"..teamName.."_3";

	for _, path in pairs(waypoints[teamName]) do
		for i=1, #path-1 do
			local waypointPoz = waypointPossitions[path[i]];
			local dist = dist2(waypointPoz, cPoz);
			if dist <= bestDist then
				bestWaypoint = path[i+1];
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
		local waypoint = Entities:FindByName ( nil, waypointName )
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
			local kill_buff = hWard:AddNewModifier(hWard,nil,"modifier_kill",{duration = 360}) 
			local ward_buff = hWard:AddNewModifier(hWard,nil,"modifier_item_buff_ward",{})
			print(kill_buff, ward_buff)
		elseif ward["type"] == "npc_dota_sentry_wards" then
			local kill_buff = hWard:AddNewModifier(hWard,nil,"modifier_kill",{duration = 420})
			local ward_buff = hWard:AddNewModifier(hWard,nil,"modifier_item_buff_ward",{})
			local sentry_buff = hWard:AddNewModifier(hWard,nil,"modifier_item_ward_true_sight",{true_sight_range=900})
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

	for hID = 0, 9 do
		local hHero = HeroList:GetHero(hID)

		if hHero ~= nil then
			local playerID = hHero:GetPlayerID()
			local hPlayer = PlayerResource:GetPlayer(playerID)

			for _, item in pairs(GameReader:GetRadiantNeutralItemsInfo() or {}) do
				print("good", item)
				NeutralItems:AddItemToStash(item, DOTA_TEAM_GOODGUYS)
			end

			for _, item in pairs(GameReader:GetDireNeutralItemsInfo() or {}) do
				print("bad", item)
				NeutralItems:AddItemToStash(item, DOTA_TEAM_BADGUYS)
			end
		end

		break
	end
end


function SkirmishGameMode:FixShard()
	-- DOES not work!
	for hID = 0, 9 do
		local hHero = HeroList:GetHero(hID)
		if hHero ~= nil then
			local heroName = hHero:GetUnitName()
			local playerID = hHero:GetPlayerID()
			local hPlayer = PlayerResource:GetPlayer(playerID)
			local niceHeroName = heroName:sub(15)
			if GameReader:GetHeroInfo(niceHeroName) ~= nil then
				local heroData = GameReader:GetHeroInfo(niceHeroName)
				GameRules:SetItemStockCount(1, heroData["team"], "itemName", playerID)
			end
		end
	end
end


function SkirmishGameMode:FixPlayers()
	print("fixing players")
	for hID = 0, 9 do
		local hHero = HeroList:GetHero(hID)
		if hHero ~= nil then
			local heroName = hHero:GetUnitName()
			local playerID = hHero:GetPlayerID()
			local hPlayer = PlayerResource:GetPlayer(playerID)
			local niceHeroName = heroName:sub(15)
			if GameReader:GetHeroInfo(niceHeroName) ~= nil then
				local heroData = GameReader:GetHeroInfo(niceHeroName)	
				if heroData["team"] == DOTA_TEAM_GOODGUYS then
					hPlayer:SpawnCourierAtPosition(Vector(-7071,-6625,128))
				elseif heroData["team"] == DOTA_TEAM_BADGUYS then
					hPlayer:SpawnCourierAtPosition(Vector(7233,6476,128))
				else
					print("invalid player team")
				end
				SkirmishGameMode:FixHero(heroData, hHero)
			end
		end
	end
end


function SkirmishGameMode:FixHero(heroData, hHero)
	if heroData["gold_reliable"] ~= nil then
		hHero:SetGold(heroData["gold_reliable"], true)
	end
	if heroData["gold_unreliable"] ~= nil then
		hHero:SetGold(heroData["gold_unreliable"], true)
	end

	FindClearSpaceForUnit(hHero, heroData["position"], true)

	for i=2, heroData["level"] do
		hHero:HeroLevelUp(false)
	end

	for i=0, 20 do
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
			local hAbility = hHero:GetAbilityByIndex(talentIndex) --starts from 0!
			local abilityEntityIndex = hAbility:GetEntityIndex()
			local newOrder = {
				UnitIndex = entityIndex, 
				OrderType = DOTA_UNIT_ORDER_TRAIN_ABILITY,
				AbilityIndex = abilityEntityIndex, 
			}
			ExecuteOrderFromTable(newOrder)
		end
	end

	for i=1, #heroData["cooldowns"] do
		local hAbility = hHero:GetAbilityByIndex(i-1) --starts from 0!
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
			GameReader:SetRoshanInfo(GameReader:GetRoshanInfo() + 1)
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
	local mins = math.floor(realTime/60)

	local hRosh = Entities:FindByName(nil, "npc_dota_roshan") --
	if hRosh ~= nil then
		print("rosh", hRosh)
		hRosh:SetPhysicalArmorBaseValue(20+mins * 0.325)
		hRosh:SetBaseDamageMax(75+6*mins)
		hRosh:SetBaseDamageMin(75+6*mins)
		hRosh:SetDeathXP(400+20*mins)

		-- TODO attack speed

		for i=0, 20 do
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
			local rng = RandomInt(0,1)
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
		local mins = math.floor(realTime/60)
		local secs = math.floor(realTime)

		local hRosh = Entities:FindByName(nil, "npc_dota_roshan")

		if hRosh ~= nil then
			local desired_max_health = 6000+mins*115

			local current_max_health = hRosh:GetMaxHealth()
			local current_health = hRosh:GetHealth()
			hRosh:SetMaxHealth(desired_max_health)
			local new_health = math.floor(current_health/current_max_health*desired_max_health) 
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


function SkirmishGameMode:RequestHeroPick(data)
	print(SkirmishGameMode.player_picked_hero)
	print(SkirmishGameMode.heroes_picked)
	print(data)
	if SkirmishGameMode.player_picked_hero[data.PlayerID] == true then
		DisplayError(data.PlayerID, "#dota_hud_error_player_picked_hero_already")
		print("Player picked hero already!")
		return
	end

	if SkirmishGameMode.heroes_picked[data.sHeroName] ~= nil then
		if SkirmishGameMode.heroes_picked[data.sHeroName] == true then
			print("Hero picked already:", data.sHeroName)
			return false
		else
			print("Pick hero:", data.sHeroName)
			SkirmishGameMode:ConfirmHeroSelection(data)
		end
	else
		print("CRITICAL ERROR: No such hero in table:", data.sHeroName)
	end

	local all_picked = true

	local maxPlayers = 5
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i=1, maxPlayers do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				local hPlayer = PlayerResource:GetPlayer(playerID)
				if hPlayer ~= nil then
					if SkirmishGameMode.player_picked_hero[playerID] == nil then
						all_picked = false
					end
				end
			end
		end
	end

	if all_picked and GameRules:State_Get() == DOTA_GAMERULES_STATE_PRE_GAME then
		GameRules:ForceGameStart()
	end
end


function SkirmishGameMode:ConfirmHeroSelection(data)
	SkirmishGameMode.player_picked_hero[data.PlayerID] = true
	SkirmishGameMode.heroes_picked[data.sHeroName] = true

	CustomGameEventManager:Send_ServerToAllClients("hero_assigned", data)

	local hero_name = "npc_dota_hero_"..data.sHeroName
	PrecacheUnitByNameAsync(hero_name, function()
		local old_hero = PlayerResource:GetSelectedHeroEntity(data.PlayerID)
		if old_hero ~= nil then
			-- TODO, make sure they do not die in some stupid way
			--new_hero:AddNewModifier(new_hero, nil, "modifier_eul_cyclone", {duration = 6})

			local spawner_name = ""
			if GameReader:GetHeroTeam(data.sHeroName) == 2 then
				spawner_name = "info_player_start_goodguys"
			else
				spawner_name = "info_player_start_badguys"
			end
			print(spawner_name)
			local spawner = Entities:FindByClassname( nil, spawner_name )
			-- FindClearSpaceForUnit
			old_hero:SetAbsOrigin(spawner:GetAbsOrigin())

			PlayerResource:SetCustomTeamAssignment(data.PlayerID, GameReader:GetHeroTeam(data.sHeroName))

			local new_hero = PlayerResource:ReplaceHeroWith(data.PlayerID, hero_name, 0, 0)
	
			SkirmishGameMode.heroes_replaced[hero_name] = true
			GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("delay_ui_creation"), function()
				if old_hero then
					UTIL_Remove(old_hero)
				end
			end, 1.0)
		else
			local hero = CreateHeroForPlayer(hero_name, PlayerResource:GetPlayer(data.PlayerID))
			SkirmishGameMode.heroes_replaced[hero_name] = true
			hero:RespawnHero(false, false)
		end
	end)
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
  end
  

function SkirmishGameMode:OnStateChange()
	print("state change", GameRules:State_Get())

	if GameRules:State_Get() == DOTA_GAMERULES_STATE_PRE_GAME then
		-- add hero names in table
		for k, v in pairs(GameReader:GetHeroesInfo()) do
			SkirmishGameMode.heroes_picked[k] = false
		end

		-- This could also be created by tracking if all player heroes spawned in the game but sometimes it doesn't init for all players because their client did not init base UI's yet
		local heroes = {}
		for hero, _ in pairs(GameReader:GetHeroesInfo()) do
			heroes[hero] = GameReader:GetHeroTeam(hero)
		end
		
		GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("delay_ui_creation"), function()
			print("Create Hero UI!")
			CustomGameEventManager:Send_ServerToAllClients("generate_hero_ui", heroes)
		end, 3.0)
	elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		SkirmishGameMode:FinishHeroSelection()
	end
end


function SkirmishGameMode:FinishHeroSelection()
	SkirmishGameMode:RandomForNoHeroSelected()
	print("finishing hero selection")
	local pls = {"pls"}
	GameRules:GetGameModeEntity():SetThink( "WaitForSetup", self, "WaitForSetupGlobalThink", 0.1 )
end


function SkirmishGameMode:AddThinkers()
	local GameMode = GameRules:GetGameModeEntity()
	-- Add thinkers
	GameMode:SetThink( "CheckWinCondition", self, "CheckWinConditionGlobalThink", 1 )
	GameMode:SetThink( "AgroFixer", self, "AgroFixerGlobalThink", getNextWaveTimeDiff())

	GameMode:SetDamageFilter(Dynamic_Wrap(self, "DamageFilterRoshan"), self)
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


function SkirmishGameMode:AddBots()
	
	for hero, hdata in pairs(GameReader:GetHeroesInfo() or {}) do
		if SkirmishGameMode.heroes_picked[hero] == false then
			if hdata["team"] == 2 then
				print(hero, 2, true)
				Tutorial:AddBot("", "", "", true)
			end
			if hdata["team"] == 3 then
				print(hero, 3, false)
				Tutorial:AddBot("", "", "", false)
			end
		else
			print(hero, " player")
		end
	end

	Tutorial:StartTutorialMode();
	GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(true)
	GameRules:GetGameModeEntity():SetBotsInLateGame(true)
	GameRules:GetGameModeEntity():SetBotsMaxPushTier(4)
	GameRules:GetGameModeEntity():SetBotThinkingEnabled(true)
end


function SkirmishGameMode:FixBotHeroes()
	local maxPlayers = 5
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i=1, maxPlayers do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				if SkirmishGameMode.player_picked_hero[playerID] == nil then
					local hPlayer = PlayerResource:GetPlayer(playerID)
					if hPlayer ~= nil then
						print("bots", teamNum, playerID, hPlayer)
						local unpicked_heros = {}
						for hero, herodata in pairs(GameReader:GetHeroesInfo()) do
							if teamNum == GameReader:GetHeroTeam(hero) and not SkirmishGameMode.heroes_picked[hero] then
								table.insert(unpicked_heros, hero)
							end

						end
						print(unpicked_heros)
						local hname = unpicked_heros[RandomInt(1, #unpicked_heros)]
						-- assign to this player
						if hname == nil then
							print("CRITICAL ERROR: invalid random hero:")
						end
						SkirmishGameMode:RequestHeroPick({PlayerID = playerID, sHeroName = hname})	
					else
						print("error")
					end
				end
			end
		end
	end
end


function SkirmishGameMode:RandomForNoHeroSelected()
	print(SkirmishGameMode.player_picked_hero)
	local maxPlayers = 5
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i=1, maxPlayers do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				if SkirmishGameMode.player_picked_hero[playerID] == nil then
					local hPlayer = PlayerResource:GetPlayer(playerID)
					if hPlayer ~= nil then
						-- get random hero
						local available_heroes = {}
						print(SkirmishGameMode.heroes_picked)
						for hname, picked  in pairs(SkirmishGameMode.heroes_picked) do
							if not picked then
								table.insert(available_heroes, hname) 
							end
						end
						print(available_heroes)
						local hname = available_heroes[RandomInt(1, #available_heroes)]
						-- assign to this player
						if hname == nil then
							print("CRITICAL ERROR: invalid random hero:")
						end
						SkirmishGameMode:RequestHeroPick({PlayerID = playerID, sHeroName = hname})
					end
				end
			end
		end
	end
end


function SkirmishGameMode:initWaypoints()
    for _, team in pairs({"goodguys", "badguys"}) do
        for _, path in pairs(waypoints[team]) do
            for _, point in pairs(path) do
                local waypoint = Entities:FindByName ( nil, point )
                local poz = waypoint:GetAbsOrigin();
				waypointPossitions[point] = poz				
            end
        end
    end
end
