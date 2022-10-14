npc_dota_hero_gyrocopter_spell2 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_gyrocopter_spell2_animation", "heroes/npc_dota_hero_gyrocopter/npc_dota_hero_gyrocopter_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_gyrocopter_spell2_bonus", "heroes/npc_dota_hero_gyrocopter/npc_dota_hero_gyrocopter_spell2", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_gyrocopter_spell2:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_gyrocopter_spell2_bonus"
end

function npc_dota_hero_gyrocopter_spell2:OnSpellStart()
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_techies/techies_suicide.vpcf", PATTACH_ABSORIGIN, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 1, Vector(self:GetSpecialValueFor("radius") / 4, 0, 0))
    ParticleManager:SetParticleControl(pfx, 2, Vector(self:GetSpecialValueFor("radius"),1,1))
    ParticleManager:ReleaseParticleIndex(pfx)
    EmitSoundOn("Hero_Gyrocopter.CallDown.Damage", self:GetCaster())
    local direction = (self:GetCaster():GetForwardVector() * -1):Normalized()
    local pos = self:GetCaster():GetAbsOrigin() + direction * 300
    FindClearSpaceForUnit(self:GetCaster(), pos, false)
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_gyrocopter_spell2_animation", {duration = 1.2})
    if self.mod:GetStackCount() < self:GetSpecialValueFor("max_stax") then
        self.mod:IncrementStackCount()
    end
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetCaster():GetAbsOrigin(), nil, self:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage = self:GetSpecialValueFor("damage"),
        damage_type = self:GetAbilityDamageType(),
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
    end
end

modifier_npc_dota_hero_gyrocopter_spell2_animation = class({})

function modifier_npc_dota_hero_gyrocopter_spell2_animation:IsHidden()
    return true
end

function modifier_npc_dota_hero_gyrocopter_spell2_animation:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION
    }
end

function modifier_npc_dota_hero_gyrocopter_spell2_animation:GetOverrideAnimation()
    return ACT_DOTA_SPAWN
end

modifier_npc_dota_hero_gyrocopter_spell2_bonus = class({})
--Classifications template
function modifier_npc_dota_hero_gyrocopter_spell2_bonus:IsHidden()
    if self:GetStackCount() == 0 then
        return true
    end
    return false
end

function modifier_npc_dota_hero_gyrocopter_spell2_bonus:IsDebuff()
    return false
end

function modifier_npc_dota_hero_gyrocopter_spell2_bonus:IsPurgable()
    return false
end

function modifier_npc_dota_hero_gyrocopter_spell2_bonus:OnCreated()
    self:GetAbility().mod = self
    self:SetStackCount(0)
    self.as = self:GetAbility():GetSpecialValueFor("as")
    self.ad = self:GetAbility():GetSpecialValueFor("ad")
end

function modifier_npc_dota_hero_gyrocopter_spell2_bonus:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE
    }
end

function modifier_npc_dota_hero_gyrocopter_spell2_bonus:GetModifierAttackSpeedBonus_Constant()
    return self.as * self:GetStackCount()
end

function modifier_npc_dota_hero_gyrocopter_spell2_bonus:GetModifierBaseAttack_BonusDamage()
    return  self.ad * self:GetStackCount()
end
