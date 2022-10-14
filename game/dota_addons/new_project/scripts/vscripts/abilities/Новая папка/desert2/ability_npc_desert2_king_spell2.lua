ability_npc_desert2_king_spell2 = class({})

LinkLuaModifier( "modifier_ability_npc_desert2_king_spell2","abilities/desert2/ability_npc_desert2_king_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_desert2_king_spell2_effect","abilities/desert2/ability_npc_desert2_king_spell2", LUA_MODIFIER_MOTION_NONE )

function ability_npc_desert2_king_spell2:GetChannelTime()
    return 10
end

function ability_npc_desert2_king_spell2:GetChannelAnimation()
    return ACT_DOTA_OVERRIDE_ABILITY_1
end

function ability_npc_desert2_king_spell2:OnSpellStart()
    self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_sandking/sandking_sandstorm.vpcf", PATTACH_POINT, self:GetCaster() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 500, 500, 500 ) )
	EmitSoundOn( "Ability.SandKing_SandStorm.loop", self:GetCaster() )
    self.mod = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_desert2_king_spell2", {duration = self:GetChannelTime()})
end

function ability_npc_desert2_king_spell2:OnChannelFinish()
    self.mod:Destroy()
    ParticleManager:DestroyParticle(self.effect_cast, false)
    ParticleManager:ReleaseParticleIndex(self.effect_cast)
end

modifier_ability_npc_desert2_king_spell2 = class({})
--Classifications template
function modifier_ability_npc_desert2_king_spell2:IsHidden()
    return true
end

function modifier_ability_npc_desert2_king_spell2:IsPurgable()
    return false
end

function modifier_ability_npc_desert2_king_spell2:RemoveOnDeath()
    return true
end

function modifier_ability_npc_desert2_king_spell2:DestroyOnExpire()
    return true
end

-- Aura template
function modifier_ability_npc_desert2_king_spell2:IsAura()
    return true
end

function modifier_ability_npc_desert2_king_spell2:GetModifierAura()
    return "modifier_ability_npc_desert2_king_spell2_effect"
end

function modifier_ability_npc_desert2_king_spell2:GetAuraRadius()
    return 500
end

function modifier_ability_npc_desert2_king_spell2:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_desert2_king_spell2:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_desert2_king_spell2:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_desert2_king_spell2:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_desert2_king_spell2_effect = class({})
--Classifications template
function modifier_ability_npc_desert2_king_spell2_effect:IsHidden()
    return false
end

function modifier_ability_npc_desert2_king_spell2_effect:IsDebuff()
    return true
end

function modifier_ability_npc_desert2_king_spell2_effect:IsPurgable()
    return false
end

function modifier_ability_npc_desert2_king_spell2_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_desert2_king_spell2_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_desert2_king_spell2_effect:OnCreated()
    self.damage = self:GetAbility():GetSpecialValueFor("damage") / 2
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.5)
end

function modifier_ability_npc_desert2_king_spell2_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage =  self.damage,
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end