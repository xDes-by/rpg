ability_npc_boss_gaveyard3_spell2 = class({})

LinkLuaModifier("modifier_ability_npc_boss_gaveyard3_spell2", "abilities/gaveyard3/ability_npc_boss_gaveyard3_spell2", LUA_MODIFIER_MOTION_NONE)


function ability_npc_boss_gaveyard3_spell2:OnSpellStart()
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetCaster():GetAbsOrigin(), nil, 400, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0,false)
    for num,unit in pairs(enemies) do
        if num <= 3 then
            unit:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_gaveyard3_spell2", {})
        end
    end
    EmitSoundOn("Hero_DeathProphet.SpiritSiphon.Cast", self:GetCaster())
end

modifier_ability_npc_boss_gaveyard3_spell2 = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard3_spell2:IsHidden()
    return false
end

function modifier_ability_npc_boss_gaveyard3_spell2:IsDebuff()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell2:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard3_spell2:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell2:OnCreated()
    EmitSoundOn("Hero_DeathProphet.SpiritSiphon.Target", self:GetCaster())
    self.particle_drain_fx = ParticleManager:CreateParticle("particles/units/heroes/hero_pugna/pugna_life_drain.vpcf", PATTACH_ABSORIGIN, self:GetCaster())
    ParticleManager:SetParticleControlEnt(self.particle_drain_fx, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetAbsOrigin(), true)
    ParticleManager:SetParticleControlEnt(self.particle_drain_fx, 1, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.2)
end

function modifier_ability_npc_boss_gaveyard3_spell2:OnDestroy()
    ParticleManager:DestroyParticle(self.particle_drain_fx, false)
    ParticleManager:ReleaseParticleIndex(self.particle_drain_fx)
end

function modifier_ability_npc_boss_gaveyard3_spell2:OnIntervalThink()
    if (self:GetParent():GetAbsOrigin() - self:GetCaster():GetAbsOrigin()):Length2D() > 500 then
        self:Destroy()
        return
    end
    ApplyDamage({victim = self:GetParent(),
    damage =  self:GetAbility():GetSpecialValueFor("damage")* 0.01 * self:GetParent():GetHealth(),
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
    self:GetCaster():Heal(self:GetCaster():GetMaxHealth() * 0.01, self:GetAbility())
end