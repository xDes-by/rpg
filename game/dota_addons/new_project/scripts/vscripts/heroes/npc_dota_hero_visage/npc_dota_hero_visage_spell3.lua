LinkLuaModifier( "modifier_npc_dota_hero_visage_spell3", "heroes/npc_dota_hero_visage/npc_dota_hero_visage_spell3", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_visage_spell3 = class({})

function npc_dota_hero_visage_spell3:OnSpellStart()
    local caster = self:GetCaster()
    local dur = self:GetSpecialValueFor("duration")
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, caster:GetAbsOrigin(), nil, self:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in ipairs(enemies) do
        unit:AddNewModifier(caster, self, "modifier_npc_dota_hero_visage_spell3", {duration = dur})
    end
	EmitSoundOn("Hero_Visage.SoulAssumption.Target", self:GetCaster() )
	self:PlayEffects()
end

function npc_dota_hero_visage_spell3:PlayEffects()
	local effect_cast = ParticleManager:CreateParticle( "particles/vis3.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControlEnt(effect_cast, 1, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_mouth", Vector(0,0,0), true )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end

-----------------------------------------------------------------------------

modifier_npc_dota_hero_visage_spell3 = class({})

function modifier_npc_dota_hero_visage_spell3:IsHidden()
    return false
end

function modifier_npc_dota_hero_visage_spell3:IsDebuff()
    return true
end

function modifier_npc_dota_hero_visage_spell3:IsPurgable()
    return true
end

function modifier_npc_dota_hero_visage_spell3:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_visage_spell3:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_visage_spell3:OnCreated()
    self.damage = self:GetAbility():GetSpecialValueFor("bonus_damage")
end

function modifier_npc_dota_hero_visage_spell3:DeclareFunctions()
    return {
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
    }
end

function modifier_npc_dota_hero_visage_spell3:GetModifierIncomingDamage_Percentage()
    return self.damage
end

function modifier_npc_dota_hero_visage_spell3:GetStatusEffectName()
	return "particles/status_fx/status_effect_medusa_stone_gaze.vpcf"
end

function modifier_npc_dota_hero_visage_spell3:StatusEffectPriority()
	return MODIFIER_PRIORITY_ULTRA
end

function modifier_npc_dota_hero_visage_spell3:CheckState()
	return {
        [MODIFIER_STATE_FROZEN] = true,
		[MODIFIER_STATE_STUNNED] = true
	}
end