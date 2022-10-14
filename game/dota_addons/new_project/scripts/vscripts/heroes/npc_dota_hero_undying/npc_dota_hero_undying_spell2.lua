npc_dota_hero_undying_spell2 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_undying_spell2", "heroes/npc_dota_hero_undying/npc_dota_hero_undying_spell2", LUA_MODIFIER_MOTION_NONE)


function npc_dota_hero_undying_spell2:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_undying_spell2", {duration = self:GetSpecialValueFor("duration")})
end

modifier_npc_dota_hero_undying_spell2 = class({})
--Classifications template
function modifier_npc_dota_hero_undying_spell2:IsHidden()
    return false
end

function modifier_npc_dota_hero_undying_spell2:IsDebuff()
    return false
end

function modifier_npc_dota_hero_undying_spell2:IsPurgable()
    return false
end

function modifier_npc_dota_hero_undying_spell2:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_undying_spell2:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_undying_spell2:OnCreated()
    self.sprbonus = self:GetCaster():GetStrength() * self:GetAbility():GetSpecialValueFor("str_persent_bonus") * 0.01
end

function modifier_npc_dota_hero_undying_spell2:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_MODEL_CHANGE
    }
end

function modifier_npc_dota_hero_undying_spell2:GetModifierBonusStats_Strength()
    return self.sprbonus
end

function modifier_npc_dota_hero_undying_spell2:GetModifierModelChange()
    return "models/heroes/undying/undying_flesh_golem.vmdl"
end