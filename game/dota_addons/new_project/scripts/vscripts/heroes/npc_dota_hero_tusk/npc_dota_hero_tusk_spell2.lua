LinkLuaModifier( "modifier_tusk_skill_2", "heroes/npc_dota_hero_tusk/npc_dota_hero_tusk_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_tusk_skill_2_stack", "heroes/npc_dota_hero_tusk/npc_dota_hero_tusk_spell2", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_tusk_spell2 = class({})

function npc_dota_hero_tusk_spell2:GetIntrinsicModifierName()
	return "modifier_tusk_skill_2"
end

--------------------------------------------------------

modifier_tusk_skill_2 = class({})

function modifier_tusk_skill_2:IsHidden()
	return self:GetStackCount()== 0
end

function modifier_tusk_skill_2:IsDebuff()
	return false
end

function modifier_tusk_skill_2:IsStunDebuff()
	return false
end

function modifier_tusk_skill_2:IsPurgable()
	return false
end

function modifier_tusk_skill_2:DestroyOnExpire()
	return false
end


function modifier_tusk_skill_2:OnCreated( kv )
	self.stack_duration = self:GetAbility():GetSpecialValueFor( "stack_duration" )
	self.stack_limit = self:GetAbility():GetSpecialValueFor( "stack_limit" )
	self.armor = self:GetAbility():GetSpecialValueFor( "armor" )
	self.actual_stack = 0
end

function modifier_tusk_skill_2:OnRefresh( kv )
	self.stack_duration = self:GetAbility():GetSpecialValueFor( "stack_duration" )
	self.stack_limit = self:GetAbility():GetSpecialValueFor( "stack_limit" )
	self.armor = self:GetAbility():GetSpecialValueFor( "bonus_armor" )
end

function modifier_tusk_skill_2:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
	}
	return funcs
end

function modifier_tusk_skill_2:OnAttackLanded( params )
	if not IsServer() then return end
	if params.target~=self:GetParent() then return end

	if self:GetParent():PassivesDisabled() then return end

	self.actual_stack = self.actual_stack + 1
	if self:GetStackCount()<self.stack_limit then
		self:IncrementStackCount()
	end

	local modifier = self:GetParent():AddNewModifier( self:GetParent(), self:GetAbility(), "modifier_tusk_skill_2_stack", { duration = self.stack_duration } )
	
	modifier.parent = self
	
	self:SetDuration( self.stack_duration, true )
end

function modifier_tusk_skill_2:GetModifierPhysicalArmorBonus()
	return self:GetStackCount() * self.armor
end

function modifier_tusk_skill_2:RemoveStack()
	self.actual_stack = self.actual_stack - 1
	if self.actual_stack<=self.stack_limit then
		self:SetStackCount( self.actual_stack )
	end
end

--------------------------------------------------------

modifier_tusk_skill_2_stack = class({})

function modifier_tusk_skill_2_stack:IsHidden()
	return true
end

function modifier_tusk_skill_2_stack:IsPurgable()
	return false
end

function modifier_tusk_skill_2_stack:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

function modifier_tusk_skill_2_stack:OnDestroy()
	if not IsServer() then return end
	self.parent:RemoveStack()
end