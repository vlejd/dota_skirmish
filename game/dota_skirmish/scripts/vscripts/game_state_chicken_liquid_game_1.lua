local GameState = {
    game = {time = 4441},
    buildings = {
        {
            name = "dota_goodguys_tower4_top",
            health = 2272
        },
        {
            name = "good_rax_melee_mid",
            health = 2200
        },
        {
            name = "good_rax_range_mid",
            health = 1288
        },
        {
            name = "good_rax_melee_bot",
            health = 2200
        },
        {
            name = "good_rax_range_bot",
            health = 144
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
            name = "dota_badguys_tower3_bot",
            health = 2500
        },
        {
            name = "dota_badguys_tower3_top",
            health = 2446
        },
        {
            name = "dota_badguys_tower3_mid",
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
        {name = "dota_badguys_tower2_top", health = 0},
        {name = "dota_badguys_tower1_mid", health = 0},
        {name = "dota_badguys_tower2_mid", health = 0},
        {name = "dota_badguys_tower1_bot", health = 0},
        {name = "dota_badguys_tower2_bot", health = 0},
        {name = "dota_goodguys_tower1_top", health = 0},
        {name = "dota_goodguys_tower2_top", health = 0},
        {name = "dota_goodguys_tower3_top", health = 0},
        {name = "dota_goodguys_tower1_mid", health = 0},
        {name = "dota_goodguys_tower2_mid", health = 0},
        {name = "dota_goodguys_tower3_mid", health = 0},
        {name = "dota_goodguys_tower1_bot", health = 0},
        {name = "dota_goodguys_tower2_bot", health = 0},
        {name = "dota_goodguys_tower3_bot", health = 0},
        {name = "good_rax_melee_top", health = 0},
        {name = "good_rax_range_top", health = 0}
    },
    heroes = {
        medusa = {
            name = "medusa",
            team = 2,
            gold_reliable = 4784,
            gold_unreliable = 3439,
            level = 30,
            position = Vector(692.047119140625, 192.0166015625, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            has_shard = true,
            has_ags = true,
            has_moon_shard = true,
            items = {
                "item_skadi",
                "item_black_king_bar",
                "item_greater_crit",
                "item_rapier",
                "item_monkey_king_bar",
                "item_swift_blink",
                "item_tpscroll",
                "item_spider_legs",
                "item_cheese",
                "item_aeon_disk"
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
                5,
                5,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                12,
                13,
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
        templar_assassin = {
            name = "templar_assassin",
            team = 2,
            gold_reliable = 5733,
            gold_unreliable = 3439,
            level = 30,
            position = Vector(704.7119140625, 99.700927734375, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            has_shard = true,
            has_ags = true,
            has_moon_shard =true,
            items = {
                "item_black_king_bar",
                "item_rapier",
                "item_power_treads",
                "item_swift_blink",
                "item_nullifier",
                "item_hurricane_pike",
                "item_tpscroll",
                "item_tpscroll",
                "item_ballista",
                "item_relic",
                "item_demon_edge",
                "item_bottle"
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
                4,
                4,
                4,
                5,
                5,
                5,
                6,
                7,
                8,
                9,
                10,
                11,
                12,
                13,
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
        snapfire = {
            name = "snapfire",
            team = 2,
            gold_reliable = 2756,
            gold_unreliable = 3349,
            level = 26,
            position = Vector(622.49755859375, -91.217041015625, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            has_shard = true,
            items = {
                "item_solar_crest",
                "item_force_staff",
                "item_blink",
                "item_ethereal_blade",
                "item_boots",
                "item_refresher_shard",
                "item_tpscroll",
                "item_seer_stone",
                "item_magic_wand"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 8, 11, 13, 14, 14, 14, 14, 14, 14, 14, 15, 16}
        },
        lina = {
            name = "lina",
            team = 3,
            gold_reliable = 4678,
            gold_unreliable = 4208,
            level = 30,
            position = Vector(-393.49365234375, 3036.31591796875, 0),
            abilities = {},
            cooldowns = {0.6000030040740967, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            has_moon_shard = true,
            items = {
                "item_sheepstick",
                "item_black_king_bar",
                "item_satanic",
                "item_shivas_guard",
                "item_travel_boots",
                "item_greater_crit",
                "item_tpscroll",
                "item_mirror_shield",
                "item_clarity"
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
                7,
                8,
                9,
                10,
                11,
                12,
                13,
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
        pangolier = {
            name = "pangolier",
            team = 2,
            gold_reliable = 2250,
            gold_unreliable = 2720,
            level = 27,
            position = Vector(-222.65625, -83.0078125, 0),
            abilities = {},
            cooldowns = {0, 2.8100006580352783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            has_shard = true,
            has_ags = true,
            items = {
                "item_blink",
                "item_power_treads",
                "item_cyclone",
                "item_gem",
                "item_aeon_disk",
                "item_lotus_orb",
                "item_tpscroll",
                "item_tpscroll",
                "item_fallen_sky",
                "item_refresher_shard",
                "item_dust"
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
                4,
                5,
                5,
                5,
                6,
                6,
                6,
                7,
                8,
                10,
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
        nyx_assassin = {
            name = "nyx_assassin",
            team = 2,
            gold_reliable = 2878,
            gold_unreliable = 2236,
            level = 25,
            position = Vector(-456.207275390625, 475.738525390625, 0),
            abilities = {},
            cooldowns = {0, 0, 6.399994373321533, 0, 0, 30.322105407714844, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_force_staff",
                "item_tranquil_boots",
                "item_ward_dispenser",
                "item_ultimate_scepter",
                "item_cheese",
                "item_ghost",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_ex_machina",
                "item_dust"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 5, 5, 5, 6, 8, 9, 11, 14, 15, 15, 15, 15, 15, 15, 16}
        },
        ancient_apparition = {
            name = "ancient_apparition",
            team = 3,
            gold_reliable = 3220,
            gold_unreliable = 141,
            level = 24,
            position = Vector(-105.65185546875, 3627.410888671875, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            has_shard = true,
            items = {
                "item_force_staff",
                "item_boots",
                "item_aeon_disk",
                "item_glimmer_cape",
                "item_magic_wand",
                "item_gem",
                "item_book_of_shadows",
                "item_flask",
                "item_ward_sentry"
            },
            talents = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 5, 5, 5, 6, 8, 9, 11, 15, 15, 15, 15, 15, 15, 16}
        },
        drow_ranger = {
            name = "drow_ranger",
            team = 3,
            gold_reliable = 3443,
            gold_unreliable = 3785,
            level = 30,
            position = Vector(85.38818359375, 2622.406005859375, 0),
            abilities = {},
            cooldowns = {0, 0, 2.630605936050415, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            has_shard = true,
            has_ags = true,
            has_moon_shard = true,
            items = {
                "item_butterfly",
                "item_black_king_bar",
                "item_satanic",
                "item_swift_blink",
                "item_rapier",
                "item_aeon_disk",
                "item_tpscroll",
                "item_tpscroll",
                "item_spider_legs",
                "item_enchanted_mango",
                "item_manta",
                "item_hurricane_pike",
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
                7,
                8,
                9,
                10,
                11,
                12,
                13,
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
        slardar = {
            name = "slardar",
            team = 3,
            gold_reliable = 2979,
            gold_unreliable = 804,
            level = 28,
            position = Vector(-2175.35400390625, 3284.149169921875, 0),
            abilities = {},
            cooldowns = {16.199996948242188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            has_shard = true,
            items = {
                "item_travel_boots",
                "item_assault",
                "item_heavens_halberd",
                "item_blink",
                "item_black_king_bar",
                "item_ultimate_scepter",
                "item_tpscroll",
                "item_giants_ring",
                "item_dust"
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
                7,
                8,
                9,
                11,
                13,
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
        tiny = {
            name = "tiny",
            team = 3,
            gold_reliable = 3197,
            gold_unreliable = 2147,
            level = 26,
            position = Vector(-761.16943359375, 2628.96728515625, 0),
            abilities = {},
            cooldowns = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
            items = {
                "item_arcane_boots",
                "item_blink",
                "item_black_king_bar",
                "item_force_staff",
                "item_ghost",
                "item_dust",
                "item_tpscroll",
                "item_tpscroll",
                "item_tpscroll",
                "item_demonicon",
                "item_ninja_gear"
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
                8,
                10,
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
        }
    },
    creeps = {
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-6355.46875, -752.899169921875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-6218.536376953125, -981.87255859375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-6277.03857421875, -962.46337890625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(5986.083984375, -4049.835205078125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-6337.82958984375, -905.2734375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(6029.022216796875, -4011.749267578125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-6256.988525390625, -1285.400390625)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-6398.4375, -1417.327880859375)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-6351.226806640625, -1318.78662109375)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-6255.218505859375, -1391.4794921875)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-6391.021728515625, -1242.61474609375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(5482.7880859375, -5540.863037109375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-5915.679931640625, 4953.216552734375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(5912.9638671875, -3541.6259765625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(5590.728759765625, -5490.875244140625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(-5931.060791015625, 4892.822265625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5783.63037109375, -5288.177490234375)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(5910.003662109375, -3438.018798828125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5837.799072265625, -5222.900390625)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-6035.888671875, 4506.378173828125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5996.124267578125, -3948.577880859375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5713.470458984375, -5370.2392578125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-5971.466064453125, 4749.20654296875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5985.16845703125, -5046.234130859375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6046.295166015625, -3779.815673828125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5655.548095703125, -5436.5234375)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-5991.912841796875, 4668.8232421875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(5928.3447265625, -3967.529296875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(5917.05322265625, -5127.410888671875)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-6016.571044921875, 4585.235595703125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6030.70068359375, -3856.719970703125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-6071.624755859375, 4374.786376953125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(-5810.302734375, 5143.157958984375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6063.323974609375, -3925.78125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(3100.433349609375, 5767.242431640625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6550.59814453125, -4081.573486328125)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-3638.092041015625, -6030.09033203125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6262.847900390625, 3804.26025390625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-5027.618408203125, -4472.35107421875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(4289.154052734375, 3562.530517578125)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(3075.5615234375, 5725.006103515625)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-6510.3759765625, -3944.3359375)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-3549.37744140625, -6019.04296875)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(6281.982421875, 3614.1357421875)
        },
        {
            name = "npc_dota_creep_goodguys_ranged",
            team = 2,
            waypoint = "",
            position = Vector(-4949.21875, -4387.603759765625)
        },
        {
            name = "npc_dota_creep_badguys_ranged",
            team = 3,
            waypoint = "",
            position = Vector(4141.326904296875, 3828.765869140625)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(3005.9814453125, 5674.37744140625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6491.943359375, -3820.526123046875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3341.4306640625, -5964.324951171875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6111.785888671875, 3330.9326171875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4899.0478515625, -4363.1591796875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3995.697021484375, 3398.681640625)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(2873.382568359375, 5714.385986328125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6448.577880859375, -3758.056640625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3414.154052734375, -6023.74267578125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6137.51220703125, 3446.868896484375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4876.129150390625, -4429.840087890625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3890.13671875, 3359.466552734375)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(2783.87451171875, 5656.25)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6495.391845703125, -3673.15673828125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3273.284912109375, -6019.83642578125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6106.842041015625, 3213.134765625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4697.57080078125, -4262.237548828125)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(2955.657958984375, 5781.31103515625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3859.55810546875, 3432.098388671875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6459.442138671875, -3903.62548828125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3209.259033203125, -5964.019775390625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6063.1103515625, 3431.884765625)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(3034.36279296875, 5588.836669921875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4908.99658203125, -4293.3349609375)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3788.604736328125, 3333.6181640625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6381.256103515625, -3790.130615234375)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3396.6064453125, -5896.697998046875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6019.34814453125, 3503.814697265625)
        },
        {
            name = "npc_dota_creep_badguys_melee",
            team = 3,
            waypoint = "",
            position = Vector(2884.490966796875, 5596.099853515625)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4666.80908203125, -4152.64892578125)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3853.271484375, 3229.3701171875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-6434.08203125, -3613.250732421875)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-3466.6748046875, -5952.69775390625)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(6240.325927734375, 3279.11376953125)
        },
        {
            name = "npc_dota_creep_goodguys_melee_upgraded",
            team = 2,
            waypoint = "",
            position = Vector(-4763.12255859375, -4194.793701171875)
        },
        {
            name = "npc_dota_creep_badguys_melee_upgraded",
            team = 3,
            waypoint = "",
            position = Vector(3759.033203125, 3228.33251953125)
        }
    },
    roshan = {
        deaths = 2
    },
    neutrals = {
		good = {
			"item_keen_optic", "item_ocean_heart", "item_trusty_shovel", "item_faded_broach", 
			"item_ring_of_aquila", "item_philosophers_stone", "item_pupils_gift", "item_bullwhip",
			"item_paladin_sword", "item_cloak_of_flames", "item_psychic_headband"
		},
		bad = {
			"item_mysterious_hat", "item_chipped_vest", "item_faded_broach", "item_trusty_shovel",
			"item_ring_of_aquila", "item_vambrace", "item_nether_shawl", "item_quicksilver_amulet",
			"item_enchanted_quiver", "item_the_leveller", "item_stormcrafter"
		},		
	},
    wincon = nil
}
return GameState
