ability_npc_gaveyard2_gohoul_tkyo_uha = class({})

LinkLuaModifier( "modifier_ability_npc_gaveyard2_gohoul_tkyo_uha","abilities/gaveyard2/ability_npc_gaveyard2_gohoul_tkyo_uha", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker","abilities/gaveyard2/ability_npc_gaveyard2_gohoul_tkyo_uha", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker_effect","abilities/gaveyard2/ability_npc_gaveyard2_gohoul_tkyo_uha", LUA_MODIFIER_MOTION_NONE )

function ability_npc_gaveyard2_gohoul_tkyo_uha:OnToggle() 
    if self:GetCaster():HasModifier("modifier_ability_npc_gaveyard2_gohoul_tkyo_uha") then
        self:GetCaster():RemoveModifierByName("modifier_ability_npc_gaveyard2_gohoul_tkyo_uha")
    else
        self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_gaveyard2_gohoul_tkyo_uha", {})
    end
end

modifier_ability_npc_gaveyard2_gohoul_tkyo_uha = class({})

--Classifications template
function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha:IsHidden()
   return true
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha:OnCreated(table)
    self:StartIntervalThink(5)
    self:OnIntervalThink()
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha:OnIntervalThink()
    if IsClient() then
        return
    end
    CreateModifierThinker(self:GetCaster(),self:GetAbility(),"modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker",{ duration = 5 },self:GetParent():GetAbsOrigin(),self:GetCaster():GetTeamNumber(),false)
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha:GetEffectName()
	return "particles/econ/items/bloodseeker/bloodseeker_eztzhok_weapon/bloodseeker_bloodrage_eztzhok_ovr.vpcf"
end

modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker = class({})
--Classifications template
function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker:IsHidden()
   return true
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker:OnCreated()
    local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_alchemist/alchemist_acid_spray.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( 200, 1, 1 ) )
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker:OnDestroy()
    UTIL_Remove(self:GetParent())
end

-- Aura template
function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker:IsAura()
    return true
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker:GetModifierAura()
    return "modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker_effect"
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker:GetAuraRadius()
    return 200
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker:GetAuraDuration()
    return 0.5
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker_effect = class({})
--Classifications template
function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker_effect:IsHidden()
   return false
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker_effect:IsDebuff()
   return true
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker_effect:IsPurgable()
   return false
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker_effect:RemoveOnDeath()
   return true
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker_effect:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
    }
end

function modifier_ability_npc_gaveyard2_gohoul_tkyo_uha_thinker_effect:GetModifierConstantHealthRegen()
    return -99999
end
