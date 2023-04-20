LinkLuaModifier( "modifier_npc_dota_hero_visage_spell2", "heroes/npc_dota_hero_visage/npc_dota_hero_visage_spell2", LUA_MODIFIER_MOTION_BOTH )
LinkLuaModifier( "modifier_npc_dota_hero_visage_spell2_caster", "heroes/npc_dota_hero_visage/npc_dota_hero_visage_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_visage_spell2_target", "heroes/npc_dota_hero_visage/npc_dota_hero_visage_spell2", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_visage_spell2 = class({})

function npc_dota_hero_visage_spell2:OnSpellStart()
    if not IsServer() then return end
    local target = self:GetCursorTarget()
    local direction = target:GetAbsOrigin() - self:GetCaster():GetAbsOrigin()
    self.distance = direction:Length2D()
    self.speed = 600
    local duration = self:GetSpecialValueFor("duration")
	EmitSoundOn( "Hero_Visage.SoulAssumption.Cast", self:GetCaster() )
    self:GetCaster():AddNewModifier(self:GetCaster(), self,
		"modifier_npc_dota_hero_visage_spell2",
		{
			x = direction.x,
			y = direction.y,
			r = self.distance,
			target = target:entindex()
		}
	)
	self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_visage_spell2_caster", {duration = duration + self.distance/self.speed+0.5, target = target:entindex()})
	EmitSoundOn( "Hero_Visage.GraveChill.Target", self:GetCaster() )
end

---------------------------------------------------------------------------

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
		self.tar = EntIndexToHScript(kv.target)
		self.distance = kv.r
		self.direction = Vector(kv.x,kv.y,0):Normalized()
		self.speed = self:GetAbility().speed
		self.origin = self:GetParent():GetOrigin()
		if self:ApplyHorizontalMotionController() == false then
			self:Destroy()
		end
	end
	self:StartIntervalThink(FrameTime())
end

function modifier_npc_dota_hero_visage_spell2:OnIntervalThink(kv)
    if not IsServer() then return end
	
	local direction = self.tar:GetAbsOrigin() - self:GetCaster():GetAbsOrigin()
	self.direction = Vector(direction.x,direction.y,0):Normalized()
	if(direction):Length2D()< 50 then
		self.tar:Stop()
	end
end

function modifier_npc_dota_hero_visage_spell2:OnRefresh( kv )
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

function modifier_npc_dota_hero_visage_spell2:CheckState()
	return {
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
	}
end

------------------------------------------------------------------------------

modifier_npc_dota_hero_visage_spell2_caster = class({})

function modifier_npc_dota_hero_visage_spell2_caster:IsHidden()
    return false
end

function modifier_npc_dota_hero_visage_spell2_caster:IsPurgable()
    return false
end

function modifier_npc_dota_hero_visage_spell2_caster:OnCreated(kv)
	if not IsServer() then return end
	self.damage = 0
	self.target = EntIndexToHScript(kv.target)
	Timers:CreateTimer(0.5, function()
		EmitSoundOn( "Visage_Familar.StoneForm.Stun", self:GetCaster())
		self.target_mod = self.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_visage_spell2_target", {})		
	end)
end

function modifier_npc_dota_hero_visage_spell2_caster:OnDestroy(kv)
	if not IsServer() then return end
	if self.target ~= self:GetCaster() then
		self.target:RemoveNoDraw()
	end
	self.target_mod:Destroy()
	self.target:Heal(self.damage / 2,  self:GetParent())
	self:GetCaster():Heal(self.damage / 2,  self:GetParent())
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self.target, self.damage/2, nil)
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetCaster(), self.damage/2, nil)
end

function modifier_npc_dota_hero_visage_spell2_caster:CheckState()
	return {
		[MODIFIER_STATE_STUNNED] = true,
	}
end

function modifier_npc_dota_hero_visage_spell2_caster:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
		MODIFIER_PROPERTY_MODEL_SCALE,
		MODIFIER_EVENT_ON_ATTACK_LANDED,		
    }
end

function modifier_npc_dota_hero_visage_spell2_caster:OnAttackLanded(keys) 
	if IsServer() then 
		local parent = self:GetParent()
		if keys.target == parent then
			self.damage = self.damage + keys.damage;
			parent:Heal(keys.damage, parent);
			if self.damage >= self:GetAbility():GetSpecialValueFor("take_max") then
				self.damage = self:GetAbility():GetSpecialValueFor("take_max")
				self:Destroy()
			end
		end
	end
end

function modifier_npc_dota_hero_visage_spell2_caster:GetModifierModelScale()
	return 100
end

function modifier_npc_dota_hero_visage_spell2_caster:GetOverrideAnimation()
    return ACT_DOTA_CAST_ABILITY_1
end

function modifier_npc_dota_hero_visage_spell2_caster:GetOverrideAnimationRate()
    return 1
end

---------------------------------------------------------------------------

modifier_npc_dota_hero_visage_spell2_target = class({})

function modifier_npc_dota_hero_visage_spell2_target:IsHidden()
    return true
end

function modifier_npc_dota_hero_visage_spell2_target:IsPurgable()
    return false
end

function modifier_npc_dota_hero_visage_spell2_target:CheckState()
   local state = {[MODIFIER_STATE_INVULNERABLE] = true,
				   [MODIFIER_STATE_NOT_ON_MINIMAP] = true,                   
				   [MODIFIER_STATE_NO_HEALTH_BAR] = true,
				   [MODIFIER_STATE_OUT_OF_GAME] = true,
				   [MODIFIER_STATE_STUNNED] = true}
	if self:GetParent() ~= self:GetCaster()	then		
		self:GetParent():AddNoDraw()
		return state 
	end
end

function modifier_npc_dota_hero_visage_spell2_target:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,		
    }
end

function modifier_npc_dota_hero_visage_spell2_target:GetModifierConstantHealthRegen()
    return self:GetAbility():GetSpecialValueFor("heal")
end