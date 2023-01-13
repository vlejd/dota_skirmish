-- stuff from here: https://dota2.fandom.com/wiki/Neutral_Items and here: https://github.com/SteamDatabase/GameTracking-Dota2/blob/master/game/dota/pak01_dir/scripts/npc/neutral_items.txt
-- load file with timing
-- hook on every death of neutral creep
-- if time for neutral item, and conditions are met, 
-- GetPotentialNeutralItemDrop and drop it. 
require("internal/util")
require("time_utils")


if NeutralItems == nil then
	NeutralItems = class({})
	NeutralItems.neutral_items_in_game = {
		good = {{}, {}, {}, {}, {}},
		bad = {{}, {}, {}, {}, {}}
	}
	NeutralItems.NEUTRAL_ITEMS = {{},{},{},{},{}}
end

DROP_TIMES = {7, 17, 27, 37, 60}



function GetTeamString(team)
	if team == DOTA_TEAM_GOODGUYS then
		return "good"
	end
	if team == DOTA_TEAM_BADGUYS then
		return "bad"
	end
	return nil
end

function NeutralItems:AddItemToStash(item, team)
	local hHero = HeroList:GetHero(0)
	local item_tier = GetNeutralItemTier(item)

	if hHero ~= nil and item_tier ~= nil then
		local playerID = hHero:GetPlayerID()
		local hPlayer = PlayerResource:GetPlayer(playerID)
		local cItem = CreateItem(item, hPlayer, nil)
		PlayerResource:AddNeutralItemToStash(playerID, team, cItem)
		local team_str = GetTeamString(team)
		table.insert(NeutralItems.neutral_items_in_game[team_str][item_tier], item)
		return true
	else
		print("ERROR Adding invalid neutral item to neutral stash")
		return false
	end
end

function NeutralItems:AddNeutralItemToHero(hHero, item)
	local hHero = hHero
	local item_tier = GetNeutralItemTier(item)

	if hHero ~= nil and item_tier ~= nil then
		local team = hHero:GetTeam()
		local team_str = GetTeamString(team)
		table.insert(NeutralItems.neutral_items_in_game[team_str][item_tier], item)
		print(NeutralItems.neutral_items_in_game)
		return true
	else
		print("Adding invalid neutral item to hero")
		return false
	end
end

function GetNeutralItemTier(query_item)
	print("GetNeutralItemTier ".. query_item)
	for i, items in pairs(NeutralItems.NEUTRAL_ITEMS) do
		for j, item in pairs(items) do
			if query_item == item then
				print(i)
				return i
			end
		end
	end
	print("ERROR neutral item not found")
	return nil
end

function NeutralItems:IsItemNeutral(query_item)
	for _, items in pairs(NeutralItems.NEUTRAL_ITEMS) do
		for _, item in pairs(items) do
			if query_item == item then
				return true
			end
		end
	end
	return false
end

function TableContains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

function NeutralItems:GetPotentialNeutralItemDrop(tier, team)
	print("GetPotentialNeutralItemDrop")
	print(tier)
	print(team)
	print(NeutralItems.neutral_items_in_game)
	local possible_drops = {}
	local team_str = GetTeamString(team)
	if team_str == nil then
		return nil
	end

	if table.getn(NeutralItems.neutral_items_in_game[team_str][tier]) >= 5 then
		return nil
	end

	for _, item in pairs(NeutralItems.NEUTRAL_ITEMS[tier]) do
		if not TableContains(NeutralItems.neutral_items_in_game[team_str][tier]) then
			table.insert(possible_drops, item)
		end
	end
	local random_index = RandomInt(1, table.getn(possible_drops))
	print(possible_drops[random_index])
	return possible_drops[random_index]
end

function NeutralItems:Setup(master_time)
	NeutralItems.master_time = master_time
	ListenToGameEvent("entity_killed", Dynamic_Wrap(self, "OnEntityKilled"), self)
	local NeutralKV = LoadKeyValues("scripts/npc/npc_neutral_items_custom.txt")
	print("INFO NEUTRAL SETUP")
	print(NeutralItems.NEUTRAL_ITEMS)
	for i, tier in pairs({"1", "2", "3", "4", "5"}) do
		print(i, tier)
		local tier_data = NeutralKV[tier]
		for item, val in pairs(tier_data["items"]) do
			if val ~= 1 then
				print("ERROR invalid neutral item KV "..item.." has value "..val)
			else
				table.insert(NeutralItems.NEUTRAL_ITEMS[i], item)
			end

		end
	end
	print("INFO NEUTRAL_ITEMS")
	print(NeutralItems.NEUTRAL_ITEMS)

end


function NeutralItems:OnEntityKilled(event)
	local hVictim = nil
	local hAttacker = nil
	if event.entindex_killed ~= nil then
		hVictim = EntIndexToHScript(event.entindex_killed)
	end
	if event.entindex_attacker ~= nil then
		hAttacker = EntIndexToHScript(event.entindex_attacker)
	end

	if hVictim:IsNeutralUnitType() and hVictim:GetTeam() == DOTA_TEAM_NEUTRALS and hVictim ~= nil and hAttacker ~= nil then
		-- TODO fix for roshan
		print("neutral died")
		local drop_probability = 0.1
		if hVictim:IsAncient() then
			print("ancient died")
			drop_probability = drop_probability * 3
		end

		local attacker_team = hAttacker:GetTeam()
		local other_team = nil
		if attacker_team == DOTA_TEAM_GOODGUYS then
			other_team = DOTA_TEAM_BADGUYS
		elseif attacker_team == DOTA_TEAM_BADGUYS then
			other_team = DOTA_TEAM_GOODGUYS
		else
			print("attacker has a strange team", attacker_team)
			print(TimeUtils:GetMasterTime(NeutralItems.master_time))
			return
		end
		local victim_poz = hVictim:GetAbsOrigin()
		local friendly_in_range = false
		local enemy_in_range = false

		for hID = 0, 9 do
			local hHero = HeroList:GetHero(hID)
			local team = hHero:GetTeam()
			local pos = hHero:GetAbsOrigin()
			local dist = Util:dist2(pos, victim_poz)
			if team == attacker_team then
				-- print(hID, pos, victim_poz, dist)
				if dist < Util:sqr(750) then
					friendly_in_range = true
				end
			end
			if team == other_team then
				if dist < Util:sqr(1200) then
					enemy_in_range = true
				end
			end
		end

		if hAttacker:IsChanneling() then
			return
		end
		for tier = 1, 5 do
			local time = TimeUtils:GetMasterTime(NeutralItems.master_time)
			local time_is_right = (DROP_TIMES[tier] * 60 < time.skirmishTime)
			local potential_drop = NeutralItems:GetPotentialNeutralItemDrop(tier, attacker_team)
			if potential_drop ~= nil and friendly_in_range and (not enemy_in_range) and time_is_right then
				local rng = RandomInt(1, 1000)
				local item_tier = GetNeutralItemTier(potential_drop)
				if rng <= drop_probability * 1000 then
					print(NeutralItems.neutral_items_in_game)
					DropNeutralItemAtPositionForHero(potential_drop, victim_poz, hAttacker, item_tier, true)
					NeutralItems:AddNeutralItemToHero(hAttacker, potential_drop)
					return
				end
			end
		end
	end

	-- TODO add midas certain drop
	-- TODO readjust drop probabilities
	-- TODO support old items
	-- check drop conditions
	-- attacker is near, and it is not an illusion 750radius 
	-- attacker not channeling TP or boots
	-- no enemy hero is near
	-- The team of the unit is neutral
	-- check drop probability (is ancient, triple the probability)
	-- drop the item
end

