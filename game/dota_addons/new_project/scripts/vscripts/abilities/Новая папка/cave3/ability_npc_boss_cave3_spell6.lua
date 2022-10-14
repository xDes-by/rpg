ability_npc_boss_cave3_spell6 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_cave3_spell6","abilities/cave3/ability_npc_boss_cave3_spell6", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_cave3_spell6:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_cave3_spell6", {duration = self:GetSpecialValueFor("duration")})
end

modifier_ability_npc_boss_cave3_spell6 = class({})
--Classifications template
function modifier_ability_npc_boss_cave3_spell6:IsHidden()
    return false
end

function modifier_ability_npc_boss_cave3_spell6:IsDebuff()
    return false
end

function modifier_ability_npc_boss_cave3_spell6:IsPurgable()
    return false
end

function modifier_ability_npc_boss_cave3_spell6:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_cave3_spell6:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_cave3_spell6:OnCreated()
    self.DamageCalculator = self:GetAbility():GetSpecialValueFor("max_damage")
end

function modifier_ability_npc_boss_cave3_spell6:GetEffectName()
    return "particles/units/heroes/hero_abaddon/abaddon_borrowed_time.vpcf"
end

function modifier_ability_npc_boss_cave3_spell6:GetStatusEffectName()
    return "particles/status_fx/status_effect_abaddon_borrowed_time.vpcf"
end

function modifier_ability_npc_boss_cave3_spell6:StatusEffectPriority()
    return 15
end

function modifier_ability_npc_boss_cave3_spell6:GetEffectAttachType()
    return PATTACH_ABSORIGIN_FOLLOW
end

function modifier_ability_npc_boss_cave3_spell6:DeclareFunctions()
    return {
       MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK
    }
end

function modifier_ability_npc_boss_cave3_spell6:GetModifierTotal_ConstantBlock(data)
    self.DamageCalculator = self.DamageCalculator - data.damage
    if self.DamageCalculator >= 0  then
        self:GetParent():Heal(data.damage, self:GetAbility())
	    SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetParent(), data.damage, nil)
        return data.damage
    else
        SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetParent(), self.DamageCalculator * -1 - 1500, nil)
        self:Destroy()
        return data.damage + self.DamageCalculator
    end
end