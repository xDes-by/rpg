ability_npc_cave3_creep_range = class({})

LinkLuaModifier( "modidfier_ability_npc_cave3_creep_range","abilities/cave3/ability_npc_cave3_creep_range", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave3_creep_range:GetIntrinsicModifierName()
    return "modidfier_ability_npc_cave3_creep_range"
end

modidfier_ability_npc_cave3_creep_range = class({})

--Classifications template
function modidfier_ability_npc_cave3_creep_range:IsHidden()
   return true
end

function modidfier_ability_npc_cave3_creep_range:IsPurgable()
   return false
end

function modidfier_ability_npc_cave3_creep_range:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
}
end

function modidfier_ability_npc_cave3_creep_range:GetModifierIncomingDamage_Percentage(data)
    if RollPseudoRandom(10,self:GetParent()) then
        return 0
    end
    if data.attacker:IsRangedAttacker() then
        return 100
    else
        return 70
    end
end