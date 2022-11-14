LinkLuaModifier( "modifier_ability_npc_boss_dark_1_spell3","abilities/dark/dark_1/ability_npc_boss_dark_1_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_dark_1_spell3_effect","abilities/dark/dark_1/ability_npc_boss_dark_1_spell3", LUA_MODIFIER_MOTION_NONE )

ability_npc_boss_dark_1_spell3 = class({})

function ability_npc_boss_dark_1_spell3:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_dark_1_spell3"
end

-----------------------------------------------------------------------------------------

modifier_ability_npc_boss_dark_1_spell3 = class({})

function modifier_ability_npc_boss_dark_1_spell3:IsHidden()
    return true
end

function modifier_ability_npc_boss_dark_1_spell3:OnCreated()
	self.duration = self:GetAbility():GetSpecialValueFor("duration")
end

function modifier_ability_npc_boss_dark_1_spell3:IsPurgable()
    return false
end

function modifier_ability_npc_boss_dark_1_spell3:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
end

function modifier_ability_npc_boss_dark_1_spell3:OnAttackLanded(data)
    if data.target == self:GetParent() then
        data.attacker:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_boss_dark_1_spell3_effect", {duration = self.duration})
    end
end

-----------------------------------------------------------------------------------------

modifier_ability_npc_boss_dark_1_spell3_effect = class({})

function modifier_ability_npc_boss_dark_1_spell3_effect:IsHidden()
    return false
end

function modifier_ability_npc_boss_dark_1_spell3_effect:IsPurgable()
    return true
end

function modifier_ability_npc_boss_dark_1_spell3_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_dark_1_spell3_effect:OnCreated()
	self.persent = self:GetAbility():GetSpecialValueFor("persent")
    if not IsServer() then return end
	ApplyDamage({victim = self:GetParent(),
    damage =  self:GetParent():GetHealth() * self.persent,
    damage_type = DAMAGE_TYPE_MAGICAL,
    attacker = self:GetCaster()})
    self:StartIntervalThink(1)
end

function modifier_ability_npc_boss_dark_1_spell3_effect:OnIntervalThink()
	if not IsServer() then return end
	ApplyDamage({victim = self:GetParent(),
    damage =  self:GetParent():GetHealth() * self.persent,
    damage_type = DAMAGE_TYPE_MAGICAL,
    attacker = self:GetCaster()})
end