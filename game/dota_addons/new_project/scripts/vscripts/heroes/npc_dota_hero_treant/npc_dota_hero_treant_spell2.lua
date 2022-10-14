npc_dota_hero_treant_spell2 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_treant_spell2", "heroes/npc_dota_hero_treant/npc_dota_hero_treant_spell2", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_treant_spell2:GetAOERadius()
    return self:GetSpecialValueFor("radius")
end

function npc_dota_hero_treant_spell2:OnSpellStart()
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetCursorPosition(), nil, self:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        unit:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_treant_spell2", {duration = self:GetSpecialValueFor("duration")})
    end
end

modifier_npc_dota_hero_treant_spell2 = class({})
--Classifications template
function modifier_npc_dota_hero_treant_spell2:IsHidden()
    return false
end

function modifier_npc_dota_hero_treant_spell2:IsDebuff()
    return false
end

function modifier_npc_dota_hero_treant_spell2:IsPurgable()
    return true
end

function modifier_npc_dota_hero_treant_spell2:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_treant_spell2:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_treant_spell2:OnCreated()
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_treant/treant_livingarmor.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
    ParticleManager:SetParticleControlEnt(pfx, 1, self:GetParent(), PATTACH_ABSORIGIN_FOLLOW, "follow_origin", self:GetParent():GetAbsOrigin(), true)
    self:AddParticle(pfx, false, false, 15, false, false)
    self.heal = self:GetAbility():GetSpecialValueFor("regen_per_sec")
    self.armor = self:GetAbility():GetSpecialValueFor("armor_bonus")
    if IsClient() then
        return
    end
    self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_treant_spell2:OnIntervalThink()
    self:GetParent():Heal(self.heal, self:GetAbility())
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetParent(), self.heal, nil)
end

function modifier_npc_dota_hero_treant_spell2:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS
    }
end

function modifier_npc_dota_hero_treant_spell2:GetModifierPhysicalArmorBonus()
    return self.armor
end
