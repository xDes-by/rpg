ability_npc_hell2_colume_wind = class({})

LinkLuaModifier( "modifier_ability_npc_hell2_colume_wind","abilities/hell2/ability_npc_hell2_colume_wind", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell2_colume_wind:Spawn()
	if IsClient() then
		return
	end
	Timers:CreateTimer(1,function()
		if self:GetCaster():IsAlive() then
			local hero = AICore:RandomEnemyHeroInRange(self:GetCaster(), 900)
			if hero ~= nil then
				if IsClient() then
					return
				end
				local point = hero:GetAbsOrigin()
				-- create modifier thinker
				CreateModifierThinker(
					self:GetCaster(),
					self,
					"modifier_ability_npc_hell2_colume_wind",
					{ duration = 3 },
					point,
					self:GetCaster():GetTeamNumber(),
					false
				)
				return 3
			else
				return 1
			end
		end
	end)
end

modifier_ability_npc_hell2_colume_wind = class({})
--Classifications template
function modifier_ability_npc_hell2_colume_wind:IsHidden()
    return true
end

function modifier_ability_npc_hell2_colume_wind:OnCreated(kv)
    self.direction = (self:GetParent():GetAbsOrigin() - self:GetCaster():GetAbsOrigin()):Normalized()
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_windrunner/windrunner_gale_force_owner.vpcf", PATTACH_POINT_FOLLOW, self:GetParent())
    ParticleManager:SetParticleControl(pfx, 1, Vector(0, 600, 0))
    ParticleManager:SetParticleControl(pfx, 3, self.direction)
    if IsClient() then
        return
    end
    self:StartIntervalThink(FrameTime())
end

function modifier_ability_npc_hell2_colume_wind:OnDestroy()
    UTIL_Remove(self:GetParent())
end

function modifier_ability_npc_hell2_colume_wind:OnIntervalThink()
	    local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),	-- int, your team number
		self:GetParent():GetAbsOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		600,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		0,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)
    for _,unit in pairs(enemies) do
        local newpos = unit:GetAbsOrigin() - self.direction * 250 * FrameTime()
        FindClearSpaceForUnit(unit, newpos, false)
    end
end