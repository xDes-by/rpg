npc_dota_hero_shredder_spell3 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_shredder_spell3","heroes/npc_dota_hero_shredder/npc_dota_hero_shredder_spell3", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_shredder_spell3:OnSpellStart()
    self:GetCursorTarget():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_shredder_spell3", {duration = self:GetSpecialValueFor("max_duration")})
    EmitSoundOn("Hero_Tinker.DefensiveMatrix.Cast", self:GetCaster())
end

modifier_npc_dota_hero_shredder_spell3 = class({})
--Classifications template
function modifier_npc_dota_hero_shredder_spell3:IsHidden()
    return false
end

function modifier_npc_dota_hero_shredder_spell3:IsDebuff()
    return false
end

function modifier_npc_dota_hero_shredder_spell3:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_shredder_spell3:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_shredder_spell3:OnCreated()
    self.maxdamage = self:GetAbility():GetSpecialValueFor("max_damage")
    self.persentage = (100 - self:GetAbility():GetSpecialValueFor("persentage")) * 0.01
    self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_tinker/tinker_defense_matrix.vpcf", PATTACH_POINT_FOLLOW, self:GetParent())
    ParticleManager:SetParticleControlEnt(self.pfx, 1, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
end

function modifier_npc_dota_hero_shredder_spell3:OnDestroy()
    ParticleManager:DestroyParticle(self.pfx, false)
end

function modifier_npc_dota_hero_shredder_spell3:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK
    }
end

function modifier_npc_dota_hero_shredder_spell3:GetModifierTotal_ConstantBlock(data)
    local reflect = data.damage * self.persentage
    if reflect < self.maxdamage then
        self.maxdamage = self.maxdamage - reflect
        return data.damage - reflect
    else
        self:Destroy()
        return data.damage - self.maxdamage
    end
end