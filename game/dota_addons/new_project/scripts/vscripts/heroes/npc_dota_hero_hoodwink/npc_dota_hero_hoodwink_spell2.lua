npc_dota_hero_hoodwink_spell2 = class({})
LinkLuaModifier( "modifier_hoodwink_skill_2", "heroes/npc_dota_hero_hoodwink/npc_dota_hero_hoodwink_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_hoodwink_skill_2_effect", "heroes/npc_dota_hero_hoodwink/npc_dota_hero_hoodwink_spell2", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_hoodwink_spell2:OnSpellStart()
	self.pfx = ParticleManager:CreateParticle("particles/econ/events/ti9/shovel_dig.vpcf", PATTACH_WORLDORIGIN, self:GetCaster())
	ParticleManager:SetParticleControl(self.pfx, 0, self:GetCursorPosition())
	self.point = self:GetCursorPosition()
	self.radius	= self:GetSpecialValueFor("radius")

	EmitSoundOn("SeasonalConsumable.TI9.Shovel.Dig", self:GetCaster())
end

function npc_dota_hero_hoodwink_spell2:OnChannelThink(fInterval)
	if not IsServer() then return end

end

function npc_dota_hero_hoodwink_spell2:OnChannelFinish(bInterrupted)
if not IsServer() then return end

	if not bInterrupted then
		CreateModifierThinker(self:GetCaster(), self, "modifier_hoodwink_skill_2", {duration = self:GetSpecialValueFor("duration")}, self.point, self:GetCaster():GetTeamNumber(), false)
		local tree = CreateTempTreeWithModel( self.point, self:GetSpecialValueFor("duration"), "models/heroes/hoodwink/hoodwink_tree_model.vmdl" )
		
		self.eyesintheforest = ParticleManager:CreateParticle("particles/units/heroes/hero_treant/treant_eyesintheforest.vpcf", PATTACH_WORLDORIGIN, tree)
		ParticleManager:SetParticleControl(self.eyesintheforest, 0, tree:GetAbsOrigin())
		ParticleManager:SetParticleControl(self.eyesintheforest, 1, Vector(self.radius, 0, 0))
	end
	
	if self.pfx then
		ParticleManager:DestroyParticle(self.pfx, false)
		ParticleManager:ReleaseParticleIndex(self.pfx)
	end
end		

-------------------------------------------------------------------

modifier_hoodwink_skill_2 = class({})

function modifier_hoodwink_skill_2:IsHidden()	
	return true
end

function modifier_hoodwink_skill_2:IsPurgable()
	return false
end

function modifier_hoodwink_skill_2:OnCreated(kv)
	self.radius	= self:GetAbility():GetSpecialValueFor("radius")
end

function modifier_hoodwink_skill_2:OnDestroy(kv)
	if self:GetAbility().eyesintheforest then
		ParticleManager:DestroyParticle(self:GetAbility().eyesintheforest, false)
		ParticleManager:ReleaseParticleIndex(self:GetAbility().eyesintheforest)
	end
end

function modifier_hoodwink_skill_2:IsAura()
	return true
end

function modifier_hoodwink_skill_2:IsAuraActiveOnDeath()
	return false
end

function modifier_hoodwink_skill_2:GetAuraDuration()
	return 0.1
end

function modifier_hoodwink_skill_2:GetAuraRadius()
	return self.radius
end

function modifier_hoodwink_skill_2:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_NONE 
end

function modifier_hoodwink_skill_2:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_hoodwink_skill_2:GetAuraSearchType()
	return DOTA_UNIT_TARGET_ALL
end

function modifier_hoodwink_skill_2:GetModifierAura()
	return "modifier_hoodwink_skill_2_effect" 
end

-------------------------------------------------------------------------------------

modifier_hoodwink_skill_2_effect = class({})

function modifier_hoodwink_skill_2_effect:IsHidden()	
	return true
end

function modifier_hoodwink_skill_2_effect:IsPurgable()
	return false
end

function modifier_hoodwink_skill_2_effect:OnCreated()
	self.heal = self:GetAbility():GetSpecialValueFor("heal")
	self:StartIntervalThink(1)
end

function modifier_hoodwink_skill_2_effect:OnIntervalThink()
if not IsServer() then return end
	self:GetParent():Heal(self.heal, self:GetCaster())
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetParent(), self.heal, nil)
end