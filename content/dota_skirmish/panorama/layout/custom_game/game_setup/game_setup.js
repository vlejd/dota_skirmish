"use strict";


function MakeScreenDark(data) {
	$.Msg("MakeScreenDark");
	$('#game_serup').style.visibility = 'visible';
	$('#game_serup').style.opacity = 1;	
}

function MakeScreenNotDark(data) {
	$.Msg("MakeScreenNotDark");
	$('#game_serup').style.visibility = 'collapse';
	$('#game_serup').style.opacity = 0;	
}

(function () {
	//Subscribe to events
	GameEvents.Subscribe( "make_screen_dark", MakeScreenDark );
	GameEvents.Subscribe( "make_screen_not_dark", MakeScreenNotDark );
	
})();
