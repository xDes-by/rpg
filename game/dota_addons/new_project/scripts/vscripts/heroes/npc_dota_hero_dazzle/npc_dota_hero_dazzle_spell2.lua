LinkLuaModifier( "modifier_dazzle_skill_2", "heroes/npc_dota_hero_dazzle/npc_dota_hero_dazzle_spell2.lua", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_dazzle_spell2 = class({})

function npc_dota_hero_dazzle_spell2:OnSpellStart()
	if IsServer() then 
		local target = self:GetCursorTarget()
		local duration = self:GetSpecialValueFor("duration")
	
		self:GetCaster():EmitSound("Hero_Winter_Wyvern.ColdEmbrace.Cast");

		local cold_embrace_start_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_winter_wyvern/wyvern_cold_embrace_start.vpcf", PATTACH_POINT, self:GetCaster());
		ParticleManager:SetParticleControl(cold_embrace_start_particle, 0, self:GetCaster():GetAbsOrigin());
		ParticleManager:SetParticleControl(cold_embrace_start_particle, 1, self:GetCaster():GetAbsOrigin());
		ParticleManager:ReleaseParticleIndex(cold_embrace_start_particle);

		target:AddNewModifier(self:GetCaster(), self, "modifier_dazzle_skill_2", {duration = duration});
	end
end

-------------------------------------------------------------------------------------

modifier_dazzle_skill_2 = class({})

function modifier_dazzle_skill_2:IsHidden()
	return true
end

function modifier_dazzle_skill_2:IsPurgable()
	return false
end

function modifier_dazzle_skill_2:OnCreated( kv )
	self:StartIntervalThink(0.1)
end

function modifier_dazzle_skill_2:OnIntervalThink()
	local heal = self:GetAbility():GetSpecialValueFor("heal") * self:GetParent():GetMaxHealth() / 100
	
	self:GetParent():Heal(heal, self:GetParent())
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetParent(), heal, nil)
end

function modifier_dazzle_skill_2:DeclareFunctions() 
	decFuncs = {
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
	}
	return decFuncs
end

function modifier_dazzle_skill_2:GetModifierMagicalResistanceBonus()
	return 100
end

function modifier_dazzle_skill_2:CheckState()
	return {
		[MODIFIER_STATE_FROZEN] = true,
		[MODIFIER_STATE_STUNNED] = true,
	}
end

function modifier_dazzle_skill_2:GetEffectName()
	return "particles/dazzle/dazzle.vpcf"--"particles/units/heroes/hero_ancient_apparition/ancient_apparition_cold_feet_frozen.vpcf"
end

function modifier_dazzle_skill_2:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end