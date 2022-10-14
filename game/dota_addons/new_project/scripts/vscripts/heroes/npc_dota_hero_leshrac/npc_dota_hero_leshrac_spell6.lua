npc_dota_hero_leshrac_spell6 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_leshrac_spell6", "heroes/npc_dota_hero_leshrac/npc_dota_hero_leshrac_spell6", LUA_MODIFIER_MOTION_NONE)

function npc_dota_hero_leshrac_spell6:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_leshrac_spell6", {duration = self:GetSpecialValueFor("duration")})
end

modifier_npc_dota_hero_leshrac_spell6 = class({})
--Classifications template
function modifier_npc_dota_hero_leshrac_spell6:IsHidden()
    return true
end

function modifier_npc_dota_hero_leshrac_spell6:IsPurgable()
    return false
end

function modifier_npc_dota_hero_leshrac_spell6:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_leshrac_spell6:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_leshrac_spell6:OnCreated()
    self.left = self:GetCaster():GetRightVector() * -1
    self.right = self:GetCaster():GetRightVector()
    self.distance = self:GetAbility():GetSpecialValueFor("distance")
    self.proctime = 0
    self.LeftORRoght = true
    local rad = self:GetAbility():GetSpecialValueFor("with")
    self.projinfo = {
        Source = self:GetCaster(),
        Ability = self:GetAbility(),
        vSpawnOrigin = self:GetCaster():GetAbsOrigin(),
        
        bDeleteOnHit = false,
        
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = DOTA_UNIT_TARGET_BASIC,
        
        EffectName = "particles/units/heroes/hero_tidehunter/tidehunter_gush_upgrade.vpcf",
        fDistance = self.distance,
        fStartRadius = rad,
        fEndRadius = rad,
        --vVelocity = projectile_direction * ,
        }
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.7)
end

function modifier_npc_dota_hero_leshrac_spell6:OnIntervalThink()
    self.proctime = self.proctime + 1
    if self.proctime < 5 then
        if self.LeftORRoght then
            self.projinfo.vVelocity = self.left * self.distance
            ProjectileManager:CreateLinearProjectile(self.projinfo)
            self.LeftORRoght = false
        else
            self.projinfo.vVelocity = self.right * self.distance
            ProjectileManager:CreateLinearProjectile(self.projinfo)
            self.LeftORRoght = true
        end            
    else
        self:StartIntervalThink(0.5)
    end
    if self.proctime == 6 then
        self.projinfo.vVelocity = self:GetCaster():GetForwardVector() * self.distance
        ProjectileManager:CreateLinearProjectile(self.projinfo)
    end
    EmitSoundOn("DOTA_Item.Nullifier.Cast", self:GetCaster())
end


function modifier_npc_dota_hero_leshrac_spell6:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_DISABLE_TURNING,
        MODIFIER_PROPERTY_MOVESPEED_LIMIT,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
        MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
    }
end

function modifier_npc_dota_hero_leshrac_spell6:GetModifierDisableTurning()
    return 1
end

function modifier_npc_dota_hero_leshrac_spell6:GetModifierMoveSpeed_Limit()
    return 0.1
end

function modifier_npc_dota_hero_leshrac_spell6:GetOverrideAnimation()
    return ACT_DOTA_TAUNT
end

function modifier_npc_dota_hero_leshrac_spell6:GetOverrideAnimationRate()
    return 1.0
end

function modifier_npc_dota_hero_leshrac_spell6:GetActivityTranslationModifiers()
    return "disco_gesture"
end

