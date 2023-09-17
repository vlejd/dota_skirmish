"use strict";


function MakeScreenDark(data) {
	$.Msg("MakeScreenDark");
	$('#game_setup').style.visibility = 'visible';
	$('#game_setup').style.opacity = 1;	
}

function MakeScreenNotDark(data) {
	$.Msg("MakeScreenNotDark");
	$('#game_setup').style.visibility = 'collapse';
	$('#game_setup').style.opacity = 0;	
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
}

(function () {
	OverrideVanillaUI();

	//Subscribe to events
	GameEvents.Subscribe( "make_screen_dark", MakeScreenDark );
	GameEvents.Subscribe( "make_screen_not_dark", MakeScreenNotDark );
	GameEvents.Subscribe( "set_loading_text", SetLoadingText );
	GameEvents.Subscribe( "update_game_time", UpdateTime );	
	GameEvents.Subscribe( "set_timer_msg", SetTimerMsg );	
	GameEvents.Subscribe( "debug_print", DebugPrint );	
})();
