ability_npc_boss_dust_2_spell_5 = class({})

function ability_npc_boss_dust_2_spell_5:OnSpellStart()
self:GetCaster():EmitSound("Hero_Broodmother.InsatiableHunger")
    local wave_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_terrorblade/terrorblade_scepter.vpcf", PATTACH_WORLDORIGIN, self:GetCaster())
    ParticleManager:SetParticleControl(wave_particle, 0, self:GetCaster():GetAbsOrigin())
    ParticleManager:SetParticleControl(wave_particle, 1, Vector(500, 500, 500))
    ParticleManager:SetParticleControl(wave_particle, 2, Vector(500, 500, 500))
    ParticleManager:SetParticleControl(wave_particle, 15, Vector(115, 188, 42))
    ParticleManager:SetParticleControl(wave_particle, 16, Vector(115, 188, 42))
    ParticleManager:ReleaseParticleIndex(wave_particle)
    local pulse = self:GetCaster():AddNewModifier(
        self:GetCaster(), -- player source
        self, -- ability source
        "modifier_generic_ring_lua", -- modifier name
        {
            end_radius = 500,
            speed = 500,
            target_team = DOTA_UNIT_TARGET_TEAM_ENEMY,
            target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        } -- kv
    )
    pulse:SetCallback( function( enemy )
        enemy:Fear( self:GetCaster(), 3)
    end)

    pulse:SetEndCallback( function()
        --ParticleManager:SetParticleControl( effect, 1, Vector( speed, radius, -1 ) )
        --ParticleManager:DestroyParticle( effect, false )
        --ParticleManager:ReleaseParticleIndex( effect )
    end)    
end