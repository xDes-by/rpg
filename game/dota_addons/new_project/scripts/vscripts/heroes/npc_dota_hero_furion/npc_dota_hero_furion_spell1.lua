LinkLuaModifier( "modifier_npc_dota_hero_furion_spell1","heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell1", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_furion_spell1 = class({})

function npc_dota_hero_furion_spell1:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_furion_spell1"
end

function npc_dota_hero_furion_spell1:OnProjectileHit_ExtraData(hTarget, vLocation)
    ApplyDamage({
		victim = hTarget,
		damage = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * self:GetSpecialValueFor("damage_multiplier")/100,
		damage_type = DAMAGE_TYPE_PHYSICAL,
		damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
		attacker = self:GetCaster()
	})
end

-----------------------------------------------------------------------------------

modifier_npc_dota_hero_furion_spell1 = class({})

function modifier_npc_dota_hero_furion_spell1:IsHidden()
    return true
end

function modifier_npc_dota_hero_furion_spell1:IsPurgable()
    return false
end

function modifier_npc_dota_hero_furion_spell1:DeclareFunctions()
    return {
       MODIFIER_EVENT_ON_ATTACK
    }
end

function modifier_npc_dota_hero_furion_spell1:OnAttack(params)
	if params.attacker ~= self:GetParent() then return end
	self.main_target = params.target
	if self:GetAbility():IsCooldownReady() then
		local enemies = FindUnitsInRadius(params.attacker:GetTeamNumber(), params.attacker:GetAbsOrigin(), nil, self:GetParent():Script_GetAttackRange()+100, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
		for _,enemy in pairs(enemies) do
			if enemy~=self.main_target then
				ProjectileManager:CreateTrackingProjectile({
					Target = enemy,
					Source = params.attacker,  
					Ability = self:GetAbility(),
					EffectName = "particles/units/heroes/hero_furion/furion_base_attack.vpcf",
					iMoveSpeed = 1125,
				})
				self:GetAbility():UseResources(false, false, true)
				break
			end
		end
	end	
end
