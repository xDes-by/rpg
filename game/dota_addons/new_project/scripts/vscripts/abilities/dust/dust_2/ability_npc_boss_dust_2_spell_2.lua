LinkLuaModifier( "modifier_ability_npc_boss_dust_2_spell_2","abilities/dust/dust_2/ability_npc_boss_dust_2_spell_2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_dust_2_spell_2_effect","abilities/dust/dust_2/ability_npc_boss_dust_2_spell_2", LUA_MODIFIER_MOTION_NONE )

ability_npc_boss_dust_2_spell_2 = class({})

function ability_npc_boss_dust_2_spell_2:OnSpellStart()
    CreateModifierThinker(self:GetCaster(), self, "modifier_ability_npc_boss_dust_2_spell_2", {duration = 15}, self:GetCursorPosition(), DOTA_TEAM_BADGUYS, false)
	self:GetCaster():EmitSound("Hero_Broodmother.SpinWebCast")
	
end

-----------------------------------------------------------------------------

modifier_ability_npc_boss_dust_2_spell_2 = class({})

function modifier_ability_npc_boss_dust_2_spell_2:IsHidden()
    return true
end

function modifier_ability_npc_boss_dust_2_spell_2:OnCreated()
	self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_broodmother/broodmother_web.vpcf", PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( self.effect_cast, 0, self:GetCursorPosition() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 500, 500, 500) )
end

function modifier_ability_npc_boss_dust_2_spell_2:OnDestroy()
	ParticleManager:DestroyParticle(self.effect_cast, false)
	ParticleManager:ReleaseParticleIndex(self.effect_cast)
end

function modifier_ability_npc_boss_dust_2_spell_2:IsAura()
    return true
end

function modifier_ability_npc_boss_dust_2_spell_2:GetModifierAura()
    return "modifier_ability_npc_boss_dust_2_spell_2_effect"
end

function modifier_ability_npc_boss_dust_2_spell_2:GetAuraRadius()
    return 500
end

function modifier_ability_npc_boss_dust_2_spell_2:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_boss_dust_2_spell_2:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_ability_npc_boss_dust_2_spell_2:GetAuraSearchType()
    return DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_boss_dust_2_spell_2:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

-----------------------------------------------------------------------------

modifier_ability_npc_boss_dust_2_spell_2_effect = class({})

function modifier_ability_npc_boss_dust_2_spell_2_effect:IsHidden()
    return false
end

function modifier_ability_npc_boss_dust_2_spell_2_effect:IsDebuff()
    return false
end

function modifier_ability_npc_boss_dust_2_spell_2_effect:IsPurgable()
    return false
end

function modifier_ability_npc_boss_dust_2_spell_2_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_dust_2_spell_2_effect:OnCreated()
    self.ms = self:GetAbility():GetSpecialValueFor("ms")
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
end

function modifier_ability_npc_boss_dust_2_spell_2_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE,
    }
end

function modifier_ability_npc_boss_dust_2_spell_2_effect:GetModifierMoveSpeedBonus_Percentage()
    return self.ms
end

function modifier_ability_npc_boss_dust_2_spell_2_effect:GetModifierBaseAttack_BonusDamage()
    return self.damage
end