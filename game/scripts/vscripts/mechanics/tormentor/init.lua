-- particles/neutral_fx/miniboss_death.vpcf
-- particles/neutral_fx/miniboss_death_dire.vpcf

-- particles/neutral_fx/miniboss_damage_impact.vpcf
-- particles/neutral_fx/miniboss_dire_damage_impact.vpcf

-- particles/neutral_fx/miniboss_shield.vpcf
-- particles/neutral_fx/miniboss_shield_dire.vpcf

if not Tormentors then
	Tormentors = class({})

	require("mechanics/tormentor/events")

	Tormentors.spawnLocation = {}
	Tormentors.vanillaSpawnerName = {}
	Tormentors.vanillaSpawnerName[DOTA_TEAM_GOODGUYS] = "sentinel_base_radiant"
	Tormentors.vanillaSpawnerName[DOTA_TEAM_BADGUYS] = "sentinel_base_dire"
	Tormentors.deaths = {}


	Tormentors.reSpawnTime = 10*60

	ListenToGameEvent('npc_spawned', Dynamic_Wrap(Tormentors, 'OnNPCSpawned'), Tormentors)
	ListenToGameEvent('entity_killed', Dynamic_Wrap(Tormentors, 'OnEntityKilled'), Tormentors)
end

function Tormentors:Init(spawnTimes, initial_daths)
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)
	
	-- TODO get this from state
	local spawn = math.max(20*60-time.skirmishTime, 0) 
	spawnTimes = {[DOTA_TEAM_GOODGUYS]=spawn, [DOTA_TEAM_BADGUYS]=spawn} 

	-- local level = math.max(math.floor((time.skirmishTime-1200)/600), 0) 
	initial_daths = {[DOTA_TEAM_GOODGUYS]=1, [DOTA_TEAM_BADGUYS]=1}

	-- iterate from team 2 to team 3
	print(spawnTimes)
	print(initial_daths)
	for iTeam = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		local team_spawner = Entities:FindByName(nil, Tormentors.vanillaSpawnerName[iTeam])

		if team_spawner and team_spawner.GetAbsOrigin then
			Tormentors.spawnLocation[iTeam] = team_spawner:GetAbsOrigin()
			Tormentors.deaths[iTeam] = 0

			-- Set Tormentor level
			Tormentors:SetDeaths(iTeam, initial_daths[iTeam])
		end

		GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("Tormentors:spawn"), function()
			-- iterate from team 2 to team 3
			local tormentor = CreateUnitByName("npc_dota_miniboss_custom", Tormentors.spawnLocation[iTeam], true, nil, nil, DOTA_TEAM_NEUTRALS)
			tormentor.tormentorTeam = iTeam

			if iTeam == DOTA_TEAM_BADGUYS then
				tormentor:SetMaterialGroup("1")
			end
		end, spawnTimes[iTeam])

	end
end

function Tormentors:GetDeaths(iTeam)
	return Tormentors.deaths[iTeam] or 0
end

function Tormentors:SetDeaths(iTeam, iDeaths)
	Tormentors.deaths[iTeam] = iDeaths
end

function Tormentors:IncrementDeaths(iTeam)
	Tormentors.deaths[iTeam] = Tormentors.deaths[iTeam] + 1
end
