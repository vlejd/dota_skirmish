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

// Load the game state from a file
function DeveloperActivate() {
	// If this button has already been pressed, do nothing
	if ($('#TakeoverActivateButton').BHasClass( 'inactive' ) == false) {
		$('#TakeoverActivateButton').SetHasClass("inactive", true);
		GameEvents.SendCustomGameEventToServer("game_time_selected", { message: $("#GameTime").GetChild(0).FindChild("Value").text });
		GameEvents.SendCustomGameEventToServer("takeover_activate", {});
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
	$.Msg("draw")

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
function RequestScenarioPick(scenario) {
	$.Msg("RequestScenarioPick");
	$.Msg(scenario);
	GameEvents.SendCustomGameEventToServer("request_scenario_pick", {scenario: scenario});
}

function GenerateScenarioUI(data) {
	$.Msg("GenerateScenarioUI");

	// Generate hero buttons
	for (var scenario in data) {
		$.Msg(scenario);
		$.Msg(data[scenario]);

		var parent = $.GetContextPanel().FindChildTraverse("ScenarioSelectionContainer");
	
		var scenario_button = $.CreatePanel("Panel", parent, scenario);
		scenario_button.BLoadLayoutSnippet("SelectScenarioButton");

		var label = scenario_button.FindChildrenWithClassTraverse("ScenarioSelectionLabelName")[0];
		
		label.text = $.Localize(scenario);

		(function (scenario) {
			scenario_button.SetPanelEvent("onactivate", function () {
				RequestScenarioPick(scenario);
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

// Scenario selection end

(function () {
	//Subscribe to events
	GameEvents.Subscribe( "generate_hero_ui", GenerateHeroUI );
	GameEvents.Subscribe( "activation_done", DrawHeroSelectionUI );
	GameEvents.Subscribe( "hero_assigned", HeroAssigned );
	GameEvents.Subscribe( "glyph_cooldown", GlyphUpdated );
	GameEvents.Subscribe( "scan_cooldown", ScanUpdated );
	GameEvents.Subscribe( "finish_hero_selection", FinishHeroSelection );
	//Scenario selection 
	GameEvents.Subscribe( "generate_scenario_ui", GenerateScenarioUI );
	GameEvents.Subscribe( "vote_received", ScenarioAssigned );
	
})();
