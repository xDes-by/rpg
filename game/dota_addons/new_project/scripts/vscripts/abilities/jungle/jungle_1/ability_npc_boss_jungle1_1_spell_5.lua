LinkLuaModifier( "modifier_ability_npc_boss_jungle1_1_spell_5","abilities/jungle/jungle_1/ability_npc_boss_jungle1_1_spell_5", LUA_MODIFIER_MOTION_NONE )

ability_npc_boss_jungle1_1_spell_5 = class({})

function ability_npc_boss_jungle1_1_spell_5:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_jungle1_1_spell_5"
end

------------------------------------------------------------------------------------------------

modifier_ability_npc_boss_jungle1_1_spell_5 = class({})

function modifier_ability_npc_boss_jungle1_1_spell_5:IsHidden()
    return true
end

function modifier_ability_npc_boss_jungle1_1_spell_5:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle1_1_spell_5:OnCreated()
    self.armor = self:GetAbility():GetSpecialValueFor("armor")
end

function modifier_ability_npc_boss_jungle1_1_spell_5:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS
    }
end

function modifier_ability_npc_boss_jungle1_1_spell_5:GetModifierPhysicalArmorBonus()
-- if not IsServer() then return end
	local enemies = FindUnitsInRadius( self:GetParent():GetTeamNumber(), self:GetParent():GetAbsOrigin(), nil, 1000, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
		if unit:GetUnitName() == "npc_jungle_dragon" then
			return 0
		end	
	end
    return self.armor
end