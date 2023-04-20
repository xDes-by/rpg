LinkLuaModifier( "modifier_npc_dota_hero_nevermore_spell1","heroes/npc_dota_hero_nevermore/npc_dota_hero_nevermore_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_nevermore_spell1_soul_burn","heroes/npc_dota_hero_nevermore/npc_dota_hero_nevermore_spell1", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_nevermore_spell1 = class({})

function npc_dota_hero_nevermore_spell1:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_nevermore_spell1"
end

-------------------------------------------------------------------------------------------------

modifier_npc_dota_hero_nevermore_spell1 = class({})

function modifier_npc_dota_hero_nevermore_spell1:IsHidden()
    return true
end

function modifier_npc_dota_hero_nevermore_spell1:IsPurgable()
    return false
end

function modifier_npc_dota_hero_nevermore_spell1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK 
    }
end

function modifier_npc_dota_hero_nevermore_spell1:GetModifierProcAttack_Feedback(data)
    if RandomInt(1,100) <=  self:GetAbility():GetSpecialValueFor("chance") and not data.target:IsAncient() and not data.target:HasModifier("modifier_npc_dota_hero_nevermore_spell1_soul_burn") then
        data.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_nevermore_spell1_soul_burn", {})
        local eff = ParticleManager:CreateParticle("particles/units/heroes/hero_doom_bringer/doom_bringer_lvl_death.vpcf", PATTACH_POINT_FOLLOW, data.target)
        ParticleManager:ReleaseParticleIndex(eff)
		
		self.mod = self:GetCaster():FindModifierByName("modifier_npc_dota_hero_nevermore_spell3")
		
        if self.mod then
            self.mod:IncrementStackCount()
        end
    end
end

-------------------------------------------------------------------------------------------------

modifier_npc_dota_hero_nevermore_spell1_soul_burn = class({})

function modifier_npc_dota_hero_nevermore_spell1_soul_burn:IsHidden()
    return false
end

function modifier_npc_dota_hero_nevermore_spell1_soul_burn:IsDebuff()
    return true
end

function modifier_npc_dota_hero_nevermore_spell1_soul_burn:IsPurgable()
    return false
end

function modifier_npc_dota_hero_nevermore_spell1_soul_burn:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_nevermore_spell1_soul_burn:OnCreated()
	self.damage = self:GetAbility():GetSpecialValueFor("hp_damage") * self:GetParent():GetMaxHealth() / 100
    self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_nevermore_spell1_soul_burn:OnIntervalThink()
    if not IsServer() then return end
    ApplyDamage({victim = self:GetParent(),
    damage = self.damage,
    damage_type = self:GetAbility():GetAbilityDamageType(),
    attacker = self:GetCaster()})
end

function modifier_npc_dota_hero_nevermore_spell1_soul_burn:GetEffectName()
	return "particles/units/heroes/hero_jakiro/jakiro_liquid_fire_debuff.vpcf"
end

function modifier_npc_dota_hero_nevermore_spell1_soul_burn:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end