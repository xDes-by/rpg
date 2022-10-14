ablility_npc_desert3_boss2_spell1 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert3_boss2_spell1","abilities/desert3/ablility_npc_desert3_boss2_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ablility_npc_desert3_boss2_spell1_enemy","abilities/desert3/ablility_npc_desert3_boss2_spell1", LUA_MODIFIER_MOTION_BOTH )
LinkLuaModifier( "modifier_ablility_npc_desert3_boss2_spell1_bumble","abilities/desert3/ablility_npc_desert3_boss2_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ablility_npc_desert3_boss2_spell1_bumble_damage","abilities/desert3/ablility_npc_desert3_boss2_spell1", LUA_MODIFIER_MOTION_NONE )


function ablility_npc_desert3_boss2_spell1:OnSpellStart()
    self.center = self:GetCaster():GetOrigin()
    local npc = CreateModifierThinker(self:GetCaster(), self, "modifier_ablility_npc_desert3_boss2_spell1", {duration = 30}, self.center, DOTA_TEAM_BADGUYS, false)
end

modifier_ablility_npc_desert3_boss2_spell1 = class({})

function modifier_ablility_npc_desert3_boss2_spell1:OnCreated()
    self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_sandking/sandking_sandstorm.vpcf", PATTACH_POINT, self:GetParent() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 500, 500, 500 ) )
	EmitSoundOn( "Ability.SandKing_SandStorm.loop", self:GetParent() )
    self.table = {}
    self.bumbleradius = self:GetAbility():GetSpecialValueFor("bumbleradius")
    self.roottime = self:GetAbility():GetSpecialValueFor("roottime")
    self.bumbledamage = self:GetAbility():GetSpecialValueFor("bumbledamage")
    self.bumbledelay = self:GetAbility():GetSpecialValueFor("bumbledelay")
    self:StartIntervalThink(1)
end

function modifier_ablility_npc_desert3_boss2_spell1:OnDestroy()
	ParticleManager:DestroyParticle( self.effect_cast, false )
	ParticleManager:ReleaseParticleIndex( self.effect_cast )
	StopSoundOn( "Ability.SandKing_SandStorm.loop", self:GetParent() )
    for _,unit in pairs(self.table) do
        if unit and not unit:IsNull() then
            UTIL_Remove(unit)
        end
    end
end

function modifier_ablility_npc_desert3_boss2_spell1:OnIntervalThink()
    if (self:GetCaster():GetOrigin() - npc:GetOrigin()):Length2D() > 500 then
        UTIL_Remove(self:GetParent())
        return
    end
    local position = self:GetParent():GetAbsOrigin() + RandomVector(RandomInt(100, 500))
    local npc = CreateModifierThinker(self:GetCaster(), self, "modifier_ablility_npc_desert3_boss2_spell1_bumble", 
    {duration = 30, radius = self.bumbleradius, root = self.roottime, damage = self.bumbledamage, delay = self.bumbledelay
    }, position, DOTA_TEAM_BADGUYS, false)
    table.insert( self.table, npc )
end
-- Aura template
function modifier_ablility_npc_desert3_boss2_spell1:IsAura()
    return true
end

function modifier_ablility_npc_desert3_boss2_spell1:GetModifierAura()
    return "modifier_ablility_npc_desert3_boss2_spell1_enemy"
end

function modifier_ablility_npc_desert3_boss2_spell1:GetAuraRadius()
    return 500
end

function modifier_ablility_npc_desert3_boss2_spell1:GetAuraDuration()
    return 0.5
end

function modifier_ablility_npc_desert3_boss2_spell1:GetAuraSearchTeam()
    return DOTA_UNIT_TARGET_TEAM_ENEMY
end

function modifier_ablility_npc_desert3_boss2_spell1:GetAuraSearchType()
    return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC
end

function modifier_ablility_npc_desert3_boss2_spell1:GetAuraSearchFlags()
    return DOTA_UNIT_TARGET_FLAG_NONE
end

modifier_ablility_npc_desert3_boss2_spell1_enemy = class({})
--Classifications template
function modifier_ablility_npc_desert3_boss2_spell1_enemy:IsHidden()
    return false
end

function modifier_ablility_npc_desert3_boss2_spell1_enemy:IsDebuff()
    return true
end

function modifier_ablility_npc_desert3_boss2_spell1_enemy:IsPurgable()
    return false
end

function modifier_ablility_npc_desert3_boss2_spell1_enemy:RemoveOnDeath()
    return true
end

function modifier_ablility_npc_desert3_boss2_spell1_enemy:DestroyOnExpire()
    return true
end

function modifier_ablility_npc_desert3_boss2_spell1_enemy:OnCreated(kv)
    self.damage = self:GetAbility():GetSpecialValueFor("damage") / 10
    if IsClient() then
        return
    end
    self.center = self:GetAbility().center
    self.center.z = 0
    if self:ApplyHorizontalMotionController() == false then
        self:Destroy()
    end
    self:StartIntervalThink(0.1)
end

function modifier_ablility_npc_desert3_boss2_spell1_enemy:OnIntervalThink()
    ApplyDamage({victim = self:GetParent(),
    damage = self.damage,
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_ablility_npc_desert3_boss2_spell1_enemy:UpdateHorizontalMotion( me, dt )
	-- get vector
    print(dt)
	local target = self:GetParent():GetOrigin()-self.center
	target.z = 0

	-- reduce length by pull speed
	local targetL = target:Length2D()-30*dt

	-- rotate by rotate speed
	local targetN = target:Normalized()
	local deg = math.atan2( targetN.y, targetN.x )
	local targetN = Vector( math.cos(deg+0.25*dt), math.sin(deg+0.25*dt), 0 );
    local moving = self:GetParent():GetForwardVector() * self:GetParent():GetMoveSpeedModifier(self:GetParent():GetBaseMoveSpeed(), true) * dt/3
    FindClearSpaceForUnit(self:GetParent(), self.center + targetN * targetL + moving, true)
end

function modifier_ablility_npc_desert3_boss2_spell1_enemy:OnHorizontalMotionInterrupted()
	self:Destroy()
end

modifier_ablility_npc_desert3_boss2_spell1_bumble = class({})

function modifier_ablility_npc_desert3_boss2_spell1_bumble:IsHidden()
	return false
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble:IsDebuff()
	return false
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble:IsStunDebuff()
	return false
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble:IsPurgable()
	return false
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble:OnCreated( kv )
	if not IsServer() then return end
	self.radius = kv.radius
	self.root = kv.root
	self.damage = kv.damage
	local delay = kv.delay
	self:StartIntervalThink( delay )
	self:PlayEffects()
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble:OnDestroy()
	if not IsServer() then return end
	EmitSoundOn( "Hero_DarkWillow.Bramble.Destroy", self:GetParent() )
	UTIL_Remove( self:GetParent() )
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble:OnIntervalThink()
	if not self.delay then
		self.delay = true
		local interval = 0.03
		self:StartIntervalThink( interval )
		return
	end
	local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),	-- int, your team number
		self:GetParent():GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		0,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)

	local target = nil
	for _,enemy in pairs(enemies) do
		target = enemy
		break
	end
	if not target then return end
	target:AddNewModifier(
		self:GetCaster(),
		self:GetAbility(),
		"modifier_ablility_npc_desert3_boss2_spell1_bumble_damage",
		{
			duration = self.root,
			damage = self.damage,
		}
	)

	self:Destroy()
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble:PlayEffects()
	local particle_cast = "particles/units/heroes/hero_dark_willow/dark_willow_bramble_wraith.vpcf"
	local sound_cast = "Hero_DarkWillow.Bramble.Spawn"
	local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( effect_cast, 0, self:GetParent():GetOrigin() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.radius, self.radius, self.radius ) )
	self:AddParticle(
		effect_cast,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)

	-- Create Sound
	EmitSoundOn( sound_cast, self:GetParent() )
end

modifier_ablility_npc_desert3_boss2_spell1_bumble_damage = class({})

function modifier_ablility_npc_desert3_boss2_spell1_bumble_damage:IsHidden()
	return false
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble_damage:IsDebuff()
	return true
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble_damage:IsStunDebuff()
	return false
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble_damage:IsPurgable()
	return true
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble_damage:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble_damage:OnCreated( kv )

	if not IsServer() then return end
	-- references
	local duration = kv.duration
	local damage = kv.damage
	local interval = 0.5
	local dps = damage

	-- precache damage
	self.damageTable = {
		victim = self:GetParent(),
		attacker = self:GetCaster(),
		damage = dps,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self:GetAbility(), --Optional.
	}
	-- ApplyDamage(damageTable)

	-- Start interval
	self:StartIntervalThink( interval )

	-- play effects
	local sount_cast1 = "Hero_DarkWillow.Bramble.Target"
	local sount_cast2 = "Hero_DarkWillow.Bramble.Target.Layer"
	EmitSoundOn( sount_cast1, self:GetParent() )
	EmitSoundOn( sount_cast2, self:GetParent() )
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble_damage:CheckState()
	return {
		[MODIFIER_STATE_ROOTED] = true,
	}
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble_damage:OnIntervalThink()
	ApplyDamage( self.damageTable )
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble_damage:GetEffectName()
	return "particles/units/heroes/hero_dark_willow/dark_willow_bramble.vpcf"
end

function modifier_ablility_npc_desert3_boss2_spell1_bumble_damage:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end