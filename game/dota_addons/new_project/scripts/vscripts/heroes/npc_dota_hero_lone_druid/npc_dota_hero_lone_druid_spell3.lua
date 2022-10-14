npc_dota_hero_lone_druid_spell3 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_lone_druid_spell3", "heroes/npc_dota_hero_lone_druid/npc_dota_hero_lone_druid_spell3", LUA_MODIFIER_MOTION_NONE )

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

function modifier_npc_dota_hero_lone_druid_spell3:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_ATTACK_LANDED
	}
end

function modifier_npc_dota_hero_lone_druid_spell3:OnAttackLanded( data )
    if self:GetParent() == data.target then
        if not data.attacker:IsRangedAttacker() and RollPseudoRandom(self.chance,self:GetParent()) then
            self:GetCaster():PerformAttack(data.attacker, false, false, true, false, false, false, true)

            self:GetAbility():UseResources( false, false, true )

            local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_legion_commander/legion_commander_courage_tgt_flash.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
            ParticleManager:ReleaseParticleIndex( effect_cast )
            local effect_cast2 = ParticleManager:CreateParticle( "particles/units/heroes/hero_legion_commander/legion_commander_courage_hit.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
            ParticleManager:ReleaseParticleIndex( effect_cast2 )
            EmitSoundOn( "Hero_LegionCommander.Courage", self:GetParent() )
        end
    end
end