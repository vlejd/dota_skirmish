if Tormentor == nil then
	Tormentor = class({})
	Tormentor.isTormentorDead = true
	Tormentor.spawner_possitions = {}
	Tormentor.kills = {}
	-- spawners are: [8128.000000 1024.000000 256.000000] and  [-8128.000000 -1216.000000 256.000061]

end


-- the game spawns the tormentor at min 20. maybe I could remove the tinker? 
-- My tormentor does not influence the tormentor scaling
-- the animation of the portal as rather strange... 
-- there is only one tormentor class the effect is somehow contorlled by the surroundings.

-- add name to my tormentor
-- check every tik for a game tormentor. if there is one, hide it 
-- add ondeath modifier that spawns another one. 
-- add tormentor scaling eventually. TODO
--  there is some strange bug with the particles. they are at 0,0... TODO


function Tormentor:InitialTormentorSetup()
	print("InitialTormentorSetup")
	local GameMode = GameRules:GetGameModeEntity()
	local spawners = Entities:FindAllByClassname("npc_dota_miniboss_spawner")

	for id, spawner in pairs(spawners) do
		print(id, type(id))
		local name = "tormentor"..tostring(id)
		Tormentor.spawner_possitions[name] = spawner:GetAbsOrigin()
		spawner:SetAbsOrigin(Vector(-20000, -20000))
		Tormentor.kills[name] = 0
	end

	print("Tormentor.spawner_possitions")
	print(Tormentor.spawner_possitions)

	for spawner_id, spawner_poz in pairs(Tormentor.spawner_possitions) do
		Tormentor:spawnTormentor(spawner_id)
	end

	ListenToGameEvent("entity_killed", Dynamic_Wrap(self, "TormentorKillListener"), self)

end


function Tormentor:spawnTormentor(tormentor_name)
	local spawner_poz = Tormentor.spawner_possitions[tormentor_name]
	print("tormentor", spawner_poz)
	local hTormentor = CreateUnitByName("npc_dota_miniboss", spawner_poz, false, nil, nil, DOTA_TEAM_NEUTRALS)
	hTormentor:SetEntityName(tormentor_name)
	hTormentor:SetMaxHealth(1000)


	-- stuff that does not work
	--	local ability = hTormentor:GetAbilityByIndex(0)
	-- ability:IncrementModifierRefCount()
	-- ability:UpgradeAbility(true)
	-- ability:SetCurrentAbilityCharges(2)

	return hTormentor
	-- change the ability
end

function Tormentor:TormentorKillListener(event)
	local killed_entity = EntIndexToHScript(event.entindex_killed)
	if killed_entity:GetClassname() == 'npc_dota_miniboss' then
		print("Tormentor killed")
		local name = killed_entity:GetName()
		Tormentor.kills[name] = Tormentor.kills[name] + 1  -- TODO add scaling somehow

		function tmp()
			local t = Tormentor:spawnTormentor(name)
		end

		GameRules:GetGameModeEntity():SetThink(tmp, self, "TormentorSpawnThinker", 10*60)
	end
end

