ability_npc_boss_jungle1_spell6 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle1_spell6","abilities/jungle1/ability_npc_boss_jungle1_spell6", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle1_spell6:OnSpellStart()
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_tidehunter/tidehunter_spell_ravage.vpcf", PATTACH_WORLDORIGIN, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 0, self:GetCaster():GetAbsOrigin())
    ParticleManager:SetParticleControl(pfx, 1, Vector(100, 0, 0))
    ParticleManager:SetParticleControl(pfx, 2, Vector(200, 0, 0))
    ParticleManager:SetParticleControl(pfx, 3, Vector(300, 0, 0))
    ParticleManager:SetParticleControl(pfx, 4, Vector(400, 0, 0))
    ParticleManager:SetParticleControl(pfx, 5, Vector(500, 0, 0))
    ParticleManager:ReleaseParticleIndex(pfx)
    local pulse = self:GetCaster():AddNewModifier( self:GetCaster(), self, "modifier_generic_ring_lua", { 
    end_radius = 500, speed = 500, target_team = DOTA_UNIT_TARGET_TEAM_ENEMY, target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC})
    pulse:SetCallback( function( enemy )
        enemy:AddNewModifier(self:GetCaster(),self,"modifier_generic_arc_lua", {
        height = 500, duration = 0.8, isStun = true, activity = ACT_DOTA_FLAIL})
        enemy:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_jungle1_spell6", {duration = 3})
    end)
end

modifier_ability_npc_boss_jungle1_spell6 = class({})
--Classifications template
function modifier_ability_npc_boss_jungle1_spell6:IsHidden()
    return false
end

function modifier_ability_npc_boss_jungle1_spell6:IsDebuff()
    return true
end

function modifier_ability_npc_boss_jungle1_spell6:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle1_spell6:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_jungle1_spell6:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_jungle1_spell6:OnDestroy()
    if IsClient() then
        return
    end
    local damage = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * self:GetAbility():GetSpecialValueFor("mult") / 100
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_tidehunter/tidehunter_anchor_hero.vpcf", PATTACH_POINT, self:GetParent())
    ParticleManager:ReleaseParticleIndex(pfx)
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 375, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage = damage,
        damage_type = DAMAGE_TYPE_PHYSICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
end

