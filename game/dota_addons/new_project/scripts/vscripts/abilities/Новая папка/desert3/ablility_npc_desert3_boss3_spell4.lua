ablility_npc_desert3_boss3_spell4 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert3_boss3_spell4","abilities/desert3/ablility_npc_desert3_boss3_spell4", LUA_MODIFIER_MOTION_NONE )

function ablility_npc_desert3_boss3_spell4:GetIntrinsicModifierName()
    return "modifier_ablility_npc_desert3_boss3_spell4"
end

modifier_ablility_npc_desert3_boss3_spell4 = class({})

--Classifications template
function modifier_ablility_npc_desert3_boss3_spell4:IsHidden()
    return false
end

function modifier_ablility_npc_desert3_boss3_spell4:IsDebuff()
    return false
end

function modifier_ablility_npc_desert3_boss3_spell4:IsPurgable()
    return false
end

function modifier_ablility_npc_desert3_boss3_spell4:RemoveOnDeath()
   return true
end

function modifier_ablility_npc_desert3_boss3_spell4:DestroyOnExpire()
    return true
end

function modifier_ablility_npc_desert3_boss3_spell4:OnCreated()
    self.current = DAMAGE_TYPE_PHYSICAL
    self.pfx = ParticleManager:CreateParticle("particles/econ/items/nyx_assassin/nyx_ti9_immortal/nyx_ti9_crimson_carapace_start_base.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    self:StartIntervalThink(5)
end

function modifier_ablility_npc_desert3_boss3_spell4:OnIntervalThink()
    if self.current == DAMAGE_TYPE_PHYSICAL then
        self.current = DAMAGE_TYPE_MAGICAL
        ParticleManager:DestroyParticle(self.pfx, true)
        ParticleManager:ReleaseParticleIndex(self.pfx)
        self.pfx = ParticleManager:CreateParticle("particles/econ/items/nyx_assassin/nyx_ti9_immortal/nyx_ti9_carapace_start_base.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    else
        self.current = DAMAGE_TYPE_PHYSICAL
        ParticleManager:DestroyParticle(self.pfx, true)
        ParticleManager:ReleaseParticleIndex(self.pfx)
        self.pfx = ParticleManager:CreateParticle("particles/econ/items/nyx_assassin/nyx_ti9_immortal/nyx_ti9_crimson_carapace_start_base.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    end
end

function modifier_ablility_npc_desert3_boss3_spell4:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK
    }
end

function modifier_ablility_npc_desert3_boss3_spell4:GetModifierTotal_ConstantBlock(data)
    if data.damage_type == self.current then
        return data.damage / 2
    end
    return data.damage
end