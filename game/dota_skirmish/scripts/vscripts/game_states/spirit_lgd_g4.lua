
local GameState = {
  game = {time = 1259},
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
              health = 2128,
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
              name = "dota_goodguys_tower1_top",
              health = 1039,
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
              name = "dota_badguys_fort",
              health = 4500,
            },

            {
              name = "dota_goodguys_fort",
              health = 4500,
            },

            {
              name = "dota_badguys_tower4_top",
              health = 2196,
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
              name = "dota_badguys_tower4_bot",
              health = 2175,
            },

            {
              name = "dota_goodguys_tower4_bot",
              health = 2600,
            },

            {
              name = "dota_goodguys_tower1_mid",
              health = 1553,
            },

            {
              name = "dota_badguys_tower1_bot",
              health = 1303,
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
{name = "dota_badguys_tower3_top",health = 0},
{name = "dota_badguys_tower1_mid",health = 0},
{name = "dota_badguys_tower2_mid",health = 0},
{name = "dota_badguys_tower3_mid",health = 0},
{name = "bad_rax_range_mid",health = 0},
{name = "bad_rax_melee_mid",health = 0},
{name = "bad_rax_melee_top",health = 0},
{name = "bad_rax_range_top",health = 0},
{name = "dota_goodguys_tower1_bot",health = 0},
  },
  heroes = {
        luna = {
              name = "luna",
              team = 2,
              gold_reliable = 251,
              gold_unreliable = 0,
              level = 18,
              position = Vector(-4740.334814071655,1461.8226928710938,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_mask_of_madness","item_magic_wand","item_power_treads","item_skadi","item_dragon_lance","item_sange_and_yasha","item_tpscroll","item_quicksilver_amulet"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,5,5,7,8,14,15,16},
            },
        kunkka = {
              name = "kunkka",
              team = 2,
              gold_reliable = 429,
              gold_unreliable = 1007,
              level = 17,
              position = Vector(-673.8775577545166,-425.87670135498047,0),
              abilities = {},
              cooldowns = {0,2.600001335144043,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_phase_boots","item_bottle","item_platemail","item_heavens_halberd","item_armlet","item_magic_wand","item_tpscroll","item_tpscroll","item_ocean_heart","item_quelling_blade"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,5,6,6,6,6,7,9,15,16},
            },
        magnataur = {
              name = "magnataur",
              team = 2,
              gold_reliable = 421,
              gold_unreliable = 0,
              level = 15,
              position = Vector(-4023.338613510132,555.9650058746338,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,66.50082397460938,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_blink","item_helm_of_the_dominator","item_arcane_boots","item_cyclone","item_quelling_blade","item_sobi_mask","item_tpscroll","item_pogo_stick"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,6,9,15,16},
            },
        winter_wyvern = {
              name = "winter_wyvern",
              team = 3,
              gold_reliable = 499,
              gold_unreliable = 32,
              level = 9,
              position = Vector(5898.374004364014,5847.199224472046,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0.5308519601821899,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_magic_stick","item_arcane_boots","item_clarity","item_ward_dispenser","item_enchanted_mango","item_smoke_of_deceit","item_tpscroll","item_tpscroll","item_bullwhip"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,1,1,1,1,2,5,15,16},
            },
        spectre = {
              name = "spectre",
              team = 3,
              gold_reliable = 362,
              gold_unreliable = 13,
              level = 14,
              position = Vector(3675.1853256225586,1432.1919765472412,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,48.099273681640625,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_ultimate_scepter","item_power_treads","item_magic_wand","item_falcon_blade","item_blade_of_alacrity","item_quelling_blade","item_tpscroll","item_quicksilver_amulet"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,2,2,2,2,3,4,4,5,5,6,15,16},
            },
        undying = {
              name = "undying",
              team = 2,
              gold_reliable = 321,
              gold_unreliable = 1254,
              level = 12,
              position = Vector(-1855.5663928985596,-1842.4141387939453,0),
              abilities = {},
              cooldowns = {0,0,20.200305938720703,0,0,13.601348876953125,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_phase_boots","item_ancient_janggo","item_solar_crest","item_magic_wand","item_smoke_of_deceit","item_dust","item_tpscroll","item_essence_ring"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,2,2,2,2,5,5,7,15,16},
            },
        bane = {
              name = "bane",
              team = 2,
              gold_reliable = 218,
              gold_unreliable = 964,
              level = 12,
              position = Vector(-1435.3961219787598,-1109.64133644104,0),
              abilities = {},
              cooldowns = {0,0,5.299983978271484,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_tranquil_boots","item_magic_wand","item_ward_dispenser","item_enchanted_mango","item_dust","item_aether_lens","item_tpscroll","item_keen_optic","item_smoke_of_deceit"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,1,1,2,2,2,2,5,5,6,7,16},
            },
        templar_assassin = {
              name = "templar_assassin",
              team = 3,
              gold_reliable = 760,
              gold_unreliable = 885,
              level = 15,
              position = Vector(1101.4326210021973,-6609.4196491241455,0),
              abilities = {},
              cooldowns = {13.299985885620117,0,0,0,0,1.6000056266784668,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_blink","item_branches","item_bottle","item_power_treads","item_slippers","item_desolator","item_tpscroll","item_tpscroll","item_ring_of_aquila","item_branches"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,3,3,4,4,5,5,9,15,16},
            },
        lion = {
              name = "lion",
              team = 3,
              gold_reliable = 1816,
              gold_unreliable = 223,
              level = 8,
              position = Vector(3603.900718688965,-1037.166618347168,0),
              abilities = {},
              cooldowns = {0.2999905049800873,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_flask","item_enchanted_mango","item_tranquil_boots","item_magic_stick","item_tpscroll","item_tpscroll","item_tpscroll","item_tpscroll","item_tpscroll","item_trusty_shovel","item_tome_of_knowledge"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,2,5,15,16},
            },
        axe = {
              name = "axe",
              team = 3,
              gold_reliable = 236,
              gold_unreliable = 344,
              level = 11,
              position = Vector(2254.833429336548,-3881.3491973876953,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_boots","item_quelling_blade","item_blink","item_vanguard","item_broadsword","item_chainmail","item_tpscroll","item_arcane_ring","item_branches","item_ring_of_protection"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,2,2,2,2,5,15,16},
            },
  },
  creeps = {
        {
                name = "npc_dota_goodguys_siege_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5653.851934432983,5148.542942047119),
              },
        {
                name = "npc_dota_badguys_siege_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(609.3674297332764,-6254.217241287231),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(461.8546772003174,-6246.100072860718),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(67.56169509887695,-6227.058294296265),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(359.7492427825928,-6251.2877368927),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-39.761919021606445,-6192.453523635864),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(208.48306274414062,-6247.0765743255615),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(-5935.572607040405,4514.366271972656),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(5943.140493392944,-4774.573396682739),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5844.208688735962,4886.474361419678),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5769.536842346191,-5065.601348876953),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5882.414308547974,4785.864194869995),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5918.666925430298,4603.014295578003),
              },
        {
                name = "npc_dota_creep_goodguys_melee",
                team = 2,
                waypoint = "",
                position = Vector(-770.978422164917,-710.4963626861572),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5839.783916473389,-4947.780344009399),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5902.829292297363,4683.819791793823),
              },
        {
                name = "npc_dota_creep_goodguys_melee",
                team = 2,
                waypoint = "",
                position = Vector(-691.4240684509277,-604.4849224090576),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5981.529207229614,-4617.326145172119),
              },
        {
                name = "npc_dota_creep_goodguys_melee",
                team = 2,
                waypoint = "",
                position = Vector(-578.9738216400146,-497.86316871643066),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5706.003215789795,-5168.439159393311),
              },
        {
                name = "npc_dota_creep_goodguys_melee",
                team = 2,
                waypoint = "",
                position = Vector(-559.0165729522705,-421.1772880554199),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(-880.6517429351807,-674.5183868408203),
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
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(-6468.345703125,-3968.501953125),
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
                position = Vector(-3500.7577514648438,-5968.376953125),
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
                position = Vector(3968.990203857422,3446.500888824463),
              },
        {
                name = "npc_dota_creep_goodguys_melee",
                team = 2,
                waypoint = "",
                position = Vector(-4879.6388511657715,-4443.142696380615),
              },
        {
                name = "npc_dota_creep_goodguys_melee",
                team = 2,
                waypoint = "",
                position = Vector(-6421.229507446289,-3928.9841594696045),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(6066.789991378784,3541.2215309143066),
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
                position = Vector(3062.796844482422,5709.146329879761),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(4046.866195678711,3460.232940673828),
              },
        {
                name = "npc_dota_creep_goodguys_melee",
                team = 2,
                waypoint = "",
                position = Vector(-4921.079132080078,-4329.288728713989),
              },
        {
                name = "npc_dota_creep_goodguys_melee",
                team = 2,
                waypoint = "",
                position = Vector(-6526.172899246216,-3947.476655960083),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(6135.2976722717285,3501.6732215881348),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-3551.5968589782715,-6028.981075286865),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(3140.672836303711,5695.4142780303955),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(4010.4304847717285,3560.354856491089),
              },
        {
                name = "npc_dota_creep_goodguys_melee",
                team = 2,
                waypoint = "",
                position = Vector(-4948.146532058716,-4403.594387054443),
              },
        {
                name = "npc_dota_creep_goodguys_melee",
                team = 2,
                waypoint = "",
                position = Vector(-6479.087219238281,-3866.549097061157),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(6186.136779785156,3562.27734375),
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
                position = Vector(3035.729444503784,5634.840671539307),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(3941.922803878784,3520.806547164917),
              },
        {
                name = "npc_dota_creep_goodguys_melee",
                team = 2,
                waypoint = "",
                position = Vector(-4828.799743652344,-4382.53857421875),
              },
        {
                name = "npc_dota_creep_goodguys_melee",
                team = 2,
                waypoint = "",
                position = Vector(-6589.737041473389,-3988.764358520508),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(6041.645078659058,3622.515277862549),
              },
  },
  wards = {
            {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(555.7819118499756,3106.3121910095215,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(927.218656539917,-3021.3565635681152,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(-2086.14280128479,2038.9045429229736,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 2,
                position = Vector(684.1613388061523,5454.950792312622,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(1637.6234722137451,1015.4699764251709,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(1781.3522815704346,2888.2472076416016,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(1084.038688659668,4346.865755081177,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(650.1668815612793,384.3448734283447,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(1190.1416759490967,-5010.001796722412,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 3,
                position = Vector(1190.5383796691895,-5022.879409790039,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 2,
                position = Vector(3365.054563522339,998.5642948150635,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(3368.716444015503,998.5642948150635,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(3062.97993850708,-513.9754428863525,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(4470.911956787109,708.9705791473389,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 3,
                position = Vector(4521.293329238892,708.5738754272461,1000),
              },
      },
  roshan = { -- died at 14:43
    deaths = 1,
  },
  neutrals = {
		good = { "item_possessed_mask", "item_mysterious_hat", "item_ring_of_aquila", "item_nether_shawl"
		},
		bad = { "item_possessed_mask", "item_broom_handle", "item_ocean_heart", "item_pupils_gift", "item_vambrace"
		},
	},
  wincon = {
    default_winner = 3,
    time = 360,
  },
}
return GameState