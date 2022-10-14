ability_npc_cave3_creep_mele = class({})

LinkLuaModifier( "modidfier_ability_npc_cave3_creep_mele","abilities/cave3/ability_npc_cave3_creep_mele", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave3_creep_mele:GetIntrinsicModifierName()
    return "modidfier_ability_npc_cave3_creep_mele"
end

modidfier_ability_npc_cave3_creep_mele = class({})

--Classifications template
function modidfier_ability_npc_cave3_creep_mele:IsHidden()
   return true
end

function modidfier_ability_npc_cave3_creep_mele:IsPurgable()
   return false
end

function modidfier_ability_npc_cave3_creep_mele:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
}
end

function modidfier_ability_npc_cave3_creep_mele:GetModifierIncomingDamage_Percentage(data)
    if RollPseudoRandom(10,self:GetParent()) then
        return 0
    end
    if data.attacker:IsRangedAttacker() then
        return 70
    else
        return 100
    end
end