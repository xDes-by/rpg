LinkLuaModifier( "modifier_ability_npc_boss_dust_2_spell_3","abilities/dust/dust_2/ability_npc_boss_dust_2_spell_3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_dust_2_spell_3_motion","abilities/dust/dust_2/ability_npc_boss_dust_2_spell_3", LUA_MODIFIER_MOTION_BOTH )

ability_npc_boss_dust_2_spell_3 = class({})

function ability_npc_boss_dust_2_spell_3:GetChannelTime()
    return 3
end

function ability_npc_boss_dust_2_spell_3:GetChannelAnimation()
    return ACT_DOTA_FLAIL
end

function ability_npc_boss_dust_2_spell_3:OnSpellStart()
	self:GetCaster():EmitSound("broodmother_broo_regen_02")
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_dust_2_spell_3", {duration = 3})
end

------------------------------------------------------------------------------
modifier_ability_npc_boss_dust_2_spell_3 = class({})

function modifier_ability_npc_boss_dust_2_spell_3:IsHidden()
    return true
end

function modifier_ability_npc_boss_dust_2_spell_3:IsPurgable()
    return false
end

function modifier_ability_npc_boss_dust_2_spell_3:OnCreated()
    self.pos = self:GetCaster():GetAbsOrigin()
    self.abi = self:GetAbility()
    self.caster = self:GetCaster()
    self.heal = self:GetAbility():GetSpecialValueFor("heal")
    self.already_motion = {}
    self:StartIntervalThink(0.2)
end

function modifier_ability_npc_boss_dust_2_spell_3:OnIntervalThink()
if not IsServer() then return end
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self.pos, nil, 900, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        if unit:GetUnitName() == "npc_dust_creep_mini_1" and self.already_motion[unit] == nil then
            local direction = self.pos - unit:GetAbsOrigin()
            local dis = direction:Length2D()
            unit:AddNewModifier(self.caster, self.abi, "modifier_ability_npc_boss_dust_2_spell_3_motion",{
            x = direction.x, y = direction.y, r = dis, s = dis*2, heal = self.heal})
            self.already_motion[unit] = true
        end
    end
end

-------------------------------------------------------

modifier_ability_npc_boss_dust_2_spell_3_motion = class({})

function modifier_ability_npc_boss_dust_2_spell_3_motion:IsHidden()
	return true
end

function modifier_ability_npc_boss_dust_2_spell_3_motion:IsPurgable()
	return false
end

function modifier_ability_npc_boss_dust_2_spell_3_motion:OnCreated( kv )
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

function modifier_ability_npc_boss_dust_2_spell_3_motion:OnRefresh( kv )
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

function modifier_ability_npc_boss_dust_2_spell_3_motion:OnDestroy( kv )
	if IsServer() then
		self:GetParent():InterruptMotionControllers( true )
        if self:GetParent():IsAlive() then
            self:GetParent():Kill(self:GetAbility(), self:GetCaster())
            self:GetCaster():Heal(self.heal, self:GetAbility())
            SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetParent(), self.heal, nil)
        end
    end
end

function modifier_ability_npc_boss_dust_2_spell_3_motion:UpdateHorizontalMotion( me, dt )
	local pos = self:GetParent():GetOrigin()
	if (pos-self.origin):Length2D()>=self.distance then
		self:Destroy()
		return
	end
	local target = pos + self.direction * (self.speed*dt)
	self:GetParent():SetOrigin( target )
end

function modifier_ability_npc_boss_dust_2_spell_3_motion:OnHorizontalMotionInterrupted()
	if IsServer() then
		self:Destroy()
	end
end