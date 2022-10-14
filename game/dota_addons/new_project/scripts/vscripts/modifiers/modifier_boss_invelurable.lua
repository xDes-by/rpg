modifier_boss_invelurable = class({})

function modifier_boss_invelurable:IsHidden()
    return true
end

function modifier_boss_invelurable:IsPurgable()
    return false
end

function modifier_boss_invelurable:CheckState()
	return {
		[MODIFIER_STATE_FROZEN] = true,
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_STUNNED] = true
	}
end

function modifier_boss_invelurable:GetStatusEffectName()
	return "particles/status_fx/status_effect_medusa_stone_gaze.vpcf"
end

function modifier_boss_invelurable:StatusEffectPriority(  )
	return MODIFIER_PRIORITY_ULTRA
end