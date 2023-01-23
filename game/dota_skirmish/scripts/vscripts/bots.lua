require("internal/adv_log")
require("internal/globals")
require("game_states/game_reader")
require("internal/util")
require("time_utils")
require("neutral_items") -- TODO: add check for this


if Bots == nil then
	Bots = class({})
end

function Bots:MakeBotsControllable()
	-- Looks like this is not needed
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		local humans = {}
		local bots = {}
		for i = 1, DOUBLE_MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				local player_steam_id = PlayerResource:GetSteamAccountID(playerID)
				if player_steam_id == 0 then -- this is a bot
					table.insert(bots, playerID)
				else
					table.insert(humans, playerID)
				end
			end
		end
		print("team", teamNum)
		print("humans", humans)
		print("bots", bots)

		for _, botID in pairs(bots) do
			local bot_hero = PlayerResource:GetSelectedHeroEntity(botID)
			bot_hero:SetControllableByPlayer(-1, true)
			
			for _, humanID in pairs(humans) do
				bot_hero:SetControllableByPlayer(humanID, false)
			end 
		end
	end
	GameRules:GetGameModeEntity():SetBotThinkingEnabled(WORKING_BOTS)
end

function Bots:AddBots()
	print("AddBots")
	-- Adding player SteamID 0 to PlayerID 1 FakeClient=1, preferred PlayerID = -1
	-- the is IsFakeClient PlayerID
	local n_good_players = 0
	local n_bad_players = 0

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, DOUBLE_MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				if teamNum == DOTA_TEAM_GOODGUYS then
					n_good_players = n_good_players + 1
				else
					n_bad_players = n_bad_players + 1
				end
			end
		end
	end
	print("n_good_players: "..n_good_players, " n_bad_players: "..n_bad_players)
	
	for i = 1, (5 - n_good_players) do
		print("good bot")
		Tutorial:AddBot("", "", "", true)
	end

	for i = 1, (5 - n_bad_players) do
		print("bad bot")
		Tutorial:AddBot("", "", "", false)
	end

	Tutorial:StartTutorialMode();
	GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman(true)
	GameRules:GetGameModeEntity():SetBotsInLateGame(true)
	GameRules:GetGameModeEntity():SetBotsMaxPushTier(-1)
end
