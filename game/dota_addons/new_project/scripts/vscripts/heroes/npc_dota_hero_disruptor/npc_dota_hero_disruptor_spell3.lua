npc_dota_hero_disruptor_spell3 = class({})
LinkLuaModifier( "modifier_disruptor_skill_3_buff", "heroes/npc_dota_hero_disruptor/npc_dota_hero_disruptor_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_disruptor_skill_3_debuff", "heroes/npc_dota_hero_disruptor/npc_dota_hero_disruptor_spell3", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_disruptor_spell3:OnAbilityPhaseStart()
	return true
end

function npc_dota_hero_disruptor_spell3:OnSpellStart()
	if not IsServer() then return end
	self.fail_damage = self:GetSpecialValueFor("fail_damage")
	self.duration = self:GetSpecialValueFor("duration")
	self.target = self:GetCursorTarget()
	self:GetCaster():StartGesture(ACT_DOTA_TELEPORT)
	self:GetCaster():EmitSound("Hero_Disruptor.KineticField.Pinfold")	
	self.mainParticle = ParticleManager:CreateParticle("particles/units/heroes/hero_stormspirit/stormspirit_ball_lightning_sphere.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster())
end

function npc_dota_hero_disruptor_spell3:OnChannelFinish( bInterrupted )
	if bInterrupted then
		self:GetCaster():StopSound("Hero_Disruptor.KineticField.Pinfold")
		
		if self:GetCaster():HasModifier("modifier_disruptor_skill_3_buff") then self:GetCaster():RemoveModifierByName("modifier_disruptor_skill_3_buff") end
		self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_disruptor_skill_3_debuff", {duration = self.duration}) 
		
		self:GetCaster():EmitSound("Hero_Zuus.LightningBolt")
		local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_zuus/zuus_lightning_bolt.vpcf", PATTACH_WORLDORIGIN, self:GetCaster())
		target_point = self:GetCaster():GetAbsOrigin()
		ParticleManager:SetParticleControl(particle, 0, Vector(target_point.x, target_point.y, target_point.z))
		ParticleManager:SetParticleControl(particle, 1, Vector(target_point.x, target_point.y, 2000))
		ParticleManager:SetParticleControl(particle, 2, Vector(target_point.x, target_point.y, target_point.z))
		
		self.aoe_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_oracle/oracle_fortune_aoe.vpcf", PATTACH_WORLDORIGIN, self:GetCaster())
		ParticleManager:SetParticleControl(self.aoe_particle, 0, self:GetCaster():GetAbsOrigin())		
		ParticleManager:SetParticleControl(self.aoe_particle, 2, Vector(200, 200, 200))
		ParticleManager:ReleaseParticleIndex(self.aoe_particle)
		
		local damage_table 			= {}
		damage_table.attacker 		= self:GetCaster()
		damage_table.ability 		= self
		damage_table.damage_type 	= self:GetAbilityDamageType() 
		damage_table.damage			= self.fail_damage
		damage_table.victim 		= self:GetCaster()

		ApplyDamage(damage_table)
		self:GetCaster():FadeGesture(ACT_DOTA_TELEPORT)	
	else
		if self:GetCaster():HasModifier("modifier_disruptor_skill_3_debuff") then self:GetCaster():RemoveModifierByName("modifier_disruptor_skill_3_debuff") end
		self.target:AddNewModifier(self:GetCaster(), self, "modifier_disruptor_skill_3_buff", {duration = self.duration})
		self:GetCaster():FadeGesture(ACT_DOTA_TELEPORT)	
		self:GetCaster():EmitSound("Hero_Disruptor.Glimpse.End")	
	end
	ParticleManager:DestroyParticle(self.mainParticle, false)
	ParticleManager:ReleaseParticleIndex(self.mainParticle)	
end

---------------------------------------------------------------------

modifier_disruptor_skill_3_buff = class({})

function modifier_disruptor_skill_3_buff:IsHidden()
	return false
end

function modifier_disruptor_skill_3_buff:IsDebuff()
	return false
end

function modifier_disruptor_skill_3_buff:IsPurgable()
	return true
end

function modifier_disruptor_skill_3_buff:OnCreated( kv )
	self.particle = ParticleManager:CreateParticle("particles/disruptor/over1.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetCaster())
	ParticleManager:SetParticleControlEnt( self.particle, PATTACH_OVERHEAD_FOLLOW, self:GetCaster(), PATTACH_OVERHEAD_FOLLOW, "follow_overhead", self:GetCaster():GetAbsOrigin(), true )
	self.bonus_damage = self:GetAbility():GetSpecialValueFor( "bonus_damage" )
end

function modifier_disruptor_skill_3_buff:OnDestroy()
	ParticleManager:DestroyParticle(self.particle, false)
	ParticleManager:ReleaseParticleIndex(self.particle)
end

function modifier_disruptor_skill_3_buff:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE
	}
	return funcs
end

function modifier_disruptor_skill_3_buff:GetModifierSpellAmplify_Percentage( kv )
	return self.bonus_damage
end

---------------------------------------------------------------------

modifier_disruptor_skill_3_debuff = class({})

function modifier_disruptor_skill_3_debuff:IsHidden()
	return false
end

function modifier_disruptor_skill_3_debuff:IsDebuff()
	return true
end

function modifier_disruptor_skill_3_debuff:IsPurgable()
	return true
end

function modifier_disruptor_skill_3_debuff:OnCreated( kv )
	self.particle = ParticleManager:CreateParticle("particles/econ/events/diretide_2020/high_five/high_five_lvl1_overhead_soap_bubbles.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetCaster())
	ParticleManager:SetParticleControlEnt( self.particle, PATTACH_OVERHEAD_FOLLOW, self:GetCaster(), PATTACH_OVERHEAD_FOLLOW, "follow_overhead", self:GetCaster():GetAbsOrigin(), true )
	self.bonus_damage = self:GetAbility():GetSpecialValueFor( "bonus_damage" )
end

function modifier_disruptor_skill_3_debuff:OnDestroy()
	ParticleManager:DestroyParticle(self.particle, false)
	ParticleManager:ReleaseParticleIndex(self.particle)
end

function modifier_disruptor_skill_3_debuff:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE
	}
	return funcs
end

function modifier_disruptor_skill_3_debuff:GetModifierSpellAmplify_Percentage( kv )
	return -self.bonus_damage
end