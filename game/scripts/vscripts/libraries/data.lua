_G.units_data = {
    lorencia = {
        bull_fighter = {
            health = 100,
            damage_min = 16,
            damage_max = 20,
            defense = 6,
            level = 6,
            model = "models/creeps/neutral_creeps/n_creep_furbolg/n_creep_furbolg_disrupter.vmdl",
			drop = {
                item = {
                    [1] = {item_class= 'item', luck_chance= 20, set_name = 'Pad', item_type = 'gloves', level = 1, item_rarity = 'excellent'},
                    [2] = {item_class= 'item', luck_chance= 20, set_name = 'Leather', item_type = 'gloves', level = 0, item_rarity = 'excellent'},
                    [3] = {item_class= 'item', luck_chance= 20, set_name = 'Vine', item_type = 'gloves', level = 0, item_rarity = 'excellent'},
                },
				zen = {
                    [1] = {item_class= 'zen', zen_min= 100, zen_max= 300}
                },
				bless = {
                    [1] = {item_class= 'jewel', set_name = '', item_type = 'bless', level = 0, item_rarity = ''}
                },
				soul = {
                    [1] = {item_class= 'jewel', set_name = '', item_type = 'soul', level = 0, item_rarity = ''}
                },
			},
            chances = {
                {type = "no_drop", chance = 50},
                {type = "zen", chance = 26},
                {type = "item", chance = 20},
                {type = "bless", chance = 3},
                {type = "soul", chance = 1},
            },
			duration = 20,
        },
        hound = {
            health = 140,
            damage_min = 22,
            damage_max = 27,

            defense = 9,
            level = 9,
            model = "models/creeps/neutral_creeps/n_creep_eimermole/n_creep_eimermole.vmdl",
        },
        budge_dragon = {
            health = 60,
            damage_min = 10,
            damage_max = 13,

            defense = 3,
            level = 4,
            model = "models/creeps/neutral_creeps/n_creep_black_drake/n_creep_black_drake.vmdl",
        },
        spider = {
            health = 30,
            damage_min = 4,
            damage_max = 5,

            defense = 1,
            level = 2,
            model = "models/events/crownfall/survivors/spiderling_elder_brood/spiderling_elder_blood_enemy.vmdl",
        },
        elite_bull_fighter = {
            health = 190,
            damage_min = 31,
            damage_max = 36,

            defense = 12,
            level = 12,
            model = "models/creeps/neutral_creeps/n_creep_furbolg/n_creep_furbolg_disrupter.vmdl",
        },
        lich = {
            health = 255,
            damage_min = 41,
            damage_max = 46,

            defense = 14,
            level = 14,
            model = "models/creeps/neutral_creeps/n_creep_ogre_lrg/n_creep_ogre_lrg.vmdl",
        },
        giant = {
            health = 400,
            damage_min = 57,
            damage_max = 62,

            defense = 18,
            level = 17,
            model = "models/creeps/neutral_creeps/n_creep_golem_a/neutral_creep_golem_a.vmdl",
        },
        skeleton = {
            health = 525,
            damage_min = 68,
            damage_max = 74,

            defense = 22,
            level = 19,
            model = "models/creeps/neutral_creeps/n_creep_troll_skeleton/n_creep_skeleton_melee.vmdl",
        },
    },
    devias = {
        yeti = {
            health = 900,
            damage_min = 105,
            damage_max = 110,

            defense = 37,
            level = 30,
            model = "models/creeps/neutral_creeps/n_creep_satyr_c/n_creep_satyr_c.vmdl",
        },
        elite_yeti = {
            health = 1200,
            damage_min = 120,
            damage_max = 125,

            defense = 50,
            level = 36,
            model = "models/creeps/neutral_creeps/n_creep_satyr_a/n_creep_satyr_a.vmdl",
        },
        assassin = {
            health = 800,
            damage_min = 95,
            damage_max = 100,

            defense = 33,
            level = 26,
            model = "models/creeps/neutral_creeps/n_creep_gnoll/n_creep_gnoll.vmdl",
        },
        ice_monster = {
            health = 650,
            damage_min = 80,
            damage_max = 85,

            defense = 27,
            level = 22,
            model = "models/creeps/neutral_creeps/n_creep_ghost_b/n_creep_ghost_b.vmdl",
        },
        hommerd = {
            health = 700,
            damage_min = 85,
            damage_max = 90,

            defense = 29,
            level = 24,
            model = "models/creeps/neutral_creeps/n_creep_kobold/kobold_b/n_creep_kobold_b.vmdl",
        },
        worm = {
            health = 600,
            damage_min = 75,
            damage_max = 80,

            defense = 25,
            level = 20,
            model = "models/creeps/neutral_creeps/n_creep_jungle_stalker/n_creep_gargoyle_jungle_stalker.vmdl",
        },
        ice_queen = {
            health = 4000,
            damage_min = 155,
            damage_max = 165,

            defense = 90,
            level = 52,
            model = "models/creeps/neutral_creeps/n_creep_satyr_b/n_creep_satyr_b.vmdl",
        },
    },
    dungeon = {
        poison_bull_fighter = {
            health = 2500,
            damage_min = 145,
            damage_max = 150,

            defense = 75,
            level = 46,
            model = "models/creeps/neutral_creeps/n_creep_furbolg/n_creep_furbolg_disrupter.vmdl",
        },
        thunder_lich = {
            health = 2000,
            damage_min = 140,
            damage_max = 145,

            defense = 70,
            level = 44,
            model = "models/creeps/neutral_creeps/n_creep_thunder_lizard/n_creep_thunder_lizard_big.vmdl",
        },
        dark_knight = {
            health = 3000,
            damage_min = 150,
            damage_max = 155,

            defense = 80,
            level = 48,
            model = "models/creeps/neutral_creeps/n_creep_dragonspawn_b/n_creep_dragonspawn_b.vmdl",
        },
        ghost = {
            health = 1000,
            damage_min = 110,
            damage_max = 115,

            defense = 40,
            level = 32,
            model = "models/creeps/neutral_creeps/n_creep_ghost_b/n_creep_ghost_frost.vmdl",
        },
        larva = {
            health = 750,
            damage_min = 90,
            damage_max = 95,

            defense = 31,
            level = 25,
            model = "models/items/broodmother/spiderling/the_glacial_creeper_creepling/the_glacial_creeper_creepling.vmdl",
        },
        hell_spider = {
            health = 1600,
            damage_min = 130,
            damage_max = 135,

            defense = 60,
            level = 40,
            model = "models/items/broodmother/spiderling/the_glacial_creeper_creepling/the_glacial_creeper_creepling_dpc.vmdl",
        },
        skeleton = {
            health = 525,
            damage_min = 68,
            damage_max = 74,

            defense = 22,
            level = 19,
            model = "models/creeps/neutral_creeps/n_creep_troll_skeleton/n_creep_skeleton_melee.vmdl",
        },
        skeleton_archer = {
            health = 1100,
            damage_min = 115,
            damage_max = 120,

            defense = 45,
            level = 34,
            model = "models/creeps/item_creeps/i_creep_necro_archer/necro_archer.vmdl",
        },
        hell_hound = {
            health = 1400,
            damage_min = 125,
            damage_max = 130,

            defense = 55,
            level = 38,
            model = "models/creeps/neutral_creeps/n_creep_eimermole/n_creep_eimermole_lamp.vmdl",
        },
        chief_skeleton_warrior = {
            health = 1800,
            damage_min = 135,
            damage_max = 140,

            defense = 65,
            level = 42,
            model = "models/items/wraith_king/wk_ti8_creep/wk_ti8_creep.vmdl",
        },
        cyclops = {
            health = 850,
            damage_min = 100,
            damage_max = 105,

            defense = 35,
            level = 28,
            model = "models/creeps/pine_cone/pine_cone.vmdl",
        },
        gorgon = {
            health = 6000,
            damage_min = 165,
            damage_max = 175,

            defense = 100,
            level = 55,
            model = "models/creeps/lane_creeps/creep_dire_hulk/creep_dire_ancient_hulk.vmdl",
        },
    },
    lost_tower = {
        cursed_wizard = {
            health = 4000,
            damage_min = 160,
            damage_max = 170,

            defense = 95,
            level = 54,
            model = "models/creeps/ice_biome/frostbitten/n_creep_frostbitten_shaman01.vmdl",
        },
        death_gorgon = {
            health = 6000,
            damage_min = 200,
            damage_max = 210,

            defense = 130,
            level = 64,
            model = "models/creeps/lane_creeps/creep_dire_hulk/creep_dire_winter_ancient_hulk.vmdl",
        },
        shadow = {
            health = 2800,
            damage_min = 148,
            damage_max = 153,

            defense = 78,
            level = 47,
            model = "models/creeps/lane_creeps/ti9_crocodilian_dire/ti9_crocodilian_dire_melee_mega.vmdl",
        },
        devil = {
            health = 5000,
            damage_min = 180,
            damage_max = 195,

            defense = 115,
            level = 60,
            model = "models/creeps/item_creeps/i_creep_necro_warrior/necro_warrior.vmdl",
        },
        balrog = {
            health = 9000,
            damage_min = 220,
            damage_max = 240,

            defense = 160,
            level = 66,
            model = "models/creeps/lane_creeps/creep_2021_dire/creep_2021_dire_melee_mega.vmdl",
        },
        poison_shadow = {
            health = 3500,
            damage_min = 155,
            damage_max = 160,

            defense = 85,
            level = 50,
            model = "models/creeps/lane_creeps/ti9_crocodilian_dire/ti9_crocodilian_dire_melee.vmdl",
        },
        death_knight = {
            health = 5500,
            damage_min = 190,
            damage_max = 200,

            defense = 120,
            level = 62,
            model = "models/creeps/neutral_creeps/n_creep_dragonspawn_a/n_creep_dragonspawn_a.vmdl",
        },
        death_cow = {
            health = 4500,
            damage_min = 170,
            damage_max = 180,

            defense = 110,
            level = 57,
            model = "models/creeps/neutral_creeps/n_creep_forest_trolls/n_creep_forest_troll_high_priest.vmdl",
        },
    },
    atlans = {
        bahamut = {
            health = 2400,
            damage_min = 130,
            damage_max = 140,

            defense = 65,
            level = 43,
            model = "models/creeps/neutral_creeps/n_creep_harpy_a/n_creep_harpy_a.vmdl",
        },
        vepar = {
            health = 2800,
            damage_min = 135,
            damage_max = 145,

            defense = 70,
            level = 45,
            model = "models/creeps/neutral_creeps/n_creep_vulture_a/n_creep_vulture_a.vmdl",
        },
        valkyrie = {
            health = 3200,
            damage_min = 140,
            damage_max = 150,

            defense = 75,
            level = 46,
            model = "models/creeps/neutral_creeps/n_creep_satyr_spawn_a/n_creep_satyr_spawn_b.vmdl",
        },
        lizard_king = {
            health = 9000,
            damage_min = 240,
            damage_max = 170,

            defense = 180,
            level = 70,
            model = "models/items/wraith_king/wk_ti8_creep/wk_ti8_creep_crimson.vmdl",
        },
        hydra = {
            health = 19000,
            damage_min = 250,
            damage_max = 310,

            defense = 200,
            level = 74,
            model = "models/creeps/lane_creeps/creep_bad_melee/creep_bad_melee_flagbearer_crystal.vmdl",
        },
        great_bahamut = {
            health = 7000,
            damage_min = 210,
            damage_max = 230,

            defense = 150,
            level = 66,
            model = "models/creeps/neutral_creeps/n_creep_harpy_b/n_creep_harpy_b.vmdl",
        },
        silver_valkyrie = {
            health = 8000,
            damage_min = 230,
            damage_max = 260,

            defense = 170,
            level = 68,
            model = "models/creeps/neutral_creeps/n_creep_satyr_spawn_a/n_creep_satyr_spawn_a.vmdl",
        },
    },
    tarkan = {
        iron_wheel = {
            health = 17000,
            damage_min = 280,
            damage_max = 330,

            defense = 215,
            level = 80,
            model = "models/creeps/ice_biome/tuskfolk/tuskfolk001c_f.vmdl",
        },
        tantalos = {
            health = 22000,
            damage_min = 335,
            damage_max = 385,

            defense = 250,
            level = 83,
            model = "models/creeps/darkreef/gaoler/darkreef_gaoler.vmdl",
        },
        zaikan = {
            health = 34000,
            damage_min = 510,
            damage_max = 590,

            defense = 400,
            level = 90,
            model = "models/creeps/n_creep_ogre_med/n_creep_ogre_med.vmdl",
        },
        bloody_wolf = {
            health = 13500,
            damage_min = 260,
            damage_max = 300,

            defense = 200,
            level = 76,
            model = "models/creeps/neutral_creeps/n_creep_worg_large/n_creep_worg_large.vmdl",
        },
        beam_knight = {
            health = 25000,
            damage_min = 375,
            damage_max = 425,

            defense = 275,
            level = 84,
            model = "models/creeps/neutral_creeps/n_creep_centaur_med/n_creep_centaur_med.vmdl",
        },
        mutant = {
            health = 10000,
            damage_min = 250,
            damage_max = 280,

            defense = 190,
            level = 72,
            model = "models/creeps/mega_greevil/mega_greevil.vmdl",
        },
        death_beam_knight = {
            health = 40000,
            damage_min = 590,
            damage_max = 650,

            defense = 420,
            level = 86,
            model = "models/creeps/neutral_creeps/n_creep_centaur_lrg/n_creep_centaur_lrg.vmdl",
        },
    },
    aida  = {
        witch_queen = {
            health = 38500,
            damage_min = 408,
            damage_max = 442,

            defense = 357,
            level = 94,
            model = "models/creeps/ice_biome/giant/ice_giant01.vmdl",
        },
        blue_golem = {
            health = 25000,
            damage_min = 288,
            damage_max = 322,

            defense = 277,
            level = 84,
            model = "models/items/warlock/golem/warlock_the_infernal_master_golem/warlock_the_infernal_master_golem.vmdl",
        },
        death_rider = {
            health = 14000,
            damage_min = 260,
            damage_max = 294,

            defense = 222,
            level = 78,
            model = "models/events/crownfall/survivors/golem/golem.vmdl",
        },
        forest_orc = {
            health = 11000,
            damage_min = 258,
            damage_max = 282,

            defense = 197,
            level = 74,
            model = "models/npc/munaiyi/munaiyi.vmdl",
        },
        death_tree = {
            health = 10000,
            damage_min = 248,
            damage_max = 272,

            defense = 187,
            level = 72,
            model = "models/items/furion/treant_flower_1.vmdl",
        },
        hell_maine = {
            health = 50000,
            damage_min = 550,
            damage_max = 600,

            defense = 520,
            level = 98,
            model = "models/items/warlock/golem/hellsworn_golem/hellsworn_golem.vmdl",
        },
        bloody_orc = {
            health = 117000,
            damage_min = 675,
            damage_max = 710,

            defense = 420,
            level = 114,
            model = "models/npc/fashi/fashi.vmdl",
        },
        bloody_death_rider = {
            health = 88000,
            damage_min = 795,
            damage_max = 830,

            defense = 460,
            level = 115,
            model = "models/events/crownfall/survivors/golem/golem.vmdl",
        },
        bloody_golem = {
            health = 129700,
            damage_min = 715,
            damage_max = 750,

            defense = 470,
            level = 117,
            model = "models/items/warlock/golem/tevent_2_gatekeeper_golem/tevent_2_gatekeeper_golem.vmdl",
        },
        bloody_witch_queen = {
            health = 8570,
            damage_min = 835,
            damage_max = 870,

            defense = 480,
            level = 120,
            model = "models/npc/d42/d42.vmdl",
        },
    },
    crywolf  = {
        hammer_scout = {
            health = 45000,
            damage_min = 530,
            damage_max = 560,

            defense = 420,
            level = 97,
            model = "models/creeps/lane_creeps/creep_2021_dire/creep_2021_dire_melee_mega.vmdl",
        },
        lance_scout = {
            health = 45000,
            damage_min = 530,
            damage_max = 560,

            defense = 420,
            level = 97,
            model = "models/creeps/lane_creeps/creep_bad_melee/creep_bad_melee_mega_crystal.vmdl",
        },
        bow_scout = {
            health = 45000,
            damage_min = 530,
            damage_max = 560,

            defense = 420,
            level = 97,
            model = "models/creeps/lane_creeps/creep_bird_dire/creep_bird_dire_melee.vmdl",
        },
        werewolf = {
            health = 110000,
            damage_min = 830,
            damage_max = 850,

            defense = 680,
            level = 118,
            model = "models/items/lycan/wolves/frostivus2018_lycan_winter_snow_wolf_wolves/dpc_2022_frostivus2018_lycan_winter_snow_wolf_wolves.vmdl",
        },
        scout = {
            health = 120000,
            damage_min = 890,
            damage_max = 910,

            defense = 740,
            level = 123,
            model = "models/creeps/lane_creeps/creep_bird_radiant/creep_bird_radiant_melee.vmdl",
        },
        werewolf_2 = {
            health = 123000,
            damage_min = 964,
            damage_max = 1015,

            defense = 800,
            level = 127,
            model = "models/items/lycan/wolves/frostivus2018_lycan_winter_snow_wolf_wolves/dpc_2022_frostivus2018_lycan_winter_snow_wolf_wolves.vmdl",
        },
        balram = {
            health = 140000,
            damage_min = 1075,
            damage_max = 1140,

            defense = 885,
            level = 132,
            model = "models/creeps/lane_creeps/creep_radiant_melee/radiant_melee_mega_crystal.vmdl",
        },
        soram = {
            health = 164000,
            damage_min = 1200,
            damage_max = 1300,

            defense = 982,
            level = 134,
            model = "models/creeps/lane_creeps/nemestice_crystal_creeps/creep_radiant_ranged/crystal_radiant_ranged.vmdl",
        },
        balgass = {
            health = 400000,
            damage_min = 1000,
            damage_max = 1500,

            defense = 700,
            level = 135,
            model = "models/items/lone_druid/true_form/wolf_hunter_true_form/wolf_hunter_true_form.vmdl",
        },
    },
    icarus = {
        alquamos = {
            health = 11500,
            damage_min = 255,
            damage_max = 290,

            defense = 195,
            level = 75,
            model = "models/items/visage/visage_vulture_wraith_ability/visage_vulture_wraith_ability.vmdl",
        },
        queen_rainier = {
            health = 19000,
            damage_min = 305,
            damage_max = 350,

            defense = 230,
            level = 82,
            model = "models/items/enigma/eidolon/tentacular_conqueror_tentacular_conqueror_eidolons/tentacular_conqueror_tentacular_conqueror_eidolons.vmdl",
        },
        mega_crust = {
            health = 15000,
            damage_min = 270,
            damage_max = 320,

            defense = 210,
            level = 78,
            model = "models/items/invoker/forge_spirit/dark_sorcerer_forge_spirit/dark_sorcerer_forge_spirit.vmdl",
        },
        phantom_knight = {
            health = 41000,
            damage_min = 560,
            damage_max = 610,

            defense = 425,
            level = 96,
            model = "models/items/dragon_knight/oblivion_blazer_dragon/oblivion_blazer_dragon.vmdl",
        },
        drakan = {
            health = 29000,
            damage_min = 425,
            damage_max = 480,

            defense = 305,
            level = 86,
            model = "models/items/broodmother/spiderling/amber_queen_spiderling_2/amber_queen_spiderling_2.vmdl",
        },
        alpha_crust = {
            health = 34500,
            damage_min = 489,
            damage_max = 540,

            defense = 360,
            level = 92,
            model = "models/heroes/visage/rubick_visage_familiar.vmdl",
        },
        great_drakan = {
            health = 50000,
            damage_min = 650,
            damage_max = 700,

            defense = 495,
            level = 100,
            model = "models/items/broodmother/spiderling/broodmother_nightmare_spiderling/broodmother_nightmare_spiderling.vmdl",
        },
        phoenix_darkness = {
            health = 95000,
            damage_min = 950,
            damage_max = 1000,

            defense = 600,
            level = 108,
            model = "models/creeps/nian/nian_creep.vmdl",
        },
    },
    kanturu_ruins  = {
        berserker = {
            health = 44370,
            damage_min = 555,
            damage_max = 590,

            defense = 443,
            level = 100,
            model = "models/items/undying/flesh_golem/frostivus_2018_undying_accursed_draugr_golem/frostivus_2018_undying_accursed_draugr_golem.vmdl",
        },
        splinter_wolf = {
            health = 16000,
            damage_min = 310,
            damage_max = 340,

            defense = 230,
            level = 80,
            model = "models/items/lycan/ultimate/_werewolf_samurai_wolf_form_v1/_werewolf_samurai_wolf_form_v1.vmdl",
        },
        iron_rider = {
            health = 18000,
            damage_min = 335,
            damage_max = 365,

            defense = 250,
            level = 82,
            model = "models/items/warlock/golem/the_torchbearer/the_torchbearer.vmdl",
        },
        satyros = {
            health = 22000,
            damage_min = 365,
            damage_max = 395,

            defense = 280,
            level = 85,
            model = "models/items/warlock/golem/greevil_master_greevil_golem/greevil_master_greevil_golem.vmdl",
        },
        blade_hunter = {
            health = 32000,
            damage_min = 408,
            damage_max = 443,

            defense = 315,
            level = 88,
            model = "models/items/furion/treant/allfather_of_nature_treant/allfather_of_nature_treant.vmdl",
        },
        kentauros = {
            health = 38500,
            damage_min = 470,
            damage_max = 505,

            defense = 370,
            level = 93,
            model = "models/items/furion/treant/the_ancient_guardian_the_ancient_treants/the_ancient_guardian_the_ancient_treants.vmdl",
        },
        gigantis = {
            health = 43000,
            damage_min = 546,
            damage_max = 581,

            defense = 430,
            level = 98,
            model = "models/creeps/ice_biome/frostbitten/n_creep_frostbitten_01.vmdl",
        },
        genocider = {
            health = 48500,
            damage_min = 640,
            damage_max = 675,

            defense = 515,
            level = 105,
            model = "models/creeps/ice_biome/undeadtusk/undead_tuskskeleton01.vmdl",
        },
        berserker_warrior = {
            health = 184370,
            damage_min = 915,
            damage_max = 990,

            defense = 543,
            level = 123,
            model = "models/creeps/lane_creeps/creep_bird_radiant/creep_bird_radiant_melee_mega.vmdl",
        },
        kentauros_warrior = {
            health = 198500,
            damage_min = 970,
            damage_max = 1005,

            defense = 570,
            level = 126,
            model = "models/creeps/neutral_creeps/n_creep_forest_trolls/n_creep_forest_troll_berserker.vmdl",
        },
        gigantis_warrior = {
            health = 203000,
            damage_min = 1046,
            damage_max = 1181,

            defense = 630,
            level = 128,
            model = "models/creeps/neutral_creeps/n_creep_vulture_b/n_creep_vulture_b.vmdl",
        },
        genocider_warrior = {
            health = 218500,
            damage_min = 1240,
            damage_max = 1375,

            defense = 715,
            level = 129,
            model = "models/creeps/neutral_creeps/n_creep_thunder_lizard/n_creep_thunder_lizard_small.vmdl",
        },
    }
}


_G.all_items = {
    weapon = {},
    item = {
        ['Bronze'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Bronze Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '9',
                            ['required_str'] = '58',
                            ['required_agi'] = '29',
                        },
                        ['1'] = {
                            ['armor'] = '12',
                            ['required_str'] = '65',
                            ['required_agi'] = '31',
                        },
                        ['2'] = {
                            ['armor'] = '15',
                            ['required_str'] = '72',
                            ['required_agi'] = '33',
                        },
                        ['3'] = {
                            ['armor'] = '18',
                            ['required_str'] = '80',
                            ['required_agi'] = '35',
                        },
                        ['4'] = {
                            ['armor'] = '21',
                            ['required_str'] = '87',
                            ['required_agi'] = '36',
                        },
                        ['5'] = {
                            ['armor'] = '24',
                            ['required_str'] = '94',
                            ['required_agi'] = '38',
                        },
                        ['6'] = {
                            ['armor'] = '27',
                            ['required_str'] = '101',
                            ['required_agi'] = '40',
                        },
                        ['7'] = {
                            ['armor'] = '30',
                            ['required_str'] = '108',
                            ['required_agi'] = '42',
                        },
                        ['8'] = {
                            ['armor'] = '33',
                            ['required_str'] = '116',
                            ['required_agi'] = '44',
                        },
                        ['9'] = {
                            ['armor'] = '36',
                            ['required_str'] = '123',
                            ['required_agi'] = '45',
                        },
                        ['10'] = {
                            ['armor'] = '40',
                            ['required_str'] = '130',
                            ['required_agi'] = '47',
                        },
                        ['11'] = {
                            ['armor'] = '45',
                            ['required_str'] = '137',
                            ['required_agi'] = '49',
                        },
                        ['12'] = {
                            ['armor'] = '51',
                            ['required_str'] = '144',
                            ['required_agi'] = '51',
                        },
                        ['13'] = {
                            ['armor'] = '58',
                            ['required_str'] = '152',
                            ['required_agi'] = '53',
                        },
                        ['14'] = {
                            ['armor'] = '66',
                            ['required_str'] = '159',
                            ['required_agi'] = '54',
                        },
                        ['15'] = {
                            ['armor'] = '75',
                            ['required_str'] = '166',
                            ['required_agi'] = '56',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Bronze Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '14',
                            ['required_str'] = '63',
                            ['required_agi'] = '30',
                        },
                        ['1'] = {
                            ['armor'] = '17',
                            ['required_str'] = '70',
                            ['required_agi'] = '32',
                        },
                        ['2'] = {
                            ['armor'] = '20',
                            ['required_str'] = '77',
                            ['required_agi'] = '34',
                        },
                        ['3'] = {
                            ['armor'] = '23',
                            ['required_str'] = '84',
                            ['required_agi'] = '36',
                        },
                        ['4'] = {
                            ['armor'] = '26',
                            ['required_str'] = '92',
                            ['required_agi'] = '38',
                        },
                        ['5'] = {
                            ['armor'] = '29',
                            ['required_str'] = '99',
                            ['required_agi'] = '39',
                        },
                        ['6'] = {
                            ['armor'] = '32',
                            ['required_str'] = '106',
                            ['required_agi'] = '41',
                        },
                        ['7'] = {
                            ['armor'] = '35',
                            ['required_str'] = '113',
                            ['required_agi'] = '43',
                        },
                        ['8'] = {
                            ['armor'] = '38',
                            ['required_str'] = '120',
                            ['required_agi'] = '45',
                        },
                        ['9'] = {
                            ['armor'] = '41',
                            ['required_str'] = '128',
                            ['required_agi'] = '47',
                        },
                        ['10'] = {
                            ['armor'] = '45',
                            ['required_str'] = '135',
                            ['required_agi'] = '48',
                        },
                        ['11'] = {
                            ['armor'] = '50',
                            ['required_str'] = '142',
                            ['required_agi'] = '50',
                        },
                        ['12'] = {
                            ['armor'] = '56',
                            ['required_str'] = '149',
                            ['required_agi'] = '52',
                        },
                        ['13'] = {
                            ['armor'] = '63',
                            ['required_str'] = '156',
                            ['required_agi'] = '54',
                        },
                        ['14'] = {
                            ['armor'] = '71',
                            ['required_str'] = '164',
                            ['required_agi'] = '56',
                        },
                        ['15'] = {
                            ['armor'] = '80',
                            ['required_str'] = '171',
                            ['required_agi'] = '57',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Bronze Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '4',
                            ['required_str'] = '48',
                            ['required_agi'] = '27',
                        },
                        ['1'] = {
                            ['armor'] = '7',
                            ['required_str'] = '56',
                            ['required_agi'] = '29',
                        },
                        ['2'] = {
                            ['armor'] = '10',
                            ['required_str'] = '63',
                            ['required_agi'] = '30',
                        },
                        ['3'] = {
                            ['armor'] = '13',
                            ['required_str'] = '70',
                            ['required_agi'] = '32',
                        },
                        ['4'] = {
                            ['armor'] = '16',
                            ['required_str'] = '77',
                            ['required_agi'] = '34',
                        },
                        ['5'] = {
                            ['armor'] = '19',
                            ['required_str'] = '84',
                            ['required_agi'] = '36',
                        },
                        ['6'] = {
                            ['armor'] = '22',
                            ['required_str'] = '92',
                            ['required_agi'] = '38',
                        },
                        ['7'] = {
                            ['armor'] = '25',
                            ['required_str'] = '99',
                            ['required_agi'] = '39',
                        },
                        ['8'] = {
                            ['armor'] = '28',
                            ['required_str'] = '106',
                            ['required_agi'] = '41',
                        },
                        ['9'] = {
                            ['armor'] = '31',
                            ['required_str'] = '113',
                            ['required_agi'] = '43',
                        },
                        ['10'] = {
                            ['armor'] = '35',
                            ['required_str'] = '120',
                            ['required_agi'] = '45',
                        },
                        ['11'] = {
                            ['armor'] = '40',
                            ['required_str'] = '128',
                            ['required_agi'] = '47',
                        },
                        ['12'] = {
                            ['armor'] = '46',
                            ['required_str'] = '135',
                            ['required_agi'] = '48',
                        },
                        ['13'] = {
                            ['armor'] = '53',
                            ['required_str'] = '142',
                            ['required_agi'] = '50',
                        },
                        ['14'] = {
                            ['armor'] = '61',
                            ['required_str'] = '149',
                            ['required_agi'] = '52',
                        },
                        ['15'] = {
                            ['armor'] = '70',
                            ['required_str'] = '156',
                            ['required_agi'] = '54',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Bronze Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '10',
                            ['required_str'] = '56',
                            ['required_agi'] = '29',
                        },
                        ['1'] = {
                            ['armor'] = '13',
                            ['required_str'] = '63',
                            ['required_agi'] = '30',
                        },
                        ['2'] = {
                            ['armor'] = '16',
                            ['required_str'] = '70',
                            ['required_agi'] = '32',
                        },
                        ['3'] = {
                            ['armor'] = '19',
                            ['required_str'] = '77',
                            ['required_agi'] = '34',
                        },
                        ['4'] = {
                            ['armor'] = '22',
                            ['required_str'] = '84',
                            ['required_agi'] = '36',
                        },
                        ['5'] = {
                            ['armor'] = '25',
                            ['required_str'] = '92',
                            ['required_agi'] = '38',
                        },
                        ['6'] = {
                            ['armor'] = '28',
                            ['required_str'] = '99',
                            ['required_agi'] = '39',
                        },
                        ['7'] = {
                            ['armor'] = '31',
                            ['required_str'] = '106',
                            ['required_agi'] = '41',
                        },
                        ['8'] = {
                            ['armor'] = '34',
                            ['required_str'] = '113',
                            ['required_agi'] = '43',
                        },
                        ['9'] = {
                            ['armor'] = '37',
                            ['required_str'] = '120',
                            ['required_agi'] = '45',
                        },
                        ['10'] = {
                            ['armor'] = '41',
                            ['required_str'] = '128',
                            ['required_agi'] = '47',
                        },
                        ['11'] = {
                            ['armor'] = '46',
                            ['required_str'] = '135',
                            ['required_agi'] = '48',
                        },
                        ['12'] = {
                            ['armor'] = '52',
                            ['required_str'] = '142',
                            ['required_agi'] = '50',
                        },
                        ['13'] = {
                            ['armor'] = '59',
                            ['required_str'] = '149',
                            ['required_agi'] = '52',
                        },
                        ['14'] = {
                            ['armor'] = '67',
                            ['required_str'] = '156',
                            ['required_agi'] = '54',
                        },
                        ['15'] = {
                            ['armor'] = '76',
                            ['required_str'] = '164',
                            ['required_agi'] = '56',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Bronze Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '4',
                            ['required_str'] = '51',
                            ['required_agi'] = '27',
                        },
                        ['1'] = {
                            ['armor'] = '7',
                            ['required_str'] = '58',
                            ['required_agi'] = '29',
                        },
                        ['2'] = {
                            ['armor'] = '10',
                            ['required_str'] = '65',
                            ['required_agi'] = '31',
                        },
                        ['3'] = {
                            ['armor'] = '13',
                            ['required_str'] = '72',
                            ['required_agi'] = '33',
                        },
                        ['4'] = {
                            ['armor'] = '16',
                            ['required_str'] = '80',
                            ['required_agi'] = '35',
                        },
                        ['5'] = {
                            ['armor'] = '19',
                            ['required_str'] = '87',
                            ['required_agi'] = '36',
                        },
                        ['6'] = {
                            ['armor'] = '22',
                            ['required_str'] = '94',
                            ['required_agi'] = '38',
                        },
                        ['7'] = {
                            ['armor'] = '25',
                            ['required_str'] = '101',
                            ['required_agi'] = '40',
                        },
                        ['8'] = {
                            ['armor'] = '28',
                            ['required_str'] = '108',
                            ['required_agi'] = '42',
                        },
                        ['9'] = {
                            ['armor'] = '31',
                            ['required_str'] = '116',
                            ['required_agi'] = '44',
                        },
                        ['10'] = {
                            ['armor'] = '35',
                            ['required_str'] = '123',
                            ['required_agi'] = '45',
                        },
                        ['11'] = {
                            ['armor'] = '40',
                            ['required_str'] = '130',
                            ['required_agi'] = '47',
                        },
                        ['12'] = {
                            ['armor'] = '46',
                            ['required_str'] = '137',
                            ['required_agi'] = '49',
                        },
                        ['13'] = {
                            ['armor'] = '53',
                            ['required_str'] = '144',
                            ['required_agi'] = '51',
                        },
                        ['14'] = {
                            ['armor'] = '61',
                            ['required_str'] = '152',
                            ['required_agi'] = '53',
                        },
                        ['15'] = {
                            ['armor'] = '70',
                            ['required_str'] = '159',
                            ['required_agi'] = '54',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Bronze Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '54',
                            ['required_str'] = '246',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '57',
                            ['required_str'] = '259',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '60',
                            ['required_str'] = '272',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '63',
                            ['required_str'] = '284',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '66',
                            ['required_str'] = '297',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '69',
                            ['required_str'] = '309',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '72',
                            ['required_str'] = '322',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '75',
                            ['required_str'] = '335',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '78',
                            ['required_str'] = '347',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '81',
                            ['required_str'] = '360',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '85',
                            ['required_str'] = '372',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '90',
                            ['required_str'] = '385',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '96',
                            ['required_str'] = '398',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '103',
                            ['required_str'] = '410',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '111',
                            ['required_str'] = '423',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '120',
                            ['required_str'] = '435',
                            ['required_agi'] = 0,
                        },
                    },
                },
            },
            ['class'] = {
                'warrior',
                'summoner',
            },
        },
        ['Dragon'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Dragon Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '24',
                            ['required_str'] = '225',
                            ['required_agi'] = '71',
                        },
                        ['1'] = {
                            ['armor'] = '27',
                            ['required_str'] = '236',
                            ['required_agi'] = '74',
                        },
                        ['2'] = {
                            ['armor'] = '30',
                            ['required_str'] = '246',
                            ['required_agi'] = '76',
                        },
                        ['3'] = {
                            ['armor'] = '33',
                            ['required_str'] = '257',
                            ['required_agi'] = '79',
                        },
                        ['4'] = {
                            ['armor'] = '36',
                            ['required_str'] = '268',
                            ['required_agi'] = '82',
                        },
                        ['5'] = {
                            ['armor'] = '39',
                            ['required_str'] = '279',
                            ['required_agi'] = '84',
                        },
                        ['6'] = {
                            ['armor'] = '42',
                            ['required_str'] = '290',
                            ['required_agi'] = '87',
                        },
                        ['7'] = {
                            ['armor'] = '45',
                            ['required_str'] = '300',
                            ['required_agi'] = '90',
                        },
                        ['8'] = {
                            ['armor'] = '48',
                            ['required_str'] = '311',
                            ['required_agi'] = '92',
                        },
                        ['9'] = {
                            ['armor'] = '51',
                            ['required_str'] = '322',
                            ['required_agi'] = '95',
                        },
                        ['10'] = {
                            ['armor'] = '55',
                            ['required_str'] = '333',
                            ['required_agi'] = '98',
                        },
                        ['11'] = {
                            ['armor'] = '60',
                            ['required_str'] = '344',
                            ['required_agi'] = '101',
                        },
                        ['12'] = {
                            ['armor'] = '66',
                            ['required_str'] = '354',
                            ['required_agi'] = '103',
                        },
                        ['13'] = {
                            ['armor'] = '73',
                            ['required_str'] = '365',
                            ['required_agi'] = '106',
                        },
                        ['14'] = {
                            ['armor'] = '81',
                            ['required_str'] = '376',
                            ['required_agi'] = '109',
                        },
                        ['15'] = {
                            ['armor'] = '90',
                            ['required_str'] = '387',
                            ['required_agi'] = '111',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Dragon Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '37',
                            ['required_str'] = '232',
                            ['required_agi'] = '73',
                        },
                        ['1'] = {
                            ['armor'] = '40',
                            ['required_str'] = '243',
                            ['required_agi'] = '75',
                        },
                        ['2'] = {
                            ['armor'] = '43',
                            ['required_str'] = '254',
                            ['required_agi'] = '78',
                        },
                        ['3'] = {
                            ['armor'] = '46',
                            ['required_str'] = '264',
                            ['required_agi'] = '81',
                        },
                        ['4'] = {
                            ['armor'] = '49',
                            ['required_str'] = '275',
                            ['required_agi'] = '83',
                        },
                        ['5'] = {
                            ['armor'] = '52',
                            ['required_str'] = '286',
                            ['required_agi'] = '86',
                        },
                        ['6'] = {
                            ['armor'] = '55',
                            ['required_str'] = '297',
                            ['required_agi'] = '89',
                        },
                        ['7'] = {
                            ['armor'] = '58',
                            ['required_str'] = '308',
                            ['required_agi'] = '92',
                        },
                        ['8'] = {
                            ['armor'] = '61',
                            ['required_str'] = '318',
                            ['required_agi'] = '94',
                        },
                        ['9'] = {
                            ['armor'] = '64',
                            ['required_str'] = '329',
                            ['required_agi'] = '97',
                        },
                        ['10'] = {
                            ['armor'] = '68',
                            ['required_str'] = '340',
                            ['required_agi'] = '100',
                        },
                        ['11'] = {
                            ['armor'] = '73',
                            ['required_str'] = '351',
                            ['required_agi'] = '102',
                        },
                        ['12'] = {
                            ['armor'] = '79',
                            ['required_str'] = '362',
                            ['required_agi'] = '105',
                        },
                        ['13'] = {
                            ['armor'] = '86',
                            ['required_str'] = '372',
                            ['required_agi'] = '108',
                        },
                        ['14'] = {
                            ['armor'] = '94',
                            ['required_str'] = '383',
                            ['required_agi'] = '110',
                        },
                        ['15'] = {
                            ['armor'] = '103',
                            ['required_str'] = '394',
                            ['required_agi'] = '113',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Dragon Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '15',
                            ['required_str'] = '214',
                            ['required_agi'] = '68',
                        },
                        ['1'] = {
                            ['armor'] = '18',
                            ['required_str'] = '225',
                            ['required_agi'] = '71',
                        },
                        ['2'] = {
                            ['armor'] = '21',
                            ['required_str'] = '236',
                            ['required_agi'] = '74',
                        },
                        ['3'] = {
                            ['armor'] = '24',
                            ['required_str'] = '246',
                            ['required_agi'] = '76',
                        },
                        ['4'] = {
                            ['armor'] = '27',
                            ['required_str'] = '257',
                            ['required_agi'] = '79',
                        },
                        ['5'] = {
                            ['armor'] = '30',
                            ['required_str'] = '268',
                            ['required_agi'] = '82',
                        },
                        ['6'] = {
                            ['armor'] = '33',
                            ['required_str'] = '279',
                            ['required_agi'] = '84',
                        },
                        ['7'] = {
                            ['armor'] = '36',
                            ['required_str'] = '290',
                            ['required_agi'] = '87',
                        },
                        ['8'] = {
                            ['armor'] = '39',
                            ['required_str'] = '300',
                            ['required_agi'] = '90',
                        },
                        ['9'] = {
                            ['armor'] = '42',
                            ['required_str'] = '311',
                            ['required_agi'] = '92',
                        },
                        ['10'] = {
                            ['armor'] = '46',
                            ['required_str'] = '322',
                            ['required_agi'] = '95',
                        },
                        ['11'] = {
                            ['armor'] = '51',
                            ['required_str'] = '333',
                            ['required_agi'] = '98',
                        },
                        ['12'] = {
                            ['armor'] = '57',
                            ['required_str'] = '344',
                            ['required_agi'] = '101',
                        },
                        ['13'] = {
                            ['armor'] = '64',
                            ['required_str'] = '354',
                            ['required_agi'] = '103',
                        },
                        ['14'] = {
                            ['armor'] = '72',
                            ['required_str'] = '365',
                            ['required_agi'] = '106',
                        },
                        ['15'] = {
                            ['armor'] = '81',
                            ['required_str'] = '376',
                            ['required_agi'] = '109',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Dragon Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '26',
                            ['required_str'] = '218',
                            ['required_agi'] = '69',
                        },
                        ['1'] = {
                            ['armor'] = '29',
                            ['required_str'] = '228',
                            ['required_agi'] = '72',
                        },
                        ['2'] = {
                            ['armor'] = '32',
                            ['required_str'] = '239',
                            ['required_agi'] = '74',
                        },
                        ['3'] = {
                            ['armor'] = '35',
                            ['required_str'] = '250',
                            ['required_agi'] = '77',
                        },
                        ['4'] = {
                            ['armor'] = '38',
                            ['required_str'] = '261',
                            ['required_agi'] = '80',
                        },
                        ['5'] = {
                            ['armor'] = '41',
                            ['required_str'] = '272',
                            ['required_agi'] = '83',
                        },
                        ['6'] = {
                            ['armor'] = '44',
                            ['required_str'] = '282',
                            ['required_agi'] = '85',
                        },
                        ['7'] = {
                            ['armor'] = '47',
                            ['required_str'] = '293',
                            ['required_agi'] = '88',
                        },
                        ['8'] = {
                            ['armor'] = '50',
                            ['required_str'] = '304',
                            ['required_agi'] = '91',
                        },
                        ['9'] = {
                            ['armor'] = '53',
                            ['required_str'] = '315',
                            ['required_agi'] = '93',
                        },
                        ['10'] = {
                            ['armor'] = '57',
                            ['required_str'] = '326',
                            ['required_agi'] = '96',
                        },
                        ['11'] = {
                            ['armor'] = '62',
                            ['required_str'] = '336',
                            ['required_agi'] = '99',
                        },
                        ['12'] = {
                            ['armor'] = '68',
                            ['required_str'] = '347',
                            ['required_agi'] = '101',
                        },
                        ['13'] = {
                            ['armor'] = '75',
                            ['required_str'] = '358',
                            ['required_agi'] = '104',
                        },
                        ['14'] = {
                            ['armor'] = '83',
                            ['required_str'] = '369',
                            ['required_agi'] = '107',
                        },
                        ['15'] = {
                            ['armor'] = '92',
                            ['required_str'] = '380',
                            ['required_agi'] = '110',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Dragon Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '14',
                            ['required_str'] = '207',
                            ['required_agi'] = '66',
                        },
                        ['1'] = {
                            ['armor'] = '17',
                            ['required_str'] = '218',
                            ['required_agi'] = '69',
                        },
                        ['2'] = {
                            ['armor'] = '20',
                            ['required_str'] = '228',
                            ['required_agi'] = '72',
                        },
                        ['3'] = {
                            ['armor'] = '23',
                            ['required_str'] = '239',
                            ['required_agi'] = '74',
                        },
                        ['4'] = {
                            ['armor'] = '26',
                            ['required_str'] = '250',
                            ['required_agi'] = '77',
                        },
                        ['5'] = {
                            ['armor'] = '29',
                            ['required_str'] = '261',
                            ['required_agi'] = '80',
                        },
                        ['6'] = {
                            ['armor'] = '32',
                            ['required_str'] = '272',
                            ['required_agi'] = '83',
                        },
                        ['7'] = {
                            ['armor'] = '35',
                            ['required_str'] = '282',
                            ['required_agi'] = '85',
                        },
                        ['8'] = {
                            ['armor'] = '38',
                            ['required_str'] = '293',
                            ['required_agi'] = '88',
                        },
                        ['9'] = {
                            ['armor'] = '41',
                            ['required_str'] = '304',
                            ['required_agi'] = '91',
                        },
                        ['10'] = {
                            ['armor'] = '45',
                            ['required_str'] = '315',
                            ['required_agi'] = '93',
                        },
                        ['11'] = {
                            ['armor'] = '50',
                            ['required_str'] = '326',
                            ['required_agi'] = '96',
                        },
                        ['12'] = {
                            ['armor'] = '56',
                            ['required_str'] = '336',
                            ['required_agi'] = '99',
                        },
                        ['13'] = {
                            ['armor'] = '63',
                            ['required_str'] = '347',
                            ['required_agi'] = '101',
                        },
                        ['14'] = {
                            ['armor'] = '71',
                            ['required_str'] = '358',
                            ['required_agi'] = '104',
                        },
                        ['15'] = {
                            ['armor'] = '80',
                            ['required_str'] = '369',
                            ['required_agi'] = '107',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Dragon Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '60',
                            ['required_str'] = '236',
                            ['required_agi'] = '92',
                        },
                        ['1'] = {
                            ['armor'] = '63',
                            ['required_str'] = '246',
                            ['required_agi'] = '95',
                        },
                        ['2'] = {
                            ['armor'] = '66',
                            ['required_str'] = '257',
                            ['required_agi'] = '99',
                        },
                        ['3'] = {
                            ['armor'] = '69',
                            ['required_str'] = '268',
                            ['required_agi'] = '102',
                        },
                        ['4'] = {
                            ['armor'] = '72',
                            ['required_str'] = '279',
                            ['required_agi'] = '106',
                        },
                        ['5'] = {
                            ['armor'] = '75',
                            ['required_str'] = '290',
                            ['required_agi'] = '110',
                        },
                        ['6'] = {
                            ['armor'] = '78',
                            ['required_str'] = '300',
                            ['required_agi'] = '113',
                        },
                        ['7'] = {
                            ['armor'] = '81',
                            ['required_str'] = '311',
                            ['required_agi'] = '117',
                        },
                        ['8'] = {
                            ['armor'] = '84',
                            ['required_str'] = '322',
                            ['required_agi'] = '120',
                        },
                        ['9'] = {
                            ['armor'] = '87',
                            ['required_str'] = '333',
                            ['required_agi'] = '124',
                        },
                        ['10'] = {
                            ['armor'] = '91',
                            ['required_str'] = '344',
                            ['required_agi'] = '128',
                        },
                        ['11'] = {
                            ['armor'] = '96',
                            ['required_str'] = '354',
                            ['required_agi'] = '131',
                        },
                        ['12'] = {
                            ['armor'] = '102',
                            ['required_str'] = '365',
                            ['required_agi'] = '135',
                        },
                        ['13'] = {
                            ['armor'] = '109',
                            ['required_str'] = '376',
                            ['required_agi'] = '138',
                        },
                        ['14'] = {
                            ['armor'] = '117',
                            ['required_str'] = '387',
                            ['required_agi'] = '142',
                        },
                        ['15'] = {
                            ['armor'] = '126',
                            ['required_str'] = '398',
                            ['required_agi'] = '146',
                        },
                    },
                },
            },
            ['class'] = {
                'warrior',
            },
        },
        ['Leather'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Leather Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '5',
                            ['required_str'] = '34',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '8',
                            ['required_str'] = '41',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '11',
                            ['required_str'] = '48',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '14',
                            ['required_str'] = '56',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '17',
                            ['required_str'] = '63',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '20',
                            ['required_str'] = '70',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '23',
                            ['required_str'] = '77',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '26',
                            ['required_str'] = '84',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '29',
                            ['required_str'] = '92',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '32',
                            ['required_str'] = '99',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '36',
                            ['required_str'] = '106',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '41',
                            ['required_str'] = '113',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '47',
                            ['required_str'] = '120',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '54',
                            ['required_str'] = '128',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '62',
                            ['required_str'] = '135',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '71',
                            ['required_str'] = '142',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Leather Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '10',
                            ['required_str'] = '44',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '13',
                            ['required_str'] = '51',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '16',
                            ['required_str'] = '58',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '19',
                            ['required_str'] = '65',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '22',
                            ['required_str'] = '72',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '25',
                            ['required_str'] = '80',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '28',
                            ['required_str'] = '87',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '31',
                            ['required_str'] = '94',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '34',
                            ['required_str'] = '101',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '37',
                            ['required_str'] = '108',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '41',
                            ['required_str'] = '116',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '46',
                            ['required_str'] = '123',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '52',
                            ['required_str'] = '130',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '59',
                            ['required_str'] = '137',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '67',
                            ['required_str'] = '144',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '76',
                            ['required_str'] = '152',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Leather Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '2',
                            ['required_str'] = '32',
                            ['required_agi'] = '12',
                        },
                        ['1'] = {
                            ['armor'] = '5',
                            ['required_str'] = '39',
                            ['required_agi'] = '12',
                        },
                        ['2'] = {
                            ['armor'] = '8',
                            ['required_str'] = '46',
                            ['required_agi'] = '12',
                        },
                        ['3'] = {
                            ['armor'] = '11',
                            ['required_str'] = '53',
                            ['required_agi'] = '12',
                        },
                        ['4'] = {
                            ['armor'] = '14',
                            ['required_str'] = '60',
                            ['required_agi'] = '12',
                        },
                        ['5'] = {
                            ['armor'] = '17',
                            ['required_str'] = '68',
                            ['required_agi'] = '12',
                        },
                        ['6'] = {
                            ['armor'] = '20',
                            ['required_str'] = '75',
                            ['required_agi'] = '12',
                        },
                        ['7'] = {
                            ['armor'] = '23',
                            ['required_str'] = '82',
                            ['required_agi'] = '12',
                        },
                        ['8'] = {
                            ['armor'] = '26',
                            ['required_str'] = '89',
                            ['required_agi'] = '12',
                        },
                        ['9'] = {
                            ['armor'] = '29',
                            ['required_str'] = '96',
                            ['required_agi'] = '12',
                        },
                        ['10'] = {
                            ['armor'] = '33',
                            ['required_str'] = '104',
                            ['required_agi'] = '12',
                        },
                        ['11'] = {
                            ['armor'] = '38',
                            ['required_str'] = '111',
                            ['required_agi'] = '12',
                        },
                        ['12'] = {
                            ['armor'] = '44',
                            ['required_str'] = '118',
                            ['required_agi'] = '12',
                        },
                        ['13'] = {
                            ['armor'] = '51',
                            ['required_str'] = '125',
                            ['required_agi'] = '12',
                        },
                        ['14'] = {
                            ['armor'] = '59',
                            ['required_str'] = '132',
                            ['required_agi'] = '12',
                        },
                        ['15'] = {
                            ['armor'] = '68',
                            ['required_str'] = '140',
                            ['required_agi'] = '12',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Leather Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '7',
                            ['required_str'] = '39',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '10',
                            ['required_str'] = '46',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '13',
                            ['required_str'] = '53',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '16',
                            ['required_str'] = '60',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '19',
                            ['required_str'] = '68',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '22',
                            ['required_str'] = '75',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '25',
                            ['required_str'] = '82',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '28',
                            ['required_str'] = '89',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '31',
                            ['required_str'] = '96',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '34',
                            ['required_str'] = '104',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '38',
                            ['required_str'] = '111',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '43',
                            ['required_str'] = '118',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '49',
                            ['required_str'] = '125',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '56',
                            ['required_str'] = '132',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '64',
                            ['required_str'] = '140',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '73',
                            ['required_str'] = '147',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Leather Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '2',
                            ['required_str'] = '29',
                            ['required_agi'] = '8',
                        },
                        ['1'] = {
                            ['armor'] = '5',
                            ['required_str'] = '36',
                            ['required_agi'] = '8',
                        },
                        ['2'] = {
                            ['armor'] = '8',
                            ['required_str'] = '44',
                            ['required_agi'] = '8',
                        },
                        ['3'] = {
                            ['armor'] = '11',
                            ['required_str'] = '51',
                            ['required_agi'] = '8',
                        },
                        ['4'] = {
                            ['armor'] = '14',
                            ['required_str'] = '58',
                            ['required_agi'] = '8',
                        },
                        ['5'] = {
                            ['armor'] = '17',
                            ['required_str'] = '65',
                            ['required_agi'] = '8',
                        },
                        ['6'] = {
                            ['armor'] = '20',
                            ['required_str'] = '72',
                            ['required_agi'] = '8',
                        },
                        ['7'] = {
                            ['armor'] = '23',
                            ['required_str'] = '80',
                            ['required_agi'] = '8',
                        },
                        ['8'] = {
                            ['armor'] = '26',
                            ['required_str'] = '87',
                            ['required_agi'] = '8',
                        },
                        ['9'] = {
                            ['armor'] = '29',
                            ['required_str'] = '94',
                            ['required_agi'] = '8',
                        },
                        ['10'] = {
                            ['armor'] = '33',
                            ['required_str'] = '101',
                            ['required_agi'] = '8',
                        },
                        ['11'] = {
                            ['armor'] = '38',
                            ['required_str'] = '108',
                            ['required_agi'] = '8',
                        },
                        ['12'] = {
                            ['armor'] = '44',
                            ['required_str'] = '116',
                            ['required_agi'] = '8',
                        },
                        ['13'] = {
                            ['armor'] = '51',
                            ['required_str'] = '123',
                            ['required_agi'] = '8',
                        },
                        ['14'] = {
                            ['armor'] = '59',
                            ['required_str'] = '130',
                            ['required_agi'] = '8',
                        },
                        ['15'] = {
                            ['armor'] = '68',
                            ['required_str'] = '137',
                            ['required_agi'] = '8',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Leather Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '13',
                            ['required_str'] = '51',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '16',
                            ['required_str'] = '58',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '19',
                            ['required_str'] = '65',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '22',
                            ['required_str'] = '72',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '25',
                            ['required_str'] = '80',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '28',
                            ['required_str'] = '87',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '31',
                            ['required_str'] = '94',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '34',
                            ['required_str'] = '101',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '37',
                            ['required_str'] = '108',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '41',
                            ['required_str'] = '116',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '46',
                            ['required_str'] = '123',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '52',
                            ['required_str'] = '130',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '59',
                            ['required_str'] = '137',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '67',
                            ['required_str'] = '144',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '76',
                            ['required_str'] = '152',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '84',
                            ['required_str'] = '160',
                            ['required_agi'] = 0,
                        },
                    },
                },
            },
            ['class'] = {
                'warrior',
                'summoner',
                'assassin',
            },
        },
        ['Scale'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Scale Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '12',
                            ['required_str'] = '105',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '15',
                            ['required_str'] = '115',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '18',
                            ['required_str'] = '125',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '21',
                            ['required_str'] = '135',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '24',
                            ['required_str'] = '145',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '27',
                            ['required_str'] = '155',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '30',
                            ['required_str'] = '165',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '33',
                            ['required_str'] = '175',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '36',
                            ['required_str'] = '185',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '39',
                            ['required_str'] = '194',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '43',
                            ['required_str'] = '204',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '48',
                            ['required_str'] = '214',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '54',
                            ['required_str'] = '224',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '61',
                            ['required_str'] = '234',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '69',
                            ['required_str'] = '244',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '78',
                            ['required_str'] = '254',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Scale Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '18',
                            ['required_str'] = '112',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '21',
                            ['required_str'] = '122',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '24',
                            ['required_str'] = '132',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '27',
                            ['required_str'] = '142',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '30',
                            ['required_str'] = '152',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '33',
                            ['required_str'] = '161',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '36',
                            ['required_str'] = '171',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '39',
                            ['required_str'] = '181',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '42',
                            ['required_str'] = '191',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '45',
                            ['required_str'] = '201',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '49',
                            ['required_str'] = '211',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '54',
                            ['required_str'] = '221',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '60',
                            ['required_str'] = '231',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '67',
                            ['required_str'] = '241',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '75',
                            ['required_str'] = '251',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '84',
                            ['required_str'] = '260',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Scale Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '8',
                            ['required_str'] = '92',
                            ['required_agi'] = '8',
                        },
                        ['1'] = {
                            ['armor'] = '11',
                            ['required_str'] = '102',
                            ['required_agi'] = '8',
                        },
                        ['2'] = {
                            ['armor'] = '14',
                            ['required_str'] = '112',
                            ['required_agi'] = '8',
                        },
                        ['3'] = {
                            ['armor'] = '17',
                            ['required_str'] = '122',
                            ['required_agi'] = '8',
                        },
                        ['4'] = {
                            ['armor'] = '20',
                            ['required_str'] = '132',
                            ['required_agi'] = '8',
                        },
                        ['5'] = {
                            ['armor'] = '23',
                            ['required_str'] = '142',
                            ['required_agi'] = '8',
                        },
                        ['6'] = {
                            ['armor'] = '26',
                            ['required_str'] = '152',
                            ['required_agi'] = '8',
                        },
                        ['7'] = {
                            ['armor'] = '29',
                            ['required_str'] = '161',
                            ['required_agi'] = '8',
                        },
                        ['8'] = {
                            ['armor'] = '32',
                            ['required_str'] = '171',
                            ['required_agi'] = '8',
                        },
                        ['9'] = {
                            ['armor'] = '35',
                            ['required_str'] = '181',
                            ['required_agi'] = '8',
                        },
                        ['10'] = {
                            ['armor'] = '39',
                            ['required_str'] = '191',
                            ['required_agi'] = '8',
                        },
                        ['11'] = {
                            ['armor'] = '44',
                            ['required_str'] = '201',
                            ['required_agi'] = '8',
                        },
                        ['12'] = {
                            ['armor'] = '50',
                            ['required_str'] = '211',
                            ['required_agi'] = '8',
                        },
                        ['13'] = {
                            ['armor'] = '57',
                            ['required_str'] = '221',
                            ['required_agi'] = '8',
                        },
                        ['14'] = {
                            ['armor'] = '65',
                            ['required_str'] = '231',
                            ['required_agi'] = '8',
                        },
                        ['15'] = {
                            ['armor'] = '74',
                            ['required_str'] = '241',
                            ['required_agi'] = '8',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Scale Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '14',
                            ['required_str'] = '102',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '17',
                            ['required_str'] = '112',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '20',
                            ['required_str'] = '122',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '23',
                            ['required_str'] = '132',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '26',
                            ['required_str'] = '142',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '29',
                            ['required_str'] = '152',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '32',
                            ['required_str'] = '161',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '35',
                            ['required_str'] = '171',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '38',
                            ['required_str'] = '181',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '41',
                            ['required_str'] = '191',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '45',
                            ['required_str'] = '201',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '50',
                            ['required_str'] = '211',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '56',
                            ['required_str'] = '221',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '63',
                            ['required_str'] = '231',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '71',
                            ['required_str'] = '241',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '80',
                            ['required_str'] = '251',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Scale Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '7',
                            ['required_str'] = '92',
                            ['required_agi'] = '10',
                        },
                        ['1'] = {
                            ['armor'] = '10',
                            ['required_str'] = '102',
                            ['required_agi'] = '10',
                        },
                        ['2'] = {
                            ['armor'] = '13',
                            ['required_str'] = '112',
                            ['required_agi'] = '10',
                        },
                        ['3'] = {
                            ['armor'] = '16',
                            ['required_str'] = '122',
                            ['required_agi'] = '10',
                        },
                        ['4'] = {
                            ['armor'] = '19',
                            ['required_str'] = '132',
                            ['required_agi'] = '10',
                        },
                        ['5'] = {
                            ['armor'] = '22',
                            ['required_str'] = '142',
                            ['required_agi'] = '10',
                        },
                        ['6'] = {
                            ['armor'] = '25',
                            ['required_str'] = '152',
                            ['required_agi'] = '10',
                        },
                        ['7'] = {
                            ['armor'] = '28',
                            ['required_str'] = '161',
                            ['required_agi'] = '10',
                        },
                        ['8'] = {
                            ['armor'] = '31',
                            ['required_str'] = '171',
                            ['required_agi'] = '10',
                        },
                        ['9'] = {
                            ['armor'] = '34',
                            ['required_str'] = '181',
                            ['required_agi'] = '10',
                        },
                        ['10'] = {
                            ['armor'] = '38',
                            ['required_str'] = '191',
                            ['required_agi'] = '10',
                        },
                        ['11'] = {
                            ['armor'] = '43',
                            ['required_str'] = '201',
                            ['required_agi'] = '10',
                        },
                        ['12'] = {
                            ['armor'] = '49',
                            ['required_str'] = '211',
                            ['required_agi'] = '10',
                        },
                        ['13'] = {
                            ['armor'] = '56',
                            ['required_str'] = '221',
                            ['required_agi'] = '10',
                        },
                        ['14'] = {
                            ['armor'] = '64',
                            ['required_str'] = '231',
                            ['required_agi'] = '10',
                        },
                        ['15'] = {
                            ['armor'] = '73',
                            ['required_str'] = '241',
                            ['required_agi'] = '10',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Scale Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '21',
                            ['required_str'] = '122',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '24',
                            ['required_str'] = '132',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '27',
                            ['required_str'] = '142',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '30',
                            ['required_str'] = '152',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '33',
                            ['required_str'] = '161',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '36',
                            ['required_str'] = '171',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '39',
                            ['required_str'] = '181',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '42',
                            ['required_str'] = '191',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '45',
                            ['required_str'] = '201',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '49',
                            ['required_str'] = '211',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '54',
                            ['required_str'] = '221',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '60',
                            ['required_str'] = '231',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '67',
                            ['required_str'] = '241',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '75',
                            ['required_str'] = '251',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '84',
                            ['required_str'] = '260',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '93',
                            ['required_str'] = '269',
                            ['required_agi'] = 0,
                        },
                    },
                },
            },
            ['class'] = {
                'warrior',
                'summoner',
                'assassin',
            },
        },
        ['Brass'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Brass Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '17',
                            ['required_str'] = '128',
                            ['required_agi'] = '52',
                        },
                        ['1'] = {
                            ['armor'] = '20',
                            ['required_str'] = '137',
                            ['required_agi'] = '55',
                        },
                        ['2'] = {
                            ['armor'] = '23',
                            ['required_str'] = '146',
                            ['required_agi'] = '57',
                        },
                        ['3'] = {
                            ['armor'] = '26',
                            ['required_str'] = '155',
                            ['required_agi'] = '60',
                        },
                        ['4'] = {
                            ['armor'] = '29',
                            ['required_str'] = '164',
                            ['required_agi'] = '63',
                        },
                        ['5'] = {
                            ['armor'] = '32',
                            ['required_str'] = '173',
                            ['required_agi'] = '65',
                        },
                        ['6'] = {
                            ['armor'] = '35',
                            ['required_str'] = '182',
                            ['required_agi'] = '68',
                        },
                        ['7'] = {
                            ['armor'] = '38',
                            ['required_str'] = '191',
                            ['required_agi'] = '71',
                        },
                        ['8'] = {
                            ['armor'] = '41',
                            ['required_str'] = '200',
                            ['required_agi'] = '74',
                        },
                        ['9'] = {
                            ['armor'] = '44',
                            ['required_str'] = '209',
                            ['required_agi'] = '76',
                        },
                        ['10'] = {
                            ['armor'] = '48',
                            ['required_str'] = '218',
                            ['required_agi'] = '79',
                        },
                        ['11'] = {
                            ['armor'] = '53',
                            ['required_str'] = '227',
                            ['required_agi'] = '82',
                        },
                        ['12'] = {
                            ['armor'] = '59',
                            ['required_str'] = '236',
                            ['required_agi'] = '84',
                        },
                        ['13'] = {
                            ['armor'] = '66',
                            ['required_str'] = '245',
                            ['required_agi'] = '87',
                        },
                        ['14'] = {
                            ['armor'] = '74',
                            ['required_str'] = '254',
                            ['required_agi'] = '90',
                        },
                        ['15'] = {
                            ['armor'] = '83',
                            ['required_str'] = '263',
                            ['required_agi'] = '92',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Brass Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '22',
                            ['required_str'] = '134',
                            ['required_agi'] = '54',
                        },
                        ['1'] = {
                            ['armor'] = '25',
                            ['required_str'] = '143',
                            ['required_agi'] = '56',
                        },
                        ['2'] = {
                            ['armor'] = '28',
                            ['required_str'] = '152',
                            ['required_agi'] = '59',
                        },
                        ['3'] = {
                            ['armor'] = '31',
                            ['required_str'] = '161',
                            ['required_agi'] = '62',
                        },
                        ['4'] = {
                            ['armor'] = '34',
                            ['required_str'] = '170',
                            ['required_agi'] = '65',
                        },
                        ['5'] = {
                            ['armor'] = '37',
                            ['required_str'] = '179',
                            ['required_agi'] = '67',
                        },
                        ['6'] = {
                            ['armor'] = '40',
                            ['required_str'] = '188',
                            ['required_agi'] = '70',
                        },
                        ['7'] = {
                            ['armor'] = '43',
                            ['required_str'] = '197',
                            ['required_agi'] = '73',
                        },
                        ['8'] = {
                            ['armor'] = '46',
                            ['required_str'] = '206',
                            ['required_agi'] = '75',
                        },
                        ['9'] = {
                            ['armor'] = '49',
                            ['required_str'] = '215',
                            ['required_agi'] = '78',
                        },
                        ['10'] = {
                            ['armor'] = '53',
                            ['required_str'] = '224',
                            ['required_agi'] = '81',
                        },
                        ['11'] = {
                            ['armor'] = '58',
                            ['required_str'] = '233',
                            ['required_agi'] = '83',
                        },
                        ['12'] = {
                            ['armor'] = '64',
                            ['required_str'] = '242',
                            ['required_agi'] = '86',
                        },
                        ['13'] = {
                            ['armor'] = '71',
                            ['required_str'] = '251',
                            ['required_agi'] = '89',
                        },
                        ['14'] = {
                            ['armor'] = '79',
                            ['required_str'] = '260',
                            ['required_agi'] = '92',
                        },
                        ['15'] = {
                            ['armor'] = '88',
                            ['required_str'] = '269',
                            ['required_agi'] = '94',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Brass Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '10',
                            ['required_str'] = '116',
                            ['required_agi'] = '48',
                        },
                        ['1'] = {
                            ['armor'] = '13',
                            ['required_str'] = '125',
                            ['required_agi'] = '51',
                        },
                        ['2'] = {
                            ['armor'] = '16',
                            ['required_str'] = '134',
                            ['required_agi'] = '54',
                        },
                        ['3'] = {
                            ['armor'] = '19',
                            ['required_str'] = '143',
                            ['required_agi'] = '56',
                        },
                        ['4'] = {
                            ['armor'] = '22',
                            ['required_str'] = '152',
                            ['required_agi'] = '59',
                        },
                        ['5'] = {
                            ['armor'] = '25',
                            ['required_str'] = '161',
                            ['required_agi'] = '62',
                        },
                        ['6'] = {
                            ['armor'] = '28',
                            ['required_str'] = '170',
                            ['required_agi'] = '65',
                        },
                        ['7'] = {
                            ['armor'] = '31',
                            ['required_str'] = '179',
                            ['required_agi'] = '67',
                        },
                        ['8'] = {
                            ['armor'] = '34',
                            ['required_str'] = '188',
                            ['required_agi'] = '70',
                        },
                        ['9'] = {
                            ['armor'] = '37',
                            ['required_str'] = '197',
                            ['required_agi'] = '73',
                        },
                        ['10'] = {
                            ['armor'] = '41',
                            ['required_str'] = '206',
                            ['required_agi'] = '75',
                        },
                        ['11'] = {
                            ['armor'] = '46',
                            ['required_str'] = '215',
                            ['required_agi'] = '78',
                        },
                        ['12'] = {
                            ['armor'] = '52',
                            ['required_str'] = '224',
                            ['required_agi'] = '81',
                        },
                        ['13'] = {
                            ['armor'] = '59',
                            ['required_str'] = '233',
                            ['required_agi'] = '83',
                        },
                        ['14'] = {
                            ['armor'] = '67',
                            ['required_str'] = '242',
                            ['required_agi'] = '86',
                        },
                        ['15'] = {
                            ['armor'] = '76',
                            ['required_str'] = '251',
                            ['required_agi'] = '89',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Brass Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '18',
                            ['required_str'] = '125',
                            ['required_agi'] = '51',
                        },
                        ['1'] = {
                            ['armor'] = '21',
                            ['required_str'] = '134',
                            ['required_agi'] = '54',
                        },
                        ['2'] = {
                            ['armor'] = '24',
                            ['required_str'] = '143',
                            ['required_agi'] = '56',
                        },
                        ['3'] = {
                            ['armor'] = '27',
                            ['required_str'] = '152',
                            ['required_agi'] = '59',
                        },
                        ['4'] = {
                            ['armor'] = '30',
                            ['required_str'] = '161',
                            ['required_agi'] = '62',
                        },
                        ['5'] = {
                            ['armor'] = '33',
                            ['required_str'] = '170',
                            ['required_agi'] = '65',
                        },
                        ['6'] = {
                            ['armor'] = '36',
                            ['required_str'] = '179',
                            ['required_agi'] = '67',
                        },
                        ['7'] = {
                            ['armor'] = '39',
                            ['required_str'] = '188',
                            ['required_agi'] = '70',
                        },
                        ['8'] = {
                            ['armor'] = '42',
                            ['required_str'] = '197',
                            ['required_agi'] = '73',
                        },
                        ['9'] = {
                            ['armor'] = '45',
                            ['required_str'] = '206',
                            ['required_agi'] = '75',
                        },
                        ['10'] = {
                            ['armor'] = '49',
                            ['required_str'] = '215',
                            ['required_agi'] = '78',
                        },
                        ['11'] = {
                            ['armor'] = '54',
                            ['required_str'] = '224',
                            ['required_agi'] = '81',
                        },
                        ['12'] = {
                            ['armor'] = '60',
                            ['required_str'] = '233',
                            ['required_agi'] = '83',
                        },
                        ['13'] = {
                            ['armor'] = '67',
                            ['required_str'] = '242',
                            ['required_agi'] = '86',
                        },
                        ['14'] = {
                            ['armor'] = '75',
                            ['required_str'] = '251',
                            ['required_agi'] = '89',
                        },
                        ['15'] = {
                            ['armor'] = '84',
                            ['required_str'] = '260',
                            ['required_agi'] = '92',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Brass Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '9',
                            ['required_str'] = '116',
                            ['required_agi'] = '48',
                        },
                        ['1'] = {
                            ['armor'] = '12',
                            ['required_str'] = '125',
                            ['required_agi'] = '51',
                        },
                        ['2'] = {
                            ['armor'] = '15',
                            ['required_str'] = '134',
                            ['required_agi'] = '54',
                        },
                        ['3'] = {
                            ['armor'] = '18',
                            ['required_str'] = '143',
                            ['required_agi'] = '56',
                        },
                        ['4'] = {
                            ['armor'] = '21',
                            ['required_str'] = '152',
                            ['required_agi'] = '59',
                        },
                        ['5'] = {
                            ['armor'] = '24',
                            ['required_str'] = '161',
                            ['required_agi'] = '62',
                        },
                        ['6'] = {
                            ['armor'] = '27',
                            ['required_str'] = '170',
                            ['required_agi'] = '65',
                        },
                        ['7'] = {
                            ['armor'] = '30',
                            ['required_str'] = '179',
                            ['required_agi'] = '67',
                        },
                        ['8'] = {
                            ['armor'] = '33',
                            ['required_str'] = '188',
                            ['required_agi'] = '70',
                        },
                        ['9'] = {
                            ['armor'] = '36',
                            ['required_str'] = '197',
                            ['required_agi'] = '73',
                        },
                        ['10'] = {
                            ['armor'] = '40',
                            ['required_str'] = '206',
                            ['required_agi'] = '75',
                        },
                        ['11'] = {
                            ['armor'] = '45',
                            ['required_str'] = '215',
                            ['required_agi'] = '78',
                        },
                        ['12'] = {
                            ['armor'] = '51',
                            ['required_str'] = '224',
                            ['required_agi'] = '81',
                        },
                        ['13'] = {
                            ['armor'] = '58',
                            ['required_str'] = '233',
                            ['required_agi'] = '83',
                        },
                        ['14'] = {
                            ['armor'] = '66',
                            ['required_str'] = '242',
                            ['required_agi'] = '86',
                        },
                        ['15'] = {
                            ['armor'] = '75',
                            ['required_str'] = '251',
                            ['required_agi'] = '89',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Brass Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '25',
                            ['required_str'] = '143',
                            ['required_agi'] = '56',
                        },
                        ['1'] = {
                            ['armor'] = '28',
                            ['required_str'] = '152',
                            ['required_agi'] = '59',
                        },
                        ['2'] = {
                            ['armor'] = '31',
                            ['required_str'] = '161',
                            ['required_agi'] = '62',
                        },
                        ['3'] = {
                            ['armor'] = '34',
                            ['required_str'] = '170',
                            ['required_agi'] = '65',
                        },
                        ['4'] = {
                            ['armor'] = '37',
                            ['required_str'] = '179',
                            ['required_agi'] = '67',
                        },
                        ['5'] = {
                            ['armor'] = '40',
                            ['required_str'] = '188',
                            ['required_agi'] = '70',
                        },
                        ['6'] = {
                            ['armor'] = '43',
                            ['required_str'] = '197',
                            ['required_agi'] = '73',
                        },
                        ['7'] = {
                            ['armor'] = '46',
                            ['required_str'] = '206',
                            ['required_agi'] = '75',
                        },
                        ['8'] = {
                            ['armor'] = '49',
                            ['required_str'] = '215',
                            ['required_agi'] = '78',
                        },
                        ['9'] = {
                            ['armor'] = '53',
                            ['required_str'] = '224',
                            ['required_agi'] = '81',
                        },
                        ['10'] = {
                            ['armor'] = '58',
                            ['required_str'] = '233',
                            ['required_agi'] = '83',
                        },
                        ['11'] = {
                            ['armor'] = '64',
                            ['required_str'] = '242',
                            ['required_agi'] = '86',
                        },
                        ['12'] = {
                            ['armor'] = '71',
                            ['required_str'] = '251',
                            ['required_agi'] = '89',
                        },
                        ['13'] = {
                            ['armor'] = '79',
                            ['required_str'] = '260',
                            ['required_agi'] = '92',
                        },
                        ['14'] = {
                            ['armor'] = '88',
                            ['required_str'] = '269',
                            ['required_agi'] = '94',
                        },
                        ['15'] = {
                            ['armor'] = '99',
                            ['required_str'] = '279',
                            ['required_agi'] = '97',
                        },
                    },
                },
            },
            ['class'] = {
                'warrior',
                'assassin',
            },
        },
        ['Plate'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Plate Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '20',
                            ['required_str'] = '199',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '23',
                            ['required_str'] = '211',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '26',
                            ['required_str'] = '222',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '29',
                            ['required_str'] = '234',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '32',
                            ['required_str'] = '246',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '35',
                            ['required_str'] = '257',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '38',
                            ['required_str'] = '269',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '41',
                            ['required_str'] = '281',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '44',
                            ['required_str'] = '293',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '47',
                            ['required_str'] = '304',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '51',
                            ['required_str'] = '316',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '56',
                            ['required_str'] = '328',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '62',
                            ['required_str'] = '339',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '69',
                            ['required_str'] = '351',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '77',
                            ['required_str'] = '363',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '86',
                            ['required_str'] = '374',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Plate Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '30',
                            ['required_str'] = '207',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '33',
                            ['required_str'] = '218',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '36',
                            ['required_str'] = '230',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '39',
                            ['required_str'] = '242',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '42',
                            ['required_str'] = '254',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '45',
                            ['required_str'] = '265',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '48',
                            ['required_str'] = '277',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '51',
                            ['required_str'] = '289',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '54',
                            ['required_str'] = '300',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '57',
                            ['required_str'] = '312',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '61',
                            ['required_str'] = '324',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '66',
                            ['required_str'] = '335',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '72',
                            ['required_str'] = '347',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '79',
                            ['required_str'] = '359',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '87',
                            ['required_str'] = '371',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '96',
                            ['required_str'] = '382',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Plate Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '12',
                            ['required_str'] = '183',
                            ['required_agi'] = '4',
                        },
                        ['1'] = {
                            ['armor'] = '15',
                            ['required_str'] = '195',
                            ['required_agi'] = '4',
                        },
                        ['2'] = {
                            ['armor'] = '18',
                            ['required_str'] = '207',
                            ['required_agi'] = '4',
                        },
                        ['3'] = {
                            ['armor'] = '21',
                            ['required_str'] = '218',
                            ['required_agi'] = '4',
                        },
                        ['4'] = {
                            ['armor'] = '24',
                            ['required_str'] = '230',
                            ['required_agi'] = '4',
                        },
                        ['5'] = {
                            ['armor'] = '27',
                            ['required_str'] = '242',
                            ['required_agi'] = '4',
                        },
                        ['6'] = {
                            ['armor'] = '30',
                            ['required_str'] = '254',
                            ['required_agi'] = '4',
                        },
                        ['7'] = {
                            ['armor'] = '33',
                            ['required_str'] = '265',
                            ['required_agi'] = '4',
                        },
                        ['8'] = {
                            ['armor'] = '36',
                            ['required_str'] = '277',
                            ['required_agi'] = '4',
                        },
                        ['9'] = {
                            ['armor'] = '39',
                            ['required_str'] = '289',
                            ['required_agi'] = '4',
                        },
                        ['10'] = {
                            ['armor'] = '43',
                            ['required_str'] = '300',
                            ['required_agi'] = '4',
                        },
                        ['11'] = {
                            ['armor'] = '48',
                            ['required_str'] = '312',
                            ['required_agi'] = '4',
                        },
                        ['12'] = {
                            ['armor'] = '54',
                            ['required_str'] = '324',
                            ['required_agi'] = '4',
                        },
                        ['13'] = {
                            ['armor'] = '61',
                            ['required_str'] = '335',
                            ['required_agi'] = '4',
                        },
                        ['14'] = {
                            ['armor'] = '69',
                            ['required_str'] = '347',
                            ['required_agi'] = '4',
                        },
                        ['15'] = {
                            ['armor'] = '78',
                            ['required_str'] = '359',
                            ['required_agi'] = '4',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Plate Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '22',
                            ['required_str'] = '195',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '25',
                            ['required_str'] = '207',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '28',
                            ['required_str'] = '218',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '31',
                            ['required_str'] = '230',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '34',
                            ['required_str'] = '242',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '37',
                            ['required_str'] = '254',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '40',
                            ['required_str'] = '265',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '43',
                            ['required_str'] = '277',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '46',
                            ['required_str'] = '289',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '49',
                            ['required_str'] = '300',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '53',
                            ['required_str'] = '312',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '58',
                            ['required_str'] = '324',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '64',
                            ['required_str'] = '335',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '71',
                            ['required_str'] = '347',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '79',
                            ['required_str'] = '359',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '88',
                            ['required_str'] = '371',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Plate Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '12',
                            ['required_str'] = '183',
                            ['required_agi'] = '4',
                        },
                        ['1'] = {
                            ['armor'] = '15',
                            ['required_str'] = '195',
                            ['required_agi'] = '4',
                        },
                        ['2'] = {
                            ['armor'] = '18',
                            ['required_str'] = '207',
                            ['required_agi'] = '4',
                        },
                        ['3'] = {
                            ['armor'] = '21',
                            ['required_str'] = '218',
                            ['required_agi'] = '4',
                        },
                        ['4'] = {
                            ['armor'] = '24',
                            ['required_str'] = '230',
                            ['required_agi'] = '4',
                        },
                        ['5'] = {
                            ['armor'] = '27',
                            ['required_str'] = '242',
                            ['required_agi'] = '4',
                        },
                        ['6'] = {
                            ['armor'] = '30',
                            ['required_str'] = '254',
                            ['required_agi'] = '4',
                        },
                        ['7'] = {
                            ['armor'] = '33',
                            ['required_str'] = '265',
                            ['required_agi'] = '4',
                        },
                        ['8'] = {
                            ['armor'] = '36',
                            ['required_str'] = '277',
                            ['required_agi'] = '4',
                        },
                        ['9'] = {
                            ['armor'] = '39',
                            ['required_str'] = '289',
                            ['required_agi'] = '4',
                        },
                        ['10'] = {
                            ['armor'] = '43',
                            ['required_str'] = '300',
                            ['required_agi'] = '4',
                        },
                        ['11'] = {
                            ['armor'] = '48',
                            ['required_str'] = '312',
                            ['required_agi'] = '4',
                        },
                        ['12'] = {
                            ['armor'] = '54',
                            ['required_str'] = '324',
                            ['required_agi'] = '4',
                        },
                        ['13'] = {
                            ['armor'] = '61',
                            ['required_str'] = '335',
                            ['required_agi'] = '4',
                        },
                        ['14'] = {
                            ['armor'] = '69',
                            ['required_str'] = '347',
                            ['required_agi'] = '4',
                        },
                        ['15'] = {
                            ['armor'] = '78',
                            ['required_str'] = '359',
                            ['required_agi'] = '4',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Plate Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '25',
                            ['required_str'] = '110',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '28',
                            ['required_str'] = '120',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '31',
                            ['required_str'] = '131',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '34',
                            ['required_str'] = '142',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '37',
                            ['required_str'] = '153',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '40',
                            ['required_str'] = '164',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '43',
                            ['required_str'] = '174',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '46',
                            ['required_str'] = '185',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '49',
                            ['required_str'] = '196',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '52',
                            ['required_str'] = '207',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '56',
                            ['required_str'] = '218',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '61',
                            ['required_str'] = '228',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '67',
                            ['required_str'] = '239',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '74',
                            ['required_str'] = '250',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '82',
                            ['required_str'] = '261',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '91',
                            ['required_str'] = '272',
                            ['required_agi'] = 0,
                        },
                    },
                },
            },
            ['class'] = {
                'warrior',
                'assassin',
            },
        },
        ['Black Dragon'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Black Dragon Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '30',
                            ['required_str'] = '438',
                            ['required_agi'] = '167',
                        },
                        ['1'] = {
                            ['armor'] = '33',
                            ['required_str'] = '453',
                            ['required_agi'] = '173',
                        },
                        ['2'] = {
                            ['armor'] = '36',
                            ['required_str'] = '468',
                            ['required_agi'] = '178',
                        },
                        ['3'] = {
                            ['armor'] = '39',
                            ['required_str'] = '484',
                            ['required_agi'] = '183',
                        },
                        ['4'] = {
                            ['armor'] = '42',
                            ['required_str'] = '499',
                            ['required_agi'] = '189',
                        },
                        ['5'] = {
                            ['armor'] = '45',
                            ['required_str'] = '514',
                            ['required_agi'] = '194',
                        },
                        ['6'] = {
                            ['armor'] = '48',
                            ['required_str'] = '530',
                            ['required_agi'] = '200',
                        },
                        ['7'] = {
                            ['armor'] = '51',
                            ['required_str'] = '545',
                            ['required_agi'] = '205',
                        },
                        ['8'] = {
                            ['armor'] = '54',
                            ['required_str'] = '560',
                            ['required_agi'] = '210',
                        },
                        ['9'] = {
                            ['armor'] = '57',
                            ['required_str'] = '575',
                            ['required_agi'] = '216',
                        },
                        ['10'] = {
                            ['armor'] = '61',
                            ['required_str'] = '591',
                            ['required_agi'] = '221',
                        },
                        ['11'] = {
                            ['armor'] = '66',
                            ['required_str'] = '606',
                            ['required_agi'] = '227',
                        },
                        ['12'] = {
                            ['armor'] = '72',
                            ['required_str'] = '621',
                            ['required_agi'] = '232',
                        },
                        ['13'] = {
                            ['armor'] = '79',
                            ['required_str'] = '637',
                            ['required_agi'] = '237',
                        },
                        ['14'] = {
                            ['armor'] = '87',
                            ['required_str'] = '652',
                            ['required_agi'] = '243',
                        },
                        ['15'] = {
                            ['armor'] = '96',
                            ['required_str'] = '667',
                            ['required_agi'] = '248',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Black Dragon Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '48',
                            ['required_str'] = '479',
                            ['required_agi'] = '182',
                        },
                        ['1'] = {
                            ['armor'] = '51',
                            ['required_str'] = '494',
                            ['required_agi'] = '187',
                        },
                        ['2'] = {
                            ['armor'] = '54',
                            ['required_str'] = '509',
                            ['required_agi'] = '192',
                        },
                        ['3'] = {
                            ['armor'] = '57',
                            ['required_str'] = '524',
                            ['required_agi'] = '198',
                        },
                        ['4'] = {
                            ['armor'] = '60',
                            ['required_str'] = '540',
                            ['required_agi'] = '203',
                        },
                        ['5'] = {
                            ['armor'] = '63',
                            ['required_str'] = '555',
                            ['required_agi'] = '209',
                        },
                        ['6'] = {
                            ['armor'] = '66',
                            ['required_str'] = '570',
                            ['required_agi'] = '214',
                        },
                        ['7'] = {
                            ['armor'] = '69',
                            ['required_str'] = '586',
                            ['required_agi'] = '219',
                        },
                        ['8'] = {
                            ['armor'] = '72',
                            ['required_str'] = '601',
                            ['required_agi'] = '225',
                        },
                        ['9'] = {
                            ['armor'] = '75',
                            ['required_str'] = '616',
                            ['required_agi'] = '230',
                        },
                        ['10'] = {
                            ['armor'] = '79',
                            ['required_str'] = '632',
                            ['required_agi'] = '236',
                        },
                        ['11'] = {
                            ['armor'] = '84',
                            ['required_str'] = '647',
                            ['required_agi'] = '241',
                        },
                        ['12'] = {
                            ['armor'] = '90',
                            ['required_str'] = '662',
                            ['required_agi'] = '246',
                        },
                        ['13'] = {
                            ['armor'] = '97',
                            ['required_str'] = '677',
                            ['required_agi'] = '252',
                        },
                        ['14'] = {
                            ['armor'] = '105',
                            ['required_str'] = '693',
                            ['required_agi'] = '257',
                        },
                        ['15'] = {
                            ['armor'] = '114',
                            ['required_str'] = '708',
                            ['required_agi'] = '263',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Black Dragon Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '24',
                            ['required_str'] = '417',
                            ['required_agi'] = '160',
                        },
                        ['1'] = {
                            ['armor'] = '27',
                            ['required_str'] = '433',
                            ['required_agi'] = '165',
                        },
                        ['2'] = {
                            ['armor'] = '30',
                            ['required_str'] = '448',
                            ['required_agi'] = '171',
                        },
                        ['3'] = {
                            ['armor'] = '33',
                            ['required_str'] = '463',
                            ['required_agi'] = '176',
                        },
                        ['4'] = {
                            ['armor'] = '36',
                            ['required_str'] = '479',
                            ['required_agi'] = '182',
                        },
                        ['5'] = {
                            ['armor'] = '39',
                            ['required_str'] = '494',
                            ['required_agi'] = '187',
                        },
                        ['6'] = {
                            ['armor'] = '42',
                            ['required_str'] = '509',
                            ['required_agi'] = '192',
                        },
                        ['7'] = {
                            ['armor'] = '45',
                            ['required_str'] = '524',
                            ['required_agi'] = '198',
                        },
                        ['8'] = {
                            ['armor'] = '48',
                            ['required_str'] = '540',
                            ['required_agi'] = '203',
                        },
                        ['9'] = {
                            ['armor'] = '51',
                            ['required_str'] = '555',
                            ['required_agi'] = '209',
                        },
                        ['10'] = {
                            ['armor'] = '55',
                            ['required_str'] = '570',
                            ['required_agi'] = '214',
                        },
                        ['11'] = {
                            ['armor'] = '60',
                            ['required_str'] = '586',
                            ['required_agi'] = '219',
                        },
                        ['12'] = {
                            ['armor'] = '66',
                            ['required_str'] = '601',
                            ['required_agi'] = '225',
                        },
                        ['13'] = {
                            ['armor'] = '73',
                            ['required_str'] = '616',
                            ['required_agi'] = '230',
                        },
                        ['14'] = {
                            ['armor'] = '81',
                            ['required_str'] = '632',
                            ['required_agi'] = '236',
                        },
                        ['15'] = {
                            ['armor'] = '90',
                            ['required_str'] = '647',
                            ['required_agi'] = '241',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Black Dragon Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '40',
                            ['required_str'] = '448',
                            ['required_agi'] = '171',
                        },
                        ['1'] = {
                            ['armor'] = '43',
                            ['required_str'] = '463',
                            ['required_agi'] = '176',
                        },
                        ['2'] = {
                            ['armor'] = '46',
                            ['required_str'] = '479',
                            ['required_agi'] = '182',
                        },
                        ['3'] = {
                            ['armor'] = '49',
                            ['required_str'] = '494',
                            ['required_agi'] = '187',
                        },
                        ['4'] = {
                            ['armor'] = '52',
                            ['required_str'] = '509',
                            ['required_agi'] = '192',
                        },
                        ['5'] = {
                            ['armor'] = '55',
                            ['required_str'] = '524',
                            ['required_agi'] = '198',
                        },
                        ['6'] = {
                            ['armor'] = '58',
                            ['required_str'] = '540',
                            ['required_agi'] = '203',
                        },
                        ['7'] = {
                            ['armor'] = '61',
                            ['required_str'] = '555',
                            ['required_agi'] = '209',
                        },
                        ['8'] = {
                            ['armor'] = '64',
                            ['required_str'] = '570',
                            ['required_agi'] = '214',
                        },
                        ['9'] = {
                            ['armor'] = '67',
                            ['required_str'] = '586',
                            ['required_agi'] = '219',
                        },
                        ['10'] = {
                            ['armor'] = '71',
                            ['required_str'] = '601',
                            ['required_agi'] = '225',
                        },
                        ['11'] = {
                            ['armor'] = '76',
                            ['required_str'] = '616',
                            ['required_agi'] = '230',
                        },
                        ['12'] = {
                            ['armor'] = '82',
                            ['required_str'] = '632',
                            ['required_agi'] = '236',
                        },
                        ['13'] = {
                            ['armor'] = '89',
                            ['required_str'] = '647',
                            ['required_agi'] = '241',
                        },
                        ['14'] = {
                            ['armor'] = '97',
                            ['required_str'] = '662',
                            ['required_agi'] = '246',
                        },
                        ['15'] = {
                            ['armor'] = '106',
                            ['required_str'] = '677',
                            ['required_agi'] = '252',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Black Dragon Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '22',
                            ['required_str'] = '407',
                            ['required_agi'] = '156',
                        },
                        ['1'] = {
                            ['armor'] = '25',
                            ['required_str'] = '422',
                            ['required_agi'] = '162',
                        },
                        ['2'] = {
                            ['armor'] = '28',
                            ['required_str'] = '438',
                            ['required_agi'] = '167',
                        },
                        ['3'] = {
                            ['armor'] = '31',
                            ['required_str'] = '453',
                            ['required_agi'] = '173',
                        },
                        ['4'] = {
                            ['armor'] = '34',
                            ['required_str'] = '468',
                            ['required_agi'] = '178',
                        },
                        ['5'] = {
                            ['armor'] = '37',
                            ['required_str'] = '484',
                            ['required_agi'] = '183',
                        },
                        ['6'] = {
                            ['armor'] = '40',
                            ['required_str'] = '499',
                            ['required_agi'] = '189',
                        },
                        ['7'] = {
                            ['armor'] = '43',
                            ['required_str'] = '514',
                            ['required_agi'] = '194',
                        },
                        ['8'] = {
                            ['armor'] = '46',
                            ['required_str'] = '530',
                            ['required_agi'] = '200',
                        },
                        ['9'] = {
                            ['armor'] = '49',
                            ['required_str'] = '545',
                            ['required_agi'] = '205',
                        },
                        ['10'] = {
                            ['armor'] = '53',
                            ['required_str'] = '560',
                            ['required_agi'] = '210',
                        },
                        ['11'] = {
                            ['armor'] = '58',
                            ['required_str'] = '575',
                            ['required_agi'] = '216',
                        },
                        ['12'] = {
                            ['armor'] = '64',
                            ['required_str'] = '591',
                            ['required_agi'] = '221',
                        },
                        ['13'] = {
                            ['armor'] = '71',
                            ['required_str'] = '606',
                            ['required_agi'] = '227',
                        },
                        ['14'] = {
                            ['armor'] = '79',
                            ['required_str'] = '621',
                            ['required_agi'] = '232',
                        },
                        ['15'] = {
                            ['armor'] = '88',
                            ['required_str'] = '637',
                            ['required_agi'] = '237',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Black Dragon Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '51',
                            ['required_str'] = '494',
                            ['required_agi'] = '187',
                        },
                        ['1'] = {
                            ['armor'] = '54',
                            ['required_str'] = '509',
                            ['required_agi'] = '192',
                        },
                        ['2'] = {
                            ['armor'] = '57',
                            ['required_str'] = '524',
                            ['required_agi'] = '198',
                        },
                        ['3'] = {
                            ['armor'] = '60',
                            ['required_str'] = '540',
                            ['required_agi'] = '203',
                        },
                        ['4'] = {
                            ['armor'] = '63',
                            ['required_str'] = '555',
                            ['required_agi'] = '209',
                        },
                        ['5'] = {
                            ['armor'] = '66',
                            ['required_str'] = '570',
                            ['required_agi'] = '214',
                        },
                        ['6'] = {
                            ['armor'] = '69',
                            ['required_str'] = '586',
                            ['required_agi'] = '219',
                        },
                        ['7'] = {
                            ['armor'] = '72',
                            ['required_str'] = '601',
                            ['required_agi'] = '225',
                        },
                        ['8'] = {
                            ['armor'] = '75',
                            ['required_str'] = '616',
                            ['required_agi'] = '230',
                        },
                        ['9'] = {
                            ['armor'] = '79',
                            ['required_str'] = '632',
                            ['required_agi'] = '236',
                        },
                        ['10'] = {
                            ['armor'] = '84',
                            ['required_str'] = '647',
                            ['required_agi'] = '241',
                        },
                        ['11'] = {
                            ['armor'] = '90',
                            ['required_str'] = '662',
                            ['required_agi'] = '246',
                        },
                        ['12'] = {
                            ['armor'] = '97',
                            ['required_str'] = '677',
                            ['required_agi'] = '252',
                        },
                        ['13'] = {
                            ['armor'] = '105',
                            ['required_str'] = '693',
                            ['required_agi'] = '257',
                        },
                        ['14'] = {
                            ['armor'] = '114',
                            ['required_str'] = '708',
                            ['required_agi'] = '263',
                        },
                        ['15'] = {
                            ['armor'] = '123',
                            ['required_str'] = '725',
                            ['required_agi'] = '270',
                        },
                    },
                },
            },
            ['class'] = {
                'warrior',
            },
        },
        ['Dark Phoenix'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Dark Phoenix Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '43',
                            ['required_str'] = '585',
                            ['required_agi'] = '191',
                        },
                        ['1'] = {
                            ['armor'] = '46',
                            ['required_str'] = '604',
                            ['required_agi'] = '196',
                        },
                        ['2'] = {
                            ['armor'] = '49',
                            ['required_str'] = '622',
                            ['required_agi'] = '202',
                        },
                        ['3'] = {
                            ['armor'] = '52',
                            ['required_str'] = '641',
                            ['required_agi'] = '207',
                        },
                        ['4'] = {
                            ['armor'] = '55',
                            ['required_str'] = '659',
                            ['required_agi'] = '213',
                        },
                        ['5'] = {
                            ['armor'] = '58',
                            ['required_str'] = '678',
                            ['required_agi'] = '219',
                        },
                        ['6'] = {
                            ['armor'] = '61',
                            ['required_str'] = '696',
                            ['required_agi'] = '224',
                        },
                        ['7'] = {
                            ['armor'] = '64',
                            ['required_str'] = '714',
                            ['required_agi'] = '230',
                        },
                        ['8'] = {
                            ['armor'] = '67',
                            ['required_str'] = '733',
                            ['required_agi'] = '235',
                        },
                        ['9'] = {
                            ['armor'] = '70',
                            ['required_str'] = '751',
                            ['required_agi'] = '241',
                        },
                        ['10'] = {
                            ['armor'] = '74',
                            ['required_str'] = '770',
                            ['required_agi'] = '246',
                        },
                        ['11'] = {
                            ['armor'] = '79',
                            ['required_str'] = '788',
                            ['required_agi'] = '252',
                        },
                        ['12'] = {
                            ['armor'] = '85',
                            ['required_str'] = '807',
                            ['required_agi'] = '258',
                        },
                        ['13'] = {
                            ['armor'] = '92',
                            ['required_str'] = '825',
                            ['required_agi'] = '263',
                        },
                        ['14'] = {
                            ['armor'] = '100',
                            ['required_str'] = '844',
                            ['required_agi'] = '269',
                        },
                        ['15'] = {
                            ['armor'] = '109',
                            ['required_str'] = '862',
                            ['required_agi'] = '274',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Dark Phoenix Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '63',
                            ['required_str'] = '662',
                            ['required_agi'] = '215',
                        },
                        ['1'] = {
                            ['armor'] = '66',
                            ['required_str'] = '681',
                            ['required_agi'] = '220',
                        },
                        ['2'] = {
                            ['armor'] = '69',
                            ['required_str'] = '700',
                            ['required_agi'] = '226',
                        },
                        ['3'] = {
                            ['armor'] = '72',
                            ['required_str'] = '719',
                            ['required_agi'] = '232',
                        },
                        ['4'] = {
                            ['armor'] = '75',
                            ['required_str'] = '739',
                            ['required_agi'] = '238',
                        },
                        ['5'] = {
                            ['armor'] = '78',
                            ['required_str'] = '758',
                            ['required_agi'] = '244',
                        },
                        ['6'] = {
                            ['armor'] = '81',
                            ['required_str'] = '777',
                            ['required_agi'] = '250',
                        },
                        ['7'] = {
                            ['armor'] = '84',
                            ['required_str'] = '796',
                            ['required_agi'] = '255',
                        },
                        ['8'] = {
                            ['armor'] = '87',
                            ['required_str'] = '816',
                            ['required_agi'] = '261',
                        },
                        ['9'] = {
                            ['armor'] = '90',
                            ['required_str'] = '835',
                            ['required_agi'] = '267',
                        },
                        ['10'] = {
                            ['armor'] = '94',
                            ['required_str'] = '854',
                            ['required_agi'] = '273',
                        },
                        ['11'] = {
                            ['armor'] = '99',
                            ['required_str'] = '873',
                            ['required_agi'] = '279',
                        },
                        ['12'] = {
                            ['armor'] = '105',
                            ['required_str'] = '893',
                            ['required_agi'] = '285',
                        },
                        ['13'] = {
                            ['armor'] = '112',
                            ['required_str'] = '912',
                            ['required_agi'] = '291',
                        },
                        ['14'] = {
                            ['armor'] = '120',
                            ['required_str'] = '931',
                            ['required_agi'] = '296',
                        },
                        ['15'] = {
                            ['armor'] = '129',
                            ['required_str'] = '950',
                            ['required_agi'] = '302',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Dark Phoenix Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '40',
                            ['required_str'] = '572',
                            ['required_agi'] = '187',
                        },
                        ['1'] = {
                            ['armor'] = '43',
                            ['required_str'] = '590',
                            ['required_agi'] = '192',
                        },
                        ['2'] = {
                            ['armor'] = '46',
                            ['required_str'] = '608',
                            ['required_agi'] = '198',
                        },
                        ['3'] = {
                            ['armor'] = '49',
                            ['required_str'] = '625',
                            ['required_agi'] = '203',
                        },
                        ['4'] = {
                            ['armor'] = '52',
                            ['required_str'] = '643',
                            ['required_agi'] = '209',
                        },
                        ['5'] = {
                            ['armor'] = '55',
                            ['required_str'] = '661',
                            ['required_agi'] = '214',
                        },
                        ['6'] = {
                            ['armor'] = '58',
                            ['required_str'] = '679',
                            ['required_agi'] = '219',
                        },
                        ['7'] = {
                            ['armor'] = '61',
                            ['required_str'] = '697',
                            ['required_agi'] = '225',
                        },
                        ['8'] = {
                            ['armor'] = '64',
                            ['required_str'] = '714',
                            ['required_agi'] = '230',
                        },
                        ['9'] = {
                            ['armor'] = '67',
                            ['required_str'] = '732',
                            ['required_agi'] = '236',
                        },
                        ['10'] = {
                            ['armor'] = '71',
                            ['required_str'] = '750',
                            ['required_agi'] = '241',
                        },
                        ['11'] = {
                            ['armor'] = '76',
                            ['required_str'] = '768',
                            ['required_agi'] = '246',
                        },
                        ['12'] = {
                            ['armor'] = '82',
                            ['required_str'] = '786',
                            ['required_agi'] = '252',
                        },
                        ['13'] = {
                            ['armor'] = '89',
                            ['required_str'] = '804',
                            ['required_agi'] = '257',
                        },
                        ['14'] = {
                            ['armor'] = '97',
                            ['required_str'] = '821',
                            ['required_agi'] = '263',
                        },
                        ['15'] = {
                            ['armor'] = '106',
                            ['required_str'] = '839',
                            ['required_agi'] = '268',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Dark Phoenix Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '54',
                            ['required_str'] = '616',
                            ['required_agi'] = '201',
                        },
                        ['1'] = {
                            ['armor'] = '57',
                            ['required_str'] = '634',
                            ['required_agi'] = '207',
                        },
                        ['2'] = {
                            ['armor'] = '60',
                            ['required_str'] = '653',
                            ['required_agi'] = '212',
                        },
                        ['3'] = {
                            ['armor'] = '63',
                            ['required_str'] = '672',
                            ['required_agi'] = '218',
                        },
                        ['4'] = {
                            ['armor'] = '66',
                            ['required_str'] = '690',
                            ['required_agi'] = '224',
                        },
                        ['5'] = {
                            ['armor'] = '69',
                            ['required_str'] = '709',
                            ['required_agi'] = '229',
                        },
                        ['6'] = {
                            ['armor'] = '72',
                            ['required_str'] = '727',
                            ['required_agi'] = '235',
                        },
                        ['7'] = {
                            ['armor'] = '75',
                            ['required_str'] = '746',
                            ['required_agi'] = '241',
                        },
                        ['8'] = {
                            ['armor'] = '78',
                            ['required_str'] = '765',
                            ['required_agi'] = '246',
                        },
                        ['9'] = {
                            ['armor'] = '81',
                            ['required_str'] = '783',
                            ['required_agi'] = '252',
                        },
                        ['10'] = {
                            ['armor'] = '85',
                            ['required_str'] = '802',
                            ['required_agi'] = '258',
                        },
                        ['11'] = {
                            ['armor'] = '90',
                            ['required_str'] = '821',
                            ['required_agi'] = '263',
                        },
                        ['12'] = {
                            ['armor'] = '96',
                            ['required_str'] = '839',
                            ['required_agi'] = '269',
                        },
                        ['13'] = {
                            ['armor'] = '103',
                            ['required_str'] = '858',
                            ['required_agi'] = '275',
                        },
                        ['14'] = {
                            ['armor'] = '111',
                            ['required_str'] = '876',
                            ['required_agi'] = '280',
                        },
                        ['15'] = {
                            ['armor'] = '120',
                            ['required_str'] = '895',
                            ['required_agi'] = '286',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Dark Phoenix Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '37',
                            ['required_str'] = '548',
                            ['required_agi'] = '182',
                        },
                        ['1'] = {
                            ['armor'] = '40',
                            ['required_str'] = '567',
                            ['required_agi'] = '188',
                        },
                        ['2'] = {
                            ['armor'] = '43',
                            ['required_str'] = '585',
                            ['required_agi'] = '193',
                        },
                        ['3'] = {
                            ['armor'] = '46',
                            ['required_str'] = '604',
                            ['required_agi'] = '199',
                        },
                        ['4'] = {
                            ['armor'] = '49',
                            ['required_str'] = '622',
                            ['required_agi'] = '205',
                        },
                        ['5'] = {
                            ['armor'] = '52',
                            ['required_str'] = '641',
                            ['required_agi'] = '210',
                        },
                        ['6'] = {
                            ['armor'] = '55',
                            ['required_str'] = '659',
                            ['required_agi'] = '216',
                        },
                        ['7'] = {
                            ['armor'] = '58',
                            ['required_str'] = '678',
                            ['required_agi'] = '222',
                        },
                        ['8'] = {
                            ['armor'] = '61',
                            ['required_str'] = '696',
                            ['required_agi'] = '227',
                        },
                        ['9'] = {
                            ['armor'] = '64',
                            ['required_str'] = '714',
                            ['required_agi'] = '233',
                        },
                        ['10'] = {
                            ['armor'] = '68',
                            ['required_str'] = '733',
                            ['required_agi'] = '239',
                        },
                        ['11'] = {
                            ['armor'] = '73',
                            ['required_str'] = '751',
                            ['required_agi'] = '244',
                        },
                        ['12'] = {
                            ['armor'] = '79',
                            ['required_str'] = '770',
                            ['required_agi'] = '250',
                        },
                        ['13'] = {
                            ['armor'] = '86',
                            ['required_str'] = '788',
                            ['required_agi'] = '256',
                        },
                        ['14'] = {
                            ['armor'] = '94',
                            ['required_str'] = '807',
                            ['required_agi'] = '261',
                        },
                        ['15'] = {
                            ['armor'] = '103',
                            ['required_str'] = '825',
                            ['required_agi'] = '267',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Dark Phoenix Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '66',
                            ['required_str'] = '681',
                            ['required_agi'] = '220',
                        },
                        ['1'] = {
                            ['armor'] = '69',
                            ['required_str'] = '700',
                            ['required_agi'] = '226',
                        },
                        ['2'] = {
                            ['armor'] = '72',
                            ['required_str'] = '719',
                            ['required_agi'] = '232',
                        },
                        ['3'] = {
                            ['armor'] = '75',
                            ['required_str'] = '739',
                            ['required_agi'] = '238',
                        },
                        ['4'] = {
                            ['armor'] = '78',
                            ['required_str'] = '758',
                            ['required_agi'] = '244',
                        },
                        ['5'] = {
                            ['armor'] = '81',
                            ['required_str'] = '777',
                            ['required_agi'] = '250',
                        },
                        ['6'] = {
                            ['armor'] = '84',
                            ['required_str'] = '796',
                            ['required_agi'] = '255',
                        },
                        ['7'] = {
                            ['armor'] = '87',
                            ['required_str'] = '816',
                            ['required_agi'] = '261',
                        },
                        ['8'] = {
                            ['armor'] = '90',
                            ['required_str'] = '835',
                            ['required_agi'] = '267',
                        },
                        ['9'] = {
                            ['armor'] = '94',
                            ['required_str'] = '854',
                            ['required_agi'] = '273',
                        },
                        ['10'] = {
                            ['armor'] = '99',
                            ['required_str'] = '873',
                            ['required_agi'] = '279',
                        },
                        ['11'] = {
                            ['armor'] = '105',
                            ['required_str'] = '893',
                            ['required_agi'] = '285',
                        },
                        ['12'] = {
                            ['armor'] = '112',
                            ['required_str'] = '912',
                            ['required_agi'] = '291',
                        },
                        ['13'] = {
                            ['armor'] = '120',
                            ['required_str'] = '931',
                            ['required_agi'] = '296',
                        },
                        ['14'] = {
                            ['armor'] = '129',
                            ['required_str'] = '950',
                            ['required_agi'] = '302',
                        },
                        ['15'] = {
                            ['armor'] = '138',
                            ['required_str'] = '970',
                            ['required_agi'] = '308',
                        },
                    },
                },
            },
            ['class'] = {
                'warrior',
            },
        },
        ['Great Dragon'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Great Dragon Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '53',
                            ['required_str'] = '644',
                            ['required_agi'] = '200',
                        },
                        ['1'] = {
                            ['armor'] = '56',
                            ['required_str'] = '662',
                            ['required_agi'] = '206',
                        },
                        ['2'] = {
                            ['armor'] = '59',
                            ['required_str'] = '680',
                            ['required_agi'] = '211',
                        },
                        ['3'] = {
                            ['armor'] = '62',
                            ['required_str'] = '698',
                            ['required_agi'] = '216',
                        },
                        ['4'] = {
                            ['armor'] = '65',
                            ['required_str'] = '716',
                            ['required_agi'] = '221',
                        },
                        ['5'] = {
                            ['armor'] = '68',
                            ['required_str'] = '734',
                            ['required_agi'] = '227',
                        },
                        ['6'] = {
                            ['armor'] = '71',
                            ['required_str'] = '752',
                            ['required_agi'] = '232',
                        },
                        ['7'] = {
                            ['armor'] = '74',
                            ['required_str'] = '770',
                            ['required_agi'] = '237',
                        },
                        ['8'] = {
                            ['armor'] = '77',
                            ['required_str'] = '788',
                            ['required_agi'] = '242',
                        },
                        ['9'] = {
                            ['armor'] = '80',
                            ['required_str'] = '806',
                            ['required_agi'] = '247',
                        },
                        ['10'] = {
                            ['armor'] = '84',
                            ['required_str'] = '824',
                            ['required_agi'] = '253',
                        },
                        ['11'] = {
                            ['armor'] = '89',
                            ['required_str'] = '842',
                            ['required_agi'] = '258',
                        },
                        ['12'] = {
                            ['armor'] = '95',
                            ['required_str'] = '860',
                            ['required_agi'] = '263',
                        },
                        ['13'] = {
                            ['armor'] = '102',
                            ['required_str'] = '878',
                            ['required_agi'] = '268',
                        },
                        ['14'] = {
                            ['armor'] = '110',
                            ['required_str'] = '896',
                            ['required_agi'] = '274',
                        },
                        ['15'] = {
                            ['armor'] = '119',
                            ['required_str'] = '914',
                            ['required_agi'] = '279',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Great Dragon Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '75',
                            ['required_str'] = '776',
                            ['required_agi'] = '239',
                        },
                        ['1'] = {
                            ['armor'] = '78',
                            ['required_str'] = '794',
                            ['required_agi'] = '244',
                        },
                        ['2'] = {
                            ['armor'] = '81',
                            ['required_str'] = '812',
                            ['required_agi'] = '249',
                        },
                        ['3'] = {
                            ['armor'] = '84',
                            ['required_str'] = '830',
                            ['required_agi'] = '254',
                        },
                        ['4'] = {
                            ['armor'] = '87',
                            ['required_str'] = '848',
                            ['required_agi'] = '260',
                        },
                        ['5'] = {
                            ['armor'] = '90',
                            ['required_str'] = '866',
                            ['required_agi'] = '265',
                        },
                        ['6'] = {
                            ['armor'] = '93',
                            ['required_str'] = '884',
                            ['required_agi'] = '270',
                        },
                        ['7'] = {
                            ['armor'] = '96',
                            ['required_str'] = '902',
                            ['required_agi'] = '275',
                        },
                        ['8'] = {
                            ['armor'] = '99',
                            ['required_str'] = '920',
                            ['required_agi'] = '281',
                        },
                        ['9'] = {
                            ['armor'] = '102',
                            ['required_str'] = '938',
                            ['required_agi'] = '286',
                        },
                        ['10'] = {
                            ['armor'] = '106',
                            ['required_str'] = '956',
                            ['required_agi'] = '291',
                        },
                        ['11'] = {
                            ['armor'] = '111',
                            ['required_str'] = '974',
                            ['required_agi'] = '296',
                        },
                        ['12'] = {
                            ['armor'] = '117',
                            ['required_str'] = '992',
                            ['required_agi'] = '301',
                        },
                        ['13'] = {
                            ['armor'] = '124',
                            ['required_str'] = '1010',
                            ['required_agi'] = '307',
                        },
                        ['14'] = {
                            ['armor'] = '132',
                            ['required_str'] = '1028',
                            ['required_agi'] = '312',
                        },
                        ['15'] = {
                            ['armor'] = '141',
                            ['required_str'] = '1046',
                            ['required_agi'] = '317',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Great Dragon Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '50',
                            ['required_str'] = '608',
                            ['required_agi'] = '190',
                        },
                        ['1'] = {
                            ['armor'] = '53',
                            ['required_str'] = '626',
                            ['required_agi'] = '195',
                        },
                        ['2'] = {
                            ['armor'] = '56',
                            ['required_str'] = '644',
                            ['required_agi'] = '200',
                        },
                        ['3'] = {
                            ['armor'] = '59',
                            ['required_str'] = '662',
                            ['required_agi'] = '206',
                        },
                        ['4'] = {
                            ['armor'] = '62',
                            ['required_str'] = '680',
                            ['required_agi'] = '211',
                        },
                        ['5'] = {
                            ['armor'] = '65',
                            ['required_str'] = '698',
                            ['required_agi'] = '216',
                        },
                        ['6'] = {
                            ['armor'] = '68',
                            ['required_str'] = '716',
                            ['required_agi'] = '221',
                        },
                        ['7'] = {
                            ['armor'] = '71',
                            ['required_str'] = '734',
                            ['required_agi'] = '227',
                        },
                        ['8'] = {
                            ['armor'] = '74',
                            ['required_str'] = '752',
                            ['required_agi'] = '232',
                        },
                        ['9'] = {
                            ['armor'] = '77',
                            ['required_str'] = '770',
                            ['required_agi'] = '237',
                        },
                        ['10'] = {
                            ['armor'] = '81',
                            ['required_str'] = '788',
                            ['required_agi'] = '242',
                        },
                        ['11'] = {
                            ['armor'] = '86',
                            ['required_str'] = '806',
                            ['required_agi'] = '247',
                        },
                        ['12'] = {
                            ['armor'] = '92',
                            ['required_str'] = '824',
                            ['required_agi'] = '253',
                        },
                        ['13'] = {
                            ['armor'] = '99',
                            ['required_str'] = '842',
                            ['required_agi'] = '258',
                        },
                        ['14'] = {
                            ['armor'] = '107',
                            ['required_str'] = '860',
                            ['required_agi'] = '263',
                        },
                        ['15'] = {
                            ['armor'] = '116',
                            ['required_str'] = '878',
                            ['required_agi'] = '268',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Great Dragon Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '65',
                            ['required_str'] = '698',
                            ['required_agi'] = '216',
                        },
                        ['1'] = {
                            ['armor'] = '68',
                            ['required_str'] = '716',
                            ['required_agi'] = '221',
                        },
                        ['2'] = {
                            ['armor'] = '71',
                            ['required_str'] = '734',
                            ['required_agi'] = '227',
                        },
                        ['3'] = {
                            ['armor'] = '74',
                            ['required_str'] = '752',
                            ['required_agi'] = '232',
                        },
                        ['4'] = {
                            ['armor'] = '77',
                            ['required_str'] = '770',
                            ['required_agi'] = '237',
                        },
                        ['5'] = {
                            ['armor'] = '80',
                            ['required_str'] = '788',
                            ['required_agi'] = '242',
                        },
                        ['6'] = {
                            ['armor'] = '83',
                            ['required_str'] = '806',
                            ['required_agi'] = '247',
                        },
                        ['7'] = {
                            ['armor'] = '86',
                            ['required_str'] = '824',
                            ['required_agi'] = '253',
                        },
                        ['8'] = {
                            ['armor'] = '89',
                            ['required_str'] = '842',
                            ['required_agi'] = '258',
                        },
                        ['9'] = {
                            ['armor'] = '92',
                            ['required_str'] = '860',
                            ['required_agi'] = '263',
                        },
                        ['10'] = {
                            ['armor'] = '96',
                            ['required_str'] = '878',
                            ['required_agi'] = '268',
                        },
                        ['11'] = {
                            ['armor'] = '101',
                            ['required_str'] = '896',
                            ['required_agi'] = '274',
                        },
                        ['12'] = {
                            ['armor'] = '107',
                            ['required_str'] = '914',
                            ['required_agi'] = '279',
                        },
                        ['13'] = {
                            ['armor'] = '114',
                            ['required_str'] = '932',
                            ['required_agi'] = '284',
                        },
                        ['14'] = {
                            ['armor'] = '122',
                            ['required_str'] = '950',
                            ['required_agi'] = '289',
                        },
                        ['15'] = {
                            ['armor'] = '131',
                            ['required_str'] = '968',
                            ['required_agi'] = '294',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Great Dragon Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '48',
                            ['required_str'] = '584',
                            ['required_agi'] = '183',
                        },
                        ['1'] = {
                            ['armor'] = '51',
                            ['required_str'] = '602',
                            ['required_agi'] = '188',
                        },
                        ['2'] = {
                            ['armor'] = '54',
                            ['required_str'] = '620',
                            ['required_agi'] = '194',
                        },
                        ['3'] = {
                            ['armor'] = '57',
                            ['required_str'] = '638',
                            ['required_agi'] = '199',
                        },
                        ['4'] = {
                            ['armor'] = '60',
                            ['required_str'] = '656',
                            ['required_agi'] = '204',
                        },
                        ['5'] = {
                            ['armor'] = '63',
                            ['required_str'] = '674',
                            ['required_agi'] = '209',
                        },
                        ['6'] = {
                            ['armor'] = '66',
                            ['required_str'] = '692',
                            ['required_agi'] = '214',
                        },
                        ['7'] = {
                            ['armor'] = '69',
                            ['required_str'] = '710',
                            ['required_agi'] = '220',
                        },
                        ['8'] = {
                            ['armor'] = '72',
                            ['required_str'] = '728',
                            ['required_agi'] = '225',
                        },
                        ['9'] = {
                            ['armor'] = '75',
                            ['required_str'] = '746',
                            ['required_agi'] = '230',
                        },
                        ['10'] = {
                            ['armor'] = '79',
                            ['required_str'] = '764',
                            ['required_agi'] = '235',
                        },
                        ['11'] = {
                            ['armor'] = '84',
                            ['required_str'] = '782',
                            ['required_agi'] = '240',
                        },
                        ['12'] = {
                            ['armor'] = '90',
                            ['required_str'] = '800',
                            ['required_agi'] = '246',
                        },
                        ['13'] = {
                            ['armor'] = '97',
                            ['required_str'] = '818',
                            ['required_agi'] = '251',
                        },
                        ['14'] = {
                            ['armor'] = '105',
                            ['required_str'] = '836',
                            ['required_agi'] = '256',
                        },
                        ['15'] = {
                            ['armor'] = '114',
                            ['required_str'] = '854',
                            ['required_agi'] = '261',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Great Dragon Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '78',
                            ['required_str'] = '794',
                            ['required_agi'] = '244',
                        },
                        ['1'] = {
                            ['armor'] = '81',
                            ['required_str'] = '812',
                            ['required_agi'] = '249',
                        },
                        ['2'] = {
                            ['armor'] = '84',
                            ['required_str'] = '830',
                            ['required_agi'] = '254',
                        },
                        ['3'] = {
                            ['armor'] = '87',
                            ['required_str'] = '848',
                            ['required_agi'] = '260',
                        },
                        ['4'] = {
                            ['armor'] = '90',
                            ['required_str'] = '866',
                            ['required_agi'] = '265',
                        },
                        ['5'] = {
                            ['armor'] = '93',
                            ['required_str'] = '884',
                            ['required_agi'] = '270',
                        },
                        ['6'] = {
                            ['armor'] = '96',
                            ['required_str'] = '902',
                            ['required_agi'] = '275',
                        },
                        ['7'] = {
                            ['armor'] = '99',
                            ['required_str'] = '920',
                            ['required_agi'] = '281',
                        },
                        ['8'] = {
                            ['armor'] = '102',
                            ['required_str'] = '938',
                            ['required_agi'] = '286',
                        },
                        ['9'] = {
                            ['armor'] = '106',
                            ['required_str'] = '956',
                            ['required_agi'] = '291',
                        },
                        ['10'] = {
                            ['armor'] = '111',
                            ['required_str'] = '974',
                            ['required_agi'] = '296',
                        },
                        ['11'] = {
                            ['armor'] = '117',
                            ['required_str'] = '992',
                            ['required_agi'] = '301',
                        },
                        ['12'] = {
                            ['armor'] = '124',
                            ['required_str'] = '1010',
                            ['required_agi'] = '307',
                        },
                        ['13'] = {
                            ['armor'] = '132',
                            ['required_str'] = '1028',
                            ['required_agi'] = '312',
                        },
                        ['14'] = {
                            ['armor'] = '141',
                            ['required_str'] = '1046',
                            ['required_agi'] = '317',
                        },
                        ['15'] = {
                            ['armor'] = '153',
                            ['required_str'] = '1064',
                            ['required_agi'] = '323',
                        },
                    },
                },
            },
            ['class'] = {
                'warrior',
            },
        },
        ['Dragon Knight'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Dragon Knight Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '66',
                            ['required_str'] = '683',
                            ['required_agi'] = '254',
                        },
                        ['1'] = {
                            ['armor'] = '69',
                            ['required_str'] = '698',
                            ['required_agi'] = '259',
                        },
                        ['2'] = {
                            ['armor'] = '72',
                            ['required_str'] = '713',
                            ['required_agi'] = '264',
                        },
                        ['3'] = {
                            ['armor'] = '75',
                            ['required_str'] = '728',
                            ['required_agi'] = '270',
                        },
                        ['4'] = {
                            ['armor'] = '78',
                            ['required_str'] = '744',
                            ['required_agi'] = '275',
                        },
                        ['5'] = {
                            ['armor'] = '81',
                            ['required_str'] = '759',
                            ['required_agi'] = '281',
                        },
                        ['6'] = {
                            ['armor'] = '84',
                            ['required_str'] = '774',
                            ['required_agi'] = '286',
                        },
                        ['7'] = {
                            ['armor'] = '87',
                            ['required_str'] = '790',
                            ['required_agi'] = '291',
                        },
                        ['8'] = {
                            ['armor'] = '90',
                            ['required_str'] = '805',
                            ['required_agi'] = '297',
                        },
                        ['9'] = {
                            ['armor'] = '93',
                            ['required_str'] = '820',
                            ['required_agi'] = '302',
                        },
                        ['10'] = {
                            ['armor'] = '97',
                            ['required_str'] = '836',
                            ['required_agi'] = '308',
                        },
                        ['11'] = {
                            ['armor'] = '102',
                            ['required_str'] = '851',
                            ['required_agi'] = '313',
                        },
                        ['12'] = {
                            ['armor'] = '108',
                            ['required_str'] = '866',
                            ['required_agi'] = '318',
                        },
                        ['13'] = {
                            ['armor'] = '115',
                            ['required_str'] = '881',
                            ['required_agi'] = '324',
                        },
                        ['14'] = {
                            ['armor'] = '123',
                            ['required_str'] = '897',
                            ['required_agi'] = '329',
                        },
                        ['15'] = {
                            ['armor'] = '132',
                            ['required_str'] = '912',
                            ['required_agi'] = '335',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Dragon Knight Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '88',
                            ['required_str'] = '734',
                            ['required_agi'] = '272',
                        },
                        ['1'] = {
                            ['armor'] = '91',
                            ['required_str'] = '749',
                            ['required_agi'] = '277',
                        },
                        ['2'] = {
                            ['armor'] = '94',
                            ['required_str'] = '764',
                            ['required_agi'] = '282',
                        },
                        ['3'] = {
                            ['armor'] = '97',
                            ['required_str'] = '779',
                            ['required_agi'] = '288',
                        },
                        ['4'] = {
                            ['armor'] = '100',
                            ['required_str'] = '795',
                            ['required_agi'] = '293',
                        },
                        ['5'] = {
                            ['armor'] = '103',
                            ['required_str'] = '810',
                            ['required_agi'] = '299',
                        },
                        ['6'] = {
                            ['armor'] = '106',
                            ['required_str'] = '825',
                            ['required_agi'] = '304',
                        },
                        ['7'] = {
                            ['armor'] = '109',
                            ['required_str'] = '841',
                            ['required_agi'] = '309',
                        },
                        ['8'] = {
                            ['armor'] = '112',
                            ['required_str'] = '856',
                            ['required_agi'] = '315',
                        },
                        ['9'] = {
                            ['armor'] = '115',
                            ['required_str'] = '871',
                            ['required_agi'] = '320',
                        },
                        ['10'] = {
                            ['armor'] = '119',
                            ['required_str'] = '887',
                            ['required_agi'] = '326',
                        },
                        ['11'] = {
                            ['armor'] = '124',
                            ['required_str'] = '902',
                            ['required_agi'] = '331',
                        },
                        ['12'] = {
                            ['armor'] = '130',
                            ['required_str'] = '917',
                            ['required_agi'] = '336',
                        },
                        ['13'] = {
                            ['armor'] = '137',
                            ['required_str'] = '932',
                            ['required_agi'] = '342',
                        },
                        ['14'] = {
                            ['armor'] = '145',
                            ['required_str'] = '948',
                            ['required_agi'] = '347',
                        },
                        ['15'] = {
                            ['armor'] = '154',
                            ['required_str'] = '963',
                            ['required_agi'] = '353',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Dragon Knight Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '63',
                            ['required_str'] = '626',
                            ['required_agi'] = '234',
                        },
                        ['1'] = {
                            ['armor'] = '66',
                            ['required_str'] = '642',
                            ['required_agi'] = '239',
                        },
                        ['2'] = {
                            ['armor'] = '69',
                            ['required_str'] = '657',
                            ['required_agi'] = '245',
                        },
                        ['3'] = {
                            ['armor'] = '72',
                            ['required_str'] = '672',
                            ['required_agi'] = '250',
                        },
                        ['4'] = {
                            ['armor'] = '75',
                            ['required_str'] = '688',
                            ['required_agi'] = '255',
                        },
                        ['5'] = {
                            ['armor'] = '78',
                            ['required_str'] = '703',
                            ['required_agi'] = '261',
                        },
                        ['6'] = {
                            ['armor'] = '81',
                            ['required_str'] = '718',
                            ['required_agi'] = '266',
                        },
                        ['7'] = {
                            ['armor'] = '84',
                            ['required_str'] = '734',
                            ['required_agi'] = '272',
                        },
                        ['8'] = {
                            ['armor'] = '87',
                            ['required_str'] = '749',
                            ['required_agi'] = '277',
                        },
                        ['9'] = {
                            ['armor'] = '90',
                            ['required_str'] = '764',
                            ['required_agi'] = '282',
                        },
                        ['10'] = {
                            ['armor'] = '94',
                            ['required_str'] = '779',
                            ['required_agi'] = '288',
                        },
                        ['11'] = {
                            ['armor'] = '99',
                            ['required_str'] = '795',
                            ['required_agi'] = '293',
                        },
                        ['12'] = {
                            ['armor'] = '105',
                            ['required_str'] = '810',
                            ['required_agi'] = '299',
                        },
                        ['13'] = {
                            ['armor'] = '112',
                            ['required_str'] = '825',
                            ['required_agi'] = '304',
                        },
                        ['14'] = {
                            ['armor'] = '120',
                            ['required_str'] = '841',
                            ['required_agi'] = '309',
                        },
                        ['15'] = {
                            ['armor'] = '129',
                            ['required_str'] = '856',
                            ['required_agi'] = '315',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Dragon Knight Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '78',
                            ['required_str'] = '703',
                            ['required_agi'] = '261',
                        },
                        ['1'] = {
                            ['armor'] = '81',
                            ['required_str'] = '718',
                            ['required_agi'] = '266',
                        },
                        ['2'] = {
                            ['armor'] = '84',
                            ['required_str'] = '734',
                            ['required_agi'] = '272',
                        },
                        ['3'] = {
                            ['armor'] = '87',
                            ['required_str'] = '749',
                            ['required_agi'] = '277',
                        },
                        ['4'] = {
                            ['armor'] = '90',
                            ['required_str'] = '764',
                            ['required_agi'] = '282',
                        },
                        ['5'] = {
                            ['armor'] = '93',
                            ['required_str'] = '779',
                            ['required_agi'] = '288',
                        },
                        ['6'] = {
                            ['armor'] = '96',
                            ['required_str'] = '795',
                            ['required_agi'] = '293',
                        },
                        ['7'] = {
                            ['armor'] = '99',
                            ['required_str'] = '810',
                            ['required_agi'] = '299',
                        },
                        ['8'] = {
                            ['armor'] = '102',
                            ['required_str'] = '825',
                            ['required_agi'] = '304',
                        },
                        ['9'] = {
                            ['armor'] = '105',
                            ['required_str'] = '841',
                            ['required_agi'] = '309',
                        },
                        ['10'] = {
                            ['armor'] = '109',
                            ['required_str'] = '856',
                            ['required_agi'] = '315',
                        },
                        ['11'] = {
                            ['armor'] = '114',
                            ['required_str'] = '871',
                            ['required_agi'] = '320',
                        },
                        ['12'] = {
                            ['armor'] = '120',
                            ['required_str'] = '887',
                            ['required_agi'] = '326',
                        },
                        ['13'] = {
                            ['armor'] = '127',
                            ['required_str'] = '902',
                            ['required_agi'] = '331',
                        },
                        ['14'] = {
                            ['armor'] = '135',
                            ['required_str'] = '917',
                            ['required_agi'] = '336',
                        },
                        ['15'] = {
                            ['armor'] = '144',
                            ['required_str'] = '932',
                            ['required_agi'] = '342',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Dragon Knight Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '60',
                            ['required_str'] = '601',
                            ['required_agi'] = '225',
                        },
                        ['1'] = {
                            ['armor'] = '63',
                            ['required_str'] = '616',
                            ['required_agi'] = '230',
                        },
                        ['2'] = {
                            ['armor'] = '66',
                            ['required_str'] = '632',
                            ['required_agi'] = '236',
                        },
                        ['3'] = {
                            ['armor'] = '69',
                            ['required_str'] = '647',
                            ['required_agi'] = '241',
                        },
                        ['4'] = {
                            ['armor'] = '72',
                            ['required_str'] = '662',
                            ['required_agi'] = '246',
                        },
                        ['5'] = {
                            ['armor'] = '75',
                            ['required_str'] = '677',
                            ['required_agi'] = '252',
                        },
                        ['6'] = {
                            ['armor'] = '78',
                            ['required_str'] = '693',
                            ['required_agi'] = '257',
                        },
                        ['7'] = {
                            ['armor'] = '81',
                            ['required_str'] = '708',
                            ['required_agi'] = '263',
                        },
                        ['8'] = {
                            ['armor'] = '84',
                            ['required_str'] = '723',
                            ['required_agi'] = '268',
                        },
                        ['9'] = {
                            ['armor'] = '87',
                            ['required_str'] = '739',
                            ['required_agi'] = '273',
                        },
                        ['10'] = {
                            ['armor'] = '91',
                            ['required_str'] = '754',
                            ['required_agi'] = '279',
                        },
                        ['11'] = {
                            ['armor'] = '96',
                            ['required_str'] = '769',
                            ['required_agi'] = '284',
                        },
                        ['12'] = {
                            ['armor'] = '102',
                            ['required_str'] = '785',
                            ['required_agi'] = '290',
                        },
                        ['13'] = {
                            ['armor'] = '109',
                            ['required_str'] = '800',
                            ['required_agi'] = '295',
                        },
                        ['14'] = {
                            ['armor'] = '117',
                            ['required_str'] = '815',
                            ['required_agi'] = '300',
                        },
                        ['15'] = {
                            ['armor'] = '126',
                            ['required_str'] = '830',
                            ['required_agi'] = '306',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Dragon Knight Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '91',
                            ['required_str'] = '749',
                            ['required_agi'] = '277',
                        },
                        ['1'] = {
                            ['armor'] = '94',
                            ['required_str'] = '764',
                            ['required_agi'] = '282',
                        },
                        ['2'] = {
                            ['armor'] = '97',
                            ['required_str'] = '779',
                            ['required_agi'] = '288',
                        },
                        ['3'] = {
                            ['armor'] = '100',
                            ['required_str'] = '795',
                            ['required_agi'] = '293',
                        },
                        ['4'] = {
                            ['armor'] = '103',
                            ['required_str'] = '810',
                            ['required_agi'] = '299',
                        },
                        ['5'] = {
                            ['armor'] = '106',
                            ['required_str'] = '825',
                            ['required_agi'] = '304',
                        },
                        ['6'] = {
                            ['armor'] = '109',
                            ['required_str'] = '841',
                            ['required_agi'] = '309',
                        },
                        ['7'] = {
                            ['armor'] = '112',
                            ['required_str'] = '856',
                            ['required_agi'] = '315',
                        },
                        ['8'] = {
                            ['armor'] = '115',
                            ['required_str'] = '871',
                            ['required_agi'] = '320',
                        },
                        ['9'] = {
                            ['armor'] = '119',
                            ['required_str'] = '887',
                            ['required_agi'] = '326',
                        },
                        ['10'] = {
                            ['armor'] = '124',
                            ['required_str'] = '902',
                            ['required_agi'] = '331',
                        },
                        ['11'] = {
                            ['armor'] = '130',
                            ['required_str'] = '917',
                            ['required_agi'] = '336',
                        },
                        ['12'] = {
                            ['armor'] = '137',
                            ['required_str'] = '932',
                            ['required_agi'] = '342',
                        },
                        ['13'] = {
                            ['armor'] = '145',
                            ['required_str'] = '948',
                            ['required_agi'] = '347',
                        },
                        ['14'] = {
                            ['armor'] = '154',
                            ['required_str'] = '963',
                            ['required_agi'] = '353',
                        },
                        ['15'] = {
                            ['armor'] = '163',
                            ['required_str'] = '978',
                            ['required_agi'] = '359',
                        },
                    },
                },
            },
            ['class'] = {
                'warrior',
            },
        },
        ['Ashcrow'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Ashcrow Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '27',
                            ['required_str'] = '341',
                            ['required_agi'] = '120',
                        },
                        ['1'] = {
                            ['armor'] = '30',
                            ['required_str'] = '356',
                            ['required_agi'] = '125',
                        },
                        ['2'] = {
                            ['armor'] = '33',
                            ['required_str'] = '370',
                            ['required_agi'] = '129',
                        },
                        ['3'] = {
                            ['armor'] = '36',
                            ['required_str'] = '384',
                            ['required_agi'] = '134',
                        },
                        ['4'] = {
                            ['armor'] = '39',
                            ['required_str'] = '399',
                            ['required_agi'] = '138',
                        },
                        ['5'] = {
                            ['armor'] = '42',
                            ['required_str'] = '413',
                            ['required_agi'] = '143',
                        },
                        ['6'] = {
                            ['armor'] = '45',
                            ['required_str'] = '428',
                            ['required_agi'] = '147',
                        },
                        ['7'] = {
                            ['armor'] = '48',
                            ['required_str'] = '442',
                            ['required_agi'] = '152',
                        },
                        ['8'] = {
                            ['armor'] = '51',
                            ['required_str'] = '456',
                            ['required_agi'] = '156',
                        },
                        ['9'] = {
                            ['armor'] = '54',
                            ['required_str'] = '471',
                            ['required_agi'] = '161',
                        },
                        ['10'] = {
                            ['armor'] = '58',
                            ['required_str'] = '485',
                            ['required_agi'] = '165',
                        },
                        ['11'] = {
                            ['armor'] = '63',
                            ['required_str'] = '500',
                            ['required_agi'] = '170',
                        },
                        ['12'] = {
                            ['armor'] = '69',
                            ['required_str'] = '514',
                            ['required_agi'] = '174',
                        },
                        ['13'] = {
                            ['armor'] = '76',
                            ['required_str'] = '528',
                            ['required_agi'] = '179',
                        },
                        ['14'] = {
                            ['armor'] = '84',
                            ['required_str'] = '543',
                            ['required_agi'] = '183',
                        },
                        ['15'] = {
                            ['armor'] = '93',
                            ['required_str'] = '557',
                            ['required_agi'] = '188',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Ashcrow Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '42',
                            ['required_str'] = '380',
                            ['required_agi'] = '132',
                        },
                        ['1'] = {
                            ['armor'] = '45',
                            ['required_str'] = '394',
                            ['required_agi'] = '137',
                        },
                        ['2'] = {
                            ['armor'] = '48',
                            ['required_str'] = '408',
                            ['required_agi'] = '141',
                        },
                        ['3'] = {
                            ['armor'] = '51',
                            ['required_str'] = '423',
                            ['required_agi'] = '146',
                        },
                        ['4'] = {
                            ['armor'] = '54',
                            ['required_str'] = '437',
                            ['required_agi'] = '150',
                        },
                        ['5'] = {
                            ['armor'] = '57',
                            ['required_str'] = '452',
                            ['required_agi'] = '155',
                        },
                        ['6'] = {
                            ['armor'] = '60',
                            ['required_str'] = '466',
                            ['required_agi'] = '159',
                        },
                        ['7'] = {
                            ['armor'] = '63',
                            ['required_str'] = '480',
                            ['required_agi'] = '164',
                        },
                        ['8'] = {
                            ['armor'] = '66',
                            ['required_str'] = '495',
                            ['required_agi'] = '168',
                        },
                        ['9'] = {
                            ['armor'] = '69',
                            ['required_str'] = '509',
                            ['required_agi'] = '173',
                        },
                        ['10'] = {
                            ['armor'] = '73',
                            ['required_str'] = '524',
                            ['required_agi'] = '177',
                        },
                        ['11'] = {
                            ['armor'] = '78',
                            ['required_str'] = '538',
                            ['required_agi'] = '182',
                        },
                        ['12'] = {
                            ['armor'] = '84',
                            ['required_str'] = '552',
                            ['required_agi'] = '186',
                        },
                        ['13'] = {
                            ['armor'] = '91',
                            ['required_str'] = '567',
                            ['required_agi'] = '191',
                        },
                        ['14'] = {
                            ['armor'] = '99',
                            ['required_str'] = '581',
                            ['required_agi'] = '195',
                        },
                        ['15'] = {
                            ['armor'] = '108',
                            ['required_str'] = '596',
                            ['required_agi'] = '200',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Ashcrow Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '19',
                            ['required_str'] = '346',
                            ['required_agi'] = '122',
                        },
                        ['1'] = {
                            ['armor'] = '22',
                            ['required_str'] = '360',
                            ['required_agi'] = '126',
                        },
                        ['2'] = {
                            ['armor'] = '25',
                            ['required_str'] = '375',
                            ['required_agi'] = '131',
                        },
                        ['3'] = {
                            ['armor'] = '28',
                            ['required_str'] = '389',
                            ['required_agi'] = '135',
                        },
                        ['4'] = {
                            ['armor'] = '31',
                            ['required_str'] = '404',
                            ['required_agi'] = '140',
                        },
                        ['5'] = {
                            ['armor'] = '34',
                            ['required_str'] = '418',
                            ['required_agi'] = '144',
                        },
                        ['6'] = {
                            ['armor'] = '37',
                            ['required_str'] = '432',
                            ['required_agi'] = '149',
                        },
                        ['7'] = {
                            ['armor'] = '40',
                            ['required_str'] = '447',
                            ['required_agi'] = '153',
                        },
                        ['8'] = {
                            ['armor'] = '43',
                            ['required_str'] = '461',
                            ['required_agi'] = '158',
                        },
                        ['9'] = {
                            ['armor'] = '46',
                            ['required_str'] = '476',
                            ['required_agi'] = '162',
                        },
                        ['10'] = {
                            ['armor'] = '50',
                            ['required_str'] = '490',
                            ['required_agi'] = '167',
                        },
                        ['11'] = {
                            ['armor'] = '55',
                            ['required_str'] = '504',
                            ['required_agi'] = '171',
                        },
                        ['12'] = {
                            ['armor'] = '61',
                            ['required_str'] = '519',
                            ['required_agi'] = '176',
                        },
                        ['13'] = {
                            ['armor'] = '68',
                            ['required_str'] = '533',
                            ['required_agi'] = '180',
                        },
                        ['14'] = {
                            ['armor'] = '76',
                            ['required_str'] = '548',
                            ['required_agi'] = '185',
                        },
                        ['15'] = {
                            ['armor'] = '85',
                            ['required_str'] = '562',
                            ['required_agi'] = '189',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Ashcrow Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '33',
                            ['required_str'] = '351',
                            ['required_agi'] = '123',
                        },
                        ['1'] = {
                            ['armor'] = '36',
                            ['required_str'] = '365',
                            ['required_agi'] = '128',
                        },
                        ['2'] = {
                            ['armor'] = '39',
                            ['required_str'] = '380',
                            ['required_agi'] = '132',
                        },
                        ['3'] = {
                            ['armor'] = '42',
                            ['required_str'] = '394',
                            ['required_agi'] = '137',
                        },
                        ['4'] = {
                            ['armor'] = '45',
                            ['required_str'] = '408',
                            ['required_agi'] = '141',
                        },
                        ['5'] = {
                            ['armor'] = '48',
                            ['required_str'] = '423',
                            ['required_agi'] = '146',
                        },
                        ['6'] = {
                            ['armor'] = '51',
                            ['required_str'] = '437',
                            ['required_agi'] = '150',
                        },
                        ['7'] = {
                            ['armor'] = '54',
                            ['required_str'] = '452',
                            ['required_agi'] = '155',
                        },
                        ['8'] = {
                            ['armor'] = '57',
                            ['required_str'] = '466',
                            ['required_agi'] = '159',
                        },
                        ['9'] = {
                            ['armor'] = '60',
                            ['required_str'] = '480',
                            ['required_agi'] = '164',
                        },
                        ['10'] = {
                            ['armor'] = '64',
                            ['required_str'] = '495',
                            ['required_agi'] = '168',
                        },
                        ['11'] = {
                            ['armor'] = '69',
                            ['required_str'] = '509',
                            ['required_agi'] = '173',
                        },
                        ['12'] = {
                            ['armor'] = '75',
                            ['required_str'] = '524',
                            ['required_agi'] = '177',
                        },
                        ['13'] = {
                            ['armor'] = '82',
                            ['required_str'] = '538',
                            ['required_agi'] = '182',
                        },
                        ['14'] = {
                            ['armor'] = '90',
                            ['required_str'] = '552',
                            ['required_agi'] = '186',
                        },
                        ['15'] = {
                            ['armor'] = '99',
                            ['required_str'] = '567',
                            ['required_agi'] = '191',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Ashcrow Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '18',
                            ['required_str'] = '312',
                            ['required_agi'] = '111',
                        },
                        ['1'] = {
                            ['armor'] = '21',
                            ['required_str'] = '327',
                            ['required_agi'] = '116',
                        },
                        ['2'] = {
                            ['armor'] = '24',
                            ['required_str'] = '341',
                            ['required_agi'] = '120',
                        },
                        ['3'] = {
                            ['armor'] = '27',
                            ['required_str'] = '356',
                            ['required_agi'] = '125',
                        },
                        ['4'] = {
                            ['armor'] = '30',
                            ['required_str'] = '370',
                            ['required_agi'] = '129',
                        },
                        ['5'] = {
                            ['armor'] = '33',
                            ['required_str'] = '384',
                            ['required_agi'] = '134',
                        },
                        ['6'] = {
                            ['armor'] = '36',
                            ['required_str'] = '399',
                            ['required_agi'] = '138',
                        },
                        ['7'] = {
                            ['armor'] = '39',
                            ['required_str'] = '413',
                            ['required_agi'] = '143',
                        },
                        ['8'] = {
                            ['armor'] = '42',
                            ['required_str'] = '428',
                            ['required_agi'] = '147',
                        },
                        ['9'] = {
                            ['armor'] = '45',
                            ['required_str'] = '442',
                            ['required_agi'] = '152',
                        },
                        ['10'] = {
                            ['armor'] = '49',
                            ['required_str'] = '456',
                            ['required_agi'] = '156',
                        },
                        ['11'] = {
                            ['armor'] = '54',
                            ['required_str'] = '471',
                            ['required_agi'] = '161',
                        },
                        ['12'] = {
                            ['armor'] = '60',
                            ['required_str'] = '485',
                            ['required_agi'] = '165',
                        },
                        ['13'] = {
                            ['armor'] = '67',
                            ['required_str'] = '500',
                            ['required_agi'] = '170',
                        },
                        ['14'] = {
                            ['armor'] = '75',
                            ['required_str'] = '514',
                            ['required_agi'] = '174',
                        },
                        ['15'] = {
                            ['armor'] = '84',
                            ['required_str'] = '528',
                            ['required_agi'] = '179',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Ashcrow Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '45',
                            ['required_str'] = '394',
                            ['required_agi'] = '137',
                        },
                        ['1'] = {
                            ['armor'] = '48',
                            ['required_str'] = '408',
                            ['required_agi'] = '141',
                        },
                        ['2'] = {
                            ['armor'] = '51',
                            ['required_str'] = '423',
                            ['required_agi'] = '146',
                        },
                        ['3'] = {
                            ['armor'] = '54',
                            ['required_str'] = '437',
                            ['required_agi'] = '150',
                        },
                        ['4'] = {
                            ['armor'] = '57',
                            ['required_str'] = '452',
                            ['required_agi'] = '155',
                        },
                        ['5'] = {
                            ['armor'] = '60',
                            ['required_str'] = '466',
                            ['required_agi'] = '159',
                        },
                        ['6'] = {
                            ['armor'] = '63',
                            ['required_str'] = '480',
                            ['required_agi'] = '164',
                        },
                        ['7'] = {
                            ['armor'] = '66',
                            ['required_str'] = '495',
                            ['required_agi'] = '168',
                        },
                        ['8'] = {
                            ['armor'] = '69',
                            ['required_str'] = '509',
                            ['required_agi'] = '173',
                        },
                        ['9'] = {
                            ['armor'] = '73',
                            ['required_str'] = '524',
                            ['required_agi'] = '177',
                        },
                        ['10'] = {
                            ['armor'] = '78',
                            ['required_str'] = '538',
                            ['required_agi'] = '182',
                        },
                        ['11'] = {
                            ['armor'] = '84',
                            ['required_str'] = '552',
                            ['required_agi'] = '186',
                        },
                        ['12'] = {
                            ['armor'] = '91',
                            ['required_str'] = '567',
                            ['required_agi'] = '191',
                        },
                        ['13'] = {
                            ['armor'] = '99',
                            ['required_str'] = '581',
                            ['required_agi'] = '195',
                        },
                        ['14'] = {
                            ['armor'] = '108',
                            ['required_str'] = '596',
                            ['required_agi'] = '200',
                        },
                        ['15'] = {
                            ['armor'] = '117',
                            ['required_str'] = '614',
                            ['required_agi'] = '205',
                        },
                    },
                },
            },
            ['class'] = {
                'warrior',
            },
        },
        ['Pad'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Pad Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '4',
                            ['required_str'] = '23',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '7',
                            ['required_str'] = '24',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '10',
                            ['required_str'] = '26',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '13',
                            ['required_str'] = '28',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '16',
                            ['required_str'] = '30',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '19',
                            ['required_str'] = '32',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '22',
                            ['required_str'] = '33',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '25',
                            ['required_str'] = '35',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '28',
                            ['required_str'] = '37',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '31',
                            ['required_str'] = '39',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '35',
                            ['required_str'] = '41',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '40',
                            ['required_str'] = '42',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '46',
                            ['required_str'] = '44',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '53',
                            ['required_str'] = '46',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '61',
                            ['required_str'] = '48',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '70',
                            ['required_str'] = '50',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Pad Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '7',
                            ['required_str'] = '29',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '10',
                            ['required_str'] = '31',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '13',
                            ['required_str'] = '34',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '16',
                            ['required_str'] = '37',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '19',
                            ['required_str'] = '39',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '22',
                            ['required_str'] = '42',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '25',
                            ['required_str'] = '45',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '28',
                            ['required_str'] = '47',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '31',
                            ['required_str'] = '50',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '34',
                            ['required_str'] = '53',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '38',
                            ['required_str'] = '56',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '43',
                            ['required_str'] = '58',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '49',
                            ['required_str'] = '61',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '56',
                            ['required_str'] = '64',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '64',
                            ['required_str'] = '66',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '73',
                            ['required_str'] = '69',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Pad Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '3',
                            ['required_str'] = '22',
                            ['required_agi'] = '10',
                        },
                        ['1'] = {
                            ['armor'] = '6',
                            ['required_str'] = '24',
                            ['required_agi'] = '10',
                        },
                        ['2'] = {
                            ['armor'] = '9',
                            ['required_str'] = '26',
                            ['required_agi'] = '10',
                        },
                        ['3'] = {
                            ['armor'] = '12',
                            ['required_str'] = '27',
                            ['required_agi'] = '10',
                        },
                        ['4'] = {
                            ['armor'] = '15',
                            ['required_str'] = '29',
                            ['required_agi'] = '10',
                        },
                        ['5'] = {
                            ['armor'] = '18',
                            ['required_str'] = '31',
                            ['required_agi'] = '10',
                        },
                        ['6'] = {
                            ['armor'] = '21',
                            ['required_str'] = '33',
                            ['required_agi'] = '10',
                        },
                        ['7'] = {
                            ['armor'] = '24',
                            ['required_str'] = '35',
                            ['required_agi'] = '10',
                        },
                        ['8'] = {
                            ['armor'] = '27',
                            ['required_str'] = '36',
                            ['required_agi'] = '10',
                        },
                        ['9'] = {
                            ['armor'] = '30',
                            ['required_str'] = '38',
                            ['required_agi'] = '10',
                        },
                        ['10'] = {
                            ['armor'] = '34',
                            ['required_str'] = '40',
                            ['required_agi'] = '10',
                        },
                        ['11'] = {
                            ['armor'] = '39',
                            ['required_str'] = '42',
                            ['required_agi'] = '10',
                        },
                        ['12'] = {
                            ['armor'] = '45',
                            ['required_str'] = '44',
                            ['required_agi'] = '10',
                        },
                        ['13'] = {
                            ['armor'] = '52',
                            ['required_str'] = '45',
                            ['required_agi'] = '10',
                        },
                        ['14'] = {
                            ['armor'] = '60',
                            ['required_str'] = '47',
                            ['required_agi'] = '10',
                        },
                        ['15'] = {
                            ['armor'] = '69',
                            ['required_str'] = '49',
                            ['required_agi'] = '10',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Pad Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '5',
                            ['required_str'] = '27',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '8',
                            ['required_str'] = '29',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '11',
                            ['required_str'] = '32',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '14',
                            ['required_str'] = '35',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '17',
                            ['required_str'] = '38',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '20',
                            ['required_str'] = '40',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '23',
                            ['required_str'] = '43',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '26',
                            ['required_str'] = '46',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '29',
                            ['required_str'] = '48',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '32',
                            ['required_str'] = '51',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '36',
                            ['required_str'] = '54',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '41',
                            ['required_str'] = '56',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '47',
                            ['required_str'] = '59',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '54',
                            ['required_str'] = '62',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '62',
                            ['required_str'] = '65',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '71',
                            ['required_str'] = '67',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Pad Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '2',
                            ['required_str'] = '21',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '5',
                            ['required_str'] = '23',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '8',
                            ['required_str'] = '25',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '11',
                            ['required_str'] = '27',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '14',
                            ['required_str'] = '29',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '17',
                            ['required_str'] = '30',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '20',
                            ['required_str'] = '32',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '23',
                            ['required_str'] = '34',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '26',
                            ['required_str'] = '36',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '29',
                            ['required_str'] = '38',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '33',
                            ['required_str'] = '39',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '38',
                            ['required_str'] = '41',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '44',
                            ['required_str'] = '43',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '51',
                            ['required_str'] = '45',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '59',
                            ['required_str'] = '47',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '68',
                            ['required_str'] = '48',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Pad Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '10',
                            ['required_str'] = '31',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '13',
                            ['required_str'] = '34',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '16',
                            ['required_str'] = '37',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '19',
                            ['required_str'] = '39',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '22',
                            ['required_str'] = '42',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '25',
                            ['required_str'] = '45',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '28',
                            ['required_str'] = '47',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '31',
                            ['required_str'] = '50',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '34',
                            ['required_str'] = '53',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '38',
                            ['required_str'] = '56',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '43',
                            ['required_str'] = '58',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '49',
                            ['required_str'] = '61',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '56',
                            ['required_str'] = '64',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '64',
                            ['required_str'] = '66',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '73',
                            ['required_str'] = '69',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '80',
                            ['required_str'] = '72',
                            ['required_agi'] = 0,
                        },
                    },
                },
            },
            ['class'] = {
                'mage',
            },
        },
        ['Legendary'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Legendary Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '18',
                            ['required_str'] = '65',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '21',
                            ['required_str'] = '67',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '24',
                            ['required_str'] = '70',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '27',
                            ['required_str'] = '73',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '30',
                            ['required_str'] = '75',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '33',
                            ['required_str'] = '78',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '36',
                            ['required_str'] = '81',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '39',
                            ['required_str'] = '83',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '42',
                            ['required_str'] = '86',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '45',
                            ['required_str'] = '89',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '49',
                            ['required_str'] = '92',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '54',
                            ['required_str'] = '94',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '60',
                            ['required_str'] = '97',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '67',
                            ['required_str'] = '100',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '75',
                            ['required_str'] = '102',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '84',
                            ['required_str'] = '105',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Legendary Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '22',
                            ['required_str'] = '87',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '25',
                            ['required_str'] = '90',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '28',
                            ['required_str'] = '94',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '31',
                            ['required_str'] = '98',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '34',
                            ['required_str'] = '101',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '37',
                            ['required_str'] = '105',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '40',
                            ['required_str'] = '108',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '43',
                            ['required_str'] = '112',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '46',
                            ['required_str'] = '116',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '49',
                            ['required_str'] = '119',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '53',
                            ['required_str'] = '123',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '58',
                            ['required_str'] = '126',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '64',
                            ['required_str'] = '130',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '71',
                            ['required_str'] = '134',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '79',
                            ['required_str'] = '137',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '88',
                            ['required_str'] = '141',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Legendary Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '12',
                            ['required_str'] = '61',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '15',
                            ['required_str'] = '64',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '18',
                            ['required_str'] = '66',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '21',
                            ['required_str'] = '69',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '24',
                            ['required_str'] = '72',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '27',
                            ['required_str'] = '74',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '30',
                            ['required_str'] = '77',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '33',
                            ['required_str'] = '80',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '36',
                            ['required_str'] = '83',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '39',
                            ['required_str'] = '85',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '43',
                            ['required_str'] = '88',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '48',
                            ['required_str'] = '91',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '54',
                            ['required_str'] = '93',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '61',
                            ['required_str'] = '96',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '69',
                            ['required_str'] = '99',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '78',
                            ['required_str'] = '101',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Legendary Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '20',
                            ['required_str'] = '83',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '23',
                            ['required_str'] = '87',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '26',
                            ['required_str'] = '90',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '29',
                            ['required_str'] = '94',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '32',
                            ['required_str'] = '98',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '35',
                            ['required_str'] = '101',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '38',
                            ['required_str'] = '105',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '41',
                            ['required_str'] = '108',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '44',
                            ['required_str'] = '112',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '47',
                            ['required_str'] = '116',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '51',
                            ['required_str'] = '119',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '56',
                            ['required_str'] = '123',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '62',
                            ['required_str'] = '126',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '69',
                            ['required_str'] = '130',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '77',
                            ['required_str'] = '134',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '86',
                            ['required_str'] = '137',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Legendary Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '11',
                            ['required_str'] = '46',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '14',
                            ['required_str'] = '48',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '17',
                            ['required_str'] = '50',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '20',
                            ['required_str'] = '51',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '23',
                            ['required_str'] = '53',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '26',
                            ['required_str'] = '55',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '29',
                            ['required_str'] = '57',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '32',
                            ['required_str'] = '59',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '35',
                            ['required_str'] = '60',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '38',
                            ['required_str'] = '62',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '42',
                            ['required_str'] = '64',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '47',
                            ['required_str'] = '66',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '53',
                            ['required_str'] = '68',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '60',
                            ['required_str'] = '69',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '68',
                            ['required_str'] = '71',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '77',
                            ['required_str'] = '73',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Legendary Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '48',
                            ['required_str'] = '149',
                            ['required_agi'] = '56',
                        },
                        ['1'] = {
                            ['armor'] = '51',
                            ['required_str'] = '157',
                            ['required_agi'] = '58',
                        },
                        ['2'] = {
                            ['armor'] = '54',
                            ['required_str'] = '165',
                            ['required_agi'] = '60',
                        },
                        ['3'] = {
                            ['armor'] = '57',
                            ['required_str'] = '173',
                            ['required_agi'] = '62',
                        },
                        ['4'] = {
                            ['armor'] = '60',
                            ['required_str'] = '182',
                            ['required_agi'] = '65',
                        },
                        ['5'] = {
                            ['armor'] = '63',
                            ['required_str'] = '190',
                            ['required_agi'] = '67',
                        },
                        ['6'] = {
                            ['armor'] = '66',
                            ['required_str'] = '198',
                            ['required_agi'] = '69',
                        },
                        ['7'] = {
                            ['armor'] = '69',
                            ['required_str'] = '206',
                            ['required_agi'] = '71',
                        },
                        ['8'] = {
                            ['armor'] = '72',
                            ['required_str'] = '214',
                            ['required_agi'] = '74',
                        },
                        ['9'] = {
                            ['armor'] = '75',
                            ['required_str'] = '222',
                            ['required_agi'] = '76',
                        },
                        ['10'] = {
                            ['armor'] = '79',
                            ['required_str'] = '230',
                            ['required_agi'] = '78',
                        },
                        ['11'] = {
                            ['armor'] = '84',
                            ['required_str'] = '238',
                            ['required_agi'] = '80',
                        },
                        ['12'] = {
                            ['armor'] = '90',
                            ['required_str'] = '246',
                            ['required_agi'] = '83',
                        },
                        ['13'] = {
                            ['armor'] = '97',
                            ['required_str'] = '254',
                            ['required_agi'] = '85',
                        },
                        ['14'] = {
                            ['armor'] = '105',
                            ['required_str'] = '263',
                            ['required_agi'] = '87',
                        },
                        ['15'] = {
                            ['armor'] = '114',
                            ['required_str'] = '271',
                            ['required_agi'] = '89',
                        },
                    },
                },
            },
            ['class'] = {
                'mage',
            },
        },
        ['Bone'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Bone Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '9',
                            ['required_str'] = '36',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '12',
                            ['required_str'] = '38',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '15',
                            ['required_str'] = '41',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '18',
                            ['required_str'] = '44',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '21',
                            ['required_str'] = '47',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '24',
                            ['required_str'] = '49',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '27',
                            ['required_str'] = '52',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '30',
                            ['required_str'] = '55',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '33',
                            ['required_str'] = '57',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '36',
                            ['required_str'] = '60',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '40',
                            ['required_str'] = '63',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '45',
                            ['required_str'] = '65',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '51',
                            ['required_str'] = '68',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '58',
                            ['required_str'] = '71',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '66',
                            ['required_str'] = '74',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '75',
                            ['required_str'] = '76',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Bone Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '13',
                            ['required_str'] = '46',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '16',
                            ['required_str'] = '50',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '19',
                            ['required_str'] = '53',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '22',
                            ['required_str'] = '57',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '25',
                            ['required_str'] = '60',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '28',
                            ['required_str'] = '64',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '31',
                            ['required_str'] = '68',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '34',
                            ['required_str'] = '71',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '37',
                            ['required_str'] = '75',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '40',
                            ['required_str'] = '78',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '44',
                            ['required_str'] = '82',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '49',
                            ['required_str'] = '86',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '55',
                            ['required_str'] = '89',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '62',
                            ['required_str'] = '93',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '70',
                            ['required_str'] = '96',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '79',
                            ['required_str'] = '100',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Bone Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '6',
                            ['required_str'] = '34',
                            ['required_agi'] = '6',
                        },
                        ['1'] = {
                            ['armor'] = '9',
                            ['required_str'] = '37',
                            ['required_agi'] = '6',
                        },
                        ['2'] = {
                            ['armor'] = '12',
                            ['required_str'] = '39',
                            ['required_agi'] = '6',
                        },
                        ['3'] = {
                            ['armor'] = '15',
                            ['required_str'] = '42',
                            ['required_agi'] = '6',
                        },
                        ['4'] = {
                            ['armor'] = '18',
                            ['required_str'] = '45',
                            ['required_agi'] = '6',
                        },
                        ['5'] = {
                            ['armor'] = '21',
                            ['required_str'] = '47',
                            ['required_agi'] = '6',
                        },
                        ['6'] = {
                            ['armor'] = '24',
                            ['required_str'] = '50',
                            ['required_agi'] = '6',
                        },
                        ['7'] = {
                            ['armor'] = '27',
                            ['required_str'] = '53',
                            ['required_agi'] = '6',
                        },
                        ['8'] = {
                            ['armor'] = '30',
                            ['required_str'] = '56',
                            ['required_agi'] = '6',
                        },
                        ['9'] = {
                            ['armor'] = '33',
                            ['required_str'] = '58',
                            ['required_agi'] = '6',
                        },
                        ['10'] = {
                            ['armor'] = '37',
                            ['required_str'] = '61',
                            ['required_agi'] = '6',
                        },
                        ['11'] = {
                            ['armor'] = '42',
                            ['required_str'] = '64',
                            ['required_agi'] = '6',
                        },
                        ['12'] = {
                            ['armor'] = '48',
                            ['required_str'] = '66',
                            ['required_agi'] = '6',
                        },
                        ['13'] = {
                            ['armor'] = '55',
                            ['required_str'] = '69',
                            ['required_agi'] = '6',
                        },
                        ['14'] = {
                            ['armor'] = '63',
                            ['required_str'] = '72',
                            ['required_agi'] = '6',
                        },
                        ['15'] = {
                            ['armor'] = '72',
                            ['required_str'] = '74',
                            ['required_agi'] = '6',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Bone Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '10',
                            ['required_str'] = '44',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '13',
                            ['required_str'] = '47',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '16',
                            ['required_str'] = '51',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '19',
                            ['required_str'] = '54',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '22',
                            ['required_str'] = '58',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '25',
                            ['required_str'] = '62',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '28',
                            ['required_str'] = '65',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '31',
                            ['required_str'] = '69',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '34',
                            ['required_str'] = '72',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '37',
                            ['required_str'] = '76',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '41',
                            ['required_str'] = '80',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '46',
                            ['required_str'] = '83',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '52',
                            ['required_str'] = '87',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '59',
                            ['required_str'] = '90',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '67',
                            ['required_str'] = '94',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '76',
                            ['required_str'] = '98',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Bone Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '5',
                            ['required_str'] = '28',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '8',
                            ['required_str'] = '30',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '11',
                            ['required_str'] = '32',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '14',
                            ['required_str'] = '33',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '17',
                            ['required_str'] = '35',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '20',
                            ['required_str'] = '37',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '23',
                            ['required_str'] = '39',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '26',
                            ['required_str'] = '41',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '29',
                            ['required_str'] = '42',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '32',
                            ['required_str'] = '44',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '36',
                            ['required_str'] = '46',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '41',
                            ['required_str'] = '48',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '47',
                            ['required_str'] = '50',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '54',
                            ['required_str'] = '51',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '62',
                            ['required_str'] = '53',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '71',
                            ['required_str'] = '55',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Bone Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '16',
                            ['required_str'] = '50',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '19',
                            ['required_str'] = '53',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '22',
                            ['required_str'] = '57',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '25',
                            ['required_str'] = '60',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '28',
                            ['required_str'] = '64',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '31',
                            ['required_str'] = '68',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '34',
                            ['required_str'] = '71',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '37',
                            ['required_str'] = '75',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '40',
                            ['required_str'] = '78',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '44',
                            ['required_str'] = '82',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '49',
                            ['required_str'] = '86',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '55',
                            ['required_str'] = '89',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '62',
                            ['required_str'] = '93',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '70',
                            ['required_str'] = '96',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '79',
                            ['required_str'] = '100',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '88',
                            ['required_str'] = '105',
                            ['required_agi'] = 0,
                        },
                    },
                },
            },
            ['class'] = {
                'mage',
            },
        },
        ['Sphinx'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Sphinx Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '13',
                            ['required_str'] = '48',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '16',
                            ['required_str'] = '51',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '19',
                            ['required_str'] = '54',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '22',
                            ['required_str'] = '56',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '25',
                            ['required_str'] = '59',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '28',
                            ['required_str'] = '62',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '31',
                            ['required_str'] = '65',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '34',
                            ['required_str'] = '67',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '37',
                            ['required_str'] = '70',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '40',
                            ['required_str'] = '73',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '44',
                            ['required_str'] = '75',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '49',
                            ['required_str'] = '78',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '55',
                            ['required_str'] = '81',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '62',
                            ['required_str'] = '83',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '70',
                            ['required_str'] = '86',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '79',
                            ['required_str'] = '89',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Sphinx Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '17',
                            ['required_str'] = '65',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '20',
                            ['required_str'] = '69',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '23',
                            ['required_str'] = '72',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '26',
                            ['required_str'] = '76',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '29',
                            ['required_str'] = '80',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '32',
                            ['required_str'] = '83',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '35',
                            ['required_str'] = '87',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '38',
                            ['required_str'] = '90',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '41',
                            ['required_str'] = '94',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '44',
                            ['required_str'] = '98',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '48',
                            ['required_str'] = '101',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '53',
                            ['required_str'] = '105',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '59',
                            ['required_str'] = '108',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '66',
                            ['required_str'] = '112',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '74',
                            ['required_str'] = '116',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '83',
                            ['required_str'] = '119',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Sphinx Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '9',
                            ['required_str'] = '47',
                            ['required_agi'] = '8',
                        },
                        ['1'] = {
                            ['armor'] = '12',
                            ['required_str'] = '49',
                            ['required_agi'] = '8',
                        },
                        ['2'] = {
                            ['armor'] = '15',
                            ['required_str'] = '52',
                            ['required_agi'] = '8',
                        },
                        ['3'] = {
                            ['armor'] = '18',
                            ['required_str'] = '55',
                            ['required_agi'] = '8',
                        },
                        ['4'] = {
                            ['armor'] = '21',
                            ['required_str'] = '57',
                            ['required_agi'] = '8',
                        },
                        ['5'] = {
                            ['armor'] = '24',
                            ['required_str'] = '60',
                            ['required_agi'] = '8',
                        },
                        ['6'] = {
                            ['armor'] = '27',
                            ['required_str'] = '63',
                            ['required_agi'] = '8',
                        },
                        ['7'] = {
                            ['armor'] = '30',
                            ['required_str'] = '65',
                            ['required_agi'] = '8',
                        },
                        ['8'] = {
                            ['armor'] = '33',
                            ['required_str'] = '68',
                            ['required_agi'] = '8',
                        },
                        ['9'] = {
                            ['armor'] = '36',
                            ['required_str'] = '71',
                            ['required_agi'] = '8',
                        },
                        ['10'] = {
                            ['armor'] = '40',
                            ['required_str'] = '74',
                            ['required_agi'] = '8',
                        },
                        ['11'] = {
                            ['armor'] = '45',
                            ['required_str'] = '76',
                            ['required_agi'] = '8',
                        },
                        ['12'] = {
                            ['armor'] = '51',
                            ['required_str'] = '79',
                            ['required_agi'] = '8',
                        },
                        ['13'] = {
                            ['armor'] = '58',
                            ['required_str'] = '82',
                            ['required_agi'] = '8',
                        },
                        ['14'] = {
                            ['armor'] = '66',
                            ['required_str'] = '84',
                            ['required_agi'] = '8',
                        },
                        ['15'] = {
                            ['armor'] = '75',
                            ['required_str'] = '87',
                            ['required_agi'] = '8',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Sphinx Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '15',
                            ['required_str'] = '60',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '18',
                            ['required_str'] = '64',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '21',
                            ['required_str'] = '68',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '24',
                            ['required_str'] = '71',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '27',
                            ['required_str'] = '75',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '30',
                            ['required_str'] = '78',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '33',
                            ['required_str'] = '82',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '36',
                            ['required_str'] = '86',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '39',
                            ['required_str'] = '89',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '42',
                            ['required_str'] = '93',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '46',
                            ['required_str'] = '96',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '51',
                            ['required_str'] = '100',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '57',
                            ['required_str'] = '104',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '64',
                            ['required_str'] = '107',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '72',
                            ['required_str'] = '111',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '81',
                            ['required_str'] = '114',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Sphinx Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '8',
                            ['required_str'] = '36',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '11',
                            ['required_str'] = '38',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '14',
                            ['required_str'] = '40',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '17',
                            ['required_str'] = '42',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '20',
                            ['required_str'] = '44',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '23',
                            ['required_str'] = '45',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '26',
                            ['required_str'] = '47',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '29',
                            ['required_str'] = '49',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '32',
                            ['required_str'] = '51',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '35',
                            ['required_str'] = '53',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '39',
                            ['required_str'] = '54',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '44',
                            ['required_str'] = '56',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '50',
                            ['required_str'] = '58',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '57',
                            ['required_str'] = '60',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '65',
                            ['required_str'] = '62',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '74',
                            ['required_str'] = '63',
                            ['required_agi'] = 0,
                        },
                    },
                },
                ['shiled'] = {
                    ['name'] = 'Sphinx Shiled',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '20',
                            ['required_str'] = '69',
                            ['required_agi'] = 0,
                        },
                        ['1'] = {
                            ['armor'] = '23',
                            ['required_str'] = '72',
                            ['required_agi'] = 0,
                        },
                        ['2'] = {
                            ['armor'] = '26',
                            ['required_str'] = '76',
                            ['required_agi'] = 0,
                        },
                        ['3'] = {
                            ['armor'] = '29',
                            ['required_str'] = '80',
                            ['required_agi'] = 0,
                        },
                        ['4'] = {
                            ['armor'] = '32',
                            ['required_str'] = '83',
                            ['required_agi'] = 0,
                        },
                        ['5'] = {
                            ['armor'] = '35',
                            ['required_str'] = '87',
                            ['required_agi'] = 0,
                        },
                        ['6'] = {
                            ['armor'] = '38',
                            ['required_str'] = '90',
                            ['required_agi'] = 0,
                        },
                        ['7'] = {
                            ['armor'] = '41',
                            ['required_str'] = '94',
                            ['required_agi'] = 0,
                        },
                        ['8'] = {
                            ['armor'] = '44',
                            ['required_str'] = '98',
                            ['required_agi'] = 0,
                        },
                        ['9'] = {
                            ['armor'] = '48',
                            ['required_str'] = '101',
                            ['required_agi'] = 0,
                        },
                        ['10'] = {
                            ['armor'] = '53',
                            ['required_str'] = '105',
                            ['required_agi'] = 0,
                        },
                        ['11'] = {
                            ['armor'] = '59',
                            ['required_str'] = '108',
                            ['required_agi'] = 0,
                        },
                        ['12'] = {
                            ['armor'] = '66',
                            ['required_str'] = '112',
                            ['required_agi'] = 0,
                        },
                        ['13'] = {
                            ['armor'] = '74',
                            ['required_str'] = '116',
                            ['required_agi'] = 0,
                        },
                        ['14'] = {
                            ['armor'] = '83',
                            ['required_str'] = '119',
                            ['required_agi'] = 0,
                        },
                        ['15'] = {
                            ['armor'] = '92',
                            ['required_str'] = '123',
                            ['required_agi'] = 0,
                        },
                    },
                },
            },
            ['class'] = {
                'mage',
            },
        },
        ['Grand Soul'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Grand Soul Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '27',
                            ['required_str'] = '163',
                            ['required_agi'] = '68',
                        },
                        ['1'] = {
                            ['armor'] = '30',
                            ['required_str'] = '168',
                            ['required_agi'] = '70',
                        },
                        ['2'] = {
                            ['armor'] = '33',
                            ['required_str'] = '173',
                            ['required_agi'] = '72',
                        },
                        ['3'] = {
                            ['armor'] = '36',
                            ['required_str'] = '179',
                            ['required_agi'] = '74',
                        },
                        ['4'] = {
                            ['armor'] = '39',
                            ['required_str'] = '184',
                            ['required_agi'] = '75',
                        },
                        ['5'] = {
                            ['armor'] = '42',
                            ['required_str'] = '189',
                            ['required_agi'] = '77',
                        },
                        ['6'] = {
                            ['armor'] = '45',
                            ['required_str'] = '195',
                            ['required_agi'] = '79',
                        },
                        ['7'] = {
                            ['armor'] = '48',
                            ['required_str'] = '200',
                            ['required_agi'] = '81',
                        },
                        ['8'] = {
                            ['armor'] = '51',
                            ['required_str'] = '205',
                            ['required_agi'] = '83',
                        },
                        ['9'] = {
                            ['armor'] = '54',
                            ['required_str'] = '211',
                            ['required_agi'] = '84',
                        },
                        ['10'] = {
                            ['armor'] = '58',
                            ['required_str'] = '216',
                            ['required_agi'] = '86',
                        },
                        ['11'] = {
                            ['armor'] = '63',
                            ['required_str'] = '221',
                            ['required_agi'] = '88',
                        },
                        ['12'] = {
                            ['armor'] = '69',
                            ['required_str'] = '227',
                            ['required_agi'] = '90',
                        },
                        ['13'] = {
                            ['armor'] = '76',
                            ['required_str'] = '232',
                            ['required_agi'] = '92',
                        },
                        ['14'] = {
                            ['armor'] = '84',
                            ['required_str'] = '237',
                            ['required_agi'] = '93',
                        },
                        ['15'] = {
                            ['armor'] = '93',
                            ['required_str'] = '243',
                            ['required_agi'] = '95',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Grand Soul Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '33',
                            ['required_str'] = '181',
                            ['required_agi'] = '74',
                        },
                        ['1'] = {
                            ['armor'] = '36',
                            ['required_str'] = '186',
                            ['required_agi'] = '76',
                        },
                        ['2'] = {
                            ['armor'] = '39',
                            ['required_str'] = '191',
                            ['required_agi'] = '78',
                        },
                        ['3'] = {
                            ['armor'] = '42',
                            ['required_str'] = '197',
                            ['required_agi'] = '80',
                        },
                        ['4'] = {
                            ['armor'] = '45',
                            ['required_str'] = '202',
                            ['required_agi'] = '81',
                        },
                        ['5'] = {
                            ['armor'] = '48',
                            ['required_str'] = '207',
                            ['required_agi'] = '83',
                        },
                        ['6'] = {
                            ['armor'] = '51',
                            ['required_str'] = '212',
                            ['required_agi'] = '85',
                        },
                        ['7'] = {
                            ['armor'] = '54',
                            ['required_str'] = '218',
                            ['required_agi'] = '87',
                        },
                        ['8'] = {
                            ['armor'] = '57',
                            ['required_str'] = '223',
                            ['required_agi'] = '89',
                        },
                        ['9'] = {
                            ['armor'] = '60',
                            ['required_str'] = '228',
                            ['required_agi'] = '90',
                        },
                        ['10'] = {
                            ['armor'] = '64',
                            ['required_str'] = '234',
                            ['required_agi'] = '92',
                        },
                        ['11'] = {
                            ['armor'] = '69',
                            ['required_str'] = '239',
                            ['required_agi'] = '94',
                        },
                        ['12'] = {
                            ['armor'] = '75',
                            ['required_str'] = '244',
                            ['required_agi'] = '96',
                        },
                        ['13'] = {
                            ['armor'] = '82',
                            ['required_str'] = '250',
                            ['required_agi'] = '98',
                        },
                        ['14'] = {
                            ['armor'] = '90',
                            ['required_str'] = '255',
                            ['required_agi'] = '99',
                        },
                        ['15'] = {
                            ['armor'] = '99',
                            ['required_str'] = '260',
                            ['required_agi'] = '101',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Grand Soul Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '22',
                            ['required_str'] = '154',
                            ['required_agi'] = '42',
                        },
                        ['1'] = {
                            ['armor'] = '25',
                            ['required_str'] = '159',
                            ['required_agi'] = '43',
                        },
                        ['2'] = {
                            ['armor'] = '28',
                            ['required_str'] = '165',
                            ['required_agi'] = '44',
                        },
                        ['3'] = {
                            ['armor'] = '31',
                            ['required_str'] = '170',
                            ['required_agi'] = '45',
                        },
                        ['4'] = {
                            ['armor'] = '34',
                            ['required_str'] = '175',
                            ['required_agi'] = '46',
                        },
                        ['5'] = {
                            ['armor'] = '37',
                            ['required_str'] = '181',
                            ['required_agi'] = '47',
                        },
                        ['6'] = {
                            ['armor'] = '40',
                            ['required_str'] = '186',
                            ['required_agi'] = '48',
                        },
                        ['7'] = {
                            ['armor'] = '43',
                            ['required_str'] = '191',
                            ['required_agi'] = '49',
                        },
                        ['8'] = {
                            ['armor'] = '46',
                            ['required_str'] = '197',
                            ['required_agi'] = '50',
                        },
                        ['9'] = {
                            ['armor'] = '49',
                            ['required_str'] = '202',
                            ['required_agi'] = '50',
                        },
                        ['10'] = {
                            ['armor'] = '53',
                            ['required_str'] = '207',
                            ['required_agi'] = '51',
                        },
                        ['11'] = {
                            ['armor'] = '58',
                            ['required_str'] = '212',
                            ['required_agi'] = '52',
                        },
                        ['12'] = {
                            ['armor'] = '64',
                            ['required_str'] = '218',
                            ['required_agi'] = '53',
                        },
                        ['13'] = {
                            ['armor'] = '71',
                            ['required_str'] = '223',
                            ['required_agi'] = '54',
                        },
                        ['14'] = {
                            ['armor'] = '79',
                            ['required_str'] = '228',
                            ['required_agi'] = '55',
                        },
                        ['15'] = {
                            ['armor'] = '88',
                            ['required_str'] = '234',
                            ['required_agi'] = '56',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Grand Soul Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '30',
                            ['required_str'] = '172',
                            ['required_agi'] = '71',
                        },
                        ['1'] = {
                            ['armor'] = '33',
                            ['required_str'] = '177',
                            ['required_agi'] = '73',
                        },
                        ['2'] = {
                            ['armor'] = '36',
                            ['required_str'] = '182',
                            ['required_agi'] = '75',
                        },
                        ['3'] = {
                            ['armor'] = '39',
                            ['required_str'] = '188',
                            ['required_agi'] = '77',
                        },
                        ['4'] = {
                            ['armor'] = '42',
                            ['required_str'] = '193',
                            ['required_agi'] = '78',
                        },
                        ['5'] = {
                            ['armor'] = '45',
                            ['required_str'] = '198',
                            ['required_agi'] = '80',
                        },
                        ['6'] = {
                            ['armor'] = '48',
                            ['required_str'] = '204',
                            ['required_agi'] = '82',
                        },
                        ['7'] = {
                            ['armor'] = '51',
                            ['required_str'] = '209',
                            ['required_agi'] = '84',
                        },
                        ['8'] = {
                            ['armor'] = '54',
                            ['required_str'] = '214',
                            ['required_agi'] = '86',
                        },
                        ['9'] = {
                            ['armor'] = '57',
                            ['required_str'] = '220',
                            ['required_agi'] = '87',
                        },
                        ['10'] = {
                            ['armor'] = '61',
                            ['required_str'] = '225',
                            ['required_agi'] = '89',
                        },
                        ['11'] = {
                            ['armor'] = '66',
                            ['required_str'] = '230',
                            ['required_agi'] = '91',
                        },
                        ['12'] = {
                            ['armor'] = '72',
                            ['required_str'] = '235',
                            ['required_agi'] = '93',
                        },
                        ['13'] = {
                            ['armor'] = '79',
                            ['required_str'] = '241',
                            ['required_agi'] = '95',
                        },
                        ['14'] = {
                            ['armor'] = '87',
                            ['required_str'] = '246',
                            ['required_agi'] = '96',
                        },
                        ['15'] = {
                            ['armor'] = '96',
                            ['required_str'] = '251',
                            ['required_agi'] = '98',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Grand Soul Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '20',
                            ['required_str'] = '122',
                            ['required_agi'] = '41',
                        },
                        ['1'] = {
                            ['armor'] = '23',
                            ['required_str'] = '127',
                            ['required_agi'] = '41',
                        },
                        ['2'] = {
                            ['armor'] = '26',
                            ['required_str'] = '131',
                            ['required_agi'] = '42',
                        },
                        ['3'] = {
                            ['armor'] = '29',
                            ['required_str'] = '136',
                            ['required_agi'] = '43',
                        },
                        ['4'] = {
                            ['armor'] = '32',
                            ['required_str'] = '140',
                            ['required_agi'] = '44',
                        },
                        ['5'] = {
                            ['armor'] = '35',
                            ['required_str'] = '144',
                            ['required_agi'] = '45',
                        },
                        ['6'] = {
                            ['armor'] = '38',
                            ['required_str'] = '149',
                            ['required_agi'] = '46',
                        },
                        ['7'] = {
                            ['armor'] = '41',
                            ['required_str'] = '153',
                            ['required_agi'] = '47',
                        },
                        ['8'] = {
                            ['armor'] = '44',
                            ['required_str'] = '158',
                            ['required_agi'] = '48',
                        },
                        ['9'] = {
                            ['armor'] = '47',
                            ['required_str'] = '162',
                            ['required_agi'] = '49',
                        },
                        ['10'] = {
                            ['armor'] = '51',
                            ['required_str'] = '167',
                            ['required_agi'] = '50',
                        },
                        ['11'] = {
                            ['armor'] = '56',
                            ['required_str'] = '171',
                            ['required_agi'] = '50',
                        },
                        ['12'] = {
                            ['armor'] = '62',
                            ['required_str'] = '175',
                            ['required_agi'] = '51',
                        },
                        ['13'] = {
                            ['armor'] = '69',
                            ['required_str'] = '180',
                            ['required_agi'] = '52',
                        },
                        ['14'] = {
                            ['armor'] = '77',
                            ['required_str'] = '184',
                            ['required_agi'] = '53',
                        },
                        ['15'] = {
                            ['armor'] = '86',
                            ['required_str'] = '189',
                            ['required_agi'] = '54',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Grand Soul Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '55',
                            ['required_str'] = '175',
                            ['required_agi'] = '71',
                        },
                        ['1'] = {
                            ['armor'] = '58',
                            ['required_str'] = '181',
                            ['required_agi'] = '73',
                        },
                        ['2'] = {
                            ['armor'] = '61',
                            ['required_str'] = '188',
                            ['required_agi'] = '75',
                        },
                        ['3'] = {
                            ['armor'] = '64',
                            ['required_str'] = '194',
                            ['required_agi'] = '77',
                        },
                        ['4'] = {
                            ['armor'] = '67',
                            ['required_str'] = '200',
                            ['required_agi'] = '79',
                        },
                        ['5'] = {
                            ['armor'] = '70',
                            ['required_str'] = '206',
                            ['required_agi'] = '81',
                        },
                        ['6'] = {
                            ['armor'] = '73',
                            ['required_str'] = '213',
                            ['required_agi'] = '83',
                        },
                        ['7'] = {
                            ['armor'] = '76',
                            ['required_str'] = '219',
                            ['required_agi'] = '85',
                        },
                        ['8'] = {
                            ['armor'] = '79',
                            ['required_str'] = '225',
                            ['required_agi'] = '87',
                        },
                        ['9'] = {
                            ['armor'] = '82',
                            ['required_str'] = '232',
                            ['required_agi'] = '89',
                        },
                        ['10'] = {
                            ['armor'] = '86',
                            ['required_str'] = '238',
                            ['required_agi'] = '91',
                        },
                        ['11'] = {
                            ['armor'] = '91',
                            ['required_str'] = '244',
                            ['required_agi'] = '93',
                        },
                        ['12'] = {
                            ['armor'] = '97',
                            ['required_str'] = '251',
                            ['required_agi'] = '95',
                        },
                        ['13'] = {
                            ['armor'] = '104',
                            ['required_str'] = '257',
                            ['required_agi'] = '97',
                        },
                        ['14'] = {
                            ['armor'] = '112',
                            ['required_str'] = '263',
                            ['required_agi'] = '100',
                        },
                        ['15'] = {
                            ['armor'] = '121',
                            ['required_str'] = '269',
                            ['required_agi'] = '102',
                        },
                    },
                },
            },
            ['class'] = {
                'mage',
            },
        },
        ['Dark Soul'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Dark Soul Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '36',
                            ['required_str'] = '201',
                            ['required_agi'] = '79',
                        },
                        ['1'] = {
                            ['armor'] = '39',
                            ['required_str'] = '206',
                            ['required_agi'] = '81',
                        },
                        ['2'] = {
                            ['armor'] = '42',
                            ['required_str'] = '211',
                            ['required_agi'] = '82',
                        },
                        ['3'] = {
                            ['armor'] = '45',
                            ['required_str'] = '216',
                            ['required_agi'] = '84',
                        },
                        ['4'] = {
                            ['armor'] = '48',
                            ['required_str'] = '221',
                            ['required_agi'] = '85',
                        },
                        ['5'] = {
                            ['armor'] = '51',
                            ['required_str'] = '226',
                            ['required_agi'] = '87',
                        },
                        ['6'] = {
                            ['armor'] = '54',
                            ['required_str'] = '231',
                            ['required_agi'] = '89',
                        },
                        ['7'] = {
                            ['armor'] = '57',
                            ['required_str'] = '236',
                            ['required_agi'] = '90',
                        },
                        ['8'] = {
                            ['armor'] = '60',
                            ['required_str'] = '241',
                            ['required_agi'] = '92',
                        },
                        ['9'] = {
                            ['armor'] = '63',
                            ['required_str'] = '246',
                            ['required_agi'] = '93',
                        },
                        ['10'] = {
                            ['armor'] = '67',
                            ['required_str'] = '251',
                            ['required_agi'] = '95',
                        },
                        ['11'] = {
                            ['armor'] = '72',
                            ['required_str'] = '255',
                            ['required_agi'] = '97',
                        },
                        ['12'] = {
                            ['armor'] = '78',
                            ['required_str'] = '260',
                            ['required_agi'] = '98',
                        },
                        ['13'] = {
                            ['armor'] = '85',
                            ['required_str'] = '265',
                            ['required_agi'] = '100',
                        },
                        ['14'] = {
                            ['armor'] = '93',
                            ['required_str'] = '270',
                            ['required_agi'] = '102',
                        },
                        ['15'] = {
                            ['armor'] = '102',
                            ['required_str'] = '275',
                            ['required_agi'] = '103',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Dark Soul Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '43',
                            ['required_str'] = '221',
                            ['required_agi'] = '85',
                        },
                        ['1'] = {
                            ['armor'] = '46',
                            ['required_str'] = '226',
                            ['required_agi'] = '87',
                        },
                        ['2'] = {
                            ['armor'] = '49',
                            ['required_str'] = '231',
                            ['required_agi'] = '89',
                        },
                        ['3'] = {
                            ['armor'] = '52',
                            ['required_str'] = '236',
                            ['required_agi'] = '90',
                        },
                        ['4'] = {
                            ['armor'] = '55',
                            ['required_str'] = '241',
                            ['required_agi'] = '92',
                        },
                        ['5'] = {
                            ['armor'] = '58',
                            ['required_str'] = '246',
                            ['required_agi'] = '93',
                        },
                        ['6'] = {
                            ['armor'] = '61',
                            ['required_str'] = '251',
                            ['required_agi'] = '95',
                        },
                        ['7'] = {
                            ['armor'] = '64',
                            ['required_str'] = '255',
                            ['required_agi'] = '97',
                        },
                        ['8'] = {
                            ['armor'] = '67',
                            ['required_str'] = '260',
                            ['required_agi'] = '98',
                        },
                        ['9'] = {
                            ['armor'] = '70',
                            ['required_str'] = '265',
                            ['required_agi'] = '100',
                        },
                        ['10'] = {
                            ['armor'] = '74',
                            ['required_str'] = '270',
                            ['required_agi'] = '102',
                        },
                        ['11'] = {
                            ['armor'] = '79',
                            ['required_str'] = '275',
                            ['required_agi'] = '103',
                        },
                        ['12'] = {
                            ['armor'] = '85',
                            ['required_str'] = '280',
                            ['required_agi'] = '105',
                        },
                        ['13'] = {
                            ['armor'] = '92',
                            ['required_str'] = '285',
                            ['required_agi'] = '106',
                        },
                        ['14'] = {
                            ['armor'] = '100',
                            ['required_str'] = '290',
                            ['required_agi'] = '108',
                        },
                        ['15'] = {
                            ['armor'] = '109',
                            ['required_str'] = '295',
                            ['required_agi'] = '110',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Dark Soul Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '31',
                            ['required_str'] = '176',
                            ['required_agi'] = '71',
                        },
                        ['1'] = {
                            ['armor'] = '34',
                            ['required_str'] = '181',
                            ['required_agi'] = '72',
                        },
                        ['2'] = {
                            ['armor'] = '37',
                            ['required_str'] = '186',
                            ['required_agi'] = '74',
                        },
                        ['3'] = {
                            ['armor'] = '40',
                            ['required_str'] = '191',
                            ['required_agi'] = '76',
                        },
                        ['4'] = {
                            ['armor'] = '43',
                            ['required_str'] = '196',
                            ['required_agi'] = '77',
                        },
                        ['5'] = {
                            ['armor'] = '46',
                            ['required_str'] = '201',
                            ['required_agi'] = '79',
                        },
                        ['6'] = {
                            ['armor'] = '49',
                            ['required_str'] = '206',
                            ['required_agi'] = '81',
                        },
                        ['7'] = {
                            ['armor'] = '52',
                            ['required_str'] = '211',
                            ['required_agi'] = '82',
                        },
                        ['8'] = {
                            ['armor'] = '55',
                            ['required_str'] = '216',
                            ['required_agi'] = '84',
                        },
                        ['9'] = {
                            ['armor'] = '58',
                            ['required_str'] = '221',
                            ['required_agi'] = '85',
                        },
                        ['10'] = {
                            ['armor'] = '62',
                            ['required_str'] = '226',
                            ['required_agi'] = '87',
                        },
                        ['11'] = {
                            ['armor'] = '67',
                            ['required_str'] = '231',
                            ['required_agi'] = '89',
                        },
                        ['12'] = {
                            ['armor'] = '73',
                            ['required_str'] = '236',
                            ['required_agi'] = '90',
                        },
                        ['13'] = {
                            ['armor'] = '80',
                            ['required_str'] = '241',
                            ['required_agi'] = '92',
                        },
                        ['14'] = {
                            ['armor'] = '88',
                            ['required_str'] = '246',
                            ['required_agi'] = '93',
                        },
                        ['15'] = {
                            ['armor'] = '97',
                            ['required_str'] = '251',
                            ['required_agi'] = '95',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Dark Soul Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '39',
                            ['required_str'] = '213',
                            ['required_agi'] = '83',
                        },
                        ['1'] = {
                            ['armor'] = '42',
                            ['required_str'] = '218',
                            ['required_agi'] = '84',
                        },
                        ['2'] = {
                            ['armor'] = '45',
                            ['required_str'] = '222',
                            ['required_agi'] = '86',
                        },
                        ['3'] = {
                            ['armor'] = '48',
                            ['required_str'] = '227',
                            ['required_agi'] = '88',
                        },
                        ['4'] = {
                            ['armor'] = '51',
                            ['required_str'] = '232',
                            ['required_agi'] = '89',
                        },
                        ['5'] = {
                            ['armor'] = '54',
                            ['required_str'] = '237',
                            ['required_agi'] = '91',
                        },
                        ['6'] = {
                            ['armor'] = '57',
                            ['required_str'] = '242',
                            ['required_agi'] = '92',
                        },
                        ['7'] = {
                            ['armor'] = '60',
                            ['required_str'] = '247',
                            ['required_agi'] = '94',
                        },
                        ['8'] = {
                            ['armor'] = '63',
                            ['required_str'] = '252',
                            ['required_agi'] = '96',
                        },
                        ['9'] = {
                            ['armor'] = '66',
                            ['required_str'] = '257',
                            ['required_agi'] = '97',
                        },
                        ['10'] = {
                            ['armor'] = '70',
                            ['required_str'] = '262',
                            ['required_agi'] = '99',
                        },
                        ['11'] = {
                            ['armor'] = '75',
                            ['required_str'] = '267',
                            ['required_agi'] = '101',
                        },
                        ['12'] = {
                            ['armor'] = '81',
                            ['required_str'] = '272',
                            ['required_agi'] = '102',
                        },
                        ['13'] = {
                            ['armor'] = '88',
                            ['required_str'] = '277',
                            ['required_agi'] = '104',
                        },
                        ['14'] = {
                            ['armor'] = '96',
                            ['required_str'] = '282',
                            ['required_agi'] = '105',
                        },
                        ['15'] = {
                            ['armor'] = '105',
                            ['required_str'] = '287',
                            ['required_agi'] = '107',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Dark Soul Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '30',
                            ['required_str'] = '163',
                            ['required_agi'] = '66',
                        },
                        ['1'] = {
                            ['armor'] = '33',
                            ['required_str'] = '168',
                            ['required_agi'] = '68',
                        },
                        ['2'] = {
                            ['armor'] = '36',
                            ['required_str'] = '173',
                            ['required_agi'] = '70',
                        },
                        ['3'] = {
                            ['armor'] = '39',
                            ['required_str'] = '178',
                            ['required_agi'] = '71',
                        },
                        ['4'] = {
                            ['armor'] = '42',
                            ['required_str'] = '183',
                            ['required_agi'] = '73',
                        },
                        ['5'] = {
                            ['armor'] = '45',
                            ['required_str'] = '188',
                            ['required_agi'] = '75',
                        },
                        ['6'] = {
                            ['armor'] = '48',
                            ['required_str'] = '193',
                            ['required_agi'] = '76',
                        },
                        ['7'] = {
                            ['armor'] = '51',
                            ['required_str'] = '198',
                            ['required_agi'] = '78',
                        },
                        ['8'] = {
                            ['armor'] = '54',
                            ['required_str'] = '203',
                            ['required_agi'] = '79',
                        },
                        ['9'] = {
                            ['armor'] = '57',
                            ['required_str'] = '208',
                            ['required_agi'] = '81',
                        },
                        ['10'] = {
                            ['armor'] = '61',
                            ['required_str'] = '213',
                            ['required_agi'] = '83',
                        },
                        ['11'] = {
                            ['armor'] = '66',
                            ['required_str'] = '218',
                            ['required_agi'] = '84',
                        },
                        ['12'] = {
                            ['armor'] = '72',
                            ['required_str'] = '222',
                            ['required_agi'] = '86',
                        },
                        ['13'] = {
                            ['armor'] = '79',
                            ['required_str'] = '227',
                            ['required_agi'] = '88',
                        },
                        ['14'] = {
                            ['armor'] = '87',
                            ['required_str'] = '232',
                            ['required_agi'] = '89',
                        },
                        ['15'] = {
                            ['armor'] = '96',
                            ['required_str'] = '237',
                            ['required_agi'] = '91',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Dark Soul Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '46',
                            ['required_str'] = '226',
                            ['required_agi'] = '87',
                        },
                        ['1'] = {
                            ['armor'] = '49',
                            ['required_str'] = '231',
                            ['required_agi'] = '89',
                        },
                        ['2'] = {
                            ['armor'] = '52',
                            ['required_str'] = '236',
                            ['required_agi'] = '90',
                        },
                        ['3'] = {
                            ['armor'] = '55',
                            ['required_str'] = '241',
                            ['required_agi'] = '92',
                        },
                        ['4'] = {
                            ['armor'] = '58',
                            ['required_str'] = '246',
                            ['required_agi'] = '93',
                        },
                        ['5'] = {
                            ['armor'] = '61',
                            ['required_str'] = '251',
                            ['required_agi'] = '95',
                        },
                        ['6'] = {
                            ['armor'] = '64',
                            ['required_str'] = '255',
                            ['required_agi'] = '97',
                        },
                        ['7'] = {
                            ['armor'] = '67',
                            ['required_str'] = '260',
                            ['required_agi'] = '98',
                        },
                        ['8'] = {
                            ['armor'] = '70',
                            ['required_str'] = '265',
                            ['required_agi'] = '100',
                        },
                        ['9'] = {
                            ['armor'] = '74',
                            ['required_str'] = '270',
                            ['required_agi'] = '102',
                        },
                        ['10'] = {
                            ['armor'] = '79',
                            ['required_str'] = '275',
                            ['required_agi'] = '103',
                        },
                        ['11'] = {
                            ['armor'] = '85',
                            ['required_str'] = '280',
                            ['required_agi'] = '105',
                        },
                        ['12'] = {
                            ['armor'] = '92',
                            ['required_str'] = '285',
                            ['required_agi'] = '106',
                        },
                        ['13'] = {
                            ['armor'] = '100',
                            ['required_str'] = '290',
                            ['required_agi'] = '108',
                        },
                        ['14'] = {
                            ['armor'] = '109',
                            ['required_str'] = '295',
                            ['required_agi'] = '110',
                        },
                        ['15'] = {
                            ['armor'] = '118',
                            ['required_str'] = '300',
                            ['required_agi'] = '112',
                        },
                    },
                },
            },
            ['class'] = {
                'mage',
            },
        },
        ['Venom Mist'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Venom Mist Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '48',
                            ['required_str'] = '186',
                            ['required_agi'] = '76',
                        },
                        ['1'] = {
                            ['armor'] = '51',
                            ['required_str'] = '190',
                            ['required_agi'] = '78',
                        },
                        ['2'] = {
                            ['armor'] = '54',
                            ['required_str'] = '194',
                            ['required_agi'] = '79',
                        },
                        ['3'] = {
                            ['armor'] = '57',
                            ['required_str'] = '198',
                            ['required_agi'] = '80',
                        },
                        ['4'] = {
                            ['armor'] = '60',
                            ['required_str'] = '202',
                            ['required_agi'] = '82',
                        },
                        ['5'] = {
                            ['armor'] = '63',
                            ['required_str'] = '206',
                            ['required_agi'] = '83',
                        },
                        ['6'] = {
                            ['armor'] = '66',
                            ['required_str'] = '210',
                            ['required_agi'] = '84',
                        },
                        ['7'] = {
                            ['armor'] = '69',
                            ['required_str'] = '214',
                            ['required_agi'] = '86',
                        },
                        ['8'] = {
                            ['armor'] = '72',
                            ['required_str'] = '218',
                            ['required_agi'] = '87',
                        },
                        ['9'] = {
                            ['armor'] = '75',
                            ['required_str'] = '221',
                            ['required_agi'] = '88',
                        },
                        ['10'] = {
                            ['armor'] = '79',
                            ['required_str'] = '225',
                            ['required_agi'] = '90',
                        },
                        ['11'] = {
                            ['armor'] = '84',
                            ['required_str'] = '229',
                            ['required_agi'] = '91',
                        },
                        ['12'] = {
                            ['armor'] = '90',
                            ['required_str'] = '233',
                            ['required_agi'] = '92',
                        },
                        ['13'] = {
                            ['armor'] = '97',
                            ['required_str'] = '237',
                            ['required_agi'] = '94',
                        },
                        ['14'] = {
                            ['armor'] = '105',
                            ['required_str'] = '241',
                            ['required_agi'] = '95',
                        },
                        ['15'] = {
                            ['armor'] = '114',
                            ['required_str'] = '245',
                            ['required_agi'] = '96',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Venom Mist Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '57',
                            ['required_str'] = '212',
                            ['required_agi'] = '85',
                        },
                        ['1'] = {
                            ['armor'] = '60',
                            ['required_str'] = '216',
                            ['required_agi'] = '87',
                        },
                        ['2'] = {
                            ['armor'] = '63',
                            ['required_str'] = '220',
                            ['required_agi'] = '88',
                        },
                        ['3'] = {
                            ['armor'] = '66',
                            ['required_str'] = '224',
                            ['required_agi'] = '89',
                        },
                        ['4'] = {
                            ['armor'] = '69',
                            ['required_str'] = '228',
                            ['required_agi'] = '91',
                        },
                        ['5'] = {
                            ['armor'] = '72',
                            ['required_str'] = '232',
                            ['required_agi'] = '92',
                        },
                        ['6'] = {
                            ['armor'] = '75',
                            ['required_str'] = '236',
                            ['required_agi'] = '93',
                        },
                        ['7'] = {
                            ['armor'] = '78',
                            ['required_str'] = '240',
                            ['required_agi'] = '95',
                        },
                        ['8'] = {
                            ['armor'] = '81',
                            ['required_str'] = '244',
                            ['required_agi'] = '96',
                        },
                        ['9'] = {
                            ['armor'] = '84',
                            ['required_str'] = '248',
                            ['required_agi'] = '97',
                        },
                        ['10'] = {
                            ['armor'] = '88',
                            ['required_str'] = '252',
                            ['required_agi'] = '99',
                        },
                        ['11'] = {
                            ['armor'] = '93',
                            ['required_str'] = '256',
                            ['required_agi'] = '100',
                        },
                        ['12'] = {
                            ['armor'] = '99',
                            ['required_str'] = '260',
                            ['required_agi'] = '101',
                        },
                        ['13'] = {
                            ['armor'] = '106',
                            ['required_str'] = '264',
                            ['required_agi'] = '103',
                        },
                        ['14'] = {
                            ['armor'] = '114',
                            ['required_str'] = '268',
                            ['required_agi'] = '104',
                        },
                        ['15'] = {
                            ['armor'] = '123',
                            ['required_str'] = '272',
                            ['required_agi'] = '105',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Venom Mist Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '47',
                            ['required_str'] = '177',
                            ['required_agi'] = '73',
                        },
                        ['1'] = {
                            ['armor'] = '50',
                            ['required_str'] = '181',
                            ['required_agi'] = '74',
                        },
                        ['2'] = {
                            ['armor'] = '53',
                            ['required_str'] = '185',
                            ['required_agi'] = '76',
                        },
                        ['3'] = {
                            ['armor'] = '56',
                            ['required_str'] = '188',
                            ['required_agi'] = '77',
                        },
                        ['4'] = {
                            ['armor'] = '59',
                            ['required_str'] = '192',
                            ['required_agi'] = '78',
                        },
                        ['5'] = {
                            ['armor'] = '62',
                            ['required_str'] = '196',
                            ['required_agi'] = '80',
                        },
                        ['6'] = {
                            ['armor'] = '65',
                            ['required_str'] = '200',
                            ['required_agi'] = '81',
                        },
                        ['7'] = {
                            ['armor'] = '68',
                            ['required_str'] = '204',
                            ['required_agi'] = '83',
                        },
                        ['8'] = {
                            ['armor'] = '71',
                            ['required_str'] = '208',
                            ['required_agi'] = '84',
                        },
                        ['9'] = {
                            ['armor'] = '74',
                            ['required_str'] = '212',
                            ['required_agi'] = '85',
                        },
                        ['10'] = {
                            ['armor'] = '78',
                            ['required_str'] = '216',
                            ['required_agi'] = '87',
                        },
                        ['11'] = {
                            ['armor'] = '83',
                            ['required_str'] = '220',
                            ['required_agi'] = '88',
                        },
                        ['12'] = {
                            ['armor'] = '89',
                            ['required_str'] = '224',
                            ['required_agi'] = '89',
                        },
                        ['13'] = {
                            ['armor'] = '96',
                            ['required_str'] = '228',
                            ['required_agi'] = '91',
                        },
                        ['14'] = {
                            ['armor'] = '104',
                            ['required_str'] = '232',
                            ['required_agi'] = '92',
                        },
                        ['15'] = {
                            ['armor'] = '113',
                            ['required_str'] = '236',
                            ['required_agi'] = '93',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Venom Mist Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '55',
                            ['required_str'] = '198',
                            ['required_agi'] = '80',
                        },
                        ['1'] = {
                            ['armor'] = '58',
                            ['required_str'] = '202',
                            ['required_agi'] = '82',
                        },
                        ['2'] = {
                            ['armor'] = '61',
                            ['required_str'] = '206',
                            ['required_agi'] = '83',
                        },
                        ['3'] = {
                            ['armor'] = '64',
                            ['required_str'] = '210',
                            ['required_agi'] = '84',
                        },
                        ['4'] = {
                            ['armor'] = '67',
                            ['required_str'] = '214',
                            ['required_agi'] = '86',
                        },
                        ['5'] = {
                            ['armor'] = '70',
                            ['required_str'] = '218',
                            ['required_agi'] = '87',
                        },
                        ['6'] = {
                            ['armor'] = '73',
                            ['required_str'] = '221',
                            ['required_agi'] = '88',
                        },
                        ['7'] = {
                            ['armor'] = '76',
                            ['required_str'] = '225',
                            ['required_agi'] = '90',
                        },
                        ['8'] = {
                            ['armor'] = '79',
                            ['required_str'] = '229',
                            ['required_agi'] = '91',
                        },
                        ['9'] = {
                            ['armor'] = '82',
                            ['required_str'] = '233',
                            ['required_agi'] = '92',
                        },
                        ['10'] = {
                            ['armor'] = '86',
                            ['required_str'] = '237',
                            ['required_agi'] = '94',
                        },
                        ['11'] = {
                            ['armor'] = '91',
                            ['required_str'] = '241',
                            ['required_agi'] = '95',
                        },
                        ['12'] = {
                            ['armor'] = '97',
                            ['required_str'] = '245',
                            ['required_agi'] = '96',
                        },
                        ['13'] = {
                            ['armor'] = '104',
                            ['required_str'] = '249',
                            ['required_agi'] = '98',
                        },
                        ['14'] = {
                            ['armor'] = '112',
                            ['required_str'] = '253',
                            ['required_agi'] = '99',
                        },
                        ['15'] = {
                            ['armor'] = '121',
                            ['required_str'] = '257',
                            ['required_agi'] = '101',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Venom Mist Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '44',
                            ['required_str'] = '166',
                            ['required_agi'] = '69',
                        },
                        ['1'] = {
                            ['armor'] = '47',
                            ['required_str'] = '170',
                            ['required_agi'] = '71',
                        },
                        ['2'] = {
                            ['armor'] = '50',
                            ['required_str'] = '174',
                            ['required_agi'] = '72',
                        },
                        ['3'] = {
                            ['armor'] = '53',
                            ['required_str'] = '178',
                            ['required_agi'] = '74',
                        },
                        ['4'] = {
                            ['armor'] = '56',
                            ['required_str'] = '182',
                            ['required_agi'] = '75',
                        },
                        ['5'] = {
                            ['armor'] = '59',
                            ['required_str'] = '186',
                            ['required_agi'] = '76',
                        },
                        ['6'] = {
                            ['armor'] = '62',
                            ['required_str'] = '190',
                            ['required_agi'] = '78',
                        },
                        ['7'] = {
                            ['armor'] = '65',
                            ['required_str'] = '194',
                            ['required_agi'] = '79',
                        },
                        ['8'] = {
                            ['armor'] = '68',
                            ['required_str'] = '198',
                            ['required_agi'] = '80',
                        },
                        ['9'] = {
                            ['armor'] = '71',
                            ['required_str'] = '202',
                            ['required_agi'] = '82',
                        },
                        ['10'] = {
                            ['armor'] = '75',
                            ['required_str'] = '206',
                            ['required_agi'] = '83',
                        },
                        ['11'] = {
                            ['armor'] = '80',
                            ['required_str'] = '210',
                            ['required_agi'] = '84',
                        },
                        ['12'] = {
                            ['armor'] = '86',
                            ['required_str'] = '214',
                            ['required_agi'] = '86',
                        },
                        ['13'] = {
                            ['armor'] = '93',
                            ['required_str'] = '218',
                            ['required_agi'] = '87',
                        },
                        ['14'] = {
                            ['armor'] = '101',
                            ['required_str'] = '221',
                            ['required_agi'] = '88',
                        },
                        ['15'] = {
                            ['armor'] = '110',
                            ['required_str'] = '225',
                            ['required_agi'] = '90',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Venom Mist Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '60',
                            ['required_str'] = '216',
                            ['required_agi'] = '87',
                        },
                        ['1'] = {
                            ['armor'] = '63',
                            ['required_str'] = '220',
                            ['required_agi'] = '88',
                        },
                        ['2'] = {
                            ['armor'] = '66',
                            ['required_str'] = '224',
                            ['required_agi'] = '89',
                        },
                        ['3'] = {
                            ['armor'] = '69',
                            ['required_str'] = '228',
                            ['required_agi'] = '91',
                        },
                        ['4'] = {
                            ['armor'] = '72',
                            ['required_str'] = '232',
                            ['required_agi'] = '92',
                        },
                        ['5'] = {
                            ['armor'] = '75',
                            ['required_str'] = '236',
                            ['required_agi'] = '93',
                        },
                        ['6'] = {
                            ['armor'] = '78',
                            ['required_str'] = '240',
                            ['required_agi'] = '95',
                        },
                        ['7'] = {
                            ['armor'] = '81',
                            ['required_str'] = '244',
                            ['required_agi'] = '96',
                        },
                        ['8'] = {
                            ['armor'] = '84',
                            ['required_str'] = '248',
                            ['required_agi'] = '97',
                        },
                        ['9'] = {
                            ['armor'] = '88',
                            ['required_str'] = '252',
                            ['required_agi'] = '99',
                        },
                        ['10'] = {
                            ['armor'] = '93',
                            ['required_str'] = '256',
                            ['required_agi'] = '100',
                        },
                        ['11'] = {
                            ['armor'] = '99',
                            ['required_str'] = '260',
                            ['required_agi'] = '101',
                        },
                        ['12'] = {
                            ['armor'] = '106',
                            ['required_str'] = '264',
                            ['required_agi'] = '103',
                        },
                        ['13'] = {
                            ['armor'] = '114',
                            ['required_str'] = '268',
                            ['required_agi'] = '104',
                        },
                        ['14'] = {
                            ['armor'] = '123',
                            ['required_str'] = '272',
                            ['required_agi'] = '105',
                        },
                        ['15'] = {
                            ['armor'] = '132',
                            ['required_str'] = '276',
                            ['required_agi'] = '106',
                        },
                    },
                },
            },
            ['class'] = {
                'mage',
            },
        },
        ['Vine'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Vine Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '4',
                            ['required_str'] = '25',
                            ['required_agi'] = '30',
                        },
                        ['1'] = {
                            ['armor'] = '7',
                            ['required_str'] = '28',
                            ['required_agi'] = '36',
                        },
                        ['2'] = {
                            ['armor'] = '10',
                            ['required_str'] = '30',
                            ['required_agi'] = '41',
                        },
                        ['3'] = {
                            ['armor'] = '13',
                            ['required_str'] = '33',
                            ['required_agi'] = '47',
                        },
                        ['4'] = {
                            ['armor'] = '16',
                            ['required_str'] = '36',
                            ['required_agi'] = '52',
                        },
                        ['5'] = {
                            ['armor'] = '19',
                            ['required_str'] = '38',
                            ['required_agi'] = '57',
                        },
                        ['6'] = {
                            ['armor'] = '22',
                            ['required_str'] = '41',
                            ['required_agi'] = '63',
                        },
                        ['7'] = {
                            ['armor'] = '25',
                            ['required_str'] = '44',
                            ['required_agi'] = '68',
                        },
                        ['8'] = {
                            ['armor'] = '28',
                            ['required_str'] = '47',
                            ['required_agi'] = '74',
                        },
                        ['9'] = {
                            ['armor'] = '31',
                            ['required_str'] = '49',
                            ['required_agi'] = '79',
                        },
                        ['10'] = {
                            ['armor'] = '35',
                            ['required_str'] = '52',
                            ['required_agi'] = '84',
                        },
                        ['11'] = {
                            ['armor'] = '40',
                            ['required_str'] = '55',
                            ['required_agi'] = '90',
                        },
                        ['12'] = {
                            ['armor'] = '46',
                            ['required_str'] = '57',
                            ['required_agi'] = '95',
                        },
                        ['13'] = {
                            ['armor'] = '53',
                            ['required_str'] = '60',
                            ['required_agi'] = '101',
                        },
                        ['14'] = {
                            ['armor'] = '61',
                            ['required_str'] = '63',
                            ['required_agi'] = '106',
                        },
                        ['15'] = {
                            ['armor'] = '70',
                            ['required_str'] = '65',
                            ['required_agi'] = '111',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Vine Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '8',
                            ['required_str'] = '29',
                            ['required_agi'] = '38',
                        },
                        ['1'] = {
                            ['armor'] = '11',
                            ['required_str'] = '31',
                            ['required_agi'] = '43',
                        },
                        ['2'] = {
                            ['armor'] = '14',
                            ['required_str'] = '34',
                            ['required_agi'] = '48',
                        },
                        ['3'] = {
                            ['armor'] = '17',
                            ['required_str'] = '37',
                            ['required_agi'] = '54',
                        },
                        ['4'] = {
                            ['armor'] = '20',
                            ['required_str'] = '39',
                            ['required_agi'] = '59',
                        },
                        ['5'] = {
                            ['armor'] = '23',
                            ['required_str'] = '42',
                            ['required_agi'] = '65',
                        },
                        ['6'] = {
                            ['armor'] = '26',
                            ['required_str'] = '45',
                            ['required_agi'] = '70',
                        },
                        ['7'] = {
                            ['armor'] = '29',
                            ['required_str'] = '47',
                            ['required_agi'] = '75',
                        },
                        ['8'] = {
                            ['armor'] = '32',
                            ['required_str'] = '50',
                            ['required_agi'] = '81',
                        },
                        ['9'] = {
                            ['armor'] = '35',
                            ['required_str'] = '53',
                            ['required_agi'] = '86',
                        },
                        ['10'] = {
                            ['armor'] = '39',
                            ['required_str'] = '56',
                            ['required_agi'] = '92',
                        },
                        ['11'] = {
                            ['armor'] = '44',
                            ['required_str'] = '58',
                            ['required_agi'] = '97',
                        },
                        ['12'] = {
                            ['armor'] = '50',
                            ['required_str'] = '61',
                            ['required_agi'] = '102',
                        },
                        ['13'] = {
                            ['armor'] = '57',
                            ['required_str'] = '64',
                            ['required_agi'] = '108',
                        },
                        ['14'] = {
                            ['armor'] = '65',
                            ['required_str'] = '66',
                            ['required_agi'] = '113',
                        },
                        ['15'] = {
                            ['armor'] = '74',
                            ['required_str'] = '69',
                            ['required_agi'] = '119',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Vine Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '2',
                            ['required_str'] = '24',
                            ['required_agi'] = '29',
                        },
                        ['1'] = {
                            ['armor'] = '5',
                            ['required_str'] = '27',
                            ['required_agi'] = '34',
                        },
                        ['2'] = {
                            ['armor'] = '8',
                            ['required_str'] = '29',
                            ['required_agi'] = '39',
                        },
                        ['3'] = {
                            ['armor'] = '11',
                            ['required_str'] = '32',
                            ['required_agi'] = '45',
                        },
                        ['4'] = {
                            ['armor'] = '14',
                            ['required_str'] = '35',
                            ['required_agi'] = '50',
                        },
                        ['5'] = {
                            ['armor'] = '17',
                            ['required_str'] = '38',
                            ['required_agi'] = '56',
                        },
                        ['6'] = {
                            ['armor'] = '20',
                            ['required_str'] = '40',
                            ['required_agi'] = '61',
                        },
                        ['7'] = {
                            ['armor'] = '23',
                            ['required_str'] = '43',
                            ['required_agi'] = '66',
                        },
                        ['8'] = {
                            ['armor'] = '26',
                            ['required_str'] = '46',
                            ['required_agi'] = '72',
                        },
                        ['9'] = {
                            ['armor'] = '29',
                            ['required_str'] = '48',
                            ['required_agi'] = '77',
                        },
                        ['10'] = {
                            ['armor'] = '33',
                            ['required_str'] = '51',
                            ['required_agi'] = '83',
                        },
                        ['11'] = {
                            ['armor'] = '38',
                            ['required_str'] = '54',
                            ['required_agi'] = '88',
                        },
                        ['12'] = {
                            ['armor'] = '44',
                            ['required_str'] = '56',
                            ['required_agi'] = '93',
                        },
                        ['13'] = {
                            ['armor'] = '51',
                            ['required_str'] = '59',
                            ['required_agi'] = '99',
                        },
                        ['14'] = {
                            ['armor'] = '59',
                            ['required_str'] = '62',
                            ['required_agi'] = '104',
                        },
                        ['15'] = {
                            ['armor'] = '68',
                            ['required_str'] = '65',
                            ['required_agi'] = '110',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Vine Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '6',
                            ['required_str'] = '27',
                            ['required_agi'] = '34',
                        },
                        ['1'] = {
                            ['armor'] = '9',
                            ['required_str'] = '29',
                            ['required_agi'] = '39',
                        },
                        ['2'] = {
                            ['armor'] = '12',
                            ['required_str'] = '32',
                            ['required_agi'] = '45',
                        },
                        ['3'] = {
                            ['armor'] = '15',
                            ['required_str'] = '35',
                            ['required_agi'] = '50',
                        },
                        ['4'] = {
                            ['armor'] = '18',
                            ['required_str'] = '38',
                            ['required_agi'] = '56',
                        },
                        ['5'] = {
                            ['armor'] = '21',
                            ['required_str'] = '40',
                            ['required_agi'] = '61',
                        },
                        ['6'] = {
                            ['armor'] = '24',
                            ['required_str'] = '43',
                            ['required_agi'] = '66',
                        },
                        ['7'] = {
                            ['armor'] = '27',
                            ['required_str'] = '46',
                            ['required_agi'] = '72',
                        },
                        ['8'] = {
                            ['armor'] = '30',
                            ['required_str'] = '48',
                            ['required_agi'] = '77',
                        },
                        ['9'] = {
                            ['armor'] = '33',
                            ['required_str'] = '51',
                            ['required_agi'] = '83',
                        },
                        ['10'] = {
                            ['armor'] = '37',
                            ['required_str'] = '54',
                            ['required_agi'] = '88',
                        },
                        ['11'] = {
                            ['armor'] = '42',
                            ['required_str'] = '56',
                            ['required_agi'] = '93',
                        },
                        ['12'] = {
                            ['armor'] = '48',
                            ['required_str'] = '59',
                            ['required_agi'] = '99',
                        },
                        ['13'] = {
                            ['armor'] = '55',
                            ['required_str'] = '62',
                            ['required_agi'] = '104',
                        },
                        ['14'] = {
                            ['armor'] = '63',
                            ['required_str'] = '65',
                            ['required_agi'] = '110',
                        },
                        ['15'] = {
                            ['armor'] = '72',
                            ['required_str'] = '67',
                            ['required_agi'] = '115',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Vine Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '2',
                            ['required_str'] = '23',
                            ['required_agi'] = '27',
                        },
                        ['1'] = {
                            ['armor'] = '5',
                            ['required_str'] = '26',
                            ['required_agi'] = '32',
                        },
                        ['2'] = {
                            ['armor'] = '8',
                            ['required_str'] = '29',
                            ['required_agi'] = '38',
                        },
                        ['3'] = {
                            ['armor'] = '11',
                            ['required_str'] = '31',
                            ['required_agi'] = '43',
                        },
                        ['4'] = {
                            ['armor'] = '14',
                            ['required_str'] = '34',
                            ['required_agi'] = '48',
                        },
                        ['5'] = {
                            ['armor'] = '17',
                            ['required_str'] = '37',
                            ['required_agi'] = '54',
                        },
                        ['6'] = {
                            ['armor'] = '20',
                            ['required_str'] = '39',
                            ['required_agi'] = '59',
                        },
                        ['7'] = {
                            ['armor'] = '23',
                            ['required_str'] = '42',
                            ['required_agi'] = '65',
                        },
                        ['8'] = {
                            ['armor'] = '26',
                            ['required_str'] = '45',
                            ['required_agi'] = '70',
                        },
                        ['9'] = {
                            ['armor'] = '29',
                            ['required_str'] = '47',
                            ['required_agi'] = '75',
                        },
                        ['10'] = {
                            ['armor'] = '33',
                            ['required_str'] = '50',
                            ['required_agi'] = '81',
                        },
                        ['11'] = {
                            ['armor'] = '38',
                            ['required_str'] = '53',
                            ['required_agi'] = '86',
                        },
                        ['12'] = {
                            ['armor'] = '44',
                            ['required_str'] = '56',
                            ['required_agi'] = '92',
                        },
                        ['13'] = {
                            ['armor'] = '51',
                            ['required_str'] = '58',
                            ['required_agi'] = '97',
                        },
                        ['14'] = {
                            ['armor'] = '59',
                            ['required_str'] = '61',
                            ['required_agi'] = '102',
                        },
                        ['15'] = {
                            ['armor'] = '68',
                            ['required_str'] = '64',
                            ['required_agi'] = '108',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Vine Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '11',
                            ['required_str'] = '31',
                            ['required_agi'] = '43',
                        },
                        ['1'] = {
                            ['armor'] = '14',
                            ['required_str'] = '34',
                            ['required_agi'] = '48',
                        },
                        ['2'] = {
                            ['armor'] = '17',
                            ['required_str'] = '37',
                            ['required_agi'] = '54',
                        },
                        ['3'] = {
                            ['armor'] = '20',
                            ['required_str'] = '39',
                            ['required_agi'] = '59',
                        },
                        ['4'] = {
                            ['armor'] = '23',
                            ['required_str'] = '42',
                            ['required_agi'] = '65',
                        },
                        ['5'] = {
                            ['armor'] = '26',
                            ['required_str'] = '45',
                            ['required_agi'] = '70',
                        },
                        ['6'] = {
                            ['armor'] = '29',
                            ['required_str'] = '47',
                            ['required_agi'] = '75',
                        },
                        ['7'] = {
                            ['armor'] = '32',
                            ['required_str'] = '50',
                            ['required_agi'] = '81',
                        },
                        ['8'] = {
                            ['armor'] = '35',
                            ['required_str'] = '53',
                            ['required_agi'] = '86',
                        },
                        ['9'] = {
                            ['armor'] = '39',
                            ['required_str'] = '56',
                            ['required_agi'] = '92',
                        },
                        ['10'] = {
                            ['armor'] = '44',
                            ['required_str'] = '58',
                            ['required_agi'] = '97',
                        },
                        ['11'] = {
                            ['armor'] = '50',
                            ['required_str'] = '61',
                            ['required_agi'] = '102',
                        },
                        ['12'] = {
                            ['armor'] = '57',
                            ['required_str'] = '64',
                            ['required_agi'] = '108',
                        },
                        ['13'] = {
                            ['armor'] = '65',
                            ['required_str'] = '66',
                            ['required_agi'] = '113',
                        },
                        ['14'] = {
                            ['armor'] = '74',
                            ['required_str'] = '69',
                            ['required_agi'] = '119',
                        },
                        ['15'] = {
                            ['armor'] = '82',
                            ['required_str'] = '72',
                            ['required_agi'] = '124',
                        },
                    },
                },
            },
            ['class'] = {
                'buffer',
                'assassin',
            },
        },
        ['Silk'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Silk Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '8',
                            ['required_str'] = '34',
                            ['required_agi'] = '53',
                        },
                        ['1'] = {
                            ['armor'] = '11',
                            ['required_str'] = '37',
                            ['required_agi'] = '59',
                        },
                        ['2'] = {
                            ['armor'] = '14',
                            ['required_str'] = '39',
                            ['required_agi'] = '66',
                        },
                        ['3'] = {
                            ['armor'] = '17',
                            ['required_str'] = '42',
                            ['required_agi'] = '72',
                        },
                        ['4'] = {
                            ['armor'] = '20',
                            ['required_str'] = '45',
                            ['required_agi'] = '78',
                        },
                        ['5'] = {
                            ['armor'] = '23',
                            ['required_str'] = '47',
                            ['required_agi'] = '85',
                        },
                        ['6'] = {
                            ['armor'] = '26',
                            ['required_str'] = '50',
                            ['required_agi'] = '91',
                        },
                        ['7'] = {
                            ['armor'] = '29',
                            ['required_str'] = '53',
                            ['required_agi'] = '97',
                        },
                        ['8'] = {
                            ['armor'] = '32',
                            ['required_str'] = '56',
                            ['required_agi'] = '104',
                        },
                        ['9'] = {
                            ['armor'] = '35',
                            ['required_str'] = '58',
                            ['required_agi'] = '110',
                        },
                        ['10'] = {
                            ['armor'] = '39',
                            ['required_str'] = '61',
                            ['required_agi'] = '116',
                        },
                        ['11'] = {
                            ['armor'] = '44',
                            ['required_str'] = '64',
                            ['required_agi'] = '122',
                        },
                        ['12'] = {
                            ['armor'] = '50',
                            ['required_str'] = '66',
                            ['required_agi'] = '129',
                        },
                        ['13'] = {
                            ['armor'] = '57',
                            ['required_str'] = '69',
                            ['required_agi'] = '135',
                        },
                        ['14'] = {
                            ['armor'] = '65',
                            ['required_str'] = '72',
                            ['required_agi'] = '141',
                        },
                        ['15'] = {
                            ['armor'] = '74',
                            ['required_str'] = '74',
                            ['required_agi'] = '148',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Silk Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '12',
                            ['required_str'] = '38',
                            ['required_agi'] = '62',
                        },
                        ['1'] = {
                            ['armor'] = '15',
                            ['required_str'] = '40',
                            ['required_agi'] = '68',
                        },
                        ['2'] = {
                            ['armor'] = '18',
                            ['required_str'] = '43',
                            ['required_agi'] = '74',
                        },
                        ['3'] = {
                            ['armor'] = '21',
                            ['required_str'] = '46',
                            ['required_agi'] = '80',
                        },
                        ['4'] = {
                            ['armor'] = '24',
                            ['required_str'] = '48',
                            ['required_agi'] = '87',
                        },
                        ['5'] = {
                            ['armor'] = '27',
                            ['required_str'] = '51',
                            ['required_agi'] = '93',
                        },
                        ['6'] = {
                            ['armor'] = '30',
                            ['required_str'] = '54',
                            ['required_agi'] = '99',
                        },
                        ['7'] = {
                            ['armor'] = '33',
                            ['required_str'] = '56',
                            ['required_agi'] = '106',
                        },
                        ['8'] = {
                            ['armor'] = '36',
                            ['required_str'] = '59',
                            ['required_agi'] = '112',
                        },
                        ['9'] = {
                            ['armor'] = '39',
                            ['required_str'] = '62',
                            ['required_agi'] = '118',
                        },
                        ['10'] = {
                            ['armor'] = '43',
                            ['required_str'] = '65',
                            ['required_agi'] = '125',
                        },
                        ['11'] = {
                            ['armor'] = '48',
                            ['required_str'] = '67',
                            ['required_agi'] = '131',
                        },
                        ['12'] = {
                            ['armor'] = '54',
                            ['required_str'] = '70',
                            ['required_agi'] = '137',
                        },
                        ['13'] = {
                            ['armor'] = '61',
                            ['required_str'] = '73',
                            ['required_agi'] = '143',
                        },
                        ['14'] = {
                            ['armor'] = '69',
                            ['required_str'] = '75',
                            ['required_agi'] = '150',
                        },
                        ['15'] = {
                            ['armor'] = '78',
                            ['required_str'] = '78',
                            ['required_agi'] = '156',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Silk Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '4',
                            ['required_str'] = '33',
                            ['required_agi'] = '51',
                        },
                        ['1'] = {
                            ['armor'] = '7',
                            ['required_str'] = '36',
                            ['required_agi'] = '57',
                        },
                        ['2'] = {
                            ['armor'] = '10',
                            ['required_str'] = '38',
                            ['required_agi'] = '64',
                        },
                        ['3'] = {
                            ['armor'] = '13',
                            ['required_str'] = '41',
                            ['required_agi'] = '70',
                        },
                        ['4'] = {
                            ['armor'] = '16',
                            ['required_str'] = '44',
                            ['required_agi'] = '76',
                        },
                        ['5'] = {
                            ['armor'] = '19',
                            ['required_str'] = '47',
                            ['required_agi'] = '83',
                        },
                        ['6'] = {
                            ['armor'] = '22',
                            ['required_str'] = '49',
                            ['required_agi'] = '89',
                        },
                        ['7'] = {
                            ['armor'] = '25',
                            ['required_str'] = '52',
                            ['required_agi'] = '95',
                        },
                        ['8'] = {
                            ['armor'] = '28',
                            ['required_str'] = '55',
                            ['required_agi'] = '101',
                        },
                        ['9'] = {
                            ['armor'] = '31',
                            ['required_str'] = '57',
                            ['required_agi'] = '108',
                        },
                        ['10'] = {
                            ['armor'] = '35',
                            ['required_str'] = '60',
                            ['required_agi'] = '114',
                        },
                        ['11'] = {
                            ['armor'] = '40',
                            ['required_str'] = '63',
                            ['required_agi'] = '120',
                        },
                        ['12'] = {
                            ['armor'] = '46',
                            ['required_str'] = '65',
                            ['required_agi'] = '127',
                        },
                        ['13'] = {
                            ['armor'] = '53',
                            ['required_str'] = '68',
                            ['required_agi'] = '133',
                        },
                        ['14'] = {
                            ['armor'] = '61',
                            ['required_str'] = '71',
                            ['required_agi'] = '139',
                        },
                        ['15'] = {
                            ['armor'] = '70',
                            ['required_str'] = '74',
                            ['required_agi'] = '146',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Silk Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '10',
                            ['required_str'] = '36',
                            ['required_agi'] = '57',
                        },
                        ['1'] = {
                            ['armor'] = '13',
                            ['required_str'] = '38',
                            ['required_agi'] = '64',
                        },
                        ['2'] = {
                            ['armor'] = '16',
                            ['required_str'] = '41',
                            ['required_agi'] = '70',
                        },
                        ['3'] = {
                            ['armor'] = '19',
                            ['required_str'] = '44',
                            ['required_agi'] = '76',
                        },
                        ['4'] = {
                            ['armor'] = '22',
                            ['required_str'] = '47',
                            ['required_agi'] = '83',
                        },
                        ['5'] = {
                            ['armor'] = '25',
                            ['required_str'] = '49',
                            ['required_agi'] = '89',
                        },
                        ['6'] = {
                            ['armor'] = '28',
                            ['required_str'] = '52',
                            ['required_agi'] = '95',
                        },
                        ['7'] = {
                            ['armor'] = '31',
                            ['required_str'] = '55',
                            ['required_agi'] = '101',
                        },
                        ['8'] = {
                            ['armor'] = '34',
                            ['required_str'] = '57',
                            ['required_agi'] = '108',
                        },
                        ['9'] = {
                            ['armor'] = '37',
                            ['required_str'] = '60',
                            ['required_agi'] = '114',
                        },
                        ['10'] = {
                            ['armor'] = '41',
                            ['required_str'] = '63',
                            ['required_agi'] = '120',
                        },
                        ['11'] = {
                            ['armor'] = '46',
                            ['required_str'] = '65',
                            ['required_agi'] = '127',
                        },
                        ['12'] = {
                            ['armor'] = '52',
                            ['required_str'] = '68',
                            ['required_agi'] = '133',
                        },
                        ['13'] = {
                            ['armor'] = '59',
                            ['required_str'] = '71',
                            ['required_agi'] = '139',
                        },
                        ['14'] = {
                            ['armor'] = '67',
                            ['required_str'] = '74',
                            ['required_agi'] = '146',
                        },
                        ['15'] = {
                            ['armor'] = '76',
                            ['required_str'] = '76',
                            ['required_agi'] = '152',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Silk Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '4',
                            ['required_str'] = '32',
                            ['required_agi'] = '49',
                        },
                        ['1'] = {
                            ['armor'] = '7',
                            ['required_str'] = '35',
                            ['required_agi'] = '55',
                        },
                        ['2'] = {
                            ['armor'] = '10',
                            ['required_str'] = '38',
                            ['required_agi'] = '62',
                        },
                        ['3'] = {
                            ['armor'] = '13',
                            ['required_str'] = '40',
                            ['required_agi'] = '68',
                        },
                        ['4'] = {
                            ['armor'] = '16',
                            ['required_str'] = '43',
                            ['required_agi'] = '74',
                        },
                        ['5'] = {
                            ['armor'] = '19',
                            ['required_str'] = '46',
                            ['required_agi'] = '80',
                        },
                        ['6'] = {
                            ['armor'] = '22',
                            ['required_str'] = '48',
                            ['required_agi'] = '87',
                        },
                        ['7'] = {
                            ['armor'] = '25',
                            ['required_str'] = '51',
                            ['required_agi'] = '93',
                        },
                        ['8'] = {
                            ['armor'] = '28',
                            ['required_str'] = '54',
                            ['required_agi'] = '99',
                        },
                        ['9'] = {
                            ['armor'] = '31',
                            ['required_str'] = '56',
                            ['required_agi'] = '106',
                        },
                        ['10'] = {
                            ['armor'] = '35',
                            ['required_str'] = '59',
                            ['required_agi'] = '112',
                        },
                        ['11'] = {
                            ['armor'] = '40',
                            ['required_str'] = '62',
                            ['required_agi'] = '118',
                        },
                        ['12'] = {
                            ['armor'] = '46',
                            ['required_str'] = '65',
                            ['required_agi'] = '125',
                        },
                        ['13'] = {
                            ['armor'] = '53',
                            ['required_str'] = '67',
                            ['required_agi'] = '131',
                        },
                        ['14'] = {
                            ['armor'] = '61',
                            ['required_str'] = '70',
                            ['required_agi'] = '137',
                        },
                        ['15'] = {
                            ['armor'] = '70',
                            ['required_str'] = '73',
                            ['required_agi'] = '143',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Silk Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '15',
                            ['required_str'] = '40',
                            ['required_agi'] = '68',
                        },
                        ['1'] = {
                            ['armor'] = '18',
                            ['required_str'] = '43',
                            ['required_agi'] = '74',
                        },
                        ['2'] = {
                            ['armor'] = '21',
                            ['required_str'] = '46',
                            ['required_agi'] = '80',
                        },
                        ['3'] = {
                            ['armor'] = '24',
                            ['required_str'] = '48',
                            ['required_agi'] = '87',
                        },
                        ['4'] = {
                            ['armor'] = '27',
                            ['required_str'] = '51',
                            ['required_agi'] = '93',
                        },
                        ['5'] = {
                            ['armor'] = '30',
                            ['required_str'] = '54',
                            ['required_agi'] = '99',
                        },
                        ['6'] = {
                            ['armor'] = '33',
                            ['required_str'] = '56',
                            ['required_agi'] = '106',
                        },
                        ['7'] = {
                            ['armor'] = '36',
                            ['required_str'] = '59',
                            ['required_agi'] = '112',
                        },
                        ['8'] = {
                            ['armor'] = '39',
                            ['required_str'] = '62',
                            ['required_agi'] = '118',
                        },
                        ['9'] = {
                            ['armor'] = '43',
                            ['required_str'] = '65',
                            ['required_agi'] = '125',
                        },
                        ['10'] = {
                            ['armor'] = '48',
                            ['required_str'] = '67',
                            ['required_agi'] = '131',
                        },
                        ['11'] = {
                            ['armor'] = '54',
                            ['required_str'] = '70',
                            ['required_agi'] = '137',
                        },
                        ['12'] = {
                            ['armor'] = '61',
                            ['required_str'] = '73',
                            ['required_agi'] = '143',
                        },
                        ['13'] = {
                            ['armor'] = '69',
                            ['required_str'] = '75',
                            ['required_agi'] = '150',
                        },
                        ['14'] = {
                            ['armor'] = '78',
                            ['required_str'] = '78',
                            ['required_agi'] = '156',
                        },
                        ['15'] = {
                            ['armor'] = '86',
                            ['required_str'] = '81',
                            ['required_agi'] = '162',
                        },
                    },
                },
            },
            ['class'] = {
                'buffer',
                'assassin',
            },
        },
        ['Wind'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Wind Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '12',
                            ['required_str'] = '45',
                            ['required_agi'] = '87',
                        },
                        ['1'] = {
                            ['armor'] = '15',
                            ['required_str'] = '47',
                            ['required_agi'] = '94',
                        },
                        ['2'] = {
                            ['armor'] = '18',
                            ['required_str'] = '50',
                            ['required_agi'] = '101',
                        },
                        ['3'] = {
                            ['armor'] = '21',
                            ['required_str'] = '53',
                            ['required_agi'] = '108',
                        },
                        ['4'] = {
                            ['armor'] = '24',
                            ['required_str'] = '56',
                            ['required_agi'] = '116',
                        },
                        ['5'] = {
                            ['armor'] = '27',
                            ['required_str'] = '58',
                            ['required_agi'] = '123',
                        },
                        ['6'] = {
                            ['armor'] = '30',
                            ['required_str'] = '61',
                            ['required_agi'] = '130',
                        },
                        ['7'] = {
                            ['armor'] = '33',
                            ['required_str'] = '64',
                            ['required_agi'] = '137',
                        },
                        ['8'] = {
                            ['armor'] = '36',
                            ['required_str'] = '66',
                            ['required_agi'] = '144',
                        },
                        ['9'] = {
                            ['armor'] = '39',
                            ['required_str'] = '69',
                            ['required_agi'] = '152',
                        },
                        ['10'] = {
                            ['armor'] = '43',
                            ['required_str'] = '72',
                            ['required_agi'] = '159',
                        },
                        ['11'] = {
                            ['armor'] = '48',
                            ['required_str'] = '74',
                            ['required_agi'] = '166',
                        },
                        ['12'] = {
                            ['armor'] = '54',
                            ['required_str'] = '77',
                            ['required_agi'] = '173',
                        },
                        ['13'] = {
                            ['armor'] = '61',
                            ['required_str'] = '80',
                            ['required_agi'] = '180',
                        },
                        ['14'] = {
                            ['armor'] = '69',
                            ['required_str'] = '83',
                            ['required_agi'] = '188',
                        },
                        ['15'] = {
                            ['armor'] = '78',
                            ['required_str'] = '85',
                            ['required_agi'] = '195',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Wind Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '16',
                            ['required_str'] = '48',
                            ['required_agi'] = '96',
                        },
                        ['1'] = {
                            ['armor'] = '19',
                            ['required_str'] = '51',
                            ['required_agi'] = '104',
                        },
                        ['2'] = {
                            ['armor'] = '22',
                            ['required_str'] = '54',
                            ['required_agi'] = '111',
                        },
                        ['3'] = {
                            ['armor'] = '25',
                            ['required_str'] = '56',
                            ['required_agi'] = '118',
                        },
                        ['4'] = {
                            ['armor'] = '28',
                            ['required_str'] = '59',
                            ['required_agi'] = '125',
                        },
                        ['5'] = {
                            ['armor'] = '31',
                            ['required_str'] = '62',
                            ['required_agi'] = '132',
                        },
                        ['6'] = {
                            ['armor'] = '34',
                            ['required_str'] = '65',
                            ['required_agi'] = '140',
                        },
                        ['7'] = {
                            ['armor'] = '37',
                            ['required_str'] = '67',
                            ['required_agi'] = '147',
                        },
                        ['8'] = {
                            ['armor'] = '40',
                            ['required_str'] = '70',
                            ['required_agi'] = '154',
                        },
                        ['9'] = {
                            ['armor'] = '43',
                            ['required_str'] = '73',
                            ['required_agi'] = '161',
                        },
                        ['10'] = {
                            ['armor'] = '47',
                            ['required_str'] = '75',
                            ['required_agi'] = '168',
                        },
                        ['11'] = {
                            ['armor'] = '52',
                            ['required_str'] = '78',
                            ['required_agi'] = '176',
                        },
                        ['12'] = {
                            ['armor'] = '58',
                            ['required_str'] = '81',
                            ['required_agi'] = '183',
                        },
                        ['13'] = {
                            ['armor'] = '65',
                            ['required_str'] = '83',
                            ['required_agi'] = '190',
                        },
                        ['14'] = {
                            ['armor'] = '73',
                            ['required_str'] = '86',
                            ['required_agi'] = '197',
                        },
                        ['15'] = {
                            ['armor'] = '82',
                            ['required_str'] = '89',
                            ['required_agi'] = '204',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Wind Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '7',
                            ['required_str'] = '44',
                            ['required_agi'] = '84',
                        },
                        ['1'] = {
                            ['armor'] = '10',
                            ['required_str'] = '47',
                            ['required_agi'] = '92',
                        },
                        ['2'] = {
                            ['armor'] = '13',
                            ['required_str'] = '49',
                            ['required_agi'] = '99',
                        },
                        ['3'] = {
                            ['armor'] = '16',
                            ['required_str'] = '52',
                            ['required_agi'] = '106',
                        },
                        ['4'] = {
                            ['armor'] = '19',
                            ['required_str'] = '55',
                            ['required_agi'] = '113',
                        },
                        ['5'] = {
                            ['armor'] = '22',
                            ['required_str'] = '57',
                            ['required_agi'] = '120',
                        },
                        ['6'] = {
                            ['armor'] = '25',
                            ['required_str'] = '60',
                            ['required_agi'] = '128',
                        },
                        ['7'] = {
                            ['armor'] = '28',
                            ['required_str'] = '63',
                            ['required_agi'] = '135',
                        },
                        ['8'] = {
                            ['armor'] = '31',
                            ['required_str'] = '65',
                            ['required_agi'] = '142',
                        },
                        ['9'] = {
                            ['armor'] = '34',
                            ['required_str'] = '68',
                            ['required_agi'] = '149',
                        },
                        ['10'] = {
                            ['armor'] = '38',
                            ['required_str'] = '71',
                            ['required_agi'] = '156',
                        },
                        ['11'] = {
                            ['armor'] = '43',
                            ['required_str'] = '74',
                            ['required_agi'] = '164',
                        },
                        ['12'] = {
                            ['armor'] = '49',
                            ['required_str'] = '76',
                            ['required_agi'] = '171',
                        },
                        ['13'] = {
                            ['armor'] = '56',
                            ['required_str'] = '79',
                            ['required_agi'] = '178',
                        },
                        ['14'] = {
                            ['armor'] = '64',
                            ['required_str'] = '82',
                            ['required_agi'] = '185',
                        },
                        ['15'] = {
                            ['armor'] = '73',
                            ['required_str'] = '84',
                            ['required_agi'] = '192',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Wind Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '14',
                            ['required_str'] = '47',
                            ['required_agi'] = '92',
                        },
                        ['1'] = {
                            ['armor'] = '17',
                            ['required_str'] = '49',
                            ['required_agi'] = '99',
                        },
                        ['2'] = {
                            ['armor'] = '20',
                            ['required_str'] = '52',
                            ['required_agi'] = '106',
                        },
                        ['3'] = {
                            ['armor'] = '23',
                            ['required_str'] = '55',
                            ['required_agi'] = '113',
                        },
                        ['4'] = {
                            ['armor'] = '26',
                            ['required_str'] = '57',
                            ['required_agi'] = '120',
                        },
                        ['5'] = {
                            ['armor'] = '29',
                            ['required_str'] = '60',
                            ['required_agi'] = '128',
                        },
                        ['6'] = {
                            ['armor'] = '32',
                            ['required_str'] = '63',
                            ['required_agi'] = '135',
                        },
                        ['7'] = {
                            ['armor'] = '35',
                            ['required_str'] = '65',
                            ['required_agi'] = '142',
                        },
                        ['8'] = {
                            ['armor'] = '38',
                            ['required_str'] = '68',
                            ['required_agi'] = '149',
                        },
                        ['9'] = {
                            ['armor'] = '41',
                            ['required_str'] = '71',
                            ['required_agi'] = '156',
                        },
                        ['10'] = {
                            ['armor'] = '45',
                            ['required_str'] = '74',
                            ['required_agi'] = '164',
                        },
                        ['11'] = {
                            ['armor'] = '50',
                            ['required_str'] = '76',
                            ['required_agi'] = '171',
                        },
                        ['12'] = {
                            ['armor'] = '56',
                            ['required_str'] = '79',
                            ['required_agi'] = '178',
                        },
                        ['13'] = {
                            ['armor'] = '63',
                            ['required_str'] = '82',
                            ['required_agi'] = '185',
                        },
                        ['14'] = {
                            ['armor'] = '71',
                            ['required_str'] = '84',
                            ['required_agi'] = '192',
                        },
                        ['15'] = {
                            ['armor'] = '80',
                            ['required_str'] = '87',
                            ['required_agi'] = '200',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Wind Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '6',
                            ['required_str'] = '43',
                            ['required_agi'] = '82',
                        },
                        ['1'] = {
                            ['armor'] = '9',
                            ['required_str'] = '46',
                            ['required_agi'] = '89',
                        },
                        ['2'] = {
                            ['armor'] = '12',
                            ['required_str'] = '48',
                            ['required_agi'] = '96',
                        },
                        ['3'] = {
                            ['armor'] = '15',
                            ['required_str'] = '51',
                            ['required_agi'] = '104',
                        },
                        ['4'] = {
                            ['armor'] = '18',
                            ['required_str'] = '54',
                            ['required_agi'] = '111',
                        },
                        ['5'] = {
                            ['armor'] = '21',
                            ['required_str'] = '56',
                            ['required_agi'] = '118',
                        },
                        ['6'] = {
                            ['armor'] = '24',
                            ['required_str'] = '59',
                            ['required_agi'] = '125',
                        },
                        ['7'] = {
                            ['armor'] = '27',
                            ['required_str'] = '62',
                            ['required_agi'] = '132',
                        },
                        ['8'] = {
                            ['armor'] = '30',
                            ['required_str'] = '65',
                            ['required_agi'] = '140',
                        },
                        ['9'] = {
                            ['armor'] = '33',
                            ['required_str'] = '67',
                            ['required_agi'] = '147',
                        },
                        ['10'] = {
                            ['armor'] = '37',
                            ['required_str'] = '70',
                            ['required_agi'] = '154',
                        },
                        ['11'] = {
                            ['armor'] = '42',
                            ['required_str'] = '73',
                            ['required_agi'] = '161',
                        },
                        ['12'] = {
                            ['armor'] = '48',
                            ['required_str'] = '75',
                            ['required_agi'] = '168',
                        },
                        ['13'] = {
                            ['armor'] = '55',
                            ['required_str'] = '78',
                            ['required_agi'] = '176',
                        },
                        ['14'] = {
                            ['armor'] = '63',
                            ['required_str'] = '81',
                            ['required_agi'] = '183',
                        },
                        ['15'] = {
                            ['armor'] = '72',
                            ['required_str'] = '83',
                            ['required_agi'] = '190',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Wind Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '19',
                            ['required_str'] = '51',
                            ['required_agi'] = '104',
                        },
                        ['1'] = {
                            ['armor'] = '22',
                            ['required_str'] = '54',
                            ['required_agi'] = '111',
                        },
                        ['2'] = {
                            ['armor'] = '25',
                            ['required_str'] = '56',
                            ['required_agi'] = '118',
                        },
                        ['3'] = {
                            ['armor'] = '28',
                            ['required_str'] = '59',
                            ['required_agi'] = '125',
                        },
                        ['4'] = {
                            ['armor'] = '31',
                            ['required_str'] = '62',
                            ['required_agi'] = '132',
                        },
                        ['5'] = {
                            ['armor'] = '34',
                            ['required_str'] = '65',
                            ['required_agi'] = '140',
                        },
                        ['6'] = {
                            ['armor'] = '37',
                            ['required_str'] = '67',
                            ['required_agi'] = '147',
                        },
                        ['7'] = {
                            ['armor'] = '40',
                            ['required_str'] = '70',
                            ['required_agi'] = '154',
                        },
                        ['8'] = {
                            ['armor'] = '43',
                            ['required_str'] = '73',
                            ['required_agi'] = '161',
                        },
                        ['9'] = {
                            ['armor'] = '47',
                            ['required_str'] = '75',
                            ['required_agi'] = '168',
                        },
                        ['10'] = {
                            ['armor'] = '52',
                            ['required_str'] = '78',
                            ['required_agi'] = '176',
                        },
                        ['11'] = {
                            ['armor'] = '58',
                            ['required_str'] = '81',
                            ['required_agi'] = '183',
                        },
                        ['12'] = {
                            ['armor'] = '65',
                            ['required_str'] = '83',
                            ['required_agi'] = '190',
                        },
                        ['13'] = {
                            ['armor'] = '73',
                            ['required_str'] = '86',
                            ['required_agi'] = '197',
                        },
                        ['14'] = {
                            ['armor'] = '82',
                            ['required_str'] = '89',
                            ['required_agi'] = '204',
                        },
                        ['15'] = {
                            ['armor'] = '91',
                            ['required_str'] = '92',
                            ['required_agi'] = '210',
                        },
                    },
                },
            },
            ['class'] = {
                'buffer',
                'assassin',
            },
        },
        ['Spirit'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Spirit Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '16',
                            ['required_str'] = '68',
                            ['required_agi'] = '116',
                        },
                        ['1'] = {
                            ['armor'] = '19',
                            ['required_str'] = '71',
                            ['required_agi'] = '123',
                        },
                        ['2'] = {
                            ['armor'] = '22',
                            ['required_str'] = '75',
                            ['required_agi'] = '130',
                        },
                        ['3'] = {
                            ['armor'] = '25',
                            ['required_str'] = '78',
                            ['required_agi'] = '137',
                        },
                        ['4'] = {
                            ['armor'] = '28',
                            ['required_str'] = '82',
                            ['required_agi'] = '144',
                        },
                        ['5'] = {
                            ['armor'] = '31',
                            ['required_str'] = '86',
                            ['required_agi'] = '152',
                        },
                        ['6'] = {
                            ['armor'] = '34',
                            ['required_str'] = '89',
                            ['required_agi'] = '159',
                        },
                        ['7'] = {
                            ['armor'] = '37',
                            ['required_str'] = '93',
                            ['required_agi'] = '166',
                        },
                        ['8'] = {
                            ['armor'] = '40',
                            ['required_str'] = '96',
                            ['required_agi'] = '173',
                        },
                        ['9'] = {
                            ['armor'] = '43',
                            ['required_str'] = '100',
                            ['required_agi'] = '180',
                        },
                        ['10'] = {
                            ['armor'] = '47',
                            ['required_str'] = '104',
                            ['required_agi'] = '188',
                        },
                        ['11'] = {
                            ['armor'] = '52',
                            ['required_str'] = '107',
                            ['required_agi'] = '195',
                        },
                        ['12'] = {
                            ['armor'] = '58',
                            ['required_str'] = '111',
                            ['required_agi'] = '202',
                        },
                        ['13'] = {
                            ['armor'] = '65',
                            ['required_str'] = '114',
                            ['required_agi'] = '209',
                        },
                        ['14'] = {
                            ['armor'] = '73',
                            ['required_str'] = '118',
                            ['required_agi'] = '216',
                        },
                        ['15'] = {
                            ['armor'] = '82',
                            ['required_str'] = '122',
                            ['required_agi'] = '224',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Spirit Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '21',
                            ['required_str'] = '72',
                            ['required_agi'] = '125',
                        },
                        ['1'] = {
                            ['armor'] = '24',
                            ['required_str'] = '76',
                            ['required_agi'] = '132',
                        },
                        ['2'] = {
                            ['armor'] = '27',
                            ['required_str'] = '80',
                            ['required_agi'] = '140',
                        },
                        ['3'] = {
                            ['armor'] = '30',
                            ['required_str'] = '83',
                            ['required_agi'] = '147',
                        },
                        ['4'] = {
                            ['armor'] = '33',
                            ['required_str'] = '87',
                            ['required_agi'] = '154',
                        },
                        ['5'] = {
                            ['armor'] = '36',
                            ['required_str'] = '90',
                            ['required_agi'] = '161',
                        },
                        ['6'] = {
                            ['armor'] = '39',
                            ['required_str'] = '94',
                            ['required_agi'] = '168',
                        },
                        ['7'] = {
                            ['armor'] = '42',
                            ['required_str'] = '98',
                            ['required_agi'] = '176',
                        },
                        ['8'] = {
                            ['armor'] = '45',
                            ['required_str'] = '101',
                            ['required_agi'] = '183',
                        },
                        ['9'] = {
                            ['armor'] = '48',
                            ['required_str'] = '105',
                            ['required_agi'] = '190',
                        },
                        ['10'] = {
                            ['armor'] = '52',
                            ['required_str'] = '108',
                            ['required_agi'] = '197',
                        },
                        ['11'] = {
                            ['armor'] = '57',
                            ['required_str'] = '112',
                            ['required_agi'] = '204',
                        },
                        ['12'] = {
                            ['armor'] = '63',
                            ['required_str'] = '116',
                            ['required_agi'] = '212',
                        },
                        ['13'] = {
                            ['armor'] = '70',
                            ['required_str'] = '119',
                            ['required_agi'] = '219',
                        },
                        ['14'] = {
                            ['armor'] = '78',
                            ['required_str'] = '123',
                            ['required_agi'] = '226',
                        },
                        ['15'] = {
                            ['armor'] = '87',
                            ['required_str'] = '126',
                            ['required_agi'] = '233',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Spirit Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '10',
                            ['required_str'] = '68',
                            ['required_agi'] = '116',
                        },
                        ['1'] = {
                            ['armor'] = '13',
                            ['required_str'] = '71',
                            ['required_agi'] = '123',
                        },
                        ['2'] = {
                            ['armor'] = '16',
                            ['required_str'] = '75',
                            ['required_agi'] = '130',
                        },
                        ['3'] = {
                            ['armor'] = '19',
                            ['required_str'] = '78',
                            ['required_agi'] = '137',
                        },
                        ['4'] = {
                            ['armor'] = '22',
                            ['required_str'] = '82',
                            ['required_agi'] = '144',
                        },
                        ['5'] = {
                            ['armor'] = '25',
                            ['required_str'] = '86',
                            ['required_agi'] = '152',
                        },
                        ['6'] = {
                            ['armor'] = '28',
                            ['required_str'] = '89',
                            ['required_agi'] = '159',
                        },
                        ['7'] = {
                            ['armor'] = '31',
                            ['required_str'] = '93',
                            ['required_agi'] = '166',
                        },
                        ['8'] = {
                            ['armor'] = '34',
                            ['required_str'] = '96',
                            ['required_agi'] = '173',
                        },
                        ['9'] = {
                            ['armor'] = '37',
                            ['required_str'] = '100',
                            ['required_agi'] = '180',
                        },
                        ['10'] = {
                            ['armor'] = '41',
                            ['required_str'] = '104',
                            ['required_agi'] = '188',
                        },
                        ['11'] = {
                            ['armor'] = '46',
                            ['required_str'] = '107',
                            ['required_agi'] = '195',
                        },
                        ['12'] = {
                            ['armor'] = '52',
                            ['required_str'] = '111',
                            ['required_agi'] = '202',
                        },
                        ['13'] = {
                            ['armor'] = '59',
                            ['required_str'] = '114',
                            ['required_agi'] = '209',
                        },
                        ['14'] = {
                            ['armor'] = '67',
                            ['required_str'] = '118',
                            ['required_agi'] = '216',
                        },
                        ['15'] = {
                            ['armor'] = '76',
                            ['required_str'] = '122',
                            ['required_agi'] = '224',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Spirit Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '18',
                            ['required_str'] = '70',
                            ['required_agi'] = '120',
                        },
                        ['1'] = {
                            ['armor'] = '21',
                            ['required_str'] = '74',
                            ['required_agi'] = '128',
                        },
                        ['2'] = {
                            ['armor'] = '24',
                            ['required_str'] = '77',
                            ['required_agi'] = '135',
                        },
                        ['3'] = {
                            ['armor'] = '27',
                            ['required_str'] = '81',
                            ['required_agi'] = '142',
                        },
                        ['4'] = {
                            ['armor'] = '30',
                            ['required_str'] = '84',
                            ['required_agi'] = '149',
                        },
                        ['5'] = {
                            ['armor'] = '33',
                            ['required_str'] = '88',
                            ['required_agi'] = '156',
                        },
                        ['6'] = {
                            ['armor'] = '36',
                            ['required_str'] = '92',
                            ['required_agi'] = '164',
                        },
                        ['7'] = {
                            ['armor'] = '39',
                            ['required_str'] = '95',
                            ['required_agi'] = '171',
                        },
                        ['8'] = {
                            ['armor'] = '42',
                            ['required_str'] = '99',
                            ['required_agi'] = '178',
                        },
                        ['9'] = {
                            ['armor'] = '45',
                            ['required_str'] = '102',
                            ['required_agi'] = '185',
                        },
                        ['10'] = {
                            ['armor'] = '49',
                            ['required_str'] = '106',
                            ['required_agi'] = '192',
                        },
                        ['11'] = {
                            ['armor'] = '54',
                            ['required_str'] = '110',
                            ['required_agi'] = '200',
                        },
                        ['12'] = {
                            ['armor'] = '60',
                            ['required_str'] = '113',
                            ['required_agi'] = '207',
                        },
                        ['13'] = {
                            ['armor'] = '67',
                            ['required_str'] = '117',
                            ['required_agi'] = '214',
                        },
                        ['14'] = {
                            ['armor'] = '75',
                            ['required_str'] = '120',
                            ['required_agi'] = '221',
                        },
                        ['15'] = {
                            ['armor'] = '84',
                            ['required_str'] = '124',
                            ['required_agi'] = '228',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Spirit Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '9',
                            ['required_str'] = '65',
                            ['required_agi'] = '111',
                        },
                        ['1'] = {
                            ['armor'] = '12',
                            ['required_str'] = '69',
                            ['required_agi'] = '118',
                        },
                        ['2'] = {
                            ['armor'] = '15',
                            ['required_str'] = '72',
                            ['required_agi'] = '125',
                        },
                        ['3'] = {
                            ['armor'] = '18',
                            ['required_str'] = '76',
                            ['required_agi'] = '132',
                        },
                        ['4'] = {
                            ['armor'] = '21',
                            ['required_str'] = '80',
                            ['required_agi'] = '140',
                        },
                        ['5'] = {
                            ['armor'] = '24',
                            ['required_str'] = '83',
                            ['required_agi'] = '147',
                        },
                        ['6'] = {
                            ['armor'] = '27',
                            ['required_str'] = '87',
                            ['required_agi'] = '154',
                        },
                        ['7'] = {
                            ['armor'] = '30',
                            ['required_str'] = '90',
                            ['required_agi'] = '161',
                        },
                        ['8'] = {
                            ['armor'] = '33',
                            ['required_str'] = '94',
                            ['required_agi'] = '168',
                        },
                        ['9'] = {
                            ['armor'] = '36',
                            ['required_str'] = '98',
                            ['required_agi'] = '176',
                        },
                        ['10'] = {
                            ['armor'] = '40',
                            ['required_str'] = '101',
                            ['required_agi'] = '183',
                        },
                        ['11'] = {
                            ['armor'] = '45',
                            ['required_str'] = '105',
                            ['required_agi'] = '190',
                        },
                        ['12'] = {
                            ['armor'] = '51',
                            ['required_str'] = '108',
                            ['required_agi'] = '197',
                        },
                        ['13'] = {
                            ['armor'] = '58',
                            ['required_str'] = '112',
                            ['required_agi'] = '204',
                        },
                        ['14'] = {
                            ['armor'] = '66',
                            ['required_str'] = '116',
                            ['required_agi'] = '212',
                        },
                        ['15'] = {
                            ['armor'] = '75',
                            ['required_str'] = '119',
                            ['required_agi'] = '219',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Spirit Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '24',
                            ['required_str'] = '76',
                            ['required_agi'] = '132',
                        },
                        ['1'] = {
                            ['armor'] = '27',
                            ['required_str'] = '80',
                            ['required_agi'] = '140',
                        },
                        ['2'] = {
                            ['armor'] = '30',
                            ['required_str'] = '83',
                            ['required_agi'] = '147',
                        },
                        ['3'] = {
                            ['armor'] = '33',
                            ['required_str'] = '87',
                            ['required_agi'] = '154',
                        },
                        ['4'] = {
                            ['armor'] = '36',
                            ['required_str'] = '90',
                            ['required_agi'] = '161',
                        },
                        ['5'] = {
                            ['armor'] = '39',
                            ['required_str'] = '94',
                            ['required_agi'] = '168',
                        },
                        ['6'] = {
                            ['armor'] = '42',
                            ['required_str'] = '98',
                            ['required_agi'] = '176',
                        },
                        ['7'] = {
                            ['armor'] = '45',
                            ['required_str'] = '101',
                            ['required_agi'] = '183',
                        },
                        ['8'] = {
                            ['armor'] = '48',
                            ['required_str'] = '105',
                            ['required_agi'] = '190',
                        },
                        ['9'] = {
                            ['armor'] = '52',
                            ['required_str'] = '108',
                            ['required_agi'] = '197',
                        },
                        ['10'] = {
                            ['armor'] = '57',
                            ['required_str'] = '112',
                            ['required_agi'] = '204',
                        },
                        ['11'] = {
                            ['armor'] = '63',
                            ['required_str'] = '116',
                            ['required_agi'] = '212',
                        },
                        ['12'] = {
                            ['armor'] = '70',
                            ['required_str'] = '119',
                            ['required_agi'] = '219',
                        },
                        ['13'] = {
                            ['armor'] = '78',
                            ['required_str'] = '123',
                            ['required_agi'] = '226',
                        },
                        ['14'] = {
                            ['armor'] = '87',
                            ['required_str'] = '126',
                            ['required_agi'] = '233',
                        },
                        ['15'] = {
                            ['armor'] = '96',
                            ['required_str'] = '130',
                            ['required_agi'] = '241',
                        },
                    },
                },
            },
            ['class'] = {
                'buffer',
                'assassin',
            },
        },
        ['Guardian'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Guardian Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '23',
                            ['required_str'] = '83',
                            ['required_agi'] = '147',
                        },
                        ['1'] = {
                            ['armor'] = '26',
                            ['required_str'] = '87',
                            ['required_agi'] = '154',
                        },
                        ['2'] = {
                            ['armor'] = '29',
                            ['required_str'] = '90',
                            ['required_agi'] = '161',
                        },
                        ['3'] = {
                            ['armor'] = '32',
                            ['required_str'] = '94',
                            ['required_agi'] = '168',
                        },
                        ['4'] = {
                            ['armor'] = '35',
                            ['required_str'] = '98',
                            ['required_agi'] = '176',
                        },
                        ['5'] = {
                            ['armor'] = '38',
                            ['required_str'] = '101',
                            ['required_agi'] = '183',
                        },
                        ['6'] = {
                            ['armor'] = '41',
                            ['required_str'] = '105',
                            ['required_agi'] = '190',
                        },
                        ['7'] = {
                            ['armor'] = '44',
                            ['required_str'] = '108',
                            ['required_agi'] = '197',
                        },
                        ['8'] = {
                            ['armor'] = '47',
                            ['required_str'] = '112',
                            ['required_agi'] = '204',
                        },
                        ['9'] = {
                            ['armor'] = '50',
                            ['required_str'] = '116',
                            ['required_agi'] = '212',
                        },
                        ['10'] = {
                            ['armor'] = '54',
                            ['required_str'] = '119',
                            ['required_agi'] = '219',
                        },
                        ['11'] = {
                            ['armor'] = '59',
                            ['required_str'] = '123',
                            ['required_agi'] = '226',
                        },
                        ['12'] = {
                            ['armor'] = '65',
                            ['required_str'] = '126',
                            ['required_agi'] = '233',
                        },
                        ['13'] = {
                            ['armor'] = '72',
                            ['required_str'] = '130',
                            ['required_agi'] = '240',
                        },
                        ['14'] = {
                            ['armor'] = '80',
                            ['required_str'] = '134',
                            ['required_agi'] = '248',
                        },
                        ['15'] = {
                            ['armor'] = '89',
                            ['required_str'] = '137',
                            ['required_agi'] = '255',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Guardian Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '29',
                            ['required_str'] = '88',
                            ['required_agi'] = '156',
                        },
                        ['1'] = {
                            ['armor'] = '32',
                            ['required_str'] = '92',
                            ['required_agi'] = '164',
                        },
                        ['2'] = {
                            ['armor'] = '35',
                            ['required_str'] = '95',
                            ['required_agi'] = '171',
                        },
                        ['3'] = {
                            ['armor'] = '38',
                            ['required_str'] = '99',
                            ['required_agi'] = '178',
                        },
                        ['4'] = {
                            ['armor'] = '41',
                            ['required_str'] = '102',
                            ['required_agi'] = '185',
                        },
                        ['5'] = {
                            ['armor'] = '44',
                            ['required_str'] = '106',
                            ['required_agi'] = '192',
                        },
                        ['6'] = {
                            ['armor'] = '47',
                            ['required_str'] = '110',
                            ['required_agi'] = '200',
                        },
                        ['7'] = {
                            ['armor'] = '50',
                            ['required_str'] = '113',
                            ['required_agi'] = '207',
                        },
                        ['8'] = {
                            ['armor'] = '53',
                            ['required_str'] = '117',
                            ['required_agi'] = '214',
                        },
                        ['9'] = {
                            ['armor'] = '56',
                            ['required_str'] = '120',
                            ['required_agi'] = '221',
                        },
                        ['10'] = {
                            ['armor'] = '60',
                            ['required_str'] = '124',
                            ['required_agi'] = '228',
                        },
                        ['11'] = {
                            ['armor'] = '65',
                            ['required_str'] = '128',
                            ['required_agi'] = '236',
                        },
                        ['12'] = {
                            ['armor'] = '71',
                            ['required_str'] = '131',
                            ['required_agi'] = '243',
                        },
                        ['13'] = {
                            ['armor'] = '78',
                            ['required_str'] = '135',
                            ['required_agi'] = '250',
                        },
                        ['14'] = {
                            ['armor'] = '86',
                            ['required_str'] = '138',
                            ['required_agi'] = '257',
                        },
                        ['15'] = {
                            ['armor'] = '95',
                            ['required_str'] = '142',
                            ['required_agi'] = '264',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Guardian Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '16',
                            ['required_str'] = '82',
                            ['required_agi'] = '144',
                        },
                        ['1'] = {
                            ['armor'] = '19',
                            ['required_str'] = '86',
                            ['required_agi'] = '152',
                        },
                        ['2'] = {
                            ['armor'] = '22',
                            ['required_str'] = '89',
                            ['required_agi'] = '159',
                        },
                        ['3'] = {
                            ['armor'] = '25',
                            ['required_str'] = '93',
                            ['required_agi'] = '166',
                        },
                        ['4'] = {
                            ['armor'] = '28',
                            ['required_str'] = '96',
                            ['required_agi'] = '173',
                        },
                        ['5'] = {
                            ['armor'] = '31',
                            ['required_str'] = '100',
                            ['required_agi'] = '180',
                        },
                        ['6'] = {
                            ['armor'] = '34',
                            ['required_str'] = '104',
                            ['required_agi'] = '188',
                        },
                        ['7'] = {
                            ['armor'] = '37',
                            ['required_str'] = '107',
                            ['required_agi'] = '195',
                        },
                        ['8'] = {
                            ['armor'] = '40',
                            ['required_str'] = '111',
                            ['required_agi'] = '202',
                        },
                        ['9'] = {
                            ['armor'] = '43',
                            ['required_str'] = '114',
                            ['required_agi'] = '209',
                        },
                        ['10'] = {
                            ['armor'] = '47',
                            ['required_str'] = '118',
                            ['required_agi'] = '216',
                        },
                        ['11'] = {
                            ['armor'] = '52',
                            ['required_str'] = '122',
                            ['required_agi'] = '224',
                        },
                        ['12'] = {
                            ['armor'] = '58',
                            ['required_str'] = '125',
                            ['required_agi'] = '231',
                        },
                        ['13'] = {
                            ['armor'] = '65',
                            ['required_str'] = '129',
                            ['required_agi'] = '238',
                        },
                        ['14'] = {
                            ['armor'] = '73',
                            ['required_str'] = '132',
                            ['required_agi'] = '245',
                        },
                        ['15'] = {
                            ['armor'] = '82',
                            ['required_str'] = '136',
                            ['required_agi'] = '252',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Guardian Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '25',
                            ['required_str'] = '84',
                            ['required_agi'] = '149',
                        },
                        ['1'] = {
                            ['armor'] = '28',
                            ['required_str'] = '88',
                            ['required_agi'] = '156',
                        },
                        ['2'] = {
                            ['armor'] = '31',
                            ['required_str'] = '92',
                            ['required_agi'] = '164',
                        },
                        ['3'] = {
                            ['armor'] = '34',
                            ['required_str'] = '95',
                            ['required_agi'] = '171',
                        },
                        ['4'] = {
                            ['armor'] = '37',
                            ['required_str'] = '99',
                            ['required_agi'] = '178',
                        },
                        ['5'] = {
                            ['armor'] = '40',
                            ['required_str'] = '102',
                            ['required_agi'] = '185',
                        },
                        ['6'] = {
                            ['armor'] = '43',
                            ['required_str'] = '106',
                            ['required_agi'] = '192',
                        },
                        ['7'] = {
                            ['armor'] = '46',
                            ['required_str'] = '110',
                            ['required_agi'] = '200',
                        },
                        ['8'] = {
                            ['armor'] = '49',
                            ['required_str'] = '113',
                            ['required_agi'] = '207',
                        },
                        ['9'] = {
                            ['armor'] = '52',
                            ['required_str'] = '117',
                            ['required_agi'] = '214',
                        },
                        ['10'] = {
                            ['armor'] = '56',
                            ['required_str'] = '120',
                            ['required_agi'] = '221',
                        },
                        ['11'] = {
                            ['armor'] = '61',
                            ['required_str'] = '124',
                            ['required_agi'] = '228',
                        },
                        ['12'] = {
                            ['armor'] = '67',
                            ['required_str'] = '128',
                            ['required_agi'] = '236',
                        },
                        ['13'] = {
                            ['armor'] = '74',
                            ['required_str'] = '131',
                            ['required_agi'] = '243',
                        },
                        ['14'] = {
                            ['armor'] = '82',
                            ['required_str'] = '135',
                            ['required_agi'] = '250',
                        },
                        ['15'] = {
                            ['armor'] = '91',
                            ['required_str'] = '138',
                            ['required_agi'] = '257',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Guardian Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '15',
                            ['required_str'] = '80',
                            ['required_agi'] = '140',
                        },
                        ['1'] = {
                            ['armor'] = '18',
                            ['required_str'] = '83',
                            ['required_agi'] = '147',
                        },
                        ['2'] = {
                            ['armor'] = '21',
                            ['required_str'] = '87',
                            ['required_agi'] = '154',
                        },
                        ['3'] = {
                            ['armor'] = '24',
                            ['required_str'] = '90',
                            ['required_agi'] = '161',
                        },
                        ['4'] = {
                            ['armor'] = '27',
                            ['required_str'] = '94',
                            ['required_agi'] = '168',
                        },
                        ['5'] = {
                            ['armor'] = '30',
                            ['required_str'] = '98',
                            ['required_agi'] = '176',
                        },
                        ['6'] = {
                            ['armor'] = '33',
                            ['required_str'] = '101',
                            ['required_agi'] = '183',
                        },
                        ['7'] = {
                            ['armor'] = '36',
                            ['required_str'] = '105',
                            ['required_agi'] = '190',
                        },
                        ['8'] = {
                            ['armor'] = '39',
                            ['required_str'] = '108',
                            ['required_agi'] = '197',
                        },
                        ['9'] = {
                            ['armor'] = '42',
                            ['required_str'] = '112',
                            ['required_agi'] = '204',
                        },
                        ['10'] = {
                            ['armor'] = '46',
                            ['required_str'] = '116',
                            ['required_agi'] = '212',
                        },
                        ['11'] = {
                            ['armor'] = '51',
                            ['required_str'] = '119',
                            ['required_agi'] = '219',
                        },
                        ['12'] = {
                            ['armor'] = '57',
                            ['required_str'] = '123',
                            ['required_agi'] = '226',
                        },
                        ['13'] = {
                            ['armor'] = '64',
                            ['required_str'] = '126',
                            ['required_agi'] = '233',
                        },
                        ['14'] = {
                            ['armor'] = '72',
                            ['required_str'] = '130',
                            ['required_agi'] = '240',
                        },
                        ['15'] = {
                            ['armor'] = '81',
                            ['required_str'] = '134',
                            ['required_agi'] = '248',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Guardian Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '30',
                            ['required_str'] = '191',
                            ['required_agi'] = '77',
                        },
                        ['1'] = {
                            ['armor'] = '33',
                            ['required_str'] = '196',
                            ['required_agi'] = '78',
                        },
                        ['2'] = {
                            ['armor'] = '36',
                            ['required_str'] = '201',
                            ['required_agi'] = '80',
                        },
                        ['3'] = {
                            ['armor'] = '39',
                            ['required_str'] = '206',
                            ['required_agi'] = '82',
                        },
                        ['4'] = {
                            ['armor'] = '42',
                            ['required_str'] = '211',
                            ['required_agi'] = '83',
                        },
                        ['5'] = {
                            ['armor'] = '45',
                            ['required_str'] = '216',
                            ['required_agi'] = '85',
                        },
                        ['6'] = {
                            ['armor'] = '48',
                            ['required_str'] = '220',
                            ['required_agi'] = '86',
                        },
                        ['7'] = {
                            ['armor'] = '51',
                            ['required_str'] = '225',
                            ['required_agi'] = '88',
                        },
                        ['8'] = {
                            ['armor'] = '54',
                            ['required_str'] = '230',
                            ['required_agi'] = '90',
                        },
                        ['9'] = {
                            ['armor'] = '57',
                            ['required_str'] = '235',
                            ['required_agi'] = '91',
                        },
                        ['10'] = {
                            ['armor'] = '61',
                            ['required_str'] = '240',
                            ['required_agi'] = '93',
                        },
                        ['11'] = {
                            ['armor'] = '66',
                            ['required_str'] = '245',
                            ['required_agi'] = '95',
                        },
                        ['12'] = {
                            ['armor'] = '72',
                            ['required_str'] = '250',
                            ['required_agi'] = '96',
                        },
                        ['13'] = {
                            ['armor'] = '79',
                            ['required_str'] = '254',
                            ['required_agi'] = '98',
                        },
                        ['14'] = {
                            ['armor'] = '87',
                            ['required_str'] = '259',
                            ['required_agi'] = '99',
                        },
                        ['15'] = {
                            ['armor'] = '96',
                            ['required_str'] = '264',
                            ['required_agi'] = '101',
                        },
                    },
                },
            },
            ['class'] = {
                'buffer',
                'assassin',
            },
        },
        ['Divine'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Divine Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '44',
                            ['required_str'] = '119',
                            ['required_agi'] = '110',
                        },
                        ['1'] = {
                            ['armor'] = '47',
                            ['required_str'] = '122',
                            ['required_agi'] = '113',
                        },
                        ['2'] = {
                            ['armor'] = '50',
                            ['required_str'] = '125',
                            ['required_agi'] = '115',
                        },
                        ['3'] = {
                            ['armor'] = '53',
                            ['required_str'] = '128',
                            ['required_agi'] = '118',
                        },
                        ['4'] = {
                            ['armor'] = '56',
                            ['required_str'] = '131',
                            ['required_agi'] = '120',
                        },
                        ['5'] = {
                            ['armor'] = '59',
                            ['required_str'] = '134',
                            ['required_agi'] = '123',
                        },
                        ['6'] = {
                            ['armor'] = '62',
                            ['required_str'] = '137',
                            ['required_agi'] = '126',
                        },
                        ['7'] = {
                            ['armor'] = '65',
                            ['required_str'] = '140',
                            ['required_agi'] = '128',
                        },
                        ['8'] = {
                            ['armor'] = '68',
                            ['required_str'] = '142',
                            ['required_agi'] = '131',
                        },
                        ['9'] = {
                            ['armor'] = '71',
                            ['required_str'] = '145',
                            ['required_agi'] = '133',
                        },
                        ['10'] = {
                            ['armor'] = '75',
                            ['required_str'] = '148',
                            ['required_agi'] = '136',
                        },
                        ['11'] = {
                            ['armor'] = '80',
                            ['required_str'] = '151',
                            ['required_agi'] = '139',
                        },
                        ['12'] = {
                            ['armor'] = '86',
                            ['required_str'] = '154',
                            ['required_agi'] = '141',
                        },
                        ['13'] = {
                            ['armor'] = '93',
                            ['required_str'] = '157',
                            ['required_agi'] = '144',
                        },
                        ['14'] = {
                            ['armor'] = '101',
                            ['required_str'] = '160',
                            ['required_agi'] = '147',
                        },
                        ['15'] = {
                            ['armor'] = '110',
                            ['required_str'] = '163',
                            ['required_agi'] = '149',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Divine Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '52',
                            ['required_str'] = '137',
                            ['required_agi'] = '126',
                        },
                        ['1'] = {
                            ['armor'] = '55',
                            ['required_str'] = '140',
                            ['required_agi'] = '128',
                        },
                        ['2'] = {
                            ['armor'] = '58',
                            ['required_str'] = '142',
                            ['required_agi'] = '131',
                        },
                        ['3'] = {
                            ['armor'] = '61',
                            ['required_str'] = '145',
                            ['required_agi'] = '133',
                        },
                        ['4'] = {
                            ['armor'] = '64',
                            ['required_str'] = '148',
                            ['required_agi'] = '136',
                        },
                        ['5'] = {
                            ['armor'] = '67',
                            ['required_str'] = '151',
                            ['required_agi'] = '139',
                        },
                        ['6'] = {
                            ['armor'] = '70',
                            ['required_str'] = '154',
                            ['required_agi'] = '141',
                        },
                        ['7'] = {
                            ['armor'] = '73',
                            ['required_str'] = '157',
                            ['required_agi'] = '144',
                        },
                        ['8'] = {
                            ['armor'] = '76',
                            ['required_str'] = '160',
                            ['required_agi'] = '147',
                        },
                        ['9'] = {
                            ['armor'] = '79',
                            ['required_str'] = '163',
                            ['required_agi'] = '149',
                        },
                        ['10'] = {
                            ['armor'] = '83',
                            ['required_str'] = '165',
                            ['required_agi'] = '152',
                        },
                        ['11'] = {
                            ['armor'] = '88',
                            ['required_str'] = '168',
                            ['required_agi'] = '154',
                        },
                        ['12'] = {
                            ['armor'] = '94',
                            ['required_str'] = '171',
                            ['required_agi'] = '157',
                        },
                        ['13'] = {
                            ['armor'] = '101',
                            ['required_str'] = '174',
                            ['required_agi'] = '160',
                        },
                        ['14'] = {
                            ['armor'] = '109',
                            ['required_str'] = '177',
                            ['required_agi'] = '162',
                        },
                        ['15'] = {
                            ['armor'] = '118',
                            ['required_str'] = '180',
                            ['required_agi'] = '165',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Divine Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '35',
                            ['required_str'] = '108',
                            ['required_agi'] = '100',
                        },
                        ['1'] = {
                            ['armor'] = '38',
                            ['required_str'] = '111',
                            ['required_agi'] = '102',
                        },
                        ['2'] = {
                            ['armor'] = '41',
                            ['required_str'] = '114',
                            ['required_agi'] = '105',
                        },
                        ['3'] = {
                            ['armor'] = '44',
                            ['required_str'] = '116',
                            ['required_agi'] = '107',
                        },
                        ['4'] = {
                            ['armor'] = '47',
                            ['required_str'] = '119',
                            ['required_agi'] = '110',
                        },
                        ['5'] = {
                            ['armor'] = '50',
                            ['required_str'] = '122',
                            ['required_agi'] = '113',
                        },
                        ['6'] = {
                            ['armor'] = '53',
                            ['required_str'] = '125',
                            ['required_agi'] = '115',
                        },
                        ['7'] = {
                            ['armor'] = '56',
                            ['required_str'] = '128',
                            ['required_agi'] = '118',
                        },
                        ['8'] = {
                            ['armor'] = '59',
                            ['required_str'] = '131',
                            ['required_agi'] = '120',
                        },
                        ['9'] = {
                            ['armor'] = '62',
                            ['required_str'] = '134',
                            ['required_agi'] = '123',
                        },
                        ['10'] = {
                            ['armor'] = '66',
                            ['required_str'] = '137',
                            ['required_agi'] = '126',
                        },
                        ['11'] = {
                            ['armor'] = '71',
                            ['required_str'] = '140',
                            ['required_agi'] = '128',
                        },
                        ['12'] = {
                            ['armor'] = '77',
                            ['required_str'] = '142',
                            ['required_agi'] = '131',
                        },
                        ['13'] = {
                            ['armor'] = '84',
                            ['required_str'] = '145',
                            ['required_agi'] = '133',
                        },
                        ['14'] = {
                            ['armor'] = '92',
                            ['required_str'] = '148',
                            ['required_agi'] = '136',
                        },
                        ['15'] = {
                            ['armor'] = '101',
                            ['required_str'] = '151',
                            ['required_agi'] = '139',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Divine Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '46',
                            ['required_str'] = '124',
                            ['required_agi'] = '114',
                        },
                        ['1'] = {
                            ['armor'] = '49',
                            ['required_str'] = '127',
                            ['required_agi'] = '117',
                        },
                        ['2'] = {
                            ['armor'] = '52',
                            ['required_str'] = '130',
                            ['required_agi'] = '120',
                        },
                        ['3'] = {
                            ['armor'] = '55',
                            ['required_str'] = '133',
                            ['required_agi'] = '122',
                        },
                        ['4'] = {
                            ['armor'] = '58',
                            ['required_str'] = '136',
                            ['required_agi'] = '125',
                        },
                        ['5'] = {
                            ['armor'] = '61',
                            ['required_str'] = '139',
                            ['required_agi'] = '127',
                        },
                        ['6'] = {
                            ['armor'] = '64',
                            ['required_str'] = '141',
                            ['required_agi'] = '130',
                        },
                        ['7'] = {
                            ['armor'] = '67',
                            ['required_str'] = '144',
                            ['required_agi'] = '133',
                        },
                        ['8'] = {
                            ['armor'] = '70',
                            ['required_str'] = '147',
                            ['required_agi'] = '135',
                        },
                        ['9'] = {
                            ['armor'] = '73',
                            ['required_str'] = '150',
                            ['required_agi'] = '138',
                        },
                        ['10'] = {
                            ['armor'] = '77',
                            ['required_str'] = '153',
                            ['required_agi'] = '140',
                        },
                        ['11'] = {
                            ['armor'] = '82',
                            ['required_str'] = '156',
                            ['required_agi'] = '143',
                        },
                        ['12'] = {
                            ['armor'] = '88',
                            ['required_str'] = '159',
                            ['required_agi'] = '146',
                        },
                        ['13'] = {
                            ['armor'] = '95',
                            ['required_str'] = '162',
                            ['required_agi'] = '148',
                        },
                        ['14'] = {
                            ['armor'] = '103',
                            ['required_str'] = '164',
                            ['required_agi'] = '151',
                        },
                        ['15'] = {
                            ['armor'] = '112',
                            ['required_str'] = '167',
                            ['required_agi'] = '153',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Divine Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '36',
                            ['required_str'] = '111',
                            ['required_agi'] = '102',
                        },
                        ['1'] = {
                            ['armor'] = '39',
                            ['required_str'] = '114',
                            ['required_agi'] = '105',
                        },
                        ['2'] = {
                            ['armor'] = '42',
                            ['required_str'] = '116',
                            ['required_agi'] = '107',
                        },
                        ['3'] = {
                            ['armor'] = '45',
                            ['required_str'] = '119',
                            ['required_agi'] = '110',
                        },
                        ['4'] = {
                            ['armor'] = '48',
                            ['required_str'] = '122',
                            ['required_agi'] = '113',
                        },
                        ['5'] = {
                            ['armor'] = '51',
                            ['required_str'] = '125',
                            ['required_agi'] = '115',
                        },
                        ['6'] = {
                            ['armor'] = '54',
                            ['required_str'] = '128',
                            ['required_agi'] = '118',
                        },
                        ['7'] = {
                            ['armor'] = '57',
                            ['required_str'] = '131',
                            ['required_agi'] = '120',
                        },
                        ['8'] = {
                            ['armor'] = '60',
                            ['required_str'] = '134',
                            ['required_agi'] = '123',
                        },
                        ['9'] = {
                            ['armor'] = '63',
                            ['required_str'] = '137',
                            ['required_agi'] = '126',
                        },
                        ['10'] = {
                            ['armor'] = '67',
                            ['required_str'] = '140',
                            ['required_agi'] = '128',
                        },
                        ['11'] = {
                            ['armor'] = '72',
                            ['required_str'] = '142',
                            ['required_agi'] = '131',
                        },
                        ['12'] = {
                            ['armor'] = '78',
                            ['required_str'] = '145',
                            ['required_agi'] = '133',
                        },
                        ['13'] = {
                            ['armor'] = '85',
                            ['required_str'] = '148',
                            ['required_agi'] = '136',
                        },
                        ['14'] = {
                            ['armor'] = '93',
                            ['required_str'] = '151',
                            ['required_agi'] = '139',
                        },
                        ['15'] = {
                            ['armor'] = '102',
                            ['required_str'] = '154',
                            ['required_agi'] = '141',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Divine Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '55',
                            ['required_str'] = '140',
                            ['required_agi'] = '128',
                        },
                        ['1'] = {
                            ['armor'] = '58',
                            ['required_str'] = '142',
                            ['required_agi'] = '131',
                        },
                        ['2'] = {
                            ['armor'] = '61',
                            ['required_str'] = '145',
                            ['required_agi'] = '133',
                        },
                        ['3'] = {
                            ['armor'] = '64',
                            ['required_str'] = '148',
                            ['required_agi'] = '136',
                        },
                        ['4'] = {
                            ['armor'] = '67',
                            ['required_str'] = '151',
                            ['required_agi'] = '139',
                        },
                        ['5'] = {
                            ['armor'] = '70',
                            ['required_str'] = '154',
                            ['required_agi'] = '141',
                        },
                        ['6'] = {
                            ['armor'] = '73',
                            ['required_str'] = '157',
                            ['required_agi'] = '144',
                        },
                        ['7'] = {
                            ['armor'] = '76',
                            ['required_str'] = '160',
                            ['required_agi'] = '147',
                        },
                        ['8'] = {
                            ['armor'] = '79',
                            ['required_str'] = '163',
                            ['required_agi'] = '149',
                        },
                        ['9'] = {
                            ['armor'] = '83',
                            ['required_str'] = '165',
                            ['required_agi'] = '152',
                        },
                        ['10'] = {
                            ['armor'] = '88',
                            ['required_str'] = '168',
                            ['required_agi'] = '154',
                        },
                        ['11'] = {
                            ['armor'] = '94',
                            ['required_str'] = '171',
                            ['required_agi'] = '157',
                        },
                        ['12'] = {
                            ['armor'] = '101',
                            ['required_str'] = '174',
                            ['required_agi'] = '160',
                        },
                        ['13'] = {
                            ['armor'] = '109',
                            ['required_str'] = '177',
                            ['required_agi'] = '162',
                        },
                        ['14'] = {
                            ['armor'] = '118',
                            ['required_str'] = '180',
                            ['required_agi'] = '165',
                        },
                        ['15'] = {
                            ['armor'] = '127',
                            ['required_str'] = '184',
                            ['required_agi'] = '168',
                        },
                    },
                },
            },
            ['class'] = {
                'buffer',
                'assassin',
            },
        },
        ['Red Spirit'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Red Spirit Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '46',
                            ['required_str'] = '165',
                            ['required_agi'] = '340',
                        },
                        ['1'] = {
                            ['armor'] = '49',
                            ['required_str'] = '169',
                            ['required_agi'] = '351',
                        },
                        ['2'] = {
                            ['armor'] = '52',
                            ['required_str'] = '174',
                            ['required_agi'] = '361',
                        },
                        ['3'] = {
                            ['armor'] = '55',
                            ['required_str'] = '179',
                            ['required_agi'] = '371',
                        },
                        ['4'] = {
                            ['armor'] = '58',
                            ['required_str'] = '183',
                            ['required_agi'] = '382',
                        },
                        ['5'] = {
                            ['armor'] = '61',
                            ['required_str'] = '188',
                            ['required_agi'] = '392',
                        },
                        ['6'] = {
                            ['armor'] = '64',
                            ['required_str'] = '193',
                            ['required_agi'] = '402',
                        },
                        ['7'] = {
                            ['armor'] = '67',
                            ['required_str'] = '197',
                            ['required_agi'] = '413',
                        },
                        ['8'] = {
                            ['armor'] = '70',
                            ['required_str'] = '202',
                            ['required_agi'] = '423',
                        },
                        ['9'] = {
                            ['armor'] = '73',
                            ['required_str'] = '207',
                            ['required_agi'] = '434',
                        },
                        ['10'] = {
                            ['armor'] = '77',
                            ['required_str'] = '211',
                            ['required_agi'] = '444',
                        },
                        ['11'] = {
                            ['armor'] = '82',
                            ['required_str'] = '216',
                            ['required_agi'] = '454',
                        },
                        ['12'] = {
                            ['armor'] = '88',
                            ['required_str'] = '221',
                            ['required_agi'] = '465',
                        },
                        ['13'] = {
                            ['armor'] = '95',
                            ['required_str'] = '225',
                            ['required_agi'] = '475',
                        },
                        ['14'] = {
                            ['armor'] = '103',
                            ['required_str'] = '230',
                            ['required_agi'] = '485',
                        },
                        ['15'] = {
                            ['armor'] = '112',
                            ['required_str'] = '235',
                            ['required_agi'] = '496',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Red Spirit Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '55',
                            ['required_str'] = '190',
                            ['required_agi'] = '396',
                        },
                        ['1'] = {
                            ['armor'] = '58',
                            ['required_str'] = '194',
                            ['required_agi'] = '406',
                        },
                        ['2'] = {
                            ['armor'] = '61',
                            ['required_str'] = '199',
                            ['required_agi'] = '416',
                        },
                        ['3'] = {
                            ['armor'] = '64',
                            ['required_str'] = '204',
                            ['required_agi'] = '427',
                        },
                        ['4'] = {
                            ['armor'] = '67',
                            ['required_str'] = '208',
                            ['required_agi'] = '437',
                        },
                        ['5'] = {
                            ['armor'] = '70',
                            ['required_str'] = '213',
                            ['required_agi'] = '447',
                        },
                        ['6'] = {
                            ['armor'] = '73',
                            ['required_str'] = '218',
                            ['required_agi'] = '458',
                        },
                        ['7'] = {
                            ['armor'] = '76',
                            ['required_str'] = '222',
                            ['required_agi'] = '468',
                        },
                        ['8'] = {
                            ['armor'] = '79',
                            ['required_str'] = '227',
                            ['required_agi'] = '478',
                        },
                        ['9'] = {
                            ['armor'] = '82',
                            ['required_str'] = '232',
                            ['required_agi'] = '489',
                        },
                        ['10'] = {
                            ['armor'] = '86',
                            ['required_str'] = '236',
                            ['required_agi'] = '499',
                        },
                        ['11'] = {
                            ['armor'] = '91',
                            ['required_str'] = '241',
                            ['required_agi'] = '509',
                        },
                        ['12'] = {
                            ['armor'] = '97',
                            ['required_str'] = '246',
                            ['required_agi'] = '520',
                        },
                        ['13'] = {
                            ['armor'] = '104',
                            ['required_str'] = '250',
                            ['required_agi'] = '530',
                        },
                        ['14'] = {
                            ['armor'] = '112',
                            ['required_str'] = '255',
                            ['required_agi'] = '540',
                        },
                        ['15'] = {
                            ['armor'] = '121',
                            ['required_str'] = '260',
                            ['required_agi'] = '551',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Red Spirit Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '40',
                            ['required_str'] = '155',
                            ['required_agi'] = '320',
                        },
                        ['1'] = {
                            ['armor'] = '43',
                            ['required_str'] = '160',
                            ['required_agi'] = '330',
                        },
                        ['2'] = {
                            ['armor'] = '46',
                            ['required_str'] = '165',
                            ['required_agi'] = '340',
                        },
                        ['3'] = {
                            ['armor'] = '49',
                            ['required_str'] = '169',
                            ['required_agi'] = '351',
                        },
                        ['4'] = {
                            ['armor'] = '52',
                            ['required_str'] = '174',
                            ['required_agi'] = '361',
                        },
                        ['5'] = {
                            ['armor'] = '55',
                            ['required_str'] = '179',
                            ['required_agi'] = '371',
                        },
                        ['6'] = {
                            ['armor'] = '58',
                            ['required_str'] = '183',
                            ['required_agi'] = '382',
                        },
                        ['7'] = {
                            ['armor'] = '61',
                            ['required_str'] = '188',
                            ['required_agi'] = '392',
                        },
                        ['8'] = {
                            ['armor'] = '64',
                            ['required_str'] = '193',
                            ['required_agi'] = '402',
                        },
                        ['9'] = {
                            ['armor'] = '67',
                            ['required_str'] = '197',
                            ['required_agi'] = '413',
                        },
                        ['10'] = {
                            ['armor'] = '71',
                            ['required_str'] = '202',
                            ['required_agi'] = '423',
                        },
                        ['11'] = {
                            ['armor'] = '76',
                            ['required_str'] = '207',
                            ['required_agi'] = '434',
                        },
                        ['12'] = {
                            ['armor'] = '82',
                            ['required_str'] = '211',
                            ['required_agi'] = '444',
                        },
                        ['13'] = {
                            ['armor'] = '89',
                            ['required_str'] = '216',
                            ['required_agi'] = '454',
                        },
                        ['14'] = {
                            ['armor'] = '97',
                            ['required_str'] = '221',
                            ['required_agi'] = '465',
                        },
                        ['15'] = {
                            ['armor'] = '106',
                            ['required_str'] = '225',
                            ['required_agi'] = '475',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Red Spirit Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '48',
                            ['required_str'] = '176',
                            ['required_agi'] = '365',
                        },
                        ['1'] = {
                            ['armor'] = '51',
                            ['required_str'] = '180',
                            ['required_agi'] = '375',
                        },
                        ['2'] = {
                            ['armor'] = '54',
                            ['required_str'] = '185',
                            ['required_agi'] = '385',
                        },
                        ['3'] = {
                            ['armor'] = '57',
                            ['required_str'] = '190',
                            ['required_agi'] = '396',
                        },
                        ['4'] = {
                            ['armor'] = '60',
                            ['required_str'] = '194',
                            ['required_agi'] = '406',
                        },
                        ['5'] = {
                            ['armor'] = '63',
                            ['required_str'] = '199',
                            ['required_agi'] = '416',
                        },
                        ['6'] = {
                            ['armor'] = '66',
                            ['required_str'] = '204',
                            ['required_agi'] = '427',
                        },
                        ['7'] = {
                            ['armor'] = '69',
                            ['required_str'] = '208',
                            ['required_agi'] = '437',
                        },
                        ['8'] = {
                            ['armor'] = '72',
                            ['required_str'] = '213',
                            ['required_agi'] = '447',
                        },
                        ['9'] = {
                            ['armor'] = '75',
                            ['required_str'] = '218',
                            ['required_agi'] = '458',
                        },
                        ['10'] = {
                            ['armor'] = '79',
                            ['required_str'] = '222',
                            ['required_agi'] = '468',
                        },
                        ['11'] = {
                            ['armor'] = '84',
                            ['required_str'] = '227',
                            ['required_agi'] = '478',
                        },
                        ['12'] = {
                            ['armor'] = '90',
                            ['required_str'] = '232',
                            ['required_agi'] = '489',
                        },
                        ['13'] = {
                            ['armor'] = '97',
                            ['required_str'] = '236',
                            ['required_agi'] = '499',
                        },
                        ['14'] = {
                            ['armor'] = '105',
                            ['required_str'] = '241',
                            ['required_agi'] = '509',
                        },
                        ['15'] = {
                            ['armor'] = '114',
                            ['required_str'] = '246',
                            ['required_agi'] = '520',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Red Spirit Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '38',
                            ['required_str'] = '151',
                            ['required_agi'] = '309',
                        },
                        ['1'] = {
                            ['armor'] = '41',
                            ['required_str'] = '155',
                            ['required_agi'] = '320',
                        },
                        ['2'] = {
                            ['armor'] = '44',
                            ['required_str'] = '160',
                            ['required_agi'] = '330',
                        },
                        ['3'] = {
                            ['armor'] = '47',
                            ['required_str'] = '165',
                            ['required_agi'] = '340',
                        },
                        ['4'] = {
                            ['armor'] = '50',
                            ['required_str'] = '169',
                            ['required_agi'] = '351',
                        },
                        ['5'] = {
                            ['armor'] = '53',
                            ['required_str'] = '174',
                            ['required_agi'] = '361',
                        },
                        ['6'] = {
                            ['armor'] = '56',
                            ['required_str'] = '179',
                            ['required_agi'] = '371',
                        },
                        ['7'] = {
                            ['armor'] = '59',
                            ['required_str'] = '183',
                            ['required_agi'] = '382',
                        },
                        ['8'] = {
                            ['armor'] = '62',
                            ['required_str'] = '188',
                            ['required_agi'] = '392',
                        },
                        ['9'] = {
                            ['armor'] = '65',
                            ['required_str'] = '193',
                            ['required_agi'] = '402',
                        },
                        ['10'] = {
                            ['armor'] = '69',
                            ['required_str'] = '197',
                            ['required_agi'] = '413',
                        },
                        ['11'] = {
                            ['armor'] = '74',
                            ['required_str'] = '202',
                            ['required_agi'] = '423',
                        },
                        ['12'] = {
                            ['armor'] = '80',
                            ['required_str'] = '207',
                            ['required_agi'] = '434',
                        },
                        ['13'] = {
                            ['armor'] = '87',
                            ['required_str'] = '211',
                            ['required_agi'] = '444',
                        },
                        ['14'] = {
                            ['armor'] = '95',
                            ['required_str'] = '216',
                            ['required_agi'] = '454',
                        },
                        ['15'] = {
                            ['armor'] = '104',
                            ['required_str'] = '221',
                            ['required_agi'] = '465',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Red Spirit Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '58',
                            ['required_str'] = '194',
                            ['required_agi'] = '406',
                        },
                        ['1'] = {
                            ['armor'] = '61',
                            ['required_str'] = '199',
                            ['required_agi'] = '416',
                        },
                        ['2'] = {
                            ['armor'] = '64',
                            ['required_str'] = '204',
                            ['required_agi'] = '427',
                        },
                        ['3'] = {
                            ['armor'] = '67',
                            ['required_str'] = '208',
                            ['required_agi'] = '437',
                        },
                        ['4'] = {
                            ['armor'] = '70',
                            ['required_str'] = '213',
                            ['required_agi'] = '447',
                        },
                        ['5'] = {
                            ['armor'] = '73',
                            ['required_str'] = '218',
                            ['required_agi'] = '458',
                        },
                        ['6'] = {
                            ['armor'] = '76',
                            ['required_str'] = '222',
                            ['required_agi'] = '468',
                        },
                        ['7'] = {
                            ['armor'] = '79',
                            ['required_str'] = '227',
                            ['required_agi'] = '478',
                        },
                        ['8'] = {
                            ['armor'] = '82',
                            ['required_str'] = '232',
                            ['required_agi'] = '489',
                        },
                        ['9'] = {
                            ['armor'] = '86',
                            ['required_str'] = '236',
                            ['required_agi'] = '499',
                        },
                        ['10'] = {
                            ['armor'] = '91',
                            ['required_str'] = '241',
                            ['required_agi'] = '509',
                        },
                        ['11'] = {
                            ['armor'] = '97',
                            ['required_str'] = '246',
                            ['required_agi'] = '520',
                        },
                        ['12'] = {
                            ['armor'] = '104',
                            ['required_str'] = '250',
                            ['required_agi'] = '530',
                        },
                        ['13'] = {
                            ['armor'] = '112',
                            ['required_str'] = '255',
                            ['required_agi'] = '540',
                        },
                        ['14'] = {
                            ['armor'] = '121',
                            ['required_str'] = '260',
                            ['required_agi'] = '551',
                        },
                        ['15'] = {
                            ['armor'] = '130',
                            ['required_str'] = '264',
                            ['required_agi'] = '563',
                        },
                    },
                },
            },
            ['class'] = {
                'buffer',
                'assassin',
            },
        },
        ['Sylphid Ray'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Sylphid Ray Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '57',
                            ['required_str'] = '163',
                            ['required_agi'] = '322',
                        },
                        ['1'] = {
                            ['armor'] = '60',
                            ['required_str'] = '167',
                            ['required_agi'] = '329',
                        },
                        ['2'] = {
                            ['armor'] = '63',
                            ['required_str'] = '170',
                            ['required_agi'] = '336',
                        },
                        ['3'] = {
                            ['armor'] = '66',
                            ['required_str'] = '173',
                            ['required_agi'] = '344',
                        },
                        ['4'] = {
                            ['armor'] = '69',
                            ['required_str'] = '177',
                            ['required_agi'] = '351',
                        },
                        ['5'] = {
                            ['armor'] = '72',
                            ['required_str'] = '180',
                            ['required_agi'] = '358',
                        },
                        ['6'] = {
                            ['armor'] = '75',
                            ['required_str'] = '184',
                            ['required_agi'] = '365',
                        },
                        ['7'] = {
                            ['armor'] = '78',
                            ['required_str'] = '187',
                            ['required_agi'] = '372',
                        },
                        ['8'] = {
                            ['armor'] = '81',
                            ['required_str'] = '191',
                            ['required_agi'] = '380',
                        },
                        ['9'] = {
                            ['armor'] = '84',
                            ['required_str'] = '194',
                            ['required_agi'] = '387',
                        },
                        ['10'] = {
                            ['armor'] = '88',
                            ['required_str'] = '197',
                            ['required_agi'] = '394',
                        },
                        ['11'] = {
                            ['armor'] = '93',
                            ['required_str'] = '201',
                            ['required_agi'] = '401',
                        },
                        ['12'] = {
                            ['armor'] = '99',
                            ['required_str'] = '204',
                            ['required_agi'] = '408',
                        },
                        ['13'] = {
                            ['armor'] = '106',
                            ['required_str'] = '208',
                            ['required_agi'] = '416',
                        },
                        ['14'] = {
                            ['armor'] = '114',
                            ['required_str'] = '211',
                            ['required_agi'] = '423',
                        },
                        ['15'] = {
                            ['armor'] = '123',
                            ['required_str'] = '214',
                            ['required_agi'] = '430',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Sylphid Ray Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '68',
                            ['required_str'] = '186',
                            ['required_agi'] = '370',
                        },
                        ['1'] = {
                            ['armor'] = '71',
                            ['required_str'] = '189',
                            ['required_agi'] = '377',
                        },
                        ['2'] = {
                            ['armor'] = '74',
                            ['required_str'] = '193',
                            ['required_agi'] = '384',
                        },
                        ['3'] = {
                            ['armor'] = '77',
                            ['required_str'] = '196',
                            ['required_agi'] = '392',
                        },
                        ['4'] = {
                            ['armor'] = '80',
                            ['required_str'] = '200',
                            ['required_agi'] = '399',
                        },
                        ['5'] = {
                            ['armor'] = '83',
                            ['required_str'] = '203',
                            ['required_agi'] = '406',
                        },
                        ['6'] = {
                            ['armor'] = '86',
                            ['required_str'] = '206',
                            ['required_agi'] = '413',
                        },
                        ['7'] = {
                            ['armor'] = '89',
                            ['required_str'] = '210',
                            ['required_agi'] = '420',
                        },
                        ['8'] = {
                            ['armor'] = '92',
                            ['required_str'] = '213',
                            ['required_agi'] = '428',
                        },
                        ['9'] = {
                            ['armor'] = '95',
                            ['required_str'] = '217',
                            ['required_agi'] = '435',
                        },
                        ['10'] = {
                            ['armor'] = '99',
                            ['required_str'] = '220',
                            ['required_agi'] = '442',
                        },
                        ['11'] = {
                            ['armor'] = '104',
                            ['required_str'] = '224',
                            ['required_agi'] = '449',
                        },
                        ['12'] = {
                            ['armor'] = '110',
                            ['required_str'] = '227',
                            ['required_agi'] = '456',
                        },
                        ['13'] = {
                            ['armor'] = '117',
                            ['required_str'] = '230',
                            ['required_agi'] = '464',
                        },
                        ['14'] = {
                            ['armor'] = '125',
                            ['required_str'] = '234',
                            ['required_agi'] = '471',
                        },
                        ['15'] = {
                            ['armor'] = '134',
                            ['required_str'] = '237',
                            ['required_agi'] = '478',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Sylphid Ray Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '53',
                            ['required_str'] = '155',
                            ['required_agi'] = '305',
                        },
                        ['1'] = {
                            ['armor'] = '56',
                            ['required_str'] = '159',
                            ['required_agi'] = '312',
                        },
                        ['2'] = {
                            ['armor'] = '59',
                            ['required_str'] = '162',
                            ['required_agi'] = '320',
                        },
                        ['3'] = {
                            ['armor'] = '62',
                            ['required_str'] = '165',
                            ['required_agi'] = '327',
                        },
                        ['4'] = {
                            ['armor'] = '65',
                            ['required_str'] = '169',
                            ['required_agi'] = '334',
                        },
                        ['5'] = {
                            ['armor'] = '68',
                            ['required_str'] = '172',
                            ['required_agi'] = '341',
                        },
                        ['6'] = {
                            ['armor'] = '71',
                            ['required_str'] = '176',
                            ['required_agi'] = '348',
                        },
                        ['7'] = {
                            ['armor'] = '74',
                            ['required_str'] = '179',
                            ['required_agi'] = '356',
                        },
                        ['8'] = {
                            ['armor'] = '77',
                            ['required_str'] = '183',
                            ['required_agi'] = '363',
                        },
                        ['9'] = {
                            ['armor'] = '80',
                            ['required_str'] = '186',
                            ['required_agi'] = '370',
                        },
                        ['10'] = {
                            ['armor'] = '84',
                            ['required_str'] = '189',
                            ['required_agi'] = '377',
                        },
                        ['11'] = {
                            ['armor'] = '89',
                            ['required_str'] = '193',
                            ['required_agi'] = '384',
                        },
                        ['12'] = {
                            ['armor'] = '95',
                            ['required_str'] = '196',
                            ['required_agi'] = '392',
                        },
                        ['13'] = {
                            ['armor'] = '102',
                            ['required_str'] = '200',
                            ['required_agi'] = '399',
                        },
                        ['14'] = {
                            ['armor'] = '110',
                            ['required_str'] = '203',
                            ['required_agi'] = '406',
                        },
                        ['15'] = {
                            ['armor'] = '119',
                            ['required_str'] = '206',
                            ['required_agi'] = '413',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Sylphid Ray Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '61',
                            ['required_str'] = '173',
                            ['required_agi'] = '344',
                        },
                        ['1'] = {
                            ['armor'] = '64',
                            ['required_str'] = '177',
                            ['required_agi'] = '351',
                        },
                        ['2'] = {
                            ['armor'] = '67',
                            ['required_str'] = '180',
                            ['required_agi'] = '358',
                        },
                        ['3'] = {
                            ['armor'] = '70',
                            ['required_str'] = '184',
                            ['required_agi'] = '365',
                        },
                        ['4'] = {
                            ['armor'] = '73',
                            ['required_str'] = '187',
                            ['required_agi'] = '372',
                        },
                        ['5'] = {
                            ['armor'] = '76',
                            ['required_str'] = '191',
                            ['required_agi'] = '380',
                        },
                        ['6'] = {
                            ['armor'] = '79',
                            ['required_str'] = '194',
                            ['required_agi'] = '387',
                        },
                        ['7'] = {
                            ['armor'] = '82',
                            ['required_str'] = '197',
                            ['required_agi'] = '394',
                        },
                        ['8'] = {
                            ['armor'] = '85',
                            ['required_str'] = '201',
                            ['required_agi'] = '401',
                        },
                        ['9'] = {
                            ['armor'] = '88',
                            ['required_str'] = '204',
                            ['required_agi'] = '408',
                        },
                        ['10'] = {
                            ['armor'] = '92',
                            ['required_str'] = '208',
                            ['required_agi'] = '416',
                        },
                        ['11'] = {
                            ['armor'] = '97',
                            ['required_str'] = '211',
                            ['required_agi'] = '423',
                        },
                        ['12'] = {
                            ['armor'] = '103',
                            ['required_str'] = '214',
                            ['required_agi'] = '430',
                        },
                        ['13'] = {
                            ['armor'] = '110',
                            ['required_str'] = '218',
                            ['required_agi'] = '437',
                        },
                        ['14'] = {
                            ['armor'] = '118',
                            ['required_str'] = '221',
                            ['required_agi'] = '444',
                        },
                        ['15'] = {
                            ['armor'] = '127',
                            ['required_str'] = '225',
                            ['required_agi'] = '452',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Sylphid Ray Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '50',
                            ['required_str'] = '146',
                            ['required_agi'] = '286',
                        },
                        ['1'] = {
                            ['armor'] = '53',
                            ['required_str'] = '149',
                            ['required_agi'] = '293',
                        },
                        ['2'] = {
                            ['armor'] = '56',
                            ['required_str'] = '153',
                            ['required_agi'] = '300',
                        },
                        ['3'] = {
                            ['armor'] = '59',
                            ['required_str'] = '156',
                            ['required_agi'] = '308',
                        },
                        ['4'] = {
                            ['armor'] = '62',
                            ['required_str'] = '160',
                            ['required_agi'] = '315',
                        },
                        ['5'] = {
                            ['armor'] = '65',
                            ['required_str'] = '163',
                            ['required_agi'] = '322',
                        },
                        ['6'] = {
                            ['armor'] = '68',
                            ['required_str'] = '167',
                            ['required_agi'] = '329',
                        },
                        ['7'] = {
                            ['armor'] = '71',
                            ['required_str'] = '170',
                            ['required_agi'] = '336',
                        },
                        ['8'] = {
                            ['armor'] = '74',
                            ['required_str'] = '173',
                            ['required_agi'] = '344',
                        },
                        ['9'] = {
                            ['armor'] = '77',
                            ['required_str'] = '177',
                            ['required_agi'] = '351',
                        },
                        ['10'] = {
                            ['armor'] = '81',
                            ['required_str'] = '180',
                            ['required_agi'] = '358',
                        },
                        ['11'] = {
                            ['armor'] = '86',
                            ['required_str'] = '184',
                            ['required_agi'] = '365',
                        },
                        ['12'] = {
                            ['armor'] = '92',
                            ['required_str'] = '187',
                            ['required_agi'] = '372',
                        },
                        ['13'] = {
                            ['armor'] = '99',
                            ['required_str'] = '191',
                            ['required_agi'] = '380',
                        },
                        ['14'] = {
                            ['armor'] = '107',
                            ['required_str'] = '194',
                            ['required_agi'] = '387',
                        },
                        ['15'] = {
                            ['armor'] = '116',
                            ['required_str'] = '197',
                            ['required_agi'] = '394',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Sylphid Ray Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '71',
                            ['required_str'] = '189',
                            ['required_agi'] = '377',
                        },
                        ['1'] = {
                            ['armor'] = '74',
                            ['required_str'] = '193',
                            ['required_agi'] = '384',
                        },
                        ['2'] = {
                            ['armor'] = '77',
                            ['required_str'] = '196',
                            ['required_agi'] = '392',
                        },
                        ['3'] = {
                            ['armor'] = '80',
                            ['required_str'] = '200',
                            ['required_agi'] = '399',
                        },
                        ['4'] = {
                            ['armor'] = '83',
                            ['required_str'] = '203',
                            ['required_agi'] = '406',
                        },
                        ['5'] = {
                            ['armor'] = '86',
                            ['required_str'] = '206',
                            ['required_agi'] = '413',
                        },
                        ['6'] = {
                            ['armor'] = '89',
                            ['required_str'] = '210',
                            ['required_agi'] = '420',
                        },
                        ['7'] = {
                            ['armor'] = '92',
                            ['required_str'] = '213',
                            ['required_agi'] = '428',
                        },
                        ['8'] = {
                            ['armor'] = '95',
                            ['required_str'] = '217',
                            ['required_agi'] = '435',
                        },
                        ['9'] = {
                            ['armor'] = '99',
                            ['required_str'] = '220',
                            ['required_agi'] = '442',
                        },
                        ['10'] = {
                            ['armor'] = '104',
                            ['required_str'] = '224',
                            ['required_agi'] = '449',
                        },
                        ['11'] = {
                            ['armor'] = '110',
                            ['required_str'] = '227',
                            ['required_agi'] = '456',
                        },
                        ['12'] = {
                            ['armor'] = '117',
                            ['required_str'] = '230',
                            ['required_agi'] = '464',
                        },
                        ['13'] = {
                            ['armor'] = '125',
                            ['required_str'] = '234',
                            ['required_agi'] = '471',
                        },
                        ['14'] = {
                            ['armor'] = '134',
                            ['required_str'] = '237',
                            ['required_agi'] = '478',
                        },
                        ['15'] = {
                            ['armor'] = '143',
                            ['required_str'] = '240',
                            ['required_agi'] = '484',
                        },
                    },
                },
            },
            ['class'] = {
                'buffer',
                'assassin',
            },
        },
        ['Iris'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Iris Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '30',
                            ['required_str'] = '120',
                            ['required_agi'] = '160',
                        },
                        ['1'] = {
                            ['armor'] = '33',
                            ['required_str'] = '125',
                            ['required_agi'] = '167',
                        },
                        ['2'] = {
                            ['armor'] = '36',
                            ['required_str'] = '129',
                            ['required_agi'] = '173',
                        },
                        ['3'] = {
                            ['armor'] = '39',
                            ['required_str'] = '134',
                            ['required_agi'] = '179',
                        },
                        ['4'] = {
                            ['armor'] = '42',
                            ['required_str'] = '138',
                            ['required_agi'] = '185',
                        },
                        ['5'] = {
                            ['armor'] = '45',
                            ['required_str'] = '143',
                            ['required_agi'] = '192',
                        },
                        ['6'] = {
                            ['armor'] = '48',
                            ['required_str'] = '147',
                            ['required_agi'] = '198',
                        },
                        ['7'] = {
                            ['armor'] = '51',
                            ['required_str'] = '152',
                            ['required_agi'] = '204',
                        },
                        ['8'] = {
                            ['armor'] = '54',
                            ['required_str'] = '156',
                            ['required_agi'] = '211',
                        },
                        ['9'] = {
                            ['armor'] = '57',
                            ['required_str'] = '161',
                            ['required_agi'] = '217',
                        },
                        ['10'] = {
                            ['armor'] = '61',
                            ['required_str'] = '165',
                            ['required_agi'] = '223',
                        },
                        ['11'] = {
                            ['armor'] = '66',
                            ['required_str'] = '170',
                            ['required_agi'] = '230',
                        },
                        ['12'] = {
                            ['armor'] = '72',
                            ['required_str'] = '174',
                            ['required_agi'] = '236',
                        },
                        ['13'] = {
                            ['armor'] = '79',
                            ['required_str'] = '179',
                            ['required_agi'] = '242',
                        },
                        ['14'] = {
                            ['armor'] = '87',
                            ['required_str'] = '183',
                            ['required_agi'] = '248',
                        },
                        ['15'] = {
                            ['armor'] = '96',
                            ['required_str'] = '188',
                            ['required_agi'] = '255',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Iris Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '36',
                            ['required_str'] = '132',
                            ['required_agi'] = '177',
                        },
                        ['1'] = {
                            ['armor'] = '39',
                            ['required_str'] = '137',
                            ['required_agi'] = '183',
                        },
                        ['2'] = {
                            ['armor'] = '42',
                            ['required_str'] = '141',
                            ['required_agi'] = '190',
                        },
                        ['3'] = {
                            ['armor'] = '45',
                            ['required_str'] = '146',
                            ['required_agi'] = '196',
                        },
                        ['4'] = {
                            ['armor'] = '48',
                            ['required_str'] = '150',
                            ['required_agi'] = '202',
                        },
                        ['5'] = {
                            ['armor'] = '51',
                            ['required_str'] = '155',
                            ['required_agi'] = '209',
                        },
                        ['6'] = {
                            ['armor'] = '54',
                            ['required_str'] = '159',
                            ['required_agi'] = '215',
                        },
                        ['7'] = {
                            ['armor'] = '57',
                            ['required_str'] = '164',
                            ['required_agi'] = '221',
                        },
                        ['8'] = {
                            ['armor'] = '60',
                            ['required_str'] = '168',
                            ['required_agi'] = '227',
                        },
                        ['9'] = {
                            ['armor'] = '63',
                            ['required_str'] = '173',
                            ['required_agi'] = '234',
                        },
                        ['10'] = {
                            ['armor'] = '67',
                            ['required_str'] = '177',
                            ['required_agi'] = '240',
                        },
                        ['11'] = {
                            ['armor'] = '72',
                            ['required_str'] = '182',
                            ['required_agi'] = '246',
                        },
                        ['12'] = {
                            ['armor'] = '78',
                            ['required_str'] = '186',
                            ['required_agi'] = '253',
                        },
                        ['13'] = {
                            ['armor'] = '85',
                            ['required_str'] = '191',
                            ['required_agi'] = '259',
                        },
                        ['14'] = {
                            ['armor'] = '93',
                            ['required_str'] = '195',
                            ['required_agi'] = '265',
                        },
                        ['15'] = {
                            ['armor'] = '102',
                            ['required_str'] = '200',
                            ['required_agi'] = '272',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Iris Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '23',
                            ['required_str'] = '122',
                            ['required_agi'] = '162',
                        },
                        ['1'] = {
                            ['armor'] = '26',
                            ['required_str'] = '126',
                            ['required_agi'] = '169',
                        },
                        ['2'] = {
                            ['armor'] = '29',
                            ['required_str'] = '131',
                            ['required_agi'] = '175',
                        },
                        ['3'] = {
                            ['armor'] = '32',
                            ['required_str'] = '135',
                            ['required_agi'] = '181',
                        },
                        ['4'] = {
                            ['armor'] = '35',
                            ['required_str'] = '140',
                            ['required_agi'] = '188',
                        },
                        ['5'] = {
                            ['armor'] = '38',
                            ['required_str'] = '144',
                            ['required_agi'] = '194',
                        },
                        ['6'] = {
                            ['armor'] = '41',
                            ['required_str'] = '149',
                            ['required_agi'] = '200',
                        },
                        ['7'] = {
                            ['armor'] = '44',
                            ['required_str'] = '153',
                            ['required_agi'] = '206',
                        },
                        ['8'] = {
                            ['armor'] = '47',
                            ['required_str'] = '158',
                            ['required_agi'] = '213',
                        },
                        ['9'] = {
                            ['armor'] = '50',
                            ['required_str'] = '162',
                            ['required_agi'] = '219',
                        },
                        ['10'] = {
                            ['armor'] = '54',
                            ['required_str'] = '167',
                            ['required_agi'] = '225',
                        },
                        ['11'] = {
                            ['armor'] = '59',
                            ['required_str'] = '171',
                            ['required_agi'] = '232',
                        },
                        ['12'] = {
                            ['armor'] = '65',
                            ['required_str'] = '176',
                            ['required_agi'] = '238',
                        },
                        ['13'] = {
                            ['armor'] = '72',
                            ['required_str'] = '180',
                            ['required_agi'] = '244',
                        },
                        ['14'] = {
                            ['armor'] = '80',
                            ['required_str'] = '185',
                            ['required_agi'] = '251',
                        },
                        ['15'] = {
                            ['armor'] = '89',
                            ['required_str'] = '189',
                            ['required_agi'] = '257',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Iris Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '32',
                            ['required_str'] = '123',
                            ['required_agi'] = '164',
                        },
                        ['1'] = {
                            ['armor'] = '35',
                            ['required_str'] = '128',
                            ['required_agi'] = '171',
                        },
                        ['2'] = {
                            ['armor'] = '38',
                            ['required_str'] = '132',
                            ['required_agi'] = '177',
                        },
                        ['3'] = {
                            ['armor'] = '41',
                            ['required_str'] = '137',
                            ['required_agi'] = '183',
                        },
                        ['4'] = {
                            ['armor'] = '44',
                            ['required_str'] = '141',
                            ['required_agi'] = '190',
                        },
                        ['5'] = {
                            ['armor'] = '47',
                            ['required_str'] = '146',
                            ['required_agi'] = '196',
                        },
                        ['6'] = {
                            ['armor'] = '50',
                            ['required_str'] = '150',
                            ['required_agi'] = '202',
                        },
                        ['7'] = {
                            ['armor'] = '53',
                            ['required_str'] = '155',
                            ['required_agi'] = '209',
                        },
                        ['8'] = {
                            ['armor'] = '56',
                            ['required_str'] = '159',
                            ['required_agi'] = '215',
                        },
                        ['9'] = {
                            ['armor'] = '59',
                            ['required_str'] = '164',
                            ['required_agi'] = '221',
                        },
                        ['10'] = {
                            ['armor'] = '63',
                            ['required_str'] = '168',
                            ['required_agi'] = '227',
                        },
                        ['11'] = {
                            ['armor'] = '68',
                            ['required_str'] = '173',
                            ['required_agi'] = '234',
                        },
                        ['12'] = {
                            ['armor'] = '74',
                            ['required_str'] = '177',
                            ['required_agi'] = '240',
                        },
                        ['13'] = {
                            ['armor'] = '81',
                            ['required_str'] = '182',
                            ['required_agi'] = '246',
                        },
                        ['14'] = {
                            ['armor'] = '89',
                            ['required_str'] = '186',
                            ['required_agi'] = '253',
                        },
                        ['15'] = {
                            ['armor'] = '98',
                            ['required_str'] = '191',
                            ['required_agi'] = '259',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Iris Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '22',
                            ['required_str'] = '111',
                            ['required_agi'] = '148',
                        },
                        ['1'] = {
                            ['armor'] = '25',
                            ['required_str'] = '116',
                            ['required_agi'] = '154',
                        },
                        ['2'] = {
                            ['armor'] = '28',
                            ['required_str'] = '120',
                            ['required_agi'] = '160',
                        },
                        ['3'] = {
                            ['armor'] = '31',
                            ['required_str'] = '125',
                            ['required_agi'] = '167',
                        },
                        ['4'] = {
                            ['armor'] = '34',
                            ['required_str'] = '129',
                            ['required_agi'] = '173',
                        },
                        ['5'] = {
                            ['armor'] = '37',
                            ['required_str'] = '134',
                            ['required_agi'] = '179',
                        },
                        ['6'] = {
                            ['armor'] = '40',
                            ['required_str'] = '138',
                            ['required_agi'] = '185',
                        },
                        ['7'] = {
                            ['armor'] = '43',
                            ['required_str'] = '143',
                            ['required_agi'] = '192',
                        },
                        ['8'] = {
                            ['armor'] = '46',
                            ['required_str'] = '147',
                            ['required_agi'] = '198',
                        },
                        ['9'] = {
                            ['armor'] = '49',
                            ['required_str'] = '152',
                            ['required_agi'] = '204',
                        },
                        ['10'] = {
                            ['armor'] = '53',
                            ['required_str'] = '156',
                            ['required_agi'] = '211',
                        },
                        ['11'] = {
                            ['armor'] = '58',
                            ['required_str'] = '161',
                            ['required_agi'] = '217',
                        },
                        ['12'] = {
                            ['armor'] = '64',
                            ['required_str'] = '165',
                            ['required_agi'] = '223',
                        },
                        ['13'] = {
                            ['armor'] = '71',
                            ['required_str'] = '170',
                            ['required_agi'] = '230',
                        },
                        ['14'] = {
                            ['armor'] = '79',
                            ['required_str'] = '174',
                            ['required_agi'] = '236',
                        },
                        ['15'] = {
                            ['armor'] = '88',
                            ['required_str'] = '179',
                            ['required_agi'] = '242',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Iris Shiled',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '39',
                            ['required_str'] = '137',
                            ['required_agi'] = '183',
                        },
                        ['1'] = {
                            ['armor'] = '42',
                            ['required_str'] = '141',
                            ['required_agi'] = '190',
                        },
                        ['2'] = {
                            ['armor'] = '45',
                            ['required_str'] = '146',
                            ['required_agi'] = '196',
                        },
                        ['3'] = {
                            ['armor'] = '48',
                            ['required_str'] = '150',
                            ['required_agi'] = '202',
                        },
                        ['4'] = {
                            ['armor'] = '51',
                            ['required_str'] = '155',
                            ['required_agi'] = '209',
                        },
                        ['5'] = {
                            ['armor'] = '54',
                            ['required_str'] = '159',
                            ['required_agi'] = '215',
                        },
                        ['6'] = {
                            ['armor'] = '57',
                            ['required_str'] = '164',
                            ['required_agi'] = '221',
                        },
                        ['7'] = {
                            ['armor'] = '60',
                            ['required_str'] = '168',
                            ['required_agi'] = '227',
                        },
                        ['8'] = {
                            ['armor'] = '63',
                            ['required_str'] = '173',
                            ['required_agi'] = '234',
                        },
                        ['9'] = {
                            ['armor'] = '67',
                            ['required_str'] = '177',
                            ['required_agi'] = '240',
                        },
                        ['10'] = {
                            ['armor'] = '72',
                            ['required_str'] = '182',
                            ['required_agi'] = '246',
                        },
                        ['11'] = {
                            ['armor'] = '78',
                            ['required_str'] = '186',
                            ['required_agi'] = '253',
                        },
                        ['12'] = {
                            ['armor'] = '85',
                            ['required_str'] = '191',
                            ['required_agi'] = '259',
                        },
                        ['13'] = {
                            ['armor'] = '93',
                            ['required_str'] = '195',
                            ['required_agi'] = '265',
                        },
                        ['14'] = {
                            ['armor'] = '102',
                            ['required_str'] = '200',
                            ['required_agi'] = '272',
                        },
                        ['15'] = {
                            ['armor'] = '111',
                            ['required_str'] = '205',
                            ['required_agi'] = '279',
                        },
                    },
                },
            },
            ['class'] = {
                'buffer',
                'assassin',
            },
        },
        ['Light Plate'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Light Plate Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '20',
                            ['required_str'] = '116',
                            ['required_agi'] = '47',
                        },
                        ['1'] = {
                            ['armor'] = '23',
                            ['required_str'] = '122',
                            ['required_agi'] = '49',
                        },
                        ['2'] = {
                            ['armor'] = '26',
                            ['required_str'] = '129',
                            ['required_agi'] = '51',
                        },
                        ['3'] = {
                            ['armor'] = '29',
                            ['required_str'] = '135',
                            ['required_agi'] = '53',
                        },
                        ['4'] = {
                            ['armor'] = '32',
                            ['required_str'] = '141',
                            ['required_agi'] = '54',
                        },
                        ['5'] = {
                            ['armor'] = '35',
                            ['required_str'] = '148',
                            ['required_agi'] = '56',
                        },
                        ['6'] = {
                            ['armor'] = '38',
                            ['required_str'] = '154',
                            ['required_agi'] = '58',
                        },
                        ['7'] = {
                            ['armor'] = '41',
                            ['required_str'] = '160',
                            ['required_agi'] = '60',
                        },
                        ['8'] = {
                            ['armor'] = '44',
                            ['required_str'] = '167',
                            ['required_agi'] = '62',
                        },
                        ['9'] = {
                            ['armor'] = '47',
                            ['required_str'] = '173',
                            ['required_agi'] = '63',
                        },
                        ['10'] = {
                            ['armor'] = '51',
                            ['required_str'] = '179',
                            ['required_agi'] = '65',
                        },
                        ['11'] = {
                            ['armor'] = '56',
                            ['required_str'] = '185',
                            ['required_agi'] = '67',
                        },
                        ['12'] = {
                            ['armor'] = '62',
                            ['required_str'] = '192',
                            ['required_agi'] = '69',
                        },
                        ['13'] = {
                            ['armor'] = '69',
                            ['required_str'] = '198',
                            ['required_agi'] = '71',
                        },
                        ['14'] = {
                            ['armor'] = '77',
                            ['required_str'] = '204',
                            ['required_agi'] = '72',
                        },
                        ['15'] = {
                            ['armor'] = '86',
                            ['required_str'] = '211',
                            ['required_agi'] = '74',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Light Plate Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '25',
                            ['required_str'] = '150',
                            ['required_agi'] = '57',
                        },
                        ['1'] = {
                            ['armor'] = '28',
                            ['required_str'] = '156',
                            ['required_agi'] = '59',
                        },
                        ['2'] = {
                            ['armor'] = '31',
                            ['required_str'] = '162',
                            ['required_agi'] = '60',
                        },
                        ['3'] = {
                            ['armor'] = '34',
                            ['required_str'] = '169',
                            ['required_agi'] = '62',
                        },
                        ['4'] = {
                            ['armor'] = '37',
                            ['required_str'] = '175',
                            ['required_agi'] = '64',
                        },
                        ['5'] = {
                            ['armor'] = '40',
                            ['required_str'] = '181',
                            ['required_agi'] = '66',
                        },
                        ['6'] = {
                            ['armor'] = '43',
                            ['required_str'] = '188',
                            ['required_agi'] = '68',
                        },
                        ['7'] = {
                            ['armor'] = '46',
                            ['required_str'] = '194',
                            ['required_agi'] = '69',
                        },
                        ['8'] = {
                            ['armor'] = '49',
                            ['required_str'] = '200',
                            ['required_agi'] = '71',
                        },
                        ['9'] = {
                            ['armor'] = '52',
                            ['required_str'] = '206',
                            ['required_agi'] = '73',
                        },
                        ['10'] = {
                            ['armor'] = '56',
                            ['required_str'] = '213',
                            ['required_agi'] = '75',
                        },
                        ['11'] = {
                            ['armor'] = '61',
                            ['required_str'] = '219',
                            ['required_agi'] = '77',
                        },
                        ['12'] = {
                            ['armor'] = '67',
                            ['required_str'] = '225',
                            ['required_agi'] = '78',
                        },
                        ['13'] = {
                            ['armor'] = '74',
                            ['required_str'] = '232',
                            ['required_agi'] = '80',
                        },
                        ['14'] = {
                            ['armor'] = '82',
                            ['required_str'] = '238',
                            ['required_agi'] = '82',
                        },
                        ['15'] = {
                            ['armor'] = '91',
                            ['required_str'] = '244',
                            ['required_agi'] = '84',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Light Plate Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '13',
                            ['required_str'] = '114',
                            ['required_agi'] = '47',
                        },
                        ['1'] = {
                            ['armor'] = '16',
                            ['required_str'] = '120',
                            ['required_agi'] = '48',
                        },
                        ['2'] = {
                            ['armor'] = '19',
                            ['required_str'] = '127',
                            ['required_agi'] = '50',
                        },
                        ['3'] = {
                            ['armor'] = '22',
                            ['required_str'] = '133',
                            ['required_agi'] = '52',
                        },
                        ['4'] = {
                            ['armor'] = '25',
                            ['required_str'] = '139',
                            ['required_agi'] = '54',
                        },
                        ['5'] = {
                            ['armor'] = '28',
                            ['required_str'] = '146',
                            ['required_agi'] = '56',
                        },
                        ['6'] = {
                            ['armor'] = '31',
                            ['required_str'] = '152',
                            ['required_agi'] = '57',
                        },
                        ['7'] = {
                            ['armor'] = '34',
                            ['required_str'] = '158',
                            ['required_agi'] = '59',
                        },
                        ['8'] = {
                            ['armor'] = '37',
                            ['required_str'] = '164',
                            ['required_agi'] = '61',
                        },
                        ['9'] = {
                            ['armor'] = '40',
                            ['required_str'] = '171',
                            ['required_agi'] = '63',
                        },
                        ['10'] = {
                            ['armor'] = '44',
                            ['required_str'] = '177',
                            ['required_agi'] = '65',
                        },
                        ['11'] = {
                            ['armor'] = '49',
                            ['required_str'] = '183',
                            ['required_agi'] = '66',
                        },
                        ['12'] = {
                            ['armor'] = '55',
                            ['required_str'] = '190',
                            ['required_agi'] = '68',
                        },
                        ['13'] = {
                            ['armor'] = '62',
                            ['required_str'] = '196',
                            ['required_agi'] = '70',
                        },
                        ['14'] = {
                            ['armor'] = '70',
                            ['required_str'] = '202',
                            ['required_agi'] = '72',
                        },
                        ['15'] = {
                            ['armor'] = '79',
                            ['required_str'] = '209',
                            ['required_agi'] = '74',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Light Plate Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '21',
                            ['required_str'] = '125',
                            ['required_agi'] = '50',
                        },
                        ['1'] = {
                            ['armor'] = '24',
                            ['required_str'] = '131',
                            ['required_agi'] = '51',
                        },
                        ['2'] = {
                            ['armor'] = '27',
                            ['required_str'] = '137',
                            ['required_agi'] = '53',
                        },
                        ['3'] = {
                            ['armor'] = '30',
                            ['required_str'] = '143',
                            ['required_agi'] = '55',
                        },
                        ['4'] = {
                            ['armor'] = '33',
                            ['required_str'] = '150',
                            ['required_agi'] = '57',
                        },
                        ['5'] = {
                            ['armor'] = '36',
                            ['required_str'] = '156',
                            ['required_agi'] = '59',
                        },
                        ['6'] = {
                            ['armor'] = '39',
                            ['required_str'] = '162',
                            ['required_agi'] = '60',
                        },
                        ['7'] = {
                            ['armor'] = '42',
                            ['required_str'] = '169',
                            ['required_agi'] = '62',
                        },
                        ['8'] = {
                            ['armor'] = '45',
                            ['required_str'] = '175',
                            ['required_agi'] = '64',
                        },
                        ['9'] = {
                            ['armor'] = '48',
                            ['required_str'] = '181',
                            ['required_agi'] = '66',
                        },
                        ['10'] = {
                            ['armor'] = '52',
                            ['required_str'] = '188',
                            ['required_agi'] = '68',
                        },
                        ['11'] = {
                            ['armor'] = '57',
                            ['required_str'] = '194',
                            ['required_agi'] = '69',
                        },
                        ['12'] = {
                            ['armor'] = '63',
                            ['required_str'] = '200',
                            ['required_agi'] = '71',
                        },
                        ['13'] = {
                            ['armor'] = '70',
                            ['required_str'] = '206',
                            ['required_agi'] = '73',
                        },
                        ['14'] = {
                            ['armor'] = '78',
                            ['required_str'] = '213',
                            ['required_agi'] = '75',
                        },
                        ['15'] = {
                            ['armor'] = '87',
                            ['required_str'] = '219',
                            ['required_agi'] = '77',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Light Plate Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '12',
                            ['required_str'] = '108',
                            ['required_agi'] = '45',
                        },
                        ['1'] = {
                            ['armor'] = '15',
                            ['required_str'] = '114',
                            ['required_agi'] = '47',
                        },
                        ['2'] = {
                            ['armor'] = '18',
                            ['required_str'] = '120',
                            ['required_agi'] = '48',
                        },
                        ['3'] = {
                            ['armor'] = '21',
                            ['required_str'] = '127',
                            ['required_agi'] = '50',
                        },
                        ['4'] = {
                            ['armor'] = '24',
                            ['required_str'] = '133',
                            ['required_agi'] = '52',
                        },
                        ['5'] = {
                            ['armor'] = '27',
                            ['required_str'] = '139',
                            ['required_agi'] = '54',
                        },
                        ['6'] = {
                            ['armor'] = '30',
                            ['required_str'] = '146',
                            ['required_agi'] = '56',
                        },
                        ['7'] = {
                            ['armor'] = '33',
                            ['required_str'] = '152',
                            ['required_agi'] = '57',
                        },
                        ['8'] = {
                            ['armor'] = '36',
                            ['required_str'] = '158',
                            ['required_agi'] = '59',
                        },
                        ['9'] = {
                            ['armor'] = '39',
                            ['required_str'] = '164',
                            ['required_agi'] = '61',
                        },
                        ['10'] = {
                            ['armor'] = '43',
                            ['required_str'] = '171',
                            ['required_agi'] = '63',
                        },
                        ['11'] = {
                            ['armor'] = '48',
                            ['required_str'] = '177',
                            ['required_agi'] = '65',
                        },
                        ['12'] = {
                            ['armor'] = '54',
                            ['required_str'] = '183',
                            ['required_agi'] = '66',
                        },
                        ['13'] = {
                            ['armor'] = '61',
                            ['required_str'] = '190',
                            ['required_agi'] = '68',
                        },
                        ['14'] = {
                            ['armor'] = '69',
                            ['required_str'] = '196',
                            ['required_agi'] = '70',
                        },
                        ['15'] = {
                            ['armor'] = '78',
                            ['required_str'] = '202',
                            ['required_agi'] = '72',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Light Plate Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '28',
                            ['required_str'] = '156',
                            ['required_agi'] = '59',
                        },
                        ['1'] = {
                            ['armor'] = '31',
                            ['required_str'] = '162',
                            ['required_agi'] = '60',
                        },
                        ['2'] = {
                            ['armor'] = '34',
                            ['required_str'] = '169',
                            ['required_agi'] = '62',
                        },
                        ['3'] = {
                            ['armor'] = '37',
                            ['required_str'] = '175',
                            ['required_agi'] = '64',
                        },
                        ['4'] = {
                            ['armor'] = '40',
                            ['required_str'] = '181',
                            ['required_agi'] = '66',
                        },
                        ['5'] = {
                            ['armor'] = '43',
                            ['required_str'] = '188',
                            ['required_agi'] = '68',
                        },
                        ['6'] = {
                            ['armor'] = '46',
                            ['required_str'] = '194',
                            ['required_agi'] = '69',
                        },
                        ['7'] = {
                            ['armor'] = '49',
                            ['required_str'] = '200',
                            ['required_agi'] = '71',
                        },
                        ['8'] = {
                            ['armor'] = '52',
                            ['required_str'] = '206',
                            ['required_agi'] = '73',
                        },
                        ['9'] = {
                            ['armor'] = '56',
                            ['required_str'] = '213',
                            ['required_agi'] = '75',
                        },
                        ['10'] = {
                            ['armor'] = '61',
                            ['required_str'] = '219',
                            ['required_agi'] = '77',
                        },
                        ['11'] = {
                            ['armor'] = '67',
                            ['required_str'] = '225',
                            ['required_agi'] = '78',
                        },
                        ['12'] = {
                            ['armor'] = '74',
                            ['required_str'] = '232',
                            ['required_agi'] = '80',
                        },
                        ['13'] = {
                            ['armor'] = '82',
                            ['required_str'] = '238',
                            ['required_agi'] = '82',
                        },
                        ['14'] = {
                            ['armor'] = '91',
                            ['required_str'] = '244',
                            ['required_agi'] = '84',
                        },
                        ['15'] = {
                            ['armor'] = '100',
                            ['required_str'] = '250',
                            ['required_agi'] = '86',
                        },
                    },
                },
            },
            ['class'] = {
                'summoner',
            },
        },
        ['Adamantine'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Adamantine Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '24',
                            ['required_str'] = '172',
                            ['required_agi'] = '61',
                        },
                        ['1'] = {
                            ['armor'] = '27',
                            ['required_str'] = '179',
                            ['required_agi'] = '63',
                        },
                        ['2'] = {
                            ['armor'] = '30',
                            ['required_str'] = '186',
                            ['required_agi'] = '65',
                        },
                        ['3'] = {
                            ['armor'] = '33',
                            ['required_str'] = '193',
                            ['required_agi'] = '67',
                        },
                        ['4'] = {
                            ['armor'] = '36',
                            ['required_str'] = '200',
                            ['required_agi'] = '69',
                        },
                        ['5'] = {
                            ['armor'] = '39',
                            ['required_str'] = '207',
                            ['required_agi'] = '71',
                        },
                        ['6'] = {
                            ['armor'] = '42',
                            ['required_str'] = '214',
                            ['required_agi'] = '72',
                        },
                        ['7'] = {
                            ['armor'] = '45',
                            ['required_str'] = '220',
                            ['required_agi'] = '74',
                        },
                        ['8'] = {
                            ['armor'] = '48',
                            ['required_str'] = '227',
                            ['required_agi'] = '76',
                        },
                        ['9'] = {
                            ['armor'] = '51',
                            ['required_str'] = '234',
                            ['required_agi'] = '78',
                        },
                        ['10'] = {
                            ['armor'] = '55',
                            ['required_str'] = '241',
                            ['required_agi'] = '80',
                        },
                        ['11'] = {
                            ['armor'] = '60',
                            ['required_str'] = '248',
                            ['required_agi'] = '82',
                        },
                        ['12'] = {
                            ['armor'] = '66',
                            ['required_str'] = '255',
                            ['required_agi'] = '84',
                        },
                        ['13'] = {
                            ['armor'] = '73',
                            ['required_str'] = '262',
                            ['required_agi'] = '86',
                        },
                        ['14'] = {
                            ['armor'] = '81',
                            ['required_str'] = '269',
                            ['required_agi'] = '88',
                        },
                        ['15'] = {
                            ['armor'] = '90',
                            ['required_str'] = '276',
                            ['required_agi'] = '89',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Adamantine Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '36',
                            ['required_str'] = '200',
                            ['required_agi'] = '69',
                        },
                        ['1'] = {
                            ['armor'] = '39',
                            ['required_str'] = '207',
                            ['required_agi'] = '71',
                        },
                        ['2'] = {
                            ['armor'] = '42',
                            ['required_str'] = '214',
                            ['required_agi'] = '72',
                        },
                        ['3'] = {
                            ['armor'] = '45',
                            ['required_str'] = '220',
                            ['required_agi'] = '74',
                        },
                        ['4'] = {
                            ['armor'] = '48',
                            ['required_str'] = '227',
                            ['required_agi'] = '76',
                        },
                        ['5'] = {
                            ['armor'] = '51',
                            ['required_str'] = '234',
                            ['required_agi'] = '78',
                        },
                        ['6'] = {
                            ['armor'] = '54',
                            ['required_str'] = '241',
                            ['required_agi'] = '80',
                        },
                        ['7'] = {
                            ['armor'] = '57',
                            ['required_str'] = '248',
                            ['required_agi'] = '82',
                        },
                        ['8'] = {
                            ['armor'] = '60',
                            ['required_str'] = '255',
                            ['required_agi'] = '84',
                        },
                        ['9'] = {
                            ['armor'] = '63',
                            ['required_str'] = '262',
                            ['required_agi'] = '86',
                        },
                        ['10'] = {
                            ['armor'] = '67',
                            ['required_str'] = '269',
                            ['required_agi'] = '88',
                        },
                        ['11'] = {
                            ['armor'] = '72',
                            ['required_str'] = '276',
                            ['required_agi'] = '89',
                        },
                        ['12'] = {
                            ['armor'] = '78',
                            ['required_str'] = '283',
                            ['required_agi'] = '91',
                        },
                        ['13'] = {
                            ['armor'] = '85',
                            ['required_str'] = '290',
                            ['required_agi'] = '93',
                        },
                        ['14'] = {
                            ['armor'] = '93',
                            ['required_str'] = '297',
                            ['required_agi'] = '95',
                        },
                        ['15'] = {
                            ['armor'] = '102',
                            ['required_str'] = '304',
                            ['required_agi'] = '97',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Adamantine Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '20',
                            ['required_str'] = '158',
                            ['required_agi'] = '57',
                        },
                        ['1'] = {
                            ['armor'] = '23',
                            ['required_str'] = '165',
                            ['required_agi'] = '59',
                        },
                        ['2'] = {
                            ['armor'] = '26',
                            ['required_str'] = '172',
                            ['required_agi'] = '61',
                        },
                        ['3'] = {
                            ['armor'] = '29',
                            ['required_str'] = '179',
                            ['required_agi'] = '63',
                        },
                        ['4'] = {
                            ['armor'] = '32',
                            ['required_str'] = '186',
                            ['required_agi'] = '65',
                        },
                        ['5'] = {
                            ['armor'] = '35',
                            ['required_str'] = '193',
                            ['required_agi'] = '67',
                        },
                        ['6'] = {
                            ['armor'] = '38',
                            ['required_str'] = '200',
                            ['required_agi'] = '69',
                        },
                        ['7'] = {
                            ['armor'] = '41',
                            ['required_str'] = '207',
                            ['required_agi'] = '71',
                        },
                        ['8'] = {
                            ['armor'] = '44',
                            ['required_str'] = '214',
                            ['required_agi'] = '72',
                        },
                        ['9'] = {
                            ['armor'] = '47',
                            ['required_str'] = '220',
                            ['required_agi'] = '74',
                        },
                        ['10'] = {
                            ['armor'] = '51',
                            ['required_str'] = '227',
                            ['required_agi'] = '76',
                        },
                        ['11'] = {
                            ['armor'] = '56',
                            ['required_str'] = '234',
                            ['required_agi'] = '78',
                        },
                        ['12'] = {
                            ['armor'] = '62',
                            ['required_str'] = '241',
                            ['required_agi'] = '80',
                        },
                        ['13'] = {
                            ['armor'] = '69',
                            ['required_str'] = '248',
                            ['required_agi'] = '82',
                        },
                        ['14'] = {
                            ['armor'] = '77',
                            ['required_str'] = '255',
                            ['required_agi'] = '84',
                        },
                        ['15'] = {
                            ['armor'] = '86',
                            ['required_str'] = '262',
                            ['required_agi'] = '86',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Adamantine Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '26',
                            ['required_str'] = '181',
                            ['required_agi'] = '64',
                        },
                        ['1'] = {
                            ['armor'] = '29',
                            ['required_str'] = '188',
                            ['required_agi'] = '65',
                        },
                        ['2'] = {
                            ['armor'] = '32',
                            ['required_str'] = '195',
                            ['required_agi'] = '67',
                        },
                        ['3'] = {
                            ['armor'] = '35',
                            ['required_str'] = '202',
                            ['required_agi'] = '69',
                        },
                        ['4'] = {
                            ['armor'] = '38',
                            ['required_str'] = '209',
                            ['required_agi'] = '71',
                        },
                        ['5'] = {
                            ['armor'] = '41',
                            ['required_str'] = '216',
                            ['required_agi'] = '73',
                        },
                        ['6'] = {
                            ['armor'] = '44',
                            ['required_str'] = '223',
                            ['required_agi'] = '75',
                        },
                        ['7'] = {
                            ['armor'] = '47',
                            ['required_str'] = '230',
                            ['required_agi'] = '77',
                        },
                        ['8'] = {
                            ['armor'] = '50',
                            ['required_str'] = '237',
                            ['required_agi'] = '79',
                        },
                        ['9'] = {
                            ['armor'] = '53',
                            ['required_str'] = '244',
                            ['required_agi'] = '81',
                        },
                        ['10'] = {
                            ['armor'] = '57',
                            ['required_str'] = '251',
                            ['required_agi'] = '83',
                        },
                        ['11'] = {
                            ['armor'] = '62',
                            ['required_str'] = '257',
                            ['required_agi'] = '84',
                        },
                        ['12'] = {
                            ['armor'] = '68',
                            ['required_str'] = '264',
                            ['required_agi'] = '86',
                        },
                        ['13'] = {
                            ['armor'] = '75',
                            ['required_str'] = '271',
                            ['required_agi'] = '88',
                        },
                        ['14'] = {
                            ['armor'] = '83',
                            ['required_str'] = '278',
                            ['required_agi'] = '90',
                        },
                        ['15'] = {
                            ['armor'] = '92',
                            ['required_str'] = '285',
                            ['required_agi'] = '92',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Adamantine Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '18',
                            ['required_str'] = '151',
                            ['required_agi'] = '55',
                        },
                        ['1'] = {
                            ['armor'] = '21',
                            ['required_str'] = '158',
                            ['required_agi'] = '57',
                        },
                        ['2'] = {
                            ['armor'] = '24',
                            ['required_str'] = '165',
                            ['required_agi'] = '59',
                        },
                        ['3'] = {
                            ['armor'] = '27',
                            ['required_str'] = '172',
                            ['required_agi'] = '61',
                        },
                        ['4'] = {
                            ['armor'] = '30',
                            ['required_str'] = '179',
                            ['required_agi'] = '63',
                        },
                        ['5'] = {
                            ['armor'] = '33',
                            ['required_str'] = '186',
                            ['required_agi'] = '65',
                        },
                        ['6'] = {
                            ['armor'] = '36',
                            ['required_str'] = '193',
                            ['required_agi'] = '67',
                        },
                        ['7'] = {
                            ['armor'] = '39',
                            ['required_str'] = '200',
                            ['required_agi'] = '69',
                        },
                        ['8'] = {
                            ['armor'] = '42',
                            ['required_str'] = '207',
                            ['required_agi'] = '71',
                        },
                        ['9'] = {
                            ['armor'] = '45',
                            ['required_str'] = '214',
                            ['required_agi'] = '72',
                        },
                        ['10'] = {
                            ['armor'] = '49',
                            ['required_str'] = '220',
                            ['required_agi'] = '74',
                        },
                        ['11'] = {
                            ['armor'] = '54',
                            ['required_str'] = '227',
                            ['required_agi'] = '76',
                        },
                        ['12'] = {
                            ['armor'] = '60',
                            ['required_str'] = '234',
                            ['required_agi'] = '78',
                        },
                        ['13'] = {
                            ['armor'] = '67',
                            ['required_str'] = '241',
                            ['required_agi'] = '80',
                        },
                        ['14'] = {
                            ['armor'] = '75',
                            ['required_str'] = '248',
                            ['required_agi'] = '82',
                        },
                        ['15'] = {
                            ['armor'] = '84',
                            ['required_str'] = '255',
                            ['required_agi'] = '84',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Adamantine Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '39',
                            ['required_str'] = '207',
                            ['required_agi'] = '71',
                        },
                        ['1'] = {
                            ['armor'] = '42',
                            ['required_str'] = '214',
                            ['required_agi'] = '72',
                        },
                        ['2'] = {
                            ['armor'] = '45',
                            ['required_str'] = '220',
                            ['required_agi'] = '74',
                        },
                        ['3'] = {
                            ['armor'] = '48',
                            ['required_str'] = '227',
                            ['required_agi'] = '76',
                        },
                        ['4'] = {
                            ['armor'] = '51',
                            ['required_str'] = '234',
                            ['required_agi'] = '78',
                        },
                        ['5'] = {
                            ['armor'] = '54',
                            ['required_str'] = '241',
                            ['required_agi'] = '80',
                        },
                        ['6'] = {
                            ['armor'] = '57',
                            ['required_str'] = '248',
                            ['required_agi'] = '82',
                        },
                        ['7'] = {
                            ['armor'] = '60',
                            ['required_str'] = '255',
                            ['required_agi'] = '84',
                        },
                        ['8'] = {
                            ['armor'] = '63',
                            ['required_str'] = '262',
                            ['required_agi'] = '86',
                        },
                        ['9'] = {
                            ['armor'] = '67',
                            ['required_str'] = '269',
                            ['required_agi'] = '88',
                        },
                        ['10'] = {
                            ['armor'] = '72',
                            ['required_str'] = '276',
                            ['required_agi'] = '89',
                        },
                        ['11'] = {
                            ['armor'] = '78',
                            ['required_str'] = '283',
                            ['required_agi'] = '91',
                        },
                        ['12'] = {
                            ['armor'] = '85',
                            ['required_str'] = '290',
                            ['required_agi'] = '93',
                        },
                        ['13'] = {
                            ['armor'] = '93',
                            ['required_str'] = '297',
                            ['required_agi'] = '95',
                        },
                        ['14'] = {
                            ['armor'] = '102',
                            ['required_str'] = '304',
                            ['required_agi'] = '97',
                        },
                        ['15'] = {
                            ['armor'] = '111',
                            ['required_str'] = '311',
                            ['required_agi'] = '99',
                        },
                    },
                },
            },
            ['class'] = {
                'summoner',
            },
        },
        ['Dark Steel'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Dark Steel Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '26',
                            ['required_str'] = '236',
                            ['required_agi'] = '76',
                        },
                        ['1'] = {
                            ['armor'] = '29',
                            ['required_str'] = '244',
                            ['required_agi'] = '78',
                        },
                        ['2'] = {
                            ['armor'] = '32',
                            ['required_str'] = '251',
                            ['required_agi'] = '80',
                        },
                        ['3'] = {
                            ['armor'] = '35',
                            ['required_str'] = '259',
                            ['required_agi'] = '82',
                        },
                        ['4'] = {
                            ['armor'] = '38',
                            ['required_str'] = '266',
                            ['required_agi'] = '84',
                        },
                        ['5'] = {
                            ['armor'] = '41',
                            ['required_str'] = '274',
                            ['required_agi'] = '86',
                        },
                        ['6'] = {
                            ['armor'] = '44',
                            ['required_str'] = '282',
                            ['required_agi'] = '88',
                        },
                        ['7'] = {
                            ['armor'] = '47',
                            ['required_str'] = '289',
                            ['required_agi'] = '90',
                        },
                        ['8'] = {
                            ['armor'] = '50',
                            ['required_str'] = '297',
                            ['required_agi'] = '92',
                        },
                        ['9'] = {
                            ['armor'] = '53',
                            ['required_str'] = '304',
                            ['required_agi'] = '94',
                        },
                        ['10'] = {
                            ['armor'] = '57',
                            ['required_str'] = '312',
                            ['required_agi'] = '96',
                        },
                        ['11'] = {
                            ['armor'] = '62',
                            ['required_str'] = '319',
                            ['required_agi'] = '98',
                        },
                        ['12'] = {
                            ['armor'] = '68',
                            ['required_str'] = '327',
                            ['required_agi'] = '100',
                        },
                        ['13'] = {
                            ['armor'] = '75',
                            ['required_str'] = '335',
                            ['required_agi'] = '102',
                        },
                        ['14'] = {
                            ['armor'] = '83',
                            ['required_str'] = '342',
                            ['required_agi'] = '104',
                        },
                        ['15'] = {
                            ['armor'] = '92',
                            ['required_str'] = '350',
                            ['required_agi'] = '106',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Dark Steel Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '43',
                            ['required_str'] = '261',
                            ['required_agi'] = '83',
                        },
                        ['1'] = {
                            ['armor'] = '46',
                            ['required_str'] = '269',
                            ['required_agi'] = '85',
                        },
                        ['2'] = {
                            ['armor'] = '49',
                            ['required_str'] = '277',
                            ['required_agi'] = '87',
                        },
                        ['3'] = {
                            ['armor'] = '52',
                            ['required_str'] = '284',
                            ['required_agi'] = '89',
                        },
                        ['4'] = {
                            ['armor'] = '55',
                            ['required_str'] = '292',
                            ['required_agi'] = '91',
                        },
                        ['5'] = {
                            ['armor'] = '58',
                            ['required_str'] = '299',
                            ['required_agi'] = '93',
                        },
                        ['6'] = {
                            ['armor'] = '61',
                            ['required_str'] = '307',
                            ['required_agi'] = '95',
                        },
                        ['7'] = {
                            ['armor'] = '64',
                            ['required_str'] = '314',
                            ['required_agi'] = '97',
                        },
                        ['8'] = {
                            ['armor'] = '67',
                            ['required_str'] = '322',
                            ['required_agi'] = '99',
                        },
                        ['9'] = {
                            ['armor'] = '70',
                            ['required_str'] = '329',
                            ['required_agi'] = '101',
                        },
                        ['10'] = {
                            ['armor'] = '74',
                            ['required_str'] = '337',
                            ['required_agi'] = '103',
                        },
                        ['11'] = {
                            ['armor'] = '79',
                            ['required_str'] = '345',
                            ['required_agi'] = '105',
                        },
                        ['12'] = {
                            ['armor'] = '85',
                            ['required_str'] = '352',
                            ['required_agi'] = '107',
                        },
                        ['13'] = {
                            ['armor'] = '92',
                            ['required_str'] = '360',
                            ['required_agi'] = '109',
                        },
                        ['14'] = {
                            ['armor'] = '100',
                            ['required_str'] = '367',
                            ['required_agi'] = '111',
                        },
                        ['15'] = {
                            ['armor'] = '109',
                            ['required_str'] = '375',
                            ['required_agi'] = '113',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Dark Steel Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '25',
                            ['required_str'] = '229',
                            ['required_agi'] = '74',
                        },
                        ['1'] = {
                            ['armor'] = '28',
                            ['required_str'] = '236',
                            ['required_agi'] = '76',
                        },
                        ['2'] = {
                            ['armor'] = '31',
                            ['required_str'] = '244',
                            ['required_agi'] = '78',
                        },
                        ['3'] = {
                            ['armor'] = '34',
                            ['required_str'] = '251',
                            ['required_agi'] = '80',
                        },
                        ['4'] = {
                            ['armor'] = '37',
                            ['required_str'] = '259',
                            ['required_agi'] = '82',
                        },
                        ['5'] = {
                            ['armor'] = '40',
                            ['required_str'] = '266',
                            ['required_agi'] = '84',
                        },
                        ['6'] = {
                            ['armor'] = '43',
                            ['required_str'] = '274',
                            ['required_agi'] = '86',
                        },
                        ['7'] = {
                            ['armor'] = '46',
                            ['required_str'] = '282',
                            ['required_agi'] = '88',
                        },
                        ['8'] = {
                            ['armor'] = '49',
                            ['required_str'] = '289',
                            ['required_agi'] = '90',
                        },
                        ['9'] = {
                            ['armor'] = '52',
                            ['required_str'] = '297',
                            ['required_agi'] = '92',
                        },
                        ['10'] = {
                            ['armor'] = '56',
                            ['required_str'] = '304',
                            ['required_agi'] = '94',
                        },
                        ['11'] = {
                            ['armor'] = '61',
                            ['required_str'] = '312',
                            ['required_agi'] = '96',
                        },
                        ['12'] = {
                            ['armor'] = '67',
                            ['required_str'] = '319',
                            ['required_agi'] = '98',
                        },
                        ['13'] = {
                            ['armor'] = '74',
                            ['required_str'] = '327',
                            ['required_agi'] = '100',
                        },
                        ['14'] = {
                            ['armor'] = '82',
                            ['required_str'] = '335',
                            ['required_agi'] = '102',
                        },
                        ['15'] = {
                            ['armor'] = '91',
                            ['required_str'] = '342',
                            ['required_agi'] = '104',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Dark Steel Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '31',
                            ['required_str'] = '251',
                            ['required_agi'] = '80',
                        },
                        ['1'] = {
                            ['armor'] = '34',
                            ['required_str'] = '259',
                            ['required_agi'] = '82',
                        },
                        ['2'] = {
                            ['armor'] = '37',
                            ['required_str'] = '266',
                            ['required_agi'] = '84',
                        },
                        ['3'] = {
                            ['armor'] = '40',
                            ['required_str'] = '274',
                            ['required_agi'] = '86',
                        },
                        ['4'] = {
                            ['armor'] = '43',
                            ['required_str'] = '282',
                            ['required_agi'] = '88',
                        },
                        ['5'] = {
                            ['armor'] = '46',
                            ['required_str'] = '289',
                            ['required_agi'] = '90',
                        },
                        ['6'] = {
                            ['armor'] = '49',
                            ['required_str'] = '297',
                            ['required_agi'] = '92',
                        },
                        ['7'] = {
                            ['armor'] = '52',
                            ['required_str'] = '304',
                            ['required_agi'] = '94',
                        },
                        ['8'] = {
                            ['armor'] = '55',
                            ['required_str'] = '312',
                            ['required_agi'] = '96',
                        },
                        ['9'] = {
                            ['armor'] = '58',
                            ['required_str'] = '319',
                            ['required_agi'] = '98',
                        },
                        ['10'] = {
                            ['armor'] = '62',
                            ['required_str'] = '327',
                            ['required_agi'] = '100',
                        },
                        ['11'] = {
                            ['armor'] = '67',
                            ['required_str'] = '335',
                            ['required_agi'] = '102',
                        },
                        ['12'] = {
                            ['armor'] = '73',
                            ['required_str'] = '342',
                            ['required_agi'] = '104',
                        },
                        ['13'] = {
                            ['armor'] = '80',
                            ['required_str'] = '350',
                            ['required_agi'] = '106',
                        },
                        ['14'] = {
                            ['armor'] = '88',
                            ['required_str'] = '357',
                            ['required_agi'] = '108',
                        },
                        ['15'] = {
                            ['armor'] = '97',
                            ['required_str'] = '365',
                            ['required_agi'] = '110',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Dark Steel Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '21',
                            ['required_str'] = '209',
                            ['required_agi'] = '69',
                        },
                        ['1'] = {
                            ['armor'] = '24',
                            ['required_str'] = '216',
                            ['required_agi'] = '71',
                        },
                        ['2'] = {
                            ['armor'] = '27',
                            ['required_str'] = '224',
                            ['required_agi'] = '73',
                        },
                        ['3'] = {
                            ['armor'] = '30',
                            ['required_str'] = '231',
                            ['required_agi'] = '75',
                        },
                        ['4'] = {
                            ['armor'] = '33',
                            ['required_str'] = '239',
                            ['required_agi'] = '77',
                        },
                        ['5'] = {
                            ['armor'] = '36',
                            ['required_str'] = '246',
                            ['required_agi'] = '79',
                        },
                        ['6'] = {
                            ['armor'] = '39',
                            ['required_str'] = '254',
                            ['required_agi'] = '81',
                        },
                        ['7'] = {
                            ['armor'] = '42',
                            ['required_str'] = '261',
                            ['required_agi'] = '83',
                        },
                        ['8'] = {
                            ['armor'] = '45',
                            ['required_str'] = '269',
                            ['required_agi'] = '85',
                        },
                        ['9'] = {
                            ['armor'] = '48',
                            ['required_str'] = '277',
                            ['required_agi'] = '87',
                        },
                        ['10'] = {
                            ['armor'] = '52',
                            ['required_str'] = '284',
                            ['required_agi'] = '89',
                        },
                        ['11'] = {
                            ['armor'] = '57',
                            ['required_str'] = '292',
                            ['required_agi'] = '91',
                        },
                        ['12'] = {
                            ['armor'] = '63',
                            ['required_str'] = '299',
                            ['required_agi'] = '93',
                        },
                        ['13'] = {
                            ['armor'] = '70',
                            ['required_str'] = '307',
                            ['required_agi'] = '95',
                        },
                        ['14'] = {
                            ['armor'] = '78',
                            ['required_str'] = '314',
                            ['required_agi'] = '97',
                        },
                        ['15'] = {
                            ['armor'] = '87',
                            ['required_str'] = '322',
                            ['required_agi'] = '99',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Dark Steel Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '46',
                            ['required_str'] = '269',
                            ['required_agi'] = '85',
                        },
                        ['1'] = {
                            ['armor'] = '49',
                            ['required_str'] = '277',
                            ['required_agi'] = '87',
                        },
                        ['2'] = {
                            ['armor'] = '52',
                            ['required_str'] = '284',
                            ['required_agi'] = '89',
                        },
                        ['3'] = {
                            ['armor'] = '55',
                            ['required_str'] = '292',
                            ['required_agi'] = '91',
                        },
                        ['4'] = {
                            ['armor'] = '58',
                            ['required_str'] = '299',
                            ['required_agi'] = '93',
                        },
                        ['5'] = {
                            ['armor'] = '61',
                            ['required_str'] = '307',
                            ['required_agi'] = '95',
                        },
                        ['6'] = {
                            ['armor'] = '64',
                            ['required_str'] = '314',
                            ['required_agi'] = '97',
                        },
                        ['7'] = {
                            ['armor'] = '67',
                            ['required_str'] = '322',
                            ['required_agi'] = '99',
                        },
                        ['8'] = {
                            ['armor'] = '70',
                            ['required_str'] = '329',
                            ['required_agi'] = '101',
                        },
                        ['9'] = {
                            ['armor'] = '74',
                            ['required_str'] = '337',
                            ['required_agi'] = '103',
                        },
                        ['10'] = {
                            ['armor'] = '79',
                            ['required_str'] = '345',
                            ['required_agi'] = '105',
                        },
                        ['11'] = {
                            ['armor'] = '85',
                            ['required_str'] = '352',
                            ['required_agi'] = '107',
                        },
                        ['12'] = {
                            ['armor'] = '92',
                            ['required_str'] = '360',
                            ['required_agi'] = '109',
                        },
                        ['13'] = {
                            ['armor'] = '100',
                            ['required_str'] = '367',
                            ['required_agi'] = '111',
                        },
                        ['14'] = {
                            ['armor'] = '109',
                            ['required_str'] = '375',
                            ['required_agi'] = '113',
                        },
                        ['15'] = {
                            ['armor'] = '118',
                            ['required_str'] = '384',
                            ['required_agi'] = '115',
                        },
                    },
                },
            },
            ['class'] = {
                'summoner',
            },
        },
        ['Dark Master'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Dark Master Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '34',
                            ['required_str'] = '274',
                            ['required_agi'] = '86',
                        },
                        ['1'] = {
                            ['armor'] = '37',
                            ['required_str'] = '281',
                            ['required_agi'] = '88',
                        },
                        ['2'] = {
                            ['armor'] = '40',
                            ['required_str'] = '288',
                            ['required_agi'] = '90',
                        },
                        ['3'] = {
                            ['armor'] = '43',
                            ['required_str'] = '296',
                            ['required_agi'] = '92',
                        },
                        ['4'] = {
                            ['armor'] = '46',
                            ['required_str'] = '303',
                            ['required_agi'] = '94',
                        },
                        ['5'] = {
                            ['armor'] = '49',
                            ['required_str'] = '310',
                            ['required_agi'] = '96',
                        },
                        ['6'] = {
                            ['armor'] = '52',
                            ['required_str'] = '317',
                            ['required_agi'] = '98',
                        },
                        ['7'] = {
                            ['armor'] = '55',
                            ['required_str'] = '324',
                            ['required_agi'] = '100',
                        },
                        ['8'] = {
                            ['armor'] = '58',
                            ['required_str'] = '332',
                            ['required_agi'] = '101',
                        },
                        ['9'] = {
                            ['armor'] = '61',
                            ['required_str'] = '339',
                            ['required_agi'] = '103',
                        },
                        ['10'] = {
                            ['armor'] = '65',
                            ['required_str'] = '346',
                            ['required_agi'] = '105',
                        },
                        ['11'] = {
                            ['armor'] = '70',
                            ['required_str'] = '353',
                            ['required_agi'] = '107',
                        },
                        ['12'] = {
                            ['armor'] = '76',
                            ['required_str'] = '360',
                            ['required_agi'] = '109',
                        },
                        ['13'] = {
                            ['armor'] = '83',
                            ['required_str'] = '368',
                            ['required_agi'] = '111',
                        },
                        ['14'] = {
                            ['armor'] = '91',
                            ['required_str'] = '375',
                            ['required_agi'] = '113',
                        },
                        ['15'] = {
                            ['armor'] = '100',
                            ['required_str'] = '382',
                            ['required_agi'] = '115',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Dark Master Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '51',
                            ['required_str'] = '300',
                            ['required_agi'] = '93',
                        },
                        ['1'] = {
                            ['armor'] = '54',
                            ['required_str'] = '308',
                            ['required_agi'] = '95',
                        },
                        ['2'] = {
                            ['armor'] = '57',
                            ['required_str'] = '315',
                            ['required_agi'] = '97',
                        },
                        ['3'] = {
                            ['armor'] = '60',
                            ['required_str'] = '322',
                            ['required_agi'] = '99',
                        },
                        ['4'] = {
                            ['armor'] = '63',
                            ['required_str'] = '329',
                            ['required_agi'] = '101',
                        },
                        ['5'] = {
                            ['armor'] = '66',
                            ['required_str'] = '336',
                            ['required_agi'] = '103',
                        },
                        ['6'] = {
                            ['armor'] = '69',
                            ['required_str'] = '344',
                            ['required_agi'] = '105',
                        },
                        ['7'] = {
                            ['armor'] = '72',
                            ['required_str'] = '351',
                            ['required_agi'] = '106',
                        },
                        ['8'] = {
                            ['armor'] = '75',
                            ['required_str'] = '358',
                            ['required_agi'] = '108',
                        },
                        ['9'] = {
                            ['armor'] = '78',
                            ['required_str'] = '365',
                            ['required_agi'] = '110',
                        },
                        ['10'] = {
                            ['armor'] = '82',
                            ['required_str'] = '372',
                            ['required_agi'] = '112',
                        },
                        ['11'] = {
                            ['armor'] = '87',
                            ['required_str'] = '380',
                            ['required_agi'] = '114',
                        },
                        ['12'] = {
                            ['armor'] = '93',
                            ['required_str'] = '387',
                            ['required_agi'] = '116',
                        },
                        ['13'] = {
                            ['armor'] = '100',
                            ['required_str'] = '394',
                            ['required_agi'] = '118',
                        },
                        ['14'] = {
                            ['armor'] = '108',
                            ['required_str'] = '401',
                            ['required_agi'] = '120',
                        },
                        ['15'] = {
                            ['armor'] = '117',
                            ['required_str'] = '408',
                            ['required_agi'] = '122',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Dark Master Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '33',
                            ['required_str'] = '248',
                            ['required_agi'] = '79',
                        },
                        ['1'] = {
                            ['armor'] = '36',
                            ['required_str'] = '255',
                            ['required_agi'] = '81',
                        },
                        ['2'] = {
                            ['armor'] = '39',
                            ['required_str'] = '262',
                            ['required_agi'] = '83',
                        },
                        ['3'] = {
                            ['armor'] = '42',
                            ['required_str'] = '269',
                            ['required_agi'] = '85',
                        },
                        ['4'] = {
                            ['armor'] = '45',
                            ['required_str'] = '276',
                            ['required_agi'] = '87',
                        },
                        ['5'] = {
                            ['armor'] = '48',
                            ['required_str'] = '284',
                            ['required_agi'] = '89',
                        },
                        ['6'] = {
                            ['armor'] = '51',
                            ['required_str'] = '291',
                            ['required_agi'] = '91',
                        },
                        ['7'] = {
                            ['armor'] = '54',
                            ['required_str'] = '298',
                            ['required_agi'] = '93',
                        },
                        ['8'] = {
                            ['armor'] = '57',
                            ['required_str'] = '305',
                            ['required_agi'] = '94',
                        },
                        ['9'] = {
                            ['armor'] = '60',
                            ['required_str'] = '312',
                            ['required_agi'] = '96',
                        },
                        ['10'] = {
                            ['armor'] = '64',
                            ['required_str'] = '320',
                            ['required_agi'] = '98',
                        },
                        ['11'] = {
                            ['armor'] = '69',
                            ['required_str'] = '327',
                            ['required_agi'] = '100',
                        },
                        ['12'] = {
                            ['armor'] = '75',
                            ['required_str'] = '334',
                            ['required_agi'] = '102',
                        },
                        ['13'] = {
                            ['armor'] = '82',
                            ['required_str'] = '341',
                            ['required_agi'] = '104',
                        },
                        ['14'] = {
                            ['armor'] = '90',
                            ['required_str'] = '348',
                            ['required_agi'] = '106',
                        },
                        ['15'] = {
                            ['armor'] = '99',
                            ['required_str'] = '356',
                            ['required_agi'] = '108',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Dark Master Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '39',
                            ['required_str'] = '284',
                            ['required_agi'] = '89',
                        },
                        ['1'] = {
                            ['armor'] = '42',
                            ['required_str'] = '291',
                            ['required_agi'] = '91',
                        },
                        ['2'] = {
                            ['armor'] = '45',
                            ['required_str'] = '298',
                            ['required_agi'] = '93',
                        },
                        ['3'] = {
                            ['armor'] = '48',
                            ['required_str'] = '305',
                            ['required_agi'] = '94',
                        },
                        ['4'] = {
                            ['armor'] = '51',
                            ['required_str'] = '312',
                            ['required_agi'] = '96',
                        },
                        ['5'] = {
                            ['armor'] = '54',
                            ['required_str'] = '320',
                            ['required_agi'] = '98',
                        },
                        ['6'] = {
                            ['armor'] = '57',
                            ['required_str'] = '327',
                            ['required_agi'] = '100',
                        },
                        ['7'] = {
                            ['armor'] = '60',
                            ['required_str'] = '334',
                            ['required_agi'] = '102',
                        },
                        ['8'] = {
                            ['armor'] = '63',
                            ['required_str'] = '341',
                            ['required_agi'] = '104',
                        },
                        ['9'] = {
                            ['armor'] = '66',
                            ['required_str'] = '348',
                            ['required_agi'] = '106',
                        },
                        ['10'] = {
                            ['armor'] = '70',
                            ['required_str'] = '356',
                            ['required_agi'] = '108',
                        },
                        ['11'] = {
                            ['armor'] = '75',
                            ['required_str'] = '363',
                            ['required_agi'] = '110',
                        },
                        ['12'] = {
                            ['armor'] = '81',
                            ['required_str'] = '370',
                            ['required_agi'] = '111',
                        },
                        ['13'] = {
                            ['armor'] = '88',
                            ['required_str'] = '377',
                            ['required_agi'] = '113',
                        },
                        ['14'] = {
                            ['armor'] = '96',
                            ['required_str'] = '384',
                            ['required_agi'] = '115',
                        },
                        ['15'] = {
                            ['armor'] = '105',
                            ['required_str'] = '392',
                            ['required_agi'] = '117',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Dark Master Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '29',
                            ['required_str'] = '233',
                            ['required_agi'] = '76',
                        },
                        ['1'] = {
                            ['armor'] = '32',
                            ['required_str'] = '240',
                            ['required_agi'] = '77',
                        },
                        ['2'] = {
                            ['armor'] = '35',
                            ['required_str'] = '248',
                            ['required_agi'] = '79',
                        },
                        ['3'] = {
                            ['armor'] = '38',
                            ['required_str'] = '255',
                            ['required_agi'] = '81',
                        },
                        ['4'] = {
                            ['armor'] = '41',
                            ['required_str'] = '262',
                            ['required_agi'] = '83',
                        },
                        ['5'] = {
                            ['armor'] = '44',
                            ['required_str'] = '269',
                            ['required_agi'] = '85',
                        },
                        ['6'] = {
                            ['armor'] = '47',
                            ['required_str'] = '276',
                            ['required_agi'] = '87',
                        },
                        ['7'] = {
                            ['armor'] = '50',
                            ['required_str'] = '284',
                            ['required_agi'] = '89',
                        },
                        ['8'] = {
                            ['armor'] = '53',
                            ['required_str'] = '291',
                            ['required_agi'] = '91',
                        },
                        ['9'] = {
                            ['armor'] = '56',
                            ['required_str'] = '298',
                            ['required_agi'] = '93',
                        },
                        ['10'] = {
                            ['armor'] = '60',
                            ['required_str'] = '305',
                            ['required_agi'] = '94',
                        },
                        ['11'] = {
                            ['armor'] = '65',
                            ['required_str'] = '312',
                            ['required_agi'] = '96',
                        },
                        ['12'] = {
                            ['armor'] = '71',
                            ['required_str'] = '320',
                            ['required_agi'] = '98',
                        },
                        ['13'] = {
                            ['armor'] = '78',
                            ['required_str'] = '327',
                            ['required_agi'] = '100',
                        },
                        ['14'] = {
                            ['armor'] = '86',
                            ['required_str'] = '334',
                            ['required_agi'] = '102',
                        },
                        ['15'] = {
                            ['armor'] = '95',
                            ['required_str'] = '341',
                            ['required_agi'] = '104',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Dark Master Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '54',
                            ['required_str'] = '308',
                            ['required_agi'] = '95',
                        },
                        ['1'] = {
                            ['armor'] = '57',
                            ['required_str'] = '315',
                            ['required_agi'] = '97',
                        },
                        ['2'] = {
                            ['armor'] = '60',
                            ['required_str'] = '322',
                            ['required_agi'] = '99',
                        },
                        ['3'] = {
                            ['armor'] = '63',
                            ['required_str'] = '329',
                            ['required_agi'] = '101',
                        },
                        ['4'] = {
                            ['armor'] = '66',
                            ['required_str'] = '336',
                            ['required_agi'] = '103',
                        },
                        ['5'] = {
                            ['armor'] = '69',
                            ['required_str'] = '344',
                            ['required_agi'] = '105',
                        },
                        ['6'] = {
                            ['armor'] = '72',
                            ['required_str'] = '351',
                            ['required_agi'] = '106',
                        },
                        ['7'] = {
                            ['armor'] = '75',
                            ['required_str'] = '358',
                            ['required_agi'] = '108',
                        },
                        ['8'] = {
                            ['armor'] = '78',
                            ['required_str'] = '365',
                            ['required_agi'] = '110',
                        },
                        ['9'] = {
                            ['armor'] = '82',
                            ['required_str'] = '372',
                            ['required_agi'] = '112',
                        },
                        ['10'] = {
                            ['armor'] = '87',
                            ['required_str'] = '380',
                            ['required_agi'] = '114',
                        },
                        ['11'] = {
                            ['armor'] = '93',
                            ['required_str'] = '387',
                            ['required_agi'] = '116',
                        },
                        ['12'] = {
                            ['armor'] = '100',
                            ['required_str'] = '394',
                            ['required_agi'] = '118',
                        },
                        ['13'] = {
                            ['armor'] = '108',
                            ['required_str'] = '401',
                            ['required_agi'] = '120',
                        },
                        ['14'] = {
                            ['armor'] = '117',
                            ['required_str'] = '408',
                            ['required_agi'] = '122',
                        },
                        ['15'] = {
                            ['armor'] = '125',
                            ['required_str'] = '415',
                            ['required_agi'] = '124',
                        },
                    },
                },
            },
            ['class'] = {
                'summoner',
            },
        },
        ['Sunlight'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Sunlight Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '46',
                            ['required_str'] = '261',
                            ['required_agi'] = '82',
                        },
                        ['1'] = {
                            ['armor'] = '49',
                            ['required_str'] = '267',
                            ['required_agi'] = '83',
                        },
                        ['2'] = {
                            ['armor'] = '52',
                            ['required_str'] = '272',
                            ['required_agi'] = '85',
                        },
                        ['3'] = {
                            ['armor'] = '55',
                            ['required_str'] = '278',
                            ['required_agi'] = '86',
                        },
                        ['4'] = {
                            ['armor'] = '58',
                            ['required_str'] = '284',
                            ['required_agi'] = '88',
                        },
                        ['5'] = {
                            ['armor'] = '61',
                            ['required_str'] = '289',
                            ['required_agi'] = '89',
                        },
                        ['6'] = {
                            ['armor'] = '64',
                            ['required_str'] = '295',
                            ['required_agi'] = '91',
                        },
                        ['7'] = {
                            ['armor'] = '67',
                            ['required_str'] = '300',
                            ['required_agi'] = '92',
                        },
                        ['8'] = {
                            ['armor'] = '70',
                            ['required_str'] = '306',
                            ['required_agi'] = '93',
                        },
                        ['9'] = {
                            ['armor'] = '73',
                            ['required_str'] = '312',
                            ['required_agi'] = '95',
                        },
                        ['10'] = {
                            ['armor'] = '77',
                            ['required_str'] = '317',
                            ['required_agi'] = '96',
                        },
                        ['11'] = {
                            ['armor'] = '82',
                            ['required_str'] = '323',
                            ['required_agi'] = '98',
                        },
                        ['12'] = {
                            ['armor'] = '88',
                            ['required_str'] = '328',
                            ['required_agi'] = '99',
                        },
                        ['13'] = {
                            ['armor'] = '95',
                            ['required_str'] = '334',
                            ['required_agi'] = '101',
                        },
                        ['14'] = {
                            ['armor'] = '103',
                            ['required_str'] = '339',
                            ['required_agi'] = '102',
                        },
                        ['15'] = {
                            ['armor'] = '112',
                            ['required_str'] = '345',
                            ['required_agi'] = '104',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Sunlight Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '64',
                            ['required_str'] = '293',
                            ['required_agi'] = '90',
                        },
                        ['1'] = {
                            ['armor'] = '67',
                            ['required_str'] = '299',
                            ['required_agi'] = '92',
                        },
                        ['2'] = {
                            ['armor'] = '70',
                            ['required_str'] = '304',
                            ['required_agi'] = '93',
                        },
                        ['3'] = {
                            ['armor'] = '73',
                            ['required_str'] = '310',
                            ['required_agi'] = '94',
                        },
                        ['4'] = {
                            ['armor'] = '76',
                            ['required_str'] = '315',
                            ['required_agi'] = '96',
                        },
                        ['5'] = {
                            ['armor'] = '79',
                            ['required_str'] = '321',
                            ['required_agi'] = '97',
                        },
                        ['6'] = {
                            ['armor'] = '82',
                            ['required_str'] = '326',
                            ['required_agi'] = '99',
                        },
                        ['7'] = {
                            ['armor'] = '85',
                            ['required_str'] = '332',
                            ['required_agi'] = '100',
                        },
                        ['8'] = {
                            ['armor'] = '88',
                            ['required_str'] = '338',
                            ['required_agi'] = '102',
                        },
                        ['9'] = {
                            ['armor'] = '91',
                            ['required_str'] = '343',
                            ['required_agi'] = '103',
                        },
                        ['10'] = {
                            ['armor'] = '95',
                            ['required_str'] = '349',
                            ['required_agi'] = '104',
                        },
                        ['11'] = {
                            ['armor'] = '100',
                            ['required_str'] = '354',
                            ['required_agi'] = '106',
                        },
                        ['12'] = {
                            ['armor'] = '106',
                            ['required_str'] = '360',
                            ['required_agi'] = '107',
                        },
                        ['13'] = {
                            ['armor'] = '113',
                            ['required_str'] = '365',
                            ['required_agi'] = '109',
                        },
                        ['14'] = {
                            ['armor'] = '121',
                            ['required_str'] = '371',
                            ['required_agi'] = '110',
                        },
                        ['15'] = {
                            ['armor'] = '130',
                            ['required_str'] = '377',
                            ['required_agi'] = '112',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Sunlight Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '44',
                            ['required_str'] = '245',
                            ['required_agi'] = '78',
                        },
                        ['1'] = {
                            ['armor'] = '47',
                            ['required_str'] = '250',
                            ['required_agi'] = '79',
                        },
                        ['2'] = {
                            ['armor'] = '50',
                            ['required_str'] = '256',
                            ['required_agi'] = '80',
                        },
                        ['3'] = {
                            ['armor'] = '53',
                            ['required_str'] = '261',
                            ['required_agi'] = '82',
                        },
                        ['4'] = {
                            ['armor'] = '56',
                            ['required_str'] = '267',
                            ['required_agi'] = '83',
                        },
                        ['5'] = {
                            ['armor'] = '59',
                            ['required_str'] = '272',
                            ['required_agi'] = '85',
                        },
                        ['6'] = {
                            ['armor'] = '62',
                            ['required_str'] = '278',
                            ['required_agi'] = '86',
                        },
                        ['7'] = {
                            ['armor'] = '65',
                            ['required_str'] = '284',
                            ['required_agi'] = '88',
                        },
                        ['8'] = {
                            ['armor'] = '68',
                            ['required_str'] = '289',
                            ['required_agi'] = '89',
                        },
                        ['9'] = {
                            ['armor'] = '71',
                            ['required_str'] = '295',
                            ['required_agi'] = '91',
                        },
                        ['10'] = {
                            ['armor'] = '75',
                            ['required_str'] = '300',
                            ['required_agi'] = '92',
                        },
                        ['11'] = {
                            ['armor'] = '80',
                            ['required_str'] = '306',
                            ['required_agi'] = '93',
                        },
                        ['12'] = {
                            ['armor'] = '86',
                            ['required_str'] = '312',
                            ['required_agi'] = '95',
                        },
                        ['13'] = {
                            ['armor'] = '93',
                            ['required_str'] = '317',
                            ['required_agi'] = '96',
                        },
                        ['14'] = {
                            ['armor'] = '101',
                            ['required_str'] = '323',
                            ['required_agi'] = '98',
                        },
                        ['15'] = {
                            ['armor'] = '110',
                            ['required_str'] = '328',
                            ['required_agi'] = '99',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Sunlight Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '52',
                            ['required_str'] = '280',
                            ['required_agi'] = '87',
                        },
                        ['1'] = {
                            ['armor'] = '55',
                            ['required_str'] = '285',
                            ['required_agi'] = '88',
                        },
                        ['2'] = {
                            ['armor'] = '58',
                            ['required_str'] = '291',
                            ['required_agi'] = '90',
                        },
                        ['3'] = {
                            ['armor'] = '61',
                            ['required_str'] = '297',
                            ['required_agi'] = '91',
                        },
                        ['4'] = {
                            ['armor'] = '64',
                            ['required_str'] = '302',
                            ['required_agi'] = '92',
                        },
                        ['5'] = {
                            ['armor'] = '67',
                            ['required_str'] = '308',
                            ['required_agi'] = '94',
                        },
                        ['6'] = {
                            ['armor'] = '70',
                            ['required_str'] = '313',
                            ['required_agi'] = '95',
                        },
                        ['7'] = {
                            ['armor'] = '73',
                            ['required_str'] = '319',
                            ['required_agi'] = '97',
                        },
                        ['8'] = {
                            ['armor'] = '76',
                            ['required_str'] = '325',
                            ['required_agi'] = '98',
                        },
                        ['9'] = {
                            ['armor'] = '79',
                            ['required_str'] = '330',
                            ['required_agi'] = '100',
                        },
                        ['10'] = {
                            ['armor'] = '83',
                            ['required_str'] = '336',
                            ['required_agi'] = '101',
                        },
                        ['11'] = {
                            ['armor'] = '88',
                            ['required_str'] = '341',
                            ['required_agi'] = '103',
                        },
                        ['12'] = {
                            ['armor'] = '94',
                            ['required_str'] = '347',
                            ['required_agi'] = '104',
                        },
                        ['13'] = {
                            ['armor'] = '101',
                            ['required_str'] = '352',
                            ['required_agi'] = '105',
                        },
                        ['14'] = {
                            ['armor'] = '109',
                            ['required_str'] = '358',
                            ['required_agi'] = '107',
                        },
                        ['15'] = {
                            ['armor'] = '118',
                            ['required_str'] = '364',
                            ['required_agi'] = '108',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Sunlight Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '40',
                            ['required_str'] = '224',
                            ['required_agi'] = '72',
                        },
                        ['1'] = {
                            ['armor'] = '43',
                            ['required_str'] = '230',
                            ['required_agi'] = '74',
                        },
                        ['2'] = {
                            ['armor'] = '46',
                            ['required_str'] = '235',
                            ['required_agi'] = '75',
                        },
                        ['3'] = {
                            ['armor'] = '49',
                            ['required_str'] = '241',
                            ['required_agi'] = '77',
                        },
                        ['4'] = {
                            ['armor'] = '52',
                            ['required_str'] = '246',
                            ['required_agi'] = '78',
                        },
                        ['5'] = {
                            ['armor'] = '55',
                            ['required_str'] = '252',
                            ['required_agi'] = '80',
                        },
                        ['6'] = {
                            ['armor'] = '58',
                            ['required_str'] = '258',
                            ['required_agi'] = '81',
                        },
                        ['7'] = {
                            ['armor'] = '61',
                            ['required_str'] = '263',
                            ['required_agi'] = '82',
                        },
                        ['8'] = {
                            ['armor'] = '64',
                            ['required_str'] = '269',
                            ['required_agi'] = '84',
                        },
                        ['9'] = {
                            ['armor'] = '67',
                            ['required_str'] = '274',
                            ['required_agi'] = '85',
                        },
                        ['10'] = {
                            ['armor'] = '71',
                            ['required_str'] = '280',
                            ['required_agi'] = '87',
                        },
                        ['11'] = {
                            ['armor'] = '76',
                            ['required_str'] = '285',
                            ['required_agi'] = '88',
                        },
                        ['12'] = {
                            ['armor'] = '82',
                            ['required_str'] = '291',
                            ['required_agi'] = '90',
                        },
                        ['13'] = {
                            ['armor'] = '89',
                            ['required_str'] = '297',
                            ['required_agi'] = '91',
                        },
                        ['14'] = {
                            ['armor'] = '97',
                            ['required_str'] = '302',
                            ['required_agi'] = '92',
                        },
                        ['15'] = {
                            ['armor'] = '106',
                            ['required_str'] = '308',
                            ['required_agi'] = '94',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Sunlight Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '67',
                            ['required_str'] = '299',
                            ['required_agi'] = '92',
                        },
                        ['1'] = {
                            ['armor'] = '70',
                            ['required_str'] = '304',
                            ['required_agi'] = '93',
                        },
                        ['2'] = {
                            ['armor'] = '73',
                            ['required_str'] = '310',
                            ['required_agi'] = '94',
                        },
                        ['3'] = {
                            ['armor'] = '76',
                            ['required_str'] = '315',
                            ['required_agi'] = '96',
                        },
                        ['4'] = {
                            ['armor'] = '79',
                            ['required_str'] = '321',
                            ['required_agi'] = '97',
                        },
                        ['5'] = {
                            ['armor'] = '82',
                            ['required_str'] = '326',
                            ['required_agi'] = '99',
                        },
                        ['6'] = {
                            ['armor'] = '85',
                            ['required_str'] = '332',
                            ['required_agi'] = '100',
                        },
                        ['7'] = {
                            ['armor'] = '88',
                            ['required_str'] = '338',
                            ['required_agi'] = '102',
                        },
                        ['8'] = {
                            ['armor'] = '91',
                            ['required_str'] = '343',
                            ['required_agi'] = '103',
                        },
                        ['9'] = {
                            ['armor'] = '95',
                            ['required_str'] = '349',
                            ['required_agi'] = '104',
                        },
                        ['10'] = {
                            ['armor'] = '100',
                            ['required_str'] = '354',
                            ['required_agi'] = '106',
                        },
                        ['11'] = {
                            ['armor'] = '106',
                            ['required_str'] = '360',
                            ['required_agi'] = '107',
                        },
                        ['12'] = {
                            ['armor'] = '113',
                            ['required_str'] = '365',
                            ['required_agi'] = '109',
                        },
                        ['13'] = {
                            ['armor'] = '121',
                            ['required_str'] = '371',
                            ['required_agi'] = '110',
                        },
                        ['14'] = {
                            ['armor'] = '130',
                            ['required_str'] = '377',
                            ['required_agi'] = '112',
                        },
                        ['15'] = {
                            ['armor'] = '139',
                            ['required_str'] = '383',
                            ['required_agi'] = '114',
                        },
                    },
                },
            },
            ['class'] = {
                'summoner',
            },
        },
        ['Glorious'] = {
            ['items'] = {
                ['helm'] = {
                    ['name'] = 'Glorious Helm',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '30',
                            ['required_str'] = '252',
                            ['required_agi'] = '81',
                        },
                        ['1'] = {
                            ['armor'] = '33',
                            ['required_str'] = '260',
                            ['required_agi'] = '83',
                        },
                        ['2'] = {
                            ['armor'] = '36',
                            ['required_str'] = '267',
                            ['required_agi'] = '84',
                        },
                        ['3'] = {
                            ['armor'] = '39',
                            ['required_str'] = '274',
                            ['required_agi'] = '86',
                        },
                        ['4'] = {
                            ['armor'] = '42',
                            ['required_str'] = '281',
                            ['required_agi'] = '88',
                        },
                        ['5'] = {
                            ['armor'] = '45',
                            ['required_str'] = '288',
                            ['required_agi'] = '90',
                        },
                        ['6'] = {
                            ['armor'] = '48',
                            ['required_str'] = '296',
                            ['required_agi'] = '92',
                        },
                        ['7'] = {
                            ['armor'] = '51',
                            ['required_str'] = '303',
                            ['required_agi'] = '94',
                        },
                        ['8'] = {
                            ['armor'] = '54',
                            ['required_str'] = '310',
                            ['required_agi'] = '96',
                        },
                        ['9'] = {
                            ['armor'] = '57',
                            ['required_str'] = '317',
                            ['required_agi'] = '98',
                        },
                        ['10'] = {
                            ['armor'] = '61',
                            ['required_str'] = '324',
                            ['required_agi'] = '100',
                        },
                        ['11'] = {
                            ['armor'] = '66',
                            ['required_str'] = '332',
                            ['required_agi'] = '101',
                        },
                        ['12'] = {
                            ['armor'] = '72',
                            ['required_str'] = '339',
                            ['required_agi'] = '103',
                        },
                        ['13'] = {
                            ['armor'] = '79',
                            ['required_str'] = '346',
                            ['required_agi'] = '105',
                        },
                        ['14'] = {
                            ['armor'] = '87',
                            ['required_str'] = '353',
                            ['required_agi'] = '107',
                        },
                        ['15'] = {
                            ['armor'] = '96',
                            ['required_str'] = '360',
                            ['required_agi'] = '109',
                        },
                    },
                },
                ['armor'] = {
                    ['name'] = 'Glorious Armor',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '47',
                            ['required_str'] = '272',
                            ['required_agi'] = '86',
                        },
                        ['1'] = {
                            ['armor'] = '50',
                            ['required_str'] = '279',
                            ['required_agi'] = '88',
                        },
                        ['2'] = {
                            ['armor'] = '53',
                            ['required_str'] = '286',
                            ['required_agi'] = '89',
                        },
                        ['3'] = {
                            ['armor'] = '56',
                            ['required_str'] = '293',
                            ['required_agi'] = '91',
                        },
                        ['4'] = {
                            ['armor'] = '59',
                            ['required_str'] = '300',
                            ['required_agi'] = '93',
                        },
                        ['5'] = {
                            ['armor'] = '62',
                            ['required_str'] = '308',
                            ['required_agi'] = '95',
                        },
                        ['6'] = {
                            ['armor'] = '65',
                            ['required_str'] = '315',
                            ['required_agi'] = '97',
                        },
                        ['7'] = {
                            ['armor'] = '68',
                            ['required_str'] = '322',
                            ['required_agi'] = '99',
                        },
                        ['8'] = {
                            ['armor'] = '71',
                            ['required_str'] = '329',
                            ['required_agi'] = '101',
                        },
                        ['9'] = {
                            ['armor'] = '74',
                            ['required_str'] = '336',
                            ['required_agi'] = '103',
                        },
                        ['10'] = {
                            ['armor'] = '78',
                            ['required_str'] = '344',
                            ['required_agi'] = '105',
                        },
                        ['11'] = {
                            ['armor'] = '83',
                            ['required_str'] = '351',
                            ['required_agi'] = '106',
                        },
                        ['12'] = {
                            ['armor'] = '89',
                            ['required_str'] = '358',
                            ['required_agi'] = '108',
                        },
                        ['13'] = {
                            ['armor'] = '96',
                            ['required_str'] = '365',
                            ['required_agi'] = '110',
                        },
                        ['14'] = {
                            ['armor'] = '104',
                            ['required_str'] = '372',
                            ['required_agi'] = '112',
                        },
                        ['15'] = {
                            ['armor'] = '113',
                            ['required_str'] = '380',
                            ['required_agi'] = '114',
                        },
                    },
                },
                ['boots'] = {
                    ['name'] = 'Glorious Boots',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '29',
                            ['required_str'] = '255',
                            ['required_agi'] = '81',
                        },
                        ['1'] = {
                            ['armor'] = '32',
                            ['required_str'] = '262',
                            ['required_agi'] = '83',
                        },
                        ['2'] = {
                            ['armor'] = '35',
                            ['required_str'] = '269',
                            ['required_agi'] = '85',
                        },
                        ['3'] = {
                            ['armor'] = '38',
                            ['required_str'] = '276',
                            ['required_agi'] = '87',
                        },
                        ['4'] = {
                            ['armor'] = '41',
                            ['required_str'] = '284',
                            ['required_agi'] = '89',
                        },
                        ['5'] = {
                            ['armor'] = '44',
                            ['required_str'] = '291',
                            ['required_agi'] = '91',
                        },
                        ['6'] = {
                            ['armor'] = '47',
                            ['required_str'] = '298',
                            ['required_agi'] = '93',
                        },
                        ['7'] = {
                            ['armor'] = '50',
                            ['required_str'] = '305',
                            ['required_agi'] = '94',
                        },
                        ['8'] = {
                            ['armor'] = '53',
                            ['required_str'] = '312',
                            ['required_agi'] = '96',
                        },
                        ['9'] = {
                            ['armor'] = '56',
                            ['required_str'] = '320',
                            ['required_agi'] = '98',
                        },
                        ['10'] = {
                            ['armor'] = '60',
                            ['required_str'] = '327',
                            ['required_agi'] = '100',
                        },
                        ['11'] = {
                            ['armor'] = '65',
                            ['required_str'] = '334',
                            ['required_agi'] = '102',
                        },
                        ['12'] = {
                            ['armor'] = '71',
                            ['required_str'] = '341',
                            ['required_agi'] = '104',
                        },
                        ['13'] = {
                            ['armor'] = '78',
                            ['required_str'] = '348',
                            ['required_agi'] = '106',
                        },
                        ['14'] = {
                            ['armor'] = '86',
                            ['required_str'] = '356',
                            ['required_agi'] = '108',
                        },
                        ['15'] = {
                            ['armor'] = '95',
                            ['required_str'] = '363',
                            ['required_agi'] = '110',
                        },
                    },
                },
                ['pants'] = {
                    ['name'] = 'Glorious Pants',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '35',
                            ['required_str'] = '262',
                            ['required_agi'] = '83',
                        },
                        ['1'] = {
                            ['armor'] = '38',
                            ['required_str'] = '269',
                            ['required_agi'] = '85',
                        },
                        ['2'] = {
                            ['armor'] = '41',
                            ['required_str'] = '276',
                            ['required_agi'] = '87',
                        },
                        ['3'] = {
                            ['armor'] = '44',
                            ['required_str'] = '284',
                            ['required_agi'] = '89',
                        },
                        ['4'] = {
                            ['armor'] = '47',
                            ['required_str'] = '291',
                            ['required_agi'] = '91',
                        },
                        ['5'] = {
                            ['armor'] = '50',
                            ['required_str'] = '298',
                            ['required_agi'] = '93',
                        },
                        ['6'] = {
                            ['armor'] = '53',
                            ['required_str'] = '305',
                            ['required_agi'] = '94',
                        },
                        ['7'] = {
                            ['armor'] = '56',
                            ['required_str'] = '312',
                            ['required_agi'] = '96',
                        },
                        ['8'] = {
                            ['armor'] = '59',
                            ['required_str'] = '320',
                            ['required_agi'] = '98',
                        },
                        ['9'] = {
                            ['armor'] = '62',
                            ['required_str'] = '327',
                            ['required_agi'] = '100',
                        },
                        ['10'] = {
                            ['armor'] = '66',
                            ['required_str'] = '334',
                            ['required_agi'] = '102',
                        },
                        ['11'] = {
                            ['armor'] = '71',
                            ['required_str'] = '341',
                            ['required_agi'] = '104',
                        },
                        ['12'] = {
                            ['armor'] = '77',
                            ['required_str'] = '348',
                            ['required_agi'] = '106',
                        },
                        ['13'] = {
                            ['armor'] = '84',
                            ['required_str'] = '356',
                            ['required_agi'] = '108',
                        },
                        ['14'] = {
                            ['armor'] = '92',
                            ['required_str'] = '363',
                            ['required_agi'] = '110',
                        },
                        ['15'] = {
                            ['armor'] = '101',
                            ['required_str'] = '370',
                            ['required_agi'] = '111',
                        },
                    },
                },
                ['gloves'] = {
                    ['name'] = 'Glorious Gloves',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '25',
                            ['required_str'] = '238',
                            ['required_agi'] = '77',
                        },
                        ['1'] = {
                            ['armor'] = '28',
                            ['required_str'] = '245',
                            ['required_agi'] = '79',
                        },
                        ['2'] = {
                            ['armor'] = '31',
                            ['required_str'] = '252',
                            ['required_agi'] = '81',
                        },
                        ['3'] = {
                            ['armor'] = '34',
                            ['required_str'] = '260',
                            ['required_agi'] = '83',
                        },
                        ['4'] = {
                            ['armor'] = '37',
                            ['required_str'] = '267',
                            ['required_agi'] = '84',
                        },
                        ['5'] = {
                            ['armor'] = '40',
                            ['required_str'] = '274',
                            ['required_agi'] = '86',
                        },
                        ['6'] = {
                            ['armor'] = '43',
                            ['required_str'] = '281',
                            ['required_agi'] = '88',
                        },
                        ['7'] = {
                            ['armor'] = '46',
                            ['required_str'] = '288',
                            ['required_agi'] = '90',
                        },
                        ['8'] = {
                            ['armor'] = '49',
                            ['required_str'] = '296',
                            ['required_agi'] = '92',
                        },
                        ['9'] = {
                            ['armor'] = '52',
                            ['required_str'] = '303',
                            ['required_agi'] = '94',
                        },
                        ['10'] = {
                            ['armor'] = '56',
                            ['required_str'] = '310',
                            ['required_agi'] = '96',
                        },
                        ['11'] = {
                            ['armor'] = '61',
                            ['required_str'] = '317',
                            ['required_agi'] = '98',
                        },
                        ['12'] = {
                            ['armor'] = '67',
                            ['required_str'] = '324',
                            ['required_agi'] = '100',
                        },
                        ['13'] = {
                            ['armor'] = '74',
                            ['required_str'] = '332',
                            ['required_agi'] = '101',
                        },
                        ['14'] = {
                            ['armor'] = '82',
                            ['required_str'] = '339',
                            ['required_agi'] = '103',
                        },
                        ['15'] = {
                            ['armor'] = '91',
                            ['required_str'] = '346',
                            ['required_agi'] = '105',
                        },
                    },
                },
                ['shield'] = {
                    ['name'] = 'Glorious Shield',
                    ['stats'] = {
                        ['0'] = {
                            ['armor'] = '50',
                            ['required_str'] = '279',
                            ['required_agi'] = '88',
                        },
                        ['1'] = {
                            ['armor'] = '53',
                            ['required_str'] = '286',
                            ['required_agi'] = '89',
                        },
                        ['2'] = {
                            ['armor'] = '56',
                            ['required_str'] = '293',
                            ['required_agi'] = '91',
                        },
                        ['3'] = {
                            ['armor'] = '59',
                            ['required_str'] = '300',
                            ['required_agi'] = '93',
                        },
                        ['4'] = {
                            ['armor'] = '62',
                            ['required_str'] = '308',
                            ['required_agi'] = '95',
                        },
                        ['5'] = {
                            ['armor'] = '65',
                            ['required_str'] = '315',
                            ['required_agi'] = '97',
                        },
                        ['6'] = {
                            ['armor'] = '68',
                            ['required_str'] = '322',
                            ['required_agi'] = '99',
                        },
                        ['7'] = {
                            ['armor'] = '71',
                            ['required_str'] = '329',
                            ['required_agi'] = '101',
                        },
                        ['8'] = {
                            ['armor'] = '74',
                            ['required_str'] = '336',
                            ['required_agi'] = '103',
                        },
                        ['9'] = {
                            ['armor'] = '78',
                            ['required_str'] = '344',
                            ['required_agi'] = '105',
                        },
                        ['10'] = {
                            ['armor'] = '83',
                            ['required_str'] = '351',
                            ['required_agi'] = '106',
                        },
                        ['11'] = {
                            ['armor'] = '89',
                            ['required_str'] = '358',
                            ['required_agi'] = '108',
                        },
                        ['12'] = {
                            ['armor'] = '96',
                            ['required_str'] = '365',
                            ['required_agi'] = '110',
                        },
                        ['13'] = {
                            ['armor'] = '104',
                            ['required_str'] = '372',
                            ['required_agi'] = '112',
                        },
                        ['14'] = {
                            ['armor'] = '113',
                            ['required_str'] = '380',
                            ['required_agi'] = '114',
                        },
                        ['15'] = {
                            ['armor'] = '122',
                            ['required_str'] = '388',
                            ['required_agi'] = '116',
                        },
                    },
                },
            },
            ['class'] = {
                'summoner',
            },
        },
    }
}