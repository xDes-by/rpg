ability_npc_hell2_golem = class({})

LinkLuaModifier( "modifier_ability_npc_hell2_golem","abilities/hell2/ability_npc_hell2_golem", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell2_golem_burn","abilities/hell2/ability_npc_hell2_golem", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell2_golem_burn_effect","abilities/hell2/ability_npc_hell2_golem", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell2_golem:GetIntrinsicModifierName()
    return "modifier_ability_npc_hell2_golem"
end

modifier_ability_npc_hell2_golem = class({})

--Classifications template
function modifier_ability_npc_hell2_golem:IsHidden()
   return true
end

function modifier_ability_npc_hell2_golem:IsPurgable()
   return false
end

-- Aura template
function modifier_ability_npc_hell2_golem:IsAura()
    return true
end

function modifier_ability_npc_hell2_golem:GetModifierAura()
    return "modifier_ability_npc_hell2_golem_burn"
end

function modifier_ability_npc_hell2_golem:GetAuraRadius()
    return 500
end

function modifier_ability_npc_hell2_golem:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_hell2_golem:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_hell2_golem:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_hell2_golem:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_hell2_golem_burn = class({})
--Classifications template
function modifier_ability_npc_hell2_golem_burn:IsHidden()
   return true
end

function modifier_ability_npc_hell2_golem_burn:IsPurgable()
   return false
end

function modifier_ability_npc_hell2_golem_burn:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(3)
end

function modifier_ability_npc_hell2_golem_burn:OnDestroy()
    if self.mod ~= nil then
        self.mod:Destroy()
    end
end

function modifier_ability_npc_hell2_golem_burn:OnIntervalThink()
    self.mod = self:GetParent():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_hell2_golem_burn_effect", {})
    self:StartIntervalThink(-1)
end

modifier_ability_npc_hell2_golem_burn_effect = class({})
--Classifications template
function modifier_ability_npc_hell2_golem_burn_effect:IsHidden()
   return false
end

function modifier_ability_npc_hell2_golem_burn_effect:IsDebuff()
   return true
end

function modifier_ability_npc_hell2_golem_burn_effect:IsPurgable()
   return false
end

function modifier_ability_npc_hell2_golem_burn_effect:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
}
end

function modifier_ability_npc_hell2_golem_burn_effect:GetModifierIncomingDamage_Percentage(data)
    if data.attacker == self:GetCaster() then
        return 30
    end
end
