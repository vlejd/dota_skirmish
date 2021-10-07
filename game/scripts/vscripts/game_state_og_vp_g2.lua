local GameState = {
    game = {time = 2521},
    buildings = {
        {
            name = "dota_goodguys_tower3_top",
            health = 2500
        },
        {
            name = "dota_goodguys_tower2_top",
            health = 2374
        },
        {
            name = "dota_goodguys_tower4_top",
            health = 2600
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
            health = 1317
        },
        {
            name = "bad_rax_range_top",
            health = 1183
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
            name = "dota_badguys_tower2_bot",
            health = 1466
        },
        {
            name = "dota_badguys_tower3_bot",
            health = 2500
        },
        {
            name = "dota_badguys_tower3_mid",
            health = 2495
        },
        {
            name = "dota_badguys_tower4_bot",
            health = 2600
        },
        {
            name = "dota_goodguys_tower4_bot",
            health = 2366
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
        {name = "dota_badguys_tower3_top", health = 0},
        {name = "dota_badguys_tower1_mid", health = 0},
        {name = "dota_badguys_tower2_mid", health = 0},
        {name = "dota_badguys_tower1_bot", health = 0},
        {name = "dota_goodguys_tower1_top", health = 0},
        {name = "dota_goodguys_tower1_mid", health = 0},
        {name = "dota_goodguys_tower2_mid", health = 0},
        {name = "dota_goodguys_tower3_mid", health = 0},
        {name = "dota_goodguys_tower1_bot", health = 0},
        {name = "dota_goodguys_tower2_bot", health = 0},
        {name = "dota_goodguys_tower3_bot", health = 0},
        {name = "good_rax_melee_bot", health = 0},
        {name = "good_rax_range_bot", health = 0},
        {name = "good_rax_range_mid", health = 0},
        {name = "good_rax_melee_mid", health = 0}
    },
    heroes = {
        dawnbreaker = {
            name = "dawnbreaker",
            team = 2,
            gold_reliable = 1103,
            gold_unreliable = 2973,
            level = 27,
            position = Vector(-4632.2021484375, -3635.467529296875, 0),
            abilities = {},
            cooldowns = {0, 0.2999905049800873, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            has_shard = true,
            items = {
                "item_echo_sabre",
                "item_black_king_bar",
                "item_phase_boots",
                "item_soul_ring",
                "item_satanic",
                "item_radiance",
                "item_tpscroll",
                "item_tpscroll",
                "item_penta_edged_sword",
                "item_quelling_blade",
                "item_magic_wand"
            },
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
                5,
                5,
                5,
                6,
                6,
                6,
                7,
                8,
                9,
                12,
                13,
                15,
                15,
                15,
                15,
                15,
                15,
                15,
                16
            }
        },
        necrolyte = {
            name = "necrolyte",
            team = 2,
            gold_reliable = 760,
            gold_unreliable = 1119,
            level = 24,
            position = Vector(-3680.816650390625, -3771.270751953125, 0),
            abilities = {},
            has_shard = true,
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_hood_of_defiance",
                "item_kaya_and_sange",
                "item_dagon_2",
                "item_power_treads",
                "item_overwhelming_blink",
                "item_platemail",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_trickster_cloak"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 5, 5, 5, 6, 9, 11, 14, 14, 14, 14, 14, 14, 15, 16}
        },
        furion = {
            name = "furion",
            team = 2,
            gold_reliable = 878,
            gold_unreliable = 1692,
            level = 24,
            has_shard = true,
            position = Vector(4133.72802734375, -4019.317626953125, 0),
            abilities = {},
            cooldowns = {
                0,
                14.999980926513672,
                6.899986267089844,
                0,
                0,
                64.3003158569336,
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
                "item_orchid",
                "item_silver_edge",
                "item_black_king_bar",
                "item_assault",
                "item_power_treads",
                "item_dust",
                "item_tpscroll",
                "item_enchanted_quiver"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 8, 11, 14, 14, 14, 14, 14, 14, 15, 16}
        },
        earth_spirit = {
            name = "earth_spirit",
            team = 2,
            gold_reliable = 2014,
            gold_unreliable = 170,
            level = 21,
            position = Vector(-4132.62939453125, -3708.0078125, 0),
            abilities = {},
            has_shard = true,
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {"item_boots", "item_ethereal_blade", "item_gem", "item_philosophers_stone"},
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 5, 5, 5, 6, 9, 11, 14, 14, 14, 15, 16}
        },
        undying = {
            name = "undying",
            team = 2,
            gold_reliable = 580,
            gold_unreliable = 0,
            level = 15,
            position = Vector(-3923.675537109375, -3855.438232421875, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 2.4013328552246094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_holy_locket",
                "item_ghost",
                "item_boots",
                "item_enchanted_mango",
                "item_smoke_of_deceit",
                "item_ward_dispenser",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_essence_ring"
            },
            talents = {0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 7, 8, 15, 16}
        },
        oracle = {
            name = "oracle",
            team = 3,
            gold_reliable = 805,
            gold_unreliable = 0,
            level = 19,
            position = Vector(-5509.58251953125, 2011.749267578125, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_vitality_booster",
                "item_tranquil_boots",
                "item_blink",
                "item_magic_wand",
                "item_urn_of_shadows",
                "item_shadow_amulet",
                "item_tpscroll",
                "item_psychic_headband",
                "item_dust"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 7, 9, 14, 14, 15, 16}
        },
        tiny = {
            name = "tiny",
            team = 3,
            gold_reliable = 1618,
            gold_unreliable = 3120,
            level = 27,
            position = Vector(-4750.335693359375, 1863.677978515625, 0),
            abilities = {},
            has_shard = true,
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_blink",
                "item_skadi",
                "item_power_treads",
                "item_black_king_bar",
                "item_echo_sabre",
                "item_moon_shard",
                "item_penta_edged_sword",
                "item_bottle",
                "item_lesser_crit"
            },
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
                6,
                6,
                6,
                7,
                8,
                9,
                11,
                14,
                15,
                15,
                15,
                15,
                15,
                15,
                15,
                16
            }
        },
        lycan = {
            name = "lycan",
            team = 3,
            gold_reliable = 429,
            gold_unreliable = 0,
            level = 26,
            position = Vector(-6583.67919921875, 1779.754638671875, 0),
            abilities = {},
            cooldowns = {2.3999218940734863, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_nullifier",
                "item_black_king_bar",
                "item_ancient_janggo",
                "item_helm_of_the_overlord",
                "item_gem",
                "item_ultimate_scepter",
                "item_tpscroll",
                "item_ninja_gear",
                "item_dust",
                "item_aghanims_shard"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 5, 5, 5, 7, 9, 11, 12, 14, 14, 14, 14, 14, 14, 14, 15, 16}
        },
        snapfire = {
            name = "snapfire",
            team = 3,
            gold_reliable = 1725,
            gold_unreliable = 811,
            level = 20,
            position = Vector(-4306.2744140625, 3748.4130859375, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_glimmer_cape",
                "item_force_staff",
                "item_point_booster",
                "item_boots",
                "item_ward_dispenser",
                "item_solar_crest",
                "item_tpscroll",
                "item_ceremonial_robe"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 8, 11, 14, 14, 15, 16}
        },
        clinkz = {
            name = "clinkz",
            team = 3,
            gold_reliable = 1203,
            gold_unreliable = 0,
            level = 26,
            position = Vector(-3698.333740234375, 3074.127197265625, 0),
            abilities = {},
            has_shard = true,
            cooldowns = {
                6.499963760375977,
                0,
                5.599968433380127,
                0,
                0,
                38.300331115722656,
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
                "item_skadi",
                "item_power_treads",
                "item_maelstrom",
                "item_ultimate_scepter",
                "item_dragon_lance",
                "item_tpscroll",
                "item_tpscroll",
                "item_ring_of_aquila"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 5, 5, 5, 7, 9, 11, 13, 14, 14, 14, 14, 14, 14, 14, 15, 16}
        }
    },
    creeps = {
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(4651.947021484375, -5828.91845703125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-3898.86474609375, -3441.7724609375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(4442.0166015625, -5897.39990234375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-3857.940673828125, -3404.6630859375)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-4206.024169921875, -3732.421875)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(4703.55224609375, -5817.3828125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-3040.802001953125, -2586.456298828125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-5950.5615234375, 4827.5146484375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(5651.42822265625, -5263.916015625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(4507.659912109375, -5869.659423828125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-2992.49267578125, -2537.90283203125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-5909.11865234375, 4981.201171875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(5507.110595703125, -5440.85693359375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5038.543701171875, -5732.666015625)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-3271.6064453125, -2806.488037109375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5933.77685546875, 4897.064208984375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(4792.327880859375, -5786.9873046875)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(5425.018310546875, -5541.778564453125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-3424.8046875, -2945.068359375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-6045.41015625, 4478.02734375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(4965.14892578125, -5750.762939453125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-3140.106201171875, -2683.28857421875)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(5606.99462890625, -5340.2099609375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5112.3046875, -5715.6982421875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-6013.427734375, 4592.46826171875)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-3202.08740234375, -2744.56787109375)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(5315.948486328125, -5621.58203125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(4892.547607421875, -5750)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-6078.582763671875, 4354.949951171875)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-3353.45458984375, -2880.06591796875)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(5247.61962890625, -5665.802001953125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5979.736328125, 4723.785400390625)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(5182.861328125, -5705.50537109375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-4973.175048828125, -4431.427001953125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(3070.709228515625, 5745.208740234375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6305.11474609375, 3700.958251953125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6560.577392578125, -3978.82080078125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-3509.27734375, -6020.355224609375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(4226.25732421875, 3505.2490234375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-4863.95263671875, -4311.1572265625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(3164.24560546875, 5765.44189453125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6282.3486328125, 3614.80712890625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6565.673828125, -4040.95458984375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-3672.088623046875, -6056.427001953125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(4290.557861328125, 3563.201904296875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4749.1455078125, -4230.010986328125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2971.405029296875, 5794.37255859375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4649.505615234375, -4226.348876953125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(6111.4501953125, 3256.103515625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6472.686767578125, -3637.02392578125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3319.3359375, -6015.19775390625)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(3789.093017578125, 3196.10595703125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2871.337890625, 5645.32470703125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4663.39111328125, -4122.1923828125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(6142.333984375, 3340.63720703125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6493.072509765625, -3725.860595703125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3428.985595703125, -6067.840576171875)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(3867.67578125, 3289.398193359375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2745.60546875, 5677.459716796875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4569.64111328125, -4111.785888671875)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(6083.740234375, 3401.9775390625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6395.843505859375, -3735.809326171875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4729.827880859375, -4145.294189453125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3141.632080078125, -5992.7978515625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2798.52294921875, 5744.598388671875)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(3760.009765625, 3282.1044921875)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(6106.475830078125, 3161.62109375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6351.86767578125, -3568.05419921875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2798.431396484375, 5597.869873046875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3247.711181640625, -5974.9755859375)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(3717.498779296875, 3206.817626953125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(6244.293212890625, 3224.090576171875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6518.61572265625, -3571.22802734375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3341.644287109375, -5940.7958984375)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(3823.79150390625, 3381.072998046875)
        }
    },
    roshan = {
        deaths = 1
    },
    neutrals = {
        good = {
            --"item_arcane_ring",
            "item_broom_handle",
            --"item_chipped_vest",
            --"item_mysterious_hat",
            "item_keen_optic",
            "item_ocean_heart",
            "item_unstable_wand",
            --"item_possessed_mask",
            "item_trusty_shovel",
            --"item_pogo_stick",
            --
            "item_ring_of_aquila",
            --"item_nether_shawl",
            --"item_dragon_scale",
            --"item_pupils_gift",
            --"item_vambrace",
            --"item_misericorde",
            "item_grove_bow",
            --"item_philosophers_stone",
            --"item_essence_ring",
            --"item_paintball",
            "item_bullwhip",
            --"item_quicksilver_amulet",
            --
            --"item_quickening_charm",
            "item_black_powder_bag",
            "item_spider_legs",
            --"item_paladin_sword",
            --"item_titan_sliver",
            "item_mind_breaker",
            --"item_enchanted_quiver",
            --"item_elven_tunic",
            --"item_cloak_of_flames",
            --"item_ceremonial_robe",
            "item_psychic_headband",
            --
            --"item_timeless_relic",
            --"item_spell_prism",
            "item_ascetic_cap",
            --"item_heavy_blade",
            --"item_flicker",
            --"item_ninja_gear",
            --"item_the_leveller",
            --"item_spy_gadget",
            --"item_trickster_cloak",
            --"item_stormcrafter",
            --"item_penta_edged_sword",
            ----
            --"item_force_boots",
            --"item_desolator_2",
            --"item_seer_stone",
            --"item_mirror_shield",
            --"item_apex",
            --"item_demonicon",
            --"item_fallen_sky",
            --"item_force_field",
            --"item_pirate_hat",
            --"item_ex_machina",
            --"item_giants_ring",
            --"item_book_of_shadows"
        },
        bad = {
            "item_arcane_ring",
            "item_broom_handle",
            --"item_chipped_vest",
            --"item_mysterious_hat",
            "item_keen_optic",
            "item_ocean_heart",
            "item_unstable_wand",
            --"item_possessed_mask",
            --"item_trusty_shovel",
            --"item_pogo_stick",
            ----
            --"item_ring_of_aquila",
            --"item_nether_shawl",
            --"item_dragon_scale",
            "item_pupils_gift",
            "item_vambrace",
            --"item_misericorde",
            --"item_grove_bow",
            --"item_philosophers_stone",
            --"item_essence_ring",
            "item_paintball",
            --"item_bullwhip",
            "item_quicksilver_amulet",
            ----
            --"item_quickening_charm",
            --"item_black_powder_bag",
            --"item_spider_legs",
            "item_paladin_sword",
            --"item_titan_sliver",
            "item_mind_breaker",
            --"item_enchanted_quiver",
            "item_elven_tunic",
            --"item_cloak_of_flames",
            --"item_ceremonial_robe",
            --"item_psychic_headband",
            ----
            --"item_timeless_relic",
            --"item_spell_prism",
            "item_ascetic_cap",
            --"item_heavy_blade",
            --"item_flicker",
            --"item_ninja_gear",
            --"item_the_leveller",
            --"item_spy_gadget",
            "item_trickster_cloak",
            --"item_stormcrafter",
            --"item_penta_edged_sword",
            --
            --"item_force_boots",
            --"item_desolator_2",
            --"item_seer_stone",
            --"item_mirror_shield",
            --"item_apex",
            --"item_demonicon",
            --"item_fallen_sky",
            --"item_force_field",
            --"item_pirate_hat",
            --"item_ex_machina",
            --"item_giants_ring",
            --"item_book_of_shadows"
        }
    },
    wincon = nil
}
return GameState
