ability_npc_cave2_grevil_gold = class({})

LinkLuaModifier( "modifier_ability_npc_cave2_grevil_gold","abilities/cave2/ability_npc_cave2_grevil_gold", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave2_grevil_gold:GetIntrinsicModifierName()
    return "modifier_ability_npc_cave2_grevil_gold"
end

modifier_ability_npc_cave2_grevil_gold = class({})

--Classifications template
function modifier_ability_npc_cave2_grevil_gold:IsHidden()
   return true
end

function modifier_ability_npc_cave2_grevil_gold:IsPurgable()
   return false
end

function modifier_ability_npc_cave2_grevil_gold:GetStatusEffectName()
	return "particles/econ/items/effigies/status_fx_effigies/status_effect_effigy_gold_lvl2.vpcf"
end

function modifier_ability_npc_cave2_grevil_gold:StatusEffectPriority(  )
	return MODIFIER_PRIORITY_ULTRA
end

function modifier_ability_npc_cave2_grevil_gold:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_cave2_grevil_gold:GetModifierProcAttack_Feedback(data)
    if data.target:IsHero() then
        data.target:ModifyGold(-5, true, DOTA_ModifyGold_Unspecified)
        self.money_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_bounty_hunter/bounty_hunter_jinada.vpcf", PATTACH_ABSORIGIN_FOLLOW, data.target)
        ParticleManager:SetParticleControlEnt(self.money_particle, 1, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
        ParticleManager:ReleaseParticleIndex(self.money_particle)
        EmitSoundOn("Hero_BountyHunter.Jinada", data.target)
    end
end