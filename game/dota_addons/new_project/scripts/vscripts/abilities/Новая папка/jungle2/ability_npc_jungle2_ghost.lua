ability_npc_jungle2_ghost = class({})

LinkLuaModifier( "modifier_ability_npc_jungle2_ghost_target", "abilities/jungle2/ability_npc_jungle2_ghost", LUA_MODIFIER_MOTION_NONE )

function ability_npc_jungle2_ghost:OnSpellStart()
    local TargetModifier = self:GetCursorTarget():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_jungle2_ghost_target", {duration = 5})
end

modifier_ability_npc_jungle2_ghost_target = class({})
--Classifications template
function modifier_ability_npc_jungle2_ghost_target:IsHidden()
   return false
end

function modifier_ability_npc_jungle2_ghost_target:IsDebuff()
   return true
end

function modifier_ability_npc_jungle2_ghost_target:IsPurgable()
   return true
end

function modifier_ability_npc_jungle2_ghost_target:RemoveOnDeath()
   return true
end

function modifier_ability_npc_jungle2_ghost_target:DestroyOnExpire()
    return true
end

function modifier_ability_npc_jungle2_ghost_target:OnCreated()
    self.particle_drain_fx = ParticleManager:CreateParticle("particles/units/heroes/hero_pugna/pugna_life_drain.vpcf", PATTACH_ABSORIGIN, self:GetCaster())
    ParticleManager:SetParticleControlEnt(self.particle_drain_fx, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetAbsOrigin(), true)
    ParticleManager:SetParticleControlEnt(self.particle_drain_fx, 1, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.1)
end

function modifier_ability_npc_jungle2_ghost_target:OnDestroy()
    ParticleManager:DestroyParticle(self.particle_drain_fx, false)
	ParticleManager:ReleaseParticleIndex(self.particle_drain_fx)
end

function modifier_ability_npc_jungle2_ghost_target:OnIntervalThink()
    if self:GetCaster():IsStunned() or self:GetCaster():IsSilenced() then
        self:Destroy()
    end
    if self:GetParent():IsInvulnerable() or self:GetParent():IsMagicImmune() then
        self:Destroy()
    end
    ApplyDamage({victim = self:GetParent(),
    damage =  self:GetAbility():GetSpecialValueFor("damage"),
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_ability_npc_jungle2_ghost_target:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_TAKEDAMAGE
    }
end

function modifier_ability_npc_jungle2_ghost_target:OnTakeDamage(data)
    if data.attacker == self:GetCaster() and data.inflictor and data.inflictor == self:GetAbility() then
        self:GetCaster():Heal(data.damage, self:GetAbility())
    end
end
