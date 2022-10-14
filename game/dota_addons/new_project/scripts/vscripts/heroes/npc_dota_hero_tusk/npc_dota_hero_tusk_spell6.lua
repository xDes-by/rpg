LinkLuaModifier( "modifier_npc_dota_hero_tusk_spell3", "heroes/npc_dota_hero_tusk/npc_dota_hero_tusk_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_tusk_spell3_debuff", "heroes/npc_dota_hero_tusk/npc_dota_hero_tusk_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_tusk_spell3_hits", "heroes/npc_dota_hero_tusk/npc_dota_hero_tusk_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_tusk_spell3_stun", "heroes/npc_dota_hero_tusk/npc_dota_hero_tusk_spell3", LUA_MODIFIER_MOTION_NONE)

npc_dota_hero_tusk_ultimate = class({})

function npc_dota_hero_tusk_ultimate:Precache( context )

end

function npc_dota_hero_tusk_ultimate:OnSpellStart()
	local point = self:GetCaster():GetOrigin()
	local radius = self:GetSpecialValueFor("radius")
	local duration = self:GetSpecialValueFor("agr_duration")

	local enemies = FindUnitsInRadius( self:GetCaster():GetTeamNumber(), point, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, 0, false )
	for _,enemy in pairs(enemies) do
		enemy:AddNewModifier( self:GetCaster(), self, "modifier_npc_dota_hero_tusk_spell3_debuff", { duration = duration } )
	end

	self:GetCaster():AddNewModifier(self:GetCaster(), self,  "modifier_npc_dota_hero_tusk_spell3_hits", {} )

	local sound_cast = "Hero_Axe.Berserkers_Call"  -- sound
	EmitSoundOn( sound_cast, self:GetCaster() )
end

---------------------------------------------------------------------------------------------------------

modifier_npc_dota_hero_tusk_spell3_debuff = class({})

function modifier_npc_dota_hero_tusk_spell3_debuff:IsHidden()
	return false
end

function modifier_npc_dota_hero_tusk_spell3_debuff:IsDebuff()
	return true
end

function modifier_npc_dota_hero_tusk_spell3_debuff:IsStunDebuff()
	return false
end

function modifier_npc_dota_hero_tusk_spell3_debuff:IsPurgable()
	return false
end

function modifier_npc_dota_hero_tusk_spell3_debuff:OnCreated( kv )
	if IsServer() then
		self:GetParent():SetForceAttackTarget( self:GetCaster() ) -- for creeps
	end
end

function modifier_npc_dota_hero_tusk_spell3_debuff:OnRefresh( kv )
end

function modifier_npc_dota_hero_tusk_spell3_debuff:OnRemoved()
	if IsServer() then
		self:GetParent():SetForceAttackTarget( nil )
	end
end

function modifier_npc_dota_hero_tusk_spell3_debuff:OnDestroy()
end

function modifier_npc_dota_hero_tusk_spell3_debuff:CheckState()
	local state = {
		[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
	}

	return state
end

function modifier_npc_dota_hero_tusk_spell3_debuff:GetStatusEffectName()
	return "particles/status_fx/status_effect_beserkers_call.vpcf"
end

---------------------------------------------------------------------------------------------------------------------

modifier_npc_dota_hero_tusk_spell3_hits = class({})
function modifier_npc_dota_hero_tusk_spell3_hits:IsDebuff() return false end
function modifier_npc_dota_hero_tusk_spell3_hits:IsHidden() return false end
function modifier_npc_dota_hero_tusk_spell3_hits:IsPurgable() return false end
function modifier_npc_dota_hero_tusk_spell3_hits:IsPurgeException() return false end
function modifier_npc_dota_hero_tusk_spell3_hits:IsStunDebuff() return false end
function modifier_npc_dota_hero_tusk_spell3_hits:RemoveOnDeath() return true end

function modifier_npc_dota_hero_tusk_spell3_hits:OnCreated()
	local current_speed = self:GetParent():GetIncreasedAttackSpeed()
	current_speed = current_speed * 2

	local max_hits = self:GetAbility():GetSpecialValueFor("agr_duration") + 1
	self:SetStackCount(max_hits)
	self.attack_speed_buff = math.max(500, current_speed)
end

function modifier_npc_dota_hero_tusk_spell3_hits:OnRefresh()
end

function modifier_npc_dota_hero_tusk_spell3_hits:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_EVENT_ON_ATTACK
	}
end

function modifier_npc_dota_hero_tusk_spell3_hits:OnAttack(keys)
	if self:GetParent() == keys.attacker then
		local particle_cast = 'particles/econ/items/sven/sven_ti7_sword/sven_ti7_sword_spell_great_cleave_gods_strength.vpcf'
		DoCleaveAttack( self:GetParent(), keys.target, self, keys.damage, 150, 360, 360,  particle_cast)
		self:SetStackCount(self:GetStackCount() - 1)
		if self:GetStackCount() == 0 then
		
			print(keys.target:GetUnitName())
			keys.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_knockback", {
			center_x 			= self:GetParent():GetOrigin().x, 
			center_y 			= self:GetParent():GetOrigin().y, 
			center_z 			= self:GetParent():GetOrigin().z, 
			duration 			= 0.8,
			knockback_duration 	= 0.6,
			knockback_distance 	= 0,
			knockback_height 	= 500
		})
		
			local p= ParticleManager:CreateParticle("particles/units/heroes/hero_dark_seer/dark_seer_attack_normal_punch.vpcf", PATTACH_ABSORIGIN,self:GetParent())
			ParticleManager:SetParticleControl(p, 0,self:GetParent():GetAbsOrigin())
			ParticleManager:SetParticleControl(p, 2,self:GetParent():GetAbsOrigin())
			ParticleManager:ReleaseParticleIndex( p )
		
			EmitSoundOn("Hero_Tusk.WalrusPunch.Target", self:GetParent())
			keys.target:AddNewModifier(self:GetParent(), self:GetAbility(),  "modifier_npc_dota_hero_tusk_spell3_stun", {duration = 0.6} )
			self:Destroy()
		end
	end
end

function modifier_npc_dota_hero_tusk_spell3_hits:GetModifierAttackSpeedBonus_Constant()
	return self.attack_speed_buff
end


----------------------------------------------------------------------



modifier_npc_dota_hero_tusk_spell3_stun = class({})

function modifier_npc_dota_hero_tusk_spell3_stun:IsDebuff() return true end
function modifier_npc_dota_hero_tusk_spell3_stun:IsStunDebuff() return true end
function modifier_npc_dota_hero_tusk_spell3_stun:RemoveOnDeath() return false end
function modifier_npc_dota_hero_tusk_spell3_stun:IsHidden() return true end

function modifier_npc_dota_hero_tusk_spell3_stun:IsPurgable() return false end

function modifier_npc_dota_hero_tusk_spell3_stun:OnCreated( kv )
end

function modifier_npc_dota_hero_tusk_spell3_stun:OnDestroy()
	if IsServer() then
	
		EmitSoundOn("Ability.TossImpact", self:GetParent())
	
		local damage = self:GetAbility():GetSpecialValueFor("damage")
		local radius = self:GetAbility():GetSpecialValueFor("radius")
		local stun_duration = self:GetAbility():GetSpecialValueFor("stun_duration")
			local damageTable = {
				attacker = self:GetCaster(),
				damage = damage,
				damage_type = DAMAGE_TYPE_MAGICAL,
			}
		local enemies = FindUnitsInRadius( self:GetCaster():GetTeamNumber(), self:GetParent():GetOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0, false )
		for _,enemy in pairs(enemies) do
			damageTable.victim = enemy
			enemy:AddNewModifier(self:GetParent(), self:GetAbility(),  "modifier_stunned", {duration = stun_duration} )
			ApplyDamage(damageTable)
		end
	end
end

function modifier_npc_dota_hero_tusk_spell3_stun:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
	}
end

function modifier_npc_dota_hero_tusk_spell3_stun:GetOverrideAnimation( params )
	return ACT_DOTA_FLAIL
end