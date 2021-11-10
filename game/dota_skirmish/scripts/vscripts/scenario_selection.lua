require("internal/globals")
require("internal/util")

if ScenarioSelection == nil then
	ScenarioSelection = class({})
	ScenarioSelection.player_picked_scenarios = {}
	ScenarioSelection.scenarios_picked = {}
	ScenarioSelection.finished = false
	ScenarioSelection.scenarios = {
		spirit_lgd_g1 = {
			name = "Spirit vs LGD game 1",
			description = "",
		},
		spirit_lgd_g2 = {
			name = "Spirit vs LGD game 2",
			description = "b",
		},
		spirit_lgd_g3 = {
			name = "Spirit vs LGD game 3",
			description = "b",
		},
		spirit_lgd_g4 = {
			name = "Spirit vs LGD game 4",
			description = "b",
		},
		spirit_lgd_g5 = {
			name = "Spirit vs LGD game 5",
			description = "b",
		},
	}
end

function ScenarioSelection:StartScenarioSelection(fun)
	CustomGameEventManager:Send_ServerToAllClients("generate_scenario_ui", ScenarioSelection.scenarios)
	GameRules:GetGameModeEntity():SetThink("FinishScenarioSelection", self, "FinishScenarioSelection", SCENARIO_SELECTION_LENGTH)
	ScenarioSelection.onFinish = fun()
end

function ScenarioSelection:ListenToScenarioPick()
	CustomGameEventManager:RegisterListener("request_scenario_pick", Dynamic_Wrap(ScenarioSelection, "RequestScenarioPick"))
end

function ScenarioSelection:FinishScenarioSelection()
	print("finish")
	ScenarioSelection.finished = true

	local max_num = -1
	local scenraio_with_max = {}

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

	local pls = {"pls"}
	CustomGameEventManager:Send_ServerToAllClients("finish_scenario_selection", pls)
	ScenarioSelection.onFinish()
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

	local all_picked = true

	local maxPlayers = 5
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, maxPlayers do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				local hPlayer = PlayerResource:GetPlayer(playerID)
				if hPlayer ~= nil then
					if ScenarioSelection.player_picked_scenarios[playerID] == nil then
						all_picked = false
					end
				end
			end
		end
	end
	local time = GameRules:GetDOTATime(false, true)
	print(time)
	print(ScenarioSelection.scenarios_picked)
	if all_picked and not ScenarioSelection.finished then
		print("all voted on a scenario")
		-- TODO Finish this stuff (triges)
		ScenarioSelection:FinishScenarioSelection()
	end
end

function ScenarioSelection:ConfirmScenarioSelection(data)
	print(data)
	ScenarioSelection.player_picked_scenarios[data.PlayerID] = true
	if ScenarioSelection.scenarios_picked[data.scenario] == nil then
		ScenarioSelection.scenarios_picked[data.scenario] = {data.PlayerID} 	-- TODO player name
	else
		table.insert(ScenarioSelection.scenarios_picked[data.scenario], data.PlayerID)
	end
	-- vote_received
	-- hero_assigned
	CustomGameEventManager:Send_ServerToAllClients("vote_received", data)
end
