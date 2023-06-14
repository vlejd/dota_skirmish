if Roshan == nil then
	Roshan = class({})
	Roshan.isRoshanDead = true
	Roshan.last_secs = -1
	ListenToGameEvent('npc_spawned', Dynamic_Wrap(Roshan, 'OnNPCSpawned'), Roshan)
	ListenToGameEvent("entity_killed", Dynamic_Wrap(Roshan, "OnEntityKilled"), Roshan)
	print("Roshan setup")

end

function Roshan:InitialRoshanSetup()
	print("InitialRoshanSetup")
	local GameMode = GameRules:GetGameModeEntity()
	--Roshan:FixRoshanStatsDrops()

	if GameReader:GetRoshanInfo()["alive"] then
		local hRosh = Entities:FindByName(nil, "npc_dota_roshan")
		hRosh:SetInitialGoalEntity(nil)
		Roshan:PutRoshanBack()

		if GameReader:GetRoshanInfo()["rosh_hp"] ~= nil then
			hRosh:SetHealth(GameReader:GetRoshanInfo()["rosh_hp"])
		end
	else
		local hRosh = Entities:FindByName(nil, "npc_dota_roshan")
		hRosh:SetAbsOrigin(Vector(20000, 20000))
		local time_passed = GameReader:GetRoshanInfo()["time_since_death"]
		local rosh_sudo_respaun = RandomInt(math.max(0, (8 * 60) - time_passed), math.max(0, (11 * 60) - time_passed))
		print("respawn time", rosh_sudo_respaun)
		GameMode:SetThink("PutRoshanBack", self, "PutRoshBackTinker", rosh_sudo_respaun)
	end

	if TRACK_ROSHAN then
		GameMode:SetThink("Tracker", self, "TrackRoshTinker", 1)
	end

	--GameMode:SetThink("FixRoshanDrops", self, "FixRoshanDropsTinker", 0.1)

end


function Roshan:OnEntityKilled(keys)
	if keys == nil then
		return
	end
	local spawnedUnit = EntIndexToHScript(keys.entindex_killed)
	if spawnedUnit then
		if spawnedUnit:GetClassname() == "npc_dota_roshan" then
			GameReader:SetRoshanInfo(GameReader:GetRoshanInfo()["deaths"] + 1)
			print("Roshan died")
			print(GameReader:GetWinCondition())
			if GameReader:GetWinCondition() ~= nil then
				if GameReader:GetWinCondition().type == "roshan" then
					if keys.entindex_attacker ~= nil then
						hAttacker = EntIndexToHScript(keys.entindex_attacker)
						if hAttacker:GetTeam() == DOTA_TEAM_GOODGUYS or hAttacker:GetTeam() == DOTA_TEAM_BADGUYS then
							GameRules:ForceGameStart()
							GameRules:SetGameWinner(hAttacker:GetTeam())
						else
							print("Rosh killed by unexpected team")
						end
					else
						print("Rosh killed by unexpected entity")
					end
				end
			end
		end
	end
end


function Roshan:OnNPCSpawned(keys)
	if keys == nil then
		return
	end

	local spawnedUnit = EntIndexToHScript(keys.entindex)

	if spawnedUnit then
		if spawnedUnit:GetClassname() == "npc_dota_roshan" then
			Roshan:FixAbilities(spawnedUnit)
			Roshan:FixRoshanDrops()
		end
	end
end


function Roshan:FixAbilities(rosh)
	if rosh:GetClassname() == "npc_dota_roshan" then
		-- remove the default roshan abilities (bonus health and damage over time)
		if rosh:HasAbility("roshan_inherent_buffs") then
			rosh:RemoveAbility("roshan_inherent_buffs")
			rosh:AddAbility("roshan_inherent_buffs_custom")
		end

		-- remove the default roshan abilities (bonus armor over time)
		if rosh:HasAbility("roshan_devotion") then
			rosh:RemoveAbility("roshan_devotion")
		end
	end
end

function Roshan:Tracker()
	local hRosh = Entities:FindByName(nil, "npc_dota_roshan")
	if hRosh ~= nil then
		print("Rosh position", hRosh:GetAbsOrigin())
	end
	return 1
end

function Roshan:PutRoshanBack()
	local GameMode = GameRules:GetGameModeEntity()
	local hRosh = Entities:FindByName(nil, "npc_dota_roshan")

	-- local hRoshanSpawner = Entities:FindByName(nil, "roshan_location")  -- npc_dota_roshan_spawner
	-- roshan_location = hRoshanSpawner:GetAbsOrigin()
	local roshan_location = nil
	if GameRules:IsDaytime() then
		roshan_location = Vector(7872, -7808)
	else
		roshan_location = Vector(-7808, 7680)
	end
	print("hRoshanSpawner", hRoshanSpawner)
	print(roshan_location)
	print(hRosh:GetAbsOrigin())
	FindClearSpaceForUnit(hRosh, roshan_location, true)
	return nil
end


function Roshan:FixRoshanDrops()
	-- TODO Roshan drops may not work properly because of the conditional drop thingy
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)
	local mins = math.floor(time.skirmishTime / 60)

	local hRosh = Entities:FindByName(nil, "npc_dota_roshan") --
	if hRosh ~= nil then
		print("rosh", hRosh)

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
		if GameReader:GetRoshanDeaths() >= 2 then
			if GameRules:IsDaytime() then
				table.insert(roshan_items, "item_ultimate_scepter_roshan")
			else
				table.insert(roshan_items, "item_refresher_shard")
			end
		end
	
		for _, itemName in pairs(roshan_items) do
			hRosh:AddItemByName(itemName)
		end

		return 0.1
	end

	return 1
end