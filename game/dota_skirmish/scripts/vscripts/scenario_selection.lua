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
		--spirit_lgd_g1 = {
		--	name = "game 0",
		--	description = "json.",
		--	fname = "game_states/from_json",
		--	img = "game_1.png"
		--},
		spirit_lgd_g1 = {
			name = "game 1",
		 	description = "29th minute of a balanced game 1 from finals. Try to win.",
		 	fname = "game_states/spirit_lgd_g1",
		 	img = "game_1.png"
		},
		spirit_lgd_g2 = {
			name = "game 2",
			description = "20th minute of a balanced game 2 from finals. Can shard win you the game?",
			fname = "game_states/spirit_lgd_g2",
			img = "game_2.png"
		},
		spirit_lgd_g3 = {
			name = "game 3",
			description = "26th minute of a balanced game 3 from finals. Could it have been 3:0?",
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
			description = "20th minute of a balanced game 5 from finals. Decide the international.",
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
		ScenarioSelection.onFinish()
		CustomGameEventManager:Send_ServerToAllClients("finish_scenario_selection",
			ScenarioSelection.scenarios[selected_scenario])
	else
		-- TODO use ScenarioSelection.custom_scenario
		-- selected_scenario = "spirit_lgd_g4"
		-- local scenario_fname = ScenarioSelection.scenarios[selected_scenario]["fname"]
		ScenarioSelection.finished = true
		GameReader:InitObject(ScenarioSelection.custom_scenario)
		ScenarioSelection.onFinish()

		CustomGameEventManager:Send_ServerToAllClients("finish_scenario_selection", {name = "Custom"})
	end

end

function ScenarioSelection:RequestScenarioPick(data)
	print("RequestScenarioPick")
	print(ScenarioSelection.player_picked_scenarios)
	print(ScenarioSelection.scenarios_picked)
	print(data)
	if data["data"]~= nil and tablelength(data)>0 then
		ScenarioSelection.custom_scenario = data["data"]
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
