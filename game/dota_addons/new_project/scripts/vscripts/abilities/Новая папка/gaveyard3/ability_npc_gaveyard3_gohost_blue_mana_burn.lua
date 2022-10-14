ability_npc_gaveyard3_gohost_blue_mana_burn = class({})

LinkLuaModifier( "modifier_ability_npc_gaveyard3_gohost_blue_mana_burn","abilities/gaveyard3/ability_npc_gaveyard3_gohost_blue_mana_burn", LUA_MODIFIER_MOTION_NONE )

function ability_npc_gaveyard3_gohost_blue_mana_burn:GetIntrinsicModifierName()
    return "modifier_ability_npc_gaveyard3_gohost_blue_mana_burn"
end

modifier_ability_npc_gaveyard3_gohost_blue_mana_burn = class({})

--Classifications template
function modifier_ability_npc_gaveyard3_gohost_blue_mana_burn:IsHidden()
   return true
end

function modifier_ability_npc_gaveyard3_gohost_blue_mana_burn:IsPurgable()
   return false
end

function modifier_ability_npc_gaveyard3_gohost_blue_mana_burn:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_gaveyard3_gohost_blue_mana_burn:GetModifierProcAttack_Feedback(data)
    data.target:ReduceMana(30)
	local effect_cast = ParticleManager:CreateParticle( "particles/generic_gameplay/generic_manaburn.vpcf", PATTACH_ABSORIGIN, data.target )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	EmitSoundOn( "Hero_Antimage.ManaBreak", data.target )
end

