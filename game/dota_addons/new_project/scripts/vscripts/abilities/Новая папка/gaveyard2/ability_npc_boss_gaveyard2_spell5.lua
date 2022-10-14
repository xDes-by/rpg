ability_npc_boss_gaveyard2_spell5 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_gaveyard2_spell5","abilities/gaveyard2/ability_npc_boss_gaveyard2_spell5", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_gaveyard2_spell5_sheeld","abilities/gaveyard2/ability_npc_boss_gaveyard2_spell5", LUA_MODIFIER_MOTION_NONE )


function ability_npc_boss_gaveyard2_spell5:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_gaveyard2_spell5"
end

function ability_npc_boss_gaveyard2_spell5:OnOwnerDied()
    MapLogic:Gaveyard2Clear()
    MapLogic:TPHome()
end

modifier_ability_npc_boss_gaveyard2_spell5 = class({})

function modifier_ability_npc_boss_gaveyard2_spell5:IsHidden()
    return true
end

function modifier_ability_npc_boss_gaveyard2_spell5:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard2_spell5:OnCreated()
    self:StartIntervalThink(1)
end

function modifier_ability_npc_boss_gaveyard2_spell5:OnIntervalThink()
    if self:GetCaster():GetHealthPercent() <= 10 then
        self:GetCaster():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_boss_gaveyard2_spell5_sheeld", {})
        self:Destroy()
    end
end

function modifier_ability_npc_boss_gaveyard2_spell5:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MIN_HEALTH
    }
end

function modifier_ability_npc_boss_gaveyard2_spell5:GetMinHealth()
    return 1
end

modifier_ability_npc_boss_gaveyard2_spell5_sheeld = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard2_spell5_sheeld:IsHidden()
    return false
end

function modifier_ability_npc_boss_gaveyard2_spell5_sheeld:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard2_spell5_sheeld:OnCreated()
    self.damage = 10000
    self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_abaddon/abaddon_aphotic_shield.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
    ParticleManager:SetParticleControl(self.particle, 1, Vector(300,0,300))
    ParticleManager:SetParticleControl(self.particle, 2, Vector(300,0,300))
    ParticleManager:SetParticleControl(self.particle, 4, Vector(300,0,300))
    ParticleManager:SetParticleControl(self.particle, 5, Vector(300,0,0))
    self:AddParticle(self.particle, false, false, -1, false, false)
    self:StartIntervalThink(2)
    self:GetCaster():GetAbilityByIndex(4):OnSpellStart()
end

function modifier_ability_npc_boss_gaveyard2_spell5_sheeld:OnIntervalThink()
    self:GetCaster():GetAbilityByIndex(RandomInt(1, 2)):OnSpellStart()
end

function modifier_ability_npc_boss_gaveyard2_spell5_sheeld:OnDestroy()
    self:GetParent():Kill(nil, nil)
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_abaddon/abaddon_aphotic_shield_explosion.vpcf", PATTACH_ABSORIGIN, self:GetParent())
    ParticleManager:SetParticleControl(particle, 0, self:GetParent():GetAbsOrigin())
    ParticleManager:ReleaseParticleIndex(particle)
end

function modifier_ability_npc_boss_gaveyard2_spell5_sheeld:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
    }
end

function modifier_ability_npc_boss_gaveyard2_spell5_sheeld:GetModifierTotal_ConstantBlock(data)
    self.damage = self.damage - data.damage
    if self.damage <= 0 then
        self:Destroy()
    end
    return data.damage
end

function modifier_ability_npc_boss_gaveyard2_spell5_sheeld:CheckState()
   return {
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
        [MODIFIER_STATE_STUNNED] = true
    }
end

function modifier_ability_npc_boss_gaveyard2_spell5_sheeld:GetOverrideAnimation()
    return ACT_DOTA_FLAIL
end

function modifier_ability_npc_boss_gaveyard2_spell5_sheeld:GetOverrideAnimationRate()
    return 0.1
end
