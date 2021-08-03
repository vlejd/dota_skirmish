function CAddonTemplateGameMode:FixRoshanCustom()
	local defaultRosh = Entities:FindByName(nil, "npc_dota_roshan")
	if defaultRosh ~= nil then
		--defaultRosh:RemoveAllItemDrops()
		defaultRosh:SetAbsOrigin(Vector(10000,10000))
		--npc_dota_roshan
		ROSHAN_SPAWN_LOC = Entities:FindByClassname(nil, "npc_dota_roshan_spawner"):GetAbsOrigin()
		local hRosh = CreateUnitByName("npc_dota_roshan_custom", ROSHAN_SPAWN_LOC, true, nil, nil, DOTA_TEAM_NEUTRALS)
		hRosh:AddNewModifier(hRosh, nil, "modifier_imba_roshan_ai", {})
		local gameTime = GameRules:GetGameTime()
		local realTime = gameTime + GameState["game"]["time"]
		local mins = math.floor(realTime/60)

		local desired_max_health = 6000+mins*115
		
		hRosh:SetMaxHealth(desired_max_health)
		hRosh:SetHealth(desired_max_health)
		-- TODO fix rescaling?
		return nil
	else 
		return 1
	end
end