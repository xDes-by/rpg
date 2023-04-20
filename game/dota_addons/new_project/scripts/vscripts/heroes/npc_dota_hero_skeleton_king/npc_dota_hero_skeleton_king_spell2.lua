LinkLuaModifier( "modifier_npc_dota_hero_skeleton_king_spell2", "heroes/npc_dota_hero_skeleton_king/npc_dota_hero_skeleton_king_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_skeleton_king_spell2_lifesteal", "heroes/npc_dota_hero_skeleton_king/npc_dota_hero_skeleton_king_spell2", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_skeleton_king_spell2 = class({})

function npc_dota_hero_skeleton_king_spell2:GetIntrinsicModifierName()
	return "modifier_npc_dota_hero_skeleton_king_spell2"
end

-----------------------------------------------------

modifier_npc_dota_hero_skeleton_king_spell2 = class({})

function modifier_npc_dota_hero_skeleton_king_spell2:IsHidden()
	return true
end

function modifier_npc_dota_hero_skeleton_king_spell2:IsPurgable()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell2:RemoveOnDeath()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell2:IsAura()
	return true
end

function modifier_npc_dota_hero_skeleton_king_spell2:GetModifierAura()
	return "modifier_npc_dota_hero_skeleton_king_spell2_lifesteal"
end

function modifier_npc_dota_hero_skeleton_king_spell2:GetAuraRadius()
	return self:GetAbility():GetSpecialValueFor("radius")
end

function modifier_npc_dota_hero_skeleton_king_spell2:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_npc_dota_hero_skeleton_king_spell2:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_npc_dota_hero_skeleton_king_spell2:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_INVULNERABLE
end

function modifier_npc_dota_hero_skeleton_king_spell2:IsAuraActiveOnDeath()
	return false
end

------------------------------------------------------

modifier_npc_dota_hero_skeleton_king_spell2_lifesteal = class({})

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:IsHidden()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:IsDebuff()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:OnCreated( kv )
	self.aura_lifesteal = self:GetAbility():GetSpecialValueFor("vampiric_aura") -- special value
end

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:OnRefresh( kv )
	self.aura_lifesteal = self:GetAbility():GetSpecialValueFor("vampiric_aura") -- special value
end

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
		MODIFIER_EVENT_ON_TAKEDAMAGE,
	}

	return funcs
end

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:GetModifierProcAttack_Feedback( params )
	if IsServer() then
		local pass = false
		if params.target:GetTeamNumber()~=self:GetParent():GetTeamNumber() then
			if (not params.target:IsBuilding()) and (not params.target:IsOther()) then
				pass = true
			end
		end

		if pass then
			self.attack_record = params.record
		end
	end
end

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:OnTakeDamage( params )
	if IsServer() then
		local pass = false
		if self.attack_record and params.record == self.attack_record then
			pass = true
			self.attack_record = nil
		end

		if pass then
			local heal = params.damage * self.aura_lifesteal/100
			self:GetParent():Heal( heal, self:GetAbility() )
			self:PlayEffects( self:GetParent() )
		end
	end
end

function modifier_npc_dota_hero_skeleton_king_spell2_lifesteal:PlayEffects( target )
	local particle_cast = "particles/units/heroes/hero_skeletonking/wraith_king_vampiric_aura_lifesteal.vpcf"

	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, target )
	ParticleManager:SetParticleControl( effect_cast, 1, target:GetOrigin() )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end
