npc_dota_hero_hoodwink_spell6 = class({})

function npc_dota_hero_hoodwink_spell6:OnSpellStart()
	self.target = self:GetCursorTarget()
	self:PlayEffects()
end

function npc_dota_hero_hoodwink_spell6:PlayEffects()
	self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_hoodwink/hoodwink_sharpshooter.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControlEnt( self.effect_cast, 1, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetOrigin(), true )
	EmitSoundOn( "Hero_Hoodwink.Sharpshooter.Channel", self:GetCaster())
end

function npc_dota_hero_hoodwink_spell6:OnChannelFinish( bInterrupted )
	local channel_pct = (GameRules:GetGameTime() - self:GetChannelStartTime())/self:GetChannelTime()
	local damage = self:GetSpecialValueFor( "damage" )
	
	local projectile_name = "particles/hoodwink/hoodwink_shot.vpcf"--"particles/units/heroes/hero_hoodwink/hoodwink_sharpshooter_projectile.vpcf"

	local info = {
		Target = self.target,
		Source = self:GetCaster(),
		Ability = self,	
		EffectName = projectile_name,
		iMoveSpeed = 2000,
		
		ExtraData = { damage =  damage * channel_pct }
	}
	local projectile = ProjectileManager:CreateTrackingProjectile(info)
	
	if self.effect_cast then
		ParticleManager:DestroyParticle(self.effect_cast, false)
		ParticleManager:ReleaseParticleIndex(self.effect_cast)
		StopSoundOn( "Hero_Hoodwink.Sharpshooter.Channel", self:GetCaster())
		EmitSoundOn( "Hero_Hoodwink.Sharpshooter.Cast", self:GetCaster() )
	end
end

function npc_dota_hero_hoodwink_spell6:OnProjectileHit_ExtraData( target, location, extradata )
	if (not target) or target:IsInvulnerable() or target:IsOutOfGame() or target:TriggerSpellAbsorb( self ) then
		return
	end
	
	local armor = target:GetPhysicalArmorValue(false)
	local factor = 1 - ((0.06 * armor) / (1 + 0.06 * math.abs(armor)))
	local dmg = extradata.damage * factor

	local damageTable = {
		victim = target,
		attacker = self:GetCaster(),
		damage = extradata.damage,
		damage_type = DAMAGE_TYPE_PHYSICAL,
	}
	ApplyDamage(damageTable)

	if dmg > target:GetHealth() then
		local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), target:GetAbsOrigin(), nil, self:GetSpecialValueFor( "radius" ), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_CLOSEST, false)
		for _, enemy in pairs(enemies) do
			local damageTable = {
				victim = enemy,
				attacker = self:GetCaster(),
				damage = extradata.damage,
				damage_type = DAMAGE_TYPE_PHYSICAL,
			}
			ApplyDamage(damageTable)
		end
	end
end