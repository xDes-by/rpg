ability_npc_hell1_druid_bear_root_slow = class({})

LinkLuaModifier( "modifier_ability_npc_hell1_druid_bear_root_slow", "abilities/hell1/ability_npc_hell1_druid_bear_root_slow", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell1_druid_bear_root_effect", "abilities/hell1/ability_npc_hell1_druid_bear_root_slow", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell1_druid_bear_slow_effect", "abilities/hell1/ability_npc_hell1_druid_bear_root_slow", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell1_druid_bear_root_slow:GetIntrinsicModifierName()
    return "modifier_ability_npc_hell1_druid_bear_root_slow"
end

modifier_ability_npc_hell1_druid_bear_root_slow = class({})

function modifier_ability_npc_hell1_druid_bear_root_slow:IsHidden()
    return true
end

function modifier_ability_npc_hell1_druid_bear_root_slow:IsPurgable()
    return true
end

function modifier_ability_npc_hell1_druid_bear_root_slow:IsDebuff()
    return true
end

function modifier_ability_npc_hell1_druid_bear_root_slow:IsBuff()
    return false
end

function modifier_ability_npc_hell1_druid_bear_root_slow:RemoveOnDeath()
    return true
end

function modifier_ability_npc_hell1_druid_bear_root_slow:IsPurgeException()
    return true
end

function modifier_ability_npc_hell1_druid_bear_root_slow:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK 
    }
end

function modifier_ability_npc_hell1_druid_bear_root_slow:OnCreated(table)
    self.target = nil
end

function modifier_ability_npc_hell1_druid_bear_root_slow:GetModifierProcAttack_Feedback(data)
    if data.target ~= self.target then
        if RandomInt(1,4) == 1 then
            data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_hell1_druid_bear_root_effect", {duration = self:GetAbility():GetSpecialValueFor("root")})
        else
            data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_hell1_druid_bear_slow_effect", {duration = self:GetAbility():GetSpecialValueFor("slow")})
        end
    end
end

modifier_ability_npc_hell1_druid_bear_root_effect = class({})

--Classifications template
function modifier_ability_npc_hell1_druid_bear_root_effect:IsHidden()
   return false
end

function modifier_ability_npc_hell1_druid_bear_root_effect:IsDebuff()
   return true
end

function modifier_ability_npc_hell1_druid_bear_root_effect:IsPurgable()
   return false
end

function modifier_ability_npc_hell1_druid_bear_root_effect:IsPurgeException()
    return false
end

-- Optional Classifications
function modifier_ability_npc_hell1_druid_bear_root_effect:IsStunDebuff()
    return false
end

function modifier_ability_npc_hell1_druid_bear_root_effect:RemoveOnDeath()
   return true
end

function modifier_ability_npc_hell1_druid_bear_root_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_hell1_druid_bear_root_effect:AllowIllusionDuplicate()
    return false
end

function modifier_ability_npc_hell1_druid_bear_root_effect:GetEffectName()
	return "particles/econ/items/lone_druid/lone_druid_cauldron/lone_druid_bear_entangle_cauldron.vpcf"
end

function modifier_ability_npc_hell1_druid_bear_root_effect:CheckState()
   return {
    [MODIFIER_STATE_ROOTED] = true
}
end

modifier_ability_npc_hell1_druid_bear_slow_effect = class({})
--Classifications template
function modifier_ability_npc_hell1_druid_bear_slow_effect:IsHidden()
   return false
end

function modifier_ability_npc_hell1_druid_bear_slow_effect:IsDebuff()
   return true
end

function modifier_ability_npc_hell1_druid_bear_slow_effect:IsPurgable()
   return true
end

function modifier_ability_npc_hell1_druid_bear_slow_effect:RemoveOnDeath()
   return true
end

function modifier_ability_npc_hell1_druid_bear_slow_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_hell1_druid_bear_slow_effect:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
}
end

function modifier_ability_npc_hell1_druid_bear_slow_effect:GetModifierMoveSpeedBonus_Percentage()
    return -10
end
