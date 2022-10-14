ability_npc_boss_jungle1_spell5 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle1_spell5","abilities/jungle1/ability_npc_boss_jungle1_spell5", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle1_spell5:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_jungle1_spell5"
end

modifier_ability_npc_boss_jungle1_spell5 = class({})

--Classifications template
function modifier_ability_npc_boss_jungle1_spell5:IsHidden()
    return true
end

function modifier_ability_npc_boss_jungle1_spell5:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle1_spell5:OnCreated()
    self.armor = self:GetAbility():GetSpecialValueFor("armor")
end

function modifier_ability_npc_boss_jungle1_spell5:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS
    }
end

function modifier_ability_npc_boss_jungle1_spell5:GetModifierPhysicalArmorBonus()
    return self.armor
end