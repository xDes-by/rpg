ability_npc_jungle2_ghost_alt = class({})

LinkLuaModifier( "modifier_ability_npc_jungle2_ghost_alt","abilities/jungle2/ability_npc_jungle2_ghost_alt", LUA_MODIFIER_MOTION_NONE )

function ability_npc_jungle2_ghost_alt:GetIntrinsicModifierName()
    return "modifier_ability_npc_jungle2_ghost_alt"
end

modifier_ability_npc_jungle2_ghost_alt = class({})

--Classifications template
function modifier_ability_npc_jungle2_ghost_alt:IsHidden()
   return true
end

function modifier_ability_npc_jungle2_ghost_alt:IsPurgable()
   return false
end

function modifier_ability_npc_jungle2_ghost_alt:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(7)
end

function modifier_ability_npc_jungle2_ghost_alt:OnIntervalThink()
	local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 600, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false )
    for _,unit in ipairs(enemies) do
        ProjectileManager:CreateTrackingProjectile({		
            Source = self:GetCaster(),
            Ability = self:GetAbility(),	
            Target = unit,
            EffectName = "particles/units/heroes/hero_queenofpain/queen_scream_of_pain.vpcf",
            iMoveSpeed = 500,
            vSourceLoc= self:GetCaster():GetAbsOrigin(),                -- Optional (HOW)
            bDodgeable = true,                                -- Optional
            bVisibleToEnemies = true,                         -- Optional
            bReplaceExisting = false,                         -- Optional
            bProvidesVision = false,                           -- Optional
        })
    end
end

function ability_npc_jungle2_ghost_alt:OnProjectileHit(target, location)
    target:Fear(self:GetCaster(), 1)
end
