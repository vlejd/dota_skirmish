MAX_PLAYERS = 5
DOUBLE_MAX_PLAYERS = MAX_PLAYERS * 2
SUPER_MAX_PLAYERS = 20
CAN_PICK_FROM_OTHER_TEAM = false
SCENARIO_SELECTION_LENGTH = 600
HERO_SELECTION_LENGTH = 600
START_WITH_PAUSE = true
CLIENT_PRINT = false
ALLOW_CUSTOM_SCENARIO = false
WORKING_BOTS = true		-- BOTS are always added, this just makes them move
INCLUDED_SCENARIOS = {"n1_2v5", "n2_esl_kl", "n3_double_rampage", "n4_ending", "n5_team_wipe"}

DEBUG = false
SLOW_TIME_FRIENDLY = false
PRINT_DAY_NIGHT = false
TRACK_ROSHAN = false
PLAYER_LARGE_VISSIO = false

if not IsInToolsMode() then
	DEBUG = false
	SLOW_TIME_FRIENDLY = false
	PRINT_DAY_NIGHT = false
	TRACK_ROSHAN = false
	PLAYER_LARGE_VISSIO = false
end