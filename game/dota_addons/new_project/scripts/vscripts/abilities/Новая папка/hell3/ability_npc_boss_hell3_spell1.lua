ability_npc_boss_hell3_spell1 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_hell3_spell1","abilities/hell3/ability_npc_boss_hell3_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_hell3_spell1_effect","abilities/hell3/ability_npc_boss_hell3_spell1", LUA_MODIFIER_MOTION_NONE )



function ability_npc_boss_hell3_spell1:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_hell3_spell1"
end

modifier_ability_npc_boss_hell3_spell1 = class({})

--Classifications template
function modifier_ability_npc_boss_hell3_spell1:IsHidden()
    return true
end

function modifier_ability_npc_boss_hell3_spell1:IsPurgable()
    return false
end

function modifier_ability_npc_boss_hell3_spell1:RemoveOnDeath()
   return false
end

function modifier_ability_npc_boss_hell3_spell1:OnCreated()
    local pfx = ParticleManager:CreateParticle("particles/econ/items/ember_spirit/ember_ti9/ember_ti9_flameguard.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 1, self:GetCaster():GetAbsOrigin())
    ParticleManager:ReleaseParticleIndex(pfx)
end

-- Aura template
function modifier_ability_npc_boss_hell3_spell1:IsAura()
    return true
end

function modifier_ability_npc_boss_hell3_spell1:GetModifierAura()
    return "modifier_ability_npc_boss_hell3_spell1_effect"
end

function modifier_ability_npc_boss_hell3_spell1:GetAuraRadius()
    return 500
end

function modifier_ability_npc_boss_hell3_spell1:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_boss_hell3_spell1:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_boss_hell3_spell1:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_boss_hell3_spell1:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_boss_hell3_spell1_effect = class({})
--Classifications template
function modifier_ability_npc_boss_hell3_spell1_effect:IsHidden()
    return false
end

function modifier_ability_npc_boss_hell3_spell1_effect:IsDebuff()
    return true
end

function modifier_ability_npc_boss_hell3_spell1_effect:IsPurgable()
    return true
end

function modifier_ability_npc_boss_hell3_spell1_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_hell3_spell1_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_hell3_spell1_effect:OnCreated()
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    if IsClient() then
        return
    end
    self:StartIntervalThink(1)
end

function modifier_ability_npc_boss_hell3_spell1_effect:OnRefresh()
    self:OnCreated()
end

function modifier_ability_npc_boss_hell3_spell1_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage = self.damage,
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end