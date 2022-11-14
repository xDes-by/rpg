modifier_cold = class({})

function modifier_cold:IsHidden()
    return false
end

function modifier_cold:IsPurgable()
    return false
end

function modifier_cold:RemoveOnDeath()
    return false
end

function modifier_cold:DeclareFunctions()
   return { MODIFIER_PROPERTY_DISABLE_HEALING,}
end

function modifier_cold:GetDisableHealing()
	if not self:GetParent():HasModifier("modifier_campfire") then
		return 1
	end
	return 0
end

function modifier_cold:GetEffectName()
	if not self:GetParent():HasModifier("modifier_campfire") then
		return "particles/units/heroes/hero_ancient_apparition/ancient_apparition_ice_blast_debuff.vpcf"
	end
	return
end

function modifier_cold:GetStatusEffectName()
	if not self:GetParent():HasModifier("modifier_campfire") then
		return "particles/status_fx/status_effect_frost.vpcf"
	end
	return	
end

function modifier_cold:OnCreated(params)
	if not IsServer() then return end
	self.damage = self:GetParent():GetMaxHealth()*0.01
	
	self.damage_table	= {
		victim 			= self:GetParent(),
		damage 			= self.damage,
		damage_type		= DAMAGE_TYPE_MAGICAL,
		damage_flags 	= DOTA_DAMAGE_FLAG_NONE,
		attacker 		= self:GetParent(),
	}
	self:StartIntervalThink(1)
end

function modifier_cold:OnIntervalThink()
	if not self:GetParent():HasModifier("modifier_campfire") then
		self:GetParent():EmitSound("Hero_Ancient_Apparition.IceBlastRelease.Tick")
		ApplyDamage(self.damage_table)
		SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, self:GetParent(), self.damage, nil)
	end	
end