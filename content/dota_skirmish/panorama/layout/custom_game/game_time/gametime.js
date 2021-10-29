"use strict";

function GameTimer(data)
{
	var timerText = "";
	timerText += data.timer_minute_10;
	timerText += data.timer_minute_01;
	timerText += ":";
	timerText += data.timer_second_10;
	timerText += data.timer_second_01;

	$("#GameTimer").text = timerText;
}
/*
function OnGameStateChanged(table, key, data)
{
	$.Msg("Table '", table, "' changed: '", key, "' = ", data);
}
*/
(function()
{
	// We use a nettable to communicate victory conditions to make sure we get the value regardless of timing.
//	CustomNetTables.SubscribeNetTableListener("game_state", OnGameStateChanged);

	GameEvents.Subscribe("timer_game", GameTimer);
})();