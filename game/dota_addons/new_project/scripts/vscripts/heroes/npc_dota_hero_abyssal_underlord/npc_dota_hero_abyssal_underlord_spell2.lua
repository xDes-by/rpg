npc_dota_hero_abyssal_underlord_spell2 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_abyssal_underlord_spell2", "heroes/npc_dota_hero_abyssal_underlord/npc_dota_hero_abyssal_underlord_spell2", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_abyssal_underlord_spell2:OnSpellStart()
    self.slow = self:GetSpecialValueFor("slow")
    local target = self:GetCursorTarget()
    local origin = self:GetCaster():GetAbsOrigin()
    local direction = target:GetAbsOrigin()-origin
	direction.z = 0
	direction = direction:Normalized()
	local enemies = FindUnitsInCone(
		DOTA_TEAM_GOODGUYS,	-- nTeamNumber
		target:GetAbsOrigin(),	-- vCenterPos
		origin,	-- vStartPos
		origin + direction*self:GetSpecialValueFor("end_distanse"),	-- vEndPos
		150,	-- fStartRadius
		self:GetSpecialValueFor("end_distanse"),	-- fEndRadius
		nil,	-- hCacheUnit
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- nTeamFilter
		DOTA_UNIT_TARGET_BASIC,	-- nTypeFilter
		0,	-- nFlagFilter
		FIND_CLOSEST,	-- nOrderFilter
		false	-- bCanGrowCache
	)
    for _,unit in pairs(enemies) do
        unit:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_abyssal_underlord_spell2", {duration = 1.5})
        self:GetCaster():PerformAttack(unit, false, false, true, false, false, false, true)
    end
    EmitSoundOn("Hero_AbyssalUnderlord.DarkRift.Aftershock", target)
end

modifier_npc_dota_hero_abyssal_underlord_spell2 = class({})
--Classifications template
function modifier_npc_dota_hero_abyssal_underlord_spell2:IsHidden()
    return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:IsDebuff()
    return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:IsPurgable()
    return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:DeclareFunctions()
    return {
       MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
    }
end

function modifier_npc_dota_hero_abyssal_underlord_spell2:GetModifierMoveSpeedBonus_Percentage()
    return -self:GetAbility().slow
end