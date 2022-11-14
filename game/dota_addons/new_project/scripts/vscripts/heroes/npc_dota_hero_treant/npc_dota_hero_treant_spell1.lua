LinkLuaModifier( "modifier_npc_dota_hero_treant_spell1", "heroes/npc_dota_hero_treant/npc_dota_hero_treant_spell1", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_treant_spell1 = class({})

function npc_dota_hero_treant_spell1:OnSpellStart()
    local thinker = CreateModifierThinker(self:GetCaster(), self, "modifier_npc_dota_hero_treant_spell1", {duration = self:GetSpecialValueFor( "duration" )}, self:GetCursorPosition(), DOTA_TEAM_GOODGUYS, false)
    CreateTempTreeWithModel( self:GetCursorPosition(), self:GetSpecialValueFor("duration"), "models/heroes/hoodwink/hoodwink_tree_model.vmdl" )
end

modifier_npc_dota_hero_treant_spell1 = class({})

function modifier_npc_dota_hero_treant_spell1:IsHidden()
    return true
end

function modifier_npc_dota_hero_treant_spell1:OnCreated()
    self:StartIntervalThink(1)
    self:OnIntervalThink()
end

function modifier_npc_dota_hero_treant_spell1:OnIntervalThink()
    self:CreatePulse(self:GetParent())
end

function modifier_npc_dota_hero_treant_spell1:OnDestroy()
	if not IsServer() then return end
	UTIL_Remove(self:GetParent())
end

function modifier_npc_dota_hero_treant_spell1:CreatePulse(thinker)
	if not IsServer() then return end
    local speed = self:GetAbility():GetSpecialValueFor( "speed" )
    local heal = self:GetAbility():GetSpecialValueFor( "heal" )
    local damage = self:GetAbility():GetSpecialValueFor( "damage" )
    local radius = self:GetAbility():GetSpecialValueFor( "radius" )
    local dt = self:GetAbility():GetAbilityDamageType()
    local effect_cast = ParticleManager:CreateParticle( "particles/npc_dota_hero_treant/npc_dota_hero_treant_spell1.vpcf", PATTACH_ABSORIGIN_FOLLOW, thinker )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( speed, radius, 1 ) )
	EmitSoundOn( "Ability.PlasmaField", thinker )
    self.pulse = thinker:AddNewModifier(self:GetCaster(), self, "modifier_generic_ring_lua",
        {end_radius = radius, speed = speed, target_team = DOTA_UNIT_TARGET_TEAM_BOTH, target_type = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC})
    self.pulse:SetCallback( function( unit )
        if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
            unit:Heal(heal, self)
	        SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, unit, heal, nil)
        else
            ApplyDamage({victim = unit,
            damage = damage,
            damage_type = dt,
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            attacker = self:GetCaster(),
            ability = self})
        end
	    EmitSoundOn( "Ability.PlasmaFieldImpact", enemy )
    end)
    self.pulse:SetEndCallback( function()
        ParticleManager:SetParticleControl( effect_cast, 1, Vector( speed, radius, -1 ) )
        ParticleManager:DestroyParticle( effect_cast, false )
        ParticleManager:ReleaseParticleIndex( effect_cast )
    end)
end