local GameState = {
    game = {time = 2280},
    buildings = {
        {
            name = "dota_goodguys_tower3_bot",
            health = 2500
        },
        {
            name = "dota_goodguys_tower3_mid",
            health = 2500
        },
        {
            name = "dota_goodguys_tower3_top",
            health = 2500
        },
        {
            name = "dota_goodguys_tower2_mid",
            health = 2349
        },
        {
            name = "dota_goodguys_tower2_top",
            health = 1545
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
            health = 119
        },
        {
            name = "dota_badguys_tower2_bot",
            health = 2183
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
            name = "dota_badguys_tower3_mid",
            health = 2475
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
        {name = "dota_badguys_tower1_bot", health = 0},
        {name = "dota_goodguys_tower1_top", health = 0},
        {name = "dota_goodguys_tower1_mid", health = 0},
        {name = "dota_goodguys_tower1_bot", health = 0},
        {name = "dota_goodguys_tower2_bot", health = 0}
    },
    heroes = {
        disruptor = {
            name = "disruptor",
            team = 2,
            gold_reliable = 76,
            gold_reliable = 0,
            level = 18,
            position = Vector(-3546.9970703125, -5585.44921875, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_ultimate_scepter",
                "item_ward_dispenser",
                "item_magic_stick",
                "item_dust",
                "item_tranquil_boots",
                "item_tpscroll",
                "item_timeless_relic",
                "item_bullwhip",
                "item_clarity"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 9, 14, 15, 16}
        },
        naga_siren = {
            name = "naga_siren",
            team = 2,
            gold_reliable = 118,
            gold_reliable = 741,
            level = 23,
            position = Vector(-1075.86669921875, -4515.56396484375, 0),
            abilities = {},
            cooldowns = {9.39992904663086, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_butterfly",
                "item_power_treads",
                "item_diffusal_blade",
                "item_sange_and_yasha",
                "item_mithril_hammer",
                "item_heart",
                "item_tpscroll",
                "item_tpscroll",
                "item_spider_legs",
                "item_orb_of_venom",
                "item_wind_lace",
                "item_ogre_axe"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 8, 10, 12, 15, 15, 15, 15, 15, 16}
        },
        tidehunter = {
            name = "tidehunter",
            team = 2,
            gold_reliable = 1217,
            gold_reliable = 746,
            level = 24,
            position = Vector(-1494.44580078125, -6025.146484375, 0),
            abilities = {},
            cooldowns = {4.619999885559082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_arcane_blink",
                "item_eternal_shroud",
                "item_gem",
                "item_ultimate_scepter",
                "item_helm_of_the_dominator",
                "item_travel_boots",
                "item_tpscroll",
                "item_quickening_charm"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 7, 8, 11, 14, 14, 14, 14, 14, 14, 15, 16}
        },
        mirana = {
            name = "mirana",
            team = 2,
            gold_reliable = 773,
            gold_reliable = 415,
            level = 19,
            position = Vector(-1182.373046875, -4737.762451171875, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 94.50008392333984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_guardian_greaves",
                "item_urn_of_shadows",
                "item_magic_wand",
                "item_wind_lace",
                "item_dust",
                "item_force_staff",
                "item_tpscroll",
                "item_tpscroll",
                "item_psychic_headband",
                "item_flask"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 7, 8, 14, 14, 15, 16}
        },
        luna = {
            name = "luna",
            team = 3,
            gold_reliable = 334,
            gold_reliable = 559,
            level = 23,
            position = Vector(652.099609375, -5358.94775390625, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_hurricane_pike",
                "item_sange_and_yasha",
                "item_aegis",
                "item_power_treads",
                "item_black_king_bar",
                "item_greater_crit",
                "item_tpscroll",
                "item_tpscroll",
                "item_titan_sliver",
                "item_magic_wand"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 7, 8, 11, 14, 14, 14, 14, 14, 15, 16}
        },
        lina = {
            name = "lina",
            team = 3,
            gold_reliable = 87,
            gold_reliable = 298,
            level = 25,
            position = Vector(1205.62744140625, -6231.01806640625, 0),
            abilities = {},
            cooldowns = {6.400001525878906, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_cyclone",
                "item_travel_boots",
                "item_greater_crit",
                "item_monkey_king_bar",
                "item_aeon_disk",
                "item_black_king_bar",
                "item_tpscroll",
                "item_stormcrafter",
                "item_bottle",
                "item_cheese"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 8, 11, 13, 14, 14, 14, 14, 14, 14, 15, 16}
        },
        razor = {
            name = "razor",
            team = 2,
            gold_reliable = 392,
            gold_reliable = 146,
            level = 22,
            position = Vector(-9.063720703125, -2657.501220703125, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_sange_and_yasha",
                "item_power_treads",
                "item_wind_lace",
                "item_magic_wand",
                "item_refresher",
                "item_black_king_bar",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_enchanted_quiver",
                "item_bottle"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 8, 10, 14, 14, 14, 14, 15, 16}
        },
        abaddon = {
            name = "abaddon",
            team = 3,
            gold_reliable = 586,
            gold_reliable = 110,
            level = 15,
            position = Vector(1632.965087890625, -5458.648681640625, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_magic_stick",
                "item_fluffy_hat",
                "item_tranquil_boots",
                "item_smoke_of_deceit",
                "item_tpscroll",
                "item_tpscroll",
                "item_arcane_ring"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 5, 5, 7, 9, 15, 16}
        },
        sand_king = {
            name = "sand_king",
            team = 3,
            gold_reliable = 1793,
            gold_reliable = 1103,
            level = 25,
            position = Vector(597.96142578125, -4931.33544921875, 0),
            abilities = {},
            cooldowns = {0, 18.399986267089844, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_blink",
                "item_cyclone",
                "item_black_king_bar",
                "item_travel_boots",
                "item_shivas_guard",
                "item_vanguard",
                "item_tpscroll",
                "item_nether_shawl"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 8, 11, 13, 14, 14, 14, 14, 14, 14, 15, 16}
        },
        nyx_assassin = {
            name = "nyx_assassin",
            team = 3,
            gold_reliable = 539,
            gold_reliable = 192,
            level = 19,
            position = Vector(712.921142578125, -5823.73046875, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_tranquil_boots",
                "item_magic_stick",
                "item_ultimate_scepter",
                "item_dust",
                "item_ogre_axe",
                "item_mithril_hammer",
                "item_tpscroll",
                "item_tpscroll",
                "item_essence_ring",
                "item_trusty_shovel"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 5, 5, 5, 6, 8, 9, 15, 15, 16}
        },
    },
    creeps = {
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-5909.637451171875, 4639.404296875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-613.4033203125, -6202.789306640625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(255.0048828125, 145.172119140625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-5564.849853515625, 5337.982177734375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-1052.703857421875, -6200.13427734375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-983.001708984375, -6103.668212890625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-909.881591796875, -6037.078857421875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-1072.32666015625, -5971.8017578125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(5689.788818359375, -5196.929931640625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(294.43359375, 223.08349609375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-5543.609619140625, 5309.2041015625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-5947.540283203125, 4630.035400390625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5623.4130859375, -5312.591552734375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(686.981201171875, 459.442138671875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5830.718994140625, 5057.708740234375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5579.986572265625, -5384.58251953125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(598.20556640625, 423.2177734375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5892.364501953125, 4964.599609375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5853.363037109375, 5126.220703125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(404.998779296875, 229.156494140625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5500.1220703125, -5508.636474609375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5835.784912109375, 5194.488525390625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5919.61669921875, 5047.18017578125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5401.55029296875, -5662.90283203125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(533.14208984375, 347.0458984375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5450.286865234375, -5585.601806640625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5809.478759765625, 4990.53955078125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5852.05078125, 4906.43310546875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-5681.640625, 5144.53125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5950.37841796875, 4923.675537109375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-5910.736083984375, 4856.01806640625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6222.991943359375, 3838.56201171875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(4321.075439453125, 3726.043701171875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(3353.08837890625, 5755.828857421875)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6544.525146484375, -4218.841552734375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-3842.437744140625, -6129.69970703125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-5079.833984375, -4563.720703125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6145.5078125, 3562.5)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3996.39892578125, 3423.675537109375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3114.2578125, 5620.7275390625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6498.443603515625, -3883.6669921875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3510.345458984375, -6007.75146484375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6067.169189453125, 3583.526611328125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4914.9169921875, -4427.703857421875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(4010.68115234375, 3560.577392578125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3140.869140625, 5695.770263671875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6518.85986328125, -3958.892822265625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6094.23828125, 3509.21630859375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3483.795166015625, -5933.349609375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3958.984375, 3500)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4896.54541015625, -4309.661865234375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3062.98828125, 5709.503173828125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6420.47119140625, -3897.4609375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6158.02001953125, 3460.601806640625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(4061.5234375, 3500)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3620.330810546875, -5989.80712890625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3035.919189453125, 5635.19287109375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6221.954345703125, 3531.1279296875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6572.20458984375, -3900.726318359375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4835.5712890625, -4415.34423828125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3903.411865234375, 3423.431396484375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3561.737060546875, -5919.98291015625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3083.0078125, 5554.26025390625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6446.47216796875, -3818.634033203125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4814.544677734375, -4330.01708984375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3541.6259765625, -6074.5849609375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4948.6083984375, -4361.968994140625)
        }
    },
    roshan = {
        deaths = 2
    },
    wincon = nil
}
return GameState
