npc_dota_hero_visage_spell2 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_visage_spell2", "heroes/npc_dota_hero_visage/npc_dota_hero_visage_spell2", LUA_MODIFIER_MOTION_BOTH )
LinkLuaModifier( "modifier_npc_dota_hero_visage_spell2_caster", "heroes/npc_dota_hero_visage/npc_dota_hero_visage_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_visage_spell2_target", "heroes/npc_dota_hero_visage/npc_dota_hero_visage_spell2", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_visage_spell2:OnSpellStart()
    if IsClient() then
        return
    end
    local ability = self
    local target = self:GetCursorTarget()
    local caster = self:GetCaster()
    local targetpos = target:GetAbsOrigin()
    self.StarpPosition = caster:GetAbsOrigin()
    local direction = targetpos - self.StarpPosition
    self.distance = direction:Length2D() * 2
    self.speed = self.distance
    local duration = self:GetSpecialValueFor("duration")
	EmitSoundOn( "Hero_Visage.SoulAssumption.Cast", caster )
    caster:AddNewModifier(
		caster, -- player source
		self, -- ability source
		"modifier_npc_dota_hero_visage_spell2", -- modifier name
		{
			x = direction.x,
			y = direction.y,
			r = self.distance,
		} -- kv
	)
    Timers:CreateTimer(0.5,function()
	    EmitSoundOn( "Hero_Visage.GraveChill.Target", caster )
        caster:AddNewModifier(caster, ability, "modifier_npc_dota_hero_visage_spell2_caster", {duration = duration, target = target:entindex()})
        target:AddNewModifier(caster, ability, "modifier_npc_dota_hero_visage_spell2_target", {})
    end)
end

modifier_npc_dota_hero_visage_spell2 = class({})

function modifier_npc_dota_hero_visage_spell2:IsHidden()
	return false
end

function modifier_npc_dota_hero_visage_spell2:IsDebuff()
	return true
end

function modifier_npc_dota_hero_visage_spell2:IsStunDebuff()
	return false
end

function modifier_npc_dota_hero_visage_spell2:IsPurgable()
	return false
end

function modifier_npc_dota_hero_visage_spell2:OnCreated( kv )
	if IsServer() then
		self.distance = kv.r
		self.direction = Vector(kv.x,kv.y,0):Normalized()
		self.speed = self:GetAbility().speed
		self.origin = self:GetParent():GetOrigin()
		if self:ApplyHorizontalMotionController() == false then
			self:Destroy()
		end
	end
end

function modifier_npc_dota_hero_visage_spell2:OnRefresh( kv )
	if IsServer() then
		-- references
		self.distance = kv.r
		self.direction = Vector(kv.x,kv.y,0):Normalized()
		self.speed = self:GetAbility().speed
		self.origin = self:GetParent():GetOrigin()
		if self:ApplyHorizontalMotionController() == false then 
			self:Destroy()
		end
	end	
end

function modifier_npc_dota_hero_visage_spell2:OnDestroy( kv )
	if IsServer() then
		self:GetParent():InterruptMotionControllers( true )
        self:GetCaster():AddNewModifier(
		self:GetCaster(), -- player source
		self:GetAbility(), -- ability source
		"modifier_generic_arc_lua", -- modifier name
		{
			target_x = self:GetAbility().StarpPosition.x,
			target_y = self:GetAbility().StarpPosition.y,
			duration = 1.5,
			distance = self:GetAbility().distance/1.5,
			height = 650,
			speed = self:GetAbility().distance/1.5,
			fix_duration = false,
			isStun = true,
			activity = ACT_DOTA_CAST_ABILITY_2,
			isForward = true
		} -- kv
	)
	end
end

function modifier_npc_dota_hero_visage_spell2:UpdateHorizontalMotion( me, dt )
	local pos = self:GetParent():GetOrigin()
	if (pos-self.origin):Length2D()>=self.distance then
		self:Destroy()
		return
	end
	local target = pos + self.direction * (self.speed*dt)
	self:GetParent():SetOrigin( target )
end

function modifier_npc_dota_hero_visage_spell2:OnHorizontalMotionInterrupted()
	if IsServer() then
		self:Destroy()
	end
end

modifier_npc_dota_hero_visage_spell2_caster = class({})
--Classifications template
function modifier_npc_dota_hero_visage_spell2_caster:IsHidden()
    return false
end

function modifier_npc_dota_hero_visage_spell2_caster:IsDebuff()
    return false
end

function modifier_npc_dota_hero_visage_spell2_caster:IsPurgable()
    return false
end

function modifier_npc_dota_hero_visage_spell2_caster:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_visage_spell2_caster:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_visage_spell2_caster:OnCreated(kv)
    if IsClient() then
        return
    end
    self.target = EntIndexToHScript(kv.target)
end

function modifier_npc_dota_hero_visage_spell2_caster:OnDestroy()
    if IsClient() then
        return
    end
    EmitSoundOn( "Visage_Familar.StoneForm.Stun", self:GetCaster() )
    local mod = self.target:FindModifierByName("modifier_npc_dota_hero_visage_spell2_target")
    if mod then
        mod:Destroy()
    end
end

