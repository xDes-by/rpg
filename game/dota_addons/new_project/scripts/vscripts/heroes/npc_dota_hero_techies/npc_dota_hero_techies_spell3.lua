npc_dota_hero_techies_spell3 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_techies_spell3", "heroes/npc_dota_hero_techies/npc_dota_hero_techies_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_techies_spell3_effect", "heroes/npc_dota_hero_techies/npc_dota_hero_techies_spell3", LUA_MODIFIER_MOTION_NONE )


function npc_dota_hero_techies_spell3:OnSpellStart()
    self:GetCursorTarget():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_techies_spell3", {duration = 5})
end

modifier_npc_dota_hero_techies_spell3 = class({})
--Classifications template
function modifier_npc_dota_hero_techies_spell3:IsHidden()
    return false
end

function modifier_npc_dota_hero_techies_spell3:IsDebuff()
    return false
end

function modifier_npc_dota_hero_techies_spell3:IsPurgable()
    return true
end

function modifier_npc_dota_hero_techies_spell3:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_techies_spell3:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_techies_spell3:OnCreated()
    self.me = self:GetParent()
    self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_techies/techies_tazer.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControl( self.effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 300, 1, 1 ) )
end

function modifier_npc_dota_hero_techies_spell3:OnDestroy()
    ParticleManager:DestroyParticle(self.effect_cast, true)
    ParticleManager:ReleaseParticleIndex(self.effect_cast)
end

function modifier_npc_dota_hero_techies_spell3:GetStatusEffectName()
    return "particles/status_fx/status_effect_techies_tazer.vpcf"
end

function modifier_npc_dota_hero_techies_spell3:StatusEffectPriority()
    return 1
end

function modifier_npc_dota_hero_techies_spell3:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_ATTACK_LANDED
    }
end

function modifier_npc_dota_hero_techies_spell3:OnAttackLanded(data)
    if data.target:IsBossCreature() or data.attacker:IsBossCreature() then 
        return 
    end
    if  self.me == data.target then
        data.attacker:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_techies_spell3_effect", {duration = 0.5})
    end
    if self.me == data.attacker then
        data.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_techies_spell3_effect", {duration = 0.5})
    end
end

modifier_npc_dota_hero_techies_spell3_effect = class({})
--Classifications template
function modifier_npc_dota_hero_techies_spell3_effect:IsHidden()
    return false
end

function modifier_npc_dota_hero_techies_spell3_effect:IsDebuff()
    return true
end

function modifier_npc_dota_hero_techies_spell3_effect:IsPurgable()
    return true
end

function modifier_npc_dota_hero_techies_spell3_effect:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_techies_spell3_effect:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_techies_spell3_effect:OnCreated()
    self.effect_cast = ParticleManager:CreateParticle( "particles/npc_dota_hero_techies/npc_dota_hero_techies_spell3.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
    if IsClient() then
        return
    end
    ApplyDamage({victim = self:GetParent(),
    damage =  self:GetAbility():GetSpecialValueFor("damage"),
    damage_type = self:GetAbility():GetAbilityDamageType(),
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_npc_dota_hero_techies_spell3_effect:OnDestroy()
    ParticleManager:DestroyParticle(self.effect_cast, true)
    ParticleManager:ReleaseParticleIndex(self.effect_cast)
end

function modifier_npc_dota_hero_techies_spell3_effect:CheckState()
    return {
        [MODIFIER_STATE_DISARMED] = true
    }
end
