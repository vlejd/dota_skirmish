require("internal/adv_log")
require("internal/globals")
require("game_states/game_reader")
require("internal/util")
require("time_utils")


if GameStateRecreationFunctions == nil then
	GameStateRecreationFunctions = class({})
end

-- 		SkirmishGameMode:MakeBotsControllable()
-- initWaypoints
-- FixBuildings
-- FixOutposts
-- MakeCreeps
-- FixNeutrals
-- FixNeutralItems
-- AddThinkers ?!?!?!
-- FixFirstBlood
-- FixRunes
-- SetWinconText
-- SetGliphCooldowns

-- TODO roshan refactor
-- InitialRoshanSetup


-- ## RUNES ## --
function GameStateRecreationFunctions:FixRunes()
	print("Fixing runes")
	local gameModeEnt = GameRules:GetGameModeEntity()
	gameModeEnt:SetUseDefaultDOTARuneSpawnLogic(false)		-- true = river runes spawn at 2:00, all runes. false = required to disable runes, they start at 0:00

	local rune_state = false
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_DOUBLEDAMAGE , rune_state) --Double Damage
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_HASTE, rune_state) --Haste
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_ILLUSION, rune_state) --Illusion
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_INVISIBILITY, rune_state) --Invis
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_REGENERATION, rune_state) --Regen
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_ARCANE, rune_state) --Arcane
	gameModeEnt:SetRuneEnabled(DOTA_RUNE_BOUNTY, rune_state) --Bounty
		-- gameModeEnt:ClearRuneSpawnFilter()
		-- gameModeEnt:SetBountyRuneSpawnInterval()
		-- gameModeEnt:SetPowerRuneSpawnInterval()
		-- gameModeEnt:SetNextBountyRuneSpawnTime()
		-- gameModeEnt:SetNextRuneSpawnTime()

	gameModeEnt:SetThink("RuneSpawner", self, "RuneSpawnerGlobalThink", 0.1)
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
		local rune_names = {"item_rune_arcane", "item_rune_doubledamage", "item_rune_haste"}
		Entities:FindAllByName("dota_item_rune_spawner_powerup")

		-- spawn new runes
		local rune_options = {DOTA_RUNE_DOUBLEDAMAGE, DOTA_RUNE_HASTE, DOTA_RUNE_ILLUSION, DOTA_RUNE_INVISIBILITY,
                        DOTA_RUNE_REGENERATION, DOTA_RUNE_ARCANE}
		local power_rune_spawners = Entities:FindAllByName("dota_item_rune_spawner_powerup")
		local spawner = getRandomValueFromArray(power_rune_spawners)
		local rune_type = getRandomValueFromArray(rune_options)
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

	return 10
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