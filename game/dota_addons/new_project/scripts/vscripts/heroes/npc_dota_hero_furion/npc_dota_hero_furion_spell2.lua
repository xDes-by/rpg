LinkLuaModifier( "modifier_npc_dota_hero_furion_spell2","heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_furion_spell2_effect","heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell2", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_furion_spell2 = class({})

function npc_dota_hero_furion_spell2:OnSpellStart()
    local duration = self:GetSpecialValueFor("duration")
    CreateModifierThinker(self:GetCaster(), self, "modifier_npc_dota_hero_furion_spell2", {duration = duration}, self:GetCursorPosition(), DOTA_TEAM_GOODGUYS, false)
end

function npc_dota_hero_furion_spell2:GetAOERadius()
	return self:GetSpecialValueFor( "radius" )
end

-----------------------------------------------------------------

modifier_npc_dota_hero_furion_spell2 = class({})

function modifier_npc_dota_hero_furion_spell2:IsHidden()
    return true
end

function modifier_npc_dota_hero_furion_spell2:OnCreated()
    local radius = self:GetAbility():GetSpecialValueFor("radius")
	local effect_cast = ParticleManager:CreateParticle( "particles/fura.vpcf", PATTACH_WORLDORIGIN, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( radius, 1, 1 ) )
	self:AddParticle(effect_cast,false,false,-1,false,false)
	EmitSoundOn( "Item.SeerStone", self:GetParent() )
end

function modifier_npc_dota_hero_furion_spell2:OnDestroy()
    UTIL_Remove(self:GetParent())
end

function modifier_npc_dota_hero_furion_spell2:IsAura()
    return true
end

function modifier_npc_dota_hero_furion_spell2:GetModifierAura()
    return "modifier_npc_dota_hero_furion_spell2_effect"
end

function modifier_npc_dota_hero_furion_spell2:GetAuraRadius()
    return 500
end

function modifier_npc_dota_hero_furion_spell2:GetAuraDuration()
    return 0.1
end

function modifier_npc_dota_hero_furion_spell2:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_npc_dota_hero_furion_spell2:GetAuraSearchType()
    return DOTA_UNIT_TARGET_BASIC
end

--------------------------------------------------------------

modifier_npc_dota_hero_furion_spell2_effect = class({})

function modifier_npc_dota_hero_furion_spell2_effect:IsHidden()
    return false
end

function modifier_npc_dota_hero_furion_spell2_effect:IsPurgable()
    return false
end

function modifier_npc_dota_hero_furion_spell2_effect:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_furion_spell2_effect:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_furion_spell2_effect:DeclareFunctions()
    return {
       MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS
    }
end

function modifier_npc_dota_hero_furion_spell2_effect:GetModifierPhysicalArmorBonus()
    return -self:GetAbility():GetSpecialValueFor("armor_rduce")
end

function modifier_npc_dota_hero_furion_spell2_effect:GetEffectName()
	return "particles/units/heroes/hero_dazzle/dazzle_armor_enemy.vpcf"
end

function modifier_npc_dota_hero_furion_spell2_effect:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end