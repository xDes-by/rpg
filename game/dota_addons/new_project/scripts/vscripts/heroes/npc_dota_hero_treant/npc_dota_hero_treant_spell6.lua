LinkLuaModifier( "modifier_npc_dota_hero_treant_spell6", "heroes/npc_dota_hero_treant/npc_dota_hero_treant_spell6", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_treant_spell6 = class({})

function npc_dota_hero_treant_spell6:OnSpellStart()
	EmitSoundOn( "Hero_Treant.Eyes.Cast", self:GetCaster() )
end

function npc_dota_hero_treant_spell6:OnChannelFinish(bInterrupted)
    if bInterrupted then
		StopSoundOn( "Hero_Treant.Eyes.Cast", self:GetCaster() )
    end
    if not bInterrupted then
		local duration = self:GetSpecialValueFor("duration")
        local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self:GetCaster():GetAbsOrigin(), nil, FIND_UNITS_EVERYWHERE, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, 0, 0,false)
		for _,unit in pairs(enemies) do
			unit:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_treant_spell6", {duration = duration})
		end
    end
end

------------------------------------------------------------------------------------

modifier_npc_dota_hero_treant_spell6 = class({})

function modifier_npc_dota_hero_treant_spell6:IsHidden()
    return false
end

function modifier_npc_dota_hero_treant_spell6:IsDebuff()
    return false
end

function modifier_npc_dota_hero_treant_spell6:IsPurgable()
    return true
end

function modifier_npc_dota_hero_treant_spell6:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_treant_spell6:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_treant_spell6:OnCreated()
    self.out = self:GetAbility():GetSpecialValueFor("bonus_uron")
    self.ev = self:GetAbility():GetSpecialValueFor("evation")
end

function modifier_npc_dota_hero_treant_spell6:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE,
        MODIFIER_PROPERTY_EVASION_CONSTANT
    }
end

function modifier_npc_dota_hero_treant_spell6:GetModifierDamageOutgoing_Percentage()
    return self.out 
end

function modifier_npc_dota_hero_treant_spell6:GetModifierEvasion_Constant()
    return self.ev
end
