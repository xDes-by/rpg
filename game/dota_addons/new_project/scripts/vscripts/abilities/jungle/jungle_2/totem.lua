LinkLuaModifier( "modifier_totem",  "abilities/jungle/jungle_2/totem", LUA_MODIFIER_MOTION_NONE )

totem = class({})

function totem:GetIntrinsicModifierName()
	return "modifier_totem"
end

-------------------------------------------------------------------------

modifier_totem = class({})

function modifier_totem:IsHidden()
	return true
end

function modifier_totem:CheckState()
	local state =
	{
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = false,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
	}
	return state
end

function modifier_totem:OnCreated( kv )
	if IsServer() then
		self:StartIntervalThink( 0.2 )
		self.quest_trigger = false
		self:GetParent():SetRenderColor( 48, 60, 49 )
	end
end

function modifier_totem:OnIntervalThink()
	if IsServer() then
		local enemies = FindUnitsInRadius( self:GetParent():GetTeamNumber(), self:GetParent():GetOrigin(), nil, 200, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, 0, false )
		if #enemies > 0 and not self.quest_trigger then
			self.quest_trigger = true
			Quest:UpdateCounter('jungle_2', 1)
			_G.jungle_2.count = _G.jungle_2.count + 1
			self:GetParent():SetDayTimeVisionRange(1500)
			self:GetParent():SetNightTimeVisionRange(1500)
			local particleLeader = ParticleManager:CreateParticle( "particles/dire_fx/fire_barracks.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent() ) 
			ParticleManager:SetParticleControlEnt( particleLeader, PATTACH_OVERHEAD_FOLLOW, self:GetParent(), PATTACH_OVERHEAD_FOLLOW, "follow_overhead", self:GetParent():GetAbsOrigin(), true )
			--self:GetParent():Attribute_SetIntValue( "particleID", particleLeader)
		end
	end
end