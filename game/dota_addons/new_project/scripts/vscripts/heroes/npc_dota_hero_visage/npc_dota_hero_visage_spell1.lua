npc_dota_hero_visage_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_visage_spell1_rotare", "heroes/npc_dota_hero_visage/npc_dota_hero_visage_spell1", LUA_MODIFIER_MOTION_BOTH )

function npc_dota_hero_visage_spell1:OnSpellStart()
    if IsClient() then
        return
    end
    self:GetCursorTarget():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_visage_spell1_rotare", {duration = self:GetSpecialValueFor("duration")})
end

modifier_npc_dota_hero_visage_spell1_rotare = class({})

function modifier_npc_dota_hero_visage_spell1_rotare:IsDebuff() 
	return false 
end

function modifier_npc_dota_hero_visage_spell1_rotare:IsHidden() 
	return false 
end

function modifier_npc_dota_hero_visage_spell1_rotare:IsPurgable() 
	return true 
end

function modifier_npc_dota_hero_visage_spell1_rotare:IsStunDebuff() 
	return true 
end

function modifier_npc_dota_hero_visage_spell1_rotare:IsMotionController()  
	return true 
end

function modifier_npc_dota_hero_visage_spell1_rotare:GetMotionControllerPriority()  
	return DOTA_MOTION_CONTROLLER_PRIORITY_HIGH
end

function modifier_npc_dota_hero_visage_spell1_rotare:OnCreated()
    self.regen = self:GetAbility():GetSpecialValueFor("regen_persent")
	if IsServer() then
        if not self:GetAbility() then self:Destroy() end
    end

	self:StartIntervalThink(FrameTime())
	EmitSoundOn("DOTA_Item.Cyclone.Activate", self:GetParent())
	if IsServer() then
		self:GetParent():StartGesture(ACT_DOTA_FLAIL)
		self.angle = self:GetParent():GetAngles()
		self.abs = self:GetParent():GetAbsOrigin()
		self.cyc_pos = self:GetParent():GetAbsOrigin()

		self.pfx_name = "particles/econ/events/winter_major_2016/cyclone_wm16.vpcf"
		self.pfx = ParticleManager:CreateParticle(self.pfx_name, PATTACH_CUSTOMORIGIN, self:GetParent())
		ParticleManager:SetParticleControl(self.pfx, 0, self.abs)
	end
end

function modifier_npc_dota_hero_visage_spell1_rotare:OnIntervalThink()
    if IsClient() then
        return
    end
	if not self:ApplyHorizontalMotionController() then
		self:Destroy()
		return
	end
	self:HorizontalMotion(self:GetParent(), FrameTime())
end

function modifier_npc_dota_hero_visage_spell1_rotare:HorizontalMotion(unit, time)
	if not IsServer() then return end
	-- Change the Face Angle
	local angle = self:GetParent():GetAngles()
	local new_angle = RotateOrientation(angle, QAngle(0,20,0))
	self:GetParent():SetAngles(new_angle[1], new_angle[2], new_angle[3])
	-- Change the height at the first and last 0.3 sec
	if self:GetElapsedTime() <= 0.3 then
		self.cyc_pos.z = self.cyc_pos.z + 50
		self:GetParent():SetAbsOrigin(self.cyc_pos)
	elseif self:GetDuration() - self:GetElapsedTime() < 0.3 then
		self.step = self.step or (self.cyc_pos.z - self.abs.z) / ((self:GetDuration() - self:GetElapsedTime()) / FrameTime())
		self.cyc_pos.z = self.cyc_pos.z - self.step
		self:GetParent():SetAbsOrigin(self.cyc_pos)
	else -- Random move
		local pos = GetRandomPosition2D(self:GetParent():GetAbsOrigin(),5)
		while ((pos - self.abs):Length2D() > 50) do
			pos = GetRandomPosition2D(self:GetParent():GetAbsOrigin(),5)
		end
		self:GetParent():SetAbsOrigin(pos)
	end
end

function modifier_npc_dota_hero_visage_spell1_rotare:OnDestroy()
	StopSoundOn("DOTA_Item.Cyclone.Activate", self:GetParent())
	if not IsServer() then return end
	ParticleManager:DestroyParticle(self.pfx, false)
	ParticleManager:ReleaseParticleIndex(self.pfx)

	self:GetParent():FadeGesture(ACT_DOTA_FLAIL)
	self:GetParent():SetAbsOrigin(self.abs)
	ResolveNPCPositions(self:GetParent():GetAbsOrigin(), 128)
	self:GetParent():SetAngles(self.angle[1], self.angle[2], self.angle[3])
end 

function modifier_npc_dota_hero_visage_spell1_rotare:CheckState()
	return {
        [MODIFIER_STATE_STUNNED] = true,
        [MODIFIER_STATE_INVULNERABLE] = true,
        [MODIFIER_STATE_NO_HEALTH_BAR] = true,
	}
end

function modifier_npc_dota_hero_visage_spell1_rotare:DeclareFunctions()
    return {
       MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE
    }
end

function modifier_npc_dota_hero_visage_spell1_rotare:GetModifierHealthRegenPercentage()
    return self.regen 
end