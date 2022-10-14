npc_dota_hero_keeper_of_the_light_spell6 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_keeper_of_the_light_spell6", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell6", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_keeper_of_the_light_spell6:GetChannelTime()
    return 3
end

function npc_dota_hero_keeper_of_the_light_spell6:OnSpellStart()
    self.mod = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_keeper_of_the_light_spell6", {duration = 3})
end

function npc_dota_hero_keeper_of_the_light_spell6:OnChannelFinish(bInterrupted)
    self.mod:Destroy()
end

function npc_dota_hero_keeper_of_the_light_spell6:OnProjectileHit(hTarget, vLocation)
    if hTarget then
        ApplyDamage({victim = hTarget,
        damage = self:GetSpecialValueFor("damage"),
        damage_type = self:GetAbilityDamageType(),
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
        EmitSoundOn("Hero_KeeperOfTheLight.Illuminate.Target.Secondary", hTarget)
    end
end

modifier_npc_dota_hero_keeper_of_the_light_spell6 = class({})
--Classifications template
function modifier_npc_dota_hero_keeper_of_the_light_spell6:IsHidden()
    return true
end

function modifier_npc_dota_hero_keeper_of_the_light_spell6:IsPurgable()
    return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell6:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_keeper_of_the_light_spell6:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_keeper_of_the_light_spell6:OnCreated()
    self.distance = self:GetAbility():GetSpecialValueFor("distance")
    self.point = self:GetCaster():GetAbsOrigin()
    self.point.z = 0
    EmitSoundOn("Hero_KeeperOfTheLight.Illuminate.Charge", self:GetCaster())
    local rad = self:GetAbility():GetSpecialValueFor("radius")
    if IsClient() then
        return
    end
    self.StartDidection = self:GetParent():GetForwardVector()
    self.projinfo = {
        Source = self:GetCaster(),
        Ability = self:GetAbility(),
        vSpawnOrigin = self:GetCaster():GetAbsOrigin(),
        
        bDeleteOnHit = false,
        
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = DOTA_UNIT_TARGET_BASIC,
        
        EffectName = "particles/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell6.vpcf",
        fDistance = self.distance,
        fStartRadius = rad,
        fEndRadius = rad,
        vVelocity = self.StartDidection * self.distance * 2,
        }
    self:StartIntervalThink(0.49)
end

function modifier_npc_dota_hero_keeper_of_the_light_spell6:OnIntervalThink()
    EmitSoundOn("Hero_KeeperOfTheLight.Illuminate.Discharge", self:GetCaster())
    ProjectileManager:CreateLinearProjectile(self.projinfo)
end

function modifier_npc_dota_hero_keeper_of_the_light_spell6:GetStatusEffectName()
    return "particles/status_fx/status_effect_keeper_spirit_form.vpcf"
end

