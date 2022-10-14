ability_npc_boss_hell2_spell1 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_hell2_spell1","abilities/hell2/ability_npc_boss_hell2_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_hell2_spell1_burn","abilities/hell2/ability_npc_boss_hell2_spell1", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_hell2_spell1:OnSpellStart()
    CreateModifierThinker(self:GetCaster(), self, "modifier_ability_npc_boss_hell2_spell1", {duration = self:GetSpecialValueFor("duration")}, self:GetCursorPosition(), self:GetCaster():GetTeamNumber(), false)
end

modifier_ability_npc_boss_hell2_spell1 = class({})
--Classifications template
function modifier_ability_npc_boss_hell2_spell1:IsHidden()
   return true
end

-- Aura template
function modifier_ability_npc_boss_hell2_spell1:IsAura()
    return true
end

function modifier_ability_npc_boss_hell2_spell1:OnCreated()
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_dragon_knight/dragon_knight_shard_fireball.vpcf", PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( 300, 1, 1 ) )
	self:AddParticle(effect_cast,false,false,-1,false,false)
	EmitSoundOn( "hero_jakiro.macropyre", self:GetParent() )
end

function modifier_ability_npc_boss_hell2_spell1:OnDestroy()
    UTIL_Remove(self:GetParent())
end

function modifier_ability_npc_boss_hell2_spell1:GetModifierAura()
    return "modifier_ability_npc_boss_hell2_spell1_burn"
end

function modifier_ability_npc_boss_hell2_spell1:GetAuraRadius()
    return 300
end

function modifier_ability_npc_boss_hell2_spell1:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_boss_hell2_spell1:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_boss_hell2_spell1:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_boss_hell2_spell1:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end


function modifier_ability_npc_boss_hell2_spell1:GetEffectName()
	return "particles/units/heroes/hero_jakiro/jakiro_liquid_fire_debuff.vpcf"
end

modifier_ability_npc_boss_hell2_spell1_burn = class({})
--Classifications template
function modifier_ability_npc_boss_hell2_spell1_burn:IsHidden()
   return false
end

function modifier_ability_npc_boss_hell2_spell1_burn:IsDebuff()
   return true
end

function modifier_ability_npc_boss_hell2_spell1_burn:IsPurgable()
   return true
end

function modifier_ability_npc_boss_hell2_spell1_burn:RemoveOnDeath()
   return true
end

function modifier_ability_npc_boss_hell2_spell1_burn:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_hell2_spell1_burn:OnCreated()
    self:StartIntervalThink(1)
end

function modifier_ability_npc_boss_hell2_spell1_burn:OnIntervalThink()
    if IsClient() then
        return
    end
    ApplyDamage({victim = self:GetParent(),
    damage =  self:GetAbility():GetSpecialValueFor("damage"),
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end