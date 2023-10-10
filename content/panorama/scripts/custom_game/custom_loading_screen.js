const delay = 10.0;
var will_show = false;
var should_show = true;

(function () {
	SetSpectatorMessage();
})();

function SetSpectatorMessage() {
	if (Game.GetLocalPlayerID() == -1 && Players.GetTeam(Game.GetLocalPlayerID()) == -1) {
		if (will_show == false) {
			$.Msg("Showing spectator message in " + delay + " seconds");
	
			will_show = true;
			$.Schedule(delay, ShowSpectatorMessage);
		}
	} else {
		$("#SpectatorLabel").visible = false;

		if (should_show == true) {
			$.Msg("Hold on! You are not a spectator!");

			should_show = false;
		}
	}

	if (Game.GetState() <= 3) {
		$.Schedule(1.0, SetSpectatorMessage);
	}
}

function ShowSpectatorMessage() {
	$.Msg("Showing spectator message: " + should_show);
	$("#SpectatorLabel").visible = should_show;
	will_show = false;
}
