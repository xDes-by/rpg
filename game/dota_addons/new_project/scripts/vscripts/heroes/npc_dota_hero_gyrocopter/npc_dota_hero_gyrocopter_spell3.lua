npc_dota_hero_gyrocopter_spell3 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_gyrocopter_spell3", "heroes/npc_dota_hero_gyrocopter/npc_dota_hero_gyrocopter_spell3", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_gyrocopter_spell3:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_gyrocopter_spell3", {duration = self:GetSpecialValueFor("daratuion")})    
end

modifier_npc_dota_hero_gyrocopter_spell3 = class({})
--Classifications template
function modifier_npc_dota_hero_gyrocopter_spell3:IsHidden()
    return false
end

function modifier_npc_dota_hero_gyrocopter_spell3:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_gyrocopter_spell3:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_gyrocopter_spell3:OnCreated()
    self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_gyrocopter/gyro_flak_cannon_overhead_model.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetCaster())
    ParticleManager:SetParticleControlEnt(self.pfx, 1, self:GetCaster(), PATTACH_POINT_FOLLOW, "follow_overhead", self:GetCaster():GetAbsOrigin(), true)
    EmitSoundOn("Hero_Gyrocopter.FlackCannon.Activate", self:GetCaster())
    if IsClient() then
        return
    end
    self.damage = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) / 2
    self:StartIntervalThink(0.5)
end

function modifier_npc_dota_hero_gyrocopter_spell3:OnDestroy()
    ParticleManager:DestroyParticle(self.pfx, false)
    ParticleManager:ReleaseParticleIndex(self.pfx)
    if IsClient() then
        return
    end
    self:GetCaster():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_disarmed", {duration = 1})
end

function modifier_npc_dota_hero_gyrocopter_spell3:OnIntervalThink()
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetParent():GetAbsOrigin(), nil, self:GetCaster():Script_GetAttackRange(), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    if #enemies > 0 then
        self:GetCaster():PerformAttack(table.random(enemies), false, false, true, false, true, false, true)
    end
end
