npc_dota_hero_death_prophet_spell1 = class({})

function npc_dota_hero_death_prophet_spell1:OnSpellStart()
    self.abi = self:GetCaster():FindAbilityByName("npc_dota_hero_death_prophet_spell3")
    local projectile_direction = (self:GetCursorPosition() - self:GetCaster():GetAbsOrigin()):Normalized()
    ProjectileManager:CreateLinearProjectile({
        Source = self:GetCaster(),
        Ability = self,
        vSpawnOrigin = self:GetCaster():GetAbsOrigin(),
        
        bDeleteOnHit = false,
        
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = DOTA_UNIT_TARGET_BASIC,
        
        EffectName = "particles/econ/items/death_prophet/death_prophet_acherontia/death_prophet_acher_swarm.vpcf",
        fDistance = self:GetSpecialValueFor("distance"),
        fStartRadius = self:GetSpecialValueFor("end"),
        fEndRadius = self:GetSpecialValueFor("start"),
        vVelocity = projectile_direction * self:GetSpecialValueFor("distance"),
        })
    local pfx = ParticleManager:CreateParticle("particles/econ/items/death_prophet/death_prophet_acherontia/death_prophet_acher_swarm.vpcf", PATTACH_POINT, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 1, projectile_direction * 800)
end

function npc_dota_hero_death_prophet_spell1:OnProjectileHit(hTarget, vLocation)
    if hTarget then
        self.abi:CreateGhost(hTarget)
        hTarget:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = self:GetSpecialValueFor("duration")})
        ApplyDamage({victim = hTarget,
        damage = self:GetSpecialValueFor("damage"),
        damage_type = self:GetAbilityDamageType(),
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
    end
end