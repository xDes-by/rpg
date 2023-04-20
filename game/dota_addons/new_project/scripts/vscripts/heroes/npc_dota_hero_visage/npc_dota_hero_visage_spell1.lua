LinkLuaModifier( "modifier_npc_dota_hero_visage_spell1_cyclone", "heroes/npc_dota_hero_visage/npc_dota_hero_visage_spell1", LUA_MODIFIER_MOTION_BOTH )

npc_dota_hero_visage_spell1 = class({})

function npc_dota_hero_visage_spell1:OnSpellStart()
    if not IsServer() then return end
    self:GetCursorTarget():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_visage_spell1_cyclone", {duration = self:GetSpecialValueFor("duration")})
end

---------------------------------------------------------------------------------

modifier_npc_dota_hero_visage_spell1_cyclone = class({})

function modifier_npc_dota_hero_visage_spell1_cyclone:IsDebuff() 
	return false 
end

function modifier_npc_dota_hero_visage_spell1_cyclone:IsHidden() 
	return false 
end

function modifier_npc_dota_hero_visage_spell1_cyclone:IsPurgable() 
	return true 
end

function modifier_npc_dota_hero_visage_spell1_cyclone:IsStunDebuff() 
	return true 
end

function modifier_npc_dota_hero_visage_spell1_cyclone:IsMotionController()  
	return true 
end

function modifier_npc_dota_hero_visage_spell1_cyclone:GetMotionControllerPriority()  
	return DOTA_MOTION_CONTROLLER_PRIORITY_HIGH
end

function modifier_npc_dota_hero_visage_spell1_cyclone:OnCreated()
    self.regen = self:GetAbility():GetSpecialValueFor("regen")
	if IsServer() then
        if not self:GetAbility() then self:Destroy() end
    end

	self:StartIntervalThink(FrameTime())
	EmitSoundOn("DOTA_Item.Cyclone.Activate", self:GetParent())
	if IsServer() then
		self:GetParent():StartGesture(ACT_DOTA_FLAIL)
		self.angle = self:GetParent():GetAngles()
		self.start = self:GetParent():GetAbsOrigin()
		self.start_z = self.start.z 

		self.pfx_name = "particles/econ/events/fall_2022/cyclone/cyclone_fall2022.vpcf"
		self.pfx = ParticleManager:CreateParticle(self.pfx_name, PATTACH_CUSTOMORIGIN, self:GetParent())
		ParticleManager:SetParticleControl(self.pfx, 0, self.start)
	end
end

function modifier_npc_dota_hero_visage_spell1_cyclone:OnIntervalThink()
    if not IsServer() then return end
	self:HorizontalMotion(self:GetParent(), FrameTime())
end

function modifier_npc_dota_hero_visage_spell1_cyclone:HorizontalMotion(unit, time)
	if not IsServer() then return end
	self.cyc_pos = self:GetParent():GetAbsOrigin()
	if self:GetElapsedTime() <= 0.3 then
		self.cyc_pos.z = self.cyc_pos.z + 40
		self:GetParent():SetAbsOrigin(self.cyc_pos)
		self.z_fly = self.cyc_pos.z
	elseif self:GetDuration() - self:GetElapsedTime() < 0.3 and not self:GetParent():IsMoving() then
		self.step = self.step or (self.cyc_pos.z - self.start_z) / ((self:GetDuration() - self:GetElapsedTime()) / FrameTime())
		self.cyc_pos.z = self.cyc_pos.z - self.step
		self:GetParent():SetAbsOrigin(self.cyc_pos)
	end	
end

function modifier_npc_dota_hero_visage_spell1_cyclone:OnDestroy()
	StopSoundOn("DOTA_Item.Cyclone.Activate", self:GetParent())
	if not IsServer() then return end
	ParticleManager:DestroyParticle(self.pfx, false)
	ParticleManager:ReleaseParticleIndex(self.pfx)
	self:GetParent():FadeGesture(ACT_DOTA_FLAIL)
	
	local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self:GetParent():GetAbsOrigin(), nil, self:GetAbility():GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, 0, false)
	for _,enemy in pairs(enemies) do
		local damageTable = {victim = enemy,
					attacker = self:GetCaster(),
					damage = self:GetAbility():GetSpecialValueFor("damage"),
					damage_type = DAMAGE_TYPE_MAGICAL,
					ability = self:GetAbility()}
		ApplyDamage(damageTable)
	end
	self:PlayEffects( self:GetCaster() )
end 

function modifier_npc_dota_hero_visage_spell1_cyclone:PlayEffects( target )

	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_jakiro/jakiro_liquid_fire_explosion.vpcf", PATTACH_ABSORIGIN_FOLLOW, target )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( 300, 300, 300 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	EmitSoundOn( "Hero_Jakiro.LiquidFire", self:GetCaster() )
end

function modifier_npc_dota_hero_visage_spell1_cyclone:CheckState()
	return {
        [MODIFIER_STATE_INVULNERABLE] = true,
        [MODIFIER_STATE_NO_HEALTH_BAR] = true,
	}
end

function modifier_npc_dota_hero_visage_spell1_cyclone:DeclareFunctions()
    return {
       MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
	   MODIFIER_EVENT_ON_UNIT_MOVED
    }
end

function modifier_npc_dota_hero_visage_spell1_cyclone:GetModifierConstantHealthRegen()
    return self.regen 
end

function modifier_npc_dota_hero_visage_spell1_cyclone:OnUnitMoved()
	if self:GetDuration() - self:GetElapsedTime() < 0.3 then
		self.step = self.step or (self.cyc_pos.z - self.start_z) / ((self:GetDuration() - self:GetElapsedTime()) / FrameTime())
		self.cyc_pos.z = self.cyc_pos.z - self.step
		self:GetParent():SetAbsOrigin(self.cyc_pos)
		return
	end	
		
	pos = self:GetParent():GetAbsOrigin()
	ParticleManager:SetParticleControl(self.pfx, 0, pos)
	pos.z = self.z_fly
    self:GetParent():SetAbsOrigin(pos)
	return
end