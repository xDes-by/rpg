AddonGamemode.CreepExpZones = {2200, 2200, 2200, 2200}
AddonGamemode.CreepGoldZones = {3500, 3500, 3500, 3500}

forest_2_creeps = {
    [1] = {"npc_forest_2_wave_1_melee", "npc_forest_2_wave_1_range"},
    [2] = {"npc_forest_2_wave_2_mini", "npc_forest_2_wave_2_big"},
    [3] = {"npc_forest_2_wave_3_mini", "npc_forest_2_wave_3_big"},
    [4] = {"npc_forest_2_wave_4_mini", "npc_forest_2_wave_4_big"},
    [5] = {"npc_forest_2_wave_5_mini", "npc_forest_2_wave_5_big"},
}


















AddonGamemode.MapProperty = {
    ["forest"] = {"map_forest_1", "map_forest_3"},
    ["gaveyard"] = {"map_gaveyard_1", "map_gaveyard_2", "map_gaveyard_3"},
    ["hell"] = {"map_hell_1", "map_hell_2",},
    ["cave"] = {"map_cave_1", "map_cave_2", "map_cave_3"},
    ["jungle"] = {"map_jungle_1", "map_jungle_2", "map_jungle_3"},
    ["desert"] = {"map_desert_1", "map_desert_2", "map_desert_3"},

    --------------------------------------
    --1зеденая вверх
    --2красная вверх
    --3зелена вниз
    --4красная вниз
    --5зелена-красная вверх
    --6зеленая-красная вних
    ---------------------------------------
}

AddonGamemode.MapProperty_start = {
    ["forest"] = {"map_forest_1", "map_forest_3"},
    ["gaveyard"] = {"map_gaveyard_1", "map_gaveyard_2", "map_gaveyard_3"},
    ["hell"] = {"map_hell_1", "map_hell_2",},
    ["cave"] = {"map_cave_1", "map_cave_2", "map_cave_3"},
    ["jungle"] = {"map_jungle_1", "map_jungle_2", "map_jungle_3"},
    ["desert"] = {"map_desert_1", "map_desert_3"},
}

--AddonGamemode.MapProperty_start = {
--    ["forest"] = {"map_forest_1", "map_forest_3"},
--    ["gaveyard"] = {"map_gaveyard_1", "map_gaveyard_2", "map_gaveyard_3"},
--    ["hell"] = {"map_hell_1", "map_hell_2", "map_hell_3"},
--    ["cave"] = {"map_cave_1", "map_cave_2", "map_cave_3"},
--    ["jungle"] = {"map_jungle_1", "map_jungle_2", "map_jungle_3"},
--    ["desert"] = {"map_desert_1", "map_desert_2"},
--}

AddonGamemode.GameRaseList = {
    ["hero_abyssal_underlord"] = "inferno",
    ["hero_axe"] = "troll",
    ["hero_disruptor"] = "troll",
    ["hero_dazzle"] = "troll",
    ["hero_furion"] = "druid",
    ["hero_gyrocopter"] = "engineer",
    ["hero_hoodwink"] = "beast",
    ["hero_juggernaut"] = "troll",
    ["hero_keeper_of_the_light"] = "druid",
    ["hero_leshrac"] = "beast",
    ["hero_lone_druid"] = "druid",
    ["hero_nevermore"] = "inferno",
    ["hero_queenofpain"] = "inferno",
    ["hero_shredder"] = "engineer",
    ["hero_skeleton_king"] = "necropol",
    ["hero_tinker"] = "engineer",
    ["hero_treant"] = "druid",
    ["hero_tusk"] = "beast",
    ["hero_undying"] = "necropol",
    ["hero_visage"] = "inferno",
    ["hero_death_prophet"] = "necropol",
    ["hero_necrolyte"] = "necropol",
    ["hero_techies"] = "engineer",
    ["hero_monkey_king"] = "beast",
}

AddonGamemode.GameClassList = {
    ["hero_abyssal_underlord"] = "tank",
    ["hero_axe"] = "tank",
    ["hero_disruptor"] = "mage",
    ["hero_dazzle"] = "support",
    ["hero_furion"] = "damager",
    ["hero_gyrocopter"] = "damager",
    ["hero_hoodwink"] = "support",
    ["hero_juggernaut"] = "damager",
    ["hero_keeper_of_the_light"] = "mage",
    ["hero_leshrac"] = "mage",
    ["hero_lone_druid"] = "tank",
    ["hero_nevermore"] = "damager",
    ["hero_queenofpain"] = "mage",
    ["hero_shredder"] = "tank",
    ["hero_skeleton_king"] = "damager",
    ["hero_tinker"] = "support",
    ["hero_treant"] = "support",
    ["hero_tusk"] = "tank",
    ["hero_undying"] = "tank",
    ["hero_visage"] = "support",
    ["hero_death_prophet"] = "mage",
    ["hero_necrolyte"] = "support",
    ["hero_techies"] = "mage",
    ["hero_monkey_king"] = "damager",
}

-- MapLogic.CurrectRoomNumber = 0

-- MapLogic.CreepMultiplier = MapLogic.CurrectRoomNumber + 1.2

-- MapLogic.VavesForest1 = {
    -- [1] = {"npc_forest1_wave1_mele","npc_forest1_wave1_range"},
    -- [2] = {"npc_forest1_wave2_skelet","npc_forest1_wave2_zomby"},
    -- [3] = {"npc_forest1_wave3_trol","npc_forest1_wave3_wolf","npc_forest1_wave3_ursa","npc_forest1_wave3_pine_cone"},
    -- [4] = {"npc_forest1_wave4_treant_armor","npc_forest1_wave4_treant_hp"},
-- }

-- MapLogic.MapCenterPosition = {
    -- ["mapname"] = Vector(0,0,0),
-- }

AddonGamemode.xpTable = {
    [0] = 0, --230
    [1] = 230, --370
    [2] = 600, --480
    [3] = 1080, --580
    [4] = 1660, --600
    [5] = 2260, --720
    [6] = 2980, --750
    [7] = 3730, --780
    [8] = 4510, --810
    [9] = 5320, --840
    [10] = 6160, --870
    [11] = 7030, --900
    [12] = 7930, --1225
    [13] = 9155, --1250
    [14] = 10405, --1275
    [15] = 11680, --1300
    [16] = 12980, --1325
    [17] = 14305, --1500
    [18] = 15805, --1590
    [19] = 17395, --1600
    [20] = 18995, --1850
    [21] = 20845, --2100
    [22] = 22945, --2350
    [23] = 25295, --2600
    [24] = 27895, --3500
    [25] = 31395, --4500
    [26] = 35895, --5500
    [27] = 41395, --6500
    [28] = 47895, --7500
    [29] = 55395, --
}

AddonGamemode.ModifyExpByPlayerCount = {
    [1] = 0.6,
    [2] = 0.75,
    [3] = 0.9,
    [4] = 1
}
















--modifier_talent = class({})

--function modifier_talent:IsHidden()
--    return true
--end

--function modifier_talent:DeclareFunctions()
--    return {
--        MODIFIER_PROPERTY_OVERRIDE_ABILITY_SPECIAL,
--        MODIFIER_PROPERTY_OVERRIDE_ABILITY_SPECIAL_VALUE 
--}
--end

--function modifier_talent:GetModifierOverrideAbilitySpecial(data)
--    if data.ability:GetName() == "ability_npc_gaveyard3_spider" and data.ability_special_value == "damage" then
--        return 1
--    end
--end

--function modifier_talent:GetModifierOverrideAbilitySpecialValue(data)
--    if data.ability:GetName() == "ability_npc_gaveyard3_spider" and data.ability_special_value == "damage" then
--        return data.ability:GetLevelSpecialValueNoOverride(data.ability_special_value, data.level) + 10
--    end
--end