
local GameState = {
    game = {time = 1649},
    buildings = {
  
              {
                name = "dota_goodguys_tower3_bot",
                health = 2136,
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
                name = "dota_goodguys_tower2_mid",
                health = 2500,
              },
  
              {
                name = "dota_goodguys_tower2_top",
                health = 2500,
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
                name = "dota_badguys_tower2_mid",
                health = 2206,
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
                health = 2378,
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
                health = 750,
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
  {name = "dota_badguys_tower2_top",health = 0},
  {name = "dota_badguys_tower1_mid",health = 0},
  {name = "dota_goodguys_tower1_top",health = 0},
  {name = "dota_goodguys_tower1_mid",health = 0},
  {name = "dota_goodguys_tower1_bot",health = 0},
  {name = "dota_goodguys_tower2_bot",health = 0},
    },
    heroes = {
          disruptor = {
                name = "disruptor",
                team = 2,
                gold_reliable = 649,
                gold_unreliable = 23,
                level = 13,
                position = Vector(-1523.7389888763428,-1364.2946090698242,0),
                abilities = {},
                cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_ward_dispenser","item_tranquil_boots","item_magic_wand","item_staff_of_wizardry","item_dust","item_fluffy_hat","item_tpscroll","item_tpscroll","item_tpscroll","item_mysterious_hat","item_enchanted_mango","item_quickening_charm","item_smoke_of_deceit"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,1,1,1,1,2,2,2,2,5,5,15,16},
              },
          drow_ranger = {
                name = "drow_ranger",
                team = 2,
                gold_reliable = 377,
                gold_unreliable = 572,
                level = 17,
                position = Vector(-788.7690582275391,-978.6680774688721,0),
                abilities = {},
                cooldowns = {0,0,9.699991226196289,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_mithril_hammer","item_power_treads","item_silver_edge","item_circlet","item_dragon_lance","item_magic_wand","item_tpscroll","item_tpscroll","item_grove_bow"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,5,7,9,14,15,16},
              },
          dragon_knight = {
                name = "dragon_knight",
                team = 2,
                gold_reliable = 445,
                gold_unreliable = 353,
                level = 17,
                position = Vector(-4145.798000335693,3519.311279296875,0),
                abilities = {},
                cooldowns = {4.299992561340332,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_blink","item_magic_wand","item_sange","item_power_treads","item_soul_ring","item_black_king_bar","item_tpscroll","item_dragon_scale","item_bracer"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,5,6,9,14,15,16},
              },
          snapfire = {
                name = "snapfire",
                team = 2,
                gold_reliable = 241,
                gold_unreliable = 0,
                level = 13,
                position = Vector(-1844.0009536743164,-461.12230110168457,0),
                abilities = {},
                cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_blink","item_dust","item_magic_wand","item_arcane_boots","item_veil_of_discord","item_tpscroll","item_philosophers_stone"},	
                has_shard = true,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,1,2,2,5,5,6,15,16},
              },
          earthshaker = {
                name = "earthshaker",
                team = 3,
                gold_reliable = 753,
                gold_unreliable = 823,
                level = 15,
                position = Vector(-88.98369598388672,2235.4254627227783,0),
                abilities = {},
                cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_blink","item_dust","item_black_king_bar","item_power_treads","item_sobi_mask","item_ring_of_basilius","item_tpscroll","item_paintball","item_branches","item_quelling_blade"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,1,1,1,1,2,2,2,2,5,5,6,9,15,16},
              },
          faceless_void = {
                name = "faceless_void",
                team = 3,
                gold_reliable = 478,
                gold_unreliable = 1213,
                level = 17,
                position = Vector(559.6879177093506,2388.4615516662598,0),
                abilities = {},
                cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_mask_of_madness","item_black_king_bar","item_power_treads","item_magic_wand","item_maelstrom","item_sobi_mask","item_tpscroll","item_misericorde","item_flask"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,2,2,2,2,5,5,8,14,14,14,14,15,16},
              },
          lina = {
                name = "lina",
                team = 3,
                gold_reliable = 212,
                gold_unreliable = 773,
                level = 19,
                position = Vector(104.79081344604492,1850.5007915496826,0),
                abilities = {},
                cooldowns = {4.400003433227539,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_invis_sword","item_travel_boots","item_black_king_bar","item_bottle","item_sphere","item_null_talisman","item_tpscroll","item_black_powder_bag","item_null_talisman"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,5,5,6,8,14,14,15,16},
              },
          doom_bringer = {
                name = "doom_bringer",
                team = 2,
                gold_reliable = 1026,
                gold_unreliable = 1669,
                level = 16,
                position = Vector(-1585.5332221984863,-912.4185562133789,0),
                abilities = {},
                cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_phase_boots","item_hand_of_midas","item_blink","item_black_king_bar","item_magic_wand","item_platemail","item_tpscroll","item_paintball"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,1,2,2,2,2,3,5,5,7,8,15,16},
              },
          weaver = {
                name = "weaver",
                team = 3,
                gold_reliable = 673,
                gold_unreliable = 986,
                level = 14,
                position = Vector(-284.52811431884766,1263.7454738616943,0),
                abilities = {},
                cooldowns = {9.199958801269531,5.500000476837158,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_spirit_vessel","item_ogre_axe","item_dust","item_magic_wand","item_flask","item_tpscroll","item_trusty_shovel"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,1,2,2,2,5,5,7,15,16},
              },
          lion = {
                name = "lion",
                team = 3,
                gold_reliable = 1440,
                gold_unreliable = 124,
                level = 11,
                position = Vector(-444.0945568084717,2555.443302154541,0),
                abilities = {},
                cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_branches","item_blink","item_boots","item_branches","item_dust","item_ward_dispenser","item_tpscroll","item_tpscroll","item_ocean_heart"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,1,2,5,7,15,16},
              },
    },
    creeps = {
          {
                  name = "npc_dota_creep_goodguys_ranged",
                  team = 2,
                  waypoint = "",
                  position = Vector(274.8851623535156,-6366.057174682617),
                },
          {
                  name = "npc_dota_creep_badguys_ranged",
                  team = 3,
                  waypoint = "",
                  position = Vector(-747.5118713378906,5895.475015640259),
                },
          {
                  name = "npc_dota_creep_badguys_ranged",
                  team = 3,
                  waypoint = "",
                  position = Vector(1080.224229812622,-6237.097949981689),
                },
          {
                  name = "npc_dota_creep_badguys_ranged",
                  team = 3,
                  waypoint = "",
                  position = Vector(-818.2777118682861,5861.419527053833),
                },
          {
                  name = "npc_dota_creep_goodguys_ranged",
                  team = 2,
                  waypoint = "",
                  position = Vector(193.4388370513916,-6341.6751537323),
                },
          {
                  name = "npc_dota_creep_goodguys_ranged",
                  team = 2,
                  waypoint = "",
                  position = Vector(-1550.012981414795,5926.204296112061),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(689.9288005828857,-6320.009027481079),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(707.902530670166,-6388.974443435669),
                },
          {
                  name = "npc_dota_creep_badguys_ranged",
                  team = 3,
                  waypoint = "",
                  position = Vector(-525.9070701599121,-392.88926124572754),
                },
          {
                  name = "npc_dota_creep_goodguys_ranged",
                  team = 2,
                  waypoint = "",
                  position = Vector(239.3954372406006,-6358.245162963867),
                },
          {
                  name = "npc_dota_creep_badguys_ranged",
                  team = 3,
                  waypoint = "",
                  position = Vector(-823.587438583374,5820.467496871948),
                },
          {
                  name = "npc_dota_creep_goodguys_ranged",
                  team = 2,
                  waypoint = "",
                  position = Vector(-5905.20951461792,4666.364828109741),
                },
          {
                  name = "npc_dota_creep_badguys_ranged",
                  team = 3,
                  waypoint = "",
                  position = Vector(5851.3188400268555,-4925.412357330322),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(602.104700088501,-6226.264886856079),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-5853.454936981201,4864.319984436035),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(5700.388332366943,-5177.624376296997),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(669.8189735412598,-6205.849903106689),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-1278.850730895996,6014.119943618774),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-5774.999147415161,5052.388063430786),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-626.791877746582,-506.4991035461426),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(5748.328451156616,-5099.8704471588135),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-1210.19047164917,5963.891149520874),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(599.4803524017334,-6359.98455619812),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-5813.235282897949,4958.765985488892),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(5802.798923492432,-5003.501958847046),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-1150.4102725982666,5921.932102203369),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-5881.468322753906,4788.702152252197),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(5639.204412460327,-5285.2836627960205),
                },
          {
                  name = "npc_dota_creep_goodguys_ranged",
                  team = 2,
                  waypoint = "",
                  position = Vector(-3562.27734375,-5968.376953125),
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
                  position = Vector(3999.75,3499.78125),
                },
          {
                  name = "npc_dota_creep_goodguys_ranged",
                  team = 2,
                  waypoint = "",
                  position = Vector(-6468.345703125,-3968.501953125),
                },
          {
                  name = "npc_dota_creep_badguys_ranged",
                  team = 3,
                  waypoint = "",
                  position = Vector(3093.556640625,5655.896484375),
                },
          {
                  name = "npc_dota_creep_badguys_ranged",
                  team = 3,
                  waypoint = "",
                  position = Vector(6124.6171875,3562.27734375),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-3620.104539871216,-5947.351655960083),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-4921.079132080078,-4435.818935394287),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(4046.866195678711,3539.2990436553955),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-6457.6652183532715,-3907.928346633911),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-3515.161148071289,-5928.8591594696045),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-4843.203140258789,-4343.0207805633545),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(3140.672836303711,5616.348175048828),
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
                  position = Vector(4046.866195678711,3460.232940673828),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-6526.172899246216,-3947.476655960083),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-4843.203140258789,-4422.086883544922),
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
                  position = Vector(3062.796844482422,5602.616123199463),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(3968.990203857422,3553.0310955047607),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(6093.857391357422,3508.996982574463),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-6386.319580078125,-3968.501953125),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-4921.079132080078,-4329.288728713989),
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
                  position = Vector(3941.922803878784,3478.7254371643066),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(3140.672836303711,5695.4142780303955),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-6371.275354385376,-3892.945152282715),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(6171.733383178711,3522.729034423828),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(3062.796844482422,5709.146329879761),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(6247.6563720703125,3562.27734375),
                },
    },
    wards = {
              {
                  type = "npc_dota_sentry_wards",
                  team = 2,
                  position = Vector(474.3050708770752,-4275.733726501465,1000),
                },
          {
                  type = "npc_dota_observer_wards",
                  team = 3,
                  position = Vector(3924.132167816162,-5957.269248962402,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 2,
                  position = Vector(-3424.0413551330566,3881.3491973876953,1000),
                },
          {
                  type = "npc_dota_observer_wards",
                  team = 2,
                  position = Vector(-2786.4164142608643,3455.167339324951,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 2,
                  position = Vector(-3614.2760467529297,5351.960403442383,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 3,
                  position = Vector(546.8408203125,-6084.000829696655,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 2,
                  position = Vector(-966.6449031829834,5543.141080856323,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 3,
                  position = Vector(-473.7252731323242,-3226.604965209961,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 3,
                  position = Vector(-990.7217674255371,-4857.942209243774,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 3,
                  position = Vector(1597.6174278259277,1090.111307144165,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 2,
                  position = Vector(-1592.0940914154053,-213.91485214233398,1000),
                },
          {
                  type = "npc_dota_observer_wards",
                  team = 2,
                  position = Vector(-1195.5429496765137,-209.09337615966797,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 3,
                  position = Vector(1028.3475894927979,2695.540746688843,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 3,
                  position = Vector(-512.3275966644287,2706.770513534546,1000),
                },
          {
                  type = "npc_dota_observer_wards",
                  team = 3,
                  position = Vector(-801.1584205627441,1993.9854755401611,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 3,
                  position = Vector(712.6934909820557,4155.776624679565,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 2,
                  position = Vector(-1971.2207851409912,-2008.2057781219482,1000),
                },
        },
    roshan = {
      deaths = 2,
    },
    neutrals = {
          good = { "item_unstable_wand", "item_chipped_vest", "item_trusty_shovel", "item_pogo_stick", "item_essence_ring"
          },
          bad = { "item_unstable_wand", "item_possessed_mask", "item_arcane_ring", "item_vambrace", "item_quicksilver_amulet", "item_dragon_scale"
          },
      },
    wincon = nil,
  }
  return GameState