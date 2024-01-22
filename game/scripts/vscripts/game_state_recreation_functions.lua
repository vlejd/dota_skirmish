require("internal/adv_log")
require("internal/globals")
require("game_states/game_reader")
require("internal/util")
require("time_utils")


if GameStateRecreationFunctions == nil then
	GameStateRecreationFunctions = class({})
end

-- 		SkirmishGameMode:MakeBotsControllable()

-- AddThinkers ?!?!?!

-- ## BUILDINGS ## --

function GameStateRecreationFunctions:FixBuildings()
	print("fixing buildlings")

	for _, building in pairs(GameReader:GetBuildingsInfo() or {}) do
		local hBuilding = Entities:FindByName(nil, building["name"])
		if string.find(building["name"], "guys_tower1_")~=nil and TimeUtils.masterTime.skirmishStartTime > 0 then
			hBuilding:RemoveAllModifiersOfName("modifier_invulnerable")
		end
		if building["health"] ~= -1 then
			if building["health"] == 0 then
				hBuilding:Kill(nil, nil)
			else
				hBuilding:SetHealth(building["health"])
			end
		end
	end
end

-- ## OUTPOSTS ## --

function GameStateRecreationFunctions:FixOutposts()
	print("fixing outposts")

	for _, building in pairs(GameReader:GetOutpostsInfo() or {}) do
		local hBuilding = Entities:FindByName(nil, building["name"])
		hBuilding:SetTeam(building["team"])
	end
end

-- ## NEUTRAL ITEMS IN STASH ## --

function GameStateRecreationFunctions:FixNeutralItems()
	if not SKIP_COMMON_NEUTRALS then
		-- print("fixing neutral items")
		for _, item in pairs(GameReader:GetRadiantNeutralItemsInfo() or {}) do
			-- print("good", item)
			NeutralItems:AddItemToStash(item, DOTA_TEAM_GOODGUYS)
		end

		for _, item in pairs(GameReader:GetDireNeutralItemsInfo() or {}) do
			-- print("bad", item)
			NeutralItems:AddItemToStash(item, DOTA_TEAM_BADGUYS)
		end
		-- print(NeutralItems.neutral_items_in_game)
	end
end

-- ## WIN CON TEXT ## --

function GameStateRecreationFunctions:SetWinconText()
	if GameReader:GetWinCondition() ~= nil then
		if GameReader:GetWinCondition().type == "time" then
			local end_time = (
				TimeUtils.masterTime.skirmishStartTime +
				GameReader:GetWinCondition().time)
			local data = { text = "Ends at", time = end_time }
			CustomGameEventManager:Send_ServerToAllClients("set_timer_msg", data)
		elseif GameReader:GetWinCondition().type == "roshan" then
			local data = { text = "Kill Rosh" }
			CustomGameEventManager:Send_ServerToAllClients("set_timer_msg", data)
		end
	end
end

-- ## GLYPH  ## --

function GameStateRecreationFunctions:SetGlyphCooldowns()
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)

	if time.realGameTime > 5 then
		-- TODO get real glyph cooldowns
		GameRules:SetGlyphCooldown(DOTA_TEAM_GOODGUYS, 0)
		GameRules:SetGlyphCooldown(DOTA_TEAM_BADGUYS, 0)
		return nil
	else
		return 0.5
	end
end

-- ## FIRST BLOOD ## --

function GameStateRecreationFunctions:FixFirstBlood()
	local kills = 0
	for hero_name, herodata in pairs(GameReader:GetHeroesInfo()) do
		if herodata.kills then
			kills = kills + herodata.kills
		end
	end
	print("found kills", kills)
	if kills > 0 then
		print("first blood disabled")
		GameRules:SetFirstBloodActive(false)
	else
		print("first blood active")
		GameRules:SetFirstBloodActive(true)
	end
end

-- ## NEUTRAL CREEPS ## --

function GameStateRecreationFunctions:FixNeutralCreeps()
	GameRules:SpawnNeutralCreeps()
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)

	local elapsed_sec = time.skirmishTime - math.floor(time.skirmishTime/60)*60
	local next_spawn = 60-elapsed_sec
	print("offset")
	print(elapsed_sec)
	print(time.skirmishTime)
	print(next_spawn)
	GameRules:GetGameModeEntity():SetThink("RealignNeutralCreeps", self, "RealignNeutralCreepsGlobalThink", next_spawn)
	
end

function GameStateRecreationFunctions:RealignNeutralCreeps()
	GameRules:SpawnNeutralCreeps()
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)
	local elapsed_sec = time.skirmishTime - math.floor(time.skirmishTime/60)*60
	local next_spawn = 60-elapsed_sec	
	return next_spawn
end

-- ## RUNES ## --
function GameStateRecreationFunctions:FixRunes()
	print("Fixing runes")
	local gameModeEnt = GameRules:GetGameModeEntity()
	gameModeEnt:SetUseDefaultDOTARuneSpawnLogic(false) -- true = river runes spawn at 2:00, all runes. false = required to disable runes, they start at 0:00

	local rune_state = false
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_DOUBLEDAMAGE, rune_state)
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_HASTE, rune_state)
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_ILLUSION, rune_state)
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_INVISIBILITY, rune_state)
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_REGENERATION, rune_state)
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_ARCANE, rune_state)
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_BOUNTY, rune_state)
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_WATER, rune_state)
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_XP, rune_state)
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_SHIELD, rune_state)

	-- gameModeEnt:ClearRuneSpawnFilter()
	-- gameModeEnt:SetBountyRuneSpawnInterval()
	-- gameModeEnt:SetPowerRuneSpawnInterval()
	-- gameModeEnt:SetNextBountyRuneSpawnTime()
	-- gameModeEnt:SetNextRuneSpawnTime()

	gameModeEnt:SetThink("RuneSpawner", self, "RuneSpawnerGlobalThink", 0.1)

	ListenToGameEvent('dota_rune_activated_server', Dynamic_Wrap(GameStateRecreationFunctions, "OnRuneActivated"), self)
end

function GameStateRecreationFunctions:RuneSpawner()
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)
	print("rune spawner")

	if next_minute == nil then
		next_minute = math.floor(time.skirmishTime / 60) * 60 + 60
	end

	if time.skirmishTime < next_minute then
		return next_minute - time.skirmishTime
	end
	local min_num = next_minute / 60

	next_minute = next_minute + 60
	print("min_num", min_num)
	-- bounty runes every 3 minutes
	-- power runes every 2 minutes after min 4, dissapears
	-- water runes - not for now

	if min_num > 4 and min_num % 2 == 0 then
		print("spawning rune power ")
		-- kill old ones
		local runes = Entities:FindAllByClassname("dota_item_rune")
		print(#runes)
		for i = 1, #runes do
			local rune = runes[i]
			if string.find(rune:GetModelName(), "rune_goldxp") == nil then
				rune:RemoveSelf()
			end
		end
		-- CDOTA_Item_Rune
		Entities:FindAllByName("dota_item_rune_spawner_powerup")

		-- spawn new runes
		local rune_options = { DOTA_RUNE_DOUBLEDAMAGE, DOTA_RUNE_HASTE, DOTA_RUNE_ILLUSION, DOTA_RUNE_INVISIBILITY,
			DOTA_RUNE_REGENERATION, DOTA_RUNE_ARCANE, DOTA_RUNE_SHIELD }
		local power_rune_spawners = Entities:FindAllByName("dota_item_rune_spawner_powerup")
		local spawner = Util:getRandomValueFromArray(power_rune_spawners)
		local rune_type = Util:getRandomValueFromArray(rune_options)
		CreateRune(spawner:GetAbsOrigin(), rune_type)
	end

	if min_num > 2 and min_num % 3 == 0 then
		print("spawning rune bounty")
		local bounty_rune_spawners = Entities:FindAllByName("dota_item_rune_spawner_bounty")
		for i = 1, #bounty_rune_spawners do
			local spawner = bounty_rune_spawners[i]
			CreateRune(spawner:GetAbsOrigin(), DOTA_RUNE_BOUNTY)
		end
	end

	if min_num > 6 and min_num % 7 == 0 then
		print("spawning rune xp")
		local xp_rune_spawners = Entities:FindAllByName("dota_item_rune_spawner_xp")
		for i = 1, #xp_rune_spawners do
			local spawner = xp_rune_spawners[i]
			CreateRune(spawner:GetAbsOrigin(), DOTA_RUNE_XP)
		end
	end

	return 10
end

function GameStateRecreationFunctions:OnRuneActivated(keys)
	print("OnRuneActivated", keys.PlayerID, keys.rune)
	local hero = PlayerResource:GetPlayer(keys.PlayerID):GetAssignedHero()
	local time = TimeUtils:GetMasterTime(TimeUtils.masterTime)

	if keys.rune == DOTA_RUNE_XP then
		print("XP rune", time.gameTimeNegative, time.realGameTime, time.skirmishTime)
		local multiplier = 280

		local game_xp = math.max(0, math.floor(time.gameTimeNegative / (7 * 60))) * multiplier
		local desired_xp = math.floor(time.skirmishTime / (7 * 60)) * multiplier
		local xp_to_be_added = desired_xp - game_xp
		print(game_xp, desired_xp, xp_to_be_added)

		hero:AddExperience(xp_to_be_added, DOTA_ModifyXP_CreepKill, false, true)
		-- TODO: fix the message
		-- TODO: experiment with SetModifyExperienceFilter
		SendOverheadEventMessage(PlayerResource:GetPlayer(hero:GetPlayerOwnerID()), OVERHEAD_ALERT_XP, hero, xp_to_be_added, nil)
	end
end

-- ## WARDS ## --
function GameStateRecreationFunctions:FixWards()
	print("fixing wards")

	for _, ward in pairs(GameReader:GetWardsInfo() or {}) do
		-- npc_dota_observer_wards
		-- npc_dota_sentry_wards
		local hWard = CreateUnitByName(ward["type"], Util:fixPosition(ward["position"]), true, nil, nil, ward["team"])
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
