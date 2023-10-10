(function () {
	SetSpectatorMessage();
})();

function SetSpectatorMessage() {
	const LoadingScreen = $.GetContextPanel().GetParent().GetParent().GetParent();

	if (Game.GetState() == 2 && LoadingScreen && (Game.GetLocalPlayerID() == -1 || Game.GetLocalPlayerID() == null)) {
	// if (Game.GetState() == 2 && LoadingScreen && (Game.GetLocalPlayerID() == 0 || Game.GetLocalPlayerID() == null)) {
		// LoadingScreen.visible = false;
		$("#SpectatorLabel").visible = true;
	} else {
		$("#SpectatorLabel").visible = false;
	}

	if (Game.GetState() <= 3) {
		$.Schedule(1.0, SetSpectatorMessage);
	}
}
