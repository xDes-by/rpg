ability_npc_hell2_colume_cold = class({})

LinkLuaModifier( "modifier_ability_npc_hell2_colume_cold", "abilities/hell2/ability_npc_hell2_colume_cold", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell2_colume_cold_slow", "abilities/hell2/ability_npc_hell2_colume_cold", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell2_colume_cold:Spawn()
	if IsClient() then
		return
	end
	Timers:CreateTimer(1,function()
		if self:GetCaster():IsAlive() then
			local hero = AICore:RandomEnemyHeroInRange(self:GetCaster(), 900)
			if hero ~= nil then
				local caster = self:GetCaster()
				local point = hero:GetAbsOrigin()
				CreateModifierThinker(
					caster, -- player source
					self, -- ability source
					"modifier_ability_npc_hell2_colume_cold", -- modifier name
					{duration = 10}, -- kv
					point,
					self:GetCaster():GetTeamNumber(),
					false
				)
				return 3
			else
				return 1
			end
		end
	end)
end

modifier_ability_npc_hell2_colume_cold = class({})
--Classifications template
function modifier_ability_npc_hell2_colume_cold:IsHidden()
   return true
end

function modifier_ability_npc_hell2_colume_cold:OnCreated(kv)
    local vortex_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_ancient_apparition/ancient_ice_vortex.vpcf", PATTACH_WORLDORIGIN, self:GetParent())
	ParticleManager:SetParticleControl(vortex_particle, 0, self:GetParent():GetAbsOrigin())
	ParticleManager:SetParticleControl(vortex_particle, 5, Vector(250, 0, 0))
	self:AddParticle(vortex_particle, false, false, -1, false, false)
end

function modifier_ability_npc_hell2_colume_cold:OnDestroy(kv)
	UTIL_Remove(self:GetParent())
end

-- Aura template
function modifier_ability_npc_hell2_colume_cold:IsAura()
    return true
end

function modifier_ability_npc_hell2_colume_cold:GetModifierAura()
    return "modifier_ability_npc_hell2_colume_cold_slow"
end

function modifier_ability_npc_hell2_colume_cold:GetAuraRadius()
    return 250
end

function modifier_ability_npc_hell2_colume_cold:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_hell2_colume_cold:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_hell2_colume_cold:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_hell2_colume_cold:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_hell2_colume_cold_slow = class({})
--Classifications template
function modifier_ability_npc_hell2_colume_cold_slow:IsHidden()
   return false
end

function modifier_ability_npc_hell2_colume_cold_slow:IsDebuff()
   return true
end

function modifier_ability_npc_hell2_colume_cold_slow:IsPurgable()
   return true
end

function modifier_ability_npc_hell2_colume_cold_slow:RemoveOnDeath()
   return true
end

function modifier_ability_npc_hell2_colume_cold_slow:DestroyOnExpire()
    return true
end

function modifier_ability_npc_hell2_colume_cold_slow:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
}
end

function modifier_ability_npc_hell2_colume_cold_slow:GetModifierMoveSpeedBonus_Percentage()
    return -self:GetAbility():GetSpecialValueFor("slow_pct")
end
