LinkLuaModifier( "modifier_npc_dota_hero_keeper_of_the_light_spell1", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell1", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier( "modifier_npc_dota_hero_keeper_of_the_light_spell1_effect", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell1", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier( "modifier_npc_dota_hero_keeper_of_the_light_spell1_buff", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell1", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier( "modifier_npc_dota_hero_keeper_of_the_light_spell1_effect_hit", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell1", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier( "modifier_dummy", "modifiers/modifier_dummy", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_keeper_of_the_light_spell1 = class({})

function npc_dota_hero_keeper_of_the_light_spell1:OnSpellStart()
	-- self:GetCaster():EmitSound("Hero_Pangolier.Gyroshell.Loop")
		EmitSoundOn("Hero_KeeperOfTheLight.Illuminate.Charge", self:GetCaster())
	self.duration = self:GetSpecialValueFor("duration")
	self:GetCaster():AddNewModifier(self:GetCaster(),self,"modifier_npc_dota_hero_keeper_of_the_light_spell1",{ duration = self.duration }	)
	CreateModifierThinker(self:GetCaster(),self,"modifier_npc_dota_hero_keeper_of_the_light_spell1_buff",{ duration = self.duration },self:GetCaster():GetOrigin(),self:GetCaster():GetTeamNumber(),false)
end

-----------------------------------------------------------------------------------------------------------

modifier_npc_dota_hero_keeper_of_the_light_spell1_buff = class({})

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:IsHidden()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:IsPurgable()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:OnCreated( kv )
	self.radius = self:GetAbility():GetSpecialValueFor( "radius" )
	self.thinker = kv.isProvidedByAura~=1
	if not IsServer() then return end
	if not self.thinker then return end
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:OnDestroy()
	if not IsServer() then return end
	if not self.thinker then return end
	UTIL_Remove( self:GetParent() )
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE,
	}
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:GetModifierHealthRegenPercentage()
	return self:GetAbility():GetSpecialValueFor( "heal" )
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:IsAura()
	return self.thinker
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:GetModifierAura()
	return "modifier_npc_dota_hero_keeper_of_the_light_spell1_buff"
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:GetAuraRadius()
	return 450
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:GetAuraDuration()
	return 0.1
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:GetAuraSearchFlags()
	return 0
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:GetEffectName()
	return "particles/units/heroes/hero_keeper_of_the_light/keeper_spirit_form_ambient_glow2.vpcf"
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_buff:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

-----------------------------------------------------------------------------------------------------------

modifier_npc_dota_hero_keeper_of_the_light_spell1 = class({})

function modifier_npc_dota_hero_keeper_of_the_light_spell1:IsHidden()	
	return true
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1:IsPurgable()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1:OnCreated()	
	self.spirits_startTime		= GameRules:GetGameTime()
	self.spirits_numSpirits		= 0
	self.spirits_spiritsSpawned	= {}
	self.spirits_radius = self:GetAbility():GetSpecialValueFor("radius")
	self.duration = self:GetAbility():GetSpecialValueFor("duration")
	self.spirits_movementFactor	= 0
	self.caster_pos = self:GetCaster():GetAbsOrigin()
	self:StartIntervalThink(0.03)
	self.numSpiritsMax	= self:GetAbility():GetLevel()
	
    self.particle = ParticleManager:CreateParticle("particles/keeper_ground_ring.vpcf", PATTACH_ABSORIGIN, self:GetCaster())
    ParticleManager:SetParticleControl(self.particle, 1, Vector(450, 1, 1))
    ParticleManager:SetParticleControl(self.particle, 2, Vector(0, 0, 0))
    self:AddParticle(self.particle, false, false, -1, false, false)
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1:OnIntervalThink()
	if not IsServer() then return end

	local elapsedTime	= GameRules:GetGameTime() - self.spirits_startTime

	local idealNumSpiritsSpawned = elapsedTime / 0.1
	idealNumSpiritsSpawned = math.min( idealNumSpiritsSpawned, self.numSpiritsMax )

	if self.spirits_numSpirits < idealNumSpiritsSpawned then

		local newSpirit = CreateUnitByName( "npc_keeper_horse", self.caster_pos, false, self:GetCaster(), self:GetCaster(), self:GetCaster():GetTeamNumber() )
		newSpirit:AddNewModifier(self:GetCaster(),self,"modifier_dummy",{} )
		newSpirit:AddNewModifier(self:GetCaster(),self:GetAbility(),"modifier_npc_dota_hero_keeper_of_the_light_spell1_effect",{ duration = self.duration })

		local spiritIndex = self.spirits_numSpirits + 1
		newSpirit.spirit_index = spiritIndex
		self.spirits_numSpirits = spiritIndex
		self.spirits_spiritsSpawned[spiritIndex] = newSpirit
		newSpirit:StartGesture(ACT_DOTA_RUN)
	end

	local currentRadius	= self:GetAbility():GetSpecialValueFor("radius")
	local deltaRadius = self.spirits_movementFactor * 150 * 0.03
	currentRadius = currentRadius + deltaRadius
	currentRadius = math.min( math.max( currentRadius, self.spirits_radius ), 650 )

	local currentRotationAngle	= elapsedTime * 100
	local rotationAngleOffset	= 360 / self:GetAbility():GetLevel()

	local numSpiritsAlive = 0

	for k,v in pairs( self.spirits_spiritsSpawned ) do

		numSpiritsAlive = numSpiritsAlive + 1

		local rotationAngle = currentRotationAngle - rotationAngleOffset * ( k - 1 ) 

		local relPos = Vector( 0, currentRadius, 0 ) 

		relPos = RotatePosition( Vector(0,0,0), QAngle( 0, rotationAngle, 0 ), -relPos )

		local absPos = GetGroundPosition( relPos + self.caster_pos, v )

		v:SetAbsOrigin( absPos )
		v:SetAngles(0,rotationAngle,0)
	end

	if self.spirits_numSpirits == self.numSpiritsMax and numSpiritsAlive == 0 then
		return
	end
end

----------------------------------------------------

modifier_npc_dota_hero_keeper_of_the_light_spell1_effect = class({})

function modifier_npc_dota_hero_keeper_of_the_light_spell1_effect:IsPurgable()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_effect:OnCreated(params)
	if IsServer() then
		self.caster = self:GetCaster()
		self:StartIntervalThink(0.1)
	end
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_effect:OnIntervalThink()
	if IsServer() then 
		self.creep_damage = self:GetAbility():GetSpecialValueFor("damage")
		
		local spirit = self:GetParent()
		
		local enemies = FindUnitsInRadius( self.caster:GetTeamNumber(), spirit:GetAbsOrigin(), nil, 100, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)
		if enemies ~= nil and #enemies > 0 then
			for _,enemy in pairs(enemies) do
				if not enemy:HasModifier("modifier_npc_dota_hero_keeper_of_the_light_spell1_effect_hit") then
					enemy:AddNewModifier(self.caster, nil, "modifier_npc_dota_hero_keeper_of_the_light_spell1_effect_hit", {duration = 0.25})
					ApplyDamage({ victim = enemy, damage = self.creep_damage, damage_type = DAMAGE_TYPE_PHYSICAL, attacker = self:GetCaster()})	
				end
			end	
		end
	end
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_effect:OnDestroy()
	UTIL_Remove( self:GetParent() )
end

---------------------------------------------------------

modifier_npc_dota_hero_keeper_of_the_light_spell1_effect_hit = class({})

function modifier_npc_dota_hero_keeper_of_the_light_spell1_effect_hit:IsHidden()
	return true
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_effect_hit:OnCreated() 
	if IsServer() then
		local target = self:GetParent()
		EmitSoundOn("Hero_Wisp.Spirits.TargetCreep", target)
		self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_wisp/wisp_guardian_explosion_small.vpcf", PATTACH_ABSORIGIN_FOLLOW, target)
	end
end

function modifier_npc_dota_hero_keeper_of_the_light_spell1_effect_hit:OnRemoved()
	if IsServer() then
		ParticleManager:DestroyParticle(self.pfx, false)
	end
end