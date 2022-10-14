ability_npc_boss_gaveyard3_spell4 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_gaveyard3_spell4","abilities/gaveyard3/ability_npc_boss_gaveyard3_spell4", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_gaveyard3_spell4_effect","abilities/gaveyard3/ability_npc_boss_gaveyard3_spell4", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_gaveyard3_spell4:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_gaveyard3_spell4"
end

modifier_ability_npc_boss_gaveyard3_spell4 = class({})

--Classifications template
function modifier_ability_npc_boss_gaveyard3_spell4:IsHidden()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell4:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard3_spell4:OnCreated()
    self.duration = self:GetAbility():GetSpecialValueFor("duration")
end

function modifier_ability_npc_boss_gaveyard3_spell4:OnRefresh()
    self:OnCreated()
end

function modifier_ability_npc_boss_gaveyard3_spell4:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
end

function modifier_ability_npc_boss_gaveyard3_spell4:OnAttackLanded(data)
    if self:GetParent() == data.target and RollPseudoRandom(100,self:GetParent()) then
        data.attacker:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_gaveyard3_spell4_effect", {duration = self.duration})
    end
end

modifier_ability_npc_boss_gaveyard3_spell4_effect = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard3_spell4_effect:IsHidden()
    return false
end

function modifier_ability_npc_boss_gaveyard3_spell4_effect:IsDebuff()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell4_effect:IsPurgable()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell4_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell4_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell4_effect:CheckState()
    return {
        [MODIFIER_STATE_DISARMED] = true
    }
end

function modifier_ability_npc_boss_gaveyard3_spell4_effect:GetEffectName()
    return "particles/items2_fx/heavens_halberd.vpcf"
end