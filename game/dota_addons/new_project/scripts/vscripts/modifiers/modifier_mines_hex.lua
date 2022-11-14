modifier_mines_hex = class({})

function modifier_mines_hex:IsHidden()
	return false
end

function modifier_mines_hex:IsDebuff()
	return true
end

function modifier_mines_hex:IsPurgable()
	return false
end

function modifier_mines_hex:OnCreated( kv )
	self.model = "models/props_gameplay/frog.vmdl"

	if IsServer() then
		self:PlayEffects( true )
	end
end


function modifier_mines_hex:OnDestroy( kv )
	if IsServer() then
		self:PlayEffects( false )
	end
end

function modifier_mines_hex:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MODEL_CHANGE,
	}

	return funcs
end

function modifier_mines_hex:GetModifierModelChange()
	return self.model
end

function modifier_mines_hex:CheckState()
	local state = {
	[MODIFIER_STATE_HEXED] = true,
	[MODIFIER_STATE_DISARMED] = true,
	[MODIFIER_STATE_SILENCED] = true,
	[MODIFIER_STATE_MUTED] = true,
	}

	return state
end


function modifier_mines_hex:PlayEffects( bStart )
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_lion/lion_spell_voodoo.vpcf", PATTACH_ABSORIGIN, self:GetParent() )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	EmitSoundOn( "Hero_Lion.Hex.Target", self:GetParent() )
end