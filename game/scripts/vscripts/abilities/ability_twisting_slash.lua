LinkLuaModifier( "modifier_ability_twisting_slash", "abilities/ability_twisting_slash", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_twisting_slash", "abilities/ability_twisting_slash", LUA_MODIFIER_MOTION_NONE )

ability_twisting_slash = class({})

function ability_twisting_slash:Precache(context)
    PrecacheResource( "particle", "particles/units/heroes/hero_juggernaut/juggernaut_blade_fury.vpcf", context )
    PrecacheResource( "particle", "particles/units/heroes/hero_juggernaut/juggernaut_blade_fury_null.vpcf", context )
    PrecacheResource( "particle", "particles/units/heroes/hero_juggernaut/juggernaut_blade_fury_tgt.vpcf", context )
end

function ability_twisting_slash:GetIntrinsicModifierName()
	return "modifier_ability_twisting_slash"
end

--------------------------------------------------------------------------------
modifier_ability_twisting_slash = class({})

function modifier_ability_twisting_slash:IsHidden()
	return true
end

function modifier_ability_twisting_slash:OnCreated( kv )
end

function modifier_ability_twisting_slash:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_PROPERTY_TOTALDAMAGEOUTGOING_PERCENTAGE
	}
	return funcs
end

function modifier_ability_twisting_slash:GetModifierTotalDamageOutgoing_Percentage( params )
	if params.inflictor then return 0 end
	if params.damage_category ~= DOTA_DAMAGE_CATEGORY_ATTACK then return 0 end
		self:StartSpin()
	return -200
end

function modifier_ability_twisting_slash:StartSpin()
	if IsServer() then
		local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self:GetParent():GetOrigin(), nil, 300, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0, false)
		for _,enemy in pairs(enemies) do
			self:GetCaster():CustomApplyDamage(enemy, self:GetCaster(), self:GetAbility(), 'ice')
		end
	end
	self:PlayEffects()
end

function modifier_ability_twisting_slash:PlayEffects()
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_juggernaut/juggernaut_blade_fury.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 5, Vector( 300, 0, 0 ) )
	self:AddParticle(effect_cast, false, false, -1, false, false)
	EmitSoundOn( "Hero_Juggernaut.BladeFuryStart", self:GetParent())
	
	-- Timers:CreateTimer(100 / self:GetParent():GetDisplayAttackSpeed() - 0.03, function()
	Timers:CreateTimer(0.2, function()
		ParticleManager:DestroyParticle(effect_cast, false)
		ParticleManager:ReleaseParticleIndex(effect_cast)
		StopSoundOn("Hero_Juggernaut.BladeFuryStart", self:GetParent() )
	end)
end