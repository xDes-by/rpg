ability_npc_boss_jungle2_spell1 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle2_spell1_status_effect","abilities/jungle2/ability_npc_boss_jungle2_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_jungle2_spell1","abilities/jungle2/ability_npc_boss_jungle2_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_jungle2_spell1_thinker","abilities/jungle2/ability_npc_boss_jungle2_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_jungle2_spell1_thinker_burn","abilities/jungle2/ability_npc_boss_jungle2_spell1", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle2_spell1:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_jungle2_spell1_status_effect"
end

modifier_ability_npc_boss_jungle2_spell1_status_effect = class({})

function modifier_ability_npc_boss_jungle2_spell1_status_effect:IsHidden()
    return true
end

function modifier_ability_npc_boss_jungle2_spell1_status_effect:GetStatusEffectName()
    return "particles/status_fx/status_effect_abaddon_borrowed_time.vpcf"
end

function modifier_ability_npc_boss_jungle2_spell1_status_effect:GetEffectName()
    return "particles/units/heroes/hero_abaddon/abaddon_borrowed_time.vpcf"
end

function modifier_ability_npc_boss_jungle2_spell1_status_effect:GetEffectAttachType()
    return PATTACH_ABSORIGIN_FOLLOW
end

function ability_npc_boss_jungle2_spell1:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_jungle2_spell1", {duration = 5})
end

function ability_npc_boss_jungle2_spell1:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
    local modifier = EntIndexToHScript(ExtraData.thinker):FindModifierByName("modifier_ability_npc_boss_jungle2_spell1_thinker"):Active()
end
modifier_ability_npc_boss_jungle2_spell1 = class({})
--Classifications template
function modifier_ability_npc_boss_jungle2_spell1:IsHidden()
    return false
end

function modifier_ability_npc_boss_jungle2_spell1:IsDebuff()
    return false
end

function modifier_ability_npc_boss_jungle2_spell1:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle2_spell1:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_jungle2_spell1:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_jungle2_spell1:OnCreated()
    self.count = 5
    if IsClient() then
        return
    end
    self:StartIntervalThink(1.1)
    self:OnIntervalThink()
end

function modifier_ability_npc_boss_jungle2_spell1:OnDestroy()
    ParticleManager:DestroyParticle(self.pfx, false)
end

function modifier_ability_npc_boss_jungle2_spell1:OnIntervalThink()
    self.count = self.count - 1
    if self.pfx then
        ParticleManager:DestroyParticle(self.pfx, false)
    end
    self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_marci/marci_unleash_stack.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent())
	ParticleManager:SetParticleControl( self.pfx, 1, Vector( 0, self.count, 0 ) )
    local thinker = CreateModifierThinker(self:GetCaster(),self,"modifier_ability_npc_boss_jungle2_spell1_thinker",{duration = 5},self:GetCaster():GetAbsOrigin() + RandomVector(RandomInt(100, 500)),DOTA_TEAM_BADGUYS,false)
    	ProjectileManager:CreateTrackingProjectile({		
        Source = self:GetCaster(),
		Ability = self:GetAbility(),	
        Target = thinker,
		EffectName = "particles/units/heroes/hero_dragon_knight/dragon_knight_dragon_tail_dragonform_proj.vpcf",
		iMoveSpeed = 300,
		vSourceLoc= self:GetCaster():GetAbsOrigin(),                -- Optional (HOW)
		bDodgeable = false,                                -- Optional
		bVisibleToEnemies = true,                         -- Optional
		bReplaceExisting = false,                         -- Optional
		bProvidesVision = false,                           -- Optional
        ExtraData = {thinker = thinker:entindex()}
    })
end

modifier_ability_npc_boss_jungle2_spell1_thinker = class({})

function modifier_ability_npc_boss_jungle2_spell1_thinker:IsHidden()
    return true
end

function modifier_ability_npc_boss_jungle2_spell1_thinker:OnCreated()
    self.x_pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_kunkka/kunkka_spell_x_spot.vpcf", PATTACH_CUSTOMORIGIN, self:GetParent())
    ParticleManager:SetParticleControlEnt(self.x_pfx, 0, self:GetParent(), PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
    ParticleManager:SetParticleControlEnt(self.x_pfx, 1, self:GetParent(), PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
end

function modifier_ability_npc_boss_jungle2_spell1_thinker:Active()
    local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_dragon_knight/dragon_knight_shard_fireball.vpcf", PATTACH_WORLDORIGIN, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( 300, 1, 1 ) )
	self:AddParticle(effect_cast,false,false,-1,false,false)
    self.aura = true
    ParticleManager:DestroyParticle(self.x_pfx, false)
    ParticleManager:ReleaseParticleIndex(self.x_pfx)
end

function modifier_ability_npc_boss_jungle2_spell1_thinker:IsAura()
    return true
end

function modifier_ability_npc_boss_jungle2_spell1_thinker:GetModifierAura()
    return "modifier_ability_npc_boss_jungle2_spell1_thinker_burn"
end

function modifier_ability_npc_boss_jungle2_spell1_thinker:GetAuraRadius()
    return 300
end

function modifier_ability_npc_boss_jungle2_spell1_thinker:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_boss_jungle2_spell1_thinker:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_boss_jungle2_spell1_thinker:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_boss_jungle2_spell1_thinker:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_boss_jungle2_spell1_thinker_burn = class({})
--Classifications template
function modifier_ability_npc_boss_jungle2_spell1_thinker_burn:IsHidden()
    return false
end

function modifier_ability_npc_boss_jungle2_spell1_thinker_burn:IsDebuff()
    return true
end

function modifier_ability_npc_boss_jungle2_spell1_thinker_burn:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle2_spell1_thinker_burn:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_jungle2_spell1_thinker_burn:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_jungle2_spell1_thinker_burn:OnCreated()
    self.damage = self:GetAbility():GetSpecialValueFor("damage") / 2
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.5)
end

function modifier_ability_npc_boss_jungle2_spell1_thinker_burn:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage = self.damage,
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end