LinkLuaModifier( "modifier_baracks_hp", "abilities/jungle/jungle_1/baracks_hp", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_baracks_hp_effect", "abilities/jungle/jungle_1/baracks_hp", LUA_MODIFIER_MOTION_NONE )

baracks_hp = class({})

function baracks_hp:GetIntrinsicModifierName()
    return "modifier_baracks_hp"
end

-----------------------------------------------------------------------------------------

modifier_baracks_hp = class({})

function modifier_baracks_hp:IsHidden()
    return true
end

function modifier_baracks_hp:IsPurgable()
    return false
end

function modifier_baracks_hp:IsAura()
	return (not self:GetCaster():PassivesDisabled())
end

function modifier_baracks_hp:GetModifierAura()
	return "modifier_baracks_hp_effect"
end

function modifier_baracks_hp:GetAuraRadius()
	return 1500
end

function modifier_baracks_hp:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_baracks_hp:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_baracks_hp:OnCreated()
end

function modifier_baracks_hp:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
       MODIFIER_EVENT_ON_ATTACKED
}
end

function modifier_baracks_hp:CheckState()
	return {
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
	}
end

function modifier_baracks_hp:OnCreated()
    if not IsServer() then return end
    self:GetParent():SetBaseMaxHealth(5)
    self:GetParent():SetMaxHealth(5)
    self:GetParent():SetHealth(5)
end

function modifier_baracks_hp:GetModifierIncomingDamage_Percentage(data)
    return -100
end

function modifier_baracks_hp:OnAttacked(data)
	if not IsServer() then return end
    if data.attacker:GetUnitName() == "npc_jungle_dragon" and data.target == self:GetParent() then
        self:GetParent():SetHealth( self:GetParent():GetHealth() - 1 )
        if self:GetParent():GetHealth() == 0 then 
            self:GetParent():ForceKill(false)
        end
    end
end

----------------------------------------------------------------------

modifier_baracks_hp_effect = class({})

function modifier_baracks_hp_effect:IsHidden()
	return false
end

function modifier_baracks_hp_effect:IsDebuff()
	return false
end

function modifier_baracks_hp_effect:IsPurgable()
	return false
end

function modifier_baracks_hp_effect:OnCreated( kv )
    self.boost_as = self:GetAbility():GetSpecialValueFor( "boost_as" )
	self.boost_hpr = self:GetAbility():GetSpecialValueFor( "boost_hpr" )
	self:PlayEffects()
end

function modifier_baracks_hp_effect:OnDestroy( kv )

end

function modifier_baracks_hp_effect:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
	}
	return funcs
end

function modifier_baracks_hp_effect:GetModifierAttackSpeedBonus_Constant()
	return self.boost_as
end

function modifier_baracks_hp_effect:GetModifierConstantHealthRegen()
	return self.boost_hpr
end

function modifier_baracks_hp_effect:PlayEffects()
	self.effect_cast = ParticleManager:CreateParticle( "particles/baracks_buff.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControlEnt(
		self.effect_cast,
		0,
		self:GetParent(),
		PATTACH_OVERHEAD_FOLLOW,
		nil,
		self:GetParent():GetOrigin(), -- unknown
		true -- unknown, true
	)
	ParticleManager:SetParticleControlEnt(
		self.effect_cast,
		1,
		self:GetParent(),
		PATTACH_OVERHEAD_FOLLOW,
		nil,
		self:GetParent():GetOrigin(), -- unknown
		true -- unknown, true
	)
	ParticleManager:SetParticleControlEnt(
		self.effect_cast,
		2,
		self:GetParent(),
		PATTACH_OVERHEAD_FOLLOW,
		nil,
		self:GetParent():GetOrigin(), -- unknown
		true -- unknown, true
	)
	self:AddParticle(
		self.effect_cast,
		false,
		false,
		-1,
		false,
		true
	)
end