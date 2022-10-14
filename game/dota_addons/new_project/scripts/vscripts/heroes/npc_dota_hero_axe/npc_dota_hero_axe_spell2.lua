LinkLuaModifier( "modifier_npc_dota_hero_axe_spell2", "heroes/npc_dota_hero_axe/npc_dota_hero_axe_spell2", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_axe_spell2 = class({})

function npc_dota_hero_axe_spell2:OnSpellStart()
	local sound_cast = "Hero_Axe.Berserkers_Call"
	EmitSoundOn( sound_cast, self:GetCaster() )
	CreateModifierThinker(self:GetCaster(), self, "modifier_npc_dota_hero_axe_spell2", {duration = 0.1 + (450 / 1400)}, self:GetCaster():GetAbsOrigin(), self:GetCaster():GetTeamNumber(), false)
end

-----------------------------------

modifier_npc_dota_hero_axe_spell2 = class({})

function modifier_npc_dota_hero_axe_spell2:OnCreated()
	if not self:GetAbility() then self:Destroy() return end
	
	self.fear_duration	= self:GetAbility():GetSpecialValueFor("duration")
	self.radius			= self:GetAbility():GetSpecialValueFor("radius")
	self.spawn_delay	= self:GetAbility():GetSpecialValueFor("spawn_delay")
	
	if not IsServer() then return end
	
	self.bLaunched		= false
	self.feared_units	= {}
	self.fear_modifier	= nil
	
	self:StartIntervalThink(0.1)
end

function modifier_npc_dota_hero_axe_spell2:OnIntervalThink()
	if not self.bLaunched then
		self.bLaunched = true
		
		local wave_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_terrorblade/terrorblade_scepter.vpcf", PATTACH_WORLDORIGIN, self:GetParent())
		ParticleManager:SetParticleControl(wave_particle, 0, self:GetParent():GetAbsOrigin())
		ParticleManager:SetParticleControl(wave_particle, 1, Vector(self.radius, self.radius, self.radius))
		ParticleManager:SetParticleControl(wave_particle, 2, Vector(self.radius, self.radius, self.radius))
		ParticleManager:ReleaseParticleIndex(wave_particle)
		
		self:StartIntervalThink(-1)
		self:StartIntervalThink(FrameTime())
	else
		for _, enemy in pairs(FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self:GetParent():GetAbsOrigin(), nil, math.min(self.radius * (self:GetElapsedTime() - self.spawn_delay), self.radius), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)) do
			if not self.feared_units[enemy:entindex()] and (enemy:GetAbsOrigin() - self:GetParent():GetAbsOrigin()):Length2D() >= math.min(self.radius * (self:GetElapsedTime() - self.spawn_delay), self.radius) - 50 then
				enemy:EmitSound("Hero_Terrorblade.Metamorphosis.Fear")
				
				self.fear_modifier = enemy:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_terrorblade_fear", {duration = self.fear_duration})
				
				if self.fear_modifier then
					self.fear_modifier:SetDuration(self.fear_duration * (1 - enemy:GetStatusResistance()), true)
				end
				
				self.feared_units[enemy:entindex()] = true
			end
		end
	end
end