ability_npc_boss_jungle2_spell6  = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle2_spell6","abilities/jungle2/ability_npc_boss_jungle2_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_jungle2_spell6_effect","abilities/jungle2/ability_npc_boss_jungle2_spell6", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle2_spell6:Precache(context)
    PrecacheResource( "particle", "particles/ability_npc_boss_jungle2_spell3.vpcf", context )
    PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_windrunner.vsndevts", context )
end

function ability_npc_boss_jungle2_spell6:OnSpellStart()
    CreateModifierThinker(self:GetCaster(), self, "modifier_ability_npc_boss_jungle2_spell6", {duration = 5}, self:GetCursorPosition(), DOTA_TEAM_BADGUYS, false)
end

modifier_ability_npc_boss_jungle2_spell6 = class({})

function modifier_ability_npc_boss_jungle2_spell6:IsHidden()
    return true
end

function modifier_ability_npc_boss_jungle2_spell6:OnCreated()
    local pfx = ParticleManager:CreateParticle("particles/ability_npc_boss_jungle2_spell3.vpcf", PATTACH_POINT, self:GetParent())
    ParticleManager:SetParticleControl(pfx, 1, Vector(0, 300, 0))
	self:AddParticle(pfx,false,false,-1,false, false)
    EmitSoundOn("Hero_Windrunner.GaleForce", self:GetParent())
end

function modifier_ability_npc_boss_jungle2_spell6:OnDestroy()
    StopSoundOn("Hero_Windrunner.GaleForce", self:GetParent())
end
-- Aura template
function modifier_ability_npc_boss_jungle2_spell6:IsAura()
    return true
end

function modifier_ability_npc_boss_jungle2_spell6:GetModifierAura()
    return "modifier_ability_npc_boss_jungle2_spell6_effect"
end

function modifier_ability_npc_boss_jungle2_spell6:GetAuraRadius()
    return 300
end

function modifier_ability_npc_boss_jungle2_spell6:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_boss_jungle2_spell6:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_boss_jungle2_spell6:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_boss_jungle2_spell6:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_boss_jungle2_spell6_effect = class({})
--Classifications template
function modifier_ability_npc_boss_jungle2_spell6_effect:IsHidden()
    return false
end

function modifier_ability_npc_boss_jungle2_spell6_effect:IsDebuff()
    return true
end

function modifier_ability_npc_boss_jungle2_spell6_effect:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle2_spell6_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_jungle2_spell6_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_jungle2_spell6_effect:OnCreated()
    self.persent = self:GetAbility():GetSpecialValueFor("persent") * 0.01 / 3
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.3)
end

function modifier_ability_npc_boss_jungle2_spell6_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage = self:GetParent():GetHealth() * self.persent,
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_ability_npc_boss_jungle2_spell6_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_PROPERTY_DAMAGEOUTGOING_PERCENTAGE
    }
end

function modifier_ability_npc_boss_jungle2_spell6_effect:GetModifierMoveSpeedBonus_Percentage()
    return -50
end

function modifier_ability_npc_boss_jungle2_spell6_effect:GetModifierDamageOutgoing_Percentage()
    return 80
end