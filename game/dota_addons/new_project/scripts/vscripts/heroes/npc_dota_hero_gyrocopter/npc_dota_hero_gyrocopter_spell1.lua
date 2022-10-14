npc_dota_hero_gyrocopter_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_gyrocopter_spell1", "heroes/npc_dota_hero_gyrocopter/npc_dota_hero_gyrocopter_spell1", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_gyrocopter_spell1:OnSpellStart()
    local direction = self:GetCaster():GetForwardVector()
    local distance = self:GetSpecialValueFor("distance")
    local speed = distance / 1.2
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_simply_motion_controll", 
    {x = direction.x,
    y = direction.y,
    r = distance,
    s = speed,})
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_gyrocopter_spell1", {duration = 1.2})
end

modifier_npc_dota_hero_gyrocopter_spell1 = class({})
--Classifications template
function modifier_npc_dota_hero_gyrocopter_spell1:IsHidden()
    return false
end

function modifier_npc_dota_hero_gyrocopter_spell1:IsDebuff()
    return false
end

function modifier_npc_dota_hero_gyrocopter_spell1:IsPurgable()
    return false
end

function modifier_npc_dota_hero_gyrocopter_spell1:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_gyrocopter_spell1:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_gyrocopter_spell1:OnCreated()
    self.part = ParticleManager:CreateParticle("particles/units/heroes/hero_pangolier/pangolier_gyroshell.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster())
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.2)
end

function modifier_npc_dota_hero_gyrocopter_spell1:OnDestroy()
    ParticleManager:DestroyParticle(self.part, false)
end

function modifier_npc_dota_hero_gyrocopter_spell1:OnIntervalThink()
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetParent():GetAbsOrigin(), nil, 200, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        self:GetParent():PerformAttack(unit, false, false, true, false, true, false, true)
    end
end

function modifier_npc_dota_hero_gyrocopter_spell1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
        MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
    }
end

function modifier_npc_dota_hero_gyrocopter_spell1:GetOverrideAnimation()
    return ACT_DOTA_TAUNT
end

function modifier_npc_dota_hero_gyrocopter_spell1:GetOverrideAnimationRate()
    return 2.0
end

function modifier_npc_dota_hero_gyrocopter_spell1:GetActivityTranslationModifiers()
    return "taunt_roll_gesture"
end