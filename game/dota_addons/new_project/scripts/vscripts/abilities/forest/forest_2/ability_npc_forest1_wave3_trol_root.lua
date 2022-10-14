ability_npc_forest1_wave3_trol_root = class({})

LinkLuaModifier( "modifier_ability_npc_forest1_wave3_trol_root","abilities/forest1/ability_npc_forest1_wave3_trol_root", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_forest1_wave3_trol_root_effect","abilities/forest1/ability_npc_forest1_wave3_trol_root", LUA_MODIFIER_MOTION_NONE )

function ability_npc_forest1_wave3_trol_root:GetIntrinsicModifierName()
    return "modifier_ability_npc_forest1_wave3_trol_root"
end

modifier_ability_npc_forest1_wave3_trol_root = class({})

--Classifications template
function modifier_ability_npc_forest1_wave3_trol_root:IsHidden()
   return true
end

function modifier_ability_npc_forest1_wave3_trol_root:IsPurgable()
   return false
end

function modifier_ability_npc_forest1_wave3_trol_root:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_forest1_wave3_trol_root:GetModifierProcAttack_Feedback(data)
    if RollPseudoRandom(self:GetAbility():GetSpecialValueFor("chance"), self:GetParent()) then
        data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_forest1_wave3_trol_root_effect", {duration = 1.5})
    end
end

modifier_ability_npc_forest1_wave3_trol_root_effect = class({})
--Classifications template
function modifier_ability_npc_forest1_wave3_trol_root_effect:IsHidden()
   return false
end

function modifier_ability_npc_forest1_wave3_trol_root_effect:IsDebuff()
   return true
end

function modifier_ability_npc_forest1_wave3_trol_root_effect:IsPurgable()
   return true
end

function modifier_ability_npc_forest1_wave3_trol_root_effect:IsPurgeException()
    return true
end

function modifier_ability_npc_forest1_wave3_trol_root_effect:RemoveOnDeath()
   return true
end

function modifier_ability_npc_forest1_wave3_trol_root_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_forest1_wave3_trol_root_effect:OnCreated()
	local particle_cast = "particles/units/heroes/hero_treant/treant_bramble_root.vpcf"

	self.effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( self.effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 90, 90, 90 ) )
end

function modifier_ability_npc_forest1_wave3_trol_root_effect:OnDestroy()
    ParticleManager:DestroyParticle(self.effect_cast,false)
end

function modifier_ability_npc_forest1_wave3_trol_root_effect:CheckState()
   return {
       [MODIFIER_STATE_ROOTED] = true
}
end
