ability_npc_cave3_mele_spider_resist = class({})

LinkLuaModifier( "modifier_ability_npc_cave3_mele_spider_resist","abilities/cave3/ability_npc_cave3_mele_spider_resist", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_cave3_poison","abilities/cave3/ability_npc_cave3_mele_spider_resist", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_cave3_poison_counter","abilities/cave3/ability_npc_cave3_mele_spider_resist", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave3_mele_spider_resist:GetIntrinsicModifierName()
    return "modifier_ability_npc_cave3_mele_spider_resist"
end

modifier_ability_npc_cave3_mele_spider_resist = class({})

--Classifications template
function modifier_ability_npc_cave3_mele_spider_resist:IsHidden()
   return true
end

function modifier_ability_npc_cave3_mele_spider_resist:IsDebuff()
   return false
end

function modifier_ability_npc_cave3_mele_spider_resist:IsPurgable()
   return false
end

function modifier_ability_npc_cave3_mele_spider_resist:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_cave3_mele_spider_resist:GetModifierProcAttack_Feedback(data)
    local mod = data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_npc_cave3_poison", {duration = 5})

end

modifier_npc_cave3_poison = class({})
--Classifications template
function modifier_npc_cave3_poison:IsHidden()
   return true
end

function modifier_npc_cave3_poison:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_npc_cave3_poison:OnCreated()
    if IsClient() then
        return
    end
    self.mod = self:GetParent():FindModifierByName("modifier_npc_cave3_poison_counter") 
    if self.mod ~= nil then
        self.mod:IncrementStackCount()
    else
        self:GetParent():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_cave3_poison_counter", {}):SetStackCount(1)
    end
end

--function modifier_npc_cave3_poison:OnDestroy()
--    if IsClient() then
--        return
--    end
--    self.mod:DecrementStackCount()
--end

modifier_npc_cave3_poison_counter = class({})
--Classifications template
function modifier_npc_cave3_poison_counter:IsHidden()
   return false
end

function modifier_npc_cave3_poison_counter:IsDebuff()
   return true
end

function modifier_npc_cave3_poison_counter:IsPurgable()
   return false
end

function modifier_npc_cave3_poison_counter:IsPurgeException()
    return true
end

function modifier_npc_cave3_poison_counter:RemoveOnDeath()
   return true
end

function modifier_npc_cave3_poison_counter:DestroyOnExpire()
    return false
end

function modifier_npc_cave3_poison_counter:OnRefresh()
    if IsClient() then
        return
    end
    if self:GetStackCount() >= 50 then 
        self:GetParent():Kill(self:GetAbility(), self:GetParent())
    end
end
