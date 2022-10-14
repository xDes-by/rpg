ability_npc_gaveyard2_golem_root = class({})

LinkLuaModifier( "modifier_ability_npc_gaveyard2_golem_root","abilities/gaveyard2/ability_npc_gaveyard2_golem_root", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_gaveyard2_golem_root_effect","abilities/gaveyard2/ability_npc_gaveyard2_golem_root", LUA_MODIFIER_MOTION_NONE )

function ability_npc_gaveyard2_golem_root:OnToggle() 
    if self:GetCaster():HasModifier("modifier_ability_npc_gaveyard2_golem_root") then
        self:GetCaster():RemoveModifierByName("modifier_ability_npc_gaveyard2_golem_root")
    else
        self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_gaveyard2_golem_root", {})
    end
end

modifier_ability_npc_gaveyard2_golem_root = class({})

--Classifications template
function modifier_ability_npc_gaveyard2_golem_root:IsHidden()
   return true
end

function modifier_ability_npc_gaveyard2_golem_root:IsDebuff()
   return true
end

function modifier_ability_npc_gaveyard2_golem_root:RemoveOnDeath()
   return true
end

function modifier_ability_npc_gaveyard2_golem_root:OnCreated()
    if IsClient() then
        return
    end
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_pudge/pudge_rot.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
    ParticleManager:SetParticleControl(pfx, 1, Vector(300, 0, 0))
    self:AddParticle(pfx, false, false, 15, false, false)
    self:StartIntervalThink(0.1)
end

function modifier_ability_npc_gaveyard2_golem_root:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(), 
    damage = 10, 
    damage_type = DAMAGE_TYPE_MAGICAL, 
    damage_flags = DOTA_DAMAGE_FLAG_NONE, 
    attacker = self:GetCaster(), 
    ability = self:GetAbility()})
end

-- Aura template
function modifier_ability_npc_gaveyard2_golem_root:IsAura()
    return true
end

function modifier_ability_npc_gaveyard2_golem_root:GetModifierAura()
    return "modifier_ability_npc_gaveyard2_golem_root_effect"
end

function modifier_ability_npc_gaveyard2_golem_root:GetAuraRadius()
    return 300
end

function modifier_ability_npc_gaveyard2_golem_root:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_gaveyard2_golem_root:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_gaveyard2_golem_root:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_gaveyard2_golem_root:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_gaveyard2_golem_root_effect = class({})
--Classifications template
function modifier_ability_npc_gaveyard2_golem_root_effect:IsHidden()
   return false
end

function modifier_ability_npc_gaveyard2_golem_root_effect:IsDebuff()
   return true
end

function modifier_ability_npc_gaveyard2_golem_root_effect:IsPurgable()
   return false
end

function modifier_ability_npc_gaveyard2_golem_root_effect:RemoveOnDeath()
   return true
end

function modifier_ability_npc_gaveyard2_golem_root_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_gaveyard2_golem_root_effect:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.1)
end

function modifier_ability_npc_gaveyard2_golem_root_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(), 
    damage = 10, 
    damage_type = DAMAGE_TYPE_MAGICAL, 
    damage_flags = DOTA_DAMAGE_FLAG_NONE, 
    attacker = self:GetCaster(), 
    ability =self:GetAbility()})
end