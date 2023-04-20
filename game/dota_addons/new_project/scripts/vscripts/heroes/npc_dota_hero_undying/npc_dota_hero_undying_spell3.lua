LinkLuaModifier( "modifier_npc_dota_hero_undying_spell3","heroes/npc_dota_hero_undying/npc_dota_hero_undying_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_undying_spell3_stack","heroes/npc_dota_hero_undying/npc_dota_hero_undying_spell3", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_undying_spell3 = class({})

function npc_dota_hero_undying_spell3:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_undying_spell3"
end

----------------------------------------------------------------

modifier_npc_dota_hero_undying_spell3 = class({})

function modifier_npc_dota_hero_undying_spell3:IsHidden()
    return false
end

function modifier_npc_dota_hero_undying_spell3:IsPurgable()
    return false
end

function modifier_npc_dota_hero_undying_spell3:OnCreated()
    self.damage = 0
    self.stackduration = self:GetAbility():GetSpecialValueFor("duration")
    self.max_stacks = self:GetAbility():GetSpecialValueFor("max_stacks")
	self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self.armor = self:GetAbility():GetSpecialValueFor("armor")
    self.income_damage = self:GetAbility():GetSpecialValueFor("income_damage")
end

function modifier_npc_dota_hero_undying_spell3:OnRefresh()
    self.damage = 0
    self.stackduration = self:GetAbility():GetSpecialValueFor("duration")
    self.max_stacks = self:GetAbility():GetSpecialValueFor("max_stacks")
	self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self.armor = self:GetAbility():GetSpecialValueFor("armor")
    self.income_damage = self:GetAbility():GetSpecialValueFor("income_damage")
end

function modifier_npc_dota_hero_undying_spell3:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_TAKEDAMAGE,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
        MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE
    }
end

function modifier_npc_dota_hero_undying_spell3:OnTakeDamage(data)
    if data.unit == self:GetParent() then
        self.damage = data.damage + self.damage
        if self.damage >= self.income_damage then
            if self:GetStackCount() < self.max_stacks then
                self:GetParent():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_undying_spell3_stack", {duration = self.stackduration})
                self.damage = 0
            end
        end
    end
end

function modifier_npc_dota_hero_undying_spell3:IsHidden()
    if self:GetStackCount() == 0 then
        return true
    end
    return false
end

function modifier_npc_dota_hero_undying_spell3:GetModifierPhysicalArmorBonus()
    return self.armor * self:GetStackCount()
end

function modifier_npc_dota_hero_undying_spell3:GetModifierBaseAttack_BonusDamage()
    return self.damage * self:GetStackCount()
end

----------------------------------------------------------

modifier_npc_dota_hero_undying_spell3_stack = class({})

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
	if not IsServer() then return end
	mod = self:GetParent():FindModifierByName('modifier_npc_dota_hero_undying_spell3')
	mod:IncrementStackCount()
end

function modifier_npc_dota_hero_undying_spell3_stack:OnDestroy()
    if not IsServer() then return end
	mod = self:GetParent():FindModifierByName('modifier_npc_dota_hero_undying_spell3')
	mod:DecrementStackCount()
end

