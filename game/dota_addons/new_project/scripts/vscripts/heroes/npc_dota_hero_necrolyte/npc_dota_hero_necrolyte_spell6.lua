LinkLuaModifier( "modifier_npc_dota_hero_necrolyte_spell6", "heroes/npc_dota_hero_necrolyte/npc_dota_hero_necrolyte_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_necrolyte_spell6_blood", "heroes/npc_dota_hero_necrolyte/npc_dota_hero_necrolyte_spell6", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_necrolyte_spell6 = class({})

function npc_dota_hero_necrolyte_spell6:GetAOERadius()
	return self:GetSpecialValueFor("radius")
end

function npc_dota_hero_necrolyte_spell6:OnSpellStart()
	self:GetCaster():EmitSound("Hero_Necrolyte.ReapersScythe.Cast")
	self:GetCaster():EmitSound("Hero_Necrolyte.ReapersScythe.Target")
	self.cpos = self:GetCursorPosition()
	self.target = CreateModifierThinker(self:GetCaster(), self, "modifier_npc_dota_hero_necrolyte_spell6", {duration = 4}, self.cpos, self:GetCaster():GetTeamNumber(), false)
end

----------------------------------------------------------------------------

modifier_npc_dota_hero_necrolyte_spell6 = class({})

function modifier_npc_dota_hero_necrolyte_spell6:OnCreated()
	self.fear_duration	= self:GetAbility():GetSpecialValueFor("duration_fear")
	self.blood	= self:GetAbility():GetSpecialValueFor("duration_blood")
	self.radius = self:GetAbility():GetSpecialValueFor("radius")
	if not IsServer() then return end
	self.bLaunched = false
	self.feared_units = {}
	self.fear_modifier	= nil
	
	self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_necrolyte_spell6:OnIntervalThink()
	if not self.bLaunched then
	    local projectile_direction = (self:GetAbility().cpos - self:GetCaster():GetAbsOrigin()):Normalized()
		local pfx = ParticleManager:CreateParticle("particles/econ/items/necrolyte/necronub_scythe/necrolyte_scythe_ka_model.vpcf", PATTACH_POINT, self:GetCaster())
		ParticleManager:SetParticleControl(pfx, 0, projectile_direction)
		ParticleManager:SetParticleControl(pfx, 1, self:GetAbility().cpos)
		ParticleManager:ReleaseParticleIndex(pfx)
	
		
		self.bLaunched = true
		Timers:CreateTimer(0.5,function()
			local wave_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_terrorblade/terrorblade_scepter.vpcf", PATTACH_WORLDORIGIN, self:GetAbility().target)
			ParticleManager:SetParticleControl(wave_particle, 0, self:GetAbility().target:GetAbsOrigin())
			ParticleManager:SetParticleControl(wave_particle, 1, Vector(self.radius, self.radius, self.radius))
			ParticleManager:SetParticleControl(wave_particle, 2, Vector(self.radius, self.radius, self.radius))
			ParticleManager:ReleaseParticleIndex(wave_particle)
			
			self:StartIntervalThink(-1)
			self:StartIntervalThink(FrameTime())
		end)
	else
		for _, enemy in pairs(FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self:GetParent():GetAbsOrigin(), nil, math.min(self.radius * (self:GetElapsedTime()), self.radius), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)) do
			if not self.feared_units[enemy:entindex()] and (enemy:GetAbsOrigin() - self:GetParent():GetAbsOrigin()):Length2D() <= math.min(self.radius * (self:GetElapsedTime()), self.radius) - 50 then
				enemy:EmitSound("Hero_Terrorblade.Metamorphosis.Fear")
				self.fear_modifier = enemy:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_terrorblade_fear", {duration = self.fear_duration})
				
				if self.fear_modifier then
					self.fear_modifier:SetDuration(self.fear_duration * (1 - enemy:GetStatusResistance()), true)
				end
				
				if not enemy:HasModifier('modifier_npc_dota_hero_necrolyte_spell6_blood') then 
					enemy:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_necrolyte_spell6_blood", {duration = self.blood})
				end
				
				self.feared_units[enemy:entindex()] = true
			end
		end
	end
end

-------------------------------------------------------

modifier_npc_dota_hero_necrolyte_spell6_blood = class({})

function modifier_npc_dota_hero_necrolyte_spell6_blood:IsHidden()
	return false
end

function modifier_npc_dota_hero_necrolyte_spell6_blood:IsDebuff()
	return true
end

function modifier_npc_dota_hero_necrolyte_spell6_blood:IsStunDebuff()
	return false
end

function modifier_npc_dota_hero_necrolyte_spell6_blood:IsPurgable()
	return true
end

function modifier_npc_dota_hero_necrolyte_spell6_blood:OnCreated( kv )
	self.damage = self:GetAbility():GetSpecialValueFor( "damage" )
	self:StartIntervalThink( 0.1 )
end

function modifier_npc_dota_hero_necrolyte_spell6_blood:OnRefresh( kv )
	self.damage = self:GetAbility():GetSpecialValueFor( "damage" )
end

function modifier_npc_dota_hero_necrolyte_spell6_blood:OnIntervalThink()
	if not IsServer() then return end
	
	SendOverheadEventMessage( self:GetParent():GetPlayerOwner(), OVERHEAD_ALERT_DAMAGE  ,self:GetParent(), self.damage/10, nil )
	
	self.damageTable = {
		victim = self:GetParent(),
		attacker = self:GetCaster(),
		damage = self.damage/10,
		damage_type = self:GetAbility():GetAbilityDamageType(),
		ability = self:GetAbility(),
	}
	ApplyDamage( self.damageTable )
end

function modifier_npc_dota_hero_necrolyte_spell6_blood:GetEffectName()
	return "particles/units/heroes/hero_bloodseeker/blood_gore_arterial_drip_2.vpcf"
end

function modifier_npc_dota_hero_necrolyte_spell6_blood:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end