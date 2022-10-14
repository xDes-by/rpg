ability_npc_forest1_wave3_pine_cone_seed = class({})

LinkLuaModifier( "modifier_ability_npc_forest1_wave3_pine_cone_seed", "abilities/forest1/ability_npc_forest1_wave3_pine_cone_seed", LUA_MODIFIER_MOTION_NONE )

function ability_npc_forest1_wave3_pine_cone_seed:OnSpellStart()
    self:GetCursorTarget():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_forest1_wave3_pine_cone_seed", {duration = 3.1})
	EmitSoundOn( "Hero_Treant.LeechSeed.Cast", self:GetCaster() )
end

modifier_ability_npc_forest1_wave3_pine_cone_seed = class({})

function modifier_ability_npc_forest1_wave3_pine_cone_seed:IsHidden()
	return false
end

function modifier_ability_npc_forest1_wave3_pine_cone_seed:IsDebuff()
	return true
end

function modifier_ability_npc_forest1_wave3_pine_cone_seed:DestroyOnExpire()
	return true
end

function modifier_ability_npc_forest1_wave3_pine_cone_seed:IsPurgable()
	return true
end

function modifier_ability_npc_forest1_wave3_pine_cone_seed:OnCreated()
    self.Range = self:GetAbility():GetSpecialValueFor("HealRange")
    self.Slow = self:GetAbility():GetSpecialValueFor("Slow")
	self:StartIntervalThink(1)
end

function modifier_ability_npc_forest1_wave3_pine_cone_seed:OnIntervalThink()
	local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, self.Range, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC, 0, 0, false )
    if enemies[1] == nil then return end
    ApplyDamage({ victim = self:GetParent(), attacker = self:GetCaster(), damage = self:GetAbility():GetSpecialValueFor("damage"), damage_type = self:GetAbility():GetAbilityDamageType() })
	for _,enemy in pairs(enemies) do
	ProjectileManager:CreateTrackingProjectile({
				Target 				= enemy,
				Source 				= self:GetParent(),
				Ability 			= self:GetAbility(),
				EffectName 			= "particles/units/heroes/hero_treant/treant_leech_seed_projectile.vpcf",
				iMoveSpeed			= 500,
				vSourceLoc 			= enemy:GetAbsOrigin(),
				bDrawsOnMinimap 	= false,
				bDodgeable 			= false,
				bIsAttack 			= false,
				bVisibleToEnemies 	= true,
				bReplaceExisting 	= false,
				flExpireTime 		= GameRules:GetGameTime() + 20,
				bProvidesVision 	= false,
			})		
	end
	self.damage_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_treant/treant_leech_seed_damage_pulse.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	ParticleManager:ReleaseParticleIndex(self.damage_particle)

	EmitSoundOn( "Hero_Treant.LeechSeed.Tick", self:GetCaster() )
end

function modifier_ability_npc_forest1_wave3_pine_cone_seed:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE 
}
end

function modifier_ability_npc_forest1_wave3_pine_cone_seed:GetModifierMoveSpeedBonus_Percentage()
    return -self.Slow
end

function ability_npc_forest1_wave3_pine_cone_seed:OnProjectileHit(target, location)
    local heal = self:GetSpecialValueFor("HealTick")
	target:Heal(heal , self:GetCaster())
	
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, target, heal, nil)
end