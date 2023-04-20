LinkLuaModifier( "modifier_npc_dota_hero_necrolyte_spell2", "heroes/npc_dota_hero_necrolyte/npc_dota_hero_necrolyte_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_necrolyte_spell2_shoud", "heroes/npc_dota_hero_necrolyte/npc_dota_hero_necrolyte_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_necrolyte_spell2_shoud_buff", "heroes/npc_dota_hero_necrolyte/npc_dota_hero_necrolyte_spell2", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_necrolyte_spell2 = class({})

function npc_dota_hero_necrolyte_spell2:OnSpellStart()
	local caster = self:GetCaster()
	local duration = self:GetSpecialValueFor("duration")

	caster:EmitSound("Hero_Necrolyte.SpiritForm.Cast")

	caster:StartGesture(ACT_DOTA_NECRO_GHOST_SHROUD)
	caster:AddNewModifier(caster, self, "modifier_npc_dota_hero_necrolyte_spell2", { duration = duration })
	caster:AddNewModifier(caster, self, "modifier_npc_dota_hero_necrolyte_spell2_shoud", { duration = duration})
	caster:AddNewModifier(caster, self, "modifier_npc_dota_hero_necrolyte_spell2_shoud_buff", { duration = duration})
end

---------------------------------------------

modifier_npc_dota_hero_necrolyte_spell2 = class({})

function modifier_npc_dota_hero_necrolyte_spell2:IsHidden()
	return true
end

function modifier_npc_dota_hero_necrolyte_spell2:IsPurgable()
	return true
end

function modifier_npc_dota_hero_necrolyte_spell2:GetEffectName()
	return "particles/units/heroes/hero_pugna/pugna_decrepify.vpcf"
end

function modifier_npc_dota_hero_necrolyte_spell2:GetEffectAttachType()
	return PATTACH_POINT_FOLLOW
end

function modifier_npc_dota_hero_necrolyte_spell2:OnCreated()
	self.healing_amp_pct = self:GetAbility():GetSpecialValueFor("healing_amp_pct")

	if not IsServer() then return end
	self:StartIntervalThink(FrameTime())
end

function modifier_npc_dota_hero_necrolyte_spell2:OnIntervalThink()
	if not IsServer() then return end
	if self:GetParent():IsMagicImmune() then self:Destroy()	end
end

function modifier_npc_dota_hero_necrolyte_spell2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_DECREPIFY_UNIQUE,
		MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_PHYSICAL,
	}
end

function modifier_npc_dota_hero_necrolyte_spell2:GetModifierMagicalResistanceDecrepifyUnique( params )
	return self:GetAbility():GetSpecialValueFor("magic_amp_pct") * (-1)
end

function modifier_npc_dota_hero_necrolyte_spell2:GetAbsoluteNoDamagePhysical()
	if self:GetCaster() == self:GetParent() then
		return 1
	else
		return nil
	end
end

function modifier_npc_dota_hero_necrolyte_spell2:CheckState()
	return
	{
	[MODIFIER_STATE_DISARMED] = true,
	[MODIFIER_STATE_ATTACK_IMMUNE] = true,
	}
end

-----------------------------------------------------

modifier_npc_dota_hero_necrolyte_spell2_shoud = class({})

function modifier_npc_dota_hero_necrolyte_spell2_shoud:IsHidden()
	return false
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud:IsPurgable() 
	return false
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud:IsAura()
	return true
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud:GetEffectName()
	return "particles/units/heroes/hero_necrolyte/necrolyte_spirit.vpcf"
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud:StatusEffectPriority()
	return MODIFIER_PRIORITY_ULTRA
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud:GetEffectAttachType()
	return PATTACH_POINT_FOLLOW
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud:GetAuraEntityReject(target)
	if IsServer() then
		return false
	end
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud:GetAuraRadius()
	return self:GetAbility():GetSpecialValueFor("radius")
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_NONE
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud:GetModifierAura()
	return "modifier_npc_dota_hero_necrolyte_spell2_shoud_buff"
end

------------------------------------------------

modifier_npc_dota_hero_necrolyte_spell2_shoud_buff = class({})

function modifier_npc_dota_hero_necrolyte_spell2_shoud_buff:OnCreated()
	self.healing_amp_pct = self:GetAbility():GetSpecialValueFor("healing_amp_pct")
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud_buff:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE,
		MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE,
	}
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud_buff:GetModifierHealthRegenPercentage()
	return self.healing_amp_pct
end

function modifier_npc_dota_hero_necrolyte_spell2_shoud_buff:GetModifierTotalPercentageManaRegen()
	return self.healing_amp_pct
end