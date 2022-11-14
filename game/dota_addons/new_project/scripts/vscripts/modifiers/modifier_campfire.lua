modifier_camp = class({})

function modifier_camp:IsHidden()
    return false
end

function modifier_camp:OnCreated()
	self.nFXIndex = ParticleManager:CreateParticle( "particles/winter_fx/healing_campfire_flame.vpcf", PATTACH_ABSORIGIN, self:GetParent() )
	ParticleManager:SetParticleControl( self.nFXIndex, 2, self:GetParent():GetOrigin() + Vector( 0, 0, 50 ) )
end

function modifier_camp:CheckState()
	local state = {}
	if IsServer()  then
		state[MODIFIER_STATE_ROOTED] = true
		state[MODIFIER_STATE_NO_HEALTH_BAR] = true
		state[MODIFIER_STATE_BLIND] = true
		state[MODIFIER_STATE_INVULNERABLE] = true
		state[MODIFIER_STATE_OUT_OF_GAME] = true
	end
	return state
end

function modifier_camp:IsPurgable()
    return false
end

function modifier_camp:RemoveOnDeath()
    return true
end

function modifier_camp:IsAura()
	return true
end

function modifier_camp:GetAuraRadius()
	return 700
end

function modifier_camp:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_NONE
end

function modifier_camp:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_camp:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_camp:GetModifierAura()
	return "modifier_campfire"
end

-----------------------------------------------------------------

LinkLuaModifier("modifier_campfire", 'modifiers/modifier_campfire', LUA_MODIFIER_MOTION_NONE)

function modifier_campfire:IsHidden()
    return false
end

function modifier_campfire:IsPurgable()
    return false
end