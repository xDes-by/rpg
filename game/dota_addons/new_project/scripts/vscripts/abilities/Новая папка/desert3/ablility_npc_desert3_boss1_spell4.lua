ablility_npc_desert3_boss1_spell4 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert3_boss1_spell4","abilities/desert3/ablility_npc_desert3_boss1_spell4", LUA_MODIFIER_MOTION_BOTH )

function ablility_npc_desert3_boss1_spell4:OnSpellStart()
    local direction = self:GetCursorPosition() - self:GetCaster():GetAbsOrigin()
    local dis = direction:Length2D()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ablility_npc_desert3_boss1_spell4", {
    x = direction.x, y = direction.y, r = dis, s = dis})
    self:GetCaster():StartGesture(ACT_DOTA_RUN)
    self:GetCaster():FaceTowards(self:GetCursorPosition())
end

modifier_ablility_npc_desert3_boss1_spell4 = class({})

function modifier_ablility_npc_desert3_boss1_spell4:IsHidden()
	return true
end

function modifier_ablility_npc_desert3_boss1_spell4:IsPurgable()
	return false
end

function modifier_ablility_npc_desert3_boss1_spell4:OnCreated( kv )
	if IsServer() then
		self.distance = kv.r
		self.direction = Vector(kv.x,kv.y,0):Normalized()
		self.speed = kv.s
		self.origin = self:GetParent():GetOrigin()
		if self:ApplyHorizontalMotionController() == false then
			self:Destroy()
		end
	end
end

function modifier_ablility_npc_desert3_boss1_spell4:OnRefresh( kv )
	if IsServer() then
		-- references
		self.distance = kv.r
		self.direction = Vector(kv.x,kv.y,0):Normalized()
		self.speed = kv.s
		self.origin = self:GetParent():GetOrigin()
		if self:ApplyHorizontalMotionController() == false then 
			self:Destroy()
		end
	end	
end

function modifier_ablility_npc_desert3_boss1_spell4:OnDestroy( kv )
	if IsServer() then
		self:GetParent():InterruptMotionControllers( true )
        self:GetCaster():RemoveGesture(ACT_DOTA_RUN)
	end
end

function modifier_ablility_npc_desert3_boss1_spell4:UpdateHorizontalMotion( me, dt )
	local pos = self:GetParent():GetOrigin()
	if (pos-self.origin):Length2D()>=self.distance then
		self:Destroy()
		return
	end
	local target = pos + self.direction * (self.speed*dt)
	self:GetParent():SetOrigin( target )
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 150, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        unit:SetAbsOrigin(target + self:GetParent():GetForwardVector() * 100)
    end
end

function modifier_ablility_npc_desert3_boss1_spell4:OnHorizontalMotionInterrupted()
	if IsServer() then
		self:Destroy()
	end
end

function modifier_ablility_npc_desert3_boss1_spell4:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_DISABLE_TURNING
    }
end

function modifier_ablility_npc_desert3_boss1_spell4:GetModifierDisableTurning()
    return 1
end
