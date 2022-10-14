ability_npc_boss_jungle3_spell4 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle3_spell4","abilities/jungle3/ability_npc_boss_jungle3_spell4", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_jungle3_spell4_effect","abilities/jungle3/ability_npc_boss_jungle3_spell4", LUA_MODIFIER_MOTION_NONE )


function ability_npc_boss_jungle3_spell4:OnSpellStart()
    CreateModifierThinker(self:GetCaster(), self, "modifier_ability_npc_boss_jungle3_spell4", {duration = 5}, self:GetCursorPosition(), DOTA_TEAM_BADGUYS, false)
end

modifier_ability_npc_boss_jungle3_spell4 = class({})

-- Aura template
function modifier_ability_npc_boss_jungle3_spell4:IsAura()
    return true
end

function modifier_ability_npc_boss_jungle3_spell4:OnCreated()
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_viper/viper_nethertoxin.vpcf", PATTACH_POINT_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( 300, 1, 1 ) )
	self:AddParticle(effect_cast, false, false, -1, false, false)
	EmitSoundOn( "Hero_Viper.NetherToxin", self:GetParent() )
end

function modifier_ability_npc_boss_jungle3_spell4:GetModifierAura()
    return "modifier_ability_npc_boss_jungle3_spell4_effect"
end

function modifier_ability_npc_boss_jungle3_spell4:GetAuraRadius()
    return 300
end

function modifier_ability_npc_boss_jungle3_spell4:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_boss_jungle3_spell4:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_boss_jungle3_spell4:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_boss_jungle3_spell4:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_boss_jungle3_spell4_effect = class({})
--Classifications template
function modifier_ability_npc_boss_jungle3_spell4_effect:IsHidden()
    return false
end

function modifier_ability_npc_boss_jungle3_spell4_effect:IsDebuff()
    return true
end

function modifier_ability_npc_boss_jungle3_spell4_effect:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle3_spell4_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_jungle3_spell4_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_jungle3_spell4_effect:OnCreated()
    self.damage = self:GetParent():GetMaxHealth() * self:GetAbility():GetSpecialValueFor("damage") * 0.01 * 0.1
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.1)
end

function modifier_ability_npc_boss_jungle3_spell4_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage =  self.damage,
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_ability_npc_boss_jungle3_spell4_effect:GetEffectName()
	return "particles/units/heroes/hero_viper/viper_nethertoxin_debuff.vpcf"
end

function modifier_ability_npc_boss_jungle3_spell4_effect:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end