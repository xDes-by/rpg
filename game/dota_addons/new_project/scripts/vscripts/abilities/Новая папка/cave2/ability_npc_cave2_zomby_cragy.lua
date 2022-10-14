ability_npc_cave2_zomby_cragy = class({})

LinkLuaModifier( "modidfier_ability_npc_cave2_zomby_cragy","abilities/cave2/ability_npc_cave2_zomby_cragy", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave2_zomby_cragy:GetIntrinsicModifierName()
    return "modidfier_ability_npc_cave2_zomby_cragy"
end

modidfier_ability_npc_cave2_zomby_cragy = class({})

--Classifications template
function modidfier_ability_npc_cave2_zomby_cragy:IsHidden()
   return true
end

function modidfier_ability_npc_cave2_zomby_cragy:IsPurgable()
   return false
end

function modidfier_ability_npc_cave2_zomby_cragy:DeclareFunctions()
   return {
       MODIFIER_EVENT_ON_ATTACK_LANDED
}
end

function modidfier_ability_npc_cave2_zomby_cragy:OnAttackLanded(data)
    if data.target == self:GetParent() and RollPseudoRandom(10, data.attacker) then
        data.attacker:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_stunned", {duration = 0.25})
    end
end