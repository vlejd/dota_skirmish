if Roshan == nil then
	Roshan = class({})
	Roshan.isRoshanDead = true
	Roshan.last_secs = -1
end
-- Somewhere in the game there is a thinker that sets roshan health. We need to override it.
-- Alternative is to rewrite roshan from scratch. especially bad in the new patch where roshan changes pits.

function Roshan:InitialRoshanSetup()
	local GameMode = GameRules:GetGameModeEntity()
	Roshan:FixRoshanStatsDrops()

	if GameReader:GetRoshanInfo()["alive"] then
		local hRosh = Entities:FindByName(nil, "npc_dota_roshan")
		if GameReader:GetRoshanInfo()["rosh_hp"] ~= nil then
			hRosh:SetHealth(GameReader:GetRoshanInfo()["rosh_hp"])
		end
		Roshan:FixRoshan()
		GameMode:SetThink("FixRoshan", self, "FixRoshanGlobalThink", 1)
	else
		local hRosh = Entities:FindByName(nil, "npc_dota_roshan")
		hRosh:SetAbsOrigin(Vector(20000, 20000))
		local time_passed = GameReader:GetRoshanInfo()["time_since_death"]
		local rosh_sudo_respaun = RandomInt(math.max(0, (8 * 60) - time_passed), math.max(0, (11 * 60) - time_passed))
		print("respawn time", rosh_sudo_respaun)
		GameMode:SetThink("PutRoshanBack", self, "PutRoshBackTinker", rosh_sudo_respaun)
	end

	GameRules:GetGameModeEntity():SetDamageFilter(
		Dynamic_Wrap(self, "DamageFilterRoshan"), self)

	if TRACK_ROSHAN then
		GameMode:SetThink("Tracker", self, "TrackRoshTinker", 1)
	end

end

function Roshan:FixRoshan()
	local hRosh = Entities:FindByName(nil, "npc_dota_roshan")
	if hRosh == nil then
		if Roshan.isRoshanDead then
			-- pass
			return 0.1
		else
			print("roshan just died")
			Roshan.isRoshanDead = true
			GameReader:SetRoshanInfo(GameReader:GetRoshanInfo()["deaths"] + 1)
			return 300
		end
	else
		if Roshan.isRoshanDead then
			print("roshan just respawned")
			Roshan.isRoshanDead = false
			Roshan:FixRoshanStatsDrops()
		end
		Roshan:FixRoshanHealth()
		return 0.001
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
	Roshan:FixRoshan()
	GameMode:SetThink("FixRoshan", self, "FixRoshanGlobalThink", 1)
	return nil
end

function Roshan:DamageFilterRoshan(keys)
	if keys.entindex_attacker_const and keys.entindex_victim_const then
		attacker = EntIndexToHScript(keys.entindex_attacker_const)
		victim = EntIndexToHScript(keys.entindex_victim_const)
		if victim:GetName() == "npc_dota_roshan" then
			Roshan:FixRoshanHealth()
		end
	else
		return true
	end
	return true
end

function Roshan:FixRoshanStatsDrops()
	-- TODO Roshan drops may not work properly because of the conditional drop thingy
	print("fixing roshan")
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)
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

		-- print("roshan location")
		-- print(hRosh:GetAbsOrigin()) 
		-- if hRosh:GetAbsOrigin()[0] > 0
		-- if radient side -> Aghanim's Scepter 
		-- table.insert(roshan_items, "item_ultimate_scepter_roshan")
		-- if dire side -> refresher
		-- table.insert(roshan_items, "item_refresher_shard")

		for _, itemName in pairs(roshan_items) do
			hRosh:AddItemByName(itemName)
		end

		return 0.1
	end

	return 0.1
end

function Roshan:FixRoshanHealth()
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)
	local mins = math.floor(time.skirmishTime / 60)
	local secs = math.floor(time.skirmishTime)
	local twentith = math.floor(time.skirmishTime*20)

	local hRosh = Entities:FindByName(nil, "npc_dota_roshan")

	if hRosh ~= nil then
		local desired_max_health = 6000 + mins * 115

		local current_max_health = hRosh:GetMaxHealth()
		local current_health = hRosh:GetHealth()
		hRosh:SetBaseMaxHealth(desired_max_health)
		hRosh:SetMaxHealth(desired_max_health)
		local new_health = math.floor(current_health / current_max_health * desired_max_health)
		if Roshan.last_secs ~= twentith then
			new_health = new_health + 1
		end
		hRosh:SetHealth(new_health)
		Roshan.last_secs = twentith
	end
end