ability_npc_boss_gaveyard1_spell1 = class({})

LinkLuaModifier("modifier_ability_npc_boss_gaveyard1_spell1_buff", "abilities/gaveyard1/ability_npc_boss_gaveyard1_spell1", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ability_npc_boss_gaveyard1_spell1_debuff", "abilities/gaveyard1/ability_npc_boss_gaveyard1_spell1", LUA_MODIFIER_MOTION_NONE)


function ability_npc_boss_gaveyard1_spell1:OnSpellStart()
    local hp = self:GetCursorTarget():GetMaxHealth() * self:GetSpecialValueFor("persentage") * 0.01
    self:GetCursorTarget():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_gaveyard1_spell1_debuff", {duration = self:GetSpecialValueFor("duration"), hp = hp})
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_gaveyard1_spell1_buff", {duration = self:GetSpecialValueFor("duration"), hp = hp})
    local decay_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_undying/undying_decay.vpcf", PATTACH_WORLDORIGIN, self:GetCaster())
	ParticleManager:SetParticleControl(decay_particle, 0, self:GetCursorTarget():GetAbsOrigin())
	ParticleManager:SetParticleControl(decay_particle, 1, Vector(100, 0, 0))
	ParticleManager:SetParticleControl(decay_particle, 2, self:GetCaster():GetAbsOrigin())    
	ParticleManager:ReleaseParticleIndex(decay_particle)
    EmitSoundOn("Hero_Undying.Decay.Cast", self:GetCaster())
end

modifier_ability_npc_boss_gaveyard1_spell1_buff = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard1_spell1_buff:IsHidden()
    return false
end

function modifier_ability_npc_boss_gaveyard1_spell1_buff:IsDebuff()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell1_buff:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard1_spell1_buff:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell1_buff:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell1_buff:OnCreated(kv)
    self.hp = kv.hp
    EmitSoundOn("Hero_Undying.Decay.Transfer", self:GetCaster())
end

function modifier_ability_npc_boss_gaveyard1_spell1_buff:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_HEALTH_BONUS
    }
end

function modifier_ability_npc_boss_gaveyard1_spell1_buff:GetModifierHealthBonus()
    return self.hp
end

modifier_ability_npc_boss_gaveyard1_spell1_debuff = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard1_spell1_debuff:IsHidden()
    return false
end

function modifier_ability_npc_boss_gaveyard1_spell1_debuff:IsDebuff()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell1_debuff:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard1_spell1_debuff:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell1_debuff:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell1_debuff:OnCreated(kv)
    self.hp = kv.hp
    EmitSoundOn("Hero_Undying.Decay.Target", self:GetCaster())
end

function modifier_ability_npc_boss_gaveyard1_spell1_debuff:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_HEALTH_BONUS
    }
end

function modifier_ability_npc_boss_gaveyard1_spell1_debuff:GetModifierHealthBonus()
    return -self.hp
end