require("internal/globals")
require("internal/util")
require("game_states/game_reader")
require("libraries/adv_log")

if ScenarioSelection == nil then
	ScenarioSelection = class({})
	ScenarioSelection.player_picked_scenarios = {}
	ScenarioSelection.scenarios_picked = {}
	ScenarioSelection.finished = false
	ScenarioSelection.n_players = nil
	ScenarioSelection.custom_scenario = nil
	ScenarioSelection.scenarios = {
		n1_ti_100min = {
			name = "TI LB 2022 RNG vs Entity, BO1",
			description = "Enjoy the 100th minute of Dota madness.",
			fname = "game_states/2022_ti/2022_rng_entity",
			img = "states/2022_ti/100min.png"  
		},
		n2_ti_liquid_thunder = {
			name = "TI 2022 LB Liquid vs Thunder Awaken g1",
			description = "Dire has more gold, but the chances are equal. Jump to 49:30.",
			fname = "game_states/2022_ti/liquid_thunder",
			img = "states/2022_ti/liquid_thunder.png"
		},
		-- n2_ti_liquid_ta_1 = {
		-- 	name = "TI 2022 LB Liquid vs Thunder Awaken g1",
		-- 	description = "Liquid defending against 10k advantage in 47th minute.",
		-- 	fname = "game_states/2022_ti/2022_liquid_ta",
		-- 	img = "states/2022_ti/2022_liquid_ta.png"  
		-- },
		-- n3_ti_lbf_secret_liquid_g2 = {
		-- 	name = "TI 2022 LBF Liquid vs Secret g2",
		-- 	description = "Dire won in 8 minutes. Can you? Radiants win by default in 8 min.",
		-- 	fname = "game_states/2022_ti/done_in_8_min",
		-- 	img = "states/2022_ti/done_in_8_min.png"
		-- },
		-- n4_ti_gf_secret_tundra_g2 = {
		-- 	name = "TI 2022 GF Secret vs Thundra g2",
		-- 	description = "Dire got a nice pickoff and went for highground! Dire has 6 min to win, otherwise Radiant wins by default.",
		-- 	fname = "game_states/2022_ti/secret_holds_6min_to_win",
		-- 	img = "states/2022_ti/secret_holds_6min_to_win.png"
		-- },
		--ti_gf_secret_tundra_g3 = {
		--	name = "TI 2022 GF Secret vs Thundra g3",
		--	description = "Just before the engagemet that started the end. Last chance to win TI.",
		--	fname = "game_states/2022_ti/last_chance_to_win_ti",
		--	img = "states/2022_ti/last_chance_to_win_ti.png"
		--}
	}
end

function ScenarioSelection:StartScenarioSelection(fun, n_players)
	print("StartScenarioSelection")
	print(n_players)
	ScenarioSelection.n_players = n_players
	GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("generate_scenario_ui"), function()
		CustomGameEventManager:Send_ServerToAllClients("generate_scenario_ui", ScenarioSelection.scenarios)
	end, 1.0)
	GameRules:GetGameModeEntity():SetThink("FinishScenarioSelection", self, "FinishScenarioSelection",
		SCENARIO_SELECTION_LENGTH)
	ScenarioSelection.onFinish = fun
end

function ScenarioSelection:ListenToScenarioPick()
	CustomGameEventManager:RegisterListener("request_scenario_pick", Dynamic_Wrap(ScenarioSelection, "RequestScenarioPick"))
end

function ScenarioSelection:FinishScenarioSelection()
	if ScenarioSelection.finished then
		return
	else
		ScenarioSelection.finished = true
	end
	print("finish")

	local max_num = 0
	local scenraio_with_max = {}
	for scenario, _ in pairs(ScenarioSelection.scenarios) do
		table.insert(scenraio_with_max, scenario)
	end

	for scenario, players in pairs(ScenarioSelection.scenarios_picked) do
		if scenario ~= "pass" then
			local num_players = tablelength(players)
			if max_num == num_players then
				table.insert(scenraio_with_max, scenario)
			elseif max_num < num_players then
				max_num = num_players
				scenraio_with_max = {scenario}
			end
		end
	end

	print("viable scenarios", scenraio_with_max)
	local selected_scenario = getRandomValueFromArray(scenraio_with_max)
	print(selected_scenario)
	ScenarioSelection:LockScenario(selected_scenario)
end

function ScenarioSelection:LockScenario(selected_scenario)
	if selected_scenario ~= "custom" then
		local scenario_fname = ScenarioSelection.scenarios[selected_scenario]["fname"]
		ScenarioSelection.finished = true
		GameReader:Init(scenario_fname)
		CustomGameEventManager:Send_ServerToAllClients("finish_scenario_selection", ScenarioSelection.scenarios[selected_scenario])
		ScenarioSelection.onFinish()
	else
		-- TODO use ScenarioSelection.custom_scenario
		-- selected_scenario = "spirit_lgd_g4"
		-- local scenario_fname = ScenarioSelection.scenarios[selected_scenario]["fname"]
		print("CUSTOM INIT")
		print(ScenarioSelection.custom_scenario)
		ScenarioSelection.finished = true
		GameReader:InitObject(ScenarioSelection.custom_scenario)
		
		CustomGameEventManager:Send_ServerToAllClients("finish_scenario_selection", {name = "Custom"})
		ScenarioSelection.onFinish()
	end

end

function ScenarioSelection:RequestScenarioPick(data)
	print("RequestScenarioPick")
	print(ScenarioSelection.player_picked_scenarios)
	print(ScenarioSelection.scenarios_picked)
	print("ScenarioSelection.custom_scenario")
	print(ScenarioSelection.custom_scenario)
	print(data)
	print(data["data"])
	if data.scenario == "custom" then
		print("RequestScenarioPick custom")
		if data["data"]~= nil and tablelength(data)>0 and data["data"]["game"] ~= nil then
			print("RequestScenarioPick data not nill")
			ScenarioSelection.custom_scenario = data["data"]
			print("ScenarioSelection.custom_scenario")
			print(ScenarioSelection.custom_scenario)
		else
			DisplayError(data.PlayerID, "#dota_hud_error_invalid_custom_data")
			print("Player picked scenario already!")
			return
		end
	end
	if ScenarioSelection.player_picked_scenarios[data.PlayerID] == true then
		DisplayError(data.PlayerID, "#dota_hud_error_player_picked_scenarios_already")
		print("Player picked scenario already!")
		return
	end

	ScenarioSelection:ConfirmScenarioSelection(data)

	print("RequestScenarioPick here")
	print(ScenarioSelection.scenarios_picked)
	print(ScenarioSelection.n_players, n_picked)

	-- if you want voting, do this: ScenarioSelection.n_players == tablelength(ScenarioSelection.player_picked_scenarios)
	if not ScenarioSelection.finished then
		print("all voted on a scenario")
		-- TODO Finish this stuff (triges)
		ScenarioSelection:FinishScenarioSelection()
	end
end

function ScenarioSelection:ConfirmScenarioSelection(data)
	print(data)
	ScenarioSelection.player_picked_scenarios[data.PlayerID] = true
	if ScenarioSelection.scenarios_picked[data.scenario] == nil then
		ScenarioSelection.scenarios_picked[data.scenario] = {data.PlayerID} -- TODO player name
	else
		table.insert(ScenarioSelection.scenarios_picked[data.scenario], data.PlayerID)
	end
	-- vote_received
	-- hero_assigned
	CustomGameEventManager:Send_ServerToAllClients("vote_received", data)
end
