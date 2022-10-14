ability_npc_boss_hell1_spell2 = class({})

function ability_npc_boss_hell1_spell2:OnSpellStart()
    self.damage = self:GetSpecialValueFor("damage")
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetCaster():GetAbsOrigin(), nil, 600, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
    for num,unit in pairs(enemies) do
        if num > 3 then 
            return 
        end
        ProjectileManager:CreateTrackingProjectile({		
        Source = self:GetCaster(),
		Ability = self,	
        Target = unit,
		EffectName = "particles/units/heroes/hero_winter_wyvern/wyvern_splinter_blast.vpcf",
		iMoveSpeed = 500,
		vSourceLoc= self:GetCaster():GetAbsOrigin(),                -- Optional (HOW)
		bDodgeable = true,                                -- Optional
		bVisibleToEnemies = true,                         -- Optional
        ExtraData = {type = "first"}
        })
    end
end

function ability_npc_boss_hell1_spell2:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
    if ExtraData.type == "first" then
        ProjectileManager:CreateTrackingProjectile({		
        Source = self:GetCaster(),
		Ability = self,	
        Target = unit,
		EffectName = "particles/units/heroes/hero_winter_wyvern/wyvern_splinter_blast.vpcf",
		iMoveSpeed = 500,
		vSourceLoc= self:GetCaster():GetAbsOrigin(),                -- Optional (HOW)
		bDodgeable = true,                                -- Optional
		bVisibleToEnemies = true,                         -- Optional
        ExtraData = {type = "second"}
        })
    else
        ApplyDamage({victim = hTarget,
        damage = self.damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
    end
end