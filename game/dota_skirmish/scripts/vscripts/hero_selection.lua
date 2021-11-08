if HeroSelection == nil then
	HeroSelection = class({})
	HeroSelection.player_picked_hero = {}
	HeroSelection.heroes_picked = {}
	HeroSelection.heroes_replaced = {}
end

function HeroSelection:StartHeroSelection(heroes)
	CustomGameEventManager:Send_ServerToAllClients("generate_hero_ui", heroes)
end

function HeroSelection:ListenToHeroPick()
	CustomGameEventManager:RegisterListener("request_hero_pick", Dynamic_Wrap(HeroSelection, "RequestHeroPick"))
end

function HeroSelection:FinishHeroSelection()
	local pls = {"pls"}
	CustomGameEventManager:Send_ServerToAllClients("finish_hero_selection", pls)
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

	local all_picked = true

	local maxPlayers = 5
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, maxPlayers do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				local hPlayer = PlayerResource:GetPlayer(playerID)
				if hPlayer ~= nil then
					if HeroSelection.player_picked_hero[playerID] == nil then
						all_picked = false
					end
				end
			end
		end
	end

	if all_picked and GameRules:State_Get() == DOTA_GAMERULES_STATE_PRE_GAME then
		GameRules:ForceGameStart()
	end
end

function HeroSelection:ConfirmHeroSelection(data)
	HeroSelection.player_picked_hero[data.PlayerID] = true
	HeroSelection.heroes_picked[data.sHeroName] = true

	CustomGameEventManager:Send_ServerToAllClients("hero_assigned", data)

	local hero_name = "npc_dota_hero_" .. data.sHeroName
	PrecacheUnitByNameAsync(hero_name, function()
		local old_hero = PlayerResource:GetSelectedHeroEntity(data.PlayerID)
		if old_hero ~= nil then
			-- TODO, make sure they do not die in some stupid way
			-- new_hero:AddNewModifier(new_hero, nil, "modifier_eul_cyclone", {duration = 6})

			local spawner_name = ""
			if GameReader:GetHeroTeam(data.sHeroName) == 2 then
				spawner_name = "info_player_start_goodguys"
			else
				spawner_name = "info_player_start_badguys"
			end
			print(spawner_name)
			local spawner = Entities:FindByClassname(nil, spawner_name)
			-- FindClearSpaceForUnit
			old_hero:SetAbsOrigin(spawner:GetAbsOrigin())

			PlayerResource:SetCustomTeamAssignment(data.PlayerID, GameReader:GetHeroTeam(data.sHeroName))

			local new_hero = PlayerResource:ReplaceHeroWith(data.PlayerID, hero_name, 0, 0)

			HeroSelection.heroes_replaced[hero_name] = true
			GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("delay_ui_creation"), function()
				if old_hero then
					UTIL_Remove(old_hero)
				end
			end, 1.0)
		else
			local hero = CreateHeroForPlayer(hero_name, PlayerResource:GetPlayer(data.PlayerID))
			HeroSelection.heroes_replaced[hero_name] = true
			hero:RespawnHero(false, false)
		end
	end)
end

function HeroSelection:RandomForNoHeroSelected()
	print(HeroSelection.player_picked_hero)
	local maxPlayers = 5
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, maxPlayers do
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
