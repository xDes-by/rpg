LinkLuaModifier( "modifier_npc_dota_hero_necrolyte_spell3", "heroes/npc_dota_hero_necrolyte/npc_dota_hero_necrolyte_spell3", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_necrolyte_spell3 = class({})

function npc_dota_hero_necrolyte_spell3:GetIntrinsicModifierName()
	return "modifier_npc_dota_hero_necrolyte_spell3"
end

------------------------------------------------------------------------------

modifier_npc_dota_hero_necrolyte_spell3 = class({})

function modifier_npc_dota_hero_necrolyte_spell3:IsHidden()
	return false
end

function modifier_npc_dota_hero_necrolyte_spell3:IsPurgable()
	return false
end

function modifier_npc_dota_hero_necrolyte_spell3:OnCreated( kv )
	self.chance = self:GetAbility():GetSpecialValueFor( "chance" )
end

function modifier_npc_dota_hero_necrolyte_spell3:OnRefresh( kv )
	self.chance = self:GetAbility():GetSpecialValueFor( "chance" )
end

function modifier_npc_dota_hero_necrolyte_spell3:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ABILITY_FULLY_CAST,
	}
	return funcs
end

function modifier_npc_dota_hero_necrolyte_spell3:OnAbilityFullyCast( params )
	if params.unit ~= self:GetCaster() then return end
	if params.ability == self:GetAbility() then return end
	if self:GetCaster():PassivesDisabled() then return end
	
	if  params.ability:GetAbilityName() == "npc_dota_hero_necrolyte_spell1" or
		params.ability:GetAbilityName() == "npc_dota_hero_necrolyte_spell2" or
		params.ability:GetAbilityName() == "npc_dota_hero_necrolyte_spell6" then
	
		if RandomInt(0,100) < self.chance then
			local particle = ParticleManager:CreateParticle("particles/items2_fx/refresher.vpcf", PATTACH_CUSTOMORIGIN, self:GetCaster())
			ParticleManager:SetParticleControlEnt(particle, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetOrigin(), true)
			ParticleManager:ReleaseParticleIndex(particle)
			EmitSoundOnLocationWithCaster(self:GetCaster():GetOrigin(), "DOTA_Item.Refresher.Activate", self:GetCaster())
			params.ability:EndCooldown()
		end
	end
end