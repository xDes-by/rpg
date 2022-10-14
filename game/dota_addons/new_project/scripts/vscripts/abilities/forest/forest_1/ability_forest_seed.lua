LinkLuaModifier( "modifier_ability_forest_seed", "abilities/forest/forest_1/ability_forest_seed", LUA_MODIFIER_MOTION_NONE )

ability_forest_seed = class({})

function ability_forest_seed:OnSpellStart()
	self:GetCaster():EmitSound("Hero_Treant.LeechSeed.Cast")
	
	local seed_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_treant/treant_leech_seed.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster())
	ParticleManager:SetParticleControl(seed_particle, 1, self:GetCaster():GetAttachmentOrigin(self:GetCaster():ScriptLookupAttachment("attach_attack1")))
	
	local target = self:GetCursorTarget()
		
	target:EmitSound("Hero_Treant.LeechSeed.Target")
	ParticleManager:SetParticleControlEnt(seed_particle, 0, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetAbsOrigin(), true)

	target:AddNewModifier(self:GetCaster(), self, "modifier_ability_forest_seed", {duration = self:GetSpecialValueFor("duration") - FrameTime()})
	
	ParticleManager:ReleaseParticleIndex(seed_particle)
end

function ability_forest_seed:OnProjectileHit_ExtraData(target, location, ExtraData)
	target:Heal(self:GetTalentSpecialValueFor("damage") * self:GetSpecialValueFor("interval"), self:GetCaster())
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, target, self:GetTalentSpecialValueFor("damage") * self:GetSpecialValueFor("interval"), nil)
end

------------------------------------------------------------------------------------------------------------------------------------------

modifier_ability_forest_seed = class({})

function modifier_ability_forest_seed:OnCreated()
	if not self:GetAbility() then self:Destroy() return end
	
	self.damage_interval	= self:GetAbility():GetSpecialValueFor("interval")
	self.leech_damage		= self:GetAbility():GetTalentSpecialValueFor("damage")
	self.remnants_radius	= self:GetAbility():GetSpecialValueFor("radius")
	self.projectile_speed	= 400
	
	if not IsServer() then return end
	
	self.damage_type		= self:GetAbility():GetAbilityDamageType()
	
	self:OnIntervalThink()
	self:StartIntervalThink(self.damage_interval)
end

function modifier_ability_forest_seed:OnIntervalThink()
	self:GetParent():EmitSound("Hero_Treant.LeechSeed.Tick")

	self.damage_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_treant/treant_leech_seed_damage_pulse.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	ParticleManager:ReleaseParticleIndex(self.damage_particle)
	self.damage_particle = nil
	
	ApplyDamage({
		victim 			= self:GetParent(),
		damage 			= self.leech_damage * self.damage_interval,
		damage_type		= self.damage_type,
		damage_flags 	= DOTA_DAMAGE_FLAG_NONE,
		attacker 		= self:GetCaster(),
		ability 		= self:GetAbility()
	})
	
	for _, unit in pairs(FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self:GetParent():GetAbsOrigin(), nil, self.remnants_radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)) do
		ProjectileManager:CreateTrackingProjectile({
			EffectName			= "particles/units/heroes/hero_treant/treant_leech_seed_projectile.vpcf",
			Ability				= self:GetAbility(),
			Source				= unit,
			vSourceLoc			= unit:GetAbsOrigin(),
			Target				= self:GetCaster(),
			iMoveSpeed			= self.projectile_speed,
			flExpireTime		= nil,
			bDodgeable			= false,
			bIsAttack			= false,
			bReplaceExisting	= false,
			iSourceAttachment	= nil,
			bDrawsOnMinimap		= nil,
			bVisibleToEnemies	= true,
			bProvidesVision		= false,
			iVisionRadius		= nil,
			iVisionTeamNumber	= nil,
			ExtraData			= {}
		})
	end
end
