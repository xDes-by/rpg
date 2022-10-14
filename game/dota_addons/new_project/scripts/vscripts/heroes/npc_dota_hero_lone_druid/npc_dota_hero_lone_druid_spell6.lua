npc_dota_hero_lone_druid_spell6 = class ({})

LinkLuaModifier("modifier_npc_dota_hero_lone_druid_spell6" , "heroes/npc_dota_hero_lone_druid/npc_dota_hero_lone_druid_spell6" , LUA_MODIFIER_MOTION_NONE) 

function npc_dota_hero_lone_druid_spell6:GetIntrinsicModifierName()
	return "modifier_npc_dota_hero_lone_druid_spell6"
end

modifier_npc_dota_hero_lone_druid_spell6 = class({})

function modifier_npc_dota_hero_lone_druid_spell6:IsHidden()
    return true
end
 
function modifier_npc_dota_hero_lone_druid_spell6:IsPurgable()
    return false
end

function modifier_npc_dota_hero_lone_druid_spell6:OnCreated()
    self.armor = self:GetAbility():GetSpecialValueFor("armor")
    self.str = self:GetAbility():GetSpecialValueFor("str")
end

function modifier_npc_dota_hero_lone_druid_spell6:DeclareFunctions()
    return {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS
	}
end
function modifier_npc_dota_hero_lone_druid_spell6:GetModifierPhysicalArmorBonus()
    return self.armor
end

function modifier_npc_dota_hero_lone_druid_spell6:GetModifierBonusStats_Strength()
    return self.str
end
