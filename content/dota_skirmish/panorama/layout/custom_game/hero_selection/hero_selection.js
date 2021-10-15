"use strict";

// Store player-selected heroes
var playerPanels = {};
var PausedInfo = $.GetContextPanel().GetParent().GetParent().GetParent().FindChildTraverse("PausedContainer")

/* Event Handlers
=========================================================================*/

// A hero was assigned to a player
function OnHeroAssigned( data ) {
	HeroAssigned( data.PlayerID, data.HeroName, data.FreedHero);
}

// The Glyph button needs to be updated
function OnGlyphUpdate( data ) {
	GlyphUpdated( data.glyphDegrees);
}

// The Scan button needs to be updated
function OnScanUpdate( data ) {
	ScanUpdated( data.scanDegrees);
}

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

function DrawGameSetupUI() {
	PausedInfo.style.visibility = "collapse";
	$('#GameSetupContainer').style.visibility = 'visible';
	SetSliderPosition("GameTime", 10)
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
function RequestHeroPick(hero_name) {
	GameEvents.SendCustomGameEventToServer("request_hero_pick", {HeroName: hero_name});
}

// Grays out hero pick buttons, as appropriate
function HeroAssigned(playerID, heroName, freedHero) {

	// If this is the local player, make the selected panel fancy
	if (playerID == Players.GetLocalPlayer()) {
		for (var i = 0; i < 10; i++) {

			// If this is the selected panel, make it show the "selected" class
			if (playerPanels[i] == heroName) {
				$("#HeroSelectionPanel").FindChildTraverse(i).AddClass('selected')
				ShowPlayerName($("#HeroSelectionPanel").FindChildTraverse("player" + i), playerID)
			} else {
				$("#HeroSelectionPanel").FindChildTraverse(i).RemoveClass('selected')
			}
		}
	// Else, make only the selected panel unavailable
	} else {
		for (var i = 0; i < 10; i++) {

			// If this is the selected panel, make it show the "unavailable" class
			if (playerPanels[i] == heroName) {
				$("#HeroSelectionPanel").FindChildTraverse(i).AddClass('unavailable')
				ShowPlayerName($("#HeroSelectionPanel").FindChildTraverse("player" + i), playerID)
			}
		}
	}

	// If this hero was freed, make it available again
	for (var i = 0; i < 10; i++) {
		if (playerPanels[i] == freedHero) {
			$("#HeroSelectionPanel").FindChildTraverse(i).RemoveClass('unavailable')
			$("#HeroSelectionPanel").FindChildTraverse("player" + i).style.opacity = 0.0;
		}
	}
}

// Unhides and updates player name in the hero selection screen 
function ShowPlayerName(panel, playerID) {
	panel.style.opacity = 1.0;
	panel.text = Players.GetPlayerName(playerID)

	var is_host = CheckForHostPrivileges();
	if (is_host) {
		panel.style.color = 'red';
	}
}

// End hero selection
function ConfirmHeroSelection() {

	// If this button has already been pressed, do nothing
	if ($("#ConfirmHeroSelectionButton").BHasClass( 'disabled' ) == false) {

		// Deactivate the button
		$("#ConfirmHeroSelectionButton").AddClass( 'disabled' )

		// Deactivate all hero selection buttons, except the chosen one
		for (var i = 0; i < 10; i++) {
			if ($("#HeroSelectionPanel").FindChildTraverse(i).BHasClass( "selected" ) == false) {
				$("#HeroSelectionPanel").FindChildTraverse(i).AddClass('unavailable')
			}
		}

		// Send the hero selection phase end event to the server
		GameEvents.SendCustomGameEventToServer( "finish_hero_selection", {} );
	}
}

// Begin the game
function OnGameStart() {

	// Remove selected/unavailable classes from all hero pick panels
	for (var i = 0; i < 10; i++) {
		$("#HeroSelectionPanel").FindChildTraverse(i).RemoveClass('selected')
		$("#HeroSelectionPanel").FindChildTraverse(i).RemoveClass('unavailable')
		$("#HeroSelectionPanel").FindChildTraverse("player" + i).style.opacity = 0.0;
	}

	// Reactivate the confirm hero button
	$("#ConfirmHeroSelectionButton").RemoveClass( 'disabled' )
	PausedInfo.style.visibility = "visible";

	// Make the hero selection panel invisible
	$('#HeroSelectionContainer').style.visibility = 'collapse';

	$('#TakeoverActivateButton').RemoveClass("inactive")
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

function SetSliderPosition( sliderName, value)
{
	var slider = $( "#" + sliderName );
	slider.GetChild(1).value = 0;
	var sliderMinValue = parseInt(slider.GetChild(0).FindChild("Value").text);

	slider.GetChild(1).value = 1;
	var sliderMaxValue = parseInt(slider.GetChild(0).FindChild("Value").text);

	slider.GetChild(1).value = (value - sliderMinValue) / (sliderMaxValue - sliderMinValue);
}

function GenerateHeroUI(heroes) {
	// Generate hero buttons
	for (let index = 0; index < 10; index++) {
		var hero_name = heroes[index];
		var parent = $.GetContextPanel().FindChildTraverse("HeroSelectionRow1");

		if (index >= 5)
			parent = $.GetContextPanel().FindChildTraverse("HeroSelectionRow2");

		var hero_button = $.CreatePanel("Panel", parent, hero_name);
		hero_button.BLoadLayoutSnippet("SelectHeroButton");

		var label = hero_button.FindChildrenWithClassTraverse("HeroSelectionLabel")[0];
		var image = hero_button.FindChildrenWithClassTraverse("HeroSelectionPip")[0];

		$.Msg(hero_name);

		label.text = hero_name;
		image.heroname = hero_name;

		(function (hero_name) {
			hero_button.SetPanelEvent("onactivate", function () {
				RequestHeroPick(hero_name);
			})
		})(hero_name);
	}
}

(function () {
//	$('#TakeoverActivateButton').style.visibility = 'visible';

	// placeholder object
	var heroes = {
		0: "npc_dota_hero_antimage",
		1: "npc_dota_hero_axe",
		2: "npc_dota_hero_queenofpain",
		3: "npc_dota_hero_rattletrap",
		4: "npc_dota_hero_shredder",

		5: "npc_dota_hero_terrorblade",
		6: "npc_dota_hero_storm_spirit",
		7: "npc_dota_hero_void_spirit",
		8: "npc_dota_hero_ember_spirit",
		9: "npc_dota_hero_earth_spirit",
	}

	GenerateHeroUI(heroes);

	//Subscribe to events
	GameEvents.Subscribe( "generate_hero_ui", GenerateHeroUI );
	GameEvents.Subscribe( "activation_done", DrawHeroSelectionUI );
	GameEvents.Subscribe( "hero_assigned", OnHeroAssigned );
	GameEvents.Subscribe( "game_started", OnGameStart );
	GameEvents.Subscribe( "glyph_cooldown", OnGlyphUpdate );
	GameEvents.Subscribe( "scan_cooldown", OnScanUpdate );
})();
