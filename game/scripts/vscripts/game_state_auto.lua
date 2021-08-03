local GameState = {
    game = {time = 2711},
    buildings = {
        {
            name = "dota_goodguys_tower3_top",
            health = 2500
        },
        {
            name = "dota_goodguys_tower2_top",
            health = 2483
        },
        {
            name = "dota_goodguys_tower4_top",
            health = 2600
        },
        {
            name = "good_rax_melee_bot",
            health = 1998
        },
        {
            name = "good_rax_range_bot",
            health = 756
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
            health = 331
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
            name = "dota_badguys_tower2_bot",
            health = 1911
        },
        {
            name = "dota_badguys_tower3_bot",
            health = 2500
        },
        {
            name = "dota_badguys_tower3_top",
            health = 1613
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
        {name = "dota_badguys_tower2_top", health = 0},
        {name = "dota_badguys_tower1_mid", health = 0},
        {name = "dota_badguys_tower2_mid", health = 0},
        {name = "dota_badguys_tower3_mid", health = 0},
        {name = "dota_badguys_tower1_bot", health = 0},
        {name = "dota_goodguys_tower1_top", health = 0},
        {name = "dota_goodguys_tower1_mid", health = 0},
        {name = "dota_goodguys_tower2_mid", health = 0},
        {name = "dota_goodguys_tower3_mid", health = 0},
        {name = "dota_goodguys_tower1_bot", health = 0},
        {name = "dota_goodguys_tower2_bot", health = 0},
        {name = "dota_goodguys_tower3_bot", health = 0},
        {name = "good_rax_range_mid", health = 0},
        {name = "good_rax_melee_mid", health = 0}
    },
    heroes = {
        grimstroke = {
            name = "grimstroke",
            team = 2,
            gold_reliable = 637,
            gold_reliable = 185,
            level = 25,
            position = Vector(-3248.138427734375, -6108.0322265625, 0),
            abilities = {},
            cooldowns = {4.968901638843959, 0, 9.96905423139134, 0, 0, 49.97027497177038, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_ghost",
                "item_tranquil_boots",
                "item_force_staff",
                "item_aether_lens",
                "item_ward_dispenser",
                "item_blink",
                "item_tpscroll",
                "item_tpscroll",
                "item_ninja_gear",
                "item_magic_wand"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 7, 8, 11, 12, 14, 14, 14, 14, 14, 14, 15}
        },
        mirana = {
            name = "mirana",
            team = 2,
            gold_reliable = 932,
            gold_reliable = 2320,
            level = 24,
            position = Vector(-4370.361328125, 225.09765625, 0),
            abilities = {},
            cooldowns = {
                11.969115268410292,
                12.969145786919768,
                0,
                0,
                0,
                99.97180089724418,
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
                "item_lotus_orb",
                "item_force_staff",
                "item_ward_dispenser",
                "item_smoke_of_deceit",
                "item_guardian_greaves",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_bullwhip"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 7, 8, 10, 14, 14, 14, 14, 14, 14, 15}
        },
        ember_spirit = {
            name = "ember_spirit",
            team = 2,
            gold_reliable = 718,
            gold_reliable = 2465,
            level = 27,
            position = Vector(-3056.854248046875, -340.63720703125, 0),
            abilities = {},
            cooldowns = {9.96905423139134, 0, 34.96981719412824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_maelstrom",
                "item_ethereal_blade",
                "item_black_king_bar",
                "item_phase_boots",
                "item_bottle",
                "item_ultimate_scepter",
                "item_tpscroll",
                "item_timeless_relic",
                "item_platemail"
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
                14
            }
        },
        mars = {
            name = "mars",
            team = 2,
            gold_reliable = 1125,
            gold_reliable = 1616,
            level = 24,
            position = Vector(-3533.050537109375, -54.656982421875, 0),
            abilities = {},
            cooldowns = {
                13.969176305429244,
                9.96905423139134,
                0.18750572222052675,
                0,
                0,
                59.97058015686514,
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
                "item_blink",
                "item_phase_boots",
                "item_magic_stick",
                "item_solar_crest",
                "item_platemail",
                "item_black_king_bar",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_orb_of_destruction",
                "item_dust"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 9, 11, 14, 14, 14, 14, 14, 14, 15}
        },
        juggernaut = {
            name = "juggernaut",
            team = 3,
            gold_reliable = 651,
            gold_reliable = 450,
            level = 25,
            position = Vector(2437.957763671875, 2927.642822265625, 0),
            abilities = {},
            cooldowns = {
                17.969298379467148,
                39.96996978667562,
                0,
                19.9693594164861,
                0,
                139.97302163762322,
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
                "item_phase_boots",
                "item_ultimate_scepter",
                "item_maelstrom",
                "item_magic_wand",
                "item_skadi",
                "item_sange_and_yasha",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_minotaur_horn",
                "item_bottle",
                "item_mithril_hammer"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 5, 5, 5, 6, 8, 11, 13, 14, 14, 14, 14, 14, 14}
        },
        dark_seer = {
            name = "dark_seer",
            team = 3,
            gold_reliable = 788,
            gold_reliable = 1999,
            level = 25,
            position = Vector(2022.4609375, 3520.233154296875, 0),
            abilities = {},
            cooldowns = {26.37580492568743, 0, 8.781517990661335, 0, 0, 87.97143467513047, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_solar_crest",
                "item_guardian_greaves",
                "item_magic_wand",
                "item_soul_ring",
                "item_pipe",
                "item_ultimate_scepter",
                "item_tpscroll",
                "item_quickening_charm"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 8, 11, 12, 14, 14, 14, 14, 14, 14}
        },
        bloodseeker = {
            name = "bloodseeker",
            team = 2,
            gold_reliable = 1221,
            gold_reliable = 2388,
            level = 27,
            position = Vector(-3893.157958984375, -158.69140625, 0),
            abilities = {},
            cooldowns = {7.968993194372387, 11.969115268410292, 0, 0, 0, 69.9708853419599, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_phase_boots",
                "item_black_king_bar",
                "item_sange_and_yasha",
                "item_basher",
                "item_butterfly",
                "item_mjollnir",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_minotaur_horn",
                "item_the_leveller"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 7, 8, 11, 13, 14, 14, 14, 14, 14, 14, 14, 15}
        },
        brewmaster = {
            name = "brewmaster",
            team = 3,
            gold_reliable = 1142,
            gold_reliable = 1101,
            level = 23,
            position = Vector(330.9326171875, 2531.005859375, 0),
            abilities = {},
            cooldowns = {
                12.969145786919768,
                10.969084749900816,
                16.96926786095767,
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
                0,
                0,
                0
            },
            items = {
                "item_gem",
                "item_ultimate_scepter",
                "item_vladmir",
                "item_magic_stick",
                "item_ward_dispenser",
                "item_tranquil_boots",
                "item_tpscroll",
                "item_cloak_of_flames",
                "item_dust",
                "item_flask"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 7, 9, 10, 14, 14, 14, 14, 14, 15}
        },
        rattletrap = {
            name = "rattletrap",
            team = 3,
            gold_reliable = 175,
            gold_reliable = 0,
            level = 24,
            position = Vector(2494.049072265625, 3301.57470703125, 0),
            abilities = {},
            cooldowns = {
                17.969298379467148,
                14.96920682393872,
                13.969176305429244,
                59.97058015686514,
                0,
                29.96966460158086,
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
                "item_ultimate_scepter",
                "item_urn_of_shadows",
                "item_black_king_bar",
                "item_tranquil_boots",
                "item_cloak",
                "item_smoke_of_deceit",
                "item_tpscroll",
                "item_ceremonial_robe",
                "item_dust"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 5, 5, 5, 6, 9, 10, 14, 14, 14, 14, 14, 14, 15}
        },
        drow_ranger = {
            name = "drow_ranger",
            team = 3,
            gold_reliable = 2158,
            gold_reliable = 796,
            level = 27,
            position = Vector(1853.363037109375, 1576.47705078125, 0),
            abilities = {},
            cooldowns = {0, 9.094027527695548, 8.375255592516861, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_manta",
                "item_power_treads",
                "item_blink",
                "item_butterfly",
                "item_hurricane_pike",
                "item_black_king_bar",
                "item_tpscroll",
                "item_tpscroll",
                "item_illusionsts_cape",
                "item_smoke_of_deceit",
                "item_clarity"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 7, 9, 10, 13, 14, 14, 14, 14, 14, 14, 14}
        },
        drow_ranger = {
            name = "drow_ranger",
            team = 3,
            gold_reliable = 2158,
            gold_reliable = 796,
            level = 27,
            position = Vector(547.576904296875, -182.281494140625, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_manta",
                "item_power_treads",
                "item_blink",
                "item_butterfly",
                "item_hurricane_pike",
                "item_black_king_bar",
                "item_tpscroll",
                "item_tpscroll",
                "item_illusionsts_cape",
                "item_smoke_of_deceit",
                "item_clarity"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 7, 9, 10, 13, 14, 14, 14, 14, 14, 14, 14}
        },
        drow_ranger = {
            name = "drow_ranger",
            team = 3,
            gold_reliable = 2158,
            gold_reliable = 796,
            level = 27,
            position = Vector(1610.77880859375, 653.01513671875, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_manta",
                "item_power_treads",
                "item_blink",
                "item_butterfly",
                "item_hurricane_pike",
                "item_black_king_bar",
                "item_tpscroll",
                "item_tpscroll",
                "item_illusionsts_cape",
                "item_smoke_of_deceit",
                "item_clarity"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 7, 9, 10, 13, 14, 14, 14, 14, 14, 14, 14}
        },
        drow_ranger = {
            name = "drow_ranger",
            team = 3,
            gold_reliable = 2158,
            gold_reliable = 796,
            level = 27,
            position = Vector(1446.6552734375, 655.8837890625, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_manta",
                "item_power_treads",
                "item_blink",
                "item_butterfly",
                "item_hurricane_pike",
                "item_black_king_bar",
                "item_tpscroll",
                "item_tpscroll",
                "item_illusionsts_cape",
                "item_smoke_of_deceit",
                "item_clarity"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 7, 9, 10, 13, 14, 14, 14, 14, 14, 14, 14}
        }
    },
    creeps = {
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-376.434326171875, -6240.631103515625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-405.09033203125, -6217.95654296875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-783.14208984375, -6288.51318359375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-733.551025390625, -6150.421142578125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(2594.23828125, -5915.283203125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-2687.347412109375, 5892.242431640625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(2521.942138671875, -5936.6455078125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2803.741455078125, -5834.1064453125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-2624.969482421875, 5897.216796875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2037.261962890625, -6047.7294921875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2294.708251953125, -5990.234375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2329.28466796875, 5920.623779296875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2396.087646484375, -5951.5380859375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2106.597900390625, 5937.8662109375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(2195.98388671875, -6010.55908203125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2433.685302734375, 5912.200927734375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-1996.4599609375, 5940.032958984375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2230.560302734375, 5928.16162109375)
        },
        {
            name = "npc_dota_badguys_siege_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(1901.91650390625, 1370.086669921875)
        },
        {
            name = "npc_dota_goodguys_siege_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2624.32861328125, -2284.3017578125)
        },
        {
            name = "npc_dota_badguys_siege_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(524.7802734375, 5682.55615234375)
        },
        {
            name = "npc_dota_goodguys_siege_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6395.538330078125, -816.650390625)
        },
        {
            name = "npc_dota_badguys_siege_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6371.734619140625, 544.189453125)
        },
        {
            name = "npc_dota_goodguys_siege_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-1261.474609375, -6088.7451171875)
        },
        {
            name = "npc_dota_badguys_siege_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(1975.921630859375, 1404.510498046875)
        },
        {
            name = "npc_dota_goodguys_siege_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2791.44287109375, -2414.6728515625)
        },
        {
            name = "npc_dota_badguys_siege_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(409.698486328125, 5710.968017578125)
        },
        {
            name = "npc_dota_goodguys_siege_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6339.29443359375, -638.885498046875)
        },
        {
            name = "npc_dota_badguys_siege_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6428.070068359375, 343.75)
        },
        {
            name = "npc_dota_goodguys_siege_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-1283.050537109375, -6239.74609375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(2124.755859375, 1515.9912109375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-2839.84375, -2458.6181640625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(263.12255859375, 5736.968994140625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6417.78564453125, -1204.986572265625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6393.73779296875, 723.6328125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-1223.9990234375, -6165.771484375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(2182.342529296875, 1584.320068359375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-2846.8017578125, -2512.542724609375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(278.350830078125, 5829.193115234375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6340.8203125, -1347.5341796875)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(1461.9140625, 1072.3876953125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6393.890380859375, 864.654541015625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-1236.4501953125, -6199.89013671875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2332.855224609375, -1984.86328125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-151.0009765625, 5727.84423828125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(1725.189208984375, 1253.2958984375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6381.317138671875, -536.224365234375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6417.633056640625, 442.047119140625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-787.811279296875, -6042.449951171875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2422.36328125, -2072.509765625)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(1526.7333984375, 1118.072509765625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(120.54443359375, 5839.29443359375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6330.902099609375, -913.055419921875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6395.111083984375, 227.935791015625)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(1811.279296875, 1300.750732421875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-728.546142578125, -6003.2958984375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2567.93212890625, -2219.696044921875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(51.57470703125, 5791.9921875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6396.392822265625, -1028.594970703125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6414.520263671875, 620.05615234375)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(1643.61572265625, 1188.5986328125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2491.058349609375, -2138.336181640625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-806.94580078125, -5972.59521484375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(194.732666015625, 5837.188720703125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6326.171875, -459.747314453125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(2061.126708984375, 1487.85400390625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6272.674560546875, 922.271728515625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2697.265625, -2359.222412109375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-854.400634765625, -6290.46630859375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-29.632568359375, 5704.071044921875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6321.71630859375, -721.49658203125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6344.970703125, 702.08740234375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-2278.533935546875, -1931.671142578125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(-43.060302734375, 5776.153564453125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-832.244873046875, -6185.85205078125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6408.38623046875, -699.371337890625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6364.31884765625, 106.62841796875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-823.150634765625, -6104.217529296875)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-3562.5, -5968.75)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(3093.75, 5656.25)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-4890.625, -4382.8125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6468.75, -3968.75)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(4000, 3500)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6125, 3562.5)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-3524.4140625, -5968.75)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(3125.762939453125, 5635.650634765625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-4915.58837890625, -4411.62109375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6430.6640625, -3968.75)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3593.26171875, -6022.03369140625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(4032.012939453125, 3479.400634765625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3140.869140625, 5695.770263671875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6088.43994140625, 3573.211669921875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4843.505859375, -4343.292236328125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3551.81884765625, -5908.172607421875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3035.919189453125, 5677.276611328125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6458.06884765625, -3908.172607421875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4843.505859375, -4422.36328125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(4047.119140625, 3539.520263671875)
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
            position = Vector(-3620.330810546875, -5947.723388671875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3062.98828125, 5602.96630859375)
        }
    },
    roshan = {
        deaths = 2
    },
    wincon = nil
}
return GameState
