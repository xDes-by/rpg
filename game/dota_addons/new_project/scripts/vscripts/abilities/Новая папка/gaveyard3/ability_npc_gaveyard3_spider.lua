ability_npc_gaveyard3_spider = class({})

LinkLuaModifier( "modifier_ability_npc_gaveyard3_spider","abilities/gaveyard3/ability_npc_gaveyard3_spider", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_gaveyard3_spider_effect","abilities/gaveyard3/ability_npc_gaveyard3_spider", LUA_MODIFIER_MOTION_NONE )

function ability_npc_gaveyard3_spider:GetIntrinsicModifierName()
    return "modifier_ability_npc_gaveyard3_spider"
end

modifier_ability_npc_gaveyard3_spider = class({})

--Classifications template
function modifier_ability_npc_gaveyard3_spider:IsHidden()
   return true
end

function modifier_ability_npc_gaveyard3_spider:IsPurgable()
   return false
end

function modifier_ability_npc_gaveyard3_spider:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_gaveyard3_spider:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_gaveyard3_spider_effect", {duration = 5})
    self.trigger = true
end

modifier_ability_npc_gaveyard3_spider_effect = class({})
--Classifications template
function modifier_ability_npc_gaveyard3_spider_effect:IsHidden()
   return false
end

function modifier_ability_npc_gaveyard3_spider_effect:IsDebuff()
   return true
end

function modifier_ability_npc_gaveyard3_spider_effect:IsPurgable()
   return true
end

function modifier_ability_npc_gaveyard3_spider_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_gaveyard3_spider_effect:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_ability_npc_gaveyard3_spider_effect:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.2)
end

function modifier_ability_npc_gaveyard3_spider_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage =  self:GetAbility():GetSpecialValueFor("damage"),
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_ability_npc_gaveyard3_spider_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MISS_PERCENTAGE
}
end

function modifier_ability_npc_gaveyard3_spider_effect:GetModifierMiss_Percentage()
    return 10
end
