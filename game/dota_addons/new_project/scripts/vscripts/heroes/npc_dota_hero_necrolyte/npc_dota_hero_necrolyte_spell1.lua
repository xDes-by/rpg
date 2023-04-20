LinkLuaModifier( "modifier_npc_dota_hero_necrolyte_spell1", "heroes/npc_dota_hero_necrolyte/npc_dota_hero_necrolyte_spell1", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_necrolyte_spell1 = class({})

function npc_dota_hero_necrolyte_spell1:GetAOERadius()
	return self:GetSpecialValueFor("radius_throw")
end

function npc_dota_hero_necrolyte_spell1:OnSpellStart()
	local projectile_name = "particles/units/heroes/hero_alchemist/alchemist_unstable_concoction_projectile.vpcf"
	local projectile_speed = 600
	local count = 0
	
	local targets = {}
	for i = 1, 3 do
		local dummy = CreateUnitByName("npc_dummy_unit", self:GetCursorPosition() +  RandomVector(RandomInt(-250, 250)), false, self:GetCaster(), self:GetCaster(), self:GetCaster():GetTeamNumber())
		dummy:AddNewModifier(self:GetCaster(),self,"modifier_dummy",{} )
		table.insert(targets, dummy)
	end
	
	local delay = 0
	for _,i in pairs(targets) do
		local current_delay = delay
		Timers:CreateTimer(current_delay, function()
			local info = {
				Target = i,
				Source = self:GetCaster(),
				Ability = self,	
				EffectName = projectile_name,
				iMoveSpeed = projectile_speed,
				bDodgeable = false,
			}
			
			ProjectileManager:CreateTrackingProjectile(info)
			EmitSoundOn( "Hero_Alchemist.UnstableConcoction.Throw", self:GetCaster() )
		end)
		
		delay = delay + 0.35
	end
end

function npc_dota_hero_necrolyte_spell1:OnProjectileHit( target, location )
	if not target then return end
	local heal = self:GetSpecialValueFor("heal")
	local entity = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), target:GetOrigin(), nil, self:GetSpecialValueFor("radius_boom"), DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_NONE, 0, false )
	for _,ent in pairs(entity) do
		if ent:GetTeamNumber() == self:GetCaster():GetTeamNumber() then
			ent:Heal(heal, self)
			SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, ent, heal, nil)
        else
            ApplyDamage({victim = ent,
            damage = heal,
            damage_type = DAMAGE_TYPE_MAGICAL,
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            attacker = self:GetCaster()})
		end
	end
	
	local pfx = ParticleManager:CreateParticle("particles/econ/items/dark_willow/dark_willow_immortal_2021/dw_2021_willow_wisp_spell_impact_ring_smoke.vpcf", PATTACH_POINT, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 0, target:GetAbsOrigin())
    ParticleManager:SetParticleControl(pfx, 1, Vector(self:GetSpecialValueFor("radius_boom"), 0, 0))
    ParticleManager:ReleaseParticleIndex(pfx)
	EmitSoundOn( "Hero_Alchemist.UnstableConcoction.Stun", target )
	target:ForceKill(false)
end



























-- function npc_dota_hero_necrolyte_spell1:CastFilterResultLocation( vLocation )
    -- self.pos = self:GetCaster():GetAbsOrigin()
    -- self.min = self:GetSpecialValueFor("min_castrange")
    -- self.max = self:GetSpecialValueFor("max_castrange")
    -- self.len = (self.pos - vLocation):Length2D()
    -- if self.max > self.len and self.len > self.min then
        -- return UF_SUCCESS
    -- end
    -- return UF_FAIL_CUSTOM
-- end

-- function npc_dota_hero_necrolyte_spell1:GetCustomCastErrorLocation(vLocation)
    -- if self.len < self.min then
        -- return "error_npc_dota_hero_necrolyte_spell1_near"
    -- end
    -- if self.len > self.max then
        -- return "error_npc_dota_hero_necrolyte_spell1_far"
    -- end
-- end

-- function npc_dota_hero_necrolyte_spell1:OnSpellStart()
    -- if RollPseudoRandom(15,self:GetCaster()) then
        -- self:EndCooldown()
    -- end
    -- local direction = (self:GetCursorPosition() - self.pos):Normalized()
    -- direction.z = 0
    -- local range = (self:GetCursorPosition() - self.pos):Length2D()
    -- self.targets = {}
    -- for i=1,3 do
        -- local newdirection = RotatePosition( Vector(0,0,0), QAngle( 0, -120 + 60 * i, 0 ), direction )
        -- local npcposition = newdirection * range + self.pos
        -- local npc = CreateModifierThinker(self:GetCaster(), self, "modifier_npc_dota_hero_necrolyte_spell1", {}, npcposition, DOTA_TEAM_GOODGUYS, false)
        -- table.insert( self.targets, npc )
    -- end
    -- if self:GetAutoCastState() then
        -- for _,unit in pairs(self.targets) do
            -- unit:FindModifierByName("modifier_npc_dota_hero_necrolyte_spell1"):heal()
        -- end
    -- else
        -- for _,unit in pairs(self.targets) do
            -- unit:FindModifierByName("modifier_npc_dota_hero_necrolyte_spell1"):damage()
        -- end        
    -- end
-- end

-- modifier_npc_dota_hero_necrolyte_spell1 = class({})

-- function modifier_npc_dota_hero_necrolyte_spell1:heal()
    -- self:SetDuration(1, false)
    -- local radius = self:GetAbility():GetSpecialValueFor("radius")
    -- local heal = self:GetAbility():GetSpecialValueFor("heal")
	-- local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetParent():GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    -- for _,unit in pairs(enemies) do
        -- unit:Heal(heal, self:GetAbility())
    -- end
    -- local pfx = ParticleManager:CreateParticle("particles/econ/items/dark_willow/dark_willow_immortal_2021/dw_2021_willow_wisp_spell_impact_ring_smoke.vpcf", PATTACH_POINT, self:GetCaster())
    -- ParticleManager:SetParticleControl(pfx, 0, self:GetParent():GetAbsOrigin())
    -- ParticleManager:SetParticleControl(pfx, 1, Vector(radius, 0, 0))
    -- ParticleManager:ReleaseParticleIndex(pfx)
-- end

-- function modifier_npc_dota_hero_necrolyte_spell1:damage()
    -- self:SetDuration(1, false)
    -- local radius = self:GetAbility():GetSpecialValueFor("radius")
    -- local damage = self:GetAbility():GetSpecialValueFor("damage")
	-- local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetParent():GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    -- for _,unit in pairs(enemies) do
        -- ApplyDamage({victim = unit,
        -- damage =  damage,
        -- damage_type = DAMAGE_TYPE_MAGICAL,
        -- damage_flags = DOTA_DAMAGE_FLAG_NONE,
        -- attacker = self:GetCaster(),
        -- ability = self:GetAbility()})
    -- end
    -- local pfx = ParticleManager:CreateParticle("particles/econ/items/death_prophet/death_prophet_ti9/death_prophet_silence_ti9_ground_smoke.vpcf", PATTACH_POINT, self:GetCaster())
    -- ParticleManager:SetParticleControl(pfx,0, self:GetParent():GetAbsOrigin())
    -- ParticleManager:SetParticleControl(pfx, 1, Vector(radius, 0, 0))
    -- ParticleManager:ReleaseParticleIndex(pfx)
-- end

-- function modifier_npc_dota_hero_necrolyte_spell1:OnDestroy()
    -- if IsClient() then
        -- return
    -- end
    -- UTIL_Remove(self:GetParent())
-- end