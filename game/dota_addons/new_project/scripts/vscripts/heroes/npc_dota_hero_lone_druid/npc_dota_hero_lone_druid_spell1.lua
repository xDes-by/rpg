npc_dota_hero_lone_druid_spell1 = class({})

function npc_dota_hero_lone_druid_spell1:OnSpellStart()
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetCaster():GetAbsOrigin(), nil, self:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
    local dur = self:GetSpecialValueFor("duration")
    for _,unit in pairs(enemies) do
        unit:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = dur})
        ApplyDamage({victim = unit,
        damage = self:GetSpecialValueFor("damage"),
        damage_type = self:GetAbilityDamageType(),
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
    end
    local pfx = ParticleManager:CreateParticle("particles/econ/items/brewmaster/brewmaster_offhand_elixir/brewmaster_thunder_clap_elixir.vpcf", PATTACH_POINT, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 1, Vector(0, 0, 0))
    EmitSoundOn("Hero_Brewmaster.ThunderClap", self:GetCaster())
end