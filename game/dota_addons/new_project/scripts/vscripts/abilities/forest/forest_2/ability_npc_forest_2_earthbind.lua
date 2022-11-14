LinkLuaModifier( "modifier_ability_npc_forest_2_earthbind", "abilities/forest/forest_2/ability_npc_forest_2_earthbind", LUA_MODIFIER_MOTION_NONE )

ability_npc_forest_2_earthbind = class({})

function ability_npc_forest_2_earthbind:OnSpellStart()
	local caster = self:GetCaster()
	
	local enemies = FindUnitsInRadius( caster:GetTeamNumber(), caster:GetOrigin(), nil, 650, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_CLOSEST, false )
	if #enemies > 0 then
		target = enemies[1]
		local projectile_speed = self:GetSpecialValueFor( "net_speed" )
		local projectile_name = "particles/units/heroes/hero_meepo/meepo_earthbind_projectile_fx.vpcf"--"particles/units/heroes/hero_siren/siren_net_projectile.vpcf"
		local info = {
			Target = target,
			Source = caster,
			Ability = self,	
			
			EffectName = projectile_name,
			iMoveSpeed = projectile_speed,
			bDodgeable = true,                           -- Optional
			ExtraData = {
				fake = 0,
			}
		}
		ProjectileManager:CreateTrackingProjectile(info)

		local sound_cast = "Hero_Meepo.Earthbind.Cast"
		EmitSoundOn( sound_cast, caster )
	end
end

function ability_npc_forest_2_earthbind:OnProjectileHit_ExtraData( target, location, data )
	if not target then return end
	if data.fake==1 then return end
	if target:IsMagicImmune() then return end
	if target:TriggerSpellAbsorb( self ) then return end
	local duration = self:GetSpecialValueFor( "duration" )
	target:AddNewModifier( self:GetCaster(), self, "modifier_ability_npc_forest_2_earthbind", { duration = duration } )
	local sound_cast = "Hero_Meepo.Earthbind.Target"
	EmitSoundOn( sound_cast, target )
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------

modifier_ability_npc_forest_2_earthbind = class({})

function modifier_ability_npc_forest_2_earthbind:IsHidden()
	return false
end

function modifier_ability_npc_forest_2_earthbind:IsDebuff()
	return true
end

function modifier_ability_npc_forest_2_earthbind:IsStunDebuff()
	return false
end

function modifier_ability_npc_forest_2_earthbind:IsPurgable()
	return true
end

function modifier_ability_npc_forest_2_earthbind:GetPriority()
	return MODIFIER_PRIORITY_HIGH
end

function modifier_ability_npc_forest_2_earthbind:CheckState()
	local state = {
		[MODIFIER_STATE_INVISIBLE] = false,
		[MODIFIER_STATE_ROOTED] = true,
	}
	return state
end

function modifier_ability_npc_forest_2_earthbind:GetEffectName()
	return "particles/units/heroes/hero_meepo/meepo_earthbind.vpcf"
end

function modifier_ability_npc_forest_2_earthbind:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end