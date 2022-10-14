ability_npc_hell1_clinkz_arrows = class({})

LinkLuaModifier( "modifier_ability_npc_hell1_clinkz_arrows","abilities/hell1/ability_npc_hell1_clinkz_arrows", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell1_clinkz_arrows_effect","abilities/hell1/ability_npc_hell1_clinkz_arrows", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell1_clinkz_arrows:GetIntrinsicModifierName()
    return "modifier_ability_npc_hell1_clinkz_arrows"
end

modifier_ability_npc_hell1_clinkz_arrows = class({})

--Classifications template
function modifier_ability_npc_hell1_clinkz_arrows:IsHidden()
   return true
end

function modifier_ability_npc_hell1_clinkz_arrows:IsPurgable()
   return false
end

function modifier_ability_npc_hell1_clinkz_arrows:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_hell1_clinkz_arrows:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_hell1_clinkz_arrows_effect", {duration = 1.5})
end

modifier_ability_npc_hell1_clinkz_arrows_effect = class({})
--Classifications template
function modifier_ability_npc_hell1_clinkz_arrows_effect:IsHidden()
   return false
end

function modifier_ability_npc_hell1_clinkz_arrows_effect:IsDebuff()
   return true
end

function modifier_ability_npc_hell1_clinkz_arrows_effect:IsPurgable()
   return true
end

function modifier_ability_npc_hell1_clinkz_arrows_effect:RemoveOnDeath()
   return true
end

function modifier_ability_npc_hell1_clinkz_arrows_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_hell1_clinkz_arrows_effect:OnCreated()
   if IsClient() then
       return
   end
    self:StartIntervalThink(0.3)
end

function modifier_ability_npc_hell1_clinkz_arrows_effect:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage = self:GetAbility():GetSpecialValueFor("damage"),
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end
