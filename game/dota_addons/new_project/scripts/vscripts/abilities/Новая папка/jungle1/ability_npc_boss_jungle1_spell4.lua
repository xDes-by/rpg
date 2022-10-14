ability_npc_boss_jungle1_spell4 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle1_spell4","abilities/jungle1/ability_npc_boss_jungle1_spell4", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_jungle1_spell4_armor","abilities/jungle1/ability_npc_boss_jungle1_spell4", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle1_spell4:OnSpellStart()
    self.damage = self:GetSpecialValueFor("damage")
    local mod = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_jungle1_spell4", {duration = 2.5})
    mod.direction = (self:GetCursorPosition() - self:GetCaster():GetAbsOrigin()):Normalized()
end

function ability_npc_boss_jungle1_spell4:OnProjectileHit(hTarget, vLocation)
    if hTarget then
        local mod = hTarget:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_jungle1_spell4_armor", {duration = 2.5})
        mod:IncrementStackCount()
        local count = mod:GetStackCount()
        ApplyDamage({victim = hTarget,
        damage = self.damage * count,
        damage_type = DAMAGE_TYPE_PHYSICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
    end
end

modifier_ability_npc_boss_jungle1_spell4 = class({})
--Classifications template
function modifier_ability_npc_boss_jungle1_spell4:IsHidden()
    return true
end

function modifier_ability_npc_boss_jungle1_spell4:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle1_spell4:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_jungle1_spell4:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_jungle1_spell4:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(1)
    self:OnIntervalThink()
end

function modifier_ability_npc_boss_jungle1_spell4:OnIntervalThink()
    self:GetCaster():StartGesture(ACT_DOTA_CAST_ABILITY_1)
    Timers:CreateTimer(0.4,function()
        ProjectileManager:CreateLinearProjectile({
            Source = self:GetCaster(),
            Ability = self:GetAbility(),
            vSpawnOrigin = self:GetCaster():GetAbsOrigin(),
            
            bDeleteOnHit = false,
            
            iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
            iUnitTargetType = DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO,
            
            EffectName = "particles/units/heroes/hero_tidehunter/tidehunter_gush_upgrade.vpcf",
            fDistance = 500,
            fStartRadius = 250,
            fEndRadius = 250,
            vVelocity = self.direction * 500,
        })
    end)
end

function modifier_ability_npc_boss_jungle1_spell4:CheckState()
    return {
        [MODIFIER_STATE_STUNNED] = true,
        [MODIFIER_STATE_INVULNERABLE] = true,
        [MODIFIER_STATE_NO_HEALTH_BAR] = true
    }
end

modifier_ability_npc_boss_jungle1_spell4_armor = class({})
--Classifications template
function modifier_ability_npc_boss_jungle1_spell4_armor:IsHidden()
    return false
end

function modifier_ability_npc_boss_jungle1_spell4_armor:IsPurgable()
    return true
end

function modifier_ability_npc_boss_jungle1_spell4_armor:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_jungle1_spell4_armor:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_jungle1_spell4_armor:OnCreated()
    self.armor = self:GetAbility():GetSpecialValueFor("armor")
end

function modifier_ability_npc_boss_jungle1_spell4_armor:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS
    }
end

function modifier_ability_npc_boss_jungle1_spell4_armor:GetModifierPhysicalArmorBonus()
    return -self:GetStackCount() * self.armor
end