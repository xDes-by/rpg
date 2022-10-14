ablility_npc_desert2_boss_spell3 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert2_boss_spell3", "abilities/desert2/ablility_npc_desert2_boss_spell3", LUA_MODIFIER_MOTION_NONE )

function ablility_npc_desert2_boss_spell3:OnSpellStart()
	-- unit identifier
	local caster = self:GetCaster()

	-- load data
	local damage = self:GetSpecialValueFor( "damage" )
	local radius = self:GetSpecialValueFor( "radius" )
	local distance = self:GetSpecialValueFor( "jump_horizontal_distance" )
	local duration = self:GetSpecialValueFor( "jump_duration" )
	local height = self:GetSpecialValueFor( "jump_height" )
	local buff_duration = self:GetSpecialValueFor( "duration" )

	-- arc
	local arc = caster:AddNewModifier(
		caster, -- player source
		self, -- ability source
		"modifier_generic_arc_lua", -- modifier name
		{
			distance = distance,
			duration = duration,
			height = height,
			fix_duration = false,
			isForward = true,
			isStun = true,
			activity = ACT_DOTA_FLAIL,
		} -- kv
	)
	arc:SetEndCallback(function()
		-- find enemies
		local enemies = FindUnitsInRadius(
			caster:GetTeamNumber(),	-- int, your team number
			caster:GetOrigin(),	-- point, center point
			nil,	-- handle, cacheUnit. (not known)
			radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
			DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
			DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
			0,	-- int, flag filter
			0,	-- int, order filter
			false	-- bool, can grow cache
		)

		-- precache damage
		local damageTable = {
			-- victim = target,
			attacker = caster,
			damage = damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self, --Optional.
		}

		local stack = 0
		for _,enemy in pairs(enemies) do
			-- damage
			damageTable.victim = enemy
			ApplyDamage(damageTable)

			-- count stack
			if enemy:IsHero() and not enemy:IsIllusion() then
				stack = stack + 1
			end

			-- play effects
			self:PlayEffects4( enemy )
		end

		-- add buff
		if stack>0 then
			caster:AddNewModifier(
				caster, -- player source
				self, -- ability source
				"modifier_ablility_npc_desert2_boss_spell3", -- modifier name
				{
					duration = buff_duration,
					stack = stack,
				} -- kv
			)
		end

		-- play effects
		self:PlayEffects2()
		if stack>0 then
			self:PlayEffects3()
		end
	end)

	-- play effects
	self:PlayEffects1( arc )
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function ablility_npc_desert2_boss_spell3:PlayEffects1( modifier )
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_pangolier/pangolier_tailthump_cast.vpcf"
	local sound_cast = "Hero_Pangolier.TailThump.Cast"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )

	-- buff particle
	modifier:AddParticle(
		effect_cast,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)

	-- Create Sound
	EmitSoundOn( sound_cast, self:GetCaster() )
end

function ablility_npc_desert2_boss_spell3:PlayEffects2()
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_pangolier/pangolier_tailthump.vpcf"
	local sound_cast = "Hero_Pangolier.TailThump"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetCaster():GetOrigin() )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOn( sound_cast, self:GetCaster() )
end

function ablility_npc_desert2_boss_spell3:PlayEffects3()
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_pangolier/pangolier_tailthump_hero.vpcf"
	local sound_cast = "Hero_Pangolier.TailThump.Shield"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetCaster():GetOrigin() )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOn( sound_cast, self:GetCaster() )
end

function ablility_npc_desert2_boss_spell3:PlayEffects3()
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_pangolier/pangolier_tailthump_hero.vpcf"
	local sound_cast = "Hero_Pangolier.TailThump.Shield"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetCaster():GetOrigin() )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOn( sound_cast, self:GetCaster() )
end

function ablility_npc_desert2_boss_spell3:PlayEffects4( target )
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_pangolier/pangolier_tailthump_shield_impact.vpcf"

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN, target )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end

-- Created by Elfansoer
--[[
Ability checklist (erase if done/checked):
- Scepter Upgrade
- Break behavior
- Linken/Reflect behavior
- Spell Immune/Invulnerable/Invisible behavior
- Illusion behavior
- Stolen behavior
]]
--------------------------------------------------------------------------------
modifier_ablility_npc_desert2_boss_spell3 = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_ablility_npc_desert2_boss_spell3:IsHidden()
	return false
end

function modifier_ablility_npc_desert2_boss_spell3:IsDebuff()
	return false
end

function modifier_ablility_npc_desert2_boss_spell3:IsPurgable()
	return true
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_ablility_npc_desert2_boss_spell3:OnCreated( kv )
	-- references
	local stack_pct = self:GetAbility():GetSpecialValueFor( "hero_stacks" )

	if not IsServer() then return end

	-- calculate buff
	self.reduction = kv.stack * stack_pct
	self:SetStackCount( self.reduction )

	-- play effects
	self:PlayEffects()
end

function modifier_ablility_npc_desert2_boss_spell3:OnRefresh( kv )
	-- references
	local stack_pct = self:GetAbility():GetSpecialValueFor( "hero_stacks" )

	if not IsServer() then return end

	-- get stronger value
	local reduction = kv.stack * stack_pct
	if self.reduction<reduction then
		self.reduction = reduction
		self:PlayEffects()
	end

	self:SetStackCount( self.reduction )
end

function modifier_ablility_npc_desert2_boss_spell3:OnRemoved()
end

function modifier_ablility_npc_desert2_boss_spell3:OnDestroy()
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_ablility_npc_desert2_boss_spell3:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
	}

	return funcs
end

function modifier_ablility_npc_desert2_boss_spell3:OnAttack( params )

end

function modifier_ablility_npc_desert2_boss_spell3:GetModifierIncomingDamage_Percentage()
	return -self.reduction
end

--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_ablility_npc_desert2_boss_spell3:GetStatusEffectName()
	return "particles/status_fx/status_effect_pangolier_shield.vpcf"
end

function modifier_ablility_npc_desert2_boss_spell3:StatusEffectPriority()
	return MODIFIER_PRIORITY_NORMAL
end

function modifier_ablility_npc_desert2_boss_spell3:PlayEffects()
	-- destroy previous
	if self.effect_cast then
		ParticleManager:DestroyParticle( self.effect_cast, false )
	end

	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_pangolier/pangolier_tailthump_buff.vpcf"
	-- local sound_cast = "string"

	-- Get Data
	local parent = self:GetParent()

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, parent )
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		1,
		parent,
		PATTACH_ABSORIGIN_FOLLOW,
		"attach_hitloc",
		Vector(0,0,0), -- unknown
		true -- unknown, true
	)
	ParticleManager:SetParticleControl( effect_cast, 3, Vector( self.reduction, 0, 0 ) )


	-- buff particle
	self:AddParticle(
		effect_cast,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)
	
	self.effect_cast = effect_cast
end