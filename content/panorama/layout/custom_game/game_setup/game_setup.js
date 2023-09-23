"use strict";

function MakeScreenDark(data) {
	$.Msg("MakeScreenDark");
	$('#game_setup').AddClass("ready");
	$('#game_setup').RemoveClass("hide");
}

function MakeScreenNotDark(data) {
	$.Msg("MakeScreenNotDark");
	$('#game_setup').AddClass("hide");
}

function SecToText( seconds ) {
	var minutes = Math.floor(seconds / 60);
	var seconds = Math.floor(seconds % 60);
	var s = "";
	var m = "";
	if (seconds < 10)
		s = "0";
	if (minutes < 10)
		m = "0";
	return m + minutes + ":" + s + seconds;
}

function UpdateTime(data) {
	var seconds = data.time;
	var text = SecToText(seconds);
	// if(data.isday){
	// 	text = "D " + text;
	// } else {
	// 	text = "N " + text;
	// }
	$("#GameTimerId").text = text;
}

function SetTimerMsg(data){
	if (data.time){
		$("#GameTimerMsg").text = data.text + " " + SecToText(data.time);
	} else {
		$("#GameTimerMsg").text = data.text;
	}
}

function SetLoadingText(data){
	$.Msg("SetLoadingText");
	$.Msg(data);
	$("#LoadingText").text = data.text;
}

function DebugPrint(data){
	$.Msg("jsd ", data["level"], " ", data["trace"], " ", data["line"], " ", data["name"], " ", data["content"]);
}

function OverrideVanillaUI() {
	const VanillaParent = $.GetContextPanel().GetParent().GetParent().GetParent();
	const GameTimeParent = VanillaParent.FindChildTraverse("GameTime");

	if (GameTimeParent) {
		GameTimeParent.style.opacity = 0;
	}

	const RadiantTeamInfo = VanillaParent.FindChildTraverse("TopBarRadiantTeamInfo");

	if (RadiantTeamInfo) {
		RadiantTeamInfo.style.visibility = "visible";

		const RadiantTeamImage = RadiantTeamInfo.FindChildTraverse("RadiantTeamImage");

		if (RadiantTeamImage) {
			RadiantTeamImage.style.visibility = "visible";
			RadiantTeamImage.style.backgroundImage = "url('file://{images}/teams/team_unknown_web.png')";
			RadiantTeamImage.style.backgroundSize = "cover";
			RadiantTeamImage.style.backgroundPosition = "0% 80%";
		}
	}

	const DireTeamInfo = VanillaParent.FindChildTraverse("TopBarDireTeamInfo");

	if (DireTeamInfo) {
		DireTeamInfo.style.visibility = "visible";

		const DireTeamImage = DireTeamInfo.FindChildTraverse("DireTeamImage");

		if (DireTeamImage) {
			DireTeamImage.style.visibility = "visible";
			DireTeamImage.style.backgroundImage = "url('file://{images}/teams/team_unknown_web.png')";
			DireTeamImage.style.backgroundSize = "cover";
			DireTeamImage.style.backgroundPosition = "0% 80%";
		}
	}

	const main_parent = $.GetContextPanel().GetParent().GetParent().GetParent();
	const button_parent = main_parent.FindChildTraverse("ButtonBar");
	const parent = main_parent.FindChildTraverse("CustomTopBar");

	if (main_parent && button_parent && parent) {
		const dashboard = parent.FindChildTraverse("DashboardButton");
		const settings = parent.FindChildTraverse("SettingsButton");

		if (settings) {
			settings.SetParent(button_parent);
			button_parent.MoveChildBefore(settings, button_parent.GetChild(0));
		}

		if (dashboard) {
			dashboard.SetParent(button_parent);
			button_parent.MoveChildBefore(dashboard, button_parent.GetChild(0));
		}
	}
}

function GeneratePlayerStatusUI() {
	const parent = $("#PlayerContainer");

	if (Game.IsInToolsMode()) {
		parent.RemoveAndDeleteChildren();
	}

	const player_count = Game.GetPlayerIDsOnTeam(DOTATeam_t.DOTA_TEAM_GOODGUYS).length + Game.GetPlayerIDsOnTeam(DOTATeam_t.DOTA_TEAM_BADGUYS).length;

	for (let i = 0; i < player_count; i++) {
		const player_info = Game.GetPlayerInfo(i);

		if (player_info) {
			const player = $.CreatePanel("Panel", parent, "Player" + i);
			player.BLoadLayoutSnippet("PlayerContainer");

			player.FindChildTraverse("PlayerAvatar").steamid = player_info.player_steamid;
			player.FindChildTraverse("PlayerName").text = player_info.player_name;
		}
	}
	
	// PrintAllPlayersInfo();
	UpdatePlayersStatus();
}

function UpdatePlayersStatus() {
	const player_count = Game.GetPlayerIDsOnTeam(DOTATeam_t.DOTA_TEAM_GOODGUYS).length + Game.GetPlayerIDsOnTeam(DOTATeam_t.DOTA_TEAM_BADGUYS).length;
	let players_connected = 0;

	for (let i = 0; i < player_count; i++) {
		const player_info = Game.GetPlayerInfo(i);
		
		if (player_info) {
			const player_panel = $.GetContextPanel().FindChildTraverse("Player" + i.toString());
			
			if (player_panel) {
				const player_avatar = player_panel.FindChildTraverse("PlayerAvatar");
				const player_name = player_panel.FindChildTraverse("PlayerName");
				const player_hero = player_panel.FindChildTraverse("PlayerHero");
				const player_hero_name = player_panel.FindChildTraverse("PlayerHeroName");
				const player_connection_state = player_panel.FindChildTraverse("PlayerStatus");
				
				if (player_avatar && player_name && player_connection_state) {
					player_avatar.steamid = player_info.player_steamid;
				}

				if (player_name) {
					player_name.text = player_info.player_name;
				}

				if (player_connection_state) {
					if (player_info.player_connection_state === DOTAConnectionState_t.DOTA_CONNECTION_STATE_CONNECTED || Game.IsInToolsMode() && player_info.player_connection_state === DOTAConnectionState_t.DOTA_CONNECTION_STATE_NOT_YET_CONNECTED) {
						if (player_info.player_selected_hero !== "") {
							const player_hero_entity = Entities.GetUnitName(player_info.player_selected_hero_entity_index);

							if (player_hero_entity === player_info.player_selected_hero) {
								player_connection_state.text = $.Localize("#DOTA_LoadingPlayerFullyConnected");
								player_hero.heroname = player_info.player_selected_hero;
								player_hero_name.text = $.Localize("#" + player_info.player_selected_hero);
								player_panel.AddClass("ready");
								players_connected++;
							}
						}
					} else if (player_info.player_connection_state === DOTAConnectionState_t.DOTA_CONNECTION_STATE_ABANDONED || player_info.player_connection_state === DOTAConnectionState_t.DOTA_CONNECTION_STATE_FAILED) {
						player_connection_state.text = $.Localize("#DOTA_LoadingPlayerFailed");
						player_panel.AddClass("failed");
					} else if (player_info.player_connection_state === DOTAConnectionState_t.DOTA_CONNECTION_STATE_UNKNOWN) {
						player_connection_state.text = $.Localize("#DOTA_LoadingPlayerUnknown");
					} else { // DOTA_CONNECTION_STATE_LOADING, DOTA_CONNECTION_STATE_NOT_YET_CONNECTED, DOTA_CONNECTION_STATE_DISCONNECTED
						player_connection_state.text = $.Localize("#DOTA_LoadingPlayerLoading");
					}
				}
			}
		}
	}

	const title = $.GetContextPanel().FindChildTraverse("TitleText");

	if (title) {
		$.GetContextPanel().SetDialogVariable("player_count", player_count);
		$.GetContextPanel().SetDialogVariable("player_connected", players_connected);
	}

	if (players_connected === player_count) {
		// PrintAllPlayersInfo();
		MakeScreenNotDark();
	} else {
		$.Schedule(0.1, UpdatePlayersStatus);
	}
}

function PrintAllPlayersInfo() {
	const player_count = Game.GetPlayerIDsOnTeam(DOTATeam_t.DOTA_TEAM_GOODGUYS).length + Game.GetPlayerIDsOnTeam(DOTATeam_t.DOTA_TEAM_BADGUYS).length;

	for (let i = 0; i < player_count; i++) {
		const player_info = Game.GetPlayerInfo(i);
		
		if (player_info) {
			$.Msg(player_info);
		}
	}
}

(function () {
	OverrideVanillaUI();
	GeneratePlayerStatusUI();

	// if (Game.IsInToolsMode()) {
	// 	MakeScreenDark();
	// }

	//Subscribe to events
	// GameEvents.Subscribe( "make_screen_dark", MakeScreenDark );
	GameEvents.Subscribe( "make_screen_not_dark", MakeScreenNotDark );
	// GameEvents.Subscribe( "set_loading_text", SetLoadingText );
	GameEvents.Subscribe( "update_game_time", UpdateTime );	
	GameEvents.Subscribe( "set_timer_msg", SetTimerMsg );	
	GameEvents.Subscribe( "debug_print", DebugPrint );	
})();
