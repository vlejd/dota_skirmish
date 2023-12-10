local GameState = {
	game = {
	  time = 1150
	},
	buildings = { {
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
	  health = 1029
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
	} },
	heroes = {
	  bane = {
		name = "bane",
		kills = 2,
		assists = 3,
		deaths = 2,
		total_xp = 3940,
		respawn_time = -1,
		is_dead = false,
		team = 2,
		gold_reliable = 909,
		gold_unreliable = 243,
		level = 8,
		position = { -1288.75, -6462.875 },
		cooldowns = { 0, 11.210010528564453, 6.699982643127441, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_arcane_boots", "item_clarity", "item_magic_stick", "item_ward_sentry", "item_ward_observer", "item_wind_lace", "item_tpscroll", "item_philosophers_stone" },
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0, 1, 1, 2, 2, 2, 2, 5, 6, 16 }
	  },
	  tiny = {
		name = "tiny",
		kills = 0,
		assists = 1,
		deaths = 1,
		total_xp = 11612,
		respawn_time = -1,
		is_dead = false,
		team = 3,
		gold_reliable = 76,
		gold_unreliable = 0,
		level = 15,
		position = { 1189, -6232.09375 },
		cooldowns = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_invis_sword", "item_soul_ring", "item_power_treads", "item_quelling_blade", "item_echo_sabre", "item_lesser_crit", "item_tpscroll", "item_tpscroll", "item_ring_of_aquila", "item_recipe_silver_edge" },
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 2, 5, 5, 6, 6, 6, 6, 8, 9, 16 }
	  },
	  ember_spirit = {
		name = "ember_spirit",
		kills = 0,
		assists = 0,
		deaths = 0,
		total_xp = 11442,
		respawn_time = -1,
		is_dead = false,
		team = 2,
		gold_reliable = 151,
		gold_unreliable = 295,
		level = 15,
		position = { -668.40625, -6386.15625 },
		cooldowns = { 7.710017681121826, 3.7000021934509277, 33.4000244140625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_phase_boots", "item_branches", "item_bottle", "item_quelling_blade", "item_cyclone", "item_maelstrom", "item_tpscroll", "item_pogo_stick" },
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 5, 6, 8, 15, 16 }
	  },
	  magnataur = {
		name = "magnataur",
		kills = 2,
		assists = 1,
		deaths = 0,
		total_xp = 7814,
		respawn_time = -1,
		is_dead = false,
		team = 2,
		gold_reliable = 929,
		gold_unreliable = 700,
		level = 12,
		position = { -1148.6875, -6183.3125 },
		cooldowns = { 1.9999984502792358, 7.3000006675720215, 14.299978256225586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_arcane_boots", "item_blink", "item_magic_wand", "item_quelling_blade", "item_headdress", "item_ogre_axe", "item_tpscroll", "item_paintball", "item_gauntlets" },
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 5, 6, 15, 16 }
	  },
	  terrorblade = {
		name = "terrorblade",
		kills = 0,
		assists = 1,
		deaths = 1,
		total_xp = 8770,
		respawn_time = -1,
		is_dead = false,
		team = 2,
		gold_reliable = 162,
		gold_unreliable = 642,
		level = 13,
		position = { -259.8125, -5975.4375 },
		cooldowns = { 0, 0, 0., 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_magic_wand", "item_power_treads", "item_ultimate_orb", "item_falcon_blade", "item_yasha", "item_point_booster", "item_ring_of_aquila", "item_quelling_blade" },
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 7, 15, 16 }
	  },
	  winter_wyvern = {
		name = "winter_wyvern",
		kills = 0,
		assists = 1,
		deaths = 2,
		total_xp = 5714,
		respawn_time = 30,
		is_dead = true,
		team = 2,
		gold_reliable = 19,
		gold_unreliable = 0,
		level = 10,
		position = { -481.34375, -6474.1875 },
		cooldowns = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_dust", "item_arcane_boots", "item_magic_stick", "item_ward_sentry", "item_smoke_of_deceit", "item_blink", "item_tpscroll", "item_tpscroll", "item_tpscroll", "item_broom_handle" },
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0, 0, 0, 1, 1, 1, 1, 2, 5, 15, 16 }
	  },
	  enchantress = {
		name = "enchantress",
		kills = 1,
		assists = 2,
		deaths = 2,
		total_xp = 5443,
		respawn_time = -1,
		is_dead = false,
		team = 3,
		gold_reliable = 405,
		gold_unreliable = 694,
		level = 9,
		position = { 259.53125, -5656.9375 },
		cooldowns = { 5.100000858306885, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_fluffy_hat", "item_magic_wand", "item_medallion_of_courage", "item_flask", "item_boots", "item_possessed_mask", "item_clarity" },
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0, 1, 1, 1, 2, 2, 2, 2, 5, 15, 16 }
	  },
	  lycan = {
		name = "lycan",
		kills = 2,
		assists = 1,
		deaths = 0,
		total_xp = 7156,
		respawn_time = -1,
		is_dead = false,
		team = 3,
		gold_reliable = 97,
		gold_unreliable = 365,
		level = 11,
		position = { 32.59375, -5790.75 },
		cooldowns = { 14.499940872192383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_helm_of_the_overlord", "item_ogre_axe", "item_quelling_blade", "item_tpscroll", "item_ocean_heart" },
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0, 0, 0, 0, 1, 2, 2, 2, 2, 5, 7, 15, 16 }
	  },
	  kunkka = {
		name = "kunkka",
		kills = 1,
		assists = 2,
		deaths = 0,
		total_xp = 11674,
		respawn_time = -1,
		is_dead = false,
		team = 3,
		gold_reliable = 430,
		gold_unreliable = 850,
		level = 15,
		position = { -658.03125, -6265.25 },
		cooldowns = { 3.9999890327453613, 0.10000156611204147, 3.399989604949951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_phase_boots", "item_bottle", "item_heavens_halberd", "item_armlet", "item_magic_wand", "item_tpscroll", "item_broom_handle" },
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 6, 6, 6, 6, 7, 9, 16 }
	  },
	  skywrath_mage = {
		name = "skywrath_mage",
		kills = 1,
		assists = 4,
		deaths = 1,
		total_xp = 5635,
		respawn_time = 30,
		is_dead = true,
		team = 3,
		gold_reliable = 353,
		gold_unreliable = 282,
		level = 10,
		position = { -944.59375, -6087.34375 },
		cooldowns = { 0, 3.9100022315979004, 5.110004901885986, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_arcane_boots", "item_dust", "item_magic_wand", "item_circlet", "item_void_stone", "item_tpscroll", "item_tpscroll", "item_tpscroll", "item_keen_optic" },
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0, 0, 0, 0, 1, 2, 2, 2, 2, 5, 15, 16 }
	  }
	},
	outposts = { {
	  name = "npc_dota_watch_tower_bottom",
	  team = 2
	}, {
	  name = "npc_dota_watch_tower_top",
	  team = 3
	} },
	creeps = { {
	  name = "npc_dota_creep_badguys_ranged",
	  team = 3,
	  waypoint = "",
	  position = { 2605.375, -6072.3125 }
	}, {
	  name = "npc_dota_creep_badguys_ranged",
	  team = 3,
	  waypoint = "",
	  position = { -866.46875, -597.28125 }
	}, {
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { -3625.6875, 5935.09375 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 2152.8125, -6176.28125 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -3334.84375, 5969.4375 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 2374.0625, -6125.5625 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { -1171.96875, -884.21875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -3469.71875, 5954.4375 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 2277.78125, -6148.75 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -3063.375, 6009.875 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 2523.71875, -6096.3125 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { -1077.78125, -899.8125 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -3212.78125, 5986.375 }
	}, {
	  name = "npc_dota_creep_badguys_ranged",
	  team = 3,
	  waypoint = "",
	  position = { 2040.15625, 1461.03125 }
	}, {
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { -2775.71875, -2548.90625 }
	}, {
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { -6492.1875, -975.5625 }
	}, {
	  name = "npc_dota_creep_badguys_ranged",
	  team = 3,
	  waypoint = "",
	  position = { 22.59375, 5927.1875 }
	}, {
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { -1173, -6366.9375 }
	}, {
	  name = "npc_dota_creep_badguys_ranged",
	  team = 3,
	  waypoint = "",
	  position = { 6555.625, 623.96875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -2464.1875, -2163.78125 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 1686.28125, 1228.21875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -6572.375, -759.5 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { -215.3125, 5864.15625 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -749.40625, -6171.75 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 6574.125, 443.40625 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 1589.90625, 1158.9375 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -2614.4375, -2327.625 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -6567.84375, -663.9375 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { -45.40625, 5785.71875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -2542.9375, -2245.75 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 1855.8125, 1337.375 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -782.78125, -6305.21875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -6495.5, -670.8125 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 6542.40625, 196.625 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -2721.96875, -2444.46875 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 1773.125, 1285.0625 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -6469.4375, -573.8125 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { -317.40625, 5919.4375 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -741.21875, -6366.3125 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 6574.1875, 334.125 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { -81.59375, 5928.4375 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -787.78125, -6233.03125 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 6552.75, 545.03125 }
	}, {
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { -3648, -6112 }
	}, {
	  name = "npc_dota_creep_badguys_ranged",
	  team = 3,
	  waypoint = "",
	  position = { 4096, 3584 }
	}, {
	  name = "npc_dota_creep_badguys_ranged",
	  team = 3,
	  waypoint = "",
	  position = { 6272, 3648 }
	}, {
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { -5008, -4488 }
	}, {
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { -6624, -4064 }
	}, {
	  name = "npc_dota_creep_badguys_ranged",
	  team = 3,
	  waypoint = "",
	  position = { 3168, 5792 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -3637.0625, -6049.96875 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 4106.9375, 3646.03125 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 6212.78125, 3626.4375 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -4959.75, -4447.53125 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -6655.5, -4009.46875 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 4036.78125, 3562.4375 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -3707.21875, -6090.46875 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 3231, 5792 }
	} },
	wards = { {
	  type = "npc_dota_sentry_wards",
	  team = 3,
	  position = { -2012.875, 1285.8125 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 2,
	  position = { -43.71875, -5038.59375 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 2,
	  position = { -1195.03125, -5108.375 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 3,
	  position = { -5670.53125, 3195.25 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 3,
	  position = { -4122.3125, 1522 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 3,
	  position = { 5919.125, -3442.90625 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 2,
	  position = { -3688.9375, -1166.9375 }
	}, {
	  type = "npc_dota_observer_wards",
	  team = 3,
	  position = { 1311.5, -2268.3125 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 3,
	  position = { 1875.84375, -5536.375 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 2,
	  position = { 2850.84375, -5140.96875 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 2,
	  position = { -1195.59375, -2772.78125 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 2,
	  position = { -3911.75, 490.71875 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 3,
	  position = { 2821.5625, -3102.53125 }
	}, {
	  type = "npc_dota_observer_wards",
	  team = 3,
	  position = { 1221.5625, -5150.4375 }
	} },
	roshan = {
	  deaths = 0,
	  alive = true,
	  last_tick = -36000,
	  time_since_death = 3219.3
	},
	neutrals = {
	  good = { "item_chipped_vest", "item_arcane_ring", "item_ocean_heart", "item_misericorde" },
	  bad = { "item_chipped_vest", "item_dragon_scale", "item_essence_ring", "item_philosophers_stone" }
	},
	wincon = { }
  }
return GameState
