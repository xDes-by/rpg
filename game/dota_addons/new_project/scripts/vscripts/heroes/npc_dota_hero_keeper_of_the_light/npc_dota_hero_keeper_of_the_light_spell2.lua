npc_dota_hero_keeper_of_the_light_spell2 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_keeper_of_the_light_spell2", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell2", LUA_MODIFIER_MOTION_NONE )


function npc_dota_hero_keeper_of_the_light_spell2:OnSpellStart()
    self:GetCaster():EmitSound("Hero_Treant.Overgrowth.Cast")
	self:GetCaster():EmitSound("Hero_Treant.Overgrowth.CastAnim")
    local cast_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_treant/treant_overgrowth_cast.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster())
	ParticleManager:ReleaseParticleIndex(cast_particle)
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetCaster():GetAbsOrigin(), nil, self:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
	for _,unit in pairs(enemies) do
		unit:Stop()
		unit:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_keeper_of_the_light_spell2", {duration = self:GetSpecialValueFor("duration")})
	end
end

modifier_npc_dota_hero_keeper_of_the_light_spell2 = class({})

function modifier_npc_dota_hero_keeper_of_the_light_spell2:IsHidden()
    return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell2:IsPurgable()
    return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell2:IsDebuff()
    return true
end

function modifier_npc_dota_hero_keeper_of_the_light_spell2:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_keeper_of_the_light_spell2:GetEffectName()
	return "particles/units/heroes/hero_treant/treant_overgrowth_vines.vpcf"
end

function modifier_npc_dota_hero_keeper_of_the_light_spell2:OnCreated()
	if not self:GetAbility() then self:Destroy() return end
	self.damage	= self:GetAbility():GetSpecialValueFor("damage") / 2
	if not IsServer() then return end
	self.damage_type	= self:GetAbility():GetAbilityDamageType()
	self:StartIntervalThink(0.5)
	EmitSoundOn("Hero_Treant.Overgrowth.Target", self:GetParent())
end

function modifier_npc_dota_hero_keeper_of_the_light_spell2:OnIntervalThink()
	ApplyDamage({
		victim 			= self:GetParent(),
		damage 			= self.damage,
		damage_type		= self.damage_type,
		damage_flags 	= DOTA_DAMAGE_FLAG_NONE,
		attacker 		= self:GetCaster(),
		ability 		= self:GetAbility()
	})
end

function modifier_npc_dota_hero_keeper_of_the_light_spell2:CheckState()
	return 
    {
		[MODIFIER_STATE_ROOTED] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_INVISIBLE] = false
	}
end