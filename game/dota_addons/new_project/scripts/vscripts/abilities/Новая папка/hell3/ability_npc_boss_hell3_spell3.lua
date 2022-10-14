ability_npc_boss_hell3_spell3 = class({})

function ability_npc_boss_hell3_spell3:OnSpellStart()
    local duration = self:GetSpecialValueFor("duration")
    ProjectileManager:CreateTrackingProjectile({		
        Source = self:GetCaster(),
		Ability = self,	
        Target = self:GetCursorTarget(),
		EffectName = "particles/econ/world/towers/dire_tower_2021/dire_tower_2021_attack.vpcf",
		iMoveSpeed = 500,
		vSourceLoc= self:GetCaster():GetAbsOrigin(),                -- Optional (HOW)
		bDodgeable = true,                                -- Optional
		bVisibleToEnemies = true,                         -- Optional
		bReplaceExisting = false,                         -- Optional
		bProvidesVision = false,                           -- Optional
        ExtraData = {duration = duration}
    })
end

function ability_npc_boss_hell3_spell3:OnProjectileHit_ExtraData(hTarget, vLocation, table)
    hTarget:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = table.duration})
end
