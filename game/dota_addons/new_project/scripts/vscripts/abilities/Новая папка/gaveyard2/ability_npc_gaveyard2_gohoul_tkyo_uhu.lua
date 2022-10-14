ability_npc_gaveyard2_gohoul_tkyo_uhu = class({})

LinkLuaModifier( "modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu","abilities/gaveyard2/ability_npc_gaveyard2_gohoul_tkyo_uhu", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu_slow","abilities/gaveyard2/ability_npc_gaveyard2_gohoul_tkyo_uhu", LUA_MODIFIER_MOTION_NONE )

function ability_npc_gaveyard2_gohoul_tkyo_uhu:GetIntrinsicModifierName()
    return "modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu"
end

modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu = class({})

--Classifications template
function modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu:IsHidden()
   return true
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu:IsPurgable()
   return false
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
       MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
}
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu_slow", {duration = 1.5})
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu:GetModifierAttackSpeedBonus_Constant(data)
    return 50
end

modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu_slow = class({})
--Classifications template
function modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu_slow:IsHidden()
   return false
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu_slow:IsDebuff()
   return true
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu_slow:IsPurgable()
   return true
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu_slow:RemoveOnDeath()
   return true
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu_slow:DestroyOnExpire()
    return true
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu_slow:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
}
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uhu_slow:GetModifierMoveSpeedBonus_Percentage()
    return -10
end
