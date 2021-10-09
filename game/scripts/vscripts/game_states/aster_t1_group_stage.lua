local GameState = {
    game = {time = 2399},
    buildings = {
        {
            name = "dota_goodguys_tower3_bot",
            health = 993
        },
        {
            name = "dota_goodguys_tower3_mid",
            health = 2453
        },
        {
            name = "dota_goodguys_tower3_top",
            health = 2500
        },
        {
            name = "dota_goodguys_tower2_top",
            health = 2386
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
            name = "bad_rax_range_mid",
            health = 1300
        },
        {
            name = "bad_rax_melee_mid",
            health = 2200
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
            health = 2600
        },
        {
            name = "dota_badguys_tower2_top",
            health = 1788
        },
        {
            name = "dota_badguys_tower2_bot",
            health = 2500
        },
        {
            name = "dota_badguys_tower3_bot",
            health = 2500
        },
        {
            name = "dota_badguys_tower3_top",
            health = 2500
        },
        {
            name = "dota_badguys_tower4_bot",
            health = 2600
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
        {name = "dota_badguys_tower1_mid", health = 0},
        {name = "dota_badguys_tower2_mid", health = 0},
        {name = "dota_badguys_tower3_mid", health = 0},
        {name = "dota_badguys_tower1_bot", health = 0},
        {name = "dota_goodguys_tower1_top", health = 0},
        {name = "dota_goodguys_tower1_mid", health = 0},
        {name = "dota_goodguys_tower2_mid", health = 0},
        {name = "dota_goodguys_tower1_bot", health = 0},
        {name = "dota_goodguys_tower2_bot", health = 0}
    },
    heroes = {
        clinkz = {
            name = "clinkz",
            team = 2,
            gold_reliable = 1317,
            gold_unreliable = 3071,
            level = 25,
            position = Vector(-3450.37841796875, 3382.38525390625, 0),
            abilities = {},
            cooldowns = {
                9.999969482421875,
                0,
                9.299989700317383,
                0,
                0,
                15.70036506652832,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0
            },
            items = {
                "item_maelstrom",
                "item_power_treads",
                "item_black_king_bar",
                "item_dragon_lance",
                "item_lesser_crit",
                "item_skadi",
                "item_tpscroll",
                "item_ascetic_cap",
                "item_recipe_greater_crit"
            },
            has_shard = true,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 5, 5, 5, 7, 8, 11, 12, 14, 14, 14, 14, 14, 14, 15, 16}
        },
        elder_titan = {
            name = "elder_titan",
            team = 2,
            gold_reliable = 1114,
            gold_unreliable = 609,
            level = 18,
            position = Vector(-3038.116455078125, 3920.623779296875, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_force_staff",
                "item_tranquil_boots",
                "item_magic_wand",
                "item_ward_sentry",
                "item_veil_of_discord",
                "item_platemail",
                "item_tpscroll",
                "item_ceremonial_robe",
                "item_flask"
            },
            has_shard = false,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 6, 6, 6, 8, 9, 15, 16}
        },
        pangolier = {
            name = "pangolier",
            team = 2,
            gold_reliable = 1249,
            gold_unreliable = 1279,
            level = 22,
            position = Vector(-3778.961181640625, 2788.848876953125, 0),
            abilities = {},
            cooldowns = {6.840000152587891, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_bottle",
                "item_blink",
                "item_cyclone",
                "item_aeon_disk",
                "item_boots",
                "item_dust",
                "item_tpscroll",
                "item_quickening_charm",
                "item_clarity"
            },
            has_shard = true,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 4, 5, 5, 5, 6, 6, 6, 8, 10, 11, 15, 15, 15, 15, 16}
        },
        snapfire = {
            name = "snapfire",
            team = 2,
            gold_reliable = 1326,
            gold_unreliable = 1012,
            level = 19,
            position = Vector(-3757.171630859375, 3434.5703125, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_blink",
                "item_force_staff",
                "item_magic_wand",
                "item_tranquil_boots",
                "item_medallion_of_courage",
                "item_gem",
                "item_tpscroll",
                "item_tpscroll",
                "item_timeless_relic",
                "item_dust"
            },
            has_shard = true,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 8, 14, 14, 15, 16}
        },
        kunkka = {
            name = "kunkka",
            team = 2,
            gold_reliable = 749,
            gold_unreliable = 543,
            level = 24,
            position = Vector(-3473.846435546875, 3565.5517578125, 0),
            abilities = {},
            cooldowns = {5.99999475479126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_platemail",
                "item_ultimate_scepter",
                "item_armlet",
                "item_heavens_halberd",
                "item_phase_boots",
                "item_black_king_bar",
                "item_tpscroll",
                "item_tpscroll",
                "item_trickster_cloak",
                "item_bottle",
                "item_quelling_blade"
            },
            has_shard = false,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 5, 5, 5, 6, 6, 6, 6, 7, 9, 11, 15, 15, 15, 15, 15, 15, 16}
        },
        lina = {
            name = "lina",
            team = 3,
            gold_reliable = 1285,
            gold_unreliable = 2022,
            level = 26,
            position = Vector(-1127.105712890625, 776.275634765625, 0),
            abilities = {},
            cooldowns = {6.2000017166137695, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_travel_boots",
                "item_silver_edge",
                "item_monkey_king_bar",
                "item_black_king_bar",
                "item_bottle",
                "item_cyclone",
                "item_tpscroll",
                "item_paladin_sword"
            },
            has_shard = false,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 9, 11, 13, 14, 14, 14, 14, 14, 14, 14, 15, 16}
        },
        lion = {
            name = "lion",
            team = 3,
            gold_reliable = 1153,
            gold_unreliable = 462,
            level = 19,
            position = Vector(-640.7470703125, 1495.941162109375, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_smoke_of_deceit",
                "item_tranquil_boots",
                "item_blink",
                "item_force_staff",
                "item_ward_dispenser",
                "item_dust",
                "item_tpscroll",
                "item_trickster_cloak",
                "item_spider_legs",
                "item_magic_stick"
            },
            has_shard = false,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 7, 8, 14, 14, 15, 16}
        },
        weaver = {
            name = "weaver",
            team = 3,
            gold_reliable = 906,
            gold_unreliable = 1469,
            level = 19,
            position = Vector(-347.991943359375, 1062.19482421875, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_spirit_vessel",
                "item_medallion_of_courage",
                "item_dust",
                "item_magic_stick",
                "item_ultimate_scepter",
                "item_tpscroll",
                "item_tpscroll",
                "item_spy_gadget"
            },
            has_shard = false,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 9, 14, 14, 15, 16}
        },
        magnataur = {
            name = "magnataur",
            team = 3,
            gold_reliable = 1937,
            gold_unreliable = 1066,
            level = 21,
            position = Vector(902.34375, -208.92333984375, 0),
            abilities = {},
            cooldowns = {0, 0.20000538229942322, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_helm_of_the_dominator",
                "item_arcane_boots",
                "item_magic_wand",
                "item_blink",
                "item_cyclone",
                "item_dust",
                "item_tpscroll",
                "item_tpscroll",
                "item_ninja_gear",
                "item_clarity",
                "item_quickening_charm"
            },
            has_shard = true,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 5, 5, 5, 6, 9, 11, 14, 14, 14, 15, 16}
        },
        life_stealer = {
            name = "life_stealer",
            team = 3,
            gold_reliable = 480,
            gold_unreliable = 512,
            level = 23,
            position = Vector(1504.974365234375, 1273.8037109375, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_armlet",
                "item_phase_boots",
                "item_satanic",
                "item_sange_and_yasha",
                "item_skadi",
                "item_mithril_hammer",
                "item_tpscroll",
                "item_tpscroll",
                "item_heavy_blade"
            },
            has_shard = false,
            has_ags = false,
            has_moon_shard = false,
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 6, 6, 7, 10, 11, 15, 15, 15, 15, 15, 16}
        }
    },
    creeps = {
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-301.666259765625, -6263.092041015625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-366.302490234375, -6226.62353515625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-221.00830078125, -6177.1240234375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-2896.240234375, -2427.490234375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-2108.673095703125, 5937.80517578125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-667.205810546875, -6179.01611328125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-1784.942626953125, 5943.42041015625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-753.631591796875, -6232.025146484375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2008.6669921875, 5939.8193359375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-541.44287109375, -6110.198974609375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-1905.82275390625, 5942.138671875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-640.411376953125, -6104.248046875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-2511.90185546875, -2112.152099609375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-849.334716796875, -6240.509033203125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-5857.72705078125, 4855.743408203125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(5705.841064453125, -5169.98291015625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-2464.630126953125, -2056.488037109375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5549.102783203125, 5223.69384765625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-2824.21875, -2357.574462890625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5636.16943359375, -5287.567138671875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-2572.75390625, -2165.252685546875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5637.5732421875, 5159.942626953125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5490.753173828125, -5522.125244140625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-2737.60986328125, -2288.9404296875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5833.648681640625, 4912.4755859375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-2631.4697265625, -2208.740234375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5586.395263671875, -5373.748779296875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5791.8701171875, 5013.3056640625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5802.825927734375, -5009.490966796875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5749.45068359375, 5085.02197265625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5540.22216796875, -5446.075439453125)
        },
        {
            name = "npc_dota_goodguys_siege_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6479.00390625, -3951.019287109375)
        },
        {
            name = "npc_dota_goodguys_siege_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3562.5, -5968.75)
        },
        {
            name = "npc_dota_badguys_siege_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6125, 3562.5)
        },
        {
            name = "npc_dota_badguys_siege_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3093.75, 5656.25)
        },
        {
            name = "npc_dota_badguys_siege_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(4000, 3500)
        },
        {
            name = "npc_dota_goodguys_siege_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4890.625, -4382.8125)
        },
        {
            name = "npc_dota_goodguys_siege_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6397.735595703125, -3927.734375)
        },
        {
            name = "npc_dota_goodguys_siege_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3491.485595703125, -6009.765625)
        },
        {
            name = "npc_dota_badguys_siege_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6053.955078125, 3603.515625)
        },
        {
            name = "npc_dota_badguys_siege_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3022.705078125, 5697.265625)
        },
        {
            name = "npc_dota_badguys_siege_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(4071.014404296875, 3458.984375)
        },
        {
            name = "npc_dota_goodguys_siege_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4819.610595703125, -4423.828125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6531.3720703125, -3979.217529296875)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-3618.34716796875, -5938.568115234375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6069.15283203125, 3532.28759765625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(3143.829345703125, 5617.24853515625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(3937.3779296875, 3489.532470703125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-4830.596923828125, -4362.213134765625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-3502.471923828125, -5948.150634765625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6453.277587890625, -3894.195556640625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6099.4873046875, 3504.364013671875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(3050.750732421875, 5609.527587890625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(4060.028076171875, 3520.599365234375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6520.01953125, -3879.974365234375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3633.544921875, -6009.765625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6166.015625, 3491.455078125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-4855.926513671875, -4329.681396484375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3093.75, 5574.21875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6590.14892578125, -3989.013671875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3562.5, -5886.71875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(4000, 3582.03125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6207.03125, 3562.5)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4931.640625, -4311.798095703125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3562.5, -6050.78125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6448.333740234375, -3826.66015625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3164.764404296875, 5697.265625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6003.60107421875, 3542.236328125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3958.984375, 3428.955078125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4972.65625, -4382.8125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3446.136474609375, -5928.802490234375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6325.1953125, -3968.75)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6041.656494140625, 3471.954345703125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3093.75, 5738.28125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3917.022705078125, 3560.24169921875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6593.75, -3906.25)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3670.745849609375, -5910.186767578125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6114.837646484375, 3439.849853515625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4931.640625, -4453.857421875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2972.35107421875, 5635.986328125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3878.60107421875, 3479.736328125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4774.261474609375, -4342.864990234375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3010.406494140625, 5565.704345703125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(4030.181884765625, 3380.706787109375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4860.443115234375, -4502.105712890625)
        }
    },
    roshan = {
        deaths = 2
    },
    neutrals = {
        good = {
      "item_arcane_ring", 
      -- "item_broom_handle", 
      -- "item_chipped_vest", 
      -- "item_mysterious_hat", 
      -- "item_keen_optic",
      -- "item_ocean_heart",
      "item_unstable_wand",
      "item_possessed_mask",
      "item_trusty_shovel",
      "item_pogo_stick",
      --
      -- "item_ring_of_aquila",
      -- "item_nether_shawl",
      "item_dragon_scale",
      "item_pupils_gift",
      "item_vambrace",
      -- "item_misericorde",
      -- "item_grove_bow",
      "item_philosophers_stone",
      -- "item_essence_ring",
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
      -- "item_elven_tunic", 
      "item_cloak_of_flames", 
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
        bad = {
      -- "item_arcane_ring", 
      -- "item_broom_handle", 
      "item_chipped_vest", 
      -- "item_mysterious_hat", 
      "item_keen_optic",
      "item_ocean_heart",
      -- "item_unstable_wand",
      "item_possessed_mask",
      -- "item_trusty_shovel",
      "item_pogo_stick",
      --
      -- "item_ring_of_aquila",
      "item_nether_shawl",
      -- "item_dragon_scale",
      "item_pupils_gift",
      -- "item_vambrace",
      "item_misericorde",
      "item_grove_bow",
      -- "item_philosophers_stone",
      "item_essence_ring",
      -- "item_paintball",
      -- "item_bullwhip",
      -- "item_quicksilver_amulet",
      --
      -- "item_quickening_charm", 
      -- "item_black_powder_bag", 
      -- "item_spider_legs", 
      -- "item_paladin_sword", 
      -- "item_titan_sliver",
      "item_mind_breaker", 
      -- "item_enchanted_quiver", 
      -- "item_elven_tunic", 
      "item_cloak_of_flames", 
      -- "item_ceremonial_robe",
      -- "item_psychic_headband",
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
    },
    wincon = nil
}
return GameState


