local GameState = {
	game = {
	  time = 1030
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
	  health = 2500
	}, {
	  name = "dota_goodguys_tower2_mid",
	  health = 2500
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
	  health = 1255
	}, {
	  name = "dota_badguys_tower2_mid",
	  health = 2500
	}, {
	  name = "dota_badguys_tower2_bot",
	  health = 2383
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
	  name = "npc_dota_watch_tower_bottom",
	  health = 450
	}, {
	  name = "npc_dota_watch_tower_top",
	  health = 450
	}, {
	  name = "dota_badguys_tower1_top",
	  health = 0
	}, {
	  name = "dota_badguys_tower1_mid",
	  health = 0
	}, {
	  name = "dota_badguys_tower1_bot",
	  health = 0
	}, {
	  name = "dota_goodguys_tower1_mid",
	  health = 0
	}, {
	  name = "dota_goodguys_tower1_bot",
	  health = 0
	} },
	heroes = {
		enchantress = {
		name = "enchantress",
		kills = 0,
		assists = 0,
		deaths = 0,
		total_xp = 0,
		respawn_time = -1,
		is_dead = false,
		team = 2,
		gold_reliable = 481,
		gold_unreliable = 0,
		level = 9,
		position = { 6000, -3000 },
		cooldowns = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_power_treads", "item_mekansm", "item_urn_of_shadows"},
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 1,1,1,1,2,2,2,2,5}
	  },
	  juggernaut = {
		name = "juggernaut",
		kills = 0,
		assists = 0,
		deaths = 0,
		total_xp = 0,
		respawn_time = -1,
		is_dead = false,
		team = 2,
		gold_reliable = 412,
		gold_unreliable = 0,
		level = 10,
		position = { 6000, -3000 },
		cooldowns = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_power_treads", "item_soul_ring", "item_magic_wand", "item_tpscroll", "item_ring_of_basilius", "item_vanguard"},
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0,0,0,0,1,1,1,1,5}
	  },
	  rubick = {
		name = "rubick",
		kills = 0,
		assists = 0,
		deaths = 0,
		total_xp = 0,
		respawn_time = -1,
		is_dead = false,
		team = 2,
		gold_reliable = 1300,
		gold_unreliable = 0,
		level = 10,
		position = { 6000, -3000 },
		cooldowns = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_mantle", "item_force_staff", "item_magic_wand", "item_bottle", "item_boots"},
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0,0,0,0,1,1,1,1,2,5}
	  },
	  enigma = {
		name = "enigma",
		kills = 0,
		assists = 0,
		deaths = 0,
		total_xp = 0,
		respawn_time = -1,
		is_dead = false,
		team = 2,
		gold_reliable = 352,
		gold_unreliable = 0,
		level = 9,
		position = { 6000, -3000 },
		cooldowns = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_boots", "item_magic_stick", "item_soul_ring", "item_black_king_bar", "item_tpscroll"},
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0,0,0,0,1,1,1,1,5}
	  },
	  shadow_shaman = {
		name = "shadow_shaman",
		kills = 0,
		assists = 0,
		deaths = 0,
		total_xp = 0,
		respawn_time = -1,
		is_dead = false,
		team = 2,
		gold_reliable = 953,
		gold_unreliable = 0,
		level = 8,
		position = { 6000, -3000 },
		cooldowns = { 0, 0, 0, 0, 0, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_arcane_boots", "item_magic_wand", "item_tpscroll", "item_bracer", "item_ogre_axe"},
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0,0,0,0,1,1,2,5}
	  },

	  tidehunter = {
		name = "tidehunter",
		kills = 1,
		assists = 0,
		deaths = 0,
		total_xp = 0,
		respawn_time = -1,
		is_dead = false,
		team = 3,
		gold_reliable = 539,
		gold_unreliable = 0,
		level = 8,
		position = { 6200, 200 },
		cooldowns = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_boots", "item_bracer", "item_tpscroll", "item_magic_wand"},
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0,0,1,2,2,2,2,5 }
	  },
	  naga_siren = {
		name = "naga_siren",
		kills = 1,
		assists = 0,
		deaths = 0,
		total_xp = 0,
		respawn_time = -1,
		is_dead = false,
		team = 3,
		gold_reliable = 1950,
		gold_unreliable = 0,
		level = 9,
		position = { 6200, 200 },
		cooldowns = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_magic_wand", "item_arcane_boots", "item_poor_mans_shield", "item_tpscroll", "item_vitality_booster" },
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0,0,1,1,2,2,2,2,2,5 }
	  },
	  puck = {
		name = "puck",
		kills = 1,
		assists = 0,
		deaths = 0,
		total_xp = 0,
		respawn_time = -1,
		is_dead = false,
		team = 3,
		gold_reliable = 1414,
		gold_unreliable = 0,
		level = 9,
		position = { 6200, 200 },
		cooldowns = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_magic_wand", "item_bottle", "item_power_treads", "item_mantle", "item_mantle"},
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0,0,0,0,1,1,1,2,5 }
	  },
	  dark_seer = {
		name = "dark_seer",
		kills = 1,
		assists = 0,
		deaths = 0,
		total_xp = 0,
		respawn_time = -1,
		is_dead = false,
		team = 3,
		gold_reliable = 605,
		gold_unreliable = 0,
		level = 9,
		position = { 6200, 200 },
		cooldowns = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_soul_ring", "item_tranquil_boots", "item_poor_mans_shield", "item_mekansm"},
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0,0,0,1,1,1,1,2,2 }
	  },
	  lina = {
		name = "lina",
		kills = 1,
		assists = 0,
		deaths = 0,
		total_xp = 0,
		respawn_time = -1,
		is_dead = false,
		team = 3,
		gold_reliable = 311,
		gold_unreliable = 0,
		level = 7,
		position = { 6200, 200 },
		cooldowns = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		items = { "item_magic_wand", "item_boots", "item_smoke_of_deceit", "item_gauntlets", "item_gauntlets"},
		has_shard = false,
		has_ags = false,
		has_moon_shard = false,
		talents = { 0,0,0,0,1,1,5 }
	  },
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
	  position = { -6308.53125, 4051.90625 }
	}, {
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { -6291.21875, 3213.40625 }
	}, {
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { 6112.28125, -2866.09375 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { -6252.4375, 3644.6875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { 6112.1875, -2465.71875 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { -6322, 3663.6875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -6253.21875, 3551.6875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { 6112.28125, -2703.40625 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { -6394.25, 3675 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { 6112.15625, -2575.03125 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { -6180.46875, 3605.5 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -6388.03125, 3598.875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { 6112.21875, -2367.59375 }
	}, {
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { -2951.90625, -2650.375 }
	}, {
	  name = "npc_dota_creep_badguys_ranged",
	  team = 3,
	  waypoint = "",
	  position = { 6537.5, 959.25 }
	}, {
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { -773.5625, -6434.71875 }
	}, {
	  name = "npc_dota_creep_badguys_ranged",
	  team = 3,
	  waypoint = "",
	  position = { 293.9375, 5973.59375 }
	}, {
	  name = "npc_dota_creep_badguys_ranged",
	  team = 3,
	  waypoint = "",
	  position = { 2300.875, 1654.0625 }
	}, {
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { -6523.4375, -1283.1875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -2802.6875, -2524.15625 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 6489.4375, 810.71875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -671.09375, -6412.5 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 119.53125, 5847.1875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -2870.5625, -2593.625 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 1966.5625, 1364.53125 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -6512.59375, -1112.71875 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 6548.90625, 559.5 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -2667.1875, -2383.28125 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -589.46875, -6427.0625 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 331.8125, 5826.5625 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 6525.65625, 673.3125 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 2048.40625, 1455.15625 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -6492.78125, -1008.5625 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -2735.15625, -2458.96875 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 6566.84375, 480.375 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -460.28125, -6444.0625 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 227.0625, 5852.59375 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 1916.375, 1299.1875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -6497.90625, -907.78125 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -832.15625, -6390.78125 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { -4.40625, 5854.90625 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 2122.28125, 1525.1875 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -6578.46875, -850.65625 }
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
	  name = "npc_dota_creep_goodguys_ranged",
	  team = 2,
	  waypoint = "",
	  position = { -6624, -4064 }
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
	  name = "npc_dota_creep_badguys_ranged",
	  team = 3,
	  waypoint = "",
	  position = { 3168, 5792 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -3679.5, -6166.5625 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 4036.78125, 3605.53125 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -6613.0625, -4001.96875 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 6212.78125, 3669.53125 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -5039.5, -4542.5625 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 4159, 3584 }
	}, {
	  name = "npc_dota_creep_goodguys_melee_upgraded",
	  team = 2,
	  waypoint = "",
	  position = { -3679.5, -6057.46875 }
	}, {
	  name = "npc_dota_creep_badguys_melee_upgraded",
	  team = 3,
	  waypoint = "",
	  position = { 3136.5, 5737.4375 }
	} },
	wards = { {
	  type = "npc_dota_observer_wards",
	  team = 2,
	  position = { 1300.03125, -2284.9375 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 2,
	  position = { 2013.03125, -3344.375 }
	}, {
	  type = "npc_dota_observer_wards",
	  team = 2,
	  position = { 6444.59375, -1468.09375 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 3,
	  position = { 4285.65625, 486.84375 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 3,
	  position = { 2819.8125, -765.25 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 3,
	  position = { -4123.90625, 1531.25 }
	}, {
	  type = "npc_dota_observer_wards",
	  team = 3,
	  position = { -4107.59375, 1520.09375 }
	}, {
	  type = "npc_dota_observer_wards",
	  team = 3,
	  position = { -1809.625, -1302.15625 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 3,
	  position = { -522.9375, -440.84375 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 2,
	  position = { -471, 1248.03125 }
	}, {
	  type = "npc_dota_observer_wards",
	  team = 2,
	  position = { 1430.65625, 1699.8125 }
	}, {
	  type = "npc_dota_observer_wards",
	  team = 3,
	  position = { 513.15625, 4067.9375 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 3,
	  position = { 45.0625, 4329.15625 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 3,
	  position = { -31.15625, 2443.65625 }
	}, {
	  type = "npc_dota_observer_wards",
	  team = 3,
	  position = { -2844.65625, 3594 }
	}, {
	  type = "npc_dota_sentry_wards",
	  team = 2,
	  position = { 3752.84375, 443.625 }
	} },
	roshan = {
	  deaths = 0,
	  alive = true,
	  last_tick = -36000,
	  time_since_death = 3111.8333333333335
	},
	neutrals = {
	  good = { },
	  bad = { }
	},
	wincon = { }
  }

return GameState
