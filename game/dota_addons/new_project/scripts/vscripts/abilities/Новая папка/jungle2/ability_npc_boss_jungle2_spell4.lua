ability_npc_boss_jungle2_spell4 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle2_spell4","abilities/jungle2/ability_npc_boss_jungle2_spell4", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle2_spell4:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_jungle2_spell4"
end

modifier_ability_npc_boss_jungle2_spell4 = class({})

--Classifications template
function modifier_ability_npc_boss_jungle2_spell4:IsHidden()
    return true
end

function modifier_ability_npc_boss_jungle2_spell4:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle2_spell4:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE
    }
end

function modifier_ability_npc_boss_jungle2_spell4:OnCreated()
    self.chance = self:GetAbility():GetSpecialValueFor("chance")
    self.crit = self:GetAbility():GetSpecialValueFor("crit")
end

function modifier_ability_npc_boss_jungle2_spell4:OnRefresh()
    self:OnCreated()
end


function modifier_ability_npc_boss_jungle2_spell4:GetModifierPreAttack_CriticalStrike()
    if RollPseudoRandom(self.chance,self:GetParent()) then
        return self.crit
    end
end