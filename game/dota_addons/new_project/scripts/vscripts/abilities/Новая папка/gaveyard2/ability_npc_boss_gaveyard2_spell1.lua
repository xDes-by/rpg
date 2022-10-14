ability_npc_boss_gaveyard2_spell1 = class({})


function ability_npc_boss_gaveyard2_spell1:OnSpellStart()
	EmitSoundOn( "Hero_Bane.BrainSap", self:GetCaster() )
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetCaster():GetAbsOrigin(), nil, self:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY,DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        local damage = ApplyDamage({victim = unit,
        damage = self:GetSpecialValueFor("damage"),
        damage_type = self:GetAbilityDamageType(),
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
        self:GetCaster():Heal(damage, self)

        local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_bane/bane_sap.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
        ParticleManager:SetParticleControlEnt(effect_cast, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetOrigin(), true)
        ParticleManager:SetParticleControlEnt(effect_cast, 1, unit, PATTACH_POINT_FOLLOW, "attach_hitloc", unit:GetOrigin(), true)
        ParticleManager:ReleaseParticleIndex( effect_cast )
        EmitSoundOn( "Hero_Bane.BrainSap.Target", unit )
    end
end 
