
local GameState = {
  game = {time = 1529},
  buildings = {

            {
              name = "dota_goodguys_tower3_bot",
              health = 2500,
            },

            {
              name = "dota_goodguys_tower3_mid",
              health = 2500,
            },

            {
              name = "dota_goodguys_tower3_top",
              health = 2500,
            },

            {
              name = "dota_goodguys_tower2_bot",
              health = 1811,
            },

            {
              name = "dota_goodguys_tower2_mid",
              health = 2457,
            },

            {
              name = "dota_goodguys_tower2_top",
              health = 2500,
            },

            {
              name = "dota_goodguys_tower1_top",
              health = 1562,
            },

            {
              name = "dota_goodguys_tower4_top",
              health = 2600,
            },

            {
              name = "good_rax_melee_mid",
              health = 2200,
            },

            {
              name = "good_rax_range_mid",
              health = 1300,
            },

            {
              name = "good_rax_melee_bot",
              health = 2200,
            },

            {
              name = "good_rax_range_bot",
              health = 1300,
            },

            {
              name = "good_rax_melee_top",
              health = 2200,
            },

            {
              name = "good_rax_range_top",
              health = 1300,
            },

            {
              name = "bad_rax_melee_bot",
              health = 2200,
            },

            {
              name = "bad_rax_range_bot",
              health = 1300,
            },

            {
              name = "bad_rax_range_mid",
              health = 1300,
            },

            {
              name = "bad_rax_melee_mid",
              health = 2200,
            },

            {
              name = "bad_rax_melee_top",
              health = 2200,
            },

            {
              name = "bad_rax_range_top",
              health = 1300,
            },

            {
              name = "dota_badguys_fort",
              health = 4500,
            },

            {
              name = "dota_goodguys_fort",
              health = 4500,
            },

            {
              name = "dota_badguys_tower4_top",
              health = 2600,
            },

            {
              name = "dota_badguys_tower2_top",
              health = 1815,
            },

            {
              name = "dota_badguys_tower2_mid",
              health = 2500,
            },

            {
              name = "dota_badguys_tower1_mid",
              health = 137,
            },

            {
              name = "dota_badguys_tower2_bot",
              health = 2500,
            },

            {
              name = "dota_badguys_tower3_bot",
              health = 2500,
            },

            {
              name = "dota_badguys_tower3_top",
              health = 2500,
            },

            {
              name = "dota_badguys_tower3_mid",
              health = 2500,
            },

            {
              name = "dota_badguys_tower4_bot",
              health = 2600,
            },

            {
              name = "dota_goodguys_tower4_bot",
              health = 2600,
            },

            {
              name = "dota_badguys_tower1_bot",
              health = 1554,
            },

            {
              name = "npc_dota_watch_tower_bottom",
              health = 450,
            },

            {
              name = "npc_dota_watch_tower_top",
              health = 450,
            },
{name = "dota_badguys_tower1_top",health = 0},
{name = "dota_goodguys_tower1_mid",health = 0},
{name = "dota_goodguys_tower1_bot",health = 0},
  },
  heroes = {
        disruptor = {
              name = "disruptor",
              team = 2,
              gold_reliable = 458,
              gold_unreliable = 277,
              level = 11,
              position = Vector(-4048.5750732421875,4794.469614028931,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_glimmer_cape","item_tranquil_boots","item_magic_wand","item_ward_observer","item_clarity","item_wind_lace","item_tpscroll","item_tpscroll","item_flask","item_ward_sentry"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,1,1,1,1,2,2,2,2,5,15,16},
            },
        phantom_assassin = {
              name = "phantom_assassin",
              team = 2,
              gold_reliable = 6,
              gold_unreliable = 0,
              level = 19,
              position = Vector(-3821.813123703003,3929.3808631896973,0),
              abilities = {},
              cooldowns = {4.600001335144043,0.000002518296241760254,25.600173950195312,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_black_king_bar","item_power_treads","item_sange_and_yasha","item_falcon_blade","item_magic_wand","item_quelling_blade","item_tpscroll","item_ring_of_aquila","item_mithril_hammer"},	
              has_shard = true,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,3,5,5,5,6,9,14,14,15,16},
            },
        invoker = {
              name = "invoker",
              team = 2,
              gold_reliable = 1235,
              gold_unreliable = 0,
              level = 14,
              position = Vector(-6737.860107421875,-6274.05242729187,0),
              abilities = {},
              cooldowns = {0,0,0,0,23.199993133544922,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_null_talisman","item_magic_wand","item_urn_of_shadows","item_hand_of_midas","item_boots","item_ogre_axe","item_tpscroll","item_tpscroll","item_tpscroll","item_pupils_gift","item_null_talisman"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,1,1,1,2,2,2,3,4,5,6,7,10,11,12,13,14,15},
            },
        dark_willow = {
              name = "dark_willow",
              team = 2,
              gold_reliable = 684,
              gold_unreliable = 970,
              level = 12,
              position = Vector(-4312.535625457764,4150.161741256714,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_cyclone","item_tranquil_boots","item_magic_wand","item_ward_sentry","item_smoke_of_deceit","item_tpscroll","item_keen_optic"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,3,3,5,5,7,15,16},
            },
        undying = {
              name = "undying",
              team = 3,
              gold_reliable = 631,
              gold_unreliable = 0,
              level = 12,
              position = Vector(-1008.1767311096191,4670.698053359985,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_boots","item_holy_locket","item_chainmail","item_wind_lace","item_dust","item_tpscroll","item_ring_of_aquila"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,1,1,1,1,2,2,2,2,5,5,7,15,16},
            },
        spectre = {
              name = "spectre",
              team = 3,
              gold_reliable = 216,
              gold_unreliable = 372,
              level = 18,
              position = Vector(4048.453010559082,-237.68655967712402,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_manta","item_magic_wand","item_power_treads","item_ultimate_scepter","item_falcon_blade","item_sobi_mask","item_tpscroll","item_misericorde"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,3,4,4,4,5,5,5,6,9,14,15,16},
            },
        tinker = {
              name = "tinker",
              team = 3,
              gold_reliable = 455,
              gold_unreliable = 1414,
              level = 18,
              position = Vector(6861.662183761597,6578.232633590698,0),
              abilities = {},
              cooldowns = {0,0,0,0,77.50003814697266,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_blink","item_bottle","item_ultimate_scepter","item_soul_ring","item_branches","item_aether_lens","item_tpscroll","item_tpscroll","item_mysterious_hat"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,4,4,4,5,5,5,7,8,14,15,16},
            },
        bloodseeker = {
              name = "bloodseeker",
              team = 3,
              gold_reliable = 522,
              gold_unreliable = 1047,
              level = 14,
              position = Vector(3380.281883239746,-4653.578762054443,0),
              abilities = {},
              cooldowns = {1.6000056266784668,0,0,0,0,14.600513458251953,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_rod_of_atos","item_falcon_blade","item_magic_wand","item_dust","item_belt_of_strength","item_phase_boots","item_tpscroll","item_broom_handle","item_quelling_blade"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,2,2,2,2,5,5,7,15,16},
            },
        rubick = {
              name = "rubick",
              team = 3,
              gold_reliable = 919,
              gold_unreliable = 765,
              level = 15,
              position = Vector(166.67659378051758,4474.116102218628,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_force_staff","item_dust","item_boots","item_magic_wand","item_aether_lens","item_wind_lace","item_tpscroll","item_tpscroll","item_philosophers_stone"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,5,5,6,10,13},
            },
        magnataur = {
              name = "magnataur",
              team = 2,
              gold_reliable = 893,
              gold_unreliable = 0,
              level = 15,
              position = Vector(-3240.337017059326,5529.378513336182,0),
              abilities = {},
              cooldowns = {0,0,0,17.49995231628418,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_arcane_boots","item_mekansm","item_blink","item_magic_wand","item_gauntlets","item_quelling_blade","item_tpscroll","item_paintball"},	
              has_shard = true,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,3,5,6,9,15,16},
            },
  },
  creeps = {
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(2196.823139190674,-6130.506711959839),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(2195.266839981079,-6168.742847442627),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(2159.5024738311768,-6082.322467803955),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(-1418.9481754302979,5894.895217895508),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(1810.799903869629,-6249.609375),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(1779.1856689453125,-6121.93180847168),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(1722.7316780090332,-6079.453994750977),
              },
        {
                name = "npc_dota_goodguys_siege_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(1293.8644409179688,-6255.163227081299),
              },
        {
                name = "npc_dota_badguys_siege_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5813.631986618042,-4984.551727294922),
              },
        {
                name = "npc_dota_goodguys_siege_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-1983.5186004638672,-1666.9185161590576),
              },
        {
                name = "npc_dota_badguys_siege_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-967.4077949523926,5776.219774246216),
              },
        {
                name = "npc_dota_goodguys_siege_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5887.296815872192,4762.214550018311),
              },
        {
                name = "npc_dota_badguys_siege_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-1226.8520278930664,-955.140495300293),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(1320.22998046875,-6309.5726680755615),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(5970.360471725464,-4726.511215209961),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(-1806.893898010254,-1521.4503135681152),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(-5921.6269454956055,4584.521799087524),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(1669.1461601257324,-6134.870452880859),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5862.060356140137,-4902.281478881836),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(-1253.6142711639404,-905.2168579101562),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5644.910842895508,-5275.152460098267),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-1610.678134918213,-1227.3402786254883),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5908.047472000122,4656.355688095093),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(1710.6474723815918,-6211.708911895752),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5759.771827697754,-5076.403896331787),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-1506.222993850708,-1215.7443237304688),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-1557.8860244750977,-1276.684118270874),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5804.172128677368,4983.971929550171),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5699.564409255981,-5182.262758255005),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-1609.8847274780273,-1139.2415370941162),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5766.8819789886475,5072.558921813965),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-1515.7438831329346,-1334.023063659668),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-1452.3323192596436,-1260.9990634918213),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5853.638031005859,4866.608659744263),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-1541.132921218872,-1154.5604038238525),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(-3562.27734375,-5968.376953125),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(3999.75,3499.78125),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(-4890.3193359375,-4382.53857421875),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(6124.6171875,3562.27734375),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(3093.556640625,5655.896484375),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(-6468.345703125,-3968.501953125),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-3593.037139892578,-6021.657314300537),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(3941.922803878784,3520.806547164917),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-4828.799743652344,-4382.53857421875),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-3620.104539871216,-5947.351655960083),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(6066.789991378784,3583.302640914917),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(3155.0762329101562,5655.896484375),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-6421.229507446289,-3928.9841594696045),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(4061.2695922851562,3499.78125),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-4879.6388511657715,-4443.142696380615),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-3515.161148071289,-5928.8591594696045),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(6093.857391357422,3508.996982574463),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(4010.4304847717285,3560.354856491089),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-3515.161148071289,-6007.925262451172),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(3104.2371253967285,5716.470090866089),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-6499.105499267578,-3915.2521076202393),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-4879.6388511657715,-4321.964967727661),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(3968.990203857422,3446.500888824463),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(6171.733383178711,3522.729034423828),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-4948.146532058716,-4361.513277053833),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(3035.729444503784,5676.921781539917),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-6526.172899246216,-3989.5577659606934),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(6003.225849151611,3542.014938354492),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(3104.2371253967285,5595.292362213135),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-6345.3065185546875,-3968.501953125),
              },
  },
  wards = {
            {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(-1133.2604656219482,22.001798629760742,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(-234.60447692871094,-973.6024761199951,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(-4499.352561950684,1015.8361644744873,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(-1229.0796718597412,-2884.890483856201,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(-3775.3377571105957,-927.7679386138916,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(-3811.193670272827,373.54232597351074,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(-3271.2799072265625,1274.2123489379883,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(-3413.9101524353027,3898.590551376343,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 2,
                position = Vector(-2787.6065254211426,3458.4325160980225,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(-4045.8286628723145,2485.7760257720947,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 3,
                position = Vector(-746.5353698730469,1992.3376293182373,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(-676.2272644042969,1598.7465076446533,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 2,
                position = Vector(-1974.6690559387207,7201.179536819458,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(-1206.8032321929932,4813.999643325806,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 3,
                position = Vector(-1634.3277797698975,5678.539112091064,1000),
              },
      },
  roshan = {
    deaths = 2,
  },
  neutrals = {
		good = { "item_arcane_ring", "item_chipped_vest", "item_ocean_heart", "item_mysterious_hat", "item_dragon_scale", "item_quicksilver_amulet"
		},
		bad = { "item_ocean_heart", "item_unstable_wand", "item_possessed_mask", "item_grove_bow", "item_bullwhip"
		},
	},
  wincon = nil,
}
return GameState