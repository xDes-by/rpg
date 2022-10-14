npc_dota_hero_death_prophet_spell6 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_death_prophet_spell6_channel","heroes/npc_dota_hero_death_prophet/npc_dota_hero_death_prophet_spell6", LUA_MODIFIER_MOTION_BOTH )
LinkLuaModifier( "modifier_npc_dota_hero_death_prophet_spell6","heroes/npc_dota_hero_death_prophet/npc_dota_hero_death_prophet_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_death_prophet_spell6_sifon","heroes/npc_dota_hero_death_prophet/npc_dota_hero_death_prophet_spell6", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_death_prophet_spell6:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_death_prophet_spell6_channel", {duration = 2.5})
end

modifier_npc_dota_hero_death_prophet_spell6_channel = class({})

function modifier_npc_dota_hero_death_prophet_spell6_channel:IsDebuff() 
	return false 
end

function modifier_npc_dota_hero_death_prophet_spell6_channel:IsHidden() 
	return false 
end

function modifier_npc_dota_hero_death_prophet_spell6_channel:IsPurgable() 
	return true 
end

function modifier_npc_dota_hero_death_prophet_spell6_channel:IsStunDebuff() 
	return true 
end

function modifier_npc_dota_hero_death_prophet_spell6_channel:IsMotionController()  
	return true 
end

function modifier_npc_dota_hero_death_prophet_spell6_channel:GetMotionControllerPriority()  
	return DOTA_MOTION_CONTROLLER_PRIORITY_HIGH
end

function modifier_npc_dota_hero_death_prophet_spell6_channel:OnCreated()
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

		self.pfx_name = "particles/econ/events/fall_major_2016/cyclone_fm06.vpcf"
		self.pfx = ParticleManager:CreateParticle(self.pfx_name, PATTACH_CUSTOMORIGIN, self:GetParent())
		ParticleManager:SetParticleControl(self.pfx, 0, self.abs)
	end
end

function modifier_npc_dota_hero_death_prophet_spell6_channel:OnIntervalThink()
    if IsClient() then
        return
    end
	if not self:ApplyHorizontalMotionController() then
		self:Destroy()
		return
	end
	self:HorizontalMotion(self:GetParent(), FrameTime())
end

function modifier_npc_dota_hero_death_prophet_spell6_channel:HorizontalMotion(unit, time)
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

function modifier_npc_dota_hero_death_prophet_spell6_channel:OnDestroy()
	StopSoundOn("DOTA_Item.Cyclone.Activate", self:GetParent())
	if not IsServer() then return end
	ParticleManager:DestroyParticle(self.pfx, false)
	ParticleManager:ReleaseParticleIndex(self.pfx)

	self:GetParent():FadeGesture(ACT_DOTA_FLAIL)
	self:GetParent():SetAbsOrigin(self.abs)
	ResolveNPCPositions(self:GetParent():GetAbsOrigin(), 128)
	self:GetParent():SetAngles(self.angle[1], self.angle[2], self.angle[3])
	self:GetCaster():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_death_prophet_spell6", {duration = 5})
end 

function modifier_npc_dota_hero_death_prophet_spell6_channel:CheckState()
	return {
        [MODIFIER_STATE_INVULNERABLE] = true,
        [MODIFIER_STATE_NO_HEALTH_BAR] = true,
	}
end

modifier_npc_dota_hero_death_prophet_spell6 = class({})
--Classifications template
function modifier_npc_dota_hero_death_prophet_spell6:IsHidden()
    return false
end

function modifier_npc_dota_hero_death_prophet_spell6:IsDebuff()
    return false
end

function modifier_npc_dota_hero_death_prophet_spell6:IsPurgable()
    return false
end

function modifier_npc_dota_hero_death_prophet_spell6:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell6:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell6:OnCreated()
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_razor/razor_rain_storm.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	self:AddParticle(effect_cast,false,false,-1,false,false)
	EmitSoundOn( "Hero_Razor.Storm.Cast", self:GetParent() )
	EmitSoundOn( "Hero_Razor.Storm.Loop", self:GetParent() )
    
	self.particle = ParticleManager:CreateParticle("particles/npc_dota_hero_death_prophet/npc_dota_hero_death_prophet_spell6.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
    ParticleManager:SetParticleControl(self.particle, 1, Vector(50,0,50))
    ParticleManager:SetParticleControl(self.particle, 2, Vector(50,0,50))
    ParticleManager:SetParticleControl(self.particle, 4, Vector(50,0,50))
    ParticleManager:SetParticleControl(self.particle, 5, Vector(50,0,0))
	self:AddParticle(self.particle,false,false,-1,false,false)

    self.maxdmg = self:GetAbility():GetSpecialValueFor("maxdmg")
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
	self.units = {}
	if IsClient() then
		return
	end
	self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_death_prophet_spell6:OnDestroy()
	for _,unit in pairs(self.units) do
		if unit:HasModifier("modifier_npc_dota_hero_death_prophet_spell6_sifon") then
			unit:FindModifierByName("modifier_npc_dota_hero_death_prophet_spell6_sifon"):Destroy()
		end
	end
end

function modifier_npc_dota_hero_death_prophet_spell6:OnIntervalThink()
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetCaster():GetAbsOrigin(), nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
	for _,unit in pairs(enemies) do
		if not unit:HasModifier("modifier_npc_dota_hero_death_prophet_spell6_sifon") then
			unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_death_prophet_spell6_sifon", {})
			table.insert( self.units, unit )
		end
	end
end
function modifier_npc_dota_hero_death_prophet_spell6:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK,
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
    }
end

function modifier_npc_dota_hero_death_prophet_spell6:GetModifierTotal_ConstantBlock(data)
    self.maxdmg = self.maxdmg - data.damage
    if self.maxdmg < 0 then
        self:Destroy()
    end
end

function modifier_npc_dota_hero_death_prophet_spell6:GetModifierIncomingDamage_Percentage()
	return -50
end

modifier_npc_dota_hero_death_prophet_spell6_sifon = class({})
--Classifications template
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
	self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_death_prophet/death_prophet_spiritsiphon.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    ParticleManager:SetParticleControlEnt(self.particle, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetAbsOrigin(), true)
    ParticleManager:SetParticleControlEnt(self.particle, 1, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
    ParticleManager:SetParticleControl(self.particle, 5, Vector(5,0,0))
	if IsClient() then
		return
	end
	self:StartIntervalThink(0.1)
end

function modifier_npc_dota_hero_death_prophet_spell6_sifon:OnDestroy()
	ParticleManager:DestroyParticle(self.particle, false)
	ParticleManager:ReleaseParticleIndex(self.particle)
end

function modifier_npc_dota_hero_death_prophet_spell6_sifon:OnIntervalThink()
	if (self:GetCaster():GetAbsOrigin() - self:GetParent():GetAbsOrigin()):Length2D() > self.radius then
		self:Destroy()
	end
	ApplyDamage({victim = self:GetParent(),
	damage =  self.damage,
	damage_type = DAMAGE_TYPE_MAGICAL,
	damage_flags = DOTA_DAMAGE_FLAG_NONE,
	attacker = self:GetCaster(),
	ability = self:GetAbility()})
end