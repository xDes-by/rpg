npc_dota_hero_undying_spell3 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_undying_spell3","heroes/npc_dota_hero_undying/npc_dota_hero_undying_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_undying_spell3_stack","heroes/npc_dota_hero_undying/npc_dota_hero_undying_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_undying_spell3_effect","heroes/npc_dota_hero_undying/npc_dota_hero_undying_spell3", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_undying_spell3:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_undying_spell3"
end

modifier_npc_dota_hero_undying_spell3 = class({})

--Classifications template
function modifier_npc_dota_hero_undying_spell3:IsHidden()
    return true
end

function modifier_npc_dota_hero_undying_spell3:IsPurgable()
    return false
end

function modifier_npc_dota_hero_undying_spell3:OnCreated()
    self.damage = 0
    self.stackduration = self:GetAbility():GetSpecialValueFor("duration")
    self.max_stacks = self:GetAbility():GetSpecialValueFor("max_stacks")
    if IsClient() then
        return
    end
    self:GetAbility().mod = self:GetParent():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_undying_spell3_effect", {})
end

function modifier_npc_dota_hero_undying_spell3:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_TAKEDAMAGE
    }
end

function modifier_npc_dota_hero_undying_spell3:OnTakeDamage(data)
    if data.unit == self:GetParent() then
        self.damage = data.damage + self.damage
        if self.damage >= 200 then
            if self:GetAbility().mod:GetStackCount() < self.max_stacks then
                self:GetParent():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_undying_spell3_stack", {duration = self.stackduration})
                self.damage = 0
            end
        end
    end
end

modifier_npc_dota_hero_undying_spell3_stack = class({})
--Classifications template
function modifier_npc_dota_hero_undying_spell3_stack:IsHidden()
    return true
end

function modifier_npc_dota_hero_undying_spell3_stack:IsPurgable()
    return false
end

function modifier_npc_dota_hero_undying_spell3_stack:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_undying_spell3_stack:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_undying_spell3_stack:AllowIllusionDuplicate()
    return true
end

function modifier_npc_dota_hero_undying_spell3_stack:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_npc_dota_hero_undying_spell3_stack:OnCreated()
    if IsClient() then
        return
    end
    self:GetAbility().mod:IncrementStackCount()
end

function modifier_npc_dota_hero_undying_spell3_stack:OnDestroy()
    if IsClient() then
        return
    end
    self:GetAbility().mod:DecrementStackCount()
end

modifier_npc_dota_hero_undying_spell3_effect = class({})
--Classifications template
function modifier_npc_dota_hero_undying_spell3_effect:IsHidden()
    if self:GetStackCount() == 0 then
        return true
    end
    return false
end

function modifier_npc_dota_hero_undying_spell3_effect:IsDebuff()
    return false
end

function modifier_npc_dota_hero_undying_spell3_effect:IsPurgable()
    return false
end

function modifier_npc_dota_hero_undying_spell3_effect:OnCreated()
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self.armor = self:GetAbility():GetSpecialValueFor("armor")
end

function modifier_npc_dota_hero_undying_spell3_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
        MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE
    }
end

function modifier_npc_dota_hero_undying_spell3_effect:GetModifierPhysicalArmorBonus()
    return self.armor
end

function modifier_npc_dota_hero_undying_spell3_effect:GetModifierBaseAttack_BonusDamage()
    return self.damage
end