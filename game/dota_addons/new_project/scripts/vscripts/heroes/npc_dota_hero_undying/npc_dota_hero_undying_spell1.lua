npc_dota_hero_undying_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_undying_spell1_attack", "heroes/npc_dota_hero_undying/npc_dota_hero_undying_spell1", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier( "modifier_npc_dota_hero_undying_spell1_slow", "heroes/npc_dota_hero_undying/npc_dota_hero_undying_spell1", LUA_MODIFIER_MOTION_NONE)

function npc_dota_hero_undying_spell1:OnSpellStart()
    local point = self:GetCaster():GetAbsOrigin()
    local rad = self:GetSpecialValueFor("radius")
    local agro_duration = self:GetSpecialValueFor("agro_duration")
    local slow_duration = self:GetSpecialValueFor("slow_duration")
    local maxdist = rad + 50
    if self:GetAutoCastState() then
        print("111")
	    local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, point, nil, rad, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
        for _,unit in pairs(enemies) do
            local direction = unit:GetAbsOrigin() - point
            local distance = direction:Length2D()
            local knockbackDis = (direction * (maxdist / distance) - direction):Length2D()
            unit:AddNewModifier(self:GetCaster(), self, "modifier_simply_motion_controll", {
            x = direction.x, y = direction.y, r = knockbackDis, s = knockbackDis * 5})
		    unit:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_undying_spell1_slow", {duration = slow_duration})
        end
    else
        print("222")
	    local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, point, nil, rad, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
        for _,unit in pairs(enemies) do
		    unit:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_undying_spell1_attack", {duration = agro_duration})
        end
    end
end

modifier_npc_dota_hero_undying_spell1_attack = class({})
--Classifications template
function modifier_npc_dota_hero_undying_spell1_attack:IsHidden()
    return false
end

function modifier_npc_dota_hero_undying_spell1_attack:IsDebuff()
    return true
end

function modifier_npc_dota_hero_undying_spell1_attack:IsPurgable()
    return false
end

function modifier_npc_dota_hero_undying_spell1_attack:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_undying_spell1_attack:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_undying_spell1_attack:OnCreated()
    self:GetParent():SetForceAttackTarget( self:GetCaster() )
end

function modifier_npc_dota_hero_undying_spell1_attack:CheckState()
    return {
        [MODIFIER_STATE_COMMAND_RESTRICTED] = true
    }
end

modifier_npc_dota_hero_undying_spell1_slow = class({})
--Classifications template
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