LinkLuaModifier( "modifier_tusk_skill_3", "heroes/npc_dota_hero_tusk/npc_dota_hero_tusk_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_tusk_skill_3_effect", "heroes/npc_dota_hero_tusk/npc_dota_hero_tusk_spell3", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_tusk_spell3 = class({})

function npc_dota_hero_tusk_spell3:GetIntrinsicModifierName()
	return "modifier_tusk_skill_3"
end

---------------------------------------------------------------------------------------------------------------

modifier_tusk_skill_3 = class({})

function modifier_tusk_skill_3:IsHidden()
	return true
end

function modifier_tusk_skill_3:IsDebuff()
	return false
end

function modifier_tusk_skill_3:IsPurgable()
	return false
end

function modifier_tusk_skill_3:RemoveOnDeath()
	return false
end


function modifier_tusk_skill_3:OnCreated( kv )
	self.chance = self:GetAbility():GetSpecialValueFor( "chance" )
end

function modifier_tusk_skill_3:OnRefresh( kv )
	self:OnCreated( kv )
end

function modifier_tusk_skill_3:DeclareFunctions()
	return {MODIFIER_EVENT_ON_ATTACK_LANDED}
end

function modifier_tusk_skill_3:OnAttackLanded(keys)
	if keys.attacker == self:GetParent() and not self:GetParent():IsIllusion() and not self:GetParent():PassivesDisabled() then
	self.chance = self:GetAbility():GetSpecialValueFor( "chance" )
	self.duration = self:GetAbility():GetSpecialValueFor( "duration" )
		if RandomInt(1,100) <= self.chance then
		keys.target:AddNewModifier( self:GetParent(), self:GetAbility(), "modifier_tusk_skill_3_effect", { duration = self.duration } )
		end
	end
end

---------------------------------------------------------------------------------------------------------------------

modifier_tusk_skill_3_effect = class({})

function modifier_tusk_skill_3_effect:IsHidden()
	return false
end

function modifier_tusk_skill_3_effect:IsDebuff()
	return true
end

function modifier_tusk_skill_3_effect:IsStunDebuff()
	return false
end

function modifier_tusk_skill_3_effect:IsPurgable()
	return true
end

function modifier_tusk_skill_3_effect:OnCreated( kv )
	EmitSoundOn( "hero_Crystal.frostbite", self:GetParent() )
end

function modifier_tusk_skill_3_effect:OnRefresh( kv )
end

function modifier_tusk_skill_3_effect:OnDestroy()
	StopSoundOn( "hero_Crystal.frostbite", self:GetParent() )
end

function modifier_tusk_skill_3_effect:CheckState()
	local state = {
	[MODIFIER_STATE_DISARMED] = true,
	[MODIFIER_STATE_ROOTED] = true,
	[MODIFIER_STATE_INVISIBLE] = false,
	}

	return state
end

function modifier_tusk_skill_3_effect:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_INCOMING_PHYSICAL_DAMAGE_PERCENTAGE,
	}
	return funcs
end

function modifier_tusk_skill_3_effect:GetModifierIncomingPhysicalDamage_Percentage()
	return self:GetAbility():GetSpecialValueFor( "damage_percent" )
end


function modifier_tusk_skill_3_effect:GetEffectName()
	return "particles/units/heroes/hero_crystalmaiden/maiden_frostbite_buff.vpcf"
end

function modifier_tusk_skill_3_effect:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end