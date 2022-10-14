ability_npc_boss_gaveyard3_sleep = class({})

LinkLuaModifier( "modifier_ability_npc_boss_gaveyard3_sleep","abilities/gaveyard3/ability_npc_boss_gaveyard3_sleep", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_gaveyard3_sleep:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_gaveyard3_sleep"
end

function ability_npc_boss_gaveyard3_sleep:OnOwnerDied()
	MapLogic:EndLocation()
end

modifier_ability_npc_boss_gaveyard3_sleep = class({})

function modifier_ability_npc_boss_gaveyard3_sleep:IsHidden()
    return true
end

function modifier_ability_npc_boss_gaveyard3_sleep:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard3_sleep:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
		[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_ROOTED] = true,
	}
end

function modifier_ability_npc_boss_gaveyard3_sleep:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
}
end

function modifier_ability_npc_boss_gaveyard3_sleep:GetModifierIncomingDamage_Percentage(data)
	return -100
end

function modifier_ability_npc_boss_gaveyard3_sleep:GetEffectName()
    return "particles/generic_gameplay/generic_sleep.vpcf"
end

function modifier_ability_npc_boss_gaveyard3_sleep:GetEffectAttachType()
    return PATTACH_OVERHEAD_FOLLOW
end