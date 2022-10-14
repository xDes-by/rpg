ability_npc_jungle2_saxe = class({})

LinkLuaModifier( "modifier_ability_npc_jungle2_saxe","abilities/jungle2/ability_npc_jungle2_saxe", LUA_MODIFIER_MOTION_NONE )

function ability_npc_jungle2_saxe:OnSpellStart()
    local target = self:GetCursorTarget():GetAbsOrigin()
    local caster = self:GetCaster():GetAbsOrigin()
	local direction = (caster - target)
    self:EffectStart(target,direction)
    FindClearSpaceForUnit(self:GetCaster(), target, true)
    self:EffectEnd(target,direction)
	local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, target, nil, 300, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false )
    for _,unit in ipairs(enemies) do
        unit:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_jungle2_saxe", {duration = 3})
    end
end

function ability_npc_jungle2_saxe:EffectStart(origin, direction)
    local particle_cast_a = "particles/units/heroes/hero_antimage/antimage_blink_start.vpcf"
	local sound_cast_a = "Hero_Antimage.Blink_out"
	local effect_cast_a = ParticleManager:CreateParticle( particle_cast_a, PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast_a, 0, origin )
	ParticleManager:SetParticleControlForward( effect_cast_a, 0, direction:Normalized() )
	ParticleManager:ReleaseParticleIndex( effect_cast_a )
	EmitSoundOnLocationWithCaster( origin, sound_cast_a, self:GetCaster() )
end

function ability_npc_jungle2_saxe:EffectEnd(origin, direction)
	local particle_cast_b = "particles/units/heroes/hero_antimage/antimage_blink_end.vpcf"
	local sound_cast_b = "Hero_Antimage.Blink_in"

	local effect_cast_b = ParticleManager:CreateParticle( particle_cast_b, PATTACH_ABSORIGIN, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast_b, 0, self:GetCaster():GetAbsOrigin() )
	ParticleManager:SetParticleControlForward( effect_cast_b, 0, direction:Normalized() )
	ParticleManager:ReleaseParticleIndex( effect_cast_b )
	EmitSoundOnLocationWithCaster( self:GetCaster():GetAbsOrigin(), sound_cast_b, self:GetCaster() )
end

modifier_ability_npc_jungle2_saxe = class({})

function modifier_ability_npc_jungle2_saxe:IsHidden()
	return false
end

function modifier_ability_npc_jungle2_saxe:IsDebuff()
	return true
end

function modifier_ability_npc_jungle2_saxe:IsStunDebuff()
	return false
end

function modifier_ability_npc_jungle2_saxe:IsPurgable()
	return false
end

function modifier_ability_npc_jungle2_saxe:OnCreated( kv )
	if IsServer() then
		self:GetParent():SetForceAttackTarget( self:GetCaster() ) -- for creeps
		self:GetParent():MoveToTargetToAttack( self:GetCaster() ) -- for heroes
	end
end

function modifier_ability_npc_jungle2_saxe:OnRemoved()
	if IsServer() then
		self:GetParent():SetForceAttackTarget( nil )
	end
end

function modifier_ability_npc_jungle2_saxe:CheckState()
	return {
        [MODIFIER_STATE_TAUNTED] = true
	}
end

function modifier_ability_npc_jungle2_saxe:GetStatusEffectName()
	return "particles/status_fx/status_effect_beserkers_call.vpcf"
end