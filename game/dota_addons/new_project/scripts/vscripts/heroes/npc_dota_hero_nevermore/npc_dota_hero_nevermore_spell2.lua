npc_dota_hero_nevermore_spell2 = class({})

function npc_dota_hero_nevermore_spell2:OnSpellStart()
	local damage = self:GetAbility():GetSpecialValueFor("damage") * self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * 0.01 
    local damage_per_soul = self:GetSpecialValueFor("damage_per_soul")
	local soul_cost = self:GetSpecialValueFor("soul_cost")
	local soul_modifier = self:GetCaster():FindModifierByName("modifier_npc_dota_hero_nevermore_spell3")
	
	self.damage = damage
	
	if soul_modifier then
		souls = soul_modifier:GetStackCount()
		if souls < soul_cost then
			soul_modifier:SetStackCount(0)
			self.damage = damage + damage_per_soul * souls
		else
			soul_modifier:SetStackCount(souls - soul_cost)
			self.damage = damage + damage_per_soul * soul_cost
		end
	end
	
	local projectile_direction = self:GetCursorPosition() - self:GetCaster():GetAbsOrigin()
	projectile_direction = Vector( projectile_direction.x, projectile_direction.y, 0 ):Normalized()
	
    ProjectileManager:CreateLinearProjectile({
        Source = self:GetCaster(),
        Ability = self,
        vSpawnOrigin = self:GetCaster():GetAbsOrigin(),
        
        bDeleteOnHit = false,
        
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        
        EffectName = "particles/npc_dota_hero_nevermore/npc_dota_hero_nevermore_spell2.vpcf",
        fDistance = self:GetSpecialValueFor("soul_distanse"),
        fStartRadius = self:GetSpecialValueFor("with"),
        fEndRadius = self:GetSpecialValueFor("with"),
        vVelocity = projectile_direction * self:GetSpecialValueFor("soul_distanse"),
        bReplaceExisting = false,
        bProvidesVision = false,
    })    
    EmitSoundOn("Hero_Nevermore.ROS.Arcana", self:GetCaster())
    local par = ParticleManager:CreateParticle("particles/units/heroes/hero_nevermore/nevermore_wings_soul_channel.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    ParticleManager:ReleaseParticleIndex(par)
end

function npc_dota_hero_nevermore_spell2:OnProjectileHitHandle( target, location, proj )
    if target then
        ApplyDamage({victim = target,
        damage = self.damage,
        damage_type = self:GetAbilityDamageType(),
        attacker = self:GetCaster()})
        return false
    end
    EmitSoundOn("Hero_Nevermore.RequiemOfSouls.Damage", target)
end