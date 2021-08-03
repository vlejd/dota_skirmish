-- source https://youtu.be/YCn7_C_CRKU?t=3667
local GameState = {
	game = {
		time = 45*60+11, --45*60+11
	},
    buildings = {
		-- name, health -1 is full hp, this is default
		{
			name = "dota_badguys_tower1_top",
			health = 0, 
		},
		{
			name = "dota_badguys_tower2_top",
			health = 0,
		},
		{
			name = "dota_badguys_tower3_top",
			health = 1613,
		},
		{
			name = "dota_badguys_tower1_mid",
			health = 0,
		},
		{
			name = "dota_badguys_tower2_mid",
			health = 0,
		},
		{
			name = "dota_badguys_tower3_mid",
			health = 0,
		},
		{
			name = "dota_badguys_tower1_bot",
			health = 0, 
		},
		{
			name = "dota_badguys_tower2_bot",
			health = 1911, 
		},
		{
			name = "bad_rax_range_mid",
			health = 331, 
		},
		{
			name = "dota_goodguys_tower1_top",
			health = 0, 
		},
		{
			name = "dota_goodguys_tower1_mid",
			health = 0,
		},
		{
			name = "dota_goodguys_tower2_mid",
			health = 0,
		},
		{
			name = "dota_goodguys_tower3_mid",
			health = 0,
		},

		{
			name = "dota_goodguys_tower1_bot",
			health = 0,
		},		
		{
			name = "dota_goodguys_tower2_bot",
			health = 0,
		},
		{
			name = "dota_goodguys_tower3_bot",
			health = 0,
		},
		{
			name = "good_rax_range_bot",
			health = 756,
		},
		{
			name = "good_rax_melee_bot",
			health = 1987,
		},
		{
			name = "good_rax_range_mid",
			health = 0,
		},
		{
			name = "good_rax_melee_mid",
			health = 0,
		},
		-- badguys_melee_rax_mid is the name in the npc_units.txt  ,, bad_rax_melee_mid



	},
	heroes = {
		--gold_unreliable = 0,
		grimstroke = {
			name = "grimstroke",
			team = DOTA_TEAM_GOODGUYS,
			gold_reliable = 818,
			position = Vector(-3577,-6127,0),
			level = 25,
			abilities = {4,4,4,0,0,3,0,0,0,0},
			cooldowns = {0,0,0,0,0,0,0,0,0,0},
			items = {
				"item_ghost", "item_tranquil_boots", "item_force_staff", "item_aether_lens", "item_ward_observer", "item_ward_sentry", "item_ward_sentry", 
				"item_ward_sentry", "item_blink", "item_magic_wand", "item_ninja_gear", "item_tpscroll", "item_tpscroll"
			},
			talents = {
				7,8,11,12
			}
		},
		mirana = {
			name = "mirana",
			team = DOTA_TEAM_GOODGUYS,
			gold_reliable = 3248,
			position = Vector(-4065,-61,0),
			--position = Vector(3479,3923,0),
			level = 24,
			abilities = {4,4,4,0,0,3,0,0,0,0},
			cooldowns = {0,0,0,0,0,0,0,0,0,0},
			items = {
				"item_lotus_orb", "item_force_staff", "item_ward_observer", "item_ward_observer", "item_ward_sentry", "item_ward_sentry", 
				"item_smoke_of_deceit", "item_guardian_greaves", "item_bullwhip", "item_tpscroll", "item_tpscroll", "item_tpscroll" -- 65s tpscrol
			},
			talents = {
				7,8,10
			}
		},
		ember_spirit = {
			name = "ember_spirit",
			team = DOTA_TEAM_GOODGUYS,
			gold_reliable = 3179,
			position = Vector(-4065,-61,0),
			level = 27,
			abilities = {4,4,4,0,0,3,0,0,0,0},
			cooldowns = {0,0,0,0,0,0,0,0,0,0},
			items = {
				"item_maelstrom", "item_ethereal_blade", "item_black_king_bar", "item_phase_boots", "item_bottle", 
				"item_ultimate_scepter", "item_platemail", "item_timeless_relic", "item_tpscroll" -- bottled regen
			},		
			talents = {
				6,7,8,10,12,
			}
		},
		mars = {
			name = "mars",
			team = DOTA_TEAM_GOODGUYS,
			gold_reliable = 2737,
			position = Vector(-4065,-61,0),
			level = 24,
			abilities = {4,4,4,0,0,3,0,0,0,0},
			cooldowns = {0,0,0,0,0,0,0,0,0,0},
			items = {
				"item_blink", "item_phase_boots", " item_magic_stick", "item_solar_crest", "item_platemail", "item_black_king_bar", 
				"item_dust", "item_orb_of_destruction", "item_tpscroll,item_tpscroll,item_tpscroll,item_tpscroll"
			},
			talents = {
				6,9,11,
			}
		},
		bloodseeker = {
			name = "bloodseeker",
			team = DOTA_TEAM_GOODGUYS,
			gold_reliable = 3605,
			position = Vector(-4065,-61,0),
			level = 27,
			abilities = {4,4,4,0,0,3,0,0,0,0},
			cooldowns = {0,0,0,0,0,0,0,0,0,0},
			items = {
				"item_phase_boots", "item_black_king_bar", "item_sange_and_yasha", "item_basher", "item_butterfly", "item_mjollnir", 
				"item_the_leveller", "item_minotaur_horn", "item_tpscroll", "item_tpscroll", "item_tpscroll", "item_tpscroll"
			},
			talents = {
				6,7,8,11,13
			}
		},
		brewmaster = {
			name = "brewmaster",
			team = DOTA_TEAM_BADGUYS,
			gold_reliable = 2239,
			position = Vector(2479,3923,0),
			level = 23,
			abilities = {4,4,4,0,0,3,0,0,0,0},
			cooldowns = {0,0,0,0,0,0,0,0,0,0},
			items = {
				"item_gem", "item_ultimate_scepter", "item_vladmir", "item_magic_stick", "item_ward_observer", "item_ward_sentry", "item_ward_sentry", "item_ward_sentry", "item_tranquil_boots", "item_dust", "item_dust", "item_flask", "item_flask", "item_cloak_of_flames", "item_tpscroll" --tp (57s)
			},
			talents = {
				7,9,10
			}
		},
		juggernaut = {
			name = "juggernaut",
			team = DOTA_TEAM_BADGUYS,
			gold_reliable = 2697,
			--position = Vector(2479,3923,0),
			position = Vector(-3577,-6127,0),
			level = 25,
			--abilities = {4,4,4,0,0,3,0,0,0,0},
			abilities = {},
			--cooldowns = {0,0,0,0,0,0,0,0,0,0},
			cooldowns = {},
			items = {
				"item_phase_boots", "item_ultimate_scepter", "item_maelstrom", "item_magic_wand", "item_skadi", "item_sange_and_yasha", "item_bottle", "item_minotaur_horn", "item_tpscroll", "item_tpscroll", "item_tpscroll", "item_tpscroll"
			},
			talents = {
				0,0,0,0,1,1,1,1,2,2,2,2,3,5,5,5,6,8,11,13
			}
		},
		dark_seer = {
			name = "dark_seer",
			team = DOTA_TEAM_BADGUYS,
			gold_reliable = 2783,
			position = Vector(2479,3923,0),
			level = 25,
			abilities = {4,4,4,0,0,3,0,0,0,0},
			cooldowns = {0,0,0,0,0,0,0,0,0,0},
			items = {
				"item_solar_crest", "item_guardian_greaves", "item_magic_wand", "item_soul_ring", "item_recipe_pipe", "item_ultimate_scepter", "item_quicksilver_amulet", "item_tpscroll" --tp(47s)
			},
			talents = {
				6,8,11,12
			}
		},
		rattletrap = {
			name = "rattletrap",
			team = DOTA_TEAM_BADGUYS,
			gold_reliable = 171,
			position = Vector(2479,3923,0),
			level = 24,
			abilities = {4,4,4,0,0,3,0,0,0,0},
			cooldowns = {0,0,0,0,0,0,0,0,0,0},
			items = {
				"item_ultimate_scepter", "item_urn_of_shadows", "item_black_king_bar", "item_tranquil_boots", "item_cloak", "item_smoke_of_deceit", "item_dust", "item_dust", "item_ceremonial_robe", "item_tpscroll"	--urn 2		
			},
			talents = {
				6,9,10
			}
		},
		drow_ranger = {
			name = "drow_ranger",
			team = DOTA_TEAM_BADGUYS,
			gold_reliable = 2950,
			position = Vector(2479,3923,0),
			level = 27,
			abilities = {4,4,4,0,0,3,0,0,0,0},
			cooldowns = {0,0,0,0,0,0,0,0,0,0},
			items = {
				"item_manta", "item_power_treads", "item_blink", "item_butterfly", "item_hurricane_pike", "item_black_king_bar", "item_smoke_of_deceit", "item_clarity", "item_illusionsts_cape", "item_tpscroll", "item_tpscroll" --tp 16s
			},
			talents = {
				6,7,9,10,13
			}

		},
	},
	creeps = {
		{
			name = "npc_dota_creep_goodguys_ranged",
			position = Vector(-2194, 6099),
			team = DOTA_TEAM_GOODGUYS,
			waypoint = "lane_top_pathcorner_goodguys_3",
		},
		{
			name = "npc_dota_creep_goodguys_ranged",
			position = Vector(-2144, 6099),
			team = DOTA_TEAM_GOODGUYS,
			waypoint = "lane_top_pathcorner_goodguys_3",
		},
		{
			name = "npc_dota_creep_goodguys_melee",
			position = Vector(-2114, 6099),
			team = DOTA_TEAM_GOODGUYS,
			waypoint = "lane_top_pathcorner_goodguys_3",
		},
		{
			name = "npc_dota_creep_goodguys_melee",
			position = Vector(-2114, 6099),
			team = DOTA_TEAM_GOODGUYS,
			waypoint = "lane_top_pathcorner_goodguys_3",
		},
		{
			name = "npc_dota_creep_goodguys_melee",
			position = Vector(-2114, 6099),
			team = DOTA_TEAM_GOODGUYS,
			waypoint = "lane_top_pathcorner_goodguys_3",
		},
		{
			name = "npc_dota_creep_goodguys_melee",
			position = Vector(-2114, 6099),
			team = DOTA_TEAM_GOODGUYS,
			waypoint = "lane_top_pathcorner_goodguys_3",
		},
		{
			name = "npc_dota_creep_goodguys_melee",
			position = Vector(-2114, 6099),
			team = DOTA_TEAM_GOODGUYS,
			waypoint = "lane_top_pathcorner_goodguys_3",
		},
		{
			name = "npc_dota_badguys_siege",
			position = Vector(-264,5904),
			team = DOTA_TEAM_BADGUYS,
			waypoint = "lane_top_pathcorner_badguys_6",
		},


	},
	roshan = {
		deaths = 2,
	},
	wincon = nil --{time = 100, default_winner = DOTA_TEAM_GOODGUYS}
} 

return GameState
--[[
goodguys
grim at -3577,-6127, rest x=-4065&y=-61
grimstroke 25, 818, item_ghost, item_tranquil_boots, item_force_staff, item_aether_lens, item_ward_observer, item_ward_sentry, item_ward_sentry, item_ward_sentry, item_blink, item_magic_wand, item_ninja_gear, item_tpscroll, item_tpscroll 
mirana 24, 3248, item_lotus_orb, item_force_staff, item_ward_observer, item_ward_observer, item_ward_sentry, item_ward_sentry, item_smoke_of_deceit, item_guardian_greaves, item_bullwhip, item_tpscroll, item_tpscroll, item_tpscroll (65s)
ember_spirit 27, 3179, item_maelstrom, item_ethereal_blade, item_black_king_bar, item_phase_boots, item_bottle (regen), item_ultimate_scepter, item_platemail, item_timeless_relic, item_tpscroll
mars 24, 2737, item_blink, item_phase_boots,  item_magic_stick, item_solar_crest, item_platemail, item_black_king_bar, item_dust, item_orb_of_destruction, item_tpscroll,item_tpscroll,item_tpscroll,item_tpscroll
bloodseeker 27, 3605, item_phase_boots, item_black_king_bar, item_sange_and_yasha, item_basher, item_butterfly, item_mjollnir, item_the_leveller, item_minotaur_horn, item_tpscroll,item_tpscroll,item_tpscroll,item_tpscroll

badguys
everyone x=2479&y=3923
brewmaster 23, 2239, item_gem, item_ultimate_scepter, item_vladmir, item_magic_stick, item_ward_observer,item_ward_sentry, item_ward_sentry, item_ward_sentry, item_tranquil_boots, item_dust, item_dust, item_flask, item_flask, item_cloak_of_flames, item_tpscroll (57s)
juggernaut, 25, 2697, item_phase_boots, item_ultimate_scepter, item_maelstrom, item_magic_wand, item_skadi, item_sange_and_yasha, item_bottle, item_minotaur_horn, item_tpscroll, item_tpscroll, item_tpscroll, item_tpscroll
dark_seer, 25, 2783, item_solar_crest, item_guardian_greaves, item_magic_wand, item_soul_ring, item_recipe_pipe, item_ultimate_scepter, item_quicksilver_amulet, item_tpscroll (47s) 
rattletrap, 24, 171, item_ultimate_scepter, item_urn_of_shadows (2), item_black_king_bar, item_tranquil_boots, item_cloak, item_smoke_of_deceit, item_dust, item_dust, item_ceremonial_robe, item_tpscroll
drow_ranger, 27, 2950, item_manta, item_power_treads, item_blink, item_butterfly, item_hurricane_pike, item_black_king_bar, item_smoke_of_deceit, item_clarity, item_illusionsts_cape, item_tpscroll, item_tpscroll (19s)
]]--