LinkLuaModifier( "modifier_disruptor_skill_ultimate", "heroes/npc_dota_hero_disruptor/npc_dota_hero_disruptor_ultimate", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_disruptor_ultimate = class({})


function npc_dota_hero_disruptor_ultimate:OnSpellStart()
if not IsServer() then return end
	self.duration = self:GetSpecialValueFor("duration")
	
	local allies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self:GetCaster():GetAbsOrigin(), nil, FIND_UNITS_EVERYWHERE, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
	for _, ally in pairs(allies) do
		if ally:IsRealHero() and ally:IsAlive() then
			ally:AddNewModifier( self:GetCaster(), self, "modifier_disruptor_skill_ultimate", {duration = self.duration}):SetStackCount(self:GetSpecialValueFor("block_damage"))
		end
	end
end


---------------------------------------------------------------------------------------------------------------

modifier_disruptor_skill_ultimate = class({})

function modifier_disruptor_skill_ultimate:IsHidden()
	return false
end

function modifier_disruptor_skill_ultimate:IsDebuff()
	return false
end

function modifier_disruptor_skill_ultimate:IsPurgable()
	return false
end

function modifier_disruptor_skill_ultimate:RemoveOnDeath()
	return false
end

function modifier_disruptor_skill_ultimate:OnCreated( kv )
	if IsServer() then
		self.shield_particle = ParticleManager:CreateParticle("particles/items2_fx/mjollnir_shield.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
		self:AddParticle(self.shield_particle, false, false, -1, false, false)
		self:GetParent():EmitSound("DOTA_Item.Mjollnir.Loop")
	end
end

function modifier_disruptor_skill_ultimate:OnDestroy()
if not IsServer() then return end
	self:GetParent():StopSound("DOTA_Item.Mjollnir.Loop")
	
	local enemies = FindUnitsInRadius(self:GetParent():GetTeamNumber(), self:GetParent():GetAbsOrigin(), nil, 400, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_CLOSEST, false)
	for _, enemy in pairs(enemies) do
		enemy:EmitSound("Hero_Zuus.ArcLightning.Target")
		
		self.lightning_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_zuus/zuus_arc_lightning_.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
		ParticleManager:SetParticleControlEnt(self.lightning_particle, 0, self:GetParent(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetParent():GetAbsOrigin(), true)
		ParticleManager:SetParticleControlEnt(self.lightning_particle, 1, enemy, PATTACH_POINT_FOLLOW, "attach_hitloc", enemy:GetAbsOrigin(), true)
		ParticleManager:SetParticleControl(self.lightning_particle, 62, Vector(2, 0, 2))
		ParticleManager:ReleaseParticleIndex(self.lightning_particle)
						
		ApplyDamage({
			victim 			= enemy,
			damage 			= self:GetAbility():GetSpecialValueFor("deal_damage"),
			damage_type		= DAMAGE_TYPE_MAGICAL,
			attacker 		= self:GetCaster(),
			ability 		= self:GetAbility()
		})
	end	
end

function modifier_disruptor_skill_ultimate:GetStatusEffectName()
	return "particles/status_fx/status_effect_mjollnir_shield.vpcf"
end

function modifier_disruptor_skill_ultimate:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
	}
	return funcs
end

function modifier_disruptor_skill_ultimate:GetModifierIncomingDamage_Percentage(params)
	if params.target == self:GetParent() then
		self:SetStackCount(self:GetStackCount() - params.damage)
		if self:GetStackCount() > 0 then
			return -100
		else
			self:Destroy()
		end	
	end	
end