npc_dota_hero_abyssal_underlord_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_abyssal_underlord_spell1_target", "heroes/npc_dota_hero_abyssal_underlord/npc_dota_hero_abyssal_underlord_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_abyssal_underlord_spell1_caster", "heroes/npc_dota_hero_abyssal_underlord/npc_dota_hero_abyssal_underlord_spell1", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_abyssal_underlord_spell1:OnSpellStart()
    local target = self:GetCursorTarget()
    self.mod = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_abyssal_underlord_spell1_caster", {})
    target:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_abyssal_underlord_spell1_target", {duration = self:GetSpecialValueFor("duration")})
    EmitSoundOn("Hero_AbyssalUnderlord.Pit.Target", target)
end

modifier_npc_dota_hero_abyssal_underlord_spell1_target = class({})
--Classifications template
function modifier_npc_dota_hero_abyssal_underlord_spell1_target:IsHidden()
    return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_target:IsDebuff()
    return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_target:IsPurgable()
    return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_target:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_target:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_target:OnCreated()
    self.Damage = self:GetAbility():GetSpecialValueFor("damage") / 3
    self.AllDamage = 0
    local effect_cast = ParticleManager:CreateParticle( "particles/npc_dota_hero_abyssal_underlord/npc_dota_hero_abyssal_underlord_spell1.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent() )
	self:AddParticle(effect_cast, false, false, -1, false, false)
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.3)
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_target:OnIntervalThink()
    self.AllDamage = ApplyDamage({victim = self:GetParent(),
    damage = self.Damage,
    damage_type = self:GetAbility():GetAbilityDamageType(),
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()}) + self.AllDamage
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_target:OnDestroy()
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetCaster(), self.AllDamage, nil)
    if IsClient() then
        return
    end
    self:GetCaster():Heal(self.AllDamage, self:GetAbility())
    self:GetAbility().mod:Destroy()
end

modifier_npc_dota_hero_abyssal_underlord_spell1_caster = class({})
--Classifications template
function modifier_npc_dota_hero_abyssal_underlord_spell1_caster:IsHidden()
    return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_caster:IsDebuff()
    return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_caster:IsPurgable()
    return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_caster:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_caster:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_caster:RemoveOnDeath()
    self.regen = self:GetAbility():GetSpecialValueFor("regen")
    self.armor = self:GetAbility():GetSpecialValueFor("armor")
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_caster:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE,
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS
    }
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_caster:GetModifierHealthRegenPercentage()
    return self.regen
end

function modifier_npc_dota_hero_abyssal_underlord_spell1_caster:GetModifierPhysicalArmorBonus()
    return self.armor
end