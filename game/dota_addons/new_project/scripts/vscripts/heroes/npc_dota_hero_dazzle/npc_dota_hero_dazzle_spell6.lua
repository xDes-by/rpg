LinkLuaModifier( "modifier_npc_dota_hero_dazzle_spell6", "heroes/npc_dota_hero_dazzle/npc_dota_hero_dazzle_spell6.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_dazzle_spell6_target", "heroes/npc_dota_hero_dazzle/npc_dota_hero_dazzle_spell6.lua", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_dazzle_spell6 = class({})

function npc_dota_hero_dazzle_spell6:OnSpellStart()
	self.target = self:GetCursorTarget()
	
end

function npc_dota_hero_dazzle_spell6:OnSpellStart()
	self.duration = self:GetSpecialValueFor("duration")
	
	
	self:GetCursorTarget():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_dazzle_spell6_target",  {duration = self.duration})
	self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_dazzle_spell6", {duration = self.duration})
end

--------------------------------------------------------------------------------------------------------------------------------------------

modifier_npc_dota_hero_dazzle_spell6_target = class({})

function modifier_npc_dota_hero_dazzle_spell6_target:IsHidden()
	return false
end

function modifier_npc_dota_hero_dazzle_spell6_target:IsPurgable()
	return false
end

function modifier_npc_dota_hero_dazzle_spell6_target:OnCreated(params)
	if IsServer() then 
	self.hp = self:GetCaster():GetHealth()
	self.mp = self:GetCaster():GetMana()
	
	self.damage = self:GetCaster():GetBaseDamageMin()
	
	self.radius = self:GetAbility():GetSpecialValueFor("radius")
	EmitSoundOn("Hero_Wisp.Tether.Target", self:GetParent())
	
	self.pfx = ParticleManager:CreateParticle("particles/dazzle/dazzle_tether.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	ParticleManager:SetParticleControlEnt(self.pfx, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetAbsOrigin(), true)
	ParticleManager:SetParticleControlEnt(self.pfx, 1, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
	
	end
		
	self:StartIntervalThink(FrameTime())
end

function modifier_npc_dota_hero_dazzle_spell6_target:OnIntervalThink()
	if IsServer() then 
		if (self:GetCaster():GetAbsOrigin() - self:GetParent():GetAbsOrigin()):Length2D() <= self.radius then
			return
		end		
		self:GetParent():RemoveModifierByName("modifier_npc_dota_hero_dazzle_spell6_target")
		self:GetCaster():ForceKill(false)
	end
end

function modifier_npc_dota_hero_dazzle_spell6_target:DeclareFunctions()
	local decFuncs = {
		MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE,
		MODIFIER_PROPERTY_HEALTH_BONUS,
		MODIFIER_PROPERTY_MANA_BONUS	
	}
	return decFuncs
end

function modifier_npc_dota_hero_dazzle_spell6_target:GetModifierBaseAttack_BonusDamage()
	return self.damage
end

function modifier_npc_dota_hero_dazzle_spell6_target:GetModifierHealthBonus(keys)
	return self.hp
end

function modifier_npc_dota_hero_dazzle_spell6_target:GetModifierManaBonus(keys)
	return self.mp
end



function modifier_npc_dota_hero_dazzle_spell6_target:OnRemoved()
	if IsServer() then
		ParticleManager:DestroyParticle(self.pfx, false)
		ParticleManager:ReleaseParticleIndex(self.pfx)
	
		if self:GetCaster():IsAlive() then
			self:GetCaster():Heal(self:GetCaster():GetMaxHealth() * 0.25, self:GetCaster())
			self:GetCaster():SetMana( self:GetCaster():GetMaxMana() * 0.25 + self:GetCaster():GetMana())
			SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetCaster(), self:GetCaster():GetMaxHealth()*0.15, nil)
		end
	end
end

------------------------------------------------------------------------------------------------------------

modifier_npc_dota_hero_dazzle_spell6 = class({})

function modifier_npc_dota_hero_dazzle_spell6_target:IsHidden()
	return false
end

function modifier_npc_dota_hero_dazzle_spell6_target:IsPurgable()
	return false
end

function modifier_npc_dota_hero_dazzle_spell6:OnCreated()
	if IsServer() then
		self:GetParent():SetHealth(1)
		self:GetParent():SetMana(1)
		self.damage = self:GetCaster():GetBaseDamageMin() * (-1)
		self:GetParent():EmitSound("Hero_Wisp.Tether")
	end
end

function modifier_npc_dota_hero_dazzle_spell6:DeclareFunctions()
	local decFuncs = {
		MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE,
	}
	return decFuncs
end

function modifier_npc_dota_hero_dazzle_spell6:GetModifierBaseAttack_BonusDamage(keys)
	return self.damage
end