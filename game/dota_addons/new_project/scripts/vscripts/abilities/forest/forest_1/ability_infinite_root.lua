LinkLuaModifier( "modifier_infinite_root_attack", "abilities/forest/forest_1/ability_infinite_root", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_infinite_root_attack_effect", "abilities/forest/forest_1/ability_infinite_root", LUA_MODIFIER_MOTION_NONE )

ability_infinite_root = class({})

function ability_infinite_root:GetIntrinsicModifierName()
    return "modifier_infinite_root_attack"
end

---------------------------------------------------------------------------------------------------------------

modifier_infinite_root_attack = class({})

function modifier_infinite_root_attack:IsHidden()
    return true
end

function modifier_infinite_root_attack:IsPurgable()
    return false
end

function modifier_infinite_root_attack:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK 
    }
end

function modifier_infinite_root_attack:GetModifierProcAttack_Feedback( params )
	if IsServer() and RandomInt(0,100) <= 35 then
		params.target:AddNewModifier( self:GetParent(), self:GetAbility(), "modifier_night_stalker_blood_effect", { duration = self:GetAbility():GetSpecialValueFor("root") } )
	end
end

---------------------------------------------------------------------------------------------------------------

modifier_infinite_root_attack_effect = class({})

function modifier_infinite_root_attack_effect:IsHidden()
   return false
end

function modifier_infinite_root_attack_effect:IsDebuff()
   return true
end

function modifier_infinite_root_attack_effect:IsPurgable()
   return false
end

function modifier_infinite_root_attack_effect:RemoveOnDeath()
   return true
end

function modifier_infinite_root_attack_effect:GetEffectName()
	return "particles/econ/items/lone_druid/lone_druid_cauldron/lone_druid_bear_entangle_cauldron.vpcf"
end

function modifier_infinite_root_attack_effect:CheckState()
   return {
		[MODIFIER_STATE_ROOTED] = true,
	}
end