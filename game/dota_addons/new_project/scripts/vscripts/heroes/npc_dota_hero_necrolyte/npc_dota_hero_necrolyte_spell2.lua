npc_dota_hero_necrolyte_spell2 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_necrolyte_spell2", "heroes/npc_dota_hero_necrolyte/npc_dota_hero_necrolyte_spell2", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_necrolyte_spell2:OnSpellStart()
    if RollPseudoRandom(15,self:GetCaster()) then
        self:EndCooldown()
		print("11111")
    end
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_necrolyte_spell2", {duration = self:GetSpecialValueFor("duration")})
end

modifier_npc_dota_hero_necrolyte_spell2 = class({})
--Classifications template
function modifier_npc_dota_hero_necrolyte_spell2:IsHidden()
    return false
end

function modifier_npc_dota_hero_necrolyte_spell2:IsDebuff()
    return false
end

function modifier_npc_dota_hero_necrolyte_spell2:IsPurgable()
    return true
end

function modifier_npc_dota_hero_necrolyte_spell2:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_necrolyte_spell2:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_necrolyte_spell2:GetStatusEffectName()
	return "particles/status_fx/status_effect_ghost.vpcf"
end

function modifier_npc_dota_hero_necrolyte_spell2:OnCreated()
	self.ethereal_damage_bonus		= self:GetAbility():GetSpecialValueFor("damage_bonus")
    local pfx = ParticleManager:CreateParticle("particles/econ/items/necrolyte/necro_ti9_immortal/necro_ti9_immortal_shroud.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
	self:AddParticle(pfx,false,false,-1,false, false)
end

function modifier_npc_dota_hero_necrolyte_spell2:CheckState()
	local state = {
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_DISARMED] = true
	}
	
	return state
end

function modifier_npc_dota_hero_necrolyte_spell2:DeclareFunctions()
	return{
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_DECREPIFY_UNIQUE,
		MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_PHYSICAL,
	}
end

function modifier_npc_dota_hero_necrolyte_spell2:GetModifierMagicalResistanceDecrepifyUnique()
    return self.ethereal_damage_bonus
end

function modifier_npc_dota_hero_necrolyte_spell2:GetAbsoluteNoDamagePhysical()
	return 1
end
