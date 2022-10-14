npc_dota_hero_abyssal_underlord_spell3 = class({})

function npc_dota_hero_abyssal_underlord_spell3:OnSpellStart() 
    self.damage = self:GetSpecialValueFor("damage")
    local projectile_direction = self:GetCaster():GetForwardVector()
	projectile_direction = Vector( projectile_direction.x, projectile_direction.y, 0 ):Normalized()

    ProjectileManager:CreateLinearProjectile({
        Source = self:GetCaster(),
        Ability = self,
        vSpawnOrigin = self:GetCaster():GetAbsOrigin(),
        
        bDeleteOnHit = false,
        
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = DOTA_UNIT_TARGET_BASIC,
        
        EffectName = "particles/npc_dota_hero_abyssal_underlord/npc_dota_hero_abyssal_underlord_spell3.vpcf",
        fDistance = self:GetSpecialValueFor("distanse"),
        fStartRadius = self:GetSpecialValueFor("with"),
        fEndRadius = self:GetSpecialValueFor("with"),
        vVelocity = projectile_direction * self:GetSpecialValueFor("distanse"),

        bReplaceExisting = false,
        
        bProvidesVision = false,
        --iVisionRadius = vision_radius,
        --iVisionTeamNumber = caster:GetTeamNumber(),
    })
    EmitSoundOn("Hero_AbyssalUnderlord.Firestorm.Cast", target)
end

function npc_dota_hero_abyssal_underlord_spell3:OnProjectileHitHandle( target, location, proj )
    if target then
        ApplyDamage({victim = target,
        damage = self.damage,
        damage_type = self:GetAbilityDamageType(),
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
        return false
    end
    EmitSoundOn("Hero_AbyssalUnderlord.Firestorm.Target", target)
end
