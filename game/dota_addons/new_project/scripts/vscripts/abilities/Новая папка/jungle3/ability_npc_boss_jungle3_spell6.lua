ability_npc_boss_jungle3_spell6 = class({})

function ability_npc_boss_jungle3_spell6:OnOwnerDied()
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_alchemist/alchemist_acid_spray_c.vpcf", PATTACH_POINT, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 0, self:GetCaster():GetOrigin())
    ParticleManager:ReleaseParticleIndex(pfx)
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetCaster():GetAbsOrigin(), nil, 375, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    local damage = self:GetCaster():GetMaxHealth() * self:GetSpecialValueFor("damage") * 0.01
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
    end
end