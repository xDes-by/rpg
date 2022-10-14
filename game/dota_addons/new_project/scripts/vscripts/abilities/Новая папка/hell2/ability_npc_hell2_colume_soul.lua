ability_npc_hell2_colume_soul = class({})

LinkLuaModifier( "modifier_ability_npc_hell2_colume_soul","abilities/hell2/ability_npc_hell2_colume_soul", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell2_colume_soul_ally","abilities/hell2/ability_npc_hell2_colume_soul", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell2_colume_soul_effect","abilities/hell2/ability_npc_hell2_colume_soul", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell2_colume_soul:Spawn()
    if IsClient() then
        return
    end
    self.damage = 0
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_hell2_colume_soul", {})
end

modifier_ability_npc_hell2_colume_soul = class({})

--Classifications template
function modifier_ability_npc_hell2_colume_soul:IsHidden()
    return true
end

function modifier_ability_npc_hell2_colume_soul:IsPurgable()
    return false
end

function modifier_ability_npc_hell2_colume_soul:RemoveOnDeath()
   return true
end

function modifier_ability_npc_hell2_colume_soul:OnCreated()
    if IsClient() then
        return
    end
    self:GetCaster():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_hell2_colume_soul_ally", {})
end

-- Aura template
function modifier_ability_npc_hell2_colume_soul:IsAura()
    return true
end

function modifier_ability_npc_hell2_colume_soul:GetModifierAura()
    return "modifier_ability_npc_hell2_colume_soul_effect"
end

function modifier_ability_npc_hell2_colume_soul:GetAuraRadius()
    return 700
end

function modifier_ability_npc_hell2_colume_soul:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_hell2_colume_soul:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_hell2_colume_soul:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_hell2_colume_soul:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_hell2_colume_soul_effect = class({})
--Classifications template
function modifier_ability_npc_hell2_colume_soul_effect:IsHidden()
    return false
end

function modifier_ability_npc_hell2_colume_soul_effect:IsDebuff()
    return true
end

function modifier_ability_npc_hell2_colume_soul_effect:IsPurgable()
    return false
end

function modifier_ability_npc_hell2_colume_soul_effect:RemoveOnDeath()
    return true
end

function modifier_ability_npc_hell2_colume_soul_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_hell2_colume_soul_effect:OnCreated()
    self.abi = self:GetAbility()
    self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_death_prophet/death_prophet_spiritsiphon.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    ParticleManager:SetParticleControlEnt(self.particle, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetAbsOrigin(), true)
    ParticleManager:SetParticleControlEnt(self.particle, 1, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
    ParticleManager:SetParticleControl(self.particle, 5, Vector(999,0,0))
    self.damage = self:GetParent():GetMaxHealth() * 0.001
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.1)
end

function modifier_ability_npc_hell2_colume_soul_effect:OnDestroy()
    ParticleManager:DestroyParticle(self.particle, false)
    ParticleManager:ReleaseParticleIndex(self.particle)
end

function modifier_ability_npc_hell2_colume_soul_effect:OnIntervalThink()
    self.abi.damage = ApplyDamage({victim = self:GetParent(),
    damage = self.damage,
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()}) + self.abi.damage
end

modifier_ability_npc_hell2_colume_soul_ally = class({})
--Classifications template
function modifier_ability_npc_hell2_colume_soul_ally:IsHidden()
    return true
end

function modifier_ability_npc_hell2_colume_soul_ally:IsPurgable()
    return false
end

function modifier_ability_npc_hell2_colume_soul_ally:OnCreated()
    self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_death_prophet/death_prophet_spiritsiphon.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    ParticleManager:SetParticleControlEnt(self.particle, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetAbsOrigin(), true)
    ParticleManager:SetParticleControlEnt(self.particle, 1, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
    ParticleManager:SetParticleControl(self.particle, 5, Vector(999,0,0))
    if IsClient() then
        return
    end
    self:StartIntervalThink(1)
end

function modifier_ability_npc_hell2_colume_soul_ally:OnDestroy()
    ParticleManager:DestroyParticle(self.particle, false)
    ParticleManager:ReleaseParticleIndex(self.particle)
end


function modifier_ability_npc_hell2_colume_soul_ally:OnIntervalThink()
    	local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),	-- int, your team number
		self:GetParent():GetAbsOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		700,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_FRIENDLY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		0,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)
    local abi = self:GetAbility()
    local HealAmount = abi.damage / #enemies
    if HealAmount > 10 then
        for _,unit in pairs(enemies) do
            if unit ~= self:GetCaster() then
                local Deficit = unit:GetHealthDeficit()
                if Deficit <= HealAmount then
                    unit:Heal(HealAmount, abi)
                    abi.damage = abi.damage - HealAmount
                    SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, unit, HealAmount, nil)
                elseif Deficit ~= 0 then
                    unit:Heal(Deficit, abi)
                    abi.damage = abi.damage - Deficit
                    SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, unit, Deficit, nil)
                end
            end
        end
    end
end

