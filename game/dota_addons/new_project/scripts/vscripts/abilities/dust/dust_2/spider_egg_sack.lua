LinkLuaModifier( "modifier_spider_egg_sack", "abilities/dust/dust_2/spider_egg_sack", LUA_MODIFIER_MOTION_NONE )

spider_egg_sack = class({})

function spider_egg_sack:GetIntrinsicModifierName()
	return "modifier_spider_egg_sack"
end

-------------------------------------------------------------------------

modifier_spider_egg_sack = class({})

function modifier_spider_egg_sack:IsHidden()
	return true
end

function modifier_spider_egg_sack:CheckState()
	local state =
	{
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = false,
		[MODIFIER_STATE_INVULNERABLE] = true,
	}
	return state
end

function modifier_spider_egg_sack:OnCreated( kv )
	if IsServer() then
		self.spiders = self:GetAbility():GetSpecialValueFor( "spiders" )
		self.radius = self:GetAbility():GetSpecialValueFor( "radius" )
		self.damage = self:GetAbility():GetSpecialValueFor( "damage" )
		self.explode = true
		self:StartIntervalThink( 0.25 )
	end
end

function modifier_spider_egg_sack:OnIntervalThink()
	if IsServer() then
		local enemies = FindUnitsInRadius( self:GetParent():GetTeamNumber(), self:GetParent():GetOrigin(), self:GetParent(), self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )
		if #enemies > 0 and self.explode then
			self.explode = false
			self:Burst()
		end
	end
end

function modifier_spider_egg_sack:Burst()
	if IsServer() then
		for i = 0, self.spiders do
			unit = CreateUnitByName( "npc_dust_creep_mini_1", self:GetParent():GetOrigin() + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS )
			Rules:unit_settings(unit, "creep", "mini", 1, 220, 100)
			Rules:SetAbilityLevel(unit)
		end

		local nFXIndex = ParticleManager:CreateParticle( "particles/units/heroes/hero_venomancer/venomancer_poison_nova.vpcf", PATTACH_CUSTOMORIGIN, nil )
		ParticleManager:SetParticleControl( nFXIndex, 0, self:GetParent():GetOrigin() )
		ParticleManager:SetParticleControl( nFXIndex, 1, Vector( self.radius / 2, 0.4, self.radius ) )
		ParticleManager:ReleaseParticleIndex( nFXIndex )

		local enemies = FindUnitsInRadius( self:GetParent():GetTeamNumber(), self:GetParent():GetOrigin(), self:GetParent(), self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )
		for _,enemy in pairs ( enemies ) do
			if enemy ~= nil and enemy:IsInvulnerable() == false and enemy:IsMagicImmune() == false then
				local DamageInfo =
				{
					victim = enemy,
					attacker = self:GetCaster(),
					ability = self,
					damage = self.damage,
					damage_type = DAMAGE_TYPE_MAGICAL,
				}
				ApplyDamage( DamageInfo )
			end
		end
		
		EmitSoundOn( "Hero_Broodmother.SpawnSpiderlings", self:GetParent() )
		EmitSoundOn( "EggSack.Burst", self:GetParent() )
		self:GetParent():AddEffects( EF_NODRAW )
		self:GetParent():ForceKill( false )
	end
end

