ability_npc_boss_cave3_spell2 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_cave3_spell2","abilities/cave3/ability_npc_boss_cave3_spell2", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_cave3_spell2:OnSpellStart()
    local unit = CreateUnitByName("npc_boss_cave3_spell2_spirit", self:GetCursorPosition(), true, nil, nil, DOTA_TEAM_BADGUYS )
    unit:SetAbsOrigin(self:GetCursorPosition() + Vector(0,0,100))
    unit:StartGesture(ACT_DOTA_IDLE)
    unit:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_cave3_spell2", {duration = 6})
end

modifier_ability_npc_boss_cave3_spell2 = class({})
--Classifications template
function modifier_ability_npc_boss_cave3_spell2:IsHidden()
    return true
end

function modifier_ability_npc_boss_cave3_spell2:IsPurgable()
    return false
end

function modifier_ability_npc_boss_cave3_spell2:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_cave3_spell2:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(2)
end

function modifier_ability_npc_boss_cave3_spell2:OnDestroy()
    UTIL_Remove(self:GetParent())
end

function modifier_ability_npc_boss_cave3_spell2:OnIntervalThink()
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 400, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
    local projectile_direction
    if #enemies > 0 then
        projectile_direction = (enemies[1]:GetAbsOrigin() - self:GetParent():GetAbsOrigin()):Normalized()
        projectile_direction.z = 0
    else
        projectile_direction = RandomVector(1)
        projectile_direction.z = 0
    end
    ProjectileManager:CreateLinearProjectile({
        Source = self:GetCaster(),
        Ability = self:GetAbility(),
        vSpawnOrigin = self:GetParent():GetAbsOrigin(),
        
        bDeleteOnHit = false,
        
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        
        EffectName = "particles/units/heroes/hero_dragon_knight/dragon_knight_breathe_fire.vpcf",
        fDistance = 400,
        fStartRadius = 150,
        fEndRadius = 250,
        vVelocity = projectile_direction * 1100,

        bReplaceExisting = false,
        
        bProvidesVision = false,
        --iVisionRadius = vision_radius,
        --iVisionTeamNumber = caster:GetTeamNumber(),
    })
end
