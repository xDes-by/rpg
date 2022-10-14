ability_npc_desert2_lizard_spell2 = class({})

LinkLuaModifier( "modifier_ability_npc_desert2_lizard_spell2","abilities/desert2/ability_npc_desert2_lizard_spell2", LUA_MODIFIER_MOTION_NONE )

function ability_npc_desert2_lizard_spell2:OnSpellStart()
    local pfx = ParticleManager:CreateParticle("particles/neutral_fx/ursa_thunderclap.vpcf", PATTACH_POINT, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 1, Vector(500, 0, 0))
    ParticleManager:ReleaseParticleIndex(pfx)
    local dur = self:GetSpecialValueFor("duration")
    local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 500, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
    for _,unit in pairs() do
        unit:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_desert2_lizard_spell2", {duration = dur})
    end
end

modifier_ability_npc_desert2_lizard_spell2 = class({})
--Classifications template
function modifier_ability_npc_desert2_lizard_spell2:IsHidden()
    return false
end

function modifier_ability_npc_desert2_lizard_spell2:IsDebuff()
    return true
end

function modifier_ability_npc_desert2_lizard_spell2:IsPurgable()
    return true
end

function modifier_ability_npc_desert2_lizard_spell2:RemoveOnDeath()
    return true
end

function modifier_ability_npc_desert2_lizard_spell2:DestroyOnExpire()
    return true
end

function modifier_ability_npc_desert2_lizard_spell2:OnCreated()
    self.ats = self:GetAbility():GetSpecialValueFor("ats")
    self.ms = self:GetAbility():GetSpecialValueFor("ms")
end

function modifier_ability_npc_desert2_lizard_spell2:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
    }
end

function modifier_ability_npc_desert2_lizard_spell2:GetModifierAttackSpeedBonus_Constant()
    return -self.ats
end

function modifier_ability_npc_desert2_lizard_spell2:GetModifierMoveSpeedBonus_Percentage()
    return -self.ms
end