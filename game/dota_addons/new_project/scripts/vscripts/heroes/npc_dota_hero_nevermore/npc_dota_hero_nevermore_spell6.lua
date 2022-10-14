npc_dota_hero_nevermore_spell6 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_nevermore_spell6","heroes/npc_dota_hero_nevermore/npc_dota_hero_nevermore_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_nevermore_spell6_animation","heroes/npc_dota_hero_nevermore/npc_dota_hero_nevermore_spell6", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_nevermore_spell6:GetChannelTime()
    return self:GetCaster():FindModifierByName("modifier_npc_dota_hero_nevermore_spell4"):GetStackCount() * 0.5
end

function npc_dota_hero_nevermore_spell6:OnSpellStart()
    self.mod = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_nevermore_spell6", {})
    local caster = self:GetCaster()
    Timers:CreateTimer(0.01,function()
        if caster:HasModifier("modifier_npc_dota_hero_nevermore_spell6") then
            caster:AddNewModifier(caster, self, "modifier_npc_dota_hero_nevermore_spell6_animation", {duration = 3})
            EmitSoundOn("Hero_Nevermore.Taunt.Swagger",caster)
            return 3
        end
    end)
end

function npc_dota_hero_nevermore_spell6:OnChannelFinish()
    self.mod:Destroy()
    StopSoundOn("Hero_Nevermore.Taunt.Swagger",self:GetCaster())
    self:GetCaster():FindModifierByName("modifier_npc_dota_hero_nevermore_spell6_animation"):Destroy()
end

modifier_npc_dota_hero_nevermore_spell6 = class({})
--Classifications template
function modifier_npc_dota_hero_nevermore_spell6:IsHidden()
    return true
end

function modifier_npc_dota_hero_nevermore_spell6:IsPurgable()
    return false
end

function modifier_npc_dota_hero_nevermore_spell6:OnCreated()
    if IsClient() then
        return
    end
    self.radius = self:GetAbility():GetSpecialValueFor("radius_damage")
    self.damage = self:GetAbility():GetSpecialValueFor("damage_multip") * self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * 0.01
    self.mod = self:GetCaster():FindModifierByName("modifier_npc_dota_hero_nevermore_spell4")
    self:StartIntervalThink(0.5)
end

function modifier_npc_dota_hero_nevermore_spell6:OnIntervalThink()
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetParent():GetAbsOrigin(), nil, self:GetAbility():GetSpecialValueFor("radius_find"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 1,false)
    if enemies[1] then
        if self.mod:GetStackCount() > 0 then
            self.mod:DecrementStackCount()
            local position = enemies[1]:GetAbsOrigin()
            local units = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, position, nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 1,false)
            for _,unit in pairs(units) do
                ApplyDamage({victim = unit,
                damage =  self.damage,
                damage_type = self:GetAbility():GetAbilityDamageType(),
                damage_flags = DOTA_DAMAGE_FLAG_NONE,
                attacker = self:GetCaster(),
                ability = self:GetAbility()})
            end

            local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_nevermore/nevermore_shadowraze.vpcf", PATTACH_WORLDORIGIN, nil )
            ParticleManager:SetParticleControl( effect_cast, 0, position )
            ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.radius, 1, 1 ) )
            ParticleManager:ReleaseParticleIndex( effect_cast )
            EmitSoundOnLocationWithCaster( position, "Hero_Nevermore.Shadowraze", self:GetCaster() )
        else
            self:Destroy()
        end
    end
end

modifier_npc_dota_hero_nevermore_spell6_animation = class({})

function modifier_npc_dota_hero_nevermore_spell6_animation:IsHidden()
    return true
end

function modifier_npc_dota_hero_nevermore_spell6_animation:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
        MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
    }
end

function modifier_npc_dota_hero_nevermore_spell6_animation:GetOverrideAnimation()
    return ACT_DOTA_TAUNT
end

function modifier_npc_dota_hero_nevermore_spell6_animation:GetOverrideAnimationRate()
    return 1
end

function modifier_npc_dota_hero_nevermore_spell6_animation:GetActivityTranslationModifiers()
    return "swag_gesture"
end