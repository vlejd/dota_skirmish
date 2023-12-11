require("internal/globals")
require("internal/util")
require("game_states/game_reader")
require("internal/adv_log")
 
ALL_SCENARIOS = require("all_scenarios")

if ScenarioSelection == nil then
	ScenarioSelection = class({})
	ScenarioSelection.player_picked_scenarios = {}
	ScenarioSelection.scenarios_picked = {}
	ScenarioSelection.finished = false
	ScenarioSelection.n_players = nil
	ScenarioSelection.custom_scenario = nil
	ScenarioSelection.scenarios = {}

	for _, key in pairs(INCLUDED_SCENARIOS) do
		ScenarioSelection.scenarios[key] = ALL_SCENARIOS[key]
	end
end

function ScenarioSelection:StartScenarioSelection(fun, n_players)
	print("StartScenarioSelection")
	print(n_players)
	ScenarioSelection.n_players = n_players
	GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("generate_scenario_ui"), function()
		CustomGameEventManager:Send_ServerToAllClients("generate_scenario_ui", {screnarios = ScenarioSelection.scenarios, settings = {ALLOW_CUSTOM_SCENARIO = ALLOW_CUSTOM_SCENARIO}})
	end, 1.0)
	GameRules:GetGameModeEntity():SetThink("FinishScenarioSelection", self, "FinishScenarioSelection",
		SCENARIO_SELECTION_LENGTH)

	ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(self, "OnStateChange"), self)

	ScenarioSelection.onFinish = fun

	if false then
		ScenarioSelection:RequestScenarioPick({
			PlayerID = 0,
			scenario = 'n1_2v5',
			data = {}
		})
	end

end

function ScenarioSelection:OnStateChange()
	print("scenario selection on state change", GameRules:State_Get())
 	if GameRules:State_Get() > DOTA_GAMERULES_STATE_HERO_SELECTION and not ScenarioSelection.finished then
		print("FinishScenarioSelectionFast")
		ScenarioSelection:FinishScenarioSelectionFast()
	end
end


function ScenarioSelection:ListenToScenarioPick()
	CustomGameEventManager:RegisterListener("request_scenario_pick", Dynamic_Wrap(ScenarioSelection, "RequestScenarioPick"))
end

function ScenarioSelection:FinishScenarioSelectionFast()
	print("finishing fast")
	ScenarioSelection:FinishScenarioSelectionPrivate(true)
end

function ScenarioSelection:FinishScenarioSelection() -- slow
	print("finishing slow")
	ScenarioSelection:FinishScenarioSelectionPrivate(false)
end

function ScenarioSelection:FinishScenarioSelectionPrivate(fast)
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
			local num_players = Util:tablelength(players)
			if max_num == num_players then
				table.insert(scenraio_with_max, scenario)
			elseif max_num < num_players then
				max_num = num_players
				scenraio_with_max = {scenario}
			end
		end
	end

	print("viable scenarios", scenraio_with_max)
	local selected_scenario = Util:getRandomValueFromArray(scenraio_with_max)
	print(selected_scenario)
	ScenarioSelection:LockScenario(selected_scenario, fast)
end

function ScenarioSelection:LockScenario(selected_scenario, fast)
	if selected_scenario ~= "custom" then
		local scenario_fname = ScenarioSelection.scenarios[selected_scenario]["fname"]
		ScenarioSelection.finished = true
		GameReader:Init(scenario_fname)
		CustomGameEventManager:Send_ServerToAllClients("finish_scenario_selection", ScenarioSelection.scenarios[selected_scenario])
		ScenarioSelection.onFinish(fast)
	else
		-- TODO use ScenarioSelection.custom_scenario
		-- selected_scenario = "spirit_lgd_g4"
		-- local scenario_fname = ScenarioSelection.scenarios[selected_scenario]["fname"]
		print("CUSTOM INIT")
		print(ScenarioSelection.custom_scenario)
		ScenarioSelection.finished = true
		GameReader:InitObject(ScenarioSelection.custom_scenario)
		
		CustomGameEventManager:Send_ServerToAllClients("finish_scenario_selection", {name = "Custom"})
		ScenarioSelection.onFinish(fast)
	end

end

function FailState()
	print("Failstate")
end

function ScenarioSelection:HandleAccessCode(data)
	print("RequestScenarioPick data not nill")
	local endpoint = "get_state_by_code/"..data["data"]
	print("Senging the request to ", endpoint)
	
	function GotState(state)
		print("Got state")
		print(state)
		ScenarioSelection.custom_scenario = state
		local data = data
		data["data"] = state
		ScenarioSelection:ConfirmScenarioSelection(data)
	
		print("RequestScenarioPick here")
		print(ScenarioSelection.scenarios_picked)
	
		-- if you want voting, do this: ScenarioSelection.n_players == Util:tablelength(ScenarioSelection.player_picked_scenarios)
		if not ScenarioSelection.finished then
			print("all voted on a scenario")
			-- TODO Finish this stuff (triges)
			ScenarioSelection:FinishScenarioSelection()
		end
	end
	api:Request(endpoint, GotState, FailState)

	ScenarioSelection.custom_scenario = data["data"]
	print("ScenarioSelection.custom_scenario")
	print(ScenarioSelection.custom_scenario)
	-- TODO fix, this is not an error
	DisplayError(data.PlayerID, "#dota_hud_error_waiting")
	print("Waiting for server")
end

function ScenarioSelection:HandleJsonState(data)
	print("RequestScenarioPick data not nill")
	local obj = json.decode(data["data"])
	ScenarioSelection.custom_scenario = obj
	print("ScenarioSelection.custom_scenario")
	print(ScenarioSelection.custom_scenario)

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
		if data["data"]~= nil and Util:tablelength(data)>0 then			
			if data["data"]:sub(1,1) == "{" then
				ScenarioSelection:HandleJsonState(data)
			else
				ScenarioSelection:HandleAccessCode(data)
				return	-- important, because it is async
			end
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

	-- if you want voting, do this: ScenarioSelection.n_players == Util:tablelength(ScenarioSelection.player_picked_scenarios)
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
