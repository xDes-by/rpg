ability_npc_boss_hell1_spell3 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_hell1_spell3","abilities/hell1/ability_npc_boss_hell1_spell3", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_hell1_spell3:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_hell1_spell3"
end

modifier_ability_npc_boss_hell1_spell3 = class({})

--Classifications template
function modifier_ability_npc_boss_hell1_spell3:IsHidden()
    return true
end

function modifier_ability_npc_boss_hell1_spell3:IsPurgable()
    return false
end

function modifier_ability_npc_boss_hell1_spell3:RemoveOnDeath()
    return false
end

function modifier_ability_npc_boss_hell1_spell3:OnCreated()
    self.mult = self:GetAbility():GetSpecialValueFor("mult") / 100
end

function modifier_ability_npc_boss_hell1_spell3:OnRefresh()
    self.mult = self:GetAbility():GetSpecialValueFor("mult") / 100
end

function modifier_ability_npc_boss_hell1_spell3:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_ability_npc_boss_hell1_spell3:GetModifierProcAttack_Feedback(data)
    if self:GetCaster().form > 1 then
        local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, data.target:GetAbsOrigin(), nil, 150, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0, false)
        enemies = table.remove_item(enemies, data.target)
        local dmg = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * self.mult
        for _,unit in pairs(enemies) do
            ApplyDamage({victim = unit,
            damage = dmg,
            damage_type = DAMAGE_TYPE_PHYSICAL,
            damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
            attacker = self:GetCaster(),
            ability = self:GetAbility()})
        end
    end
end