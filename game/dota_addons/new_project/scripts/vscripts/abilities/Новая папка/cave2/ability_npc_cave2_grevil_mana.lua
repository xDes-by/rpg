ability_npc_cave2_grevil_mana = class({})

LinkLuaModifier( "modifier_ability_npc_cave2_grevil_mana","abilities/cave2/ability_npc_cave2_grevil_mana", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_cave2_grevil_mana_gegen","abilities/cave2/ability_npc_cave2_grevil_mana", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave2_grevil_mana:GetIntrinsicModifierName()
    return "modifier_ability_npc_cave2_grevil_mana"
end

modifier_ability_npc_cave2_grevil_mana = class({})

--Classifications template
function modifier_ability_npc_cave2_grevil_mana:IsHidden()
   return true
end

function modifier_ability_npc_cave2_grevil_mana:IsPurgable()
   return false
end

function modifier_ability_npc_cave2_grevil_mana:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_cave2_grevil_mana:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_cave2_grevil_mana_gegen", {duration = 0.7})
end

modifier_ability_npc_cave2_grevil_mana_gegen = class({})
--Classifications template
function modifier_ability_npc_cave2_grevil_mana_gegen:IsHidden()
   return false
end

function modifier_ability_npc_cave2_grevil_mana_gegen:IsDebuff()
   return true
end

function modifier_ability_npc_cave2_grevil_mana_gegen:IsPurgable()
   return false
end

function modifier_ability_npc_cave2_grevil_mana_gegen:IsPurgeException()
    return true
end

function modifier_ability_npc_cave2_grevil_mana_gegen:RemoveOnDeath()
   return true
end

function modifier_ability_npc_cave2_grevil_mana_gegen:DestroyOnExpire()
    return true
end

function modifier_ability_npc_cave2_grevil_mana_gegen:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_ability_npc_cave2_grevil_mana_gegen:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
       MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
       MODIFIER_PROPERTY_BONUSDAMAGEOUTGOING_PERCENTAGE
}
end

function modifier_ability_npc_cave2_grevil_mana_gegen:GetModifierConstantManaRegen()
    return -10
end

function modifier_ability_npc_cave2_grevil_mana_gegen:GetModifierMoveSpeedBonus_Percentage()
    return -10
end

function modifier_ability_npc_cave2_grevil_mana_gegen:GetModifierBonusDamageOutgoing_Percentage()
    return -10
end
