ability_npc_jungle1_treant2_bulwark = class({})

LinkLuaModifier( "modifier_ability_npc_jungle1_treant2_bulwark", "abilities/jungle1/ability_npc_jungle1_treant2_bulwark", LUA_MODIFIER_MOTION_NONE )

function ability_npc_jungle1_treant2_bulwark:GetIntrinsicModifierName()
    return "modifier_ability_npc_jungle1_treant2_bulwark"
end

modifier_ability_npc_jungle1_treant2_bulwark = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_ability_npc_jungle1_treant2_bulwark:IsHidden()
	return false
end

function modifier_ability_npc_jungle1_treant2_bulwark:IsDebuff()
	return false
end

function modifier_ability_npc_jungle1_treant2_bulwark:IsStunDebuff()
	return false
end

function modifier_ability_npc_jungle1_treant2_bulwark:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_ability_npc_jungle1_treant2_bulwark:OnCreated( kv )
	-- references
	self.reduction_front = 50
	self.reduction_side = 25
	self.angle_front = 140
	self.angle_side = 240

	if IsServer() then
		self.parent = self:GetParent()
	end
end

function modifier_ability_npc_jungle1_treant2_bulwark:OnRefresh( kv )
	-- references
	self.reduction_front = 50
	self.reduction_side = 25
	self.angle_front = 140
	self.angle_side = 240
end

function modifier_ability_npc_jungle1_treant2_bulwark:OnRemoved()
end

function modifier_ability_npc_jungle1_treant2_bulwark:OnDestroy()
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_ability_npc_jungle1_treant2_bulwark:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_CONSTANT_BLOCK,
	}

	return funcs
end

function modifier_ability_npc_jungle1_treant2_bulwark:GetModifierPhysical_ConstantBlock( params )
	-- cancel if from ability
	if params.inflictor then return 0 end

	-- cancel if break
	if params.target:PassivesDisabled() then return 0 end

	-- get data
	local parent = params.target
	local attacker = params.attacker
	local reduction = 0

	-- Check target position
	local facing_direction = parent:GetAnglesAsVector().y
	local attacker_vector = (attacker:GetAbsOrigin() - parent:GetAbsOrigin())
	local attacker_direction = VectorToAngles( attacker_vector ).y
	local angle_diff = math.abs( AngleDiff( facing_direction, attacker_direction ) )

	-- calculate damage reduction
	if angle_diff < self.angle_front then
		reduction = self.reduction_front
		self:PlayEffects( true, attacker_vector )

	elseif angle_diff < self.angle_side then
		reduction = self.reduction_side
		self:PlayEffects( false, attacker_vector )
	end

	return reduction*params.damage/100
end
--------------------------------------------------------------------------------
-- Graphics & Animations
function modifier_ability_npc_jungle1_treant2_bulwark:PlayEffects( front )
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_mars/mars_shield_of_mars.vpcf"
	local sound_cast = "Hero_Mars.Shield.Block"

	if not front then
		particle_cast = "particles/units/heroes/hero_mars/mars_shield_of_mars_small.vpcf"
		sound_cast = "Hero_Mars.Shield.BlockSmall"
	end

	-- Create Particle
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	-- Create Sound
	EmitSoundOn( sound_cast, self:GetParent() )
end