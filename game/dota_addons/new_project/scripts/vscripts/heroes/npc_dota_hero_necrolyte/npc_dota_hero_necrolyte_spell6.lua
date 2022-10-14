npc_dota_hero_necrolyte_spell6 = class({})

function npc_dota_hero_necrolyte_spell6:OnSpellStart()
    local cpos = self:GetCursorPosition()
    local projectile_direction = (cpos - self:GetCaster():GetAbsOrigin()):Normalized()
    local pfx = ParticleManager:CreateParticle("particles/econ/items/necrolyte/necronub_scythe/necrolyte_scythe_ka_model.vpcf", PATTACH_POINT, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 0, projectile_direction)
    ParticleManager:SetParticleControl(pfx, 1, cpos)
    ParticleManager:ReleaseParticleIndex(pfx)
    Timers:CreateTimer(1,function()
    ProjectileManager:CreateLinearProjectile({
        Source = self:GetCaster(),
        Ability = self,
        vSpawnOrigin = cpos,
        
        bDeleteOnHit = false,
        
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = DOTA_UNIT_TARGET_BASIC,
        
        --EffectName = "particles/units/heroes/hero_death_prophet/death_prophet_carrion_swarm.vpcf",
        fDistance = self:GetSpecialValueFor("distance"),
        fStartRadius = self:GetSpecialValueFor("end"),
        fEndRadius = self:GetSpecialValueFor("start"),
        vVelocity = projectile_direction * self:GetSpecialValueFor("distance"),
        })
        self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_death_prophet/death_prophet_carrion_swarm.vpcf", PATTACH_CUSTOMORIGIN, nil)
        ParticleManager:SetParticleControl(self.pfx, 0, cpos)
        ParticleManager:SetParticleControlForward(self.pfx, 1, projectile_direction)
        ParticleManager:SetParticleControl(self.pfx, 2, Vector(150, 0, 150))
        ParticleManager:SetParticleControl(self.pfx, 3, Vector(800,0,0))
        ParticleManager:SetParticleControl(self.pfx, 5, Vector(300,0,0))
    end)

end