npc_dota_hero_shredder_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_shredder_spell1","heroes/npc_dota_hero_shredder/npc_dota_hero_shredder_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_shredder_spell1_effect","heroes/npc_dota_hero_shredder/npc_dota_hero_shredder_spell1", LUA_MODIFIER_MOTION_NONE )


function npc_dota_hero_shredder_spell1:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_shredder_spell1", {duration = self:GetSpecialValueFor("duration")})
    EmitSoundOn("Hero_Shredder.Flamethrower", self:GetCaster())
end

modifier_npc_dota_hero_shredder_spell1 = class({})
--Classifications template
function modifier_npc_dota_hero_shredder_spell1:IsHidden()
    return false
end

function modifier_npc_dota_hero_shredder_spell1:IsDebuff()
    return false
end

function modifier_npc_dota_hero_shredder_spell1:IsPurgable()
    return false
end

function modifier_npc_dota_hero_shredder_spell1:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_shredder_spell1:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_shredder_spell1:OnCreated()
    if IsClient() then
        return
    end
    self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_shredder/shredder_flame_thrower.vpcf", PATTACH_POINT_FOLLOW, self:GetParent())
    ParticleManager:SetParticleControlEnt(self.pfx, 0, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
    ParticleManager:SetParticleControlForward(self.pfx, 3, self:GetCaster():GetForwardVector()*10)
    self.start_radius = self:GetAbility():GetSpecialValueFor("distance_start")
    self.end_radius = self:GetAbility():GetSpecialValueFor("distance_end")
    self:StartIntervalThink(0.5)
    self:OnIntervalThink()
end

function modifier_npc_dota_hero_shredder_spell1:OnDestroy()
    ParticleManager:DestroyParticle(self.pfx, false)
    ParticleManager:ReleaseParticleIndex(self.pfx)
end
function modifier_npc_dota_hero_shredder_spell1:OnIntervalThink()
    local forvard = self:GetCaster():GetForwardVector()
    local enemies = FindUnitsInCone(
    DOTA_TEAM_GOODGUYS,
    self:GetCaster():GetAbsOrigin() + (self:GetCaster():GetForwardVector() * 200):Length2D(),
    self:GetCaster():GetAbsOrigin(),
    self:GetCaster():GetAbsOrigin() + forvard*self.end_radius,
    self.start_radius,
    self.end_radius,
    nil,
    DOTA_UNIT_TARGET_TEAM_ENEMY,
    DOTA_UNIT_TARGET_BASIC,
    0,	-- nFlagFilter
    FIND_CLOSEST,
    false)
    for _,unit in pairs(enemies) do
        unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_shredder_spell1_effect", {duration = 1})
    end
end

modifier_npc_dota_hero_shredder_spell1_effect = class({})
--Classifications template
function modifier_npc_dota_hero_shredder_spell1_effect:IsHidden()
    return false
end

function modifier_npc_dota_hero_shredder_spell1_effect:IsDebuff()
    return true
end

function modifier_npc_dota_hero_shredder_spell1_effect:IsPurgable()
    return true
end

function modifier_npc_dota_hero_shredder_spell1_effect:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_shredder_spell1_effect:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_shredder_spell1_effect:GetEffectName()
    return "particles/units/heroes/hero_shredder/shredder_flame_thrower_debuff.vpcf"
end

function modifier_npc_dota_hero_shredder_spell1_effect:OnCreated()
    EmitSoundOn("Hero_Shredder.Flamethrower.Target", self:GetCaster())
    if IsClient() then
        return
    end
    self.damage = self:GetAbility():GetSpecialValueFor("damage") * 0.2
    self:StartIntervalThink(0.2)
    self:OnIntervalThink()
end

function modifier_npc_dota_hero_shredder_spell1_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage = self.damage,
    damage_type = self:GetAbility():GetAbilityDamageType(),
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end