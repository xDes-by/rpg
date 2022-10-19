LinkLuaModifier("modifier_disruptor_skill_2", "heroes/npc_dota_hero_disruptor/npc_dota_hero_disruptor_spell2", LUA_MODIFIER_MOTION_NONE)

npc_dota_hero_disruptor_spell2 = class({})


function npc_dota_hero_disruptor_spell2:OnSpellStart()
	local target = self:GetCursorTarget()
	
	self:GetCaster():EmitSound("Hero_Zuus.ArcLightning.Cast")
	
	if not target:TriggerSpellAbsorb(self) then
		local head_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_zuus/zuus_arc_lightning_head.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster())
		ParticleManager:SetParticleControlEnt(head_particle, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_attack1", self:GetCaster():GetAbsOrigin(), true)
		ParticleManager:SetParticleControlEnt(head_particle, 1, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetAbsOrigin(), true)
		ParticleManager:SetParticleControl(head_particle, 62, Vector(2, 0, 2))

		ParticleManager:ReleaseParticleIndex(head_particle)
		
		self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_disruptor_skill_2", {
			starting_unit_entindex	= target:entindex()
		})
	end
end

----------------------------------------------------------------------------

modifier_disruptor_skill_2	= class({})

function modifier_disruptor_skill_2:IsHidden()		return true end
function modifier_disruptor_skill_2:IsPurgable()		return false end
function modifier_disruptor_skill_2:RemoveOnDeath()	return false end
function modifier_disruptor_skill_2:GetAttributes()	return MODIFIER_ATTRIBUTE_MULTIPLE end

function modifier_disruptor_skill_2:OnCreated(keys)
	if not IsServer() or not self:GetAbility() then return end

	self.arc_damage			= self:GetAbility():GetSpecialValueFor("arc_damage")
	self.radius				= self:GetAbility():GetSpecialValueFor("radius")
	self.jump_count			= self:GetAbility():GetSpecialValueFor("count")
	self.jump_delay			= 0.3
	
	self.starting_unit_entindex	= keys.starting_unit_entindex
	
	self.units_affected = {}
	
	if self.starting_unit_entindex and EntIndexToHScript(self.starting_unit_entindex) then
		self.current_unit = EntIndexToHScript(self.starting_unit_entindex)
		self.units_affected[self.current_unit]	= 1
			
		ApplyDamage({
			victim 			= self.current_unit,
			damage 			= self.arc_damage,
			damage_type		= DAMAGE_TYPE_MAGICAL,
			damage_flags 	= DOTA_DAMAGE_FLAG_NONE,
			attacker 		= self:GetCaster(),
			ability 		= self:GetAbility()
		})
	else
		self:Destroy()
		return
	end
	
	self.unit_counter = 0
	
	self:StartIntervalThink(self.jump_delay)
end

function modifier_disruptor_skill_2:OnIntervalThink()
	self.zapped = false
	
	for _, enemy in pairs(FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self.current_unit:GetAbsOrigin(), nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_CLOSEST, false)) do
		if not self.units_affected[enemy] and enemy ~= self.current_unit and enemy ~= self.previous_unit then
			enemy:EmitSound("Hero_Zuus.ArcLightning.Target")
			
			self.lightning_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_zuus/zuus_arc_lightning_.vpcf", PATTACH_ABSORIGIN_FOLLOW, self.current_unit)
			ParticleManager:SetParticleControlEnt(self.lightning_particle, 0, self.current_unit, PATTACH_POINT_FOLLOW, "attach_hitloc", self.current_unit:GetAbsOrigin(), true)
			ParticleManager:SetParticleControlEnt(self.lightning_particle, 1, enemy, PATTACH_POINT_FOLLOW, "attach_hitloc", enemy:GetAbsOrigin(), true)
			ParticleManager:SetParticleControl(self.lightning_particle, 62, Vector(2, 0, 2))
			ParticleManager:ReleaseParticleIndex(self.lightning_particle)
		
			self.unit_counter						= self.unit_counter + 1
			self.previous_unit						= self.current_unit
			self.current_unit						= enemy
			
			if self.units_affected[self.current_unit] then
				self.units_affected[self.current_unit]	= self.units_affected[self.current_unit] + 1
			else
				self.units_affected[self.current_unit]	= 1
			end
			
			self.zapped								= true
			
				damage_flags = DOTA_DAMAGE_FLAG_NONE
			
			ApplyDamage({
				victim 			= enemy,
				damage 			= self.arc_damage,
				damage_type		= DAMAGE_TYPE_MAGICAL,
				damage_flags 	= damage_flags,
				attacker 		= self:GetCaster(),
				ability 		= self:GetAbility()
			})
			
			break
		end
	end
	
	if (self.unit_counter >= self.jump_count and self.jump_count > 0) or not self.zapped then
	local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self.current_unit:GetAbsOrigin(), nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_CLOSEST, false)
		for _, enemy in pairs(enemies) do
			if not self.units_affected[enemy] and enemy ~= self.current_unit and enemy ~= self.previous_unit then
				enemy:EmitSound("Hero_Zuus.ArcLightning.Target")
				
				self.lightning_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_zuus/zuus_arc_lightning_.vpcf", PATTACH_ABSORIGIN_FOLLOW, self.current_unit)
				ParticleManager:SetParticleControlEnt(self.lightning_particle, 0, self.current_unit, PATTACH_POINT_FOLLOW, "attach_hitloc", self.current_unit:GetAbsOrigin(), true)
				ParticleManager:SetParticleControlEnt(self.lightning_particle, 1, enemy, PATTACH_POINT_FOLLOW, "attach_hitloc", enemy:GetAbsOrigin(), true)
				ParticleManager:SetParticleControl(self.lightning_particle, 62, Vector(2, 0, 2))
				ParticleManager:ReleaseParticleIndex(self.lightning_particle)
				
				self.unit_counter						= self.unit_counter + 1
				self.previous_unit						= self.current_unit
				self.current_unit						= enemy
				
				if self.units_affected[self.current_unit] then
					self.units_affected[self.current_unit]	= self.units_affected[self.current_unit] + 1
				else
					self.units_affected[self.current_unit]	= 1
				end
				
				self.zapped								= true
							
				ApplyDamage({
					victim 			= enemy,
					damage 			= self.arc_damage,
					damage_type		= DAMAGE_TYPE_MAGICAL,
					attacker 		= self:GetCaster(),
					ability 		= self:GetAbility()
				})
				break
			end
		end
		
		if (self.unit_counter >= self.jump_count and self.jump_count > 0) or not self.zapped then
			self:return_mana(self.unit_counter, self:GetCaster(), self.current_unit)
			self:StartIntervalThink(-1)
			self:Destroy()
		end
	end
end

function modifier_disruptor_skill_2:return_mana(count, caster, target)
	rest = (count + 1) * self:GetAbility():GetSpecialValueFor("mana_back")
	
	self:GetCaster():GiveMana(rest)
	EmitSoundOn( "Hero_Medusa.MysticSnake.Return", self:GetCaster() )
	SendOverheadEventMessage( nil, OVERHEAD_ALERT_MANA_ADD, self:GetCaster(), rest, self:GetCaster():GetPlayerOwner())
	
	self.lightning_particle = ParticleManager:CreateParticle("particles/units/heroes/hero_zuus/zuus_arc_lightning_.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
	ParticleManager:SetParticleControlEnt(self.lightning_particle, 0, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetAbsOrigin(), true)
	ParticleManager:SetParticleControlEnt(self.lightning_particle, 1, caster, PATTACH_POINT_FOLLOW, "attach_hitloc", caster:GetAbsOrigin(), true)
	ParticleManager:SetParticleControl(self.lightning_particle, 62, Vector(2, 0, 2))
	ParticleManager:ReleaseParticleIndex(self.lightning_particle)
end