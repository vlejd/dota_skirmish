local GameState = {
    game = {time = 3181},
    buildings = {
        {
            name = "dota_goodguys_tower3_bot",
            health = 2464
        },
        {
            name = "dota_goodguys_tower3_mid",
            health = 909
        },
        {
            name = "dota_goodguys_tower3_top",
            health = 2500
        },
        {
            name = "dota_goodguys_tower2_top",
            health = 2259
        },
        {
            name = "dota_goodguys_tower4_top",
            health = 2600
        },
        {
            name = "good_rax_melee_mid",
            health = 2200
        },
        {
            name = "good_rax_range_mid",
            health = 1300
        },
        {
            name = "good_rax_melee_bot",
            health = 2200
        },
        {
            name = "good_rax_range_bot",
            health = 1300
        },
        {
            name = "good_rax_melee_top",
            health = 2200
        },
        {
            name = "good_rax_range_top",
            health = 1300
        },
        {
            name = "bad_rax_melee_bot",
            health = 2200
        },
        {
            name = "bad_rax_range_bot",
            health = 1300
        },
        {
            name = "bad_rax_melee_top",
            health = 2200
        },
        {
            name = "bad_rax_range_top",
            health = 1300
        },
        {
            name = "dota_badguys_fort",
            health = 4500
        },
        {
            name = "dota_goodguys_fort",
            health = 4500
        },
        {
            name = "dota_badguys_tower4_top",
            health = 2359
        },
        {
            name = "dota_badguys_tower3_bot",
            health = 2500
        },
        {
            name = "dota_badguys_tower3_top",
            health = 127
        },
        {
            name = "dota_badguys_tower4_bot",
            health = 2192
        },
        {
            name = "dota_goodguys_tower4_bot",
            health = 2600
        },
        {
            name = "npc_dota_watch_tower_bottom",
            health = 450
        },
        {
            name = "npc_dota_watch_tower_top",
            health = 450
        },
        {name = "dota_badguys_tower1_top", health = 0},
        {name = "dota_badguys_tower2_top", health = 0},
        {name = "dota_badguys_tower1_mid", health = 0},
        {name = "dota_badguys_tower2_mid", health = 0},
        {name = "dota_badguys_tower3_mid", health = 0},
        {name = "dota_badguys_tower1_bot", health = 0},
        {name = "dota_badguys_tower2_bot", health = 0},
        {name = "bad_rax_range_mid", health = 0},
        {name = "bad_rax_melee_mid", health = 0},
        {name = "dota_goodguys_tower1_top", health = 0},
        {name = "dota_goodguys_tower1_mid", health = 0},
        {name = "dota_goodguys_tower2_mid", health = 0},
        {name = "dota_goodguys_tower1_bot", health = 0},
        {name = "dota_goodguys_tower2_bot", health = 0}
    },
    heroes = {
        disruptor = {
            name = "disruptor",
            team = 2,
            gold_reliable = 1329,
            gold_unreliable = 372,
            level = 20,
            position = Vector(1224.884033203125, -3041.259765625, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_dust",
                "item_ultimate_scepter",
                "item_veil_of_discord",
                "item_boots",
                "item_magic_wand",
                "item_gem",
                "item_tpscroll",
                "item_tpscroll",
                "item_trickster_cloak"
            },
            has_shard = true,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 9, 10, 14, 14, 15, 16}
        },
        monkey_king = {
            name = "monkey_king",
            team = 2,
            gold_reliable = 1037,
            gold_unreliable = 2030,
            level = 22,
            position = Vector(6878.753662109375, -3503.143310546875, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_gungir",
                "item_dust",
                "item_ward_sentry",
                "item_magic_stick",
                "item_cloak",
                "item_orb_of_corrosion",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_elven_tunic",
                "item_smoke_of_deceit"
            },
            has_shard = false,
            has_ags = false,
            has_moon_shard = false,
            talents = {
                0,
                0,
                0,
                0,
                1,
                1,
                1,
                1,
                2,
                2,
                2,
                2,
                3,
                3,
                3,
                3,
                4,
                5,
                5,
                5,
                6,
                6,
                6,
                6,
                7,
                8,
                10,
                13,
                16,
                16,
                16,
                16
            }
        },
        invoker = {
            name = "invoker",
            team = 2,
            gold_reliable = 1079,
            gold_unreliable = 3588,
            level = 27,
            position = Vector(5566.009521484375, -4455.322265625, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_sheepstick",
                "item_bloodthorn",
                "item_octarine_core",
                "item_shivas_guard",
                "item_black_king_bar",
                "item_travel_boots",
                "item_tpscroll",
                "item_timeless_relic"
            },
            has_shard = false,
            has_ags = false,
            has_moon_shard = false,
            talents = {
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                1,
                1,
                1,
                1,
                1,
                1,
                1,
                2,
                2,
                2,
                2,
                2,
                2,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                14,
                15,
                16
            }
        },
        sand_king = {
            name = "sand_king",
            team = 2,
            gold_reliable = 749,
            gold_unreliable = 2254,
            level = 25,
            position = Vector(1673.919677734375, -3151.0009765625, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_blink",
                "item_black_king_bar",
                "item_cyclone",
                "item_boots",
                "item_ultimate_scepter",
                "item_magic_stick",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_ascetic_cap"
            },
            has_shard = false,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 8, 10, 13, 14, 14, 14, 14, 14, 14, 15, 16}
        },
        faceless_void = {
            name = "faceless_void",
            team = 2,
            gold_reliable = 1075,
            gold_unreliable = 2742,
            level = 27,
            position = Vector(6031.31103515625, -3514.09912109375, 0),
            abilities = {},
            cooldowns = {0.5900012254714966, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_mjollnir",
                "item_black_king_bar",
                "item_magic_wand",
                "item_power_treads",
                "item_satanic",
                "item_skadi",
                "item_tpscroll",
                "item_spell_prism"
            },
            has_shard = true,
            has_ags = false,
            has_moon_shard = false,
            talents = {
                0,
                0,
                0,
                0,
                1,
                1,
                1,
                1,
                2,
                2,
                2,
                2,
                3,
                5,
                5,
                5,
                6,
                7,
                8,
                10,
                12,
                14,
                14,
                14,
                14,
                14,
                14,
                14,
                15,
                16
            }
        },
        luna = {
            name = "luna",
            team = 3,
            gold_reliable = 2129,
            gold_unreliable = 5286,
            level = 28,
            position = Vector(-4308.685302734375, 270.751953125, 0),
            abilities = {},
            cooldowns = {1.7000004053115845, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_power_treads",
                "item_black_king_bar",
                "item_butterfly",
                "item_satanic",
                "item_dragon_lance",
                "item_greater_crit",
                "item_tpscroll",
                "item_the_leveller"
            },
            has_shard = true,
            has_ags = true,
            has_moon_shard = false,
            talents = {
                0,
                0,
                0,
                0,
                1,
                1,
                1,
                1,
                2,
                2,
                2,
                2,
                5,
                5,
                5,
                6,
                7,
                8,
                9,
                11,
                12,
                14,
                14,
                14,
                14,
                14,
                14,
                14,
                15,
                16
            }
        },
        void_spirit = {
            name = "void_spirit",
            team = 3,
            gold_reliable = 1958,
            gold_unreliable = 6192,
            level = 27,
            position = Vector(-4782.806396484375, 4069.82421875, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_bottle",
                "item_kaya_and_sange",
                "item_aeon_disk",
                "item_cyclone",
                "item_ultimate_scepter",
                "item_travel_boots",
                "item_tpscroll",
                "item_spell_prism"
            },
            has_shard = true,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 7, 9, 10, 13, 14, 14, 14, 14, 14, 14, 14, 15, 16}
        },
        mars = {
            name = "mars",
            team = 3,
            gold_reliable = 1873,
            gold_unreliable = 1859,
            level = 27,
            position = Vector(-3700.775146484375, 17.63916015625, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_phase_boots",
                "item_heavens_halberd",
                "item_blink",
                "item_black_king_bar",
                "item_gem",
                "item_abyssal_blade",
                "item_tpscroll",
                "item_tpscroll",
                "item_black_powder_bag",
                "item_clarity"
            },
            has_shard = false,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 7, 8, 11, 13, 14, 14, 14, 14, 14, 14, 14, 15, 16}
        },
        wisp = {
            name = "wisp",
            team = 3,
            gold_reliable = 1678,
            gold_unreliable = 659,
            level = 22,
            position = Vector(-2916.07666015625, 1481.048583984375, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_mekansm",
                "item_lotus_orb",
                "item_magic_stick",
                "item_soul_ring",
                "item_dust",
                "item_tpscroll",
                "item_ninja_gear"
            },
            has_shard = true,
            has_ags = false,
            has_moon_shard = false,
            talents = {
                0,
                0,
                0,
                0,
                1,
                1,
                1,
                1,
                2,
                2,
                2,
                2,
                3,
                3,
                3,
                3,
                4,
                4,
                4,
                4,
                5,
                5,
                5,
                6,
                7,
                9,
                12,
                15,
                15,
                15,
                15,
                16
            }
        },
        weaver = {
            name = "weaver",
            team = 3,
            gold_reliable = 610,
            gold_unreliable = 180,
            level = 23,
            position = Vector(-4412.322998046875, -363.677978515625, 0),
            abilities = {},
            cooldowns = {0, 0, 2.200000762939453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_spirit_vessel",
                "item_ultimate_scepter",
                "item_magic_wand",
                "item_ward_sentry",
                "item_aether_lens",
                "item_tpscroll",
                "item_heavy_blade",
                "item_dust"
            },
            has_shard = false,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 7, 9, 11, 14, 14, 14, 14, 14, 15, 16}
        }
    },
    creeps = {
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-5022.430419921875, 5447.601318359375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(6017.303466796875, -4112.823486328125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(6008.697509765625, -4157.40966796875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(6212.2802734375, -3694.7021484375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(6087.249755859375, -3672.66845703125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5923.27880859375, -3788.970947265625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(6155.029296875, -3653.289794921875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(5865.936279296875, -3246.03271484375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(19.134521484375, 53.497314453125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-4927.886962890625, 5493.7744140625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(5531.25, -5518.707275390625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-5773.49853515625, 4968.292236328125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(5887.664794921875, -3299.713134765625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-85.418701171875, -82.733154296875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-5046.630859375, 5403.167724609375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(5725.341796875, -5354.949951171875)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-5781.18896484375, 4932.830810546875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6129.302978515625, -3559.906005859375)
        },
        {
            name = "npc_dota_creep_goodguys_melee",
            team = 2,
            waypoint = "",
            position = Vector(410.5224609375, 238.616943359375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5414.215087890625, 5388.519287109375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5602.84423828125, -5485.53466796875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5701.629638671875, 5112.1826171875)
        },
        {
            name = "npc_dota_creep_goodguys_melee",
            team = 2,
            waypoint = "",
            position = Vector(353.1494140625, 195.12939453125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5326.47705078125, 5222.381591796875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5883.880615234375, -3685.272216796875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5840.240478515625, -5217.803955078125)
        },
        {
            name = "npc_dota_creep_goodguys_melee",
            team = 2,
            waypoint = "",
            position = Vector(372.98583984375, 304.87060546875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5386.65771484375, 5259.1552734375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5473.968505859375, 5206.35986328125)
        },
        {
            name = "npc_dota_creep_goodguys_melee",
            team = 2,
            waypoint = "",
            position = Vector(183.10546875, 112.640380859375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5303.5888671875, 5365.78369140625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5922.4853515625, -5120.17822265625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5482.940673828125, 5276.79443359375)
        },
        {
            name = "npc_dota_creep_goodguys_melee",
            team = 2,
            waypoint = "",
            position = Vector(475.555419921875, 316.2841796875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5222.259521484375, 5372.314453125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5463.9892578125, -5549.530029296875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6195.465087890625, -3588.287353515625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5620.7275390625, 5178.009033203125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5425.29296875, 5318.84765625)
        },
        {
            name = "npc_dota_creep_goodguys_melee",
            team = 2,
            waypoint = "",
            position = Vector(260.711669921875, 209.197998046875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5343.963623046875, -5604.095458984375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5515.350341796875, 5339.7216796875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5781.3720703125, -5289.306640625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5553.16162109375, 5256.134033203125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(4097.625732421875, 3578.79638671875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6300.933837890625, 3742.156982421875)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-3705.6884765625, -6131.744384765625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-5045.59326171875, -4523.8037109375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(3163.4521484375, 5760.589599609375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6564.605712890625, -4088.5009765625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(4043.27392578125, 3549.560546875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6268.1884765625, 3816.95556640625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-3665.4052734375, -6117.523193359375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-4956.298828125, -4373.22998046875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(3138.671875, 5716.705322265625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6572.967529296875, -4158.69140625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3895.1416015625, 3416.1376953125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6090.02685546875, 3394.775390625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3427.24609375, -5949.52392578125)
        },
        {
            name = "npc_dota_creep_goodguys_melee",
            team = 2,
            waypoint = "",
            position = Vector(-4663.970947265625, -4251.89208984375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3022.247314453125, 5612.060546875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(4021.66748046875, 3467.010498046875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6134.185791015625, 3470.306396484375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6462.982177734375, -3754.69970703125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3346.954345703125, -6016.326904296875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2957.70263671875, 5687.225341796875)
        },
        {
            name = "npc_dota_creep_goodguys_melee",
            team = 2,
            waypoint = "",
            position = Vector(-4732.36083984375, -4157.3486328125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3913.604736328125, 3337.2802734375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6208.43505859375, 3461.85302734375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6494.2626953125, -3897.247314453125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3466.827392578125, -6022.705078125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3807.80029296875, 3282.073974609375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6064.88037109375, 3521.514892578125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2916.351318359375, 5619.354248046875)
        },
        {
            name = "npc_dota_creep_goodguys_melee",
            team = 2,
            waypoint = "",
            position = Vector(-4848.81591796875, -4287.261962890625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3449.64599609375, -5879.364013671875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6395.294189453125, -3811.279296875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(4024.84130859375, 3372.49755859375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6113.616943359375, 3300.567626953125)
        },
        {
            name = "npc_dota_creep_goodguys_melee",
            team = 2,
            waypoint = "",
            position = Vector(-4849.12109375, -4388.336181640625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2822.1435546875, 5663.116455078125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3636.871337890625, -6069.183349609375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3845.703125, 3477.508544921875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6249.542236328125, 3245.697021484375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6380.950927734375, -3645.477294921875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3038.330078125, 5699.127197265625)
        },
        {
            name = "npc_dota_creep_goodguys_melee",
            team = 2,
            waypoint = "",
            position = Vector(-4735.77880859375, -4344.207763671875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3252.62451171875, -5974.18212890625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6490.692138671875, -3687.835693359375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2893.5546875, 5767.2119140625)
        },
        {
            name = "npc_dota_creep_goodguys_melee",
            team = 2,
            waypoint = "",
            position = Vector(-4792.816162109375, -4223.5107421875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6528.1982421875, -3803.192138671875)
        }
    },
    roshan = {
        deaths = 2
    },
    neutrals = {
        good = {
        -- "item_arcane_ring", 
        -- "item_broom_handle", 
        "item_chipped_vest", 
        "item_mysterious_hat", 
        "item_keen_optic",
        "item_ocean_heart",
        -- "item_unstable_wand",
        -- "item_possessed_mask",
        -- "item_trusty_shovel",
        "item_pogo_stick",
        --
        "item_ring_of_aquila",
        "item_nether_shawl",
        "item_dragon_scale",
        -- "item_pupils_gift",
        -- "item_vambrace",
        "item_misericorde",
        -- "item_grove_bow",
        -- "item_philosophers_stone",
        -- "item_essence_ring",
        -- "item_paintball",
        "item_bullwhip",
        -- "item_quicksilver_amulet",
        --
        -- "item_quickening_charm", 
        "item_black_powder_bag", 
        -- "item_spider_legs", 
        -- "item_paladin_sword", 
        "item_titan_sliver",
        -- "item_mind_breaker", 
        "item_enchanted_quiver", 
        -- "item_elven_tunic", 
        -- "item_cloak_of_flames", 
        -- "item_ceremonial_robe",
        "item_psychic_headband",
        --
        -- "item_timeless_relic",
        -- "item_spell_prism",
        -- "item_ascetic_cap",
        -- "item_heavy_blade",
        -- "item_flicker",
        -- "item_ninja_gear",
        -- "item_the_leveller",
        -- "item_spy_gadget",
        -- "item_trickster_cloak",
        "item_stormcrafter",
        -- "item_penta_edged_sword",
        --
        -- "item_force_boots",
        -- "item_desolator_2",
        -- "item_seer_stone",
        -- "item_mirror_shield",
        -- "item_apex",
        -- "item_demonicon",
        -- "item_fallen_sky",
        -- "item_force_field",
        -- "item_pirate_hat",
        -- "item_ex_machina",
        -- "item_giants_ring",
        -- "item_book_of_shadows"
          },
          bad = {
        "item_arcane_ring", 
        -- "item_broom_handle", 
        "item_chipped_vest", 
        "item_mysterious_hat", 
        -- "item_keen_optic",
        "item_ocean_heart",
        -- "item_unstable_wand",
        "item_possessed_mask",
        -- "item_trusty_shovel",
        -- "item_pogo_stick",
        --
        -- "item_ring_of_aquila",
        "item_nether_shawl",
        -- "item_dragon_scale",
        -- "item_pupils_gift",
        -- "item_vambrace",
        "item_misericorde",
        -- "item_grove_bow",
        "item_philosophers_stone",
        "item_essence_ring",
        -- "item_paintball",
        -- "item_bullwhip",
        "item_quicksilver_amulet",
        --
        -- "item_quickening_charm", 
        -- "item_black_powder_bag", 
        -- "item_spider_legs", 
        -- "item_paladin_sword", 
        -- "item_titan_sliver",
        -- "item_mind_breaker", 
        "item_enchanted_quiver", 
        "item_elven_tunic", 
        -- "item_cloak_of_flames", 
        "item_ceremonial_robe",
        "item_psychic_headband",
        --
        -- "item_timeless_relic",
        -- "item_spell_prism",
        -- "item_ascetic_cap",
        -- "item_heavy_blade",
        "item_flicker",
        -- "item_ninja_gear",
        -- "item_the_leveller",
        -- "item_spy_gadget",
        -- "item_trickster_cloak",
        -- "item_stormcrafter",
        -- "item_penta_edged_sword",
        --
        -- "item_force_boots",
        -- "item_desolator_2",
        -- "item_seer_stone",
        -- "item_mirror_shield",
        -- "item_apex",
        -- "item_demonicon",
        -- "item_fallen_sky",
        -- "item_force_field",
        -- "item_pirate_hat",
        -- "item_ex_machina",
        -- "item_giants_ring",
        -- "item_book_of_shadows"
          },
      },
    wincon = nil
}
return GameState
