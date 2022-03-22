"use strict";

// Store player-selected heroes
var playerPanels = {};

/* Functionality
=========================================================================*/

// Checks if the local player has host privileges
function CheckForHostPrivileges() {
	var player_info = Game.GetLocalPlayerInfo();
	if ( !player_info ) {
		return undefined;
	} else {
		return player_info.player_has_host_privileges;
	}
}

// Draw the hero selection UI
function DrawHeroSelectionUI() {

	// Make the hero selection panel visible
//	PausedInfo.style.visibility = "collapse";
	$('#GameSetupContainer').style.visibility = 'collapse';
	$('#HeroSelectionContainer').style.visibility = 'visible';

	// Set up the possible picks
	var RadiantPicks = CustomNetTables.GetTableValue("available_heroes", "radiant_hero_list");
	var DirePicks = CustomNetTables.GetTableValue("available_heroes", "dire_hero_list");
	var PlayerCount = CustomNetTables.GetTableValue("available_heroes", "player_number");
	$.Msg(RadiantPicks)
	$.Msg(DirePicks)

	for (var j = 0; j < PlayerCount.ply_number; j++) {
		var playerInfo = Game.GetPlayerInfo( j );
		$.Msg("Player ID: " + playerInfo.player_id)
		$.Msg("Local ID: " + Players.GetLocalPlayer())
		if (playerInfo.player_id == Players.GetLocalPlayer()) {
			for (var i = 0; i < 10; i++) {
				if (playerInfo.player_team_id == 2) {
					$.Msg("Creating Radiant hero panel...")
					playerPanels[i] = Object.keys(RadiantPicks)[i];
					$('#HeroSelectionPanel').FindChildTraverse(i).heroname = playerPanels[i]
					$('#HeroSelectionPanel').FindChildTraverse(i).style.visibility = "visible";
				}
				else if (playerInfo.player_team_id == 3) {
					$.Msg("Creating Dire hero panel...")
					playerPanels[i] = Object.keys(DirePicks)[i];
					$.Msg(playerPanels[i])
					$('#HeroSelectionPanel').FindChildTraverse(i).heroname = playerPanels[i]
					$('#HeroSelectionPanel').FindChildTraverse(i).style.visibility = "visible";
				}
			}
		}
	}
}

// Request a hero pick. Asks the server if it is available first.
function RequestHeroPick(sHeroName) {
	GameEvents.SendCustomGameEventToServer("request_hero_pick", {sHeroName: sHeroName});
}

// Grays out hero pick buttons, as appropriate
function HeroAssigned(data) {
	var panel = $("#HeroSelectionPanel").FindChildTraverse(data.sHeroName);

//	$.Msg(panel);
	if (panel) {
		var image = panel.FindChildrenWithClassTraverse("HeroSelectionPip")[0];
		var label = panel.FindChildrenWithClassTraverse("HeroSelectionLabel")[0];

		if (image)
			image.AddClass('unavailable');

		if (label)
			ShowPlayerName(label, data.PlayerID);
	}
}

// Unhides and updates player name in the hero selection screen 
function ShowPlayerName(panel, playerID) {
	$.Msg(playerID);
	panel.text = Players.GetPlayerName(playerID);
	
	var is_host = CheckForHostPrivileges();
	if (is_host)
		panel.style.color = 'red';
}

// End hero selection
function FinishHeroSelection(pls) {
	$.GetContextPanel().style.opacity = 0;
}

// Update the glyph button's cooldown
function GlyphUpdated(glyphDegrees) {
	var rootPanel = $('#DevConsolePanel').GetParent().GetParent().GetParent().GetParent()
	var glyphButton = rootPanel.FindChildTraverse('GlyphButton')
	var cooldownOverlay = rootPanel.FindChildTraverse('GlyphCooldown')

	// If the cooldown is at zero, make the button available
	if (glyphDegrees <= 0) {
		glyphButton.RemoveClass('CoolingDown')
		cooldownOverlay.style.clip = 'radial( 50%, 50%, 0.0deg, 0.0deg)';
	} else {
		glyphButton.AddClass('CoolingDown')
		cooldownOverlay.style.clip = 'radial( 50%, 50%, 0.0deg, ' + glyphDegrees + 'deg)';
	}
}

// Update the scan button's cooldown
function ScanUpdated(scanDegrees) {

}

function SetSliderPosition( sliderName, value) {
	var slider = $( "#" + sliderName );
	slider.GetChild(1).value = 0;
	var sliderMinValue = parseInt(slider.GetChild(0).FindChild("Value").text);

	slider.GetChild(1).value = 1;
	var sliderMaxValue = parseInt(slider.GetChild(0).FindChild("Value").text);

	slider.GetChild(1).value = (value - sliderMinValue) / (sliderMaxValue - sliderMinValue);
}

function GenerateHeroUI(data) {
	$('#LoadingPanel').style.visibility = 'collapse';
	$('#LoadingPanel').style.opacity = 0;	
	$.Msg("GenerateHeroUI")


	var index = 0;

	// Generate hero buttons
	for (var hero in data) {
		var hero_name = "npc_dota_hero_" + hero;
		var parent = $.GetContextPanel().FindChildTraverse("HeroSelectionRow1");
	
		if (data[hero] == 3)
			parent = $.GetContextPanel().FindChildTraverse("HeroSelectionRow2");

		var hero_button = $.CreatePanel("Panel", parent, hero);
		hero_button.BLoadLayoutSnippet("SelectHeroButton");

		var label = hero_button.FindChildrenWithClassTraverse("HeroSelectionLabel")[0];
		var image = hero_button.FindChildrenWithClassTraverse("HeroSelectionPip")[0];

		label.text = $.Localize(hero_name);
		image.heroname = hero_name;

		(function (hero) {
			hero_button.SetPanelEvent("onactivate", function () {
				RequestHeroPick(hero);
			})
		})(hero);

		index++;
	}
}

// Scenario selection
function RequestScenarioPick(scenario, data) {
	$.Msg("RequestScenarioPick");
	$.Msg(scenario);
	GameEvents.SendCustomGameEventToServer("request_scenario_pick", {scenario: scenario, data:data});
}

function UpdateState(){
	const TEXT_FIELD = $("#CustomScenario");
	$.Msg("UpdateState");
	$.Msg(TEXT_FIELD.text.length);
	const text_raw = TEXT_FIELD.text;
	const text_rep = text_raw.replace("=",":")
	const obj = JSON.parse(text_rep);
	$.Msg(text_raw);
	$.Msg(text_rep);
	$.Msg(obj);
}

function GenerateScenarioUI(data) {
	$.Msg("GenerateScenarioUI");
	//$('#HeroSelectionContainerWrapper').style.visibility = 'collapse';
	// LoadingPanel
	$('#HeroSelectionTitleLoading').text = "Select scenario";

	// Generate hero buttons
	var sorted = [];
	for(var key in data) {
		sorted[sorted.length] = key;
	}
	sorted.sort()
	for (var i=0; i<sorted.length; i++) {
		var scenario = sorted[i];
		$.Msg(scenario);
		$.Msg(data[scenario]);

		var parent = $.GetContextPanel().FindChildTraverse("ScenarioSelectionContainer");
	
		var scenario_button = $.CreatePanel("Panel", parent, scenario);
		scenario_button.BLoadLayoutSnippet("SelectScenarioButton");

		var label = scenario_button.FindChildrenWithClassTraverse("ScenarioSelectionLabelName")[0];
		
		label.text = $.Localize(data[scenario]["name"]);

		(function (scenario) {
			scenario_button.SetPanelEvent("onmouseover", function () {
				$.Msg("hover");
				$.Msg(scenario);
				$.Msg(data);
				$.Msg(data[scenario].img);
				$('#ScenarioImg').SetImage("file://{resources}/imgs/"+data[scenario].img);
				$('#ScenarioDescriptionTxt').text = data[scenario].description;
			})
		})(scenario);

		(function (scenario) {
			scenario_button.SetPanelEvent("onactivate", function () {
				RequestScenarioPick(scenario, {});
			})
		})(scenario);

	}

	var parent = $.GetContextPanel().FindChildTraverse("ScenarioSelectionContainer");
	
	var scenario = "pass"
	var scenario_button = $.CreatePanel("Panel", parent, scenario);
	scenario_button.BLoadLayoutSnippet("SelectScenarioButton");

	var label = scenario_button.FindChildrenWithClassTraverse("ScenarioSelectionLabelName")[0];
	
	label.text = $.Localize(scenario);

	(function (scenario) {
		scenario_button.SetPanelEvent("onmouseover", function () {
			$.Msg("hover");
			$.Msg(scenario);
			$.Msg(data);
			var img = "placeholder"
			$.Msg(img);
			$('#ScenarioImg').SetImage("file://{resources}/imgs/"+img);
			$('#ScenarioDescriptionTxt').text = "pass on scenario voting";
		})
	})(scenario);

	(function (scenario) {
		scenario_button.SetPanelEvent("onactivate", function () {
			RequestScenarioPick(scenario, {});
		})
	})(scenario);

	if(true){
		var scenario = "custom"
		var scenario_button = $.CreatePanel("Panel", parent, scenario);
		scenario_button.BLoadLayoutSnippet("SelectScenarioButton");
	
		var label = scenario_button.FindChildrenWithClassTraverse("ScenarioSelectionLabelName")[0];
		
		label.text = $.Localize(scenario);
	
		(function (scenario) {
			scenario_button.SetPanelEvent("onmouseover", function () {
				$.Msg("hover");
				$.Msg(scenario);
				$.Msg(data);
				var img = "placeholder"
				$.Msg(img);
				$('#ScenarioImg').SetImage("file://{resources}/imgs/"+img);
				$('#ScenarioDescriptionTxt').text = "custom scenario";
			})
		})(scenario);
	
		(function (scenario) {
			scenario_button.SetPanelEvent("onactivate", function () {
				const TEXT_FIELD = $("#CustomScenario");
				$.Msg("UpdateState");
				$.Msg(TEXT_FIELD.text.length);
				if(TEXT_FIELD.text.length == 0){
				} else {
					const text_raw = TEXT_FIELD.text;
					const obj = JSON.parse(text_raw);
					$.Msg(text_raw);
					$.Msg(obj);
					RequestScenarioPick(scenario, obj);
				}
			})
		})(scenario);
	}

	

}

function ScenarioAssigned(data) {
	$.Msg("ScenarioAssigned");
	$.Msg(data);

	var panel = $("#ScenarioSelectionContainer").FindChildTraverse(data.scenario);

//	$.Msg(panel);
	if (panel) {
		var label = panel.FindChildrenWithClassTraverse("ScenarioSelectionLabelPlayer")[0];

		if (label)
		AddPlayerName(label, data.PlayerID);
	}
}

function AddPlayerName(panel, playerID) {
	$.Msg(playerID);
	if (panel.text == "") {
		panel.text = Players.GetPlayerName(playerID);
	} else {
		panel.text = panel.text + " | "+  Players.GetPlayerName(playerID);
	}  
}

function FinishScenratioSelection(data) {
	$.Msg("FinishScenratioSelection");
	$.Msg(data);
	$('#ScenarioSelectionContainerWrapper').style.visibility = 'collapse';
	$('#ScenarioSelectionContainerWrapper').style.opacity = 0;	
	$('#ScenarioDescriptionName').text = data.name;	
}
// Scenario selection end

(function () {
	//Subscribe to events
	$.Msg("hero_selection subscribe");

	GameEvents.Subscribe( "generate_hero_ui", GenerateHeroUI );
	GameEvents.Subscribe( "activation_done", DrawHeroSelectionUI );
	GameEvents.Subscribe( "hero_assigned", HeroAssigned );
	GameEvents.Subscribe( "glyph_cooldown", GlyphUpdated );
	GameEvents.Subscribe( "scan_cooldown", ScanUpdated );
	GameEvents.Subscribe( "finish_hero_selection", FinishHeroSelection );
	//Scenario selection 
	GameEvents.Subscribe( "generate_scenario_ui", GenerateScenarioUI );
	GameEvents.Subscribe( "vote_received", ScenarioAssigned );
	GameEvents.Subscribe( "finish_scenario_selection", FinishScenratioSelection );
	
})();
