modifier_cheat_move = class({})

function modifier_cheat_move:IsHidden()
	return false
end

function modifier_cheat_move:IsPurgable()
	return false
end

function modifier_cheat_move:RemoveOnDeath()
	return false
end

function modifier_cheat_move:DeclareFunctions()
	return {MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE}
end

function modifier_cheat_move:GetModifierMoveSpeed_Absolute()
	return 1000
end


function modifier_cheat_move:CheckState()
	return {
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
	}
end