npc_dota_hero_nevermore_spell2 = class({})

function npc_dota_hero_nevermore_spell2:CastFilterResultLocation()
    if IsClient() then
        return
    end
    self.mod = self:GetCaster():FindModifierByName("modifier_npc_dota_hero_nevermore_spell4")
    if self.mod:GetStackCount() == 0 then
        return UF_FAIL_CUSTOM
    end
    return UF_SUCCESS
end

function npc_dota_hero_nevermore_spell2:GetCustomCastErrorLocation()
    return "#npc_dota_hero_nevermore_spell2_not_have_souls"
end

function npc_dota_hero_nevermore_spell2:OnSpellStart()
	local projectile_direction = self:GetCursorPosition() - self:GetCaster():GetAbsOrigin()
	projectile_direction = Vector( projectile_direction.x, projectile_direction.y, 0 ):Normalized()
    self.damage = self:GetSpecialValueFor("damage_multiplier") * self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * 0.01
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
        --iVisionRadius = vision_radius,
        --iVisionTeamNumber = caster:GetTeamNumber(),
    })    
    EmitSoundOn("Hero_Nevermore.ROS.Arcana", self:GetCaster())
    local par = ParticleManager:CreateParticle("particles/units/heroes/hero_nevermore/nevermore_wings_soul_channel.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    ParticleManager:ReleaseParticleIndex(par)
    self.mod:DecrementStackCount()
end

function npc_dota_hero_nevermore_spell2:OnProjectileHitHandle( target, location, proj )
    if target then
        ApplyDamage({victim = target,
        damage = self.damage,
        damage_type = self:GetAbilityDamageType(),
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
        return false
    end
    EmitSoundOn("Hero_Nevermore.RequiemOfSouls.Damage", target)
end