ability_npc_boss_cave3_spell3 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_cave3_spell3","abilities/cave3/ability_npc_boss_cave3_spell3", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_cave3_spell3:GetChannelTime()
    return 2
end

function ability_npc_boss_cave3_spell3:GetChannelAnimation()
    return ACT_DOTA_TELEPORT
end

function ability_npc_boss_cave3_spell3:OnChannelFinish(bInterrupted)
    if not bInterrupted then
        self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_cave3_spell3", {}):SetStackCount(5)
    end
end

function ability_npc_boss_cave3_spell3:OnSpellStart()
    ParticleManager:CreateParticle("particles/econ/events/ti9/ti9_teleport_teams/teleport_team_flair_ti9_ground_lvl1.vpcf", PATTACH_POINT, self:GetCaster())
end

modifier_ability_npc_boss_cave3_spell3 = class({})
--Classifications template
function modifier_ability_npc_boss_cave3_spell3:IsHidden()
    return false
end

function modifier_ability_npc_boss_cave3_spell3:IsDebuff()
    return false
end

function modifier_ability_npc_boss_cave3_spell3:IsPurgable()
    return true
end

function modifier_ability_npc_boss_cave3_spell3:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_cave3_spell3:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_cave3_spell3:OnCreated()
    self.pfx = ParticleManager:CreateParticle("particles/ability_npc_boss_cave3_spell3.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetCaster())
    ParticleManager:SetParticleControlEnt(self.pfx, 0, self:GetParent(), PATTACH_OVERHEAD_FOLLOW, "follow_overhead", self:GetParent():GetAbsOrigin(), true)
    ParticleManager:SetParticleControl(self.pfx, 1, Vector(0, 5, 0))
	self:AddParticle(
		self.pfx,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)
end

function modifier_ability_npc_boss_cave3_spell3:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE
    }
end

function modifier_ability_npc_boss_cave3_spell3:GetModifierPreAttack_CriticalStrike(data)
    if self:GetStackCount() ~= 0 then
        ParticleManager:SetParticleControl(self.pfx, 1, Vector(0, self:GetStackCount(), 0))
        self:DecrementStackCount()
    else
        self:Destroy()
    end
    return self:GetAbility():GetSpecialValueFor("damage")
end
