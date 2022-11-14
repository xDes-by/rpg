LinkLuaModifier( "modidfier_ability_npc_boss_mines_1_spell_1","abilities/mines/mines_1/ability_npc_boss_mines_1_spell_1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modidfier_ability_npc_boss_cave1_spell2","abilities/mines/mines_1/ability_npc_boss_mines_1_spell_2", LUA_MODIFIER_MOTION_NONE )

ability_npc_boss_mines_1_spell_1 = class({})

function ability_npc_boss_mines_1_spell_1:Precache(context)
    PrecacheResource( "particle", "particles/npc_dota_hero_treant/npc_dota_hero_treant_spell1.vpcf", context )
    PrecacheResource( "particle", "particles/econ/items/pangolier/pangolier_ti8_immortal/pangolier_ti8_immortal_shield_buff.vpcf", context )
    PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_razor.vsndevts", context )
end

function ability_npc_boss_mines_1_spell_1:OnSpellStart()
    local unit = CreateUnitByName("npc_boss_summon_cave1", self:GetCursorPosition(), true, nil, nil, DOTA_TEAM_BADGUYS )
    unit:AddNewModifier(self:GetCaster(), self, "modidfier_ability_npc_boss_mines_1_spell_1", {duration = 5})
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modidfier_ability_npc_boss_cave1_spell2", {})
end

------------------------------------------------------------------------------------------------------------------------------------------------

modidfier_ability_npc_boss_mines_1_spell_1 = class({})

function modidfier_ability_npc_boss_mines_1_spell_1:IsHidden()
    return true
end

function modidfier_ability_npc_boss_mines_1_spell_1:IsPurgable()
    return false
end

function modidfier_ability_npc_boss_mines_1_spell_1:DestroyOnExpire()
    return true
end

function modidfier_ability_npc_boss_mines_1_spell_1:OnCreated()
    self:StartIntervalThink(2)
    self:OnIntervalThink()
end

function modidfier_ability_npc_boss_mines_1_spell_1:OnDestroy()
    UTIL_Remove(self:GetParent())
end

function modidfier_ability_npc_boss_mines_1_spell_1:OnIntervalThink()
    local radius = 500
    local speed = 500
    local damage = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * self:GetAbility():GetSpecialValueFor("damage_mult") * 0.01
    local effect_cast = ParticleManager:CreateParticle( "particles/npc_dota_hero_treant/npc_dota_hero_treant_spell1.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
    ParticleManager:SetParticleControl( effect_cast, 1, Vector( speed, radius, 1 ) )

    EmitSoundOn( "Ability.PlasmaField", self:GetParent() )

    local pulse = self:GetParent():AddNewModifier(
        self:GetCaster(), -- player source
        self:GetAbility(), -- ability source
        "modifier_generic_ring_lua", -- modifier name
        {
            end_radius = radius,
            speed = speed,
            target_team = DOTA_UNIT_TARGET_TEAM_ENEMY,
            target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        } -- kv
    )
    pulse:SetCallback( function( enemy )
        enemy:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = 1})
        ApplyDamage({victim = enemy,
        damage =  damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = unit,
        ability = self})
    end)

    pulse:SetEndCallback( function()
        ParticleManager:SetParticleControl( effect_cast, 1, Vector( speed, radius, -1 ) )

        ParticleManager:DestroyParticle( effect_cast, false )
        ParticleManager:ReleaseParticleIndex( effect_cast )
    end)
end

