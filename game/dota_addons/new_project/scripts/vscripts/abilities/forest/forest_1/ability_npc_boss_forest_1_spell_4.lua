LinkLuaModifier( "modifier_ability_npc_boss_forest_1_spell_4","abilities/forest/forest_1/ability_npc_boss_forest_1_spell_4", LUA_MODIFIER_MOTION_NONE )

ability_npc_boss_forest_1_spell_4 = class({})

function ability_npc_boss_forest_1_spell_4:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_forest_1_spell_4"
end

--------------------------------------------------------------------------------------------------------------------------

modifier_ability_npc_boss_forest_1_spell_4 = class({})

function modifier_ability_npc_boss_forest_1_spell_4:IsHidden()
    return true
end

function modifier_ability_npc_boss_forest_1_spell_4:IsPurgable()
    return false
end

function modifier_ability_npc_boss_forest_1_spell_4:RemoveOnDeath()
   return false
end

function modifier_ability_npc_boss_forest_1_spell_4:OnCreated()
    self.attack = 0
end

function modifier_ability_npc_boss_forest_1_spell_4:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
end

function modifier_ability_npc_boss_forest_1_spell_4:OnAttackLanded(data)
    if self:GetParent() == data.target then
        self.attack = self.attack + 1
        if self.attack == 8 then
            self.attack = 0
            local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_axe/axe_counterhelix.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
            ParticleManager:ReleaseParticleIndex( effect_cast )
            local effect_cast2 = ParticleManager:CreateParticle( "particles/units/heroes/hero_axe/axe_attack_blur_counterhelix.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
            ParticleManager:ReleaseParticleIndex( effect_cast2 )
            EmitSoundOn( "Hero_Axe.CounterHelix", self:GetParent() )
            local enemies = FindUnitsInRadius(self:GetParent():GetTeamNumber(), self:GetParent():GetAbsOrigin(), nil, 250, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
            local dmg = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * 3
            for _,unit in pairs(enemies) do
                ApplyDamage({victim = unit,
                damage = dmg,
                damage_type = DAMAGE_TYPE_PHYSICAL,
                damage_flags = DOTA_DAMAGE_FLAG_NONE,
                attacker = self:GetCaster(),
                ability = self:GetAbility()})
            end
        end
    end
end
