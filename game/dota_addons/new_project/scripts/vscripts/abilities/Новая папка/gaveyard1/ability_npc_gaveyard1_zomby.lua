ability_npc_gaveyard1_zomby = class({})

LinkLuaModifier( "modifier_ability_npc_gaveyard1_zomby","abilities/gaveyard1/ability_npc_gaveyard1_zomby", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_gaveyard1_zomby_slow","abilities/gaveyard1/ability_npc_gaveyard1_zomby", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_gaveyard1_zomby_effect","abilities/gaveyard1/ability_npc_gaveyard1_zomby", LUA_MODIFIER_MOTION_NONE )

function ability_npc_gaveyard1_zomby:GetIntrinsicModifierName()
    return "modifier_ability_npc_gaveyard1_zomby"
end

modifier_ability_npc_gaveyard1_zomby = class({})

--Classifications template
function modifier_ability_npc_gaveyard1_zomby:IsHidden()
   return true
end

function modifier_ability_npc_gaveyard1_zomby:IsPurgable()
   return false
end

function modifier_ability_npc_gaveyard1_zomby:IsPurgable()
   return false
end

function modifier_ability_npc_gaveyard1_zomby:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(1)
end

function modifier_ability_npc_gaveyard1_zomby:OnIntervalThink()
	local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 400, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC, 0, 0, false )
    local count = 0
    for _,unit in ipairs(enemies) do
        if unit:GetUnitName() == "npc_gaveyard1_zomby" then
            count = count + 1
        end
    end
    self:SetStackCount(count)
end

function modifier_ability_npc_gaveyard1_zomby:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_ability_npc_gaveyard1_zomby:GetModifierMoveSpeedBonus_Constant()
    return self:GetAbility():GetSpecialValueFor("ms") * self:GetStackCount()
end

function modifier_ability_npc_gaveyard1_zomby:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_gaveyard1_zomby_slow", {duration = 2})
end

modifier_ability_npc_gaveyard1_zomby_slow = class({})
--Classifications template
function modifier_ability_npc_gaveyard1_zomby_slow:IsHidden()
   return true
end

function modifier_ability_npc_gaveyard1_zomby_slow:IsDebuff()
   return true
end

function modifier_ability_npc_gaveyard1_zomby_slow:IsPurgable()
   return true
end

function modifier_ability_npc_gaveyard1_zomby_slow:RemoveOnDeath()
   return true
end

function modifier_ability_npc_gaveyard1_zomby_slow:DestroyOnExpire()
    return true
end

function modifier_ability_npc_gaveyard1_zomby_slow:GetAttributes()
    return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_ability_npc_gaveyard1_zomby_slow:OnCreated() 
    if IsClient() then
        return
    end
    if self:GetParent():HasModifier("modifier_ability_npc_gaveyard1_zomby_effect") then
        self:GetParent():FindModifierByName("modifier_ability_npc_gaveyard1_zomby_effect"):IncrementStackCount()
    else
        self:GetParent():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_gaveyard1_zomby_effect", {})
    end
end

function modifier_ability_npc_gaveyard1_zomby_slow:OnRefresh()
    self:OnCreated()
end

function modifier_ability_npc_gaveyard1_zomby_slow:OnDestroy()
    if IsClient() then
        return
    end
    self:GetParent():FindModifierByName("modifier_ability_npc_gaveyard1_zomby_effect"):DecrementStackCount()
end

function modifier_ability_npc_gaveyard1_zomby_slow:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
}
end

function modifier_ability_npc_gaveyard1_zomby_slow:GetModifierMoveSpeedBonus_Percentage()
    return -self:GetAbility():GetSpecialValueFor("slow")
end

modifier_ability_npc_gaveyard1_zomby_effect = class({})
--Classifications template
function modifier_ability_npc_gaveyard1_zomby_effect:IsHidden()
    if self:GetStackCount() >= 1 then
        return false
    end
    return true
end

function modifier_ability_npc_gaveyard1_zomby_effect:IsDebuff()
    return true
end

function modifier_ability_npc_gaveyard1_zomby_effect:IsPurgable()
    return false
end
