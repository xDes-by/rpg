LinkLuaModifier( "modifier_npc_dota_hero_lone_druid_spell2", "heroes/npc_dota_hero_lone_druid/npc_dota_hero_lone_druid_spell2", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier( "modifier_npc_dota_hero_lone_druid_spell2_slow", "heroes/npc_dota_hero_lone_druid/npc_dota_hero_lone_druid_spell2", LUA_MODIFIER_MOTION_NONE)

npc_dota_hero_lone_druid_spell2 = class({})

function npc_dota_hero_lone_druid_spell2:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_lone_druid_spell2", {duration = self:GetSpecialValueFor("buff_duration")})
end

-----------------------------------------------------------------------

modifier_npc_dota_hero_lone_druid_spell2 = class({})

function modifier_npc_dota_hero_lone_druid_spell2:IsHidden()
    return false
end

function modifier_npc_dota_hero_lone_druid_spell2:IsPurgable()
    return false
end

function modifier_npc_dota_hero_lone_druid_spell2:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_lone_druid_spell2:OnCreated()
    self.table = {}
    if not IsServer() then return end
    self:StartIntervalThink(0.1)
end

function modifier_npc_dota_hero_lone_druid_spell2:OnIntervalThink()
	local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self:GetCaster():GetAbsOrigin(), nil, self:GetAbility():GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        if self.table[unit] == nil then
            unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_lone_druid_spell2_slow", {duration = self:GetAbility():GetSpecialValueFor("slow_duration")})
            unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_stunned", {duration = 0.1})
            self.table[unit] = false
			local damageTable = {victim = unit,
				attacker = self:GetCaster(),
				damage = self:GetAbility():GetSpecialValueFor("damage") + self:GetAbility():GetSpecialValueFor("str")/100*self:GetCaster():GetStrength(),
				damage_type = DAMAGE_TYPE_MAGICAL}	
			ApplyDamage(damageTable)
			EmitSoundOn( "Hero_PrimalBeast.Pulverize.Stun",  self:GetCaster())
        end
    end
end

function modifier_npc_dota_hero_lone_druid_spell2:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE
    }
end

function modifier_npc_dota_hero_lone_druid_spell2:CheckState()
	local state = {
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
	}
	return state
end

function modifier_npc_dota_hero_lone_druid_spell2:GetModifierMoveSpeed_Absolute()
    return 550
end

----------------------------------------------------------

modifier_npc_dota_hero_lone_druid_spell2_slow = class({})

function modifier_npc_dota_hero_lone_druid_spell2_slow:IsHidden()
    return false
end

function modifier_npc_dota_hero_lone_druid_spell2_slow:IsDebuff()
    return true
end

function modifier_npc_dota_hero_lone_druid_spell2_slow:IsPurgable()
    return true
end

function modifier_npc_dota_hero_lone_druid_spell2_slow:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_lone_druid_spell2_slow:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_lone_druid_spell2_slow:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
    }
end

function modifier_npc_dota_hero_lone_druid_spell2_slow:GetModifierMoveSpeedBonus_Percentage()
    return -100
end
