modifier_jungle_dragon = class({})

function modifier_jungle_dragon:IsHidden()
    return true
end

function modifier_jungle_dragon:IsPurgable()
    return false
end

function modifier_jungle_dragon:CheckState()
	return {
		-- [MODIFIER_STATE_DISARMED] = true,
		-- [MODIFIER_STATE_FROZEN] = true,
		-- [MODIFIER_STATE_MUTED] = true,
		-- [MODIFIER_STATE_NO_UNIT_COLLISION] = true,
	}
end