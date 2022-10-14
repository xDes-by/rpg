ability_npc_boss_gaveyard3_spell6 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_gaveyard3_spell6","abilities/gaveyard3/ability_npc_boss_gaveyard3_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_gaveyard3_spell6_effect","abilities/gaveyard3/ability_npc_boss_gaveyard3_spell6", LUA_MODIFIER_MOTION_NONE )


function ability_npc_boss_gaveyard3_spell6:GetChannelAnimation()
    return ACT_DOTA_CAST_ABILITY_2
end

function ability_npc_boss_gaveyard3_spell6:GetChannelTime()
    return 7.6
end

function ability_npc_boss_gaveyard3_spell6:OnChannelFinish(bInterrupted)
    UTIL_Remove(self.unit2)
    UTIL_Remove(self.unit1)
end

function ability_npc_boss_gaveyard3_spell6:OnSpellStart()
    local pos = self:GetCaster():GetAbsOrigin()
    local direction = self:GetCaster():GetRightVector() * 200
    self.unit1 = CreateUnitByName("npc_boss_summon_gaveyard3", pos + direction, true, nil, nil, DOTA_TEAM_BADGUYS )
    self.unit1:SetForwardVector(self:GetCaster():GetForwardVector())
    self.unit1:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_gaveyard3_spell6", {})
    self.unit2 = CreateUnitByName("npc_boss_summon_gaveyard3", pos - direction, true, nil, nil, DOTA_TEAM_BADGUYS )
    self.unit2:SetForwardVector(self:GetCaster():GetForwardVector())
    self.unit2:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_gaveyard3_spell6", {})  
end

modifier_ability_npc_boss_gaveyard3_spell6 = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard3_spell6:IsHidden()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell6:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard3_spell6:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell6:OnCreated()
    self:StartIntervalThink(1.5)
    self:OnIntervalThink()
end

function modifier_ability_npc_boss_gaveyard3_spell6:OnIntervalThink()
    self:GetParent():StartGesture(ACT_DOTA_CAST_ABILITY_2)
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 400, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
    if #enemies ~= 0 then
        local unit = table.random(enemies)
        unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_boss_gaveyard3_spell6_effect", {duration = 1.4}) 
        local prt = ParticleManager:CreateParticle("particles/econ/items/necrolyte/necro_sullen_harvest/necro_ti7_immortal_scythe_start.vpcf", PATTACH_POINT_FOLLOW, unit)
        ParticleManager:SetParticleControlEnt(prt, 1, unit, PATTACH_POINT_FOLLOW, "follow_hitloc", unit:GetAbsOrigin(), true)
    end
end

function modifier_ability_npc_boss_gaveyard3_spell6:GetStatusEffectName()
	return "particles/status_fx/status_effect_wraithking_ghosts.vpcf"
end

modifier_ability_npc_boss_gaveyard3_spell6_effect = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard3_spell6_effect:IsHidden()
    return false
end

function modifier_ability_npc_boss_gaveyard3_spell6_effect:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard3_spell6_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell6_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell6_effect:OnDestroy()
    EmitSoundOn("Hero_Necrolyte.ReapersScythe.Target", self:GetParent())
    if IsClient() then
        return
    end
    ApplyDamage({victim = self:GetParent(),
    damage = self:GetAbility():GetSpecialValueFor("damage"),
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_ability_npc_boss_gaveyard3_spell6_effect:CheckState()
    return {
        [MODIFIER_STATE_STUNNED] = true
    }
end