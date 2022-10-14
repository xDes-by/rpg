ability_npc_cave1_mine = class({})

function ability_npc_cave1_mine:OnSpellStart()
	ProjectileManager:CreateTrackingProjectile({		
        Source = self:GetCaster(),
		Ability = self,	
        Target = self:GetCursorTarget(),
		EffectName = "particles/econ/events/ti9/rock_golem_tower/radiant_tower_attack.vpcf",
		iMoveSpeed = 500,
		vSourceLoc= self:GetCaster():GetAbsOrigin(),                -- Optional (HOW)
		bDodgeable = true,                                -- Optional
		bVisibleToEnemies = true,                         -- Optional
		bReplaceExisting = false,                         -- Optional
		bProvidesVision = false,                           -- Optional
    })
	EmitSoundOn( "Hero_Alchemist.UnstableConcoction.Throw", self:GetCaster() )
end

function ability_npc_cave1_mine:OnProjectileHit(target, location )
    target:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = 0.1})
end