npc_dota_hero_axe_spell1 = class({})
LinkLuaModifier( "modifier_npc_dota_hero_axe_spell1", "heroes/npc_dota_hero_axe/npc_dota_hero_axe_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_axe_spell1_buff", "heroes/npc_dota_hero_axe/npc_dota_hero_axe_spell1", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_axe_spell1:GetIntrinsicModifierName()
	return "modifier_npc_dota_hero_axe_spell1"
end

----------------------------------------------------------------------------------------------

modifier_npc_dota_hero_axe_spell1 = class({})

function modifier_npc_dota_hero_axe_spell1:IsHidden()
	return false
end

function modifier_npc_dota_hero_axe_spell1:IsPurgable()
	return false
end

function modifier_npc_dota_hero_axe_spell1:OnCreated()
	self.damage = self:GetAbility():GetSpecialValueFor("damage")
	self.radius = self:GetAbility():GetSpecialValueFor("radius")
	self.duration = self:GetAbility():GetSpecialValueFor("duration")
end

function modifier_npc_dota_hero_axe_spell1:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_TAKEDAMAGE,
	}
end

function modifier_npc_dota_hero_axe_spell1:OnTakeDamage(keys)
	if keys.unit == self:GetParent() then
		self:SetStackCount(self:GetStackCount() + keys.damage)
		if self:GetStackCount() >= self.damage then
			self.damageTable = {
				attacker = self:GetParent(),
				damage = self:GetParent():GetAverageTrueAttackDamage(self:GetParent()),
				damage_type = DAMAGE_TYPE_PHYSICAL,
				ability = self:GetAbility(),
				damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION,
			}

			local enemies = FindUnitsInRadius( self:GetParent():GetTeamNumber(), self:GetParent():GetOrigin(), nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false)
			if #enemies>0 then
				local sound_cast = "Hero_Axe.Berserkers_Call"
				EmitSoundOn( sound_cast, self:GetCaster() )
				for _,enemy in pairs(enemies) do
					enemy:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_npc_dota_hero_axe_spell1_buff",{ duration = self.duration })
					self.damageTable.victim = enemy
					ApplyDamage( self.damageTable )
				end
			end
			self:PlayEffects()
			self:SetStackCount(0)
		end
	end
end

function modifier_npc_dota_hero_axe_spell1:PlayEffects()
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_axe/axe_beserkers_call_owner.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControl(effect_cast, 1, Vector(300, 300, 300))
	ParticleManager:ReleaseParticleIndex( effect_cast )
end

----------------------------------------------------------------------------------------------

modifier_npc_dota_hero_axe_spell1_buff = class({})

function modifier_npc_dota_hero_axe_spell1_buff:IsHidden()
	return false
end

function modifier_npc_dota_hero_axe_spell1_buff:IsDebuff()
	return true
end

function modifier_npc_dota_hero_axe_spell1_buff:IsStunDebuff()
	return false
end

function modifier_npc_dota_hero_axe_spell1_buff:IsPurgable()
	return false
end

function modifier_npc_dota_hero_axe_spell1_buff:OnCreated( kv )
	if IsServer() then
		self:GetParent():SetForceAttackTarget( self:GetCaster() )
		self:GetParent():MoveToTargetToAttack( self:GetCaster() )
	end
end

function modifier_npc_dota_hero_axe_spell1_buff:OnDestroy()
	if IsServer() then
		self:GetParent():SetForceAttackTarget( nil )
	end
end

function modifier_npc_dota_hero_axe_spell1_buff:CheckState()
	return {
		[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
	}
end

function modifier_npc_dota_hero_axe_spell1_buff:GetStatusEffectName()
	return "particles/status_fx/status_effect_beserkers_call.vpcf"
end
