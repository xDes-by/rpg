LinkLuaModifier( "modifier_npc_dota_hero_queenofpain_spell3", "heroes/npc_dota_hero_queenofpain/npc_dota_hero_queenofpain_spell3", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_queenofpain_spell3 = class({})

function npc_dota_hero_queenofpain_spell3:OnToggle(  )
	local caster = self:GetCaster()
	local toggle = self:GetToggleState()
	if toggle then
		self.modifier = caster:AddNewModifier(caster, self, "modifier_npc_dota_hero_queenofpain_spell3", {})
	else
		if self.modifier and not self.modifier:IsNull() then
			self.modifier:Destroy()
		end
		self.modifier = nil
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

modifier_npc_dota_hero_queenofpain_spell3 = class({})

function modifier_npc_dota_hero_queenofpain_spell3:IsHidden()
	return false
end

function modifier_npc_dota_hero_queenofpain_spell3:IsDebuff()
	return false
end

function modifier_npc_dota_hero_queenofpain_spell3:IsPurgable()
	return false
end

function modifier_npc_dota_hero_queenofpain_spell3:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT 
end

function modifier_npc_dota_hero_queenofpain_spell3:GetEffectName()
	return "particles/units/heroes/hero_leshrac/leshrac_pulse_nova_ambient.vpcf"
end

function modifier_npc_dota_hero_queenofpain_spell3:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

function modifier_npc_dota_hero_queenofpain_spell3:OnCreated( kv )
	if not IsServer() then return end
	self.manacost = self:GetAbility():GetSpecialValueFor( "mana_cost_per_second" )
	local interval = 2

	self.parent = self:GetParent()

	self:Burn()
	self:StartIntervalThink( interval )
end

function modifier_npc_dota_hero_queenofpain_spell3:OnIntervalThink()
	local mana = self.parent:GetMana()
	if mana < self.manacost then
		if self:GetAbility():GetToggleState() then
			self:GetAbility():ToggleAbility()
		end
		return
	end
	self:Burn()
end

function modifier_npc_dota_hero_queenofpain_spell3:Burn()
if not IsServer() then return end
	self.parent:SpendMana( self.manacost, self:GetAbility() )
	local damage = self:GetAbility():GetSpecialValueFor("damage")
	local damage_radius = self:GetAbility():GetSpecialValueFor("damage_radius")
	local radius = self:GetAbility():GetSpecialValueFor("radius")
	local caster_pos = self:GetCaster():GetAbsOrigin()
	local angle = RandomInt(0, 360)
	local variance = RandomInt(-radius, radius)
	local dy = math.sin(angle) * variance
	local dx = math.cos(angle) * variance
	local target_pos = Vector(caster_pos.x + dx, caster_pos.y + dy, caster_pos.z)
	self:PlayEffects(target_pos, damage_radius)
	local units = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), target_pos, nil, damage_radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0, false)
	for _, unit in ipairs(units) do
		ApplyDamage({attacker = self:GetCaster(),victim = unit,damage_type = DAMAGE_TYPE_MAGICAL,damage = damage})
		
	end	
end

function modifier_npc_dota_hero_queenofpain_spell3:PlayEffects(target_pos, damage_radius)
	local effect_cast = ParticleManager:CreateParticle( 'particles/qop3.vpcf', PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( effect_cast, 0, target_pos )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( damage_radius, 1, 1 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )
end