ability_npc_hell1_magma_golem = class({})

LinkLuaModifier( "modifier_ability_npc_hell1_magma_golem_thinker","abilities/hell1/ability_npc_hell1_magma_golem", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell1_magma_golem_thinker_burn","abilities/hell1/ability_npc_hell1_magma_golem", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell1_magma_golem:OnSpellStart()
	ProjectileManager:CreateTrackingProjectile({		
        Source = caster,
		Ability = self,	
        Target = self:GetCursorTarget(),
		EffectName = "particles/units/heroes/hero_dragon_knight/dragon_knight_dragon_tail_dragonform_proj.vpcf",
		iMoveSpeed = 300,
		vSourceLoc= self:GetCaster():GetAbsOrigin(),                -- Optional (HOW)
		bDodgeable = true,                                -- Optional
		bVisibleToEnemies = true,                         -- Optional
		bReplaceExisting = false,                         -- Optional
		bProvidesVision = false,                           -- Optional
    })
	EmitSoundOn( "Hero_Alchemist.UnstableConcoction.Throw", self:GetCaster() )
end

function ability_npc_hell1_magma_golem:OnProjectileHit(target, location )
    CreateModifierThinker(self:GetCaster(), self, "modifier_ability_npc_hell1_magma_golem_thinker", {duration = 3}, location, self:GetCaster():GetTeamNumber(), false)
end

modifier_ability_npc_hell1_magma_golem_thinker = class({})
--Classifications template
function modifier_ability_npc_hell1_magma_golem_thinker:IsHidden()
   return true
end

-- Aura template
function modifier_ability_npc_hell1_magma_golem_thinker:IsAura()
    return true
end

function modifier_ability_npc_hell1_magma_golem_thinker:OnCreated()
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_dragon_knight/dragon_knight_shard_fireball.vpcf", PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( 300, 1, 1 ) )
	self:AddParticle(effect_cast,false,false,-1,false,false)
	EmitSoundOn( "hero_jakiro.macropyre", self:GetParent() )
end

function modifier_ability_npc_hell1_magma_golem_thinker:OnDestroy()
    UTIL_Remove(self:GetParent())
end

function modifier_ability_npc_hell1_magma_golem_thinker:GetModifierAura()
    return "modifier_ability_npc_hell1_magma_golem_thinker_burn"
end

function modifier_ability_npc_hell1_magma_golem_thinker:GetAuraRadius()
    return 300
end

function modifier_ability_npc_hell1_magma_golem_thinker:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_hell1_magma_golem_thinker:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_hell1_magma_golem_thinker:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_hell1_magma_golem_thinker:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end


function modifier_ability_npc_hell1_magma_golem_thinker:GetEffectName()
	return "particles/units/heroes/hero_jakiro/jakiro_liquid_fire_debuff.vpcf"
end

modifier_ability_npc_hell1_magma_golem_thinker_burn = class({})
--Classifications template
function modifier_ability_npc_hell1_magma_golem_thinker_burn:IsHidden()
   return false
end

function modifier_ability_npc_hell1_magma_golem_thinker_burn:IsDebuff()
   return true
end

function modifier_ability_npc_hell1_magma_golem_thinker_burn:IsPurgable()
   return true
end

function modifier_ability_npc_hell1_magma_golem_thinker_burn:RemoveOnDeath()
   return true
end

function modifier_ability_npc_hell1_magma_golem_thinker_burn:DestroyOnExpire()
    return true
end

function modifier_ability_npc_hell1_magma_golem_thinker_burn:OnCreated()
    self:StartIntervalThink(1)
end

function modifier_ability_npc_hell1_magma_golem_thinker_burn:OnIntervalThink()
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