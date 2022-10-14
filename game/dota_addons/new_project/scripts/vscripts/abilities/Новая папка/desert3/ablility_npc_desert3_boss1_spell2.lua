ablility_npc_desert3_boss1_spell2 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert3_boss1_spell2_motion","abilities/desert3/ablility_npc_desert3_boss1_spell2", LUA_MODIFIER_MOTION_BOTH )
LinkLuaModifier( "modifier_ablility_npc_desert3_boss1_spell2_debuff","abilities/desert3/ablility_npc_desert3_boss1_spell2", LUA_MODIFIER_MOTION_NONE )

function ablility_npc_desert3_boss1_spell2:OnSpellStart()
	local npc = CreateUnitByName("npc_desert3_boss1_spirit", self:GetCaster():GetAbsOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS )
    local direction = self:GetCursorPosition() - self:GetCaster():GetAbsOrigin()
    local dis = direction:Length2D()
    npc:AddNewModifier(self:GetCaster(), self, "modifier_ablility_npc_desert3_boss1_spell2_motion", {
    x = direction.x, y = direction.y, r = dis, s = dis*0.5})
    npc:FaceTowards(self:GetCursorPosition())
    npc:StartGesture(ACT_DOTA_FLAIL)
    ParticleManager:CreateParticle("particles/units/heroes/hero_elder_titan/elder_titan_ancestral_spirit_ambient.vpcf", PATTACH_POINT_FOLLOW, npc)
end

modifier_ablility_npc_desert3_boss1_spell2_motion = class({})

function modifier_ablility_npc_desert3_boss1_spell2_motion:IsHidden()
	return true
end

function modifier_ablility_npc_desert3_boss1_spell2_motion:IsPurgable()
	return false
end

function modifier_ablility_npc_desert3_boss1_spell2_motion:OnCreated( kv )
	if IsServer() then
		self.distance = kv.r
		self.direction = Vector(kv.x,kv.y,0):Normalized()
		self.speed = kv.s
		self.origin = self:GetParent():GetOrigin()
        self.duration = self:GetAbility():GetSpecialValueFor("duration")
        if RandomInt(1, 2) == 1 then
            self.type = DAMAGE_TYPE_MAGICAL
        else
            self.type = DAMAGE_TYPE_PHYSICAL
        end
        self.reduse = self:GetAbility():GetSpecialValueFor("reduse")
		if self:ApplyHorizontalMotionController() == false then
			self:Destroy()
		end
	end
end
function modifier_ablility_npc_desert3_boss1_spell2_motion:OnRefresh()
    self:OnCreated()
end

function modifier_ablility_npc_desert3_boss1_spell2_motion:OnRefresh( kv )
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

function modifier_ablility_npc_desert3_boss1_spell2_motion:OnDestroy( kv )
	if IsServer() then
		self:GetParent():InterruptMotionControllers( true )
        UTIL_Remove(self:GetParent())
	end
end

function modifier_ablility_npc_desert3_boss1_spell2_motion:UpdateHorizontalMotion( me, dt )
	local pos = self:GetParent():GetOrigin()
	if (pos-self.origin):Length2D()>=self.distance then
		self:Destroy()
		return
	end
	local target = pos + self.direction * (self.speed*dt)
	self:GetParent():SetOrigin( target )
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 300, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        local mod = unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ablility_npc_desert3_boss1_spell2_debuff", {duration = self.duration})
        mod.type = self.type
        mod.reduse = self.reduse
    end
end

function modifier_ablility_npc_desert3_boss1_spell2_motion:OnHorizontalMotionInterrupted()
	if IsServer() then
		self:Destroy()
	end
end

modifier_ablility_npc_desert3_boss1_spell2_debuff = class({})
--Classifications template
function modifier_ablility_npc_desert3_boss1_spell2_debuff:IsHidden()
    return false
end

function modifier_ablility_npc_desert3_boss1_spell2_debuff:IsDebuff()
    return true
end

function modifier_ablility_npc_desert3_boss1_spell2_debuff:IsPurgable()
    return true
end

function modifier_ablility_npc_desert3_boss1_spell2_debuff:RemoveOnDeath()
    return true
end

function modifier_ablility_npc_desert3_boss1_spell2_debuff:DestroyOnExpire()
    return true
end

function modifier_ablility_npc_desert3_boss1_spell2_debuff:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
    }
end

function modifier_ablility_npc_desert3_boss1_spell2_debuff:GetModifierIncomingDamage_Percentage(data)
    if data.damage_type == self.type then
        return 100 - self.reduse
    end
    return 0
end