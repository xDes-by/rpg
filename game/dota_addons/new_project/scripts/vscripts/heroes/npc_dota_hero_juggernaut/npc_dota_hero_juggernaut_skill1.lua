LinkLuaModifier( "modifier_npc_dota_hero_juggernaut_skill1_buff", "heroes/npc_dota_hero_juggernaut/npc_dota_hero_juggernaut_skill1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_juggernaut_skill1_passive", "heroes/npc_dota_hero_juggernaut/npc_dota_hero_juggernaut_skill1", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_juggernaut_skill1 = class({})

function npc_dota_hero_juggernaut_skill1:GetIntrinsicModifierName()
	return "modifier_npc_dota_hero_juggernaut_skill1_passive"
end

function npc_dota_hero_juggernaut_skill1:GetChannelTime()
	return 0.7
end

function npc_dota_hero_juggernaut_skill1:OnSpellStart()
	if not IsServer() then return end
	EmitSoundOn( "Hero_Juggernaut.idle", self:GetCaster() )
	self.target = self:GetCursorTarget()
end	
	
function npc_dota_hero_juggernaut_skill1:OnChannelFinish( bInterrupted )
    if not bInterrupted then
		ApplyDamage({
			victim = self.target,
			damage = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * 2,
			damage_type = DAMAGE_TYPE_PHYSICAL,
			damage_flags = DOTA_DAMAGE_FLAG_NONE,
			attacker = self:GetCaster(),
			ability = self
		})
		local coup_pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_phantom_assassin/phantom_assassin_crit_impact.vpcf", PATTACH_ABSORIGIN_FOLLOW, self.target)
		ParticleManager:SetParticleControlEnt(coup_pfx, 0, self.target, PATTACH_POINT_FOLLOW, "attach_hitloc", self.target:GetAbsOrigin(), true)
		ParticleManager:SetParticleControl(coup_pfx, 1, self.target:GetAbsOrigin())
		ParticleManager:SetParticleControlOrientation(coup_pfx, 1, self:GetCaster():GetForwardVector() * (-1), self:GetCaster():GetRightVector(), self:GetCaster():GetUpVector())
		ParticleManager:ReleaseParticleIndex(coup_pfx)
		EmitSoundOn( "Hero_PhantomAssassin.CoupDeGrace", self.target )
    end
end	

function npc_dota_hero_juggernaut_skill1:GetCastAnimation()
	return ACT_DOTA_ATTACK_TAUNT
end

--------------------------------------------------------------------

modifier_npc_dota_hero_juggernaut_skill1_buff = class({})

function modifier_npc_dota_hero_juggernaut_skill1_buff:IsHidden()
   return false
end

function modifier_npc_dota_hero_juggernaut_skill1_buff:IsPurgable()
   return false
end

function modifier_npc_dota_hero_juggernaut_skill1_buff:DeclareFunctions()
   return {
	   MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PHYSICAL,
	   MODIFIER_PROPERTY_PROCATTACK_FEEDBACK 
}
end

function modifier_npc_dota_hero_juggernaut_skill1_buff:GetModifierProcAttack_BonusDamage_Physical()
	return self:GetAbility():GetSpecialValueFor("damage")
end

function modifier_npc_dota_hero_juggernaut_skill1_buff:GetModifierProcAttack_Feedback()
	self:DecrementStackCount()
	if self:GetStackCount() == 0 then
		self:Destroy()
	end
end

--------------------------------------------------------------------

modifier_npc_dota_hero_juggernaut_skill1_passive = class({})

function modifier_npc_dota_hero_juggernaut_skill1_passive:IsHidden()
	return true
end

function modifier_npc_dota_hero_juggernaut_skill1_passive:IsPurgable()
   return false
end

function modifier_npc_dota_hero_juggernaut_skill1_passive:RemoveOnDeath()
   return false
end


function modifier_npc_dota_hero_juggernaut_skill1_passive:DeclareFunctions()
	return { MODIFIER_EVENT_ON_DEATH }
end

function modifier_npc_dota_hero_juggernaut_skill1_passive:OnDeath(keys)
	if IsServer() then
		if keys.unit == self:GetAbility().target then
			if self:GetAbility() == keys.inflictor then
				self:GetCaster():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_juggernaut_skill1_buff", {}):SetStackCount(self:GetAbility():GetSpecialValueFor("count"))
			end
		end
	end
end