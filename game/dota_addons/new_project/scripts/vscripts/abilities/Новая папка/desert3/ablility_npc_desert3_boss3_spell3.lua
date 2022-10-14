ablility_npc_desert3_boss3_spell3 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert3_boss3_spell3","abilities/desert3/ablility_npc_desert3_boss3_spell3", LUA_MODIFIER_MOTION_NONE )

function ablility_npc_desert3_boss3_spell3:OnSpellStart()
    local dur = self:GetSpecialValueFor("duration")
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ablility_npc_desert3_boss3_spell3", {duration = dur})
end

modifier_ablility_npc_desert3_boss3_spell3 = class({})
--Classifications template
function modifier_ablility_npc_desert3_boss3_spell3:IsHidden()
    return false
end

function modifier_ablility_npc_desert3_boss3_spell3:IsDebuff()
    return false
end

function modifier_ablility_npc_desert3_boss3_spell3:IsPurgable()
    return false
end

function modifier_ablility_npc_desert3_boss3_spell3:RemoveOnDeath()
    return true
end

function modifier_ablility_npc_desert3_boss3_spell3:DestroyOnExpire()
    return true
end

function modifier_ablility_npc_desert3_boss3_spell3:OnCreated()
    self.stun = self:GetAbility():GetSpecialValueFor("stun")
    self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_nyx_assassin/nyx_assassin_spiked_carapace.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
	ParticleManager:SetParticleControlEnt(self.pfx, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetAbsOrigin(), true)
	self:AddParticle(self.pfx, false, false, -1, false, false)
    self.attakers = {}
end

function modifier_ablility_npc_desert3_boss3_spell3:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_TAKEDAMAGE
    }
end

function modifier_ablility_npc_desert3_boss3_spell3:OnTakeDamage(data)
    if data.unit == self:GetParent() and self.attakers[data.attaker] then
        data.attaker:AddNewModifier(self:GetCaster(), self:GetAbility(), "modidfier_stunned", {duration = self.stun})
        self.attakers[data.attaker] = false
    end
end

function modifier_ablility_npc_desert3_boss3_spell3:GetStatusEffectName()
	return "particles/units/heroes/hero_nyx_assassin/status_effect_nyx_assassin_spiked_carapace.vpcf"
end