
function Tormentors:OnNPCSpawned(keys)
	local spawnedUnit = EntIndexToHScript(keys.entindex)

	if spawnedUnit then
		-- Check if real tormentor spawned
		if spawnedUnit:GetUnitName() == "npc_dota_miniboss" then
			-- hide the unit
			spawnedUnit:AddNoDraw()

			-- move the unit to a far away location. Let's not move both at the same location, imagine if one of them receives damage somehow and reflect to each others till eternity.. Could be fun, or instantly crash the game
			local position = Vector(20000, 0, 0) and spawnedUnit:GetTeam() == DOTA_TEAM_GOODGUYS or Vector(-20000, 0, 0)
			spawnedUnit:SetAbsOrigin(position)

			-- UTIL_Remove(spawnedUnit) -- crashes the game
		end
	end
end

function Tormentors:OnEntityKilled(keys)
	local killedUnit = EntIndexToHScript(keys.entindex_killed)

	if killedUnit and killedUnit:GetUnitName() == "npc_dota_miniboss_custom" then
		-- increment deaths
		local tormentorTeam = killedUnit.tormentorTeam
		Tormentors:IncrementDeaths(tormentorTeam)

		GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("Tormentors:respawn"), function()
			local tormentor = CreateUnitByName("npc_dota_miniboss_custom", Tormentors.spawnLocation[tormentorTeam], true, nil, nil, DOTA_TEAM_NEUTRALS)
			tormentor.tormentorTeam = tormentorTeam

			if tormentorTeam == DOTA_TEAM_BADGUYS then
				tormentor:SetMaterialGroup("1")
			end
		end, Tormentors.reSpawnTime)
	end
end
