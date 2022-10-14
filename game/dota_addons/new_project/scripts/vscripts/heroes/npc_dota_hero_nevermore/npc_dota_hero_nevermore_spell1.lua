npc_dota_hero_nevermore_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_nevermore_spell1","heroes/npc_dota_hero_nevermore/npc_dota_hero_nevermore_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_nevermore_spell1_soul_burn","heroes/npc_dota_hero_nevermore/npc_dota_hero_nevermore_spell1", LUA_MODIFIER_MOTION_NONE )


function npc_dota_hero_nevermore_spell1:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_nevermore_spell1"
end

modifier_npc_dota_hero_nevermore_spell1 = class({})

--Classifications template
function modifier_npc_dota_hero_nevermore_spell1:IsHidden()
    return true
end

function modifier_npc_dota_hero_nevermore_spell1:IsPurgable()
    return false
end

function modifier_npc_dota_hero_nevermore_spell1:FindMod()
    if IsClient() then
        return
    end
    self.mod = self:GetParent():FindModifierByName("modifier_npc_dota_hero_nevermore_spell4")
    self.chance = self:GetAbility():GetSpecialValueFor("chance")
end

function modifier_npc_dota_hero_nevermore_spell1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK 
    }
end

function modifier_npc_dota_hero_nevermore_spell1:GetModifierProcAttack_Feedback(data)
    if RollPseudoRandom(self.chance,self:GetCaster()) and not data.target:IsBossCreature() then
        data.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_nevermore_spell1_soul_burn", {})
        local eff = ParticleManager:CreateParticle("particles/units/heroes/hero_doom_bringer/doom_bringer_lvl_death.vpcf", PATTACH_POINT_FOLLOW, data.target)
        ParticleManager:ReleaseParticleIndex(eff)
        data.target.HasSoul = false
        if self.mod:GetStackCount() < self.mod.maxstacks then
            self.mod:IncrementStackCount()
        end
    end
end

modifier_npc_dota_hero_nevermore_spell1_soul_burn = class({})
--Classifications template
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
    self.damage = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * self:GetAbility():GetSpecialValueFor("damage_persentage") * 0.01
    self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_nevermore_spell1_soul_burn:OnIntervalThink()
    if IsClient() then
        return
    end
    ApplyDamage({victim = self:GetParent(),
    damage = self.damage,
    damage_type = self:GetAbility():GetAbilityDamageType(),
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end