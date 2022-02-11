local GameState = {
	game = {
		time = 1227
	},
	buildings = {{
		name = "dota_goodguys_tower3_bot",
		health = 2500
	}, {
		name = "dota_goodguys_tower3_mid",
		health = 2500
	}, {
		name = "dota_goodguys_tower3_top",
		health = 2500
	}, {
		name = "dota_goodguys_tower2_bot",
		health = 2146
	}, {
		name = "dota_goodguys_tower2_mid",
		health = 2353
	}, {
		name = "dota_goodguys_tower2_top",
		health = 2500
	}, {
		name = "dota_goodguys_tower1_top",
		health = 1800
	}, {
		name = "dota_goodguys_tower4_top",
		health = 2600
	}, {
		name = "good_rax_melee_mid",
		health = 2200
	}, {
		name = "good_rax_range_mid",
		health = 1300
	}, {
		name = "good_rax_melee_bot",
		health = 2200
	}, {
		name = "good_rax_range_bot",
		health = 1300
	}, {
		name = "good_rax_melee_top",
		health = 2200
	}, {
		name = "good_rax_range_top",
		health = 1300
	}, {
		name = "bad_rax_melee_bot",
		health = 2200
	}, {
		name = "bad_rax_range_bot",
		health = 1300
	}, {
		name = "bad_rax_range_mid",
		health = 1300
	}, {
		name = "bad_rax_melee_mid",
		health = 2200
	}, {
		name = "bad_rax_melee_top",
		health = 2200
	}, {
		name = "bad_rax_range_top",
		health = 1300
	}, {
		name = "dota_badguys_fort",
		health = 4500
	}, {
		name = "dota_goodguys_fort",
		health = 4500
	}, {
		name = "dota_badguys_tower4_top",
		health = 2600
	}, {
		name = "dota_badguys_tower2_top",
		health = 2474
	}, {
		name = "dota_badguys_tower2_mid",
		health = 2500
	}, {
		name = "dota_badguys_tower1_mid",
		health = 590
	}, {
		name = "dota_badguys_tower2_bot",
		health = 2500
	}, {
		name = "dota_badguys_tower3_bot",
		health = 2500
	}, {
		name = "dota_badguys_tower3_top",
		health = 2500
	}, {
		name = "dota_badguys_tower3_mid",
		health = 2500
	}, {
		name = "dota_badguys_tower4_bot",
		health = 2600
	}, {
		name = "dota_goodguys_tower4_bot",
		health = 2600
	}, {
		name = "dota_badguys_tower1_bot",
		health = 914
	}, {
		name = "npc_dota_watch_tower_bottom",
		health = 450
	}, {
		name = "npc_dota_watch_tower_top",
		health = 450
	}, {
		name = "dota_badguys_tower1_top",
		health = 0
	}, {
		name = "dota_goodguys_tower1_mid",
		health = 0
	}, {
		name = "dota_goodguys_tower1_bot",
		health = 0
	}},
	heroes = {
		winter_wyvern = {
			name = "winter_wyvern",
			kills = 0,
			assists = 1,
			deaths = 2,
			total_xp = 5839,
			respawn_time = -1,
			is_dead = false,
			team = 2,
			gold_reliable = 105,
			gold_unreliable = 0,
			level = 10,
			position = {-3253.6875, 3299.40625},
			cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			items = {"item_dust", "item_arcane_boots", "item_magic_stick", "item_blink", "item_smoke_of_deceit", "item_tpscroll",
            "item_tpscroll", "item_broom_handle"},
			has_shard = false,
			has_ags = false,
			has_moon_shard = false,
			talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 5, 15, 16}
		},
		terrorblade = {
			name = "terrorblade",
			kills = 0,
			assists = 4,
			deaths = 1,
			total_xp = 11116,
			respawn_time = -1,
			is_dead = false,
			team = 2,
			gold_reliable = 19,
			gold_unreliable = 99,
			level = 15,
			position = {-24.25, -4252.59375},
			cooldowns = {0, 8.699972152709961, 77.20924377441406, 0, 0, 9.500646591186523, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			items = {"item_magic_wand", "item_power_treads", "item_ultimate_orb", "item_falcon_blade", "item_yasha",
            "item_point_booster", "item_ring_of_aquila", "item_quelling_blade"},
			has_shard = false,
			has_ags = false,
			has_moon_shard = false,
			talents = {0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 7, 8, 15, 16}
		},
		ember_spirit = {
			name = "ember_spirit",
			kills = 1,
			assists = 2,
			deaths = 0,
			total_xp = 13502,
			respawn_time = -1,
			is_dead = false,
			team = 2,
			gold_reliable = 287,
			gold_unreliable = 1500,
			level = 16,
			position = {-6109.40625, 3269.59375},
			cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			items = {"item_phase_boots", "item_bottle", "item_quelling_blade", "item_cyclone", "item_maelstrom", "item_tpscroll",
            "item_pogo_stick"},
			has_shard = false,
			has_ags = false,
			has_moon_shard = false,
			talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 5, 5, 6, 8, 15, 16}
		},
		bane = {
			name = "bane",
			kills = 2,
			assists = 4,
			deaths = 3,
			total_xp = 4017,
			respawn_time = -1,
			is_dead = false,
			team = 2,
			gold_reliable = 760,
			gold_unreliable = 21,
			level = 8,
			position = {-3258.34375, -418.1875},
			cooldowns = {0, 2.699978828430176, 0, 0, 0, 42.511199951171875, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			items = {"item_arcane_boots", "item_clarity", "item_magic_stick", "item_ward_sentry", "item_ward_observer",
            "item_wind_lace", "item_tpscroll", "item_tpscroll", "item_philosophers_stone", "item_recipe_aether_lens",
            "item_tome_of_knowledge"},
			has_shard = false,
			has_ags = false,
			has_moon_shard = false,
			talents = {0, 1, 1, 2, 2, 2, 2, 5, 6, 16}
		},
		kunkka = {
			name = "kunkka",
			kills = 1,
			assists = 3,
			deaths = 1,
			total_xp = 12358,
			respawn_time = -1,
			is_dead = false,
			team = 3,
			gold_reliable = 227,
			gold_unreliable = 438,
			level = 16,
			position = {863.65625, -106.78125},
			cooldowns = {3.399989604949951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			items = {"item_phase_boots", "item_bottle", "item_ogre_axe", "item_heavens_halberd", "item_armlet",
            "item_magic_wand", "item_tpscroll", "item_broom_handle"},
			has_shard = false,
			has_ags = false,
			has_moon_shard = false,
			talents = {0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 6, 6, 6, 6, 7, 9, 16}
		},
		lycan = {
			name = "lycan",
			kills = 4,
			assists = 1,
			deaths = 0,
			total_xp = 9987,
			respawn_time = -1,
			is_dead = false,
			team = 3,
			gold_reliable = 233,
			gold_unreliable = 725,
			level = 14,
			position = {-1894.84375, 4465.25},
			cooldowns = {8.899919509887695, 9.199966430664062, 0, 0, 0, 43.90123748779297, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			items = {"item_helm_of_the_overlord", "item_ogre_axe", "item_staff_of_wizardry", "item_quelling_blade",
            "item_tpscroll", "item_ocean_heart"},
			has_shard = false,
			has_ags = false,
			has_moon_shard = false,
			talents = {0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 2, 5, 5, 7, 15, 16}
		},
		magnataur = {
			name = "magnataur",
			kills = 3,
			assists = 3,
			deaths = 1,
			total_xp = 9327,
			respawn_time = -1,
			is_dead = false,
			team = 2,
			gold_reliable = 737,
			gold_unreliable = 0,
			level = 13,
			position = {-4713, 2222.125},
			cooldowns = {0, 4.600003242492676, 0, 0, 0, 46.211151123046875, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			items = {"item_arcane_boots", "item_blink", "item_magic_wand", "item_quelling_blade", "item_headdress",
            "item_ogre_axe", "item_tpscroll", "item_paintball", "item_smoke_of_deceit", "item_gauntlets"},
			has_shard = false,
			has_ags = false,
			has_moon_shard = false,
			talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 3, 5, 6, 15, 16}
		},
		tiny = {
			name = "tiny",
			kills = 0,
			assists = 2,
			deaths = 2,
			total_xp = 11752,
			respawn_time = -1,
			is_dead = false,
			team = 3,
			gold_reliable = 212,
			gold_unreliable = 211,
			level = 15,
			position = {3763.375, -751.03125},
			cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			items = {"item_silver_edge", "item_soul_ring", "item_power_treads", "item_quelling_blade", "item_echo_sabre",
            "item_tpscroll", "item_tpscroll", "item_ring_of_aquila", "item_misericorde"},
			has_shard = false,
			has_ags = false,
			has_moon_shard = false,
			talents = {0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 2, 5, 5, 6, 6, 6, 6, 8, 9, 16}
		},
		skywrath_mage = {
			name = "skywrath_mage",
			kills = 1,
			assists = 4,
			deaths = 1,
			total_xp = 6848,
			respawn_time = -1,
			is_dead = false,
			team = 3,
			gold_reliable = 96,
			gold_unreliable = 0,
			level = 11,
			position = {102.0625, 1207.1875},
			cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			items = {"item_aether_lens", "item_dust", "item_magic_wand", "item_circlet", "item_boots", "item_tpscroll",
            "item_tpscroll", "item_tpscroll", "item_philosophers_stone"},
			has_shard = false,
			has_ags = false,
			has_moon_shard = false,
			talents = {0, 0, 0, 0, 1, 2, 2, 2, 2, 5, 6, 15, 16}
		},
		enchantress = {
			name = "enchantress",
			kills = 1,
			assists = 2,
			deaths = 3,
			total_xp = 5483,
			respawn_time = -1,
			is_dead = false,
			team = 3,
			gold_reliable = 228,
			gold_unreliable = 0,
			level = 9,
			position = {1498.375, 2126.40625},
			cooldowns = {0, 14.899980545043945, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			items = {"item_holy_locket", "item_medallion_of_courage", "item_boots", "item_ward_sentry", "item_ward_observer",
            "item_tpscroll", "item_possessed_mask", "item_clarity"},
			has_shard = false,
			has_ags = false,
			has_moon_shard = false,
			talents = {0, 1, 1, 1, 2, 2, 2, 2, 5, 15, 16}
		}
	},
	outposts = {{
		name = "npc_dota_watch_tower_bottom",
		team = 2
	}, {
		name = "npc_dota_watch_tower_top",
		team = 3
	}},
	creeps = {{
		name = "npc_dota_creep_badguys_ranged",
		team = 3,
		waypoint = "",
		position = {-6304.375, 3860.6875}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {6061.78125, -4048.78125}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {6298.21875, -4047.90625}
	}, {
		name = "npc_dota_creep_badguys_ranged",
		team = 3,
		waypoint = "",
		position = {-6334.75, 3840.46875}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {6221.40625, -4049.65625}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {6132.3125, -4032.53125}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {-6471.0625, 3376.4375}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {5997.75, -4015.34375}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {-6417.25, 3425.75}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {-6289.875, 3461.875}
	}, {
		name = "npc_dota_goodguys_siege_upgraded",
		team = 2,
		waypoint = "",
		position = {-6360.3125, 2906.0625}
	}, {
		name = "npc_dota_goodguys_siege_upgraded",
		team = 2,
		waypoint = "",
		position = {4979.40625, -5907.96875}
	}, {
		name = "npc_dota_badguys_siege_upgraded",
		team = 3,
		waypoint = "",
		position = {-869.53125, -731.3125}
	}, {
		name = "npc_dota_badguys_siege_upgraded",
		team = 3,
		waypoint = "",
		position = {-5549.75, 5545.0625}
	}, {
		name = "npc_dota_badguys_siege_upgraded",
		team = 3,
		waypoint = "",
		position = {6038.34375, -3493.0625}
	}, {
		name = "npc_dota_creep_goodguys_ranged",
		team = 2,
		waypoint = "",
		position = {-6300.21875, 2933.375}
	}, {
		name = "npc_dota_creep_goodguys_ranged",
		team = 2,
		waypoint = "",
		position = {4891.84375, -5932.9375}
	}, {
		name = "npc_dota_creep_badguys_ranged",
		team = 3,
		waypoint = "",
		position = {-1299.71875, -951.96875}
	}, {
		name = "npc_dota_creep_badguys_ranged",
		team = 3,
		waypoint = "",
		position = {-5249, 5585.84375}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-6246, 3381.0625}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {5273.96875, -5822.1875}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {-1454.84375, -1124.75}
	}, {
		name = "npc_dota_creep_badguys_ranged",
		team = 3,
		waypoint = "",
		position = {6093.96875, -3534.03125}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {-5069.65625, 5607.8125}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-6404, 3303.59375}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {5085, -5876.71875}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {-1592.9375, -1251.03125}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {6113.6875, -3953.5}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {-5744.46875, 5480.5625}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-6340.15625, 3340.8125}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {4760.875, -5970.25}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {-1399.875, -1028.5}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-6231.84375, 3307.09375}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {-5641.21875, 5532}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {5168.65625, -5852.5625}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {-1522.6875, -1168.375}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {6041.375, -3957.5625}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {-5432.25, 5559.5625}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {6183.53125, -3974.0625}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {6252.6875, -3953.5}
	}, {
		name = "npc_dota_creep_goodguys_ranged",
		team = 2,
		waypoint = "",
		position = {-5008, -4488}
	}, {
		name = "npc_dota_creep_badguys_ranged",
		team = 3,
		waypoint = "",
		position = {4096, 3584}
	}, {
		name = "npc_dota_creep_badguys_ranged",
		team = 3,
		waypoint = "",
		position = {3168, 5792}
	}, {
		name = "npc_dota_creep_badguys_ranged",
		team = 3,
		waypoint = "",
		position = {6272, 3648}
	}, {
		name = "npc_dota_creep_goodguys_ranged",
		team = 2,
		waypoint = "",
		position = {-3648, -6112}
	}, {
		name = "npc_dota_creep_goodguys_ranged",
		team = 2,
		waypoint = "",
		position = {-6624, -4064}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-5067.21875, -4509.5625}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {4064.5, 3529.4375}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {3178.9375, 5854.03125}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-3637.0625, -6049.96875}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {6240.5, 3593.4375}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-6575.75, -4023.53125}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-4945, -4488}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {4144.25, 3543.5}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {3216.25, 5751.5}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-3599.75, -6152.5}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {6212.78125, 3669.53125}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-6655.5, -4009.46875}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-4997.0625, -4550.0625}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {4144.25, 3624.46875}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {3108.78125, 5813.53125}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-3707.21875, -6133.5625}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {6320.25, 3607.5}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-6683.21875, -4085.5625}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-4997.0625, -4425.96875}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {4064.5, 3638.53125}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {3136.5, 5737.4375}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-3552.09375, -6069.3125}
	}, {
		name = "npc_dota_creep_badguys_melee_upgraded",
		team = 3,
		waypoint = "",
		position = {6302.90625, 3525.84375}
	}, {
		name = "npc_dota_creep_goodguys_melee_upgraded",
		team = 2,
		waypoint = "",
		position = {-6734.84375, -4004.03125}
	}},
	wards = {{
		type = "npc_dota_sentry_wards",
		team = 3,
		position = {-5670.53125, 3195.25}
	}, {
		type = "npc_dota_sentry_wards",
		team = 3,
		position = {-4122.3125, 1522}
	}, {
		type = "npc_dota_sentry_wards",
		team = 3,
		position = {5919.125, -3442.90625}
	}, {
		type = "npc_dota_sentry_wards",
		team = 2,
		position = {-3688.9375, -1166.9375}
	}, {
		type = "npc_dota_observer_wards",
		team = 3,
		position = {1311.5, -2268.3125}
	}, {
		type = "npc_dota_sentry_wards",
		team = 3,
		position = {1875.84375, -5536.375}
	}, {
		type = "npc_dota_sentry_wards",
		team = 2,
		position = {2850.84375, -5140.96875}
	}, {
		type = "npc_dota_sentry_wards",
		team = 2,
		position = {-1195.59375, -2772.78125}
	}, {
		type = "npc_dota_sentry_wards",
		team = 2,
		position = {-3911.75, 490.71875}
	}, {
		type = "npc_dota_sentry_wards",
		team = 3,
		position = {2821.5625, -3102.53125}
	}, {
		type = "npc_dota_observer_wards",
		team = 3,
		position = {1221.5625, -5150.4375}
	}, {
		type = "npc_dota_observer_wards",
		team = 2,
		position = {2012.5625, -788.1875}
	}, {
		type = "npc_dota_sentry_wards",
		team = 2,
		position = {1991.75, -789.40625}
	}, {
		type = "npc_dota_observer_wards",
		team = 2,
		position = {-2830.75, 3532.1875}
	}, {
		type = "npc_dota_sentry_wards",
		team = 2,
		position = {-2830.59375, 3533.34375}
	}},
	roshan = {
		deaths = 0,
		alive = true,
		last_tick = -36000,
		time_since_death = 3295.9666666666667
	},
	neutrals = {
		good = {"item_chipped_vest", "item_arcane_ring", "item_ocean_heart", "item_misericorde", "item_vambrace"},
		bad = {"item_chipped_vest", "item_keen_optic", "item_dragon_scale", "item_essence_ring"}
	},
	wincon = {}
}
return GameState
