LinkLuaModifier( "modifier_npc_dota_hero_abyssal_underlord_spell6", "heroes/npc_dota_hero_abyssal_underlord/npc_dota_hero_abyssal_underlord_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_abyssal_underlord_spell6_show_time", "heroes/npc_dota_hero_abyssal_underlord/npc_dota_hero_abyssal_underlord_spell6", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_abyssal_underlord_spell6 = class({})

function npc_dota_hero_abyssal_underlord_spell6:OnSpellStart() 
    self.duration = self:GetSpecialValueFor("duration")
	local point = self:GetCursorPosition()
	self.dummy = CreateUnitByName("npc_dummy_unit", point, true, nil, nil, DOTA_TEAM_GOODGUYS )
	self.dummy:AddNewModifier(self:GetCaster(),self,"modifier_dummy",{} )
	self:PlayEffects1(self.dummy)
	Timers:CreateTimer(4, function()
		demon = CreateUnitByName("npc_underlord_demon", point, true, nil, nil, DOTA_TEAM_GOODGUYS )
		demon:AddNewModifier(self:GetCaster(),self,"modifier_kill",{duration = self.duration})
		demon:AddNewModifier(self:GetCaster(),self,"modifier_npc_dota_hero_abyssal_underlord_spell6",{duration = self.duration})
		demon:SetOwner(self:GetCaster())
		demon:SetBaseDamageMin(self:GetCaster():GetBaseDamageMin())
		demon:SetBaseDamageMax(self:GetCaster():GetBaseDamageMax())
		
		self:GetCaster():AddNewModifier(self:GetCaster(),self,"modifier_npc_dota_hero_abyssal_underlord_spell6_show_time",{duration = self.duration})
		self:PlayEffects2()
	end)
end

function npc_dota_hero_abyssal_underlord_spell6:PlayEffects1(dummy)
	self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/heroes_underlord/abbysal_underlord_darkrift_ambient.vpcf", PATTACH_ABSORIGIN_FOLLOW, dummy )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 300, 0, 0 ) )
	ParticleManager:SetParticleControlEnt(self.effect_cast, 2, dummy, PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector(0,0,0), true )
	EmitSoundOn( "Hero_AbyssalUnderlord.DarkRift.Cast", self:GetCaster() )
end

function npc_dota_hero_abyssal_underlord_spell6:PlayEffects2()
	ParticleManager:DestroyParticle( self.effect_cast, true )
	self.dummy:ForceKill(false)
	StopSoundOn( "Hero_AbyssalUnderlord.DarkRift.Cast", self:GetCaster() )
	EmitSoundOn( "Hero_AbyssalUnderlord.DarkRift.Complete", self:GetCaster() )
end

--------------------------------------------------------------------------------------------------
modifier_npc_dota_hero_abyssal_underlord_spell6_show_time = class({})

function modifier_npc_dota_hero_abyssal_underlord_spell6_show_time:IsHidden()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell6_show_time:IsPurgable()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell6_show_time:RemoveOnDeath()
	return false
end
--------------------------------------------------------------------------------------------------

modifier_npc_dota_hero_abyssal_underlord_spell6 = class({})

function modifier_npc_dota_hero_abyssal_underlord_spell6:IsHidden()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell6:IsPurgable()
	return false
end

function modifier_npc_dota_hero_abyssal_underlord_spell6:CheckState()
	local state = {
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
	}
	return state
end

