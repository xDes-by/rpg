ability_npc_forest1_wave2_bone = class({})

function ability_npc_forest1_wave2_bone:OnSpellStart()
	ProjectileManager:CreateTrackingProjectile({		
		Source = self:GetCaster(),
		Ability = self,	
        Target = self:GetCursorTarget(),
		EffectName = "particles/econ/items/necrolyte/necrophos_sullen/necro_sullen_pulse_enemy.vpcf",
		iMoveSpeed = 500,
		vSourceLoc= self:GetCaster():GetAbsOrigin(),                -- Optional (HOW)
		bDodgeable = true,                                -- Optional
		bVisibleToEnemies = true,                         -- Optional
		bReplaceExisting = false,                         -- Optional
		bProvidesVision = false,                           -- Optional
    })
	EmitSoundOn( "Hero_Alchemist.UnstableConcoction.Throw", self:GetCaster() )
end

function ability_npc_forest1_wave2_bone:OnProjectileHit(target, location )
    target:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = self:GetSpecialValueFor("stundur")})
end