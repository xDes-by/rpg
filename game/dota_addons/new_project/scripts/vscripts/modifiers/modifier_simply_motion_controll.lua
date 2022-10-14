--x = direction.x,
--y = direction.y,
--r = distance,
--s = speed,


modifier_simply_motion_controll = class({})

function modifier_simply_motion_controll:IsHidden()
	return true
end

function modifier_simply_motion_controll:IsPurgable()
	return false
end

function modifier_simply_motion_controll:OnCreated( kv )
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

function modifier_simply_motion_controll:OnRefresh( kv )
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

function modifier_simply_motion_controll:OnDestroy( kv )
	if IsServer() then
		self:GetParent():InterruptMotionControllers( true )
	end
end

function modifier_simply_motion_controll:UpdateHorizontalMotion( me, dt )
	local pos = self:GetParent():GetOrigin()
	if (pos-self.origin):Length2D()>=self.distance then
		self:Destroy()
		return
	end
	local target = pos + self.direction * (self.speed*dt)
	self:GetParent():SetOrigin( target )
end

function modifier_simply_motion_controll:OnHorizontalMotionInterrupted()
	if IsServer() then
		self:Destroy()
	end
end