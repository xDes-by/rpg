LinkLuaModifier("modifier_zombie_slow", "abilities/dark/dark_1/zombie_slow", LUA_MODIFIER_MOTION_VERTICAL)
LinkLuaModifier("modifier_movespeed_slow", "abilities/dark/dark_1/zombie_slow", LUA_MODIFIER_MOTION_VERTICAL)

zombie_slow = class({})

function zombie_slow:GetIntrinsicModifierName()
	return "modifier_zombie_slow"
end

------------------------------------------------------------------------------------------------------------------------------------------------------------
modifier_zombie_slow = class({})

function modifier_zombie_slow:IsHidden()
	return true
end

function modifier_zombie_slow:IsPurgable()
	return false
end

function modifier_zombie_slow:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACK_LANDED,
	}
	return funcs
end

function modifier_zombie_slow:OnAttackLanded( keys )
	if IsServer() then
		if self:GetParent() ~= keys.attacker then return end
		local target = keys.target
			if not target:HasModifier("modifier_movespeed_slow") then
			target:AddNewModifier(keys.attacker, self:GetAbility(), "modifier_movespeed_slow", {duration = self:GetAbility():GetSpecialValueFor( "duration" )})
		end	
	end
end

-----------------------------------------------------------------------------------------

modifier_movespeed_slow = class({})

function modifier_movespeed_slow:IsHidden()
	return true
end

function modifier_movespeed_slow:DeclareFunctions()
	return { MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE  }
end

function modifier_movespeed_slow:GetModifierMoveSpeedBonus_Percentage()
	return -15
end

function modifier_movespeed_slow:OnCreated( kv )
if not IsServer() then return end
	self.damageTable = {
		victim = self:GetParent(),
		attacker = self:GetCaster(),
		damage = self:GetAbility():GetSpecialValueFor( "damage" ),
		damage_type = DAMAGE_TYPE_MAGICAL,
	}
	SendOverheadEventMessage( nil, OVERHEAD_ALERT_BONUS_POISON_DAMAGE, self:GetParent(), self.damageTable.damage, self:GetCaster():GetPlayerOwner())
	self:StartIntervalThink( 1 )
end

function modifier_movespeed_slow:OnIntervalThink()
if not IsServer() then return end
	ApplyDamage( self.damageTable )
	SendOverheadEventMessage( nil, OVERHEAD_ALERT_BONUS_POISON_DAMAGE, self:GetParent(), self.damageTable.damage, self:GetCaster():GetPlayerOwner())
end

function modifier_movespeed_slow:GetEffectName()
	return "particles/units/heroes/hero_viper/viper_corrosive_debuff.vpcf"
end

function modifier_movespeed_slow:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end