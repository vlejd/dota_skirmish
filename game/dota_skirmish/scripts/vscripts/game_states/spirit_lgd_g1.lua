
local GameState = {
  game = {time = 1708},
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
              health = 976,
            },

            {
              name = "dota_goodguys_tower2_mid",
              health = 2257,
            },

            {
              name = "dota_goodguys_tower2_top",
              health = 1716,
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
              health = 1645,
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
              health = 1354,
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
{name = "dota_badguys_tower1_bot",health = 0},
{name = "dota_goodguys_tower1_top",health = 0},
{name = "dota_goodguys_tower1_mid",health = 0},
{name = "dota_goodguys_tower1_bot",health = 0},
  },
  heroes = {
        elder_titan = {
              name = "elder_titan",
              team = 2,
              gold_reliable = 1735,
              gold_unreliable = 611,
              level = 12,
              position = Vector(4905.729749679565,-1455.353370666504,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_veil_of_discord","item_tranquil_boots","item_magic_wand","item_ward_sentry","item_enchanted_mango","item_smoke_of_deceit","item_tpscroll","item_philosophers_stone","item_flask","item_enchanted_mango"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,1,1,1,2,2,2,2,5,5,6,6,6,16},
            },
        naga_siren = {
              name = "naga_siren",
              team = 2,
              gold_reliable = 819,
              gold_unreliable = 1134,
              level = 19,
              position = Vector(5475.518354415894,-1410.0070838928223,0),
              abilities = {},
              cooldowns = {23.4999942779541,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_ultimate_scepter","item_power_treads","item_bloodthorn","item_slippers","item_manta","item_vitality_booster","item_tpscroll","item_broom_handle"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,5,5,6,7,9,15,15,16},
            },
        void_spirit = {
              name = "void_spirit",
              team = 2,
              gold_reliable = 334,
              gold_unreliable = 724,
              level = 17,
              position = Vector(4344.973783493042,-2181.717882156372,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_null_talisman","item_magic_wand","item_null_talisman","item_travel_boots","item_cyclone","item_kaya_and_sange","item_tpscroll","item_nether_shawl","item_bottle"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,5,7,9,14,15,16},
            },
        lion = {
              name = "lion",
              team = 2,
              gold_reliable = 40,
              gold_unreliable = 0,
              level = 12,
              position = Vector(4586.627380371094,-676.8680934906006,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_blink","item_magic_stick","item_tranquil_boots","item_tpscroll","item_keen_optic"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,5,5,15,16},
            },
        ursa = {
              name = "ursa",
              team = 3,
              gold_reliable = 544,
              gold_unreliable = 2040,
              level = 16,
              position = Vector(1298.0756034851074,3317.450117111206,0),
              abilities = {},
              cooldowns = {7.500000476837158,6.199998378753662,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_phase_boots","item_magic_wand","item_diffusal_blade","item_black_king_bar","item_lifesteal","item_basher","item_tpscroll","item_elven_tunic"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,5,7,9,15,16},
            },
        pangolier = {
              name = "pangolier",
              team = 3,
              gold_reliable = 891,
              gold_unreliable = 2671,
              level = 17,
              position = Vector(6719.67276763916,1828.0717735290527,0),
              abilities = {},
              cooldowns = {3.000004768371582,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_bottle","item_magic_wand","item_boots","item_maelstrom","item_blink","item_orb_of_corrosion","item_pupils_gift"},	
              has_shard = true,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,3,4,5,5,6,6,7,10,15,16},
            },
        lycan = {
              name = "lycan",
              team = 3,
              gold_reliable = 82,
              gold_unreliable = 339,
              level = 17,
              position = Vector(6037.983198165894,2532.6480960845947,0),
              abilities = {},
              cooldowns = {2.3999218940734863,8.599971771240234,0,0,0,1.3008753061294556,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_helm_of_the_overlord","item_ancient_janggo","item_assault","item_quelling_blade","item_dust","item_ocean_heart"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,5,7,9,14,15,16},
            },
        tidehunter = {
              name = "tidehunter",
              team = 2,
              gold_reliable = 1170,
              gold_unreliable = 804,
              level = 16,
              position = Vector(4204.937370300293,-446.7494201660156,0),
              abilities = {},
              cooldowns = {0,0,2.8000011444091797,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_phase_boots","item_soul_ring","item_blink","item_cyclone","item_hood_of_defiance","item_platemail","item_tpscroll","item_paintball"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,5,6,8,15,16},
            },
        wisp = {
              name = "wisp",
              team = 3,
              gold_reliable = 85,
              gold_unreliable = 0,
              level = 13,
              position = Vector(1789.7135753631592,2911.072929382324,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_mekansm","item_holy_locket","item_dust","item_infused_raindrop","item_tpscroll","item_tpscroll","item_tpscroll","item_bullwhip","item_quickening_charm"},	
              has_shard = true,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,1,1,1,2,2,2,2,3,3,3,4,4,4,5,6,6,6,6,7,16},
            },
        disruptor = {
              name = "disruptor",
              team = 3,
              gold_reliable = 573,
              gold_unreliable = 38,
              level = 10,
              position = Vector(5849.762540817261,2739.422281265259,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_void_stone","item_smoke_of_deceit","item_fluffy_hat","item_wind_lace","item_tranquil_boots","item_ward_dispenser","item_tpscroll","item_tpscroll","item_pogo_stick","item_recipe_aether_lens","item_branches"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,1,1,1,1,2,2,2,2,5,15,16},
            },
  },
  creeps = {
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(-6245.550790786743,-268.9651222229004),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-6243.445209503174,-655.1714515686035),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-6118.361474990845,-661.0914916992188),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-6269.475076675415,-588.9219303131104),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(-5367.645458221436,5421.9938678741455),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(-2261.7910022735596,-1872.5025901794434),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(4859.010257720947,-5769.811483383179),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-5296.269304275513,5429.958457946777),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-2535.150381088257,-2183.2436656951904),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(4952.388210296631,-5742.896661758423),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-5442.95813369751,5410.428428649902),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-2481.3512535095215,-2124.0737800598145),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(5026.327680587769,-5721.016925811768),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-5629.43939781189,5327.639413833618),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-2424.317464828491,-2061.1504669189453),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(5126.724237442017,-5692.454257965088),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-5553.760534286499,5396.1470947265625),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-2612.0803871154785,-2270.3659057617188),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(5200.328035354614,-5669.2318325042725),
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
                position = Vector(6124.6171875,3562.27734375),
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
                position = Vector(3999.75,3499.78125),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(-4890.3193359375,-4382.53857421875),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(3035.729444503784,5634.840671539307),
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
                position = Vector(6135.2976722717285,3501.6732215881348),
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
                position = Vector(4046.866195678711,3539.2990436553955),
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
                position = Vector(-4843.203140258789,-4422.086883544922),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-3593.037139892578,-5915.127107620239),
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
                position = Vector(-6499.105499267578,-3915.2521076202393),
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
                position = Vector(3968.990203857422,3446.500888824463),
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
                position = Vector(6066.789991378784,3583.302640914917),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-4843.203140258789,-4343.0207805633545),
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
                position = Vector(3062.796844482422,5709.146329879761),
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
                position = Vector(6041.645078659058,3502.008893966675),
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
                position = Vector(-4921.079132080078,-4329.288728713989),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-6345.3065185546875,-3968.501953125),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(3968.990203857422,3553.0310955047607),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-4948.146532058716,-4403.594387054443),
              },
  },
  wards = {
            {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(-4421.903789520264,1890.7204456329346,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(-2226.514886856079,1852.5453414916992,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(-2721.8757705688477,3440.3977546691895,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 2,
                position = Vector(-1683.0918216705322,941.6525688171387,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(2709.364345550537,-841.286527633667,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(-3285.195053100586,1204.9722919464111,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 3,
                position = Vector(-247.11590194702148,-1013.5780048370361,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 2,
                position = Vector(-764.1429119110107,-4866.974847793579,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(1155.9946403503418,2813.148141860962,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(-1292.7353610992432,4137.467222213745,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 3,
                position = Vector(-1745.3743057250977,5675.762186050415,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(1670.4583339691162,-5580.400714874268,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 2,
                position = Vector(3500.4220790863037,-5059.772855758667,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(3344.5175170898438,-5572.802312850952,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 2,
                position = Vector(5861.633136749268,-2576.6822090148926,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(1410.647912979126,824.1062049865723,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 2,
                position = Vector(4021.3245792388916,-873.2974662780762,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(3624.43776512146,-507.78076171875,1000),
              },
      },
  roshan = { -- should be killed at 23:04
    deaths = 1,
	alive = false,
	time_since_death = 324,
  },
  neutrals = {
		good = { "item_trusty_shovel", "item_unstable_wand", "item_ocean_heart", "item_pupils_gift", "item_grove_bow", "item_titan_sliver"
		},
		bad = { "item_arcane_ring", "item_possessed_mask", "item_mysterious_hat", "item_nether_shawl", "item_grove_bow", "item_ring_of_aquila", "item_psychic_headband", "item_enchanted_quiver"
		},
	},
  wincon = nil,
}
return GameState