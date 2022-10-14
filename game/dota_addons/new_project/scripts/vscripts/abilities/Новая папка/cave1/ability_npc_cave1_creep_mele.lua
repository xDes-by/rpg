ability_npc_cave1_creep_mele = class({})

LinkLuaModifier( "modidfier_ability_npc_cave1_creep_mele","abilities/cave1/ability_npc_cave1_creep_mele", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave1_creep_mele:GetIntrinsicModifierName()
    return "modidfier_ability_npc_cave1_creep_mele"
end

modidfier_ability_npc_cave1_creep_mele = class({})

--Classifications template
function modidfier_ability_npc_cave1_creep_mele:IsHidden()
   return true
end

function modidfier_ability_npc_cave1_creep_mele:IsPurgable()
   return false
end

function modidfier_ability_npc_cave1_creep_mele:DeclareFunctions()
   return {
       MODIFIER_EVENT_ON_ATTACK_LANDED,
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
}
end

function modidfier_ability_npc_cave1_creep_mele:OnAttackLanded(data)
    if data.target == self:GetParent() and RollPseudoRandom(10, data.attacker) then
        data.attacker:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_stunned", {duration = 0.25})
    end
end

function modidfier_ability_npc_cave1_creep_mele:GetModifierIncomingDamage_Percentage(data)
    if data.attacker:IsRangedAttacker() then
        return 100
    else
        return 70
    end
end

