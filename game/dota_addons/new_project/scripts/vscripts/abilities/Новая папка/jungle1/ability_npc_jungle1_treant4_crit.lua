ability_npc_jungle1_treant4_crit = class({})

LinkLuaModifier( "modifier_ability_npc_jungle1_treant4_crit","abilities/jungle1/ability_npc_jungle1_treant4_crit", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_jungle1_treant4_agressive","abilities/jungle1/ability_npc_jungle1_treant4_crit", LUA_MODIFIER_MOTION_NONE )

function ability_npc_jungle1_treant4_crit:GetIntrinsicModifierName()
    return "modifier_ability_npc_jungle1_treant4_crit"
end

modifier_ability_npc_jungle1_treant4_crit = class({})

--Classifications template
function modifier_ability_npc_jungle1_treant4_crit:IsHidden()
   return true
end

function modifier_ability_npc_jungle1_treant4_crit:IsPurgable()
   return false
end

function modifier_ability_npc_jungle1_treant4_crit:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE
}
end

function modifier_ability_npc_jungle1_treant4_crit:GetModifierPreAttack_CriticalStrike()
    if RollPseudoRandom(30, self:GetParent()) then
        return 130
    end
end

function modifier_ability_npc_jungle1_treant4_crit:OnCreated()
    self:StartIntervalThink(1)
end

function modifier_ability_npc_jungle1_treant4_crit:OnIntervalThink()
	local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 600, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false )
    local count = #enemies
    for _,unit in ipairs(enemies) do
        if unit:GetUnitName() ~= "npc_jungle1_treant4" then
            count = count - 1
        end
    end
    if count == 0 then
        self:GetParent():AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_jungle1_treant4_agressive", {})
    elseif self:GetParent():HasModifier("modifier_ability_npc_jungle1_treant4_agressive") then
        self:GetParent():RemoveModifierByName("modifier_ability_npc_jungle1_treant4_agressive")
    end
end

modifier_ability_npc_jungle1_treant4_agressive = class({})
--Classifications template
function modifier_ability_npc_jungle1_treant4_agressive:IsHidden()
   return false
end

function modifier_ability_npc_jungle1_treant4_agressive:IsDebuff()
   return false
end

function modifier_ability_npc_jungle1_treant4_agressive:IsPurgable()
   return false
end

function modifier_ability_npc_jungle1_treant4_agressive:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
}
end

function modifier_ability_npc_jungle1_treant4_agressive:GetModifierAttackSpeedBonus_Constant()
    return 100
end
