ability_npc_cave1_ursa = class({})

LinkLuaModifier( "modidfier_ability_npc_cave1_ursa","abilities/cave1/ability_npc_cave1_ursa", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modidfier_ability_npc_cave1_ursa_colb","abilities/cave1/ability_npc_cave1_ursa", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave1_ursa:GetIntrinsicModifierName()
    return "modidfier_ability_npc_cave1_ursa"
end

modidfier_ability_npc_cave1_ursa = class({})

--Classifications template
function modidfier_ability_npc_cave1_ursa:IsHidden()
   return true
end

function modidfier_ability_npc_cave1_ursa:IsPurgable()
   return false
end

function modidfier_ability_npc_cave1_ursa:DeclareFunctions()
   return {
       MODIFIER_EVENT_ON_ATTACK_LANDED,
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modidfier_ability_npc_cave1_ursa:OnAttackLanded(data)
    if data.target == self:GetParent() and RollPseudoRandom(10, data.target) then
        data.attacker:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_stunned", {duration = 0.25})
    end
end

function modidfier_ability_npc_cave1_ursa:GetModifierProcAttack_Feedback(data)
    if RollPseudoRandom(10, self:GetParent()) then
        data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modidfier_ability_npc_cave1_ursa_colb", {duration = 3})
    end
end
    
modidfier_ability_npc_cave1_ursa_colb = class({})
--Classifications template
function modidfier_ability_npc_cave1_ursa_colb:IsHidden()
   return false
end

function modidfier_ability_npc_cave1_ursa_colb:IsDebuff()
   return true
end

function modidfier_ability_npc_cave1_ursa_colb:IsPurgable()
   return true
end

-- Optional Classifications
function modidfier_ability_npc_cave1_ursa_colb:IsStunDebuff()
    return true
end

function modidfier_ability_npc_cave1_ursa_colb:RemoveOnDeath()
   return true
end

function modidfier_ability_npc_cave1_ursa_colb:DestroyOnExpire()
    return true
end

function modidfier_ability_npc_cave1_ursa_colb:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_DISABLE_HEALING,
}
end

function modidfier_ability_npc_cave1_ursa_colb:GetDisableHealing()
    return true
end

function modidfier_ability_npc_cave1_ursa_colb:CheckState()
    return {[MODIFIER_STATE_STUNNED] = true}
end

function modidfier_ability_npc_cave1_ursa_colb:OnCreated()
    local particle_cast = "particles/econ/items/winter_wyvern/winter_wyvern_ti7/wyvern_cold_embrace_ti7buff.vpcf"

	self.effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
end

function modidfier_ability_npc_cave1_ursa_colb:OnDestroy()
	ParticleManager:DestroyParticle(self.effect_cast, false)
	ParticleManager:ReleaseParticleIndex(self.effect_cast)
end

