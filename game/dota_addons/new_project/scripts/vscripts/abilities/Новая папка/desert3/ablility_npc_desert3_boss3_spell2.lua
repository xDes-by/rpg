ablility_npc_desert3_boss3_spell2 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert3_boss3_spell2","abilities/desert3/ablility_npc_desert3_boss3_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ablility_npc_desert3_boss3_spell2_thinker","abilities/desert3/ablility_npc_desert3_boss3_spell2", LUA_MODIFIER_MOTION_NONE )

function ablility_npc_desert3_boss3_spell2:OnSpellStart()
    local duration = self:GetSpecialValueFor("duration")
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ablility_npc_desert3_boss3_spell2", {duration = duration})
end

modifier_ablility_npc_desert3_boss3_spell2 = class({})
--Classifications template
function modifier_ablility_npc_desert3_boss3_spell2:IsHidden()
    return false
end

function modifier_ablility_npc_desert3_boss3_spell2:IsDebuff()
    return false
end

function modifier_ablility_npc_desert3_boss3_spell2:IsPurgable()
    return false
end

function modifier_ablility_npc_desert3_boss3_spell2:RemoveOnDeath()
    return true
end

function modifier_ablility_npc_desert3_boss3_spell2:DestroyOnExpire()
    return true
end

function modifier_ablility_npc_desert3_boss3_spell2:OnCreated()
    if IsClient() then
        return
    end
    self.dir = self:GetCaster():GetForwardVector()
    self.pos = self:GetCaster():GetAbsOrigin()
    self:StartIntervalThink(0.4)
end

function modifier_ablility_npc_desert3_boss3_spell2:OnIntervalThink()
    local rand = RandomInt(0, 360)
    local dir = RotatePosition(Vector(0, 0, 0), QAngle(0, rand, 0), self.dir)
    local npc = CreateModifierThinker(self:GetCaster(), self, "modifier_ablility_npc_desert3_boss3_spell2_thinker", {duration = 1.2}, self.pos + dir * 500, DOTA_TEAM_BADGUYS, false)
end

function modifier_ablility_npc_desert3_boss3_spell2:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MODEL_CHANGE,
    }
end

function modifier_ablility_npc_desert3_boss3_spell2:GetModifierModelChange()
    return "models/heroes/nerubian_assassin/mound.vmdl"
end

function modifier_ablility_npc_desert3_boss3_spell2:CheckState()
    return {
        [MODIFIER_STATE_STUNNED] = true
    }
end

modifier_ablility_npc_desert3_boss3_spell2_thinker = class({})

function modifier_ablility_npc_desert3_boss3_spell2_thinker:OnCreated(kv)
    self.abi = self:GetCaster():FindAbilityByName("ablility_npc_desert3_boss3_spell1")
	self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_primal_beast/primal_beast_onslaught_range_finder.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControl( self.effect_cast, 0, self:GetCaster():GetAbsOrigin() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, self:GetParent():GetAbsOrigin() )
	self:AddParticle(
		self.effect_cast,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)
    self.dir = self:GetParent():GetAbsOrigin() - self:GetCaster():GetAbsOrigin()
    self.procs = 10
    self:StartIntervalThink(1.2)
end

function modifier_ablility_npc_desert3_boss3_spell2_thinker:OnIntervalThink()
    if self.procs == 0 then
        self:StartIntervalThink(-1)
    end
    self.procs = self.procs - 1
    self:GetCaster().directional = self.dir:Normalized()
    self.abi:OnSpellStart()
    self:Destroy()
    UTIL_Remove(self:GetParent())
end