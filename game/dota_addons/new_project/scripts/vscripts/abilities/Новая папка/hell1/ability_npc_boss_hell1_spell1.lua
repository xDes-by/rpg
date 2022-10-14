ability_npc_boss_hell1_spell1 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_hell1_spell1","abilities/hell1/ability_npc_boss_hell1_spell1", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_hell1_spell1:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_hell1_spell1", {duration = 3})
end

modifier_ability_npc_boss_hell1_spell1 = class({})
--Classifications template
function modifier_ability_npc_boss_hell1_spell1:IsHidden()
    return false
end

function modifier_ability_npc_boss_hell1_spell1:IsDebuff()
    return false
end

function modifier_ability_npc_boss_hell1_spell1:IsPurgable()
    return false
end

function modifier_ability_npc_boss_hell1_spell1:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_hell1_spell1:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_hell1_spell1:OnCreated()
    self.regen = self:GetAbility():GetSpecialValueFor("regen")
    local pfx = ParticleManager:CreateParticle("particles/econ/items/winter_wyvern/winter_wyvern_ti7/wyvern_cold_embrace_ti7buff.vpcf", PATTACH_POINT, self:GetParent())
    self:AddParticle(pfx,false,false,-1,false, false)
end

function modifier_ability_npc_boss_hell1_spell1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE
    }
end

function modifier_ability_npc_boss_hell1_spell1:CheckState()
    return {
        [MODIFIER_STATE_STUNNED] = true
    }
end

function modifier_ability_npc_boss_hell1_spell1:GetModifierHealthRegenPercentage()
    return self.regen
end