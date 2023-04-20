LinkLuaModifier( "modifier_npc_dota_hero_undying_spell6", "heroes/npc_dota_hero_undying/npc_dota_hero_undying_spell6", LUA_MODIFIER_MOTION_NONE)

npc_dota_hero_undying_spell6 = class({})

function npc_dota_hero_undying_spell6:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_undying_spell6", {duration = self:GetSpecialValueFor("duration")})
end

-------------------------------------------------------------------------------

modifier_npc_dota_hero_undying_spell6 = class({})

function modifier_npc_dota_hero_undying_spell6:IsHidden()
    return false
end

function modifier_npc_dota_hero_undying_spell6:IsDebuff()
    return false
end

function modifier_npc_dota_hero_undying_spell6:IsPurgable()
    return false
end

function modifier_npc_dota_hero_undying_spell6:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_undying_spell6:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_undying_spell6:OnCreated()
    self.startPos = self:GetParent():GetAbsOrigin()
    self.move_range = self:GetAbility():GetSpecialValueFor("move_range")
    self.damage_range = self:GetAbility():GetSpecialValueFor("damage_range")
    self.damage_per_str = self:GetAbility():GetSpecialValueFor("damage_per_str")
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self:StartIntervalThink(0.03)
end

function modifier_npc_dota_hero_undying_spell6:OnIntervalThink()
    self.endPos = self:GetParent():GetAbsOrigin()
    local curRange = (self.startPos - self.endPos):Length2D()
    if curRange > self.move_range then
        self.startPos = self.endPos
	    local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self.endPos, nil, self.damage_range, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NOT_ANCIENTS, FIND_CLOSEST, false)
        for _,enemy in pairs(enemies) do
	        ApplyDamage({victim = enemy, attacker = self:GetParent(), damage = self.damage + self:GetParent():GetStrength() / 100 * self.damage_per_str, damage_type = self:GetAbility():GetAbilityDamageType()})
        end
        local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_primal_beast/primal_beast_trample.vpcf", PATTACH_ABSORIGIN, self:GetParent() )
        ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.damage_range, 0, 0 ) )
        ParticleManager:ReleaseParticleIndex( effect_cast )
        EmitSoundOn( "Hero_PrimalBeast.Trample", self:GetParent() )
    end
end

function modifier_npc_dota_hero_undying_spell6:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_DISABLE_TURNING,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
        MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
    }
end

function modifier_npc_dota_hero_undying_spell6:CheckState()
	local state = {
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
	}
	return state
end

function modifier_npc_dota_hero_undying_spell6:GetModifierDisableTurning()
    return 1
end

function modifier_npc_dota_hero_undying_spell6:GetOverrideAnimation()
    return ACT_DOTA_TAUNT
end

function modifier_npc_dota_hero_undying_spell6:GetOverrideAnimationRate()
    return 1.0
end

function modifier_npc_dota_hero_undying_spell6:GetActivityTranslationModifiers()
    return "walk_gesture"
end