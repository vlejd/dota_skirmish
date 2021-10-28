
local GameState = {
    game = {time = 1229},
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
                health = 2146,
              },
  
              {
                name = "dota_goodguys_tower2_mid",
                health = 2353,
              },
  
              {
                name = "dota_goodguys_tower2_top",
                health = 2500,
              },
  
              {
                name = "dota_goodguys_tower1_top",
                health = 1800,
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
                health = 2474,
              },
  
              {
                name = "dota_badguys_tower2_mid",
                health = 2500,
              },
  
              {
                name = "dota_badguys_tower1_mid",
                health = 590,
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
                health = 914,
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
          winter_wyvern = {
                name = "winter_wyvern",
                team = 2,
                gold_reliable = 107,
                gold_unreliable = 0,
                level = 10,
                position = Vector(-3112.6289348602295,3224.9266033172607,0),
                abilities = {},
                cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_dust","item_arcane_boots","item_magic_stick","item_blink","item_smoke_of_deceit","item_tpscroll","item_tpscroll","item_broom_handle"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,1,2,5,15,16},
              },
          terrorblade = {
                name = "terrorblade",
                team = 2,
                gold_reliable = 21,
                gold_unreliable = 99,
                level = 15,
                position = Vector(-85.96264457702637,-4140.305179595947,0),
                abilities = {},
                cooldowns = {0,7.299970626831055,75.80926513671875,0,0,8.100641250610352,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_magic_wand","item_power_treads","item_ultimate_orb","item_falcon_blade","item_yasha","item_point_booster","item_ring_of_aquila","item_quelling_blade"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,1,1,1,1,2,2,2,2,5,5,7,8,15,16},
              },
          ember_spirit = {
                name = "ember_spirit",
                team = 2,
                gold_reliable = 289,
                gold_unreliable = 1637,
                level = 17,
                position = Vector(-6161.632696151733,3695.508762359619,0),
                abilities = {},
                cooldowns = {0,5.100000858306885,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_phase_boots","item_bottle","item_quelling_blade","item_cyclone","item_maelstrom","item_tpscroll","item_pogo_stick"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,1,2,2,2,2,3,3,5,5,6,8,14,15,16},
              },
          bane = {
                name = "bane",
                team = 2,
                gold_reliable = 764,
                gold_unreliable = 21,
                level = 8,
                position = Vector(-3309.119338989258,-290.4176387786865,0),
                abilities = {},
                cooldowns = {0,1.2999792098999023,0,0,0,41.11122131347656,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_arcane_boots","item_clarity","item_magic_stick","item_ward_sentry","item_ward_observer","item_wind_lace","item_tpscroll","item_tpscroll","item_philosophers_stone","item_recipe_aether_lens","item_tome_of_knowledge"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,1,1,2,2,2,2,5,6,16},
              },
          kunkka = {
                name = "kunkka",
                team = 3,
                gold_reliable = 229,
                gold_unreliable = 438,
                level = 16,
                position = Vector(1275.5550384521484,-212.81628799438477,0),
                abilities = {},
                cooldowns = {1.9999908208847046,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_phase_boots","item_bottle","item_ogre_axe","item_heavens_halberd","item_armlet","item_magic_wand","item_tpscroll","item_broom_handle"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,5,6,6,6,6,7,9,16},
              },
          lycan = {
                name = "lycan",
                team = 3,
                gold_reliable = 235,
                gold_unreliable = 725,
                level = 14,
                position = Vector(-1850.3176975250244,4360.323165893555,0),
                abilities = {},
                cooldowns = {7.499917030334473,7.799962520599365,0,0,0,42.501258850097656,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_helm_of_the_overlord","item_ogre_axe","item_staff_of_wizardry","item_quelling_blade","item_tpscroll","item_ocean_heart"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,2,2,2,2,5,5,7,15,16},
              },
          magnataur = {
                name = "magnataur",
                team = 2,
                gold_reliable = 739,
                gold_unreliable = 0,
                level = 13,
                position = Vector(-4134.5072021484375,2166.0328273773193,0),
                abilities = {},
                cooldowns = {0,3.2000045776367188,0,0,0,44.81117248535156,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_arcane_boots","item_blink","item_magic_wand","item_quelling_blade","item_headdress","item_ogre_axe","item_tpscroll","item_paintball","item_smoke_of_deceit","item_gauntlets"},	
                has_shard = true,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,1,2,2,2,3,5,6,15,16},
              },
          tiny = {
                name = "tiny",
                team = 3,
                gold_reliable = 214,
                gold_unreliable = 237,
                level = 15,
                position = Vector(3765.05397605896,-620.5971965789795,0),
                abilities = {},
                cooldowns = {0,0,8.899995803833008,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_silver_edge","item_soul_ring","item_power_treads","item_quelling_blade","item_echo_sabre","item_tpscroll","item_tpscroll","item_ring_of_aquila","item_misericorde"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,1,1,2,2,2,2,5,5,6,6,6,6,8,9,16},
              },
          skywrath_mage = {
                name = "skywrath_mage",
                team = 3,
                gold_reliable = 99,
                gold_unreliable = 0,
                level = 11,
                position = Vector(127.61653518676758,1675.4629039764404,0),
                abilities = {},
                cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_aether_lens","item_dust","item_magic_wand","item_circlet","item_boots","item_tpscroll","item_tpscroll","item_tpscroll","item_philosophers_stone"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,0,0,0,1,2,2,2,2,5,6,15,16},
              },
          enchantress = {
                name = "enchantress",
                team = 3,
                gold_reliable = 230,
                gold_unreliable = 0,
                level = 9,
                position = Vector(1589.1340713500977,1607.0772857666016,0),
                abilities = {},
                cooldowns = {0,13.499975204467773,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                items = {"item_ward_dispenser","item_holy_locket","item_medallion_of_courage","item_boots","item_tpscroll","item_possessed_mask","item_clarity"},	
                has_shard = false,
                has_ags = false,
                has_moon_shard = false,
                talents = {0,1,1,1,2,2,2,2,5,15,16},
              },
    },
    creeps = {
          {
                  name = "npc_dota_creep_badguys_ranged",
                  team = 3,
                  waypoint = "",
                  position = Vector(-6156.231422424316,3769.966999053955),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(5919.338270187378,-3953.640821456909),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(6150.219835281372,-3952.786382675171),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(6075.2123165130615,-3954.4952602386475),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(5988.212139129639,-3937.7726726531982),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(5856.811660766602,-3920.9890537261963),
                },
          {
                  name = "npc_dota_goodguys_siege_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-6209.694877624512,2880.221586227417),
                },
          {
                  name = "npc_dota_goodguys_siege_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(5285.161600112915,-5630.354867935181),
                },
          {
                  name = "npc_dota_badguys_siege_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-849.098539352417,-714.1277275085449),
                },
          {
                  name = "npc_dota_badguys_siege_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-5730.293689727783,5203.410118103027),
                },
          {
                  name = "npc_dota_badguys_siege_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(5896.4515171051025,-3410.9806480407715),
                },
          {
                  name = "npc_dota_creep_goodguys_ranged",
                  team = 2,
                  waypoint = "",
                  position = Vector(-6153.790168762207,2917.5117359161377),
                },
          {
                  name = "npc_dota_creep_goodguys_ranged",
                  team = 2,
                  waypoint = "",
                  position = Vector(5204.600229263306,-5668.102752685547),
                },
          {
                  name = "npc_dota_creep_badguys_ranged",
                  team = 3,
                  waypoint = "",
                  position = Vector(-1604.9411888122559,-1222.8849906921387),
                },
          {
                  name = "npc_dota_creep_badguys_ranged",
                  team = 3,
                  waypoint = "",
                  position = Vector(-5567.492586135864,5394.987499237061),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-6099.2281494140625,3301.6124839782715),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(5557.605508804321,-5505.667837142944),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-1767.833839416504,-1378.0266609191895),
                },
          {
                  name = "npc_dota_creep_badguys_ranged",
                  team = 3,
                  waypoint = "",
                  position = Vector(5950.769411087036,-3450.986692428589),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-5392.485214233398,5417.447032928467),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-6246.7409019470215,3278.6036682128906),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(5382.903293609619,-5585.496831893921),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-1904.9407482147217,-1498.502529144287),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(5970.024799346924,-3860.5985412597656),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-5889.616006851196,5004.936195373535),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(5077.3498821258545,-5706.308372497559),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-1683.0002746582031,-1287.8528537750244),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-6034.138223648071,3329.1376190185547),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-5814.242300033569,5102.006544113159),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(5460.230003356934,-5550.129169464111),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-1824.776081085205,-1431.764757156372),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(5899.41153717041,-3864.5655784606934),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(-5644.758264541626,5310.062387466431),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(6038.2273235321045,-3880.6778526306152),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(6105.758502960205,-3860.5985412597656),
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
                  name = "npc_dota_creep_goodguys_ranged",
                  team = 2,
                  waypoint = "",
                  position = Vector(-3562.27734375,-5968.376953125),
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
                  position = Vector(-4948.146532058716,-4403.594387054443),
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
                  position = Vector(3104.2371253967285,5716.470090866089),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-3551.5968589782715,-5907.803346633911),
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
                  position = Vector(-6421.229507446289,-3928.9841594696045),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-4828.799743652344,-4382.53857421875),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(4046.866195678711,3460.232940673828),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(3140.672836303711,5616.348175048828),
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
                  position = Vector(6066.789991378784,3583.302640914917),
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
                  position = Vector(-4879.6388511657715,-4443.142696380615),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(4046.866195678711,3539.2990436553955),
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
                  position = Vector(-3620.104539871216,-5989.432765960693),
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
                  position = Vector(-6526.172899246216,-3989.5577659606934),
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
                  position = Vector(3968.990203857422,3553.0310955047607),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(3062.796844482422,5602.616123199463),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-3468.624750137329,-5926.692546844482),
                },
          {
                  name = "npc_dota_creep_badguys_melee_upgraded",
                  team = 3,
                  waypoint = "",
                  position = Vector(6154.797185897827,3442.9915866851807),
                },
          {
                  name = "npc_dota_creep_goodguys_melee_upgraded",
                  team = 2,
                  waypoint = "",
                  position = Vector(-6576.584787368774,-3909.9423809051514),
                },
    },
    wards = {
              {
                  type = "npc_dota_sentry_wards",
                  team = 3,
                  position = Vector(-5537.282072067261,3120.166305541992,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 3,
                  position = Vector(-4025.444194793701,1486.2352294921875,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 3,
                  position = Vector(5780.034233093262,-3362.002996444702,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 2,
                  position = Vector(-3602.252872467041,-1139.5161781311035,1000),
                },
          {
                  type = "npc_dota_observer_wards",
                  team = 3,
                  position = Vector(1280.6816711425781,-2215.0104789733887,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 3,
                  position = Vector(1831.7641696929932,-5406.278297424316,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 2,
                  position = Vector(2783.8530979156494,-5020.163515090942,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 2,
                  position = Vector(-1167.4990482330322,-2707.624952316284,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 2,
                  position = Vector(-3819.829605102539,479.18757820129395,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 3,
                  position = Vector(2755.2599143981934,-3029.6263103485107,1000),
                },
          {
                  type = "npc_dota_observer_wards",
                  team = 3,
                  position = Vector(1192.8575706481934,-5029.409763336182,1000),
                },
          {
                  type = "npc_dota_observer_wards",
                  team = 2,
                  position = Vector(1965.2702293395996,-769.6662483215332,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 2,
                  position = Vector(1944.946792602539,-770.8563594818115,1000),
                },
          {
                  type = "npc_dota_observer_wards",
                  team = 2,
                  position = Vector(-2764.2315216064453,3449.186267852783,1000),
                },
          {
                  type = "npc_dota_sentry_wards",
                  team = 2,
                  position = Vector(-2764.0789432525635,3450.315347671509,1000),
                },
        },
    roshan = {
      deaths = 0,
      alive = true,
      time_since_death = 0,
    },
    neutrals = {
          good = { "item_chipped_vest", "item_arcane_ring", "item_ocean_heart", "item_misericorde", "item_vambrace"
          },
          bad = { "item_chipped_vest", "item_keen_optic", "item_dragon_scale", "item_essence_ring"
          },
      },
    wincon = nil,
  }
  return GameState