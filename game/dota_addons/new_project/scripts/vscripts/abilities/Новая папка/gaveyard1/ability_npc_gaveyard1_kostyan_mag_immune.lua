ability_npc_gaveyard1_kostyan_mag_immune = class({})

LinkLuaModifier( "modifier_ability_npc_gaveyard1_kostyan_mag_immune","abilities/gaveyard1/ability_npc_gaveyard1_kostyan_mag_immune", LUA_MODIFIER_MOTION_NONE )

function ability_npc_gaveyard1_kostyan_mag_immune:GetIntrinsicModifierName()
    return "modifier_ability_npc_gaveyard1_kostyan_mag_immune"
end

modifier_ability_npc_gaveyard1_kostyan_mag_immune = class({})

--Classifications template
function modifier_ability_npc_gaveyard1_kostyan_mag_immune:IsHidden()
   return true
end

function modifier_ability_npc_gaveyard1_kostyan_mag_immune:CheckState()
    return {[MODIFIER_STATE_MAGIC_IMMUNE] = true}
end

function modifier_ability_npc_gaveyard1_kostyan_mag_immune:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(1)
end

function modifier_ability_npc_gaveyard1_kostyan_mag_immune:OnIntervalThink()
    local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 400, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC, 0, 0, false )
    local count = 0
    for _,unit in ipairs(enemies) do
        if unit:GetUnitName() == "npc_gaveyard1_zomby" then
            count = count + 1
        end
    end
    self:SetStackCount(count)
end

function modifier_ability_npc_gaveyard1_kostyan_mag_immune:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE,
    }
end

function modifier_ability_npc_gaveyard1_kostyan_mag_immune:GetModifierBaseAttack_BonusDamage()
    return self:GetAbility():GetSpecialValueFor("attack") * self:GetStackCount()
end

