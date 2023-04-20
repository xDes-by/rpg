LinkLuaModifier( "modifier_npc_dota_hero_skeleton_king_spell6", "heroes/npc_dota_hero_skeleton_king/npc_dota_hero_skeleton_king_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_skeleton_king_spell6_debuff", "heroes/npc_dota_hero_skeleton_king/npc_dota_hero_skeleton_king_spell6", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_skeleton_king_spell6 = class({})

function npc_dota_hero_skeleton_king_spell6:GetIntrinsicModifierName()
	return "modifier_npc_dota_hero_skeleton_king_spell6"
end

--------------------------------------------------------------------------------

modifier_npc_dota_hero_skeleton_king_spell6 = class({})

function modifier_npc_dota_hero_skeleton_king_spell6:IsHidden()
	return true
end

function modifier_npc_dota_hero_skeleton_king_spell6:OnCreated( kv )
	self.reincarnate_time = self:GetAbility():GetSpecialValueFor( "reincarnate_time" )
	self.slow_radius = self:GetAbility():GetSpecialValueFor( "slow_radius" )
	self.slow_duration = self:GetAbility():GetSpecialValueFor( "slow_duration" )
end

function modifier_npc_dota_hero_skeleton_king_spell6:OnRefresh( kv )
	self.reincarnate_time = self:GetAbility():GetSpecialValueFor( "reincarnate_time" )
	self.slow_radius = self:GetAbility():GetSpecialValueFor( "slow_radius" )
	self.slow_duration = self:GetAbility():GetSpecialValueFor( "slow_duration" )
end

function modifier_npc_dota_hero_skeleton_king_spell6:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_REINCARNATION,
	}
end

function modifier_npc_dota_hero_skeleton_king_spell6:ReincarnateTime( params )
	if IsServer() then
		if self:GetAbility():IsFullyCastable() then
			self:Reincarnate()
			return self.reincarnate_time
		end
		return 0
	end
end

function modifier_npc_dota_hero_skeleton_king_spell6:Reincarnate()
	self:GetAbility():UseResources(true, false, true)
	local enemies = FindUnitsInRadius(
		self:GetParent():GetTeamNumber(),	-- int, your team number
		self:GetParent():GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.slow_radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		0,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)
	for _,enemy in pairs(enemies) do
		enemy:AddNewModifier(
			self:GetParent(),
			self:GetAbility(),
			"modifier_npc_dota_hero_skeleton_king_spell6_debuff",
			{ duration = self.slow_duration }
		)
	end

	self:PlayEffects()
end

function modifier_npc_dota_hero_skeleton_king_spell6:PlayEffects()
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_skeletonking/wraith_king_reincarnate.vpcf", PATTACH_ABSORIGIN, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.reincarnate_time, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	EmitSoundOn( "Hero_SkeletonKing.Reincarnate", self:GetParent() )
end

--------------------------------------------------------------

modifier_npc_dota_hero_skeleton_king_spell6_debuff = class({})

function modifier_npc_dota_hero_skeleton_king_spell6_debuff:IsHidden()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell6_debuff:IsDebuff()
	return true
end

function modifier_npc_dota_hero_skeleton_king_spell6_debuff:IsStunDebuff()
	return false
end

function modifier_npc_dota_hero_skeleton_king_spell6_debuff:IsPurgable()
	return true
end

function modifier_npc_dota_hero_skeleton_king_spell6_debuff:OnCreated( kv )
	self.move_slow = self:GetAbility():GetSpecialValueFor( "movespeed" )
	self.attack_slow = self:GetAbility():GetSpecialValueFor( "attackslow_tooltip" )
end

function modifier_npc_dota_hero_skeleton_king_spell6_debuff:OnRefresh( kv )
	self.move_slow = self:GetAbility():GetSpecialValueFor( "movespeed" )
	self.attack_slow = self:GetAbility():GetSpecialValueFor( "attackslow_tooltip" )
end

function modifier_npc_dota_hero_skeleton_king_spell6_debuff:OnDestroy( kv )

end

function modifier_npc_dota_hero_skeleton_king_spell6_debuff:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}

	return funcs
end
function modifier_npc_dota_hero_skeleton_king_spell6_debuff:GetModifierAttackSpeedBonus_Constant()
	return self.attack_slow
end

function modifier_npc_dota_hero_skeleton_king_spell6_debuff:GetModifierMoveSpeedBonus_Percentage()
	return self.move_slow
end

function modifier_npc_dota_hero_skeleton_king_spell6_debuff:GetEffectName()
	return "particles/units/heroes/hero_skeletonking/wraith_king_reincarnate_slow_debuff.vpcf"
end

function modifier_npc_dota_hero_skeleton_king_spell6_debuff:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end