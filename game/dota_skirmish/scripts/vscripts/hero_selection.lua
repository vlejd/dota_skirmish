require("game_states/game_reader")
require("internal/globals")
require("internal/adv_log")

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

function HeroSelection:StartHeroSelection(fun, n_players, fast)
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
	GameRules:GetGameModeEntity():SetThink("TryToFinishHeroPicking", self, "FinishHeroSelectionNoPlayers", 3)

	ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(self, "OnStateChange"), self)

	CustomGameEventManager:Send_ServerToAllClients("generate_hero_ui", heroes)
	if fast then
		HeroSelection:FinishHeroSelection()
	end

end

function HeroSelection:OnStateChange()
	print("hero selection on state change", GameRules:State_Get())
 	if GameRules:State_Get() > DOTA_GAMERULES_STATE_HERO_SELECTION and not HeroSelection.finished then
		HeroSelection:FinishHeroSelection()
	end
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

	print(HeroSelection.player_picked_hero)
	print(HeroSelection.heroes_picked)
	print(HeroSelection.player_to_hero)
	HeroSelection:RandomForNoHeroSelected()
	print(HeroSelection.player_picked_hero)
	print(HeroSelection.heroes_picked)
	print(HeroSelection.player_to_hero)

	local pls = {"pls"}
	CustomGameEventManager:Send_ServerToAllClients("finish_hero_selection", pls)
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

	if PlayerResource:GetTeam(data.PlayerID) == 1 then
		DisplayError(data.PlayerID, "#dota_hud_error_observers_can_not_pick_heroes")
		print("Observers can not pick heroes!")
		return	
	end

	if HeroSelection:PickedWrongTeam(data) and (not CAN_PICK_FROM_OTHER_TEAM) then
		DisplayError(data.PlayerID, "#dota_hud_error_player_picked_hero_from_wrong_team")
		print("Player picked hero from wrong team!")
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

	HeroSelection:TryToFinishHeroPicking()
end

function HeroSelection:TryToFinishHeroPicking()
	if HeroSelection.n_players == Util:tablelength(HeroSelection.player_picked_hero) and not HeroSelection.finished then
		HeroSelection:FinishHeroSelection()
	end
end

function HeroSelection:PickedWrongTeam(data)
	local desired_hero = data.sHeroName

	local desired_team = GameReader:GetHeroTeam(desired_hero)
	local current_team = PlayerResource:GetTeam(data.PlayerID)
	return desired_team ~= current_team
end

function HeroSelection:ConfirmHeroSelection(data)
	print(data)
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
						local current_team = PlayerResource:GetTeam(playerID)
								
						for hname, picked in pairs(HeroSelection.heroes_picked) do
							local hero_team = GameReader:GetHeroTeam(hname)
							if not picked then
								if CAN_PICK_FROM_OTHER_TEAM or (hero_team == current_team) then
									table.insert(available_heroes, hname)
								end
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
	-- TODO : This may be problematic in case of disconnects. 
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			print(teamNum.." "..i.." "..playerID)
			if playerID ~= nil and playerID ~= -1 then
				print(PlayerResource:HasSelectedHero(playerID), PlayerResource:GetSelectedHeroName(playerID))
				if not PlayerResource:HasSelectedHero(playerID) then
					local hPlayer = PlayerResource:GetPlayer(playerID)
					if hPlayer ~= nil then
						print("random hero", hPlayer, playerID)
						hPlayer:MakeRandomHeroSelection()
					end
				end
				print(PlayerResource:HasSelectedHero(playerID), PlayerResource:GetSelectedHeroName(playerID))
			end
		end
	end
end
