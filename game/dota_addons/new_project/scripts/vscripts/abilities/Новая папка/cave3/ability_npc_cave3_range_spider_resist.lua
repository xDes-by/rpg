ability_npc_cave3_range_spider_resist = class({})

LinkLuaModifier( "modifier_ability_npc_cave3_range_spider_resist","abilities/cave3/ability_npc_cave3_range_spider_resist", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_cave3_poison","abilities/cave3/ability_npc_cave3_mele_spider_resist", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave3_range_spider_resist:GetIntrinsicModifierName()
    return "modifier_ability_npc_cave3_range_spider_resist"
end

modifier_ability_npc_cave3_range_spider_resist = class({})

--Classifications template
function modifier_ability_npc_cave3_range_spider_resist:IsHidden()
   return true
end

function modifier_ability_npc_cave3_range_spider_resist:IsDebuff()
   return false
end

function modifier_ability_npc_cave3_range_spider_resist:IsPurgable()
   return false
end

function modifier_ability_npc_cave3_range_spider_resist:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_cave3_range_spider_resist:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_npc_cave3_poison", {duration = 5})
end

