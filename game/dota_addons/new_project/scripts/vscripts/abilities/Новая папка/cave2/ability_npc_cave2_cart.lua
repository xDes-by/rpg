ability_npc_cave2_cart = class({})

LinkLuaModifier( "modifier_ability_npc_cave2_cart","abilities/cave2/ability_npc_cave2_cart", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave2_cart:GetIntrinsicModifierName()
    return "modifier_ability_npc_cave2_cart"
end

modifier_ability_npc_cave2_cart = class({})

--Classifications template
function modifier_ability_npc_cave2_cart:IsHidden()
   return true
end

function modifier_ability_npc_cave2_cart:IsPurgable()
   return false
end

function modifier_ability_npc_cave2_cart:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
		--[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_DISARMED] = true,
		--[MODIFIER_STATE_ROOTED] = true,
	}
end

function modifier_ability_npc_cave2_cart:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
}
end

function modifier_ability_npc_cave2_cart:GetModifierIncomingDamage_Percentage(data)
	return -100
end
