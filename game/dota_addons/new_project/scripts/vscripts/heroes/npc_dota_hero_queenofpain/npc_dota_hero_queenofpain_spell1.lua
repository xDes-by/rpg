npc_dota_hero_queenofpain_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_queenofpain_spell1", "heroes/npc_dota_hero_queenofpain/npc_dota_hero_queenofpain_spell1", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_queenofpain_spell1:OnSpellStart()
	EmitSoundOn( "Hero_QueenOfPain.ShadowStrike", self:GetCaster() )
    ProjectileManager:CreateTrackingProjectile({
		Target = self:GetCursorTarget(),
		Source = self:GetCaster(),
		Ability = self,	
		EffectName = "particles/units/heroes/hero_queenofpain/queen_shadow_strike.vpcf",
		iMoveSpeed = self:GetSpecialValueFor( "projectile_speed" ),
		bReplaceExisting = false,                         -- Optional
		bProvidesVision = false,                           -- Optional
	})
end

function npc_dota_hero_queenofpain_spell1:OnProjectileHit( target, location )
	if target==nil or target:IsInvulnerable() or target:TriggerSpellAbsorb( self ) then
		return
	end
    target:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_queenofpain_spell1", {duration = 3})
end

modifier_npc_dota_hero_queenofpain_spell1 = class({})
--Classifications template
function modifier_npc_dota_hero_queenofpain_spell1:IsHidden()
   return false
end

function modifier_npc_dota_hero_queenofpain_spell1:IsDebuff()
   return true
end

function modifier_npc_dota_hero_queenofpain_spell1:IsPurgable()
   return true
end

function modifier_npc_dota_hero_queenofpain_spell1:RemoveOnDeath()
   return true
end

function modifier_npc_dota_hero_queenofpain_spell1:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_queenofpain_spell1:OnCreated()
    self:StartIntervalThink(1)
    self.abi = self:GetCaster():FindAbilityByName("npc_dota_hero_queenofpain_spell2")
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_queenofpain/queen_shadow_strike_debuff.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControlEnt(effect_cast, 0, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
	self:AddParticle(effect_cast, false, false, -1, false, false)
end

function modifier_npc_dota_hero_queenofpain_spell1:OnIntervalThink()
    self.abi:Scream(self:GetParent())
end
