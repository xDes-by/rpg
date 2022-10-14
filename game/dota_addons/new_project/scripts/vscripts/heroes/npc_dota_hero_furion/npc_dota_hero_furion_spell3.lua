npc_dota_hero_furion_spell3 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_furion_spell3","heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_furion_spell3_effect","heroes/npc_dota_hero_furion/npc_dota_hero_furion_spell3", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_furion_spell3:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_furion_spell3"
end

modifier_npc_dota_hero_furion_spell3 = class({})

--Classifications template
function modifier_npc_dota_hero_furion_spell3:IsHidden()
    return true
end

function modifier_npc_dota_hero_furion_spell3:IsPurgable()
    return false
end

function modifier_npc_dota_hero_furion_spell3:OnCreated()
    self.chance = self:GetAbility():GetSpecialValueFor("chance")
    self.duration = self:GetAbility():GetSpecialValueFor("root_duration")
end

function modifier_npc_dota_hero_furion_spell3:OnRefresh()
    self:OnCreated()
end

function modifier_npc_dota_hero_furion_spell3:DeclareFunctions()
    return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_npc_dota_hero_furion_spell3:GetModifierProcAttack_Feedback(data)
    if RollPseudoRandom(self.chance,self:GetParent()) and not data.target:IsBossCreature() then
        data.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_furion_spell3_effect", {duration = self.duration})
    end
end

modifier_npc_dota_hero_furion_spell3_effect = class({})

function modifier_npc_dota_hero_furion_spell3_effect:IsHidden()
    return true
end

function modifier_npc_dota_hero_furion_spell3_effect:IsPurgable()
    return true
end

function modifier_npc_dota_hero_furion_spell3_effect:OnCreated()
    self.part = ParticleManager:CreateParticle("particles/units/heroes/hero_lone_druid/lone_druid_bear_entangle.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
end

function modifier_npc_dota_hero_furion_spell3_effect:OnDestroy()
    ParticleManager:DestroyParticle(self.part, false)
end

function modifier_npc_dota_hero_furion_spell3_effect:GetEffectName()
	return "particles/units/heroes/hero_lone_druid/lone_druid_bear_entangle_body.vpcf"
end

function modifier_npc_dota_hero_furion_spell3_effect:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

function modifier_npc_dota_hero_furion_spell3_effect:CheckState()
    return {
        [MODIFIER_STATE_DISARMED] = true,
        [MODIFIER_STATE_ROOTED] = true
    }
end