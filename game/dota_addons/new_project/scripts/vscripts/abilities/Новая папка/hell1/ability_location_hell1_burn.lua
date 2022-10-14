ability_location_hell1_burn = class({})

LinkLuaModifier( "modifier_ability_location_hell1_burn","abilities/hell1/ability_location_hell1_burn", LUA_MODIFIER_MOTION_NONE )

function ability_location_hell1_burn:GetIntrinsicModifierName()
    return "modifier_ability_location_hell1_burn"
end

modifier_ability_location_hell1_burn = class({})

--Classifications template
function modifier_ability_location_hell1_burn:IsHidden()
   return false
end

function modifier_ability_location_hell1_burn:IsDebuff()
   return true
end

function modifier_ability_location_hell1_burn:IsPurgable()
   return false
end

function modifier_ability_location_hell1_burn:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(1)
end

function modifier_ability_location_hell1_burn:OnIntervalThink()
    self:IncrementStackCount()
    if self:GetStackCount() >= 50 and not self:GetParent():HasModifier("modifier_ability_npc_hell1_frost_lady_cold_effect") then
        ApplyDamage({victim = self:GetParent(),
        damage = (self:GetParent():GetMaxHealth() * 0.01) * (self:GetStackCount() - 50),
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL + DOTA_DAMAGE_FLAG_IGNORES_MAGIC_ARMOR,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
end
