require("game_states/game_reader")
require("internal/globals")
require("libraries/adv_log")

if HeroSelection == nil then
	HeroSelection = class({})
	HeroSelection.player_picked_hero = {}
	HeroSelection.player_to_hero = {}
	HeroSelection.heroes_picked = {}
	HeroSelection.heroes_replaced = {}
	HeroSelection.n_players = nil
	HeroSelection.finished = false
	HeroSelection.onfinish = nil
end

function HeroSelection:StartHeroSelection(fun, n_players)
	print(n_players)
	HeroSelection.onfinish = fun
	HeroSelection.n_players = n_players
	for k, v in pairs(GameReader:GetHeroesInfo()) do
		HeroSelection.heroes_picked[k] = false
	end

	-- This could also be created by tracking if all player heroes spawned in the game but sometimes it doesn't init for all players because their client did not init base UI's yet
	heroes = {}
	for hero, _ in pairs(GameReader:GetHeroesInfo()) do
		heroes[hero] = GameReader:GetHeroTeam(hero)
	end
	GameRules:GetGameModeEntity():SetThink("FinishHeroSelection", self, "FinishHeroSelection", HERO_SELECTION_LENGTH)

	CustomGameEventManager:Send_ServerToAllClients("generate_hero_ui", heroes)
end

function HeroSelection:ListenToHeroPick()
	CustomGameEventManager:RegisterListener("request_hero_pick", Dynamic_Wrap(HeroSelection, "RequestHeroPick"))
end

function HeroSelection:FinishHeroSelection()
	if HeroSelection.finished then
		print("already finished")
		return nil
	else
		HeroSelection.finished = true
		print("FinishHeroSelection")	
	end

	HeroSelection:RandomForNoHeroSelected()

	local pls = {"pls"}
	CustomGameEventManager:Send_ServerToAllClients("finish_hero_selection", pls)
	print(HeroSelection.heroes_picked)
	print(HeroSelection.player_picked_hero)
	print(HeroSelection.player_to_hero)
	HeroSelection.onfinish()
end

function HeroSelection:RequestHeroPick(data)
	print(HeroSelection.player_picked_hero)
	print(HeroSelection.heroes_picked)
	print(data)
	if HeroSelection.player_picked_hero[data.PlayerID] == true then
		DisplayError(data.PlayerID, "#dota_hud_error_player_picked_hero_already")
		print("Player picked hero already!")
		return
	end

	if HeroSelection.heroes_picked[data.sHeroName] ~= nil then
		if HeroSelection.heroes_picked[data.sHeroName] == true then
			print("Hero picked already:", data.sHeroName)
			return false
		else
			print("Pick hero:", data.sHeroName)
			HeroSelection:ConfirmHeroSelection(data)
		end
	else
		print("CRITICAL ERROR: No such hero in table:", data.sHeroName)
	end

	if HeroSelection.n_players == tablelength(HeroSelection.player_picked_hero) and not HeroSelection.finished then
		HeroSelection:FinishHeroSelection()
	end
end

function HeroSelection:ConfirmHeroSelection(data)
	HeroSelection.player_picked_hero[data.PlayerID] = true
	HeroSelection.heroes_picked[data.sHeroName] = true
	HeroSelection.player_to_hero[data.PlayerID] = data.sHeroName 
	CustomGameEventManager:Send_ServerToAllClients("hero_assigned", data)

end

function HeroSelection:RandomForNoHeroSelected()
	print(HeroSelection.player_picked_hero)
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, DOUBLE_MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				if HeroSelection.player_picked_hero[playerID] == nil then
					local hPlayer = PlayerResource:GetPlayer(playerID)
					if hPlayer ~= nil then
						-- get random hero
						local available_heroes = {}
						print(HeroSelection.heroes_picked)
						for hname, picked in pairs(HeroSelection.heroes_picked) do
							if not picked then
								table.insert(available_heroes, hname)
							end
						end
						print(available_heroes)
						local hname = available_heroes[RandomInt(1, #available_heroes)]
						-- assign to this player
						if hname == nil then
							print("CRITICAL ERROR: invalid random hero:")
						end
						print(hname)
						HeroSelection:RequestHeroPick({
							PlayerID = playerID,
							sHeroName = hname
						})
					end
				end
			end
		end
	end
end

function HeroSelection:TotalyRandomForNoHeroSelected()
	print("TotalyRandomForNoHeroSelected")
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i=1, DOUBLE_MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			print(teamNum, i, playerID)
			if playerID ~= nil and playerID ~= -1 then
				print(PlayerResource:HasSelectedHero(playerID), PlayerResource:GetSelectedHeroName(playerID))
				if not PlayerResource:HasSelectedHero(playerID) then
					local hPlayer = PlayerResource:GetPlayer(playerID)
					if hPlayer ~= nil then
						print("random hero", hPlayer, playerID)
						hPlayer:MakeRandomHeroSelection()
					end
				end
			end
		end
	end
end