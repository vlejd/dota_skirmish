require("internal/adv_log")
require("internal/globals")
require("game_states/game_reader")
require("internal/util")
require("time_utils")
require("neutral_items") -- TODO: add check for this


if PlayerRecreation == nil then
	PlayerRecreation = class({})
end


function PlayerRecreation:itterPlayers()
	local ret = {}
	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				local data = {
					playerID = playerID,
					i = i, 
					team = teamNum,
				}
				table.insert(ret, data)
			end
		end
	end
	return ret
end


function PlayerRecreation:FindDesiredHeroForBot(teamNum)
	print("Finding hero for bot on team ".. teamNum)
	print(HeroSelection.heroes_picked)
	-- it is a bot
	local available_heroes = {}
	for hname, _ in pairs(HeroSelection.heroes_picked) do
		local picked = HeroSelection.heroes_picked[hname]
		if not picked and GameReader:GetHeroTeam(hname) == teamNum then
			table.insert(available_heroes, hname)
		end
	end
	local desired_hero_name = Util:getRandomValueFromArray(available_heroes)
	print("Finding hero for bot on team ".. teamNum.."  desired_hero_name")
	return desired_hero_name
end


function PlayerRecreation:SpawnDesiredHeroes(random_hero_to_playerID)
	print("SpawnDesiredHeroes")
	-- Make screen dark to hide the magic!
	-- replace heroes with the desired ones ...
	print(random_hero_to_playerID)
	print(HeroSelection.player_to_hero)
	for _, data in pairs(PlayerRecreation:itterPlayers()) do
		if PlayerResource:HasSelectedHero(data["playerID"]) then
			print("has selected hero", data)
			PlayerRecreation:SpawnDesiredHeroSingle(random_hero_to_playerID, data)
		else
			print("CRITICAL ERROR does not have selected hero", data)
			print(data)
		end
	end
	return nil
end


function PlayerRecreation:SpawnDesiredHeroSingle(random_hero_to_playerID, data)
	local i = data["i"]
	local playerID = data["playerID"]
	local teamNum = data["team"]

	local current_hero_name = PlayerResource:GetSelectedHeroName(playerID)
	local original_playerID = random_hero_to_playerID[current_hero_name]
	print(current_hero_name, playerID, original_playerID)
	local desired_hero_name = "wisp"

	if original_playerID == nil then
		-- it is a bot
		desired_hero_name = PlayerRecreation:FindDesiredHeroForBot(teamNum)
		print(desired_hero_name)
		HeroSelection.heroes_picked[desired_hero_name] = true
	else
		print("this is not a bot ".. teamNum.. " " .. i.. " " .. playerID.. " " .. original_playerID)
		desired_hero_name = HeroSelection.player_to_hero[original_playerID]
	end
	local hero_name = "npc_dota_hero_" .. desired_hero_name

	PlayerRecreation:ReplaceWithCorrectHero(hero_name, playerID)

end


function PlayerRecreation:ReplaceWithCorrectHero(hero_name, playerID)
	-- TODO fix this. It used to be async. now soe decisionms dont make sense
	--Async(hero_name, function() 
		local old_hero = PlayerResource:GetSelectedHeroEntity(playerID)
		print("ReplaceWithCorrectHero ".. playerID.. " " .. hero_name)
		print(old_hero)
		print(HeroSelection.heroes_replaced)
		if old_hero ~= nil then
			local new_hero = PlayerResource:ReplaceHeroWith(playerID, hero_name, 0, 0)
			print(new_hero)
			local hHero = PlayerResource:GetSelectedHeroEntity(playerID)
			print(hHero)
			--UTIL_Remove(old_hero)
			
			HeroSelection.heroes_replaced[hero_name] = true
		else
			print("CRITICAL ERROR")
		end
	--end)

end


function PlayerRecreation:FixUpgrades()
	print("fixing upgrades")

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				if PlayerResource:HasSelectedHero(playerID) then
					local heroName = PlayerResource:GetSelectedHeroName(playerID)
					local hHero = PlayerResource:GetSelectedHeroEntity(playerID)
					if PLAYER_LARGE_VISSION then
						hHero:SetDayTimeVisionRange(1000000)
						hHero:SetNightTimeVisionRange(100000)
					end
					
					local niceHeroName = heroName:sub(15)
					print(playerID, teamNum, i)
					print(heroName.. " " .. niceHeroName)
					print(hHero)
					if GameReader:GetHeroInfo(niceHeroName) ~= nil then
						local heroData = GameReader:GetHeroInfo(niceHeroName)
						if Util:CastToBool(heroData["has_shard"]) then
							hHero:AddItemByName("item_aghanims_shard")
						end
						if Util:CastToBool(heroData["has_ags"]) then
							hHero:AddItemByName("item_ultimate_scepter_2")
						end
						if Util:CastToBool(heroData["has_moon_shard"]) then
							hHero:AddItemByName("item_moon_shard")
							local hMoonShard = hHero:FindItemInInventory("item_moon_shard")
							ExecuteOrderFromTable({
								UnitIndex = hHero:entindex(),
								OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
								AbilityIndex = hMoonShard:entindex(),
								TargetIndex = hHero:entindex()
							})
						end

						local hTP = hHero:FindItemInInventory("item_tpscroll")
						if hTP then
							hTP:EndCooldown()
						else
							hTP = hHero:AddItemByName("item_tpscroll")
							if hTP then
								hTP:SetCurrentCharges(1)
								hTP:EndCooldown()
							end
						end
					else
						print("CRITICAL ERROR")
					end
				else
					print("CRITICAL ERROR")
				end
			else
				print("CRITICAL ERROR")
			end
		end
	end
end


function PlayerRecreation:FixPlayers()
	print("fixing players")

	for teamNum = DOTA_TEAM_GOODGUYS, DOTA_TEAM_BADGUYS do
		for i = 1, MAX_PLAYERS do
			local playerID = PlayerResource:GetNthPlayerIDOnTeam(teamNum, i)
			if playerID ~= nil and playerID ~= -1 then
				if PlayerResource:HasSelectedHero(playerID) then
					local heroName = PlayerResource:GetSelectedHeroName(playerID)
					local hHero = PlayerResource:GetSelectedHeroEntity(playerID)
					local niceHeroName = heroName:sub(15)
					if GameReader:GetHeroInfo(niceHeroName) ~= nil then
						local heroData = GameReader:GetHeroInfo(niceHeroName)
						PlayerRecreation:FixHero(heroData, hHero)
						PlayerRecreation:spawnCurier(playerID, heroData)
					end
				else
					print("CRITICAL ERROR")
				end
			else
				print("CRITICAL ERROR")
			end
		end
	end
end

function PlayerRecreation:spawnCurier(playerID, heroData)
	GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("delay_ui_creation"), function()
		local hPlayer = PlayerResource:GetPlayer(playerID)
		if hPlayer == nil then
			print("waiting disconnected player".. playerID)
			return 1
		end
	
		-- TODO add items to courier. 
		if heroData["team"] == DOTA_TEAM_GOODGUYS then
			hPlayer:SpawnCourierAtPosition(Vector(-7071, -6625, 128))
		elseif heroData["team"] == DOTA_TEAM_BADGUYS then
			hPlayer:SpawnCourierAtPosition(Vector(7233, 6476, 128))
		else
			print("invalid player team")
		end
		return nil
	end, 0.5)
end

function PlayerRecreation:FixHero(heroData, hHero)
	FindClearSpaceForUnit(hHero, Util:fixPosition(heroData["position"]), true)

	for i = 2, heroData["level"] do
		hHero:HeroLevelUp(false)
	end

	for i = 0, 20 do
		local hItem = hHero:GetItemInSlot(i)
		if hItem ~= nil then
			hHero:RemoveItem(hItem)
		end
	end

	for _, item in pairs(heroData["items"] or {}) do
		if type(item) == "table" then
			print("Complex item")
			local item_name = item["name"]

			if NeutralItems:IsItemNeutral(item_name) then
				NeutralItems:AddNeutralItemToHero(hHero, item_name)
			end
			local hItem = hHero:AddItemByName(item_name)
			print(hItem)
			if hItem then
				hItem:SetCurrentCharges(item["charges"])
				hItem:EndCooldown()
				hItem:StartCooldown(item["cooldown"] + 0.0)
				hItem:SetLevel(item["level"]+0.0)
				hItem:SetPurchaseTime(item["acquire_time"])
			end
		else
			if NeutralItems:IsItemNeutral(item) then
				print("AddNeutralItemToHero ".. heroData["name"].. " " .. item)
				NeutralItems:AddNeutralItemToHero(hHero, item)
				hHero:AddItemByName(item)
			else
				hHero:AddItemByName(item)
			end
		end

	end

	local entityIndex = hHero:GetEntityIndex()
	if heroData["talents"] ~= nil then
		for _, talentIndex in pairs(heroData["talents"] or {}) do
			local hAbility = hHero:GetAbilityByIndex(talentIndex) -- starts from 0!
			local abilityEntityIndex = hAbility:GetEntityIndex()
			local newOrder = {
				UnitIndex = entityIndex,
				OrderType = DOTA_UNIT_ORDER_TRAIN_ABILITY,
				AbilityIndex = abilityEntityIndex
			}
			ExecuteOrderFromTable(newOrder)
		end
	end

	print("cooldown ".. heroData["name"].." "..Util:tablelength(heroData["cooldowns"]))
	print(heroData["cooldowns"])
	for cooldown_index, cooldown_value in pairs(heroData["cooldowns"]) do
		if type(cooldown_index) == "string" then
			cooldown_index = tonumber(cooldown_index)+1  -- TODO what the hell is happening here?!?!
		end
		local hAbility = hHero:GetAbilityByIndex(cooldown_index-1) -- starts from 0!
		print(cooldown_index, hAbility)
		if hAbility ~= nil then
			hAbility:EndCooldown()
			print(cooldown_value)
			hAbility:StartCooldown(cooldown_value + 0.0)
		end
	end

	print("is_dead".." ".. tostring(heroData["is_dead"]).." ".. type(heroData["is_dead"]))
	if Util:CastToBool(heroData["is_dead"]) then
		hHero:ForceKill(true)
		hHero:SetTimeUntilRespawn(heroData["respawn_time"])
	end

	if heroData["gold_reliable"] ~= nil then
		hHero:SetGold(heroData["gold_reliable"], true)
	end
	if heroData["gold_unreliable"] ~= nil then
		hHero:SetGold(heroData["gold_unreliable"], false)
	end

	if heroData["health"] ~= nil then
		hHero:SetHealth(heroData["health"])
	end

	if heroData["mana"] ~= nil then
		hHero:SetMana(heroData["mana"])
	end
	
	if heroData["buyback_cooldown"] ~= nil and heroData["buyback_cooldown"] ~=0 then
		hHero:SetBuybackCooldownTime(heroData["buyback_cooldown"])
	end

	if heroData["buffs"] ~= nil then
		for _, buff_data in pairs(heroData["buffs"]) do
			print(buff_data)
			local buff = hHero:AddNewModifier(hero_entity, nil, buff_data["name"], {})
			buff:SetStackCount(buff_data["stacks"])
		end
	end
end

