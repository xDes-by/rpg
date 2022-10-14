npc_dota_hero_treant_spell6 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_treant_spell6", "heroes/npc_dota_hero_treant/npc_dota_hero_treant_spell6", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_treant_spell6:OnSpellStart()
    local duration = self:GetSpecialValueFor("duration")
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, unit:GetAbsOrigin(), nil, 9999, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, 0, 0,false)
    for _,unit in pairs(enemies) do
        unit:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_treant_spell6", {duration = duration})
    end
end

modifier_npc_dota_hero_treant_spell6 = class({})
--Classifications template
function modifier_npc_dota_hero_treant_spell6:IsHidden()
    return false
end

function modifier_npc_dota_hero_treant_spell6:IsDebuff()
    return false
end

function modifier_npc_dota_hero_treant_spell6:IsPurgable()
    return true
end

function modifier_npc_dota_hero_treant_spell6:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_treant_spell6:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_treant_spell6:OnCreated()
    self.out = self:GetAbility():GetSpecialValueFor("bonus_uron")
    self.ev = self:GetAbility():GetSpecialValueFor("evation")
end

function modifier_npc_dota_hero_treant_spell6:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE,
        MODIFIER_PROPERTY_EVASION_CONSTANT
    }
end

function modifier_npc_dota_hero_treant_spell6:GetModifierDamageOutgoing_Percentage()
    return self.out 
end

function modifier_npc_dota_hero_treant_spell6:GetModifierEvasion_Constant()
    return self.ev
end
