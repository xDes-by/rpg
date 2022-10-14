npc_dota_hero_tinker_spell6 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_tinker_spell6","heroes/npc_dota_hero_tinker/npc_dota_hero_tinker_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_tinker_spell6_march","heroes/npc_dota_hero_tinker/npc_dota_hero_tinker_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_tinker_spell6_lather","heroes/npc_dota_hero_tinker/npc_dota_hero_tinker_spell6", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_tinker_spell6:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_tinker_spell6", {duration = self:GetSpecialValueFor("cast_duration")})
end

function npc_dota_hero_tinker_spell6:OnProjectileHit(hTarget, vLocation)
    if hTarget then
        ApplyDamage({victim = hTarget,
        damage =  self:GetSpecialValueFor("base_march_damage"),
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
        hTarget:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_tinker_spell6_march", {duration = self:GetSpecialValueFor("march_slow_duration")})
        return true
    end
end

modifier_npc_dota_hero_tinker_spell6 = class({})
--Classifications template
function modifier_npc_dota_hero_tinker_spell6:IsHidden()
    return false
end

function modifier_npc_dota_hero_tinker_spell6:IsPurgable()
    return false
end

function modifier_npc_dota_hero_tinker_spell6:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_tinker_spell6:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_tinker_spell6:OnCreated()
    self.slow = self:GetAbility():GetSpecialValueFor("cast_slow")
    if IsClient() then
        return
    end
    self.attach = self:GetCaster():ScriptLookupAttachment( "ArbitraryChain8_plc8" )
    self:GetCaster():StartGesture(ACT_DOTA_VICTORY)
    self:StartIntervalThink(0.5)
    self.proc = 0
end

function modifier_npc_dota_hero_tinker_spell6:OnDestroy()
    if IsClient() then
        return
    end
    self:GetCaster():FadeGesture(ACT_DOTA_VICTORY)
end

function modifier_npc_dota_hero_tinker_spell6:OnIntervalThink()
    self.proc = self.proc + 1
    if self.proc ~= 4 then
        self:CreateMarch()
    else
        self:CreateLather()
        self.proc = 0
    end
end

function modifier_npc_dota_hero_tinker_spell6:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_DISABLE_TURNING,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_EVENT_ON_ORDER
    }
end

function modifier_npc_dota_hero_tinker_spell6:GetModifierDisableTurning()
    return 1
end

function modifier_npc_dota_hero_tinker_spell6:GetModifierMoveSpeedBonus_Percentage()
    return -self.slow
end

function modifier_npc_dota_hero_tinker_spell6:OnOrder(data)
    if data.unit == self:GetParent() then
        for i=5,10 do
            if data.order_type == i then
                self:Destroy()
            end
        end
    end
end

function modifier_npc_dota_hero_tinker_spell6:CreateMarch()
    ProjectileManager:CreateLinearProjectile({
        Source = self:GetCaster(),
        Ability = self:GetAbility(),
        vSpawnOrigin = self:GetCaster():GetAbsOrigin(),
        
        bDeleteOnHit = false,
        
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = DOTA_UNIT_TARGET_BASIC,
        
        EffectName = "particles/econ/items/tinker/tinker_motm_rollermaw/tinker_rollermaw.vpcf",
        fDistance = self:GetAbility():GetSpecialValueFor("march_distance"),
        fStartRadius = 150,
        fEndRadius = 150,
        vVelocity = self:GetCaster():GetForwardVector() * self:GetAbility():GetSpecialValueFor("march_distance"),

        bReplaceExisting = false,
        
        bProvidesVision = false,
        --iVisionRadius = vision_radius,
        --iVisionTeamNumber = caster:GetTeamNumber(),
    })
    EmitSoundOn("Hero_Tinker.MissileAnim", self:GetCaster())
end

function modifier_npc_dota_hero_tinker_spell6:CreateLather()
    local pos = self:GetCaster():GetAbsOrigin()
    local units = FindUnitsInLine(
    DOTA_TEAM_GOODGUYS,
    pos,
    pos + self:GetCaster():GetForwardVector() * 600,
    nil,
    self:GetAbility():GetSpecialValueFor("march_distance"),
    DOTA_UNIT_TARGET_TEAM_ENEMY,
    DOTA_UNIT_TARGET_BASIC,
    0)

    if units[1] == nil then 
        return
    end

    self.farest = units[1]
    self.len = 0
    for _,unit in pairs(units) do
        local lenmy = (self.farest:GetAbsOrigin() - pos):Length2D()
        if lenmy > self.len then
            self.farest = unit
            self.len = lenmy
        end
    end
    EmitSoundOn("Hero_Tinker.Laser", self.farest)
    EmitSoundOn("Hero_Tinker.LaserImpact", self.farest)
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self.farest:GetAbsOrigin(), nil, self:GetAbility():GetSpecialValueFor("lather_radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    local laser_pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_tinker/tinker_laser.vpcf", PATTACH_CUSTOMORIGIN, caster)	
    ParticleManager:SetParticleControlEnt(laser_pfx, 0, self:GetParent(), self.attach, "ArbitraryChain8_plc8", self:GetParent():GetAbsOrigin(), true)
    ParticleManager:SetParticleControl(laser_pfx, 1, self.farest:GetAbsOrigin())
    ParticleManager:SetParticleControlEnt(laser_pfx, 3, self:GetParent(), self.attach, "ArbitraryChain8_plc8", self:GetParent():GetAbsOrigin(), true)
    ParticleManager:SetParticleControlEnt(laser_pfx, 9, self:GetParent(), self.attach, "ArbitraryChain8_plc8", self:GetParent():GetAbsOrigin(), true)
    self.farest = nil
    self.len = 0
    if IsClient() then
        return
    end
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage =  self:GetAbility():GetSpecialValueFor("lather_damage"),
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
        unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_tinker_spell6_lather", {duration = self:GetSpecialValueFor("lather_miss_duration")})
    end
end

modifier_npc_dota_hero_tinker_spell6_march = class({})
--Classifications template
function modifier_npc_dota_hero_tinker_spell6_march:IsHidden()
    return false
end

function modifier_npc_dota_hero_tinker_spell6_march:IsDebuff()
    return true
end

function modifier_npc_dota_hero_tinker_spell6_march:IsPurgable()
    return true
end

function modifier_npc_dota_hero_tinker_spell6_march:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_tinker_spell6_march:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_tinker_spell6_march:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
    }
end

function modifier_npc_dota_hero_tinker_spell6_march:GetModifierMoveSpeedBonus_Percentage()
    return -self:GetAbility():GetSpecialValueFor("march_slow")
end

modifier_npc_dota_hero_tinker_spell6_lather = class({})
--Classifications template
function modifier_npc_dota_hero_tinker_spell6_lather:IsHidden()
    return false
end

function modifier_npc_dota_hero_tinker_spell6_lather:IsDebuff()
    return true
end

function modifier_npc_dota_hero_tinker_spell6_lather:IsPurgable()
    return true
end

function modifier_npc_dota_hero_tinker_spell6_lather:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_tinker_spell6_lather:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_tinker_spell6_lather:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MISS_PERCENTAGE
    }
end

function modifier_npc_dota_hero_tinker_spell6_lather:GetModifierMiss_Percentage()
    return -self:GetAbility():GetSpecialValueFor("lather_miss")
end