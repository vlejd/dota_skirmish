require("internal/adv_log")
require("internal/globals")
require("game_states/game_reader")
require("internal/util")

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