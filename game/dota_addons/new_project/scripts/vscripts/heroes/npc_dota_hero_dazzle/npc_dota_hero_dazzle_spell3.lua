LinkLuaModifier( "modifier_dazzle_skill_3", "heroes/npc_dota_hero_dazzle/npc_dota_hero_dazzle_spell3.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_dazzle_skill_3_effect", "heroes/npc_dota_hero_dazzle/npc_dota_hero_dazzle_spell3.lua", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_dazzle_spell3 = class({})

function npc_dota_hero_dazzle_spell3:GetIntrinsicModifierName()
	return "modifier_dazzle_skill_3"
end

---------------------------------------------------------------------------------------

modifier_dazzle_skill_3 = class({})

function modifier_dazzle_skill_3:IsHidden()
	return true
end

function modifier_dazzle_skill_3:IsPurgable()
	return false
end

function modifier_dazzle_skill_3:OnCreated( kv )
	self.radius = self:GetAbility():GetSpecialValueFor("radius")
	self.duration = self:GetAbility():GetSpecialValueFor("duration")
	self:StartIntervalThink(0.2)
end

function modifier_dazzle_skill_3:OnIntervalThink()
	if IsServer() and self:GetAbility() and self:GetCaster():IsRealHero() and self:GetParent():IsAlive() and not self:GetParent():PassivesDisabled() then
		if self:GetAbility():IsCooldownReady() then
			local enemies = FindUnitsInRadius( self:GetParent():GetTeamNumber(), self:GetParent():GetOrigin(), nil, self.radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, 0, 0, false )
				if #enemies > 0 then
					enemy = (enemies[ RandomInt( 1, #enemies ) ] )
					enemy:AddNewModifier( self:GetCaster(), self, "modifier_dazzle_skill_3_effect", { duration = self.duration } )
				end
			self:GetAbility():UseResources(false, false, true)
		end
	end
end

----------------------------------------------------------------------

modifier_dazzle_skill_3_effect = class({})

function modifier_dazzle_skill_3_effect:IsHidden()
	return false
end

function modifier_dazzle_skill_3_effect:IsDebuff()
	return false
end

function modifier_dazzle_skill_3_effect:IsPurgable()
	return false
end

function modifier_dazzle_skill_3_effect:OnCreated( kv )
	if IsServer() then
		EmitSoundOn( "Hero_Dazzle.Shallow_Grave", self:GetParent() )
	end
end

function modifier_dazzle_skill_3_effect:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MIN_HEALTH,
	}
	return funcs
end

function modifier_dazzle_skill_3_effect:GetMinHealth()
	return 1
end

function modifier_dazzle_skill_3_effect:GetEffectName()
	return "particles/units/heroes/hero_dazzle/dazzle_shallow_grave.vpcf"
end

function modifier_dazzle_skill_3_effect:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end