ability_npc_forest_2_clap = class({})

function ability_npc_forest_2_clap:OnSpellStart()
    local point = self:GetCaster():GetForwardVector() * 150 + self:GetCaster():GetAbsOrigin()
    local dmg = self:GetSpecialValueFor("damage")
	local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, point, nil, 300, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0, false )
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage = dmg,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
    end
	
	
	EmitSoundOn( "n_creep_Ursa.Clap", self:GetCaster() )
    local pfx = ParticleManager:CreateParticle("particles/neutral_fx/ursa_thunderclap.vpcf", PATTACH_POINT, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 0, point)
    ParticleManager:SetParticleControl(pfx, 1, Vector(300, 0, 0))
    ParticleManager:ReleaseParticleIndex(pfx)
end