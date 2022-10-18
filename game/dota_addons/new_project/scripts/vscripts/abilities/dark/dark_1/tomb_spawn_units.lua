LinkLuaModifier( "modifier_tomb_spawn_units", "abilities/dark/dark_1/tomb_spawn_units", LUA_MODIFIER_MOTION_NONE )

tomb_spawn_units = class({})

function tomb_spawn_units:GetIntrinsicModifierName()
	return "modifier_tomb_spawn_units"
end

-------------------------------------------------------------------------

modifier_tomb_spawn_units = class({})

function modifier_tomb_spawn_units:IsHidden()
	return true
end

function modifier_tomb_spawn_units:IsPurgable()
	return false
end

function modifier_tomb_spawn_units:OnCreated()

end

function modifier_tomb_spawn_units:CheckState()
	local state =
	{
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = false,
	}
	return state
end

function modifier_tomb_spawn_units:DeclareFunctions()
	return { MODIFIER_EVENT_ON_DEATH }
end

function modifier_tomb_spawn_units:OnDeath(keys)
	if IsServer() then
		if keys.unit == self:GetParent() then
			local point = self:GetParent():GetOrigin()
			local particle_pre_blast_fx = ParticleManager:CreateParticle("particles/generic_hero_status/death_tombstone.vpcf", PATTACH_CUSTOMORIGIN, nil)
			ParticleManager:SetParticleControl(particle_pre_blast_fx, 0, point)
			ParticleManager:ReleaseParticleIndex(particle_pre_blast_fx)
			EmitGlobalSound("Dungeon.SmashCrateShort")
			UTIL_Remove( self:GetParent() )
			spawn_units(point)
		end
	end
end	   

dark_model = {"models/items/undying/idol_of_ruination/ruin_wight_minion_torso.vmdl", "models/items/undying/idol_of_ruination/ruin_wight_minion.vmdl"}

function spawn_units(point)
	if IsServer() then
		local count = 0
		Timers:CreateTimer(0, function()
		if count < 5 then
			count = count + 1
				if count ~= 3 then
					unit = CreateUnitByName("npc_dark_creep_mini_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
					Rules:unit_settings(unit, "creep", "mini", 35, 140, 100)
					model = table.random(dark_model)
					unit:SetModel(model)
					Rules:SetAbilityLevel(unit)
				else
					unit = CreateUnitByName("npc_dark_creep_big_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
					Rules:unit_settings(unit, "creep", "big", 35, 140, 100)
					Rules:SetAbilityLevel(unit)
				end
				unit:EmitSound("Undying_Zombie.Spawn")
			return 1
		else
			return nil
			end
		end)
	end
end
