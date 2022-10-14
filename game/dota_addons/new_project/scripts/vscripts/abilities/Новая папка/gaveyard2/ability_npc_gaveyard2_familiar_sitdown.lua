ability_npc_gaveyard2_familiar_sitdown = class({})

LinkLuaModifier( "modifier_ability_npc_gaveyard2_familiar_sitdown","abilities/gaveyard2/ability_npc_gaveyard2_familiar_sitdown", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_gaveyard2_familiar_sitdown_effect","abilities/gaveyard2/ability_npc_gaveyard2_familiar_sitdown", LUA_MODIFIER_MOTION_NONE )

function ability_npc_gaveyard2_familiar_sitdown:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_gaveyard2_familiar_sitdown", {duration = 5})
	local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self:GetCaster():GetAbsOrigin(), nil, 300, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
	local damageTable = {
		victim 			= nil,
		damage 			= 100,
		damage_type		= DAMAGE_TYPE_MAGICAL,
		damage_flags 	= DOTA_DAMAGE_FLAG_NONE,
		attacker 		= self:GetCaster(),
		ability 		= self
	}	
	if #enemies >= 1 then
		self:GetCaster():EmitSound("Visage_Familar.StoneForm.Stun")
	end
	for _, enemy in pairs(enemies) do
		enemy:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = 1 * (1 - enemy:GetStatusResistance())})
		damageTable.victim	= enemy
		ApplyDamage(damageTable)
	end    
end

modifier_ability_npc_gaveyard2_familiar_sitdown = class({})
--Classifications template
function modifier_ability_npc_gaveyard2_familiar_sitdown:IsHidden()
   return false
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:IsDebuff()
   return false
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:DestroyOnExpire()
    return true
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:GetEffectName()
	return "particles/units/heroes/hero_visage/visage_stone_form_area_energy.vpcf"
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
        --MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
    }
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:GetOverrideAnimation()
  return ACT_DOTA_CAST_ABILITY_1
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:GetOverrideAnimationRate()
  return 1.5
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:CheckState()
    return {
        [MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_ROOTED] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_SILENCED] = true,        
    }
end

-- Aura template
function modifier_ability_npc_gaveyard2_familiar_sitdown:IsAura()
    return true
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:GetModifierAura()
    return "modifier_ability_npc_gaveyard2_familiar_sitdown_effect"
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:GetAuraRadius()
    return 500
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_gaveyard2_familiar_sitdown:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_gaveyard2_familiar_sitdown_effect = class({})
--Classifications template
function modifier_ability_npc_gaveyard2_familiar_sitdown_effect:IsHidden()
   return false
end

function modifier_ability_npc_gaveyard2_familiar_sitdown_effect:IsDebuff()
   return false
end

function modifier_ability_npc_gaveyard2_familiar_sitdown_effect:IsPurgable()
   return false
end

function modifier_ability_npc_gaveyard2_familiar_sitdown_effect:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_ability_npc_gaveyard2_familiar_sitdown_effect:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE
}
end

function modifier_ability_npc_gaveyard2_familiar_sitdown_effect:GetModifierHealthRegenPercentage()
    return 1
end

