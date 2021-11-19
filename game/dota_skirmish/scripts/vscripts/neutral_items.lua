-- stuff from here: https://dota2.fandom.com/wiki/Neutral_Items
-- load file with timing
-- hook on every death of neutral creep
-- if time for neutral item, and conditions are met, 
-- GetPotentialNeutralItemDrop and drop it. 
require("internal/util")

if NeutralItems == nil then
	NeutralItems = class({})
end

DROP_TIMES = {}

NEUTRAL_ITEMS = {{"item_arcane_ring", "item_broom_handle", "item_chipped_vest", "item_mysterious_hat",
                  "item_keen_optic", "item_ocean_heart", "item_unstable_wand", "item_possessed_mask",
                  "item_trusty_shovel", "item_pogo_stick"},
                 {"item_ring_of_aquila", "item_nether_shawl", "item_dragon_scale", "item_pupils_gift", "item_vambrace",
                  "item_misericorde", "item_grove_bow", "item_philosophers_stone", "item_essence_ring",
                  "item_paintball", "item_bullwhip", "item_quicksilver_amulet"},
                 {"item_quickening_charm", "item_black_powder_bag", "item_spider_legs", "item_paladin_sword",
                  "item_titan_sliver", "item_mind_breaker", "item_enchanted_quiver", "item_elven_tunic",
                  "item_cloak_of_flames", "item_ceremonial_robe", "item_psychic_headband"},
                 {"item_timeless_relic", "item_spell_prism", "item_ascetic_cap", "item_heavy_blade", "item_flicker",
                  "item_ninja_gear", "item_the_leveller", "item_spy_gadget", "item_trickster_cloak",
                  "item_stormcrafter", "item_penta_edged_sword"},
                 {"item_force_boots", "item_desolator_2", "item_seer_stone", "item_mirror_shield", "item_apex",
                  "item_demonicon", "item_fallen_sky", "item_force_field", "item_pirate_hat", "item_ex_machina",
                  "item_giants_ring", "item_book_of_shadows"}}

neutral_items_in_game = {
	good = {{}, {}, {}, {}, {}},
	bad = {{}, {}, {}, {}, {}}
}

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
		table.insert(neutral_items_in_game[team_str][item_tier], item)
		return true
	else
		print("Adding invalid neutral item to neutral stash")
		return false
	end
end

function NeutralItems:AddNeutralItemToHero(hHero, item)
	local hHero = hHero
	local item_tier = GetNeutralItemTier(item)

	if hHero ~= nil and item_tier ~= nil then
		local team = hHero:GetTeam()
		local team_str = GetTeamString(team)
		table.insert(neutral_items_in_game[team_str][item_tier], item)
		print(neutral_items_in_game)
		return true
	else
		print("Adding invalid neutral item to hero")
		return false
	end
end

function GetNeutralItemTier(query_item)
	for i, items in pairs(NEUTRAL_ITEMS) do
		for j, item in pairs(items) do
			if query_item == item then
				return i
			end
		end
	end
	return nil
end

function NeutralItems:IsItemNeutral(query_item)
	for _, items in pairs(NEUTRAL_ITEMS) do
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
	local possible_drops = {}
	local team_str = GetTeamString(team)
	if table.getn(neutral_items_in_game[team_str][tier]) >= 5 then
		return nil
	end

	for _, item in pairs(NEUTRAL_ITEMS[tier]) do
		if not TableContains(neutral_items_in_game[team_str][tier]) then
			table.insert(possible_drops, item)
		end
	end
	local random_index = RandomInt(1, table.getn(possible_drops))
	return possible_drops[random_index]
end

function NeutralItems:Setup(time)
	NeutralItems:SetTime(time)
	ListenToGameEvent("entity_killed", Dynamic_Wrap(self, "OnEntityKilled"), self)
end

function NeutralItems:SetTime(time)
	local time_minutes = math.floor(time / 60)
	for _, time in pairs({7, 17, 27, 37, 60}) do
		local real_time = nil
		if time < time_minutes then
			real_time = 0
		else
			real_time = time - time_minutes
		end
		table.insert(DROP_TIMES, real_time)
	end
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
		end
		if attacker_team == DOTA_TEAM_BADGUYS then
			other_team = DOTA_TEAM_GOODGUYS
		end
		local victim_poz = hVictim:GetAbsOrigin()
		local friendly_in_range = false
		local enemy_in_range = false

		for hID = 0, 9 do
			local hHero = HeroList:GetHero(hID)
			local team = hHero:GetTeam()
			local pos = hHero:GetAbsOrigin()
			local dist = dist2(pos, victim_poz)
			if team == attacker_team then
				-- print(hID, pos, victim_poz, dist)
				if dist < sqr(750) then
					friendly_in_range = true
				end
			end
			if team == other_team then
				if dist < sqr(1200) then
					enemy_in_range = true
				end
			end
		end

		if hAttacker:IsChanneling() then
			return
		end
		for tier = 1, 5 do
			local time_is_right = (DROP_TIMES[tier] * 60 < GameRules:GetDOTATime(false, false))
			local potential_drop = NeutralItems:GetPotentialNeutralItemDrop(tier, attacker_team)
			if potential_drop ~= nil and friendly_in_range and (not enemy_in_range) and time_is_right then
				local rng = RandomInt(1, 1000)
				local item_tier = GetNeutralItemTier(potential_drop)
				if rng <= drop_probability * 1000 then
					print(neutral_items_in_game)
					DropNeutralItemAtPositionForHero(potential_drop, victim_poz, hAttacker, item_tier, true)
					NeutralItems:AddNeutralItemToHero(hAttacker, potential_drop)
					return
				end
			end
		end
	end

	-- check drop conditions
	-- attacker is near, and it is not an illusion 750radius 
	-- attacker not channeling TP or boots
	-- no enemy hero is near
	-- The team of the unit is neutral
	-- check drop probability (is ancient, triple the probability)
	-- drop the item

end

