if SkirmishGameMode == nil then
	SkirmishGameMode = class({})
end

setupDone = false
setupGameTicks = 0
isRoshanDead = true
ROSHAN_SPAWN_LOC = Vector(-2787, 2357)
local waypointPossitions = {}


require("string")
local waypoints = require("waypoints")
--local GameState = require("game_state_dev")
local GameState = require("game_states/secret_elephant_group")
roshanDeaths = GameState["roshan"]["deaths"]


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
	local GameMode = GameRules:GetGameModeEntity() 
	GameMode:SetThink( "WaitForSetup", self, "WaitForSetupGlobalThink", 1 )
	GameMode:SetThink( "FixRoshan", self, "FixRoshanGlobalThink", 1 )
	GameMode:SetThink( "CheckWinCondition", self, "CheckWinConditionGlobalThink", 1 )
	--GameMode:SetThink( "SecThinker", self, "SecThinkerGlobalThink", 1)
	GameMode:SetThink( "AgroFixer", self, "AgroFixerGlobalThink", getNextWaveTimeDiff())
	GameMode:SetThink( "SetGliphOneTimeThinker", self, "SetGliphOneTimeThinkerGlobalThink", 1)

	GameMode:SetDamageFilter(Dynamic_Wrap(self, "DamageFilterRoshan"), self)
	SkirmishGameMode:init()

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


function SkirmishGameMode:CheckWinCondition()
	local gameTime = GameRules:GetDOTATime(false, false)
	if GameState["wincon"] ~= nil then
		if gameTime >= GameState["wincon"]["time"] then
			GameRules:SetGameWinner(GameState["wincon"]["default_winner"])
			return nil
		end
		return 0.1
	else
		return nil
	end
end


outposts_stage = 0
outpost = nil
outpost_capture_bots = {}

function SkirmishGameMode:SecThinker()
	local gameTime = GameRules:GetDOTATime(false, false)
	
	if gameTime > 1 and outposts_stage == 0 then
		print("###############")
		print("outpost capture")
		outposts_stage = 1
		local outpost_top = Entities:FindByName(nil, "npc_dota_watch_tower_top")
		outpost = outpost_top
		print(outpost_top)
		print(outpost_top:GetAbsOrigin())

		local hHero = CreateUnitByName("npc_dota_hero_wisp", outpost_top:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_GOODGUYS)
		table.insert(outpost_capture_bots, hHero)
		outpost_capture_bot = hHero
		print(hHero)
		return 3
	end
	if outposts_stage == 1 then
		outposts_stage = 2
		print("###############")
		print("outpost capture 2")
		print(outpost)
		print(outpost_capture_bot)
		print(ability)
		for _, outpost_capture_bot in pairs(outpost_capture_bots) do

			local ability = outpost_capture_bot:FindAbilityByName( "ability_capture" )
			ExecuteOrderFromTable( {
				UnitIndex = outpost_capture_bot:entindex(),
				OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
				AbilityIndex = ability:entindex(),
				TargetIndex = outpost:entindex()
			} )
		end
		return 10
	end
	if outposts_stage == 2 then
		for _, outpost_capture_bot in pairs(outpost_capture_bots) do
			outpost_capture_bot:ForceKill(false)
		end	
	end
	return 1
end


function DOES_NOT_WORK()
	-- outpost
	--DOTA_UNIT_ORDER_ATTACK_TARGET, 4 
	local entityIndex = hHero:GetEntityIndex()
	local newOrder = {
		UnitIndex = entityIndex, 
		OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
		TargetIndex = outpost_top:entindex(),
	}
	--Position = [-799.999939 4159.999512 256.000000
	ExecuteOrderFromTable(newOrder)
	--hHero:SetForceAttackTarget(outpost_top)
	--hHero:SetAttacking(outpost_top)
	--hHero:PerformAttack(outpost_top, true, true, true, true, true, true, true)
	outpost_capture_bot:SetForceAttackTarget(outpost)
	outpost_capture_bot:SetAttacking(outpost)
	outpost_capture_bot:PerformAttack(outpost, true, true, true, true, true, true, true)

	local entityIndex = outpost_capture_bot:GetEntityIndex()
	local newOrder = {
		UnitIndex = entityIndex, 
		OrderType = DOTA_UNIT_ORDER_MOVE_TO_POSITION,
		Position = Vector(0, 0),
	}
	--Position = [-799.999939 4159.999512 256.000000]
	--ExecuteOrderFromTable(newOrder)
end


creeps_to_kill = nil

function SkirmishGameMode:AgroFixer()
	print("AgroFixer")
	if creeps_to_kill == nil then
		print("spawning creeps!")

		creeps_to_kill = {}
		for _, lane in pairs({"bot", "mid", "top"}) do
			for _, team in pairs({"good", "bad"}) do
				local spawn_name = "lane_"..lane.."_"..team.."guys_melee_spawner" 
				print(spawn_name)
				local spawner = Entities:FindByName ( nil, spawn_name )
				print(spawner:GetAbsOrigin())
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
		print("killing creeps!")
		for _, hCreep in pairs(creeps_to_kill) do
			hCreep:ForceKill(false)
		end

		creeps_to_kill = nil
		return getNextWaveTimeDiff() + 0.1
	end
end

function getNextWaveTimeDiff()
	local time = GameRules:GetDOTATime(false, false)
	local offset = time%30
	return 30-offset
end

function SkirmishGameMode:SetGliphOneTimeThinker()
	print("SetGliphOneTimeThinker", time)
	local time = GameRules:GetDOTATime(false, false)
	if time>5 then
		print("SetGliphOneTimeThinker")
		GameRules:SetGlyphCooldown(DOTA_TEAM_GOODGUYS, 0)
		GameRules:SetGlyphCooldown(DOTA_TEAM_BADGUYS, 0)
		return nil
	else
		return 0.5
	end
end


function SkirmishGameMode:WaitForSetup()
	print("SkirmishGameMode:OnThink "..GameRules:State_Get())

	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		print( "Template addon script is running." ..  setupGameTicks )
		setupGameTicks = setupGameTicks + 1
		if not setupDone then
			SkirmishGameMode:FixUpgrades();
		end
		if setupGameTicks > 2 then
			if not setupDone then
				SkirmishGameMode:SetupGameState()
				print("setup maybe done")
				return 0.1
			else
				if setupGameTicks > 5 then
					SkirmishGameMode:initWaypoints()
					SkirmishGameMode:MakeCreeps()							
					PauseGame(true)
					return nil
				end
				return 0.1	
			end
		end
	end
	return 1
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
			if GameState["heroes"][niceHeroName] ~= nil then
				local heroData = GameState["heroes"][niceHeroName]	
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
					--hMoonShard

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

function SkirmishGameMode:SetupGameState()
	--SendToServerConsole("sv_cheats 1; host_timescale 1000;")
	--SendToServerConsole("sv_cheats 0;")

	SkirmishGameMode:FixPlayers()
	SkirmishGameMode:FixBuildings()
	SkirmishGameMode:FixNeutralItems()
	GameRules:SpawnNeutralCreeps()
	SkirmishGameMode:FixRoshanStatsDrops()
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
	for _, creepData in pairs(GameState["creeps"]) do
		local cPoz = creepData["position"]
		local hCreep = CreateUnitByName(creepData["name"], cPoz, true, nil, nil, creepData["team"])
		local waypointName = getClosestWaypointNext(hCreep:GetAbsOrigin(), creepData["team"])
		local waypoint = Entities:FindByName ( nil, waypointName )
		hCreep:SetInitialGoalEntity(waypoint)
		hCreep:SetMustReachEachGoalEntity(true)	
	end
end


function SkirmishGameMode:FixBuildings()
	print("fixing buildlings")
	for _, building in pairs(GameState["buildings"]) do
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
		if hHero~= nil then
			local playerID = hHero:GetPlayerID()
			local hPlayer = PlayerResource:GetPlayer(playerID)
			if GameState["neutrals"] ~= nil then
				for _, item in pairs(GameState["neutrals"]["good"]) do
					local cItem = CreateItem(item, hPlayer, nil)
					PlayerResource:AddNeutralItemToStash(playerID, DOTA_TEAM_GOODGUYS, cItem)
				end
				for _, item in pairs(GameState["neutrals"]["bad"]) do
					local cItem = CreateItem(item, hPlayer, nil)
					PlayerResource:AddNeutralItemToStash(playerID, DOTA_TEAM_BADGUYS, cItem)
				end
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
			if GameState["heroes"][niceHeroName] ~= nil then
				local heroData = GameState["heroes"][niceHeroName]
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
			setupDone = true  -- this is shit :(
			local heroName = hHero:GetUnitName()
			local playerID = hHero:GetPlayerID()
			local hPlayer = PlayerResource:GetPlayer(playerID)
			local niceHeroName = heroName:sub(15)
			if GameState["heroes"][niceHeroName] ~= nil then
				local heroData = GameState["heroes"][niceHeroName]	
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

	for _, item in pairs(heroData["items"]) do
		hHero:AddItemByName(item)
	end

	local entityIndex = hHero:GetEntityIndex()
	if heroData["talents"] ~= nil then
		for _, talentIndex in pairs(heroData["talents"]) do
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
			roshanDeaths = roshanDeaths + 1
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

function SkirmishGameMode:FixRoshanHealth() 
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		local gameTime = GameRules:GetDOTATime(false, false)
		local realTime = gameTime + GameState["game"]["time"]
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

function SkirmishGameMode:FixRoshanStatsDrops()
	print("fixing roshan")
	local gameTime = GameRules:GetDOTATime(false, false)
	local realTime = gameTime + GameState["game"]["time"]
	local mins = math.floor(realTime/60)

	local hRosh = Entities:FindByName(nil, "npc_dota_roshan") --
	if hRosh ~= nil then
		print("rosh", hRosh)
		hRosh:SetPhysicalArmorBaseValue(20+mins * 0.325)
		hRosh:SetBaseDamageMax(75+6*mins)
		hRosh:SetBaseDamageMin(75+6*mins)
		hRosh:SetDeathXP(400+20*mins)

		-- TODO
		--local attackSpeed = 595 + 100*mins
		--hRosh:SetBaseAttackTime(2+100*mins)

		for i=0, 20 do
			local hItem = hRosh:GetItemInSlot(i)
			if hItem ~= nil then
				hRosh:RemoveItem(hItem)
			end
		end

		local roshan_items = {"item_aegis"}
		if roshanDeaths >= 1 then
			table.insert(roshan_items, "item_cheese")
		end
		if roshanDeaths == 1 then
			table.insert(roshan_items, "item_aghanims_shard_roshan")
		end
		if roshanDeaths == 2 then
			local rng = RandomInt(0,1)
			if rng == 0 then
				table.insert(roshan_items, "item_refresher_shard")
			else
				table.insert(roshan_items, "item_ultimate_scepter_roshan")
			end
		end
		if roshanDeaths >= 3 then
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
 
function SkirmishGameMode:init()
	if IsInToolsMode() then
		print("game setup init in tool mode")
		GameRules:SetHeroSelectionTime(30)
	else --release build
		print("game setup init in release mode")
		GameRules:SetHeroSelectionTime(60)
	end
	GameRules:EnableCustomGameSetupAutoLaunch(true)
	GameRules:SetCustomGameSetupAutoLaunchDelay(0)
	GameRules:SetStrategyTime(10)
	GameRules:SetPreGameTime(0)
	GameRules:SetShowcaseTime(5)
	GameRules:SetPostGameTime(30)	
	GameRules:GetGameModeEntity():SetTowerBackdoorProtectionEnabled(true)
	GameRules:GetGameModeEntity():SetBotThinkingEnabled(true)
	--GameRules:SetCustomGameDifficulty(0)
	ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(self, "OnStateChange"), self)

  end
  

  function SkirmishGameMode:OnStateChange()
	print("state change", GameRules:State_Get())
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_STRATEGY_TIME then
		print("randoming for all unselected players")
		--SkirmishGameMode:RandomForNoHeroSelected()

		
		print("reassigning teams for players")
		SkirmishGameMode:FixTeams()
		
		print("Adding bots")
		SkirmishGameMode:AddBots()
		SkirmishGameMode:FixTeams()
	end
end

function SkirmishGameMode:AddBots()

	local playerIDs = {}
	local pickedHeros = {}
	local maxPlayers = 5
	for _, teamNum in pairs({DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS}) do
		for i=1, maxPlayers do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			playerIDs[#playerIDs+1] = playerID
		end
	end

	for _, playerID in pairs(playerIDs) do
		if PlayerResource:HasSelectedHero(playerID) then
			local hPlayer = PlayerResource:GetPlayer(playerID)
			local heroName = PlayerResource:GetSelectedHeroName(playerID)
			local niceHeroName = heroName:sub(15)
			pickedHeros[niceHeroName] = 1
		end
	end

	print("populating with bots")
	for hero, hdata in pairs(GameState["heroes"]) do
		if pickedHeros[hero] == nil then
			print(hero, " bot")
			--TODO proper AI entityscript
			--local hHero = GameRules:AddBotPlayerWithEntityScript("npc_dota_hero_"..hero, hero.." bot", hdata["team"], "", true)
			--PrecacheUnitByNameAsync(new_hero_name, function(...) end)
			--FindClearSpaceForUnit(hHero, hdata["position"], true)
			if hdata["team"] == 2 then
				print(hero, true)
				Tutorial:AddBot("", "", "", true)
			end
			if hdata["team"] == 3 then
				print(hero, false)
				Tutorial:AddBot("", "", "", false)
			end
		else
			print(hero, " player")
		end
	end
	DONTUSE_POPULATBOTS()
	SkirmishGameMode:RandomForNoHeroSelected()
end


function DONTUSE_POPULATBOTS()
	--SendToServerConsole("sv_cheats 1; dota_bot_populate")
	Tutorial:StartTutorialMode();
	GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(true)
	GameRules:GetGameModeEntity():SetBotsInLateGame(true)
	GameRules:GetGameModeEntity():SetBotsMaxPushTier(4)
	GameRules:GetGameModeEntity():SetBotThinkingEnabled(true)

end

	
function SkirmishGameMode:FixTeams()
	for team = 0, (DOTA_TEAM_COUNT-1) do
		GameRules:SetCustomGameTeamMaxPlayers(team, 10)
	end
	
	local playerIDs = {}
	local maxPlayers = 5
	for _, teamNum in pairs({DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS}) do
		for i=1, maxPlayers do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			playerIDs[#playerIDs+1] = playerID
		end
	end

	for _, playerID in pairs(playerIDs) do
		if PlayerResource:HasSelectedHero(playerID) then
			local hPlayer = PlayerResource:GetPlayer(playerID)
			local heroName = PlayerResource:GetSelectedHeroName(playerID)
			local niceHeroName = heroName:sub(15)
			local team = GameState["heroes"][niceHeroName]["team"]
			PlayerResource:SetCustomTeamAssignment(playerID, team)
		end
	end
end

function SkirmishGameMode:RandomForNoHeroSelected()
	local maxPlayers = 5
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i=1, maxPlayers do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil then
				if not PlayerResource:HasSelectedHero(playerID) then
					local hPlayer = PlayerResource:GetPlayer(playerID)
					if hPlayer ~= nil then
						hPlayer:MakeRandomHeroSelection()
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
