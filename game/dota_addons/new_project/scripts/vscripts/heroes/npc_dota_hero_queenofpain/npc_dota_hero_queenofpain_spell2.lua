npc_dota_hero_queenofpain_spell2 = class({})

function npc_dota_hero_queenofpain_spell2:OnSpellStart()
    self:Scream(self:GetCaster())
	EmitSoundOn( "Hero_QueenOfPain.ScreamOfPain", self:GetCaster() )
end

function npc_dota_hero_queenofpain_spell2:Scream(unit)
    if not IsServer() then return end
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, unit:GetAbsOrigin(), nil, self:GetSpecialValueFor("scream_radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)

	for _,enemy in pairs(enemies) do
		ProjectileManager:CreateTrackingProjectile({
		Target = enemy,
		Source = unit,
		Ability = self,	
		EffectName = "particles/units/heroes/hero_queenofpain/queen_scream_of_pain.vpcf",
		iMoveSpeed = 900,
		vSourceLoc= unit:GetAbsOrigin(),
		bDodgeable = false,
		bVisibleToEnemies = true,
		bReplaceExisting = false,
		bProvidesVision = false,
	})
	end
	local effect_cast = ParticleManager:CreateParticle( "particles/qop2.vpcf", PATTACH_ABSORIGIN, unit )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end

function npc_dota_hero_queenofpain_spell2:OnProjectileHit( target, location ) 
	ApplyDamage({victim = target,
    attacker = self:GetCaster(),
    damage = self:GetSpecialValueFor("scream_damage"),
    damage_type = DAMAGE_TYPE_MAGICAL,
    ability = self,})
end