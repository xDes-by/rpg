ability_npc_hell2_forge_fire = class({})

LinkLuaModifier( "modifier_ability_npc_hell2_forge_fire","abilities/hell2/ability_npc_hell2_forge_fire", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell2_forge_fire_effect","abilities/hell2/ability_npc_hell2_forge_fire", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell2_forge_fire:GetIntrinsicModifierName()
    return "modifier_ability_npc_hell2_forge_fire"
end

modifier_ability_npc_hell2_forge_fire = class({})

--Classifications template
function modifier_ability_npc_hell2_forge_fire:IsHidden()
   return true
end

function modifier_ability_npc_hell2_forge_fire:IsPurgable()
   return false
end

function modifier_ability_npc_hell2_forge_fire:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_hell2_forge_fire:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_hell2_forge_fire_effect", {duration = 1})
end

modifier_ability_npc_hell2_forge_fire_effect = class({})
--Classifications template
function modifier_ability_npc_hell2_forge_fire_effect:IsHidden()
   return false
end

function modifier_ability_npc_hell2_forge_fire_effect:IsDebuff()
   return true
end

function modifier_ability_npc_hell2_forge_fire_effect:IsPurgable()
   return true
end

function modifier_ability_npc_hell2_forge_fire_effect:RemoveOnDeath()
   return true
end

function modifier_ability_npc_hell2_forge_fire_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_hell2_forge_fire_effect:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
}
end

function modifier_ability_npc_hell2_forge_fire_effect:GetModifierMoveSpeedBonus_Percentage()
    return -20
end

function modifier_ability_npc_hell2_forge_fire_effect:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.2)
end

function modifier_ability_npc_hell2_forge_fire_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage =  self:GetAbility():GetSpecialValueFor("damage"),
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end
