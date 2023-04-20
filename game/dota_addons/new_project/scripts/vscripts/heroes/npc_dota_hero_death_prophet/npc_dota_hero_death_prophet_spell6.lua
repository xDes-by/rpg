LinkLuaModifier( "modifier_npc_dota_hero_death_prophet_spell6","heroes/npc_dota_hero_death_prophet/npc_dota_hero_death_prophet_spell6", LUA_MODIFIER_MOTION_BOTH )
LinkLuaModifier( "modifier_npc_dota_hero_death_prophet_spell6_sifon","heroes/npc_dota_hero_death_prophet/npc_dota_hero_death_prophet_spell6", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_death_prophet_spell6 = class({})

function npc_dota_hero_death_prophet_spell6:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_death_prophet_spell6", {duration = self:GetSpecialValueFor("duration")})
end

----------------------------------------------------------------

modifier_npc_dota_hero_death_prophet_spell6 = class({})

function modifier_npc_dota_hero_death_prophet_spell6:IsHidden() 
	return true 
end

function modifier_npc_dota_hero_death_prophet_spell6:IsPurgable() 
	return false 
end

function modifier_npc_dota_hero_death_prophet_spell6:OnCreated()
    self.incom_damage = self:GetAbility():GetSpecialValueFor("incom_damage")
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
	self.units = {}
	if not IsServer() then return end
	EmitSoundOn("Hero_DeathProphet.Exorcism", self:GetCaster())
	
	self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_death_prophet_spell6:OnDestroy()
	StopSoundOn("Hero_DeathProphet.Exorcism", self:GetCaster())
	for _,unit in pairs(self.units) do
		if unit:HasModifier("modifier_npc_dota_hero_death_prophet_spell6_sifon") then
			unit:FindModifierByName("modifier_npc_dota_hero_death_prophet_spell6_sifon"):Destroy()
		end
	end
end

function modifier_npc_dota_hero_death_prophet_spell6:OnIntervalThink()
	local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self:GetCaster():GetAbsOrigin(), nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
	for _,unit in pairs(enemies) do
		if not unit:HasModifier("modifier_npc_dota_hero_death_prophet_spell6_sifon") then
			unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_death_prophet_spell6_sifon", {})
			table.insert( self.units, unit )
		end
	end
end

function modifier_npc_dota_hero_death_prophet_spell6:DeclareFunctions()
    return {
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
    }
end

function modifier_npc_dota_hero_death_prophet_spell6:GetModifierIncomingDamage_Percentage()
	return -self.incom_damage
end

-------------------------------------------------------------------

modifier_npc_dota_hero_death_prophet_spell6_sifon = class({})

function modifier_npc_dota_hero_death_prophet_spell6_sifon:IsHidden()
	return false
end

function modifier_npc_dota_hero_death_prophet_spell6_sifon:IsDebuff()
	return true
end

function modifier_npc_dota_hero_death_prophet_spell6_sifon:IsPurgable()
	return false
end

function modifier_npc_dota_hero_death_prophet_spell6_sifon:RemoveOnDeath()
	return true
end

function modifier_npc_dota_hero_death_prophet_spell6_sifon:DestroyOnExpire()
	return true
end

function modifier_npc_dota_hero_death_prophet_spell6_sifon:OnCreated(kv)
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
	self.damage = self:GetAbility():GetSpecialValueFor("damage") / 10
	self.regen = self:GetAbility():GetSpecialValueFor("regen")
	self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_death_prophet/death_prophet_spiritsiphon.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    ParticleManager:SetParticleControlEnt(self.particle, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetAbsOrigin(), true)
    ParticleManager:SetParticleControlEnt(self.particle, 1, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
    ParticleManager:SetParticleControl(self.particle, 5, Vector(5,0,0))
	EmitSoundOn("Hero_DeathProphet.SpiritSiphon.Cast", self:GetCaster())
	if not IsServer() then return end
	self.count = 0
	self.abi = self:GetCaster():FindAbilityByName("npc_dota_hero_death_prophet_spell3")
	self:StartIntervalThink(0.1)
end

function modifier_npc_dota_hero_death_prophet_spell6_sifon:OnDestroy()
	ParticleManager:DestroyParticle(self.particle, false)
	ParticleManager:ReleaseParticleIndex(self.particle)
	StopSoundOn("Hero_DeathProphet.SpiritSiphon.Cast", self:GetCaster())
end

function modifier_npc_dota_hero_death_prophet_spell6_sifon:OnIntervalThink()

	self.count = self.count + 1
	if self.abi:GetLevel() > 0 and self.count == 10 then
		self.abi:CreateGhost(self:GetParent())
		self.count = 0
	end

	if (self:GetCaster():GetAbsOrigin() - self:GetParent():GetAbsOrigin()):Length2D() > self.radius then
		self:Destroy()
	end
	ApplyDamage({victim = self:GetParent(),
	damage =  self.damage,
	damage_type = DAMAGE_TYPE_MAGICAL,
	damage_flags = DOTA_DAMAGE_FLAG_NONE,
	attacker = self:GetCaster(),
	ability = self:GetAbility()})
	
	self:GetCaster():Heal(self.damage/100*self.regen, self:GetAbility())
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetCaster(), self.damage/100*self.regen, nil)
end