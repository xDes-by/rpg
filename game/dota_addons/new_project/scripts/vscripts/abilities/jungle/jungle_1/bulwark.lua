LinkLuaModifier( "modifier_bulwark_dire", "abilities/jungle/jungle_1/bulwark", LUA_MODIFIER_MOTION_NONE )

bulwark = class({})

function bulwark:GetIntrinsicModifierName()
    return "modifier_bulwark_dire"
end

modifier_bulwark_dire = class({})

function modifier_bulwark_dire:IsHidden()
    return false
end

function modifier_bulwark_dire:IsDebuff()
    return false
end

function modifier_bulwark_dire:IsPurgable()
    return false
end

function modifier_bulwark_dire:OnCreated()
    self.reduction_front = self:GetAbility():GetSpecialValueFor( "damage" )
	self.reduction_side = self:GetAbility():GetSpecialValueFor( "damage" )/2
	self.angle_front = 140
	self.angle_side = 240
end

function modifier_bulwark_dire:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PHYSICAL_CONSTANT_BLOCK
    }
end

function modifier_bulwark_dire:GetModifierPhysical_ConstantBlock( params )
	if params.inflictor then return 0 end
	if params.target:PassivesDisabled() then return 0 end
	local parent = params.target
	local attacker = params.attacker
	local reduction = 0

	local facing_direction = parent:GetAnglesAsVector().y
	local attacker_vector = (attacker:GetOrigin() - parent:GetOrigin())
	local attacker_direction = VectorToAngles( attacker_vector ).y
	local angle_diff = math.abs( AngleDiff( facing_direction, attacker_direction ) )

	if angle_diff < self.angle_front then
		reduction = self.reduction_front
		self:PlayEffects( true, attacker_vector )

	elseif angle_diff < self.angle_side then
		reduction = self.reduction_side
		self:PlayEffects( false, attacker_vector )
	end

	return reduction*params.damage/100
end

function modifier_bulwark_dire:PlayEffects( front )
	local particle_cast = "particles/units/heroes/hero_mars/mars_shield_of_mars.vpcf"
	local sound_cast = "Hero_Mars.Shield.Block"
	if not front then
		particle_cast = "particles/units/heroes/hero_mars/mars_shield_of_mars_small.vpcf"
		sound_cast = "Hero_Mars.Shield.BlockSmall"
	end
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	EmitSoundOn( sound_cast, self:GetParent() )
end