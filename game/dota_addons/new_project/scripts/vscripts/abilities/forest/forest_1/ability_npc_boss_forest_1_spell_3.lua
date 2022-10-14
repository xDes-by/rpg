ability_npc_boss_forest_1_spell_3 = class({})

function ability_npc_boss_forest_1_spell_3:OnSpellStart()
    local pfx = ParticleManager:CreateParticle("ability_npc_boss_forest_1_spell_3", PATTACH_POINT, self:GetCaster())
    ParticleManager:ReleaseParticleIndex(pfx)
    local dur = self:GetSpecialValueFor("duration")
    local dmg = self:GetSpecialValueFor("damage")
    local point = self:GetCaster():GetAbsOrigin() - self:GetCaster():GetForwardVector() * 150
    local pfx = ParticleManager:CreateParticle("particles/econ/items/faceless_void/faceless_void_bracers_of_aeons/fv_bracers_of_aeons_timedialate_flash.vpcf", PATTACH_POINT, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 0, point)
    ParticleManager:ReleaseParticleIndex(pfx)
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, point, nil, 700, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        unit:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = dur})
        ApplyDamage({victim = unit,
        damage = dmg,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
    end
end
