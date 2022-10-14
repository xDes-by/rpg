ability_npc_boss_gaveyard1_spell5 = class({})

LinkLuaModifier("modifier_ability_npc_boss_gaveyard1_spell5", "abilities/gaveyard1/ability_npc_boss_gaveyard1_spell5", LUA_MODIFIER_MOTION_NONE)

function ability_npc_boss_gaveyard1_spell5:OnSpellStart()
    local pos = self:GetCaster():GetAbsOrigin() + self:GetCaster():GetForwardVector() * 300
    for i=1,3 do
        local unit = CreateUnitByName("npc_gaveyard1_kostyan", pos, true, nil, nil, DOTA_TEAM_BADGUYS )
        unit:AddNewModifier(unit, nil, "modifier_ability_npc_boss_gaveyard1_spell5", nil)
    end
end

modifier_ability_npc_boss_gaveyard1_spell5 = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard1_spell5:IsHidden()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell5:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard1_spell5:OnCreated()
    if IsClient() then
        return
    end
    self.damage = self:GetParent():GetAverageTrueAttackDamage(self:GetParent()) * 0.9
end

function modifier_ability_npc_boss_gaveyard1_spell5:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
        MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
    }
end

function modifier_ability_npc_boss_gaveyard1_spell5:GetModifierProcAttack_Feedback(data)
    if RollPseudoRandom(5,self:GetParent()) then
        data.target:AddNewModifier(self:GetParent(), nil, "modifier_stunned", {duration = 1.5})
    end
end

function modifier_ability_npc_boss_gaveyard1_spell5:GetModifierAttackSpeedBonus_Constant()
    return 250
end

function modifier_ability_npc_boss_gaveyard1_spell5:GetModifierBaseAttack_BonusDamage()
    return -self.damage
end