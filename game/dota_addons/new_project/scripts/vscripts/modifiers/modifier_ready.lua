modifier_ready = class({})

function modifier_ready:IsHidden()
    return true
end

function modifier_ready:IsPurgable()
    return false
end

function modifier_ready:OnCreated()
	self.particle = ParticleManager:CreateParticle("particles/econ/events/fall_2022/high_five/high_five_foam_hand_overhead.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent())
	ParticleManager:SetParticleControlEnt( self.particle, PATTACH_OVERHEAD_FOLLOW, self:GetParent(), PATTACH_OVERHEAD_FOLLOW, "follow_overhead", self:GetParent():GetAbsOrigin(), true )
	EmitSoundOn( "high_five.cast", self:GetParent())
end

function modifier_ready:OnDestroy()
	ParticleManager:DestroyParticle( self.particle, false )
	ParticleManager:ReleaseParticleIndex( self.particle )
end