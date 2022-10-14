ability_npc_gaveyard3_gohost_blue_astral = class({})

LinkLuaModifier( "modifier_ability_npc_gaveyard3_gohost_blue_astral","abilities/gaveyard3/ability_npc_gaveyard3_gohost_blue_astral", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_gaveyard3_gohost_blue_astral_effect","abilities/gaveyard3/ability_npc_gaveyard3_gohost_blue_astral", LUA_MODIFIER_MOTION_NONE )

function ability_npc_gaveyard3_gohost_blue_astral:GetIntrinsicModifierName()
    return "modifier_ability_npc_gaveyard3_gohost_blue_astral"
end

modifier_ability_npc_gaveyard3_gohost_blue_astral = class({})

--Classifications template
function modifier_ability_npc_gaveyard3_gohost_blue_astral:IsHidden()
   return true
end

function modifier_ability_npc_gaveyard3_gohost_blue_astral:IsPurgable()
   return false
end
function modifier_ability_npc_gaveyard3_gohost_blue_astral:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_gaveyard3_gohost_blue_astral:GetModifierProcAttack_Feedback(data)
    if RollPseudoRandom(3,data.target) then
        data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_gaveyard3_gohost_blue_astral_effect", {duration = 5})
    end
end

modifier_ability_npc_gaveyard3_gohost_blue_astral_effect = class({})
--Classifications template
function modifier_ability_npc_gaveyard3_gohost_blue_astral_effect:IsHidden()
   return false
end

function modifier_ability_npc_gaveyard3_gohost_blue_astral_effect:IsDebuff()
   return true
end

function modifier_ability_npc_gaveyard3_gohost_blue_astral_effect:IsPurgable()
   return false
end

function modifier_ability_npc_gaveyard3_gohost_blue_astral_effect:IsPurgeException()
    return false
end

function modifier_ability_npc_gaveyard3_gohost_blue_astral_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_gaveyard3_gohost_blue_astral_effect:GetStatusEffectName()
    return "particles/status_fx/status_effect_terrorblade_reflection.vpcf"
end

function modifier_ability_npc_gaveyard3_gohost_blue_astral_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE,
    }
end

function modifier_ability_npc_gaveyard3_gohost_blue_astral_effect:GetModifierMoveSpeed_Absolute()
    return 100
end

function modifier_ability_npc_gaveyard3_gohost_blue_astral_effect:CheckState()
    return {
        [MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
		[MODIFIER_STATE_SILENCED] = true,
		--[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_DISARMED] = true,
    }
end

