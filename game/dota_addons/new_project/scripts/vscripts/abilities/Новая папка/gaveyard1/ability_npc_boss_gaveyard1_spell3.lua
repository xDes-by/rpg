ability_npc_boss_gaveyard1_spell3 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_gaveyard1_spell3","abilities/gaveyard1/ability_npc_boss_gaveyard1_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_gaveyard1_spell3_effect","abilities/gaveyard1/ability_npc_boss_gaveyard1_spell3", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_gaveyard1_spell3:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_gaveyard1_spell3"
end

modifier_ability_npc_boss_gaveyard1_spell3 = class({})

--Classifications template
function modifier_ability_npc_boss_gaveyard1_spell3:IsHidden()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell3:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard1_spell3:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
end

function modifier_ability_npc_boss_gaveyard1_spell3:OnAttackLanded(data)
    if data.target == self:GetParent() then
        data.attacker:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_boss_gaveyard1_spell3_effect", {duration = 2})
    end
end

modifier_ability_npc_boss_gaveyard1_spell3_effect = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard1_spell3_effect:IsHidden()
    return false
end

function modifier_ability_npc_boss_gaveyard1_spell3_effect:IsPurgable()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell3_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell3_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell3_effect:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.99)
end

function modifier_ability_npc_boss_gaveyard1_spell3_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage =  self:GetParent():GetHealth() * 0.01,
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end