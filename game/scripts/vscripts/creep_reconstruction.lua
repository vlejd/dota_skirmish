require("internal/adv_log")
require("internal/globals")
require("game_states/game_reader")
require("internal/util")
require("time_utils")


if CreepReconstruction == nil then
	CreepReconstruction = class({})
	CreepReconstruction.waypoints = require("waypoints")
	CreepReconstruction.waypointPossitions = {}
	CreepReconstruction.next_wave_time = nil


end


function CreepReconstruction:LaneCreepSpawner()
	-- Spawn enemy creeps for a moment on every wave spawn to fix their agro behavior
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)
	print("LaneCreepSpawner", time.skirmishTime, CreepReconstruction.next_wave_time)

	if CreepReconstruction.next_wave_time == nil then
		CreepReconstruction.next_wave_time = TimeUtils.masterTime.skirmishNextWave
	end


	if time.skirmishTime < CreepReconstruction.next_wave_time then
		print("No time yet, waiting precise", time.skirmishTime, CreepReconstruction.next_wave_time)
		return CreepReconstruction.next_wave_time - time.skirmishTime
	end

	CreepReconstruction.next_wave_time = CreepReconstruction.next_wave_time + 30

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
			if Util:tablelength(raxes[other_team]) == 0 then
				melee_upgrade = "_upgraded_mega"
				flag_upgrade = "_upgraded_mega"
				melee_upgrade = "_upgraded_mega"
				siege_upgrade = "_upgraded_mega"
			end
			 

			local what_to_spawn = {}
			Util:table_multiinsert(what_to_spawn, "npc_dota_creep_" .. team .. "guys_ranged" .. range_upgrade, num_range_creeps)
			Util:table_multiinsert(what_to_spawn, "npc_dota_creep_" .. team .. "guys_melee" .. melee_upgrade, num_melee_creeps)
			Util:table_multiinsert(what_to_spawn, "npc_dota_" .. team .. "guys_siege" .. siege_upgrade, num_siege_creeps)
			Util:table_multiinsert(what_to_spawn, "npc_dota_creep_" .. team .. "guys_flagbearer" .. flag_upgrade, num_flag_creeps)			
			
			-- TODO proper creep positions

			for _, creep_type in pairs(what_to_spawn) do
				local hCreep = CreateUnitByName(creep_type, spawner:GetAbsOrigin(), true, nil, nil, team_int)
				CreepReconstruction:scaleCreep(hCreep, creep_type)
				local waypointName = CreepReconstruction:getClosestWaypointNext(hCreep:GetAbsOrigin(), team_int)
				local waypoint = Entities:FindByName(nil, waypointName)
				hCreep:SetInitialGoalEntity(waypoint)
				hCreep:SetMustReachEachGoalEntity(true)
			end
		end
	end
	return 5

end

function string_endswith(what, suffix)
    return what:sub(-#suffix) == suffix
end


function scale_by_constants(hCreep, multiplier, hp_bonus, dmg_min, dmg_max, dmg_bonus, gold_min, gold_max, gold_bonus, xp, xp_bonus)
	local new_max_health = hCreep:GetMaxHealth() + multiplier * hp_bonus
	hCreep:SetBaseMaxHealth(new_max_health)
	hCreep:SetMaxHealth(new_max_health)
	hCreep:SetHealth(new_max_health)

	
	hCreep:SetBaseDamageMax(dmg_max + multiplier*dmg_bonus)
	hCreep:SetBaseDamageMin(dmg_min + multiplier*dmg_bonus)
	hCreep:SetMaximumGoldBounty(gold_max + multiplier*gold_bonus)
	hCreep:SetMinimumGoldBounty(gold_min + multiplier*gold_bonus)
	hCreep:SetDeathXP(xp + multiplier*xp_bonus)
end

function CreepReconstruction:scaleCreep(hCreep, creep_name)
	-- TODO conteract the game scaling
	-- TODO capp it on the mega creep values

	-- every 7*60+30
	-- Melee Creep : Gains 12 health, 1 damage, and 1 gold bounty per upgrade
	-- Super Melee Creep	Gains 19 health, 2 damage, and 1.5 gold bounty per upgrade
	-- Ranged Creep			Gains 12 health, 2 damage, 6 gold and 8 xp bounty per upgrade
	-- Super Ranged Creep		Gains 18 health, 3 damage, and 1.5 gold bounty per upgrade

	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)
	local multiplier = math.max(0, math.floor(time.skirmishTime / (7*60 + 30)))

	if string_endswith(creep_name, "melee") then
		scale_by_constants(hCreep, multiplier, 12, 19, 23, 1, 32, 38, 1, 57, 0)
	elseif string_endswith(creep_name,"melee_upgraded") then
		scale_by_constants(hCreep, multiplier, 19, 36, 44, 2, 19, 27, 1.5, 25, 0)
	elseif string_endswith(creep_name,"ranged") then
		scale_by_constants(hCreep, multiplier, 12, 21, 26, 2, 50, 56, 6, 69, 8)
	elseif string_endswith(creep_name,"ranged_upgraded") then
		scale_by_constants(hCreep, multiplier, 18, 41, 46, 3, 21, 29, 1.5, 22, 0)
	end

end


function CreepReconstruction:getClosestWaypointNext(cPoz, team)
	if CreepReconstruction.waypointPossitions == nil then
		print("CRITICAL ERROR Initialize waypoints")
	end
	local teamName = ""
	if team == 2 then
		teamName = "goodguys"
	else
		teamName = "badguys"
	end

	local bestDist = 9999999;
	local bestWaypoint = "lane_mid_pathcorner_" .. teamName .. "_3";

	for _, path in pairs(CreepReconstruction.waypoints[teamName]) do
		for i = 1, #path - 1 do
			local waypointPoz = CreepReconstruction.waypointPossitions[path[i]];
			local dist = Util:dist2(waypointPoz, cPoz);
			if dist <= bestDist then
				bestWaypoint = path[i + 1];
				bestDist = dist;
			end
		end
	end
	return bestWaypoint;
end

function CreepReconstruction:initWaypoints()
	for _, team in pairs({"goodguys", "badguys"}) do
		for _, path in pairs(CreepReconstruction.waypoints[team]) do
			for _, point in pairs(path) do
				local waypoint = Entities:FindByName(nil, point)
				local poz = waypoint:GetAbsOrigin();
				CreepReconstruction.waypointPossitions[point] = poz
			end
		end
	end
end

function CreepReconstruction:MakeCreeps()
	print("making creepes")
	for _, creepData in pairs(GameReader:GetCreepsInfo() or {}) do
		
		local skip = false
		local skip_list = {
			"npc_dota_visage_familiar", "npc_dota_broodmother_web", "npc_dota_broodmother_spiderling", 
			"npc_dota_techies_land_mine", "npc_dota_beastmaster_hawk", "npc_dota_necronomicon_archer",
			"npc_dota_furion_treant",
			"npc_dota_beastmaster_boar", "npc_dota_invoker_forged_spirit"}
			-- none of these units have the correct abilities
			-- npc_dota_beastmaster_hawk_2 breaks the game :(
			-- npc_dota_necronomicon_archer needs a number at the end _1
		for _, skip_name in pairs(skip_list) do
			local find_res = string.find(creepData["name"], skip_name) 
			if find_res ~= nil then
				skip = true
			end
		end

		if skip then
			-- TODO fix later

		else
			
			local cPoz = Util:fixPosition(creepData["position"])
			local hCreep = CreateUnitByName(creepData["name"], cPoz, true, nil, nil, creepData["team"])

			if hCreep == nil then
				print("Error, can not spawn creep")
				print(creepData)
				print(cPoz)
				print(creepData["name"])
				-- TODO continue
				goto continue;
			end


			if creepData["health"] ~= nil then
				hCreep:SetHealth(creepData["health"])
			end
			if creepData["mana"] ~= nil then
				hCreep:SetMana(creepData["mana"])
			end

			if creepData["type"] == "lane" then
				CreepReconstruction:scaleCreep(hCreep,	creepData["name"])
				hCreep:SetHealth(creepData["health"])  -- Important

				local waypointName = CreepReconstruction:getClosestWaypointNext(hCreep:GetAbsOrigin(), creepData["team"])
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
		::continue::

	end
end