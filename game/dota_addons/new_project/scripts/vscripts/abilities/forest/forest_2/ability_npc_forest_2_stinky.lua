LinkLuaModifier( "modifier_ability_npc_forest_2_stinky", "abilities/forest/forest_2/ability_npc_forest_2_stinky", LUA_MODIFIER_MOTION_NONE )

ability_npc_forest_2_stinky = class({})

function ability_npc_forest_2_stinky:GetIntrinsicModifierName()
    return "modifier_ability_npc_forest_2_stinky"
end

--------------------------------------------------------------------------

modifier_ability_npc_forest_2_stinky = class({})

function modifier_ability_npc_forest_2_stinky:IsHidden()
   return true
end

function modifier_ability_npc_forest_2_stinky:IsPurgable()
   return false
end

function modifier_ability_npc_forest_2_stinky:GetEffectName()
	return "particles/units/heroes/hero_batrider/batrider_napalm_damage_debuff.vpcf"
end

function modifier_ability_npc_forest_2_stinky:GetStatusEffectName()
	return "particles/status_fx/status_effect_stickynapalm.vpcf"
end

function modifier_ability_npc_forest_2_stinky:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}

	return funcs
end

function modifier_ability_npc_forest_2_stinky:GetModifierMoveSpeedBonus_Percentage()
	return -15
end
