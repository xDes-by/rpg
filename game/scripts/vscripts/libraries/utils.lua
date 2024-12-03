function CDOTA_BaseNPC:CustomApplyDamage(target, caster, ability, damage_type)
	if caster:IsRealHero() then
		local data = CustomNetTables:GetTableValue("hero_hud_stats", tostring(caster:GetEntityIndex()))
		local min_damage = data.min_damage
		local max_damage = data.max_damage
		local critical_damage = data.critical_damage
		local excellent_damage = data.excellent_damage
		local reflected_damage = data.reflected_damage
		
		local base_damage = RandomInt(min_damage, max_damage)
		show_damage = Vector(255, 255, 255)
		
		local random_damage_type = RandomInt(1,100)
		
		if critical_damage > random_damage_type then
			show_damage = Vector(255, 238, 0)
			base_damage = max_damage
		end
		
		if excellent_damage > random_damage_type then
			base_damage = max_damage * 1.1 
			show_damage = Vector(0, 255, 0)
		end
	
		local resist_modifier = target:FindModifierByName("modifier_"..damage_type.."_resist")
		if resist_modifier then
			final_damage = base_damage * (2 - resist_modifier / 100)
		else
			final_damage = base_damage
		end
		
		local particle_damage = math.max(1, math.floor(final_damage))
		local particle = ParticleManager:CreateParticle("particles/msg_fx/msg_damage.vpcf", PATTACH_OVERHEAD_FOLLOW, target)
		ParticleManager:SetParticleControl(particle, 1, Vector(9, particle_damage, 0))
		ParticleManager:SetParticleControl(particle, 2, Vector(2, string.len(tostring(particle_damage)) + 1, 0))
		ParticleManager:SetParticleControl(particle, 3, show_damage)
		ParticleManager:ReleaseParticleIndex(particle)
		
		ApplyDamage({victim = target, attacker = caster, damage = final_damage, damage_type = DAMAGE_TYPE_PURE, ability = ability})
	end
end

function GetRandomPositionSquare(v1, v2)
	return Vector(RandomFloat(v1.x, v2.x), RandomFloat(v1.y, v2.y), RandomFloat(v1.z, v2.z))
end