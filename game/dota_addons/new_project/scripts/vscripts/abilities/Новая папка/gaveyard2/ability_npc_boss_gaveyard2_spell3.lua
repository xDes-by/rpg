ability_npc_boss_gaveyard2_spell3 = class({})

LinkLuaModifier("modifier_ability_npc_boss_gaveyard2_spell3", "abilities/gaveyard2/ability_npc_boss_gaveyard2_spell3", LUA_MODIFIER_MOTION_NONE)

function ability_npc_boss_gaveyard2_spell3:OnSpellStart()
    self:GetCursorTarget():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_gaveyard2_spell3", {duration = 4})
end

modifier_ability_npc_boss_gaveyard2_spell3 = class({})

function modifier_ability_npc_boss_gaveyard2_spell3:IsHidden()
	return false
end

function modifier_ability_npc_boss_gaveyard2_spell3:IsDebuff()
	return true
end

function modifier_ability_npc_boss_gaveyard2_spell3:IsStunDebuff()
	return false
end

function modifier_ability_npc_boss_gaveyard2_spell3:IsPurgable()
	return true
end

function modifier_ability_npc_boss_gaveyard2_spell3:CanParentBeAutoAttacked()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_ability_npc_boss_gaveyard2_spell3:OnCreated( kv )
	-- references
	self.anim_rate = 0.1

	if IsServer() then
		self.invulnerable = true

		-- play sound
		local sound_cast = "Hero_Bane.Nightmare"
		local sound_loop = "Hero_Bane.Nightmare.Loop"
		EmitSoundOn( sound_cast, self:GetParent() )
		EmitSoundOn( sound_loop, self:GetParent() )
	end
end


function modifier_ability_npc_boss_gaveyard2_spell3:OnDestroy()
	if not IsServer() then return end
	local sound_loop = "Hero_Bane.Nightmare.Loop"
	StopSoundOn( sound_loop, self:GetParent() )

	if not self.transfer then
		local sound_stop = "Hero_Bane.Nightmare.End"
		EmitSoundOn( sound_stop, self:GetParent() )
	end
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_ability_npc_boss_gaveyard2_spell3:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,

		MODIFIER_EVENT_ON_ATTACK_START,
	}

	return funcs
end

function modifier_ability_npc_boss_gaveyard2_spell3:GetOverrideAnimation()
	return ACT_DOTA_FLAIL
end

function modifier_ability_npc_boss_gaveyard2_spell3:GetOverrideAnimationRate()
	return self.anim_rate
end

function modifier_ability_npc_boss_gaveyard2_spell3:OnAttackStart( params )
	if not IsServer() then return end
	if params.target~=self:GetParent() then return end
	if not params.attacker:IsMagicImmune() then
		-- transfer
		local modifier = params.attacker:AddNewModifier(
			self:GetCaster(), -- player source
			self:GetAbility(), -- ability source
			"modifier_ability_npc_boss_gaveyard2_spell3", -- modifier name
			{ duration = self:GetDuration() } -- kv
		)

		self:GetAbility().modifier = modifier
		self.transfer = true
	end
	self:Destroy()
end

--------------------------------------------------------------------------------
-- Status Effects
function modifier_ability_npc_boss_gaveyard2_spell3:CheckState()
	local state = {
		[MODIFIER_STATE_NIGHTMARED] = true,
		[MODIFIER_STATE_STUNNED] = true,
	}

	return state
end

function modifier_ability_npc_boss_gaveyard2_spell3:GetEffectName()
	return "particles/units/heroes/hero_bane/bane_nightmare.vpcf"
end

function modifier_ability_npc_boss_gaveyard2_spell3:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end