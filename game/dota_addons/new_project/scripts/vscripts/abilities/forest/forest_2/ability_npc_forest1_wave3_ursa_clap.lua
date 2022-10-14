ability_npc_forest1_wave3_ursa_clap = class({})

LinkLuaModifier( "modifier_npc_forest1_wave3_ursa_clap", "abilities/forest1/ability_npc_forest1_wave3_ursa_clap", LUA_MODIFIER_MOTION_NONE )

function ability_npc_forest1_wave3_ursa_clap:OnSpellStart()
    local point = self:GetCaster():GetForwardVector() * 150 + self:GetCaster():GetAbsOrigin()
    local dmg = self:GetSpecialValueFor("damage")
    local dur = self:GetSpecialValueFor("duration")
	local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, point, nil, 300, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0, false )
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage = dmg,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self})
        unit:AddNewModifier(self:GetCaster(), self, "modifier_npc_forest1_wave3_ursa_clap", {duration = dur})
    end
    local pfx = ParticleManager:CreateParticle("particles/neutral_fx/ursa_thunderclap.vpcf", PATTACH_POINT, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 0, point)
    ParticleManager:SetParticleControl(pfx, 1, Vector(300, 0, 0))
    ParticleManager:ReleaseParticleIndex(pfx)
end

modifier_npc_forest1_wave3_ursa_clap = class({})
--Classifications template
function modifier_npc_forest1_wave3_ursa_clap:IsHidden()
    return false
end

function modifier_npc_forest1_wave3_ursa_clap:IsDebuff()
    return true
end

function modifier_npc_forest1_wave3_ursa_clap:IsPurgable()
    return true
end

function modifier_npc_forest1_wave3_ursa_clap:RemoveOnDeath()
    return true
end

function modifier_npc_forest1_wave3_ursa_clap:DestroyOnExpire()
    return true
end

function modifier_npc_forest1_wave3_ursa_clap:OnCreated()
    self.msslow = self:GetAbility():GetSpecialValueFor("movespeed_slow")
    self.asslow = self:GetAbility():GetSpecialValueFor("attackspeed_slow")
end

function modifier_npc_forest1_wave3_ursa_clap:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
    }
end

function modifier_npc_forest1_wave3_ursa_clap:GetModifierMoveSpeedBonus_Percentage()
    return -self.msslow
end

function modifier_npc_forest1_wave3_ursa_clap:GetModifierAttackSpeedBonus_Constant()
    return -self.asslow
end