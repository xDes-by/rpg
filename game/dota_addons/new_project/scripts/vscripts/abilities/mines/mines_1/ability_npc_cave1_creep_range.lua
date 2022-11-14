ability_npc_cave1_creep_range = class({})

LinkLuaModifier( "modidfier_ability_npc_cave1_creep_range","abilities/cave1/ability_npc_cave1_creep_range", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave1_creep_range:GetIntrinsicModifierName()
    return "modidfier_ability_npc_cave1_creep_range"
end

modidfier_ability_npc_cave1_creep_range = class({})

--Classifications template
function modidfier_ability_npc_cave1_creep_range:IsHidden()
   return true
end

function modidfier_ability_npc_cave1_creep_range:IsPurgable()
   return false
end

function modidfier_ability_npc_cave1_creep_range:DeclareFunctions()
   return {
       MODIFIER_EVENT_ON_ATTACK_LANDED,
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
}
end

function modidfier_ability_npc_cave1_creep_range:OnAttackLanded(data)
    if data.target == self:GetParent() and RollPseudoRandom(10, data.attacker) then
        data.attacker:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_stunned", {duration = 0.25})
    end
end

function modidfier_ability_npc_cave1_creep_range:GetModifierIncomingDamage_Percentage(data)
    if data.attacker:IsRangedAttacker() then
        return 70
    else
        return 100
    end
end

