LinkLuaModifier( "modifier_npc_dota_hero_keeper_of_the_light_spell6", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell6", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_keeper_of_the_light_spell6 = class({})

function npc_dota_hero_keeper_of_the_light_spell6:OnSpellStart()
	self.mod_caster = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_keeper_of_the_light_spell6", {duration = self:GetChannelTime()})
end

function npc_dota_hero_keeper_of_the_light_spell6:GetCastAnimation()
	return ACT_DOTA_CAST_ABILITY_4
end

function npc_dota_hero_keeper_of_the_light_spell6:GetChannelAnimation()
	return ACT_DOTA_VICTORY
end

function npc_dota_hero_keeper_of_the_light_spell6:OnChannelFinish()
	if IsServer() then
		if self.mod_caster then self.mod_caster:Destroy() end
	end
end

-----------------------------------------------------------------------------------------------------------
modifier_npc_dota_hero_keeper_of_the_light_spell6 = class({})

function modifier_npc_dota_hero_keeper_of_the_light_spell6:IsHidden()	
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell6:IsPurgable()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell6:OnCreated()	
if not IsServer() then return end
	local count = self:GetAbility():GetSpecialValueFor("count")
	local radius = self:GetAbility():GetSpecialValueFor("radius")

	-- self:GetCaster():EmitSound("Hero_KeeperOfTheLight.Illuminate.Target.Secondary")
		
	local caster_pos = self:GetCaster():GetAbsOrigin()
	local line_pos = caster_pos + self:GetCaster():GetForwardVector() * radius
	local rotation_rate = 360 / count
			
	for i = 1, count do
		line_pos = RotatePosition(caster_pos, QAngle(0, rotation_rate, 0), line_pos)
		self:CreateRequiemLine(caster_pos, line_pos)
	end	
	
	self:StartIntervalThink(0.9)
end

function modifier_npc_dota_hero_keeper_of_the_light_spell6:OnIntervalThink()
if not IsServer() then return end

		self:GetCaster():EmitSound("Hero_KeeperOfTheLight.Illuminate.Discharge")
	local count = self:GetAbility():GetSpecialValueFor("count")
	local radius = self:GetAbility():GetSpecialValueFor("radius")
	local caster_pos = self:GetCaster():GetAbsOrigin()
	local line_pos = caster_pos + self:GetCaster():GetForwardVector() * radius
	local rotation_rate = 360 / count
	for i = 1, count do
		line_pos = RotatePosition(caster_pos, QAngle(0, rotation_rate, 0), line_pos)
		local velocity = (line_pos - caster_pos):Normalized() * radius
		self:CreateRequiemLine(caster_pos, velocity , 2)
	end	
end

function modifier_npc_dota_hero_keeper_of_the_light_spell6:CreateRequiemLine(position, velocity, duration)
	local caster = self:GetCaster()
	self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_keeper_of_the_light/kotl_illuminate.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
	ParticleManager:SetParticleControl(self.particle, 1, velocity)
	ParticleManager:SetParticleControl(self.particle, 3, caster:GetAbsOrigin())
	self:AddParticle(self.particle, false, false, -1, false, false)
end

function npc_dota_hero_keeper_of_the_light_spell6:OnProjectileHit_ExtraData(target, location, extra)
	if target then
		self.damage = self:GetSpecialValueFor("damage")
				
		ApplyDamage({
			ability = self,
			attacker = self:GetCaster(),
			damage = self.damage,
			damage_type = self:GetAbilityDamageType(),
			victim = target
		})
	end
end