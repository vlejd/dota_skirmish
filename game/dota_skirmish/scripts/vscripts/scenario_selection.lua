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
	ScenarioSelection.scenarios = {
		spirit_lgd_g1 = {
			name = "game 1",
			description = "Balanced game.",
			fname = "game_states/spirit_lgd_g1",
			img = "game_1.png"
		},
		spirit_lgd_g2 = {
			name = "game 2",
			description = "Balanced game.",
			fname = "game_states/spirit_lgd_g2",
			img = "game_2.png"
		},
		spirit_lgd_g3 = {
			name = "game 3",
			description = "Balanced game.",
			fname = "game_states/spirit_lgd_g3",
			img = "game_3.png"
		},
		spirit_lgd_g4 = {
			name = "game 4",
			description = "Radiant is winning heavily. But they only have 6 minutes to finish the game. Otherwise Dire wins.",
			fname = "game_states/spirit_lgd_g4",
			img = "game_4.png"
		},
		spirit_lgd_g5 = {
			name = "game 5",
			description = "Balanced game.",
			fname = "game_states/spirit_lgd_g5",
			img = "game_5.png"
		}
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
		local num_players = tablelength(players)
		if max_num == num_players then
			table.insert(scenraio_with_max, scenario)
		elseif max_num < num_players then
			max_num = num_players
			scenraio_with_max = {scenario}
		end
	end

	print("viable scenarios", scenraio_with_max)
	local selected_scenario = getRandomValueFromArray(scenraio_with_max)
	print(selected_scenario)

	local scenario_fname = ScenarioSelection.scenarios[selected_scenario]["fname"]
	GameReader:Init(scenario_fname)
	ScenarioSelection.onFinish()
	CustomGameEventManager:Send_ServerToAllClients("finish_scenario_selection",
		ScenarioSelection.scenarios[selected_scenario])
end

function ScenarioSelection:RequestScenarioPick(data)
	print(ScenarioSelection.player_picked_scenarios)
	print(ScenarioSelection.scenarios_picked)
	print(data)
	if ScenarioSelection.player_picked_scenarios[data.PlayerID] == true then
		DisplayError(data.PlayerID, "#dota_hud_error_player_picked_scenarios_already")
		print("Player picked scenario already!")
		return
	end

	ScenarioSelection:ConfirmScenarioSelection(data)

	print("RequestScenarioPick here")
	print(ScenarioSelection.scenarios_picked)
	print(ScenarioSelection.n_players, n_picked)

	if ScenarioSelection.n_players == tablelength(ScenarioSelection.player_picked_scenarios) and
		not ScenarioSelection.finished then
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
