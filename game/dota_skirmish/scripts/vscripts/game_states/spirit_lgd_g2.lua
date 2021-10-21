
local GameState = {
  game = {time = 1169},
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
              health = 1950,
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
              health = 1780,
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
              health = 2500,
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
              health = 2288,
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
              name = "dota_goodguys_tower1_mid",
              health = 524,
            },

            {
              name = "dota_badguys_tower1_bot",
              health = 886,
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
{name = "dota_goodguys_tower1_bot",health = 0},
  },
  heroes = {
        morphling = {
              name = "morphling",
              team = 2,
              gold_reliable = 77,
              gold_unreliable = 344,
              level = 13,
              position = Vector(3949.887393951416,-5882.017604827881,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_manta","item_magic_wand","item_power_treads","item_lifesteal","item_aegis","item_dragon_lance","item_tpscroll","item_nether_shawl","item_sobi_mask"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,2,2,3,3,3,3,4,4,4,4,5,5,6,6,7,7,7,7,9},
            },
        leshrac = {
              name = "leshrac",
              team = 2,
              gold_reliable = 203,
              gold_unreliable = 0,
              level = 14,
              position = Vector(-2469.511173248291,-246.99383926391602,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_arcane_boots","item_magic_wand","item_null_talisman","item_bottle","item_eternal_shroud","item_sange","item_tpscroll"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,5,5,7,14,15,16},
            },
        furion = {
              name = "furion",
              team = 2,
              gold_reliable = 422,
              gold_unreliable = 0,
              level = 13,
              position = Vector(-4492.700145721436,-639.7915534973145,0),
              abilities = {},
              cooldowns = {0,16.49998664855957,24.20004653930664,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_orchid","item_power_treads","item_faerie_fire","item_circlet","item_mantle","item_flask","item_tpscroll","item_broom_handle","item_branches","item_branches"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,1,1,1,1,2,2,2,2,5,5,6,15,16},
            },
        earthshaker = {
              name = "earthshaker",
              team = 2,
              gold_reliable = 463,
              gold_unreliable = 267,
              level = 10,
              position = Vector(2650.530132293701,-5821.688123703003,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_blink","item_smoke_of_deceit","item_clarity","item_magic_stick","item_tranquil_boots","item_ward_sentry","item_tpscroll","item_tpscroll","item_tpscroll","item_arcane_ring"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,2,2,2,2,5,15,16},
            },
        bane = {
              name = "bane",
              team = 3,
              gold_reliable = 192,
              gold_unreliable = 0,
              level = 8,
              position = Vector(4190.228816986084,-5070.087152481079,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_quelling_blade","item_boots","item_magic_wand","item_ward_sentry","item_enchanted_mango","item_tpscroll","item_tpscroll"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {1,1,1,2,2,2,2,5,6,16},
            },
        luna = {
              name = "luna",
              team = 3,
              gold_reliable = 187,
              gold_unreliable = 738,
              level = 16,
              position = Vector(4355.867877960205,-2223.005584716797,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,9.201263427734375,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_mask_of_madness","item_power_treads","item_black_king_bar","item_lesser_crit","item_dragon_lance","item_quelling_blade","item_tpscroll","item_grove_bow"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,5,5,7,8,15,16},
            },
        puck = {
              name = "puck",
              team = 3,
              gold_reliable = 239,
              gold_unreliable = 408,
              level = 14,
              position = Vector(435.3365592956543,1209.3360328674316,0),
              abilities = {},
              cooldowns = {0.7100266218185425,10.110013961791992,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_blink","item_bottle","item_boots","item_veil_of_discord","item_aeon_disk","item_tpscroll","item_nether_shawl","item_null_talisman","item_null_talisman"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,5,7,15,16},
            },
        wisp = {
              name = "wisp",
              team = 2,
              gold_reliable = 82,
              gold_unreliable = 102,
              level = 10,
              position = Vector(-2108.9685230255127,-256.5757598876953,0),
              abilities = {},
              cooldowns = {0,15.899961471557617,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_soul_ring","item_magic_wand","item_flask","item_chainmail","item_headdress","item_tpscroll","item_trusty_shovel"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,1,2,2,2,3,4,5,6,6,6,6,7,16},
            },
        dark_willow = {
              name = "dark_willow",
              team = 3,
              gold_reliable = 319,
              gold_unreliable = 138,
              level = 8,
              position = Vector(718.705078125,6405.849609375,0),
              abilities = {},
              cooldowns = {7.499955177307129,0,0,18.999958038330078,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_tranquil_boots","item_quelling_blade","item_urn_of_shadows","item_magic_wand","item_faerie_fire","item_tpscroll","item_unstable_wand"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,2,3,5,15,16},
            },
        magnataur = {
              name = "magnataur",
              team = 3,
              gold_reliable = 564,
              gold_unreliable = 524,
              level = 13,
              position = Vector(3940.0308322906494,-1368.353193283081,0),
              abilities = {},
              cooldowns = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
              items = {"item_arcane_boots","item_mekansm","item_blink","item_quelling_blade","item_magic_wand","item_bracer","item_tpscroll","item_essence_ring","item_gauntlets","item_flask"},	
              has_shard = false,
              has_ags = false,
              has_moon_shard = false,
              talents = {0,0,0,0,1,1,1,1,2,2,2,5,6,15,16},
            },
  },
  creeps = {
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-969.1777038574219,5845.73447227478),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(-517.2406196594238,5782.8416748046875),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(3257.2426986694336,-6046.83274269104),
              },
        {
                name = "npc_dota_creep_badguys_ranged",
                team = 3,
                waypoint = "",
                position = Vector(5775.456882476807,-5053.242502212524),
              },
        {
                name = "npc_dota_creep_goodguys_ranged",
                team = 2,
                waypoint = "",
                position = Vector(-5845.887050628662,4883.239700317383),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-910.1298809051514,5930.598552703857),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(3661.9720401763916,-6014.394584655762),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5613.14402961731,-5328.005601882935),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5620.101602554321,5171.917945861816),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(3314.123908996582,-6035.99967956543),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5721.8408489227295,-5142.928058624268),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5715.554620742798,5105.882034301758),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(-947.6031246185303,5990.287204742432),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(3564.2303466796875,-6027.546838760376),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5668.49945640564,-5232.400005340576),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5791.752250671387,5013.419551849365),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(3455.9302310943604,-6033.7415199279785),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(5528.676652908325,-5463.800336837769),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-5824.831237792969,4934.872215270996),
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
                position = Vector(-3562.27734375,-5968.376953125),
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
                position = Vector(-6421.229507446289,-3928.9841594696045),
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
                position = Vector(-4843.203140258789,-4343.0207805633545),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(3941.922803878784,3478.7254371643066),
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
                position = Vector(-6499.105499267578,-3915.2521076202393),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(3035.729444503784,5676.921781539917),
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
                position = Vector(-4921.079132080078,-4329.288728713989),
              },
        {
                name = "npc_dota_creep_badguys_melee_upgraded",
                team = 3,
                waypoint = "",
                position = Vector(4010.4304847717285,3439.1771278381348),
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
                position = Vector(3104.2371253967285,5595.292362213135),
              },
        {
                name = "npc_dota_creep_goodguys_melee_upgraded",
                team = 2,
                waypoint = "",
                position = Vector(-3515.161148071289,-6007.925262451172),
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
                position = Vector(6135.2976722717285,3501.6732215881348),
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
                position = Vector(3010.5845317840576,5595.628034591675),
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
                position = Vector(-4843.203140258789,-4422.086883544922),
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
                position = Vector(6186.136779785156,3562.27734375),
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
                position = Vector(-3593.037139892578,-6021.657314300537),
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
                type = "npc_dota_observer_wards",
                team = 3,
                position = Vector(4465.205526351929,711.9916305541992,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(3501.703737258911,-285.10791206359863,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(2014.0342712402344,-808.3601188659668,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 2,
                position = Vector(700.426191329956,2891.207227706909,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(538.5100421905518,3992.0600509643555,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(360.2985248565674,-1444.0320568084717,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(-2363.4387016296387,-1748.5784511566162,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 2,
                position = Vector(-1513.455207824707,49.13022994995117,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(-1040.6759204864502,256.3926658630371,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(-1982.6336460113525,1508.969404220581,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 2,
                position = Vector(-684.4359798431396,-4050.375497817993,1000),
              },
        {
                type = "npc_dota_observer_wards",
                team = 3,
                position = Vector(3390.1079292297363,-5195.1098556518555,1000),
              },
        {
                type = "npc_dota_sentry_wards",
                team = 3,
                position = Vector(3621.782901763916,-5151.411415100098,1000),
              },
      },
  roshan = { -- should be killed at 18:08
    deaths = 1,
  },
  neutrals = {
		good = { "item_possessed_mask", "item_keen_optic", "item_quicksilver_amulet", "item_dragon_scale", "item_pupils_gift", "item_ring_of_aquila"
		},
		bad = { "item_possessed_mask", "item_ocean_heart", "item_trusty_shovel", "item_chipped_vest", "item_dragon_scale", "item_bullwhip"
		},
	},
  wincon = nil,
}
return GameState