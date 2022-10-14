LinkLuaModifier( "modifier_push", "abilities/push", LUA_MODIFIER_MOTION_NONE )

push = class({})

function push:GetIntrinsicModifierName()
	return "modifier_push"
end

---------------------------------------------------------------------------------------

modifier_push = class({})

function modifier_push:IsHidden()
	return true
end

function modifier_push:IsPurgable()
	return false
end

function modifier_push:OnCreated( kv )
end

function modifier_push:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_TAKEDAMAGE,
		MODIFIER_PROPERTY_MIN_HEALTH
	}
	return funcs
end

function modifier_push:CheckState()
	local state = {
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
	}
	return state
end

function modifier_push:GetMinHealth()
	return 1
end

function modifier_push:OnTakeDamage( params )
	if IsServer() then
	if params.attacker and params.attacker:GetTeamNumber() ~= self:GetParent():GetTeamNumber() and self:GetParent() == params.unit and not params.attacker:IsOther() and params.attacker:GetName() ~= "npc_dota_unit_undying_zombie" then	 
		params.unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_knockback", {
				center_x			= params.attacker:GetAbsOrigin()[1] + 1,
				center_y			= params.attacker:GetAbsOrigin()[2] + 1,
				center_z			= params.attacker:GetAbsOrigin()[3],
				duration			= 0.4 * (1 - params.unit:GetStatusResistance()),
				knockback_duration	= 0.4 * (1 - params.unit:GetStatusResistance()),
				knockback_distance	= 50,
				knockback_height	= 0,
				should_stun			= 0
			})
		end	
	end
end