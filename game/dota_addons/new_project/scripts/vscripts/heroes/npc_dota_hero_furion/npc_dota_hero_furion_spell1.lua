npc_dota_hero_furion_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_furion_spell1","heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_furion_spell1_second_attack","heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell1", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_furion_spell1:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_furion_spell1"
end

function npc_dota_hero_furion_spell1:OnProjectileHit_ExtraData(hTarget, vLocation)
    ApplyDamage({victim = hTarget,
    damage = self.damage,
    damage_type = DAMAGE_TYPE_PHYSICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
    attacker = self:GetCaster(),
    ability = self})
end

modifier_npc_dota_hero_furion_spell1 = class({})

--Classifications template
function modifier_npc_dota_hero_furion_spell1:IsHidden()
    return true
end

function modifier_npc_dota_hero_furion_spell1:IsPurgable()
    return false
end

function modifier_npc_dota_hero_furion_spell1:DeclareFunctions()
    return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_npc_dota_hero_furion_spell1:OnCreated()
    if IsClient() then
        return
    end
    self.FullDamage = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster())
    self.DamageMultiplier = (100 - self:GetAbility():GetSpecialValueFor("damage_multiplier")) * 0.01
    self:GetAbility().damage = self.FullDamage - (self.FullDamage * self.DamageMultiplier)
end

function modifier_npc_dota_hero_furion_spell1:GetModifierProcAttack_Feedback(data)
    if self:GetAbility():IsCooldownReady() then
	    local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, data.attacker:GetAbsOrigin(), nil, self:GetParent():Script_GetAttackRange(), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
        enemies = table.remove_item( enemies, data.target )
        if enemies[1] then
            ProjectileManager:CreateTrackingProjectile({
                Target = enemies[1],
                Source = data.attacker,  
                Ability = self:GetAbility(),
                EffectName = "particles/units/heroes/hero_furion/furion_base_attack.vpcf",
                iMoveSpeed = 1125,
            })
            self:GetAbility():UseResources(false, false, true)
        end
    end
end
