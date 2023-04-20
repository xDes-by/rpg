LinkLuaModifier( "modifier_npc_dota_hero_lone_druid_spell3", "heroes/npc_dota_hero_lone_druid/npc_dota_hero_lone_druid_spell3", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_lone_druid_spell3 = class({})

function npc_dota_hero_lone_druid_spell3:GetIntrinsicModifierName()
	return "modifier_npc_dota_hero_lone_druid_spell3"
end

modifier_npc_dota_hero_lone_druid_spell3 = class({})

function modifier_npc_dota_hero_lone_druid_spell3:IsHidden()
	return true
end

function modifier_npc_dota_hero_lone_druid_spell3:IsPurgable()
	return false
end

function modifier_npc_dota_hero_lone_druid_spell3:OnCreated( kv )
    self.chance = self:GetAbility():GetSpecialValueFor( "trigger_chance" )
end

function modifier_npc_dota_hero_lone_druid_spell3:OnRefresh( kv )
    self.chance = self:GetAbility():GetSpecialValueFor( "trigger_chance" )
end

function modifier_npc_dota_hero_lone_druid_spell3:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

function modifier_npc_dota_hero_lone_druid_spell3:OnAttackLanded( data )
    if self:GetParent() == data.target then
        if not data.attacker:IsRangedAttacker() and RandomInt(1,100) <= self.chance and self:GetAbility():IsCooldownReady() then
            self:GetCaster():PerformAttack(data.attacker, false, false, true, false, false, false, true)
            local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_legion_commander/legion_commander_courage_tgt_flash.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
            ParticleManager:ReleaseParticleIndex( effect_cast )
            local effect_cast2 = ParticleManager:CreateParticle( "particles/units/heroes/hero_legion_commander/legion_commander_courage_hit.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
            ParticleManager:ReleaseParticleIndex( effect_cast2 )
            EmitSoundOn( "Hero_LegionCommander.Courage", self:GetParent() )
			self:GetAbility():UseResources(false, false, true)
        end
    end
end