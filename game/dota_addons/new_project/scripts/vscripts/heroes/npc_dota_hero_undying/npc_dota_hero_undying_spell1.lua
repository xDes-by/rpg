LinkLuaModifier( "modifier_npc_dota_hero_undying_spell1_slow", "heroes/npc_dota_hero_undying/npc_dota_hero_undying_spell1", LUA_MODIFIER_MOTION_NONE)

npc_dota_hero_undying_spell1 = class({})

function npc_dota_hero_undying_spell1:OnSpellStart()
	EmitSoundOn('high_five.impact', self:GetCaster())
    local point = self:GetCaster():GetAbsOrigin()
    local radius = self:GetSpecialValueFor("radius")
    local knockback = self:GetSpecialValueFor("knockback")
    local damage = self:GetSpecialValueFor("damage")
    local slow_duration = self:GetSpecialValueFor("slow_duration")
	local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), point, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
	for _,unit in pairs(enemies) do
		local direction = (unit:GetOrigin() - point):Normalized()
		unit:AddNewModifier(self:GetCaster(), self, "modifier_knockback", {
					center_x			= self:GetCaster():GetAbsOrigin()[1] + 1,
					center_y			= self:GetCaster():GetAbsOrigin()[2] + 1,
					center_z			= self:GetCaster():GetAbsOrigin()[3],
					duration			= 0.2,
					knockback_duration	= 0.2,
					knockback_distance	= knockback,
					knockback_height	= 20,
					should_stun			= 0
				})
		ApplyDamage({victim = unit, attacker = self:GetCaster(), damage = damage, damage_type = DAMAGE_TYPE_MAGICAL})		
		unit:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_undying_spell1_slow", {duration = slow_duration})
	end
	
	self:PlayEffects()
end

function npc_dota_hero_undying_spell1:PlayEffects()
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_earthshaker/earthshaker_aftershock.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( 300, 300, 300 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end
--------------------------------------------------------------------------------------

modifier_npc_dota_hero_undying_spell1_slow = class({})

function modifier_npc_dota_hero_undying_spell1_slow:IsHidden()
    return false
end

function modifier_npc_dota_hero_undying_spell1_slow:IsDebuff()
    return true
end

function modifier_npc_dota_hero_undying_spell1_slow:IsPurgable()
    return true
end

function modifier_npc_dota_hero_undying_spell1_slow:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_undying_spell1_slow:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_undying_spell1_slow:OnCreated()
    self.slow = -self:GetAbility():GetSpecialValueFor("slow")
end

function modifier_npc_dota_hero_undying_spell1_slow:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
    }
end

function modifier_npc_dota_hero_undying_spell1_slow:GetModifierMoveSpeedBonus_Percentage()
    return self.slow
end