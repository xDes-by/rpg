LinkLuaModifier( "modifier_catapult","abilities/jungle/jungle_1/catapult", LUA_MODIFIER_MOTION_NONE )

catapult = class({})

function catapult:OnSpellStart()
	local pos = self:GetCursorPosition()
	local npc = CreateModifierThinker(self:GetCaster(), self, "modifier_catapult", {duration = 3}, pos + RandomVector(RandomInt(50, 200)), self:GetCaster():GetTeamNumber(), false)
	ProjectileManager:CreateTrackingProjectile{
		Source = self:GetCaster(),
		Ability = self,	
		
		EffectName = "particles/units/heroes/hero_snapfire/snapfire_lizard_blobs_arced.vpcf",
		iMoveSpeed = 700,
		bDodgeable = false,                           -- Optional
		Target = npc,
		vSourceLoc = self:GetCaster():GetOrigin(),                -- Optional (HOW)
		
		bDrawsOnMinimap = false,                          -- Optional
		bVisibleToEnemies = true,                         -- Optional
		bProvidesVision = true,                           -- Optional
		iVisionRadius = true,                              -- Optional
		iVisionTeamNumber = self:GetCaster():GetTeamNumber(),        -- Optional
	}

	EmitSoundOn(  "Hero_Batrider.Flamebreak", self:GetCaster() )
end

function catapult:OnProjectileHit(hTarget, vLocation)
    hTarget:FindModifierByName("modifier_catapult"):Active()
end

modifier_catapult = class({})

function modifier_catapult:Active()
    local loc = self:GetParent():GetOrigin()
    local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), loc, nil, self:GetAbility():GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false )
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage = self:GetAbility():GetSpecialValueFor("damage"),
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_snapfire/hero_snapfire_ultimate_impact.vpcf", PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 3, loc )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_snapfire/hero_snapfire_ultimate_linger.vpcf", PATTACH_WORLDORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 0, loc )
	ParticleManager:SetParticleControl( effect_cast, 1, loc )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	EmitSoundOnLocationWithCaster( loc, "Hero_Snapfire.MortimerBlob.Impact", self:GetCaster() )
    self.aura = true
end

function modifier_catapult:IsHidden()
	return true
end

function modifier_catapult:IsPurgable()
	return false
end

function modifier_catapult:OnDestroy()
    UTIL_Remove(self:GetParent())
end

