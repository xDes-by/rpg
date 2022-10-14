ability_npc_boss_cave2_spell1 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_cave2_spell1","abilities/cave2/ability_npc_boss_cave2_spell1", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_cave2_spell1:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_cave2_spell1"
end

modifier_ability_npc_boss_cave2_spell1 = class({})

--Classifications template
function modifier_ability_npc_boss_cave2_spell1:IsHidden()
    return true
end

function modifier_ability_npc_boss_cave2_spell1:IsPurgable()
    return false
end

function modifier_ability_npc_boss_cave2_spell1:OnCreated()
    self.crit = self:GetAbility():GetSpecialValueFor("crit")
    self.gold = self:GetAbility():GetSpecialValueFor("gold")
end

function modifier_ability_npc_boss_cave2_spell1:OnRefresh()
    self.crit = self:GetAbility():GetSpecialValueFor("crit")
    self.gold = self:GetAbility():GetSpecialValueFor("gold")
end

function modifier_ability_npc_boss_cave2_spell1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE
    }
end

function modifier_ability_npc_boss_cave2_spell1:GetModifierPreAttack_CriticalStrike(data)
    if self:GetAbility():IsCooldownReady() and data.target:IsRealHero() then
        EmitSoundOn("Hero_BountyHunter.Jinada", data.target)
        data.target:SpendGold(-self.gold, DOTA_ModifyGold_Unspecified)
        self:GetAbility():UseResources(true, true, true)
        return self.crit
    end
end