npc_dota_hero_leshrac_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_leshrac_spell1", "heroes/npc_dota_hero_leshrac/npc_dota_hero_leshrac_spell1", LUA_MODIFIER_MOTION_NONE)

function npc_dota_hero_leshrac_spell1:OnSpellStart()
    local pos = self:GetCaster():GetAbsOrigin()
    local dis = self:GetCaster():GetForwardVector() * self:GetSpecialValueFor("distanse")
    local delay = self:GetSpecialValueFor("delay")
    local dur = self:GetSpecialValueFor("slow_duration")
	local particle_start_fx = ParticleManager:CreateParticle("particles/units/heroes/hero_elder_titan/elder_titan_earth_splitter.vpcf", PATTACH_WORLDORIGIN, caster)
	ParticleManager:SetParticleControl(particle_start_fx, 0, pos)
	ParticleManager:SetParticleControl(particle_start_fx, 1, self:GetCaster():GetForwardVector() * self:GetSpecialValueFor("distanse") )
	ParticleManager:SetParticleControl(particle_start_fx, 3, Vector(0, delay, 0))
    EmitSoundOn("Hero_ElderTitan.EarthSplitter.Cast", self:GetCaster())
    local abi = self
    local caster = self:GetCaster()
    Timers:CreateTimer(delay,function()
        local units = FindUnitsInLine( DOTA_TEAM_GOODGUYS, pos, pos + dis, nil, 150, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0)
        for _,unit in pairs(units) do
            unit:AddNewModifier(caster, abi, "modifier_npc_dota_hero_leshrac_spell1", {duration = dur})
        end
        EmitSoundOn("Hero_ElderTitan.EarthSplitter.Destroy", caster)
    end)
end

modifier_npc_dota_hero_leshrac_spell1 = class({})
--Classifications template
function modifier_npc_dota_hero_leshrac_spell1:IsHidden()
    return false
end

function modifier_npc_dota_hero_leshrac_spell1:IsDebuff()
    return true
end

function modifier_npc_dota_hero_leshrac_spell1:IsPurgable()
    return true
end

function modifier_npc_dota_hero_leshrac_spell1:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_leshrac_spell1:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_leshrac_spell1:OnCreated(kv)
    if IsClient() then
        return
    end
    self.slow = self:GetAbility():GetSpecialValueFor("slow")
    ApplyDamage({victim = self:GetParent(),
    damage =  self:GetAbility():GetSpecialValueFor("damage"),
    damage_type = self:GetAbility():GetAbilityDamageType(),
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_npc_dota_hero_leshrac_spell1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
    }
end

function modifier_npc_dota_hero_leshrac_spell1:GetModifierMoveSpeedBonus_Percentage()
    return self.slow
end