ability_npc_boss_jungle3_spell3 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle3_spell3","abilities/jungle3/ability_npc_boss_jungle3_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_jungle3_spell3_motion","abilities/jungle3/ability_npc_boss_jungle3_spell3", LUA_MODIFIER_MOTION_BOTH )

function ability_npc_boss_jungle3_spell3:GetChannelTime()
    return 3
end

function ability_npc_boss_jungle3_spell3:GetChannelAnimation()
    return ACT_DOTA_FLAIL
end

function ability_npc_boss_jungle3_spell3:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_jungle3_spell3", {duration = 3})
end

modifier_ability_npc_boss_jungle3_spell3 = class({})
--Classifications template
function modifier_ability_npc_boss_jungle3_spell3:IsHidden()
    return true
end

function modifier_ability_npc_boss_jungle3_spell3:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle3_spell3:OnCreated()
    self.pos = self:GetCaster():GetAbsOrigin()
    self.abi = self:GetAbility()
    self.caster = self:GetCaster()
    self.heal = self.caster:GetMaxHealth() * self:GetAbility():GetSpecialValueFor("heal") * 0.01
    self.already_motion = {}
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.2)
end

function modifier_ability_npc_boss_jungle3_spell3:OnIntervalThink()
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self.pos, nil, 900, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        if unit:GetUnitName() == "npc_jungle3_spider_boss" and self.already_motion[unit] == nil then
            local direction = self.pos - unit:GetAbsOrigin()
            local dis = direction:Length2D()
            unit:AddNewModifier(self.caster, self.abi, "modifier_ability_npc_boss_jungle3_spell3_motion",{
            x = direction.x, y = direction.y, r = dis, s = dis*2, heal = self.heal})
            self.already_motion[unit] = true
        end
    end
end

modifier_ability_npc_boss_jungle3_spell3_motion = class({})

function modifier_ability_npc_boss_jungle3_spell3_motion:IsHidden()
	return true
end

function modifier_ability_npc_boss_jungle3_spell3_motion:IsPurgable()
	return false
end

function modifier_ability_npc_boss_jungle3_spell3_motion:OnCreated( kv )
	if IsServer() then
		self.distance = kv.r - 50
		self.direction = Vector(kv.x,kv.y,0):Normalized()
		self.speed = kv.s
		self.origin = self:GetParent():GetOrigin()
        self.heal = kv.heal
		if self:ApplyHorizontalMotionController() == false then
			self:Destroy()
		end
	end
end

function modifier_ability_npc_boss_jungle3_spell3_motion:OnRefresh( kv )
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

function modifier_ability_npc_boss_jungle3_spell3_motion:OnDestroy( kv )
	if IsServer() then
		self:GetParent():InterruptMotionControllers( true )
        if self:GetParent():IsAlive() then
            self:GetParent():Kill(self:GetAbility(), self:GetCaster())
            self:GetCaster():Heal(self.heal, self:GetAbility())
            SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetParent(), self.heal, nil)
        end
    end
end

function modifier_ability_npc_boss_jungle3_spell3_motion:UpdateHorizontalMotion( me, dt )
	local pos = self:GetParent():GetOrigin()
	if (pos-self.origin):Length2D()>=self.distance then
		self:Destroy()
		return
	end
	local target = pos + self.direction * (self.speed*dt)
	self:GetParent():SetOrigin( target )
end

function modifier_ability_npc_boss_jungle3_spell3_motion:OnHorizontalMotionInterrupted()
	if IsServer() then
		self:Destroy()
	end
end