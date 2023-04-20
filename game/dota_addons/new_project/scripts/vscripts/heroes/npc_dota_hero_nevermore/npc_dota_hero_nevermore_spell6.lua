LinkLuaModifier( "modifier_npc_dota_hero_nevermore_spell6","heroes/npc_dota_hero_nevermore/npc_dota_hero_nevermore_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_nevermore_spell6_animation","heroes/npc_dota_hero_nevermore/npc_dota_hero_nevermore_spell6", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_nevermore_spell6 = class({})

function npc_dota_hero_nevermore_spell6:OnSpellStart()
	local caster = self:GetCaster()
	self.souls_mod = self:GetCaster():FindModifierByName("modifier_npc_dota_hero_nevermore_spell3")
	if self.souls_mod and self.souls_mod:GetStackCount() == 0 then
		caster:Stop()
		EmitSoundOn("nevermore_nev_arc_attack_01",caster)
		return
	end
    self.mod = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_nevermore_spell6", {})
    Timers:CreateTimer(0,function()
        if caster:HasModifier("modifier_npc_dota_hero_nevermore_spell6") then
            caster:AddNewModifier(caster, self, "modifier_npc_dota_hero_nevermore_spell6_animation", {duration = 3})
            EmitSoundOn("Hero_Nevermore.Taunt.Swagger",caster)
            return 3
        end
    end)
end

function npc_dota_hero_nevermore_spell6:OnChannelFinish(bInterrupted)
	if not IsServer() then return end
	if self.mod or not bInterrupted then
		self.mod:Destroy()
		StopSoundOn("Hero_Nevermore.Taunt.Swagger",self:GetCaster())
		self:GetCaster():FindModifierByName("modifier_npc_dota_hero_nevermore_spell6_animation"):Destroy()
	end
end

-------------------------------------------------------

modifier_npc_dota_hero_nevermore_spell6 = class({})

function modifier_npc_dota_hero_nevermore_spell6:IsHidden()
    return true
end

function modifier_npc_dota_hero_nevermore_spell6:IsPurgable()
    return false
end

function modifier_npc_dota_hero_nevermore_spell6:OnCreated()
    if not IsServer() then return end
    self.radius_find = self:GetAbility():GetSpecialValueFor("radius_find")
	self.radius_damage = self:GetAbility():GetSpecialValueFor("radius_damage")
    self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_nevermore_spell6:OnIntervalThink()
	local damage = self:GetAbility():GetSpecialValueFor("damage") * self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * 0.01 
	local damage_per_soul = self:GetAbility():GetSpecialValueFor("damage_per_soul")
	if self:GetAbility().souls_mod:GetStackCount() == 0 then
		self:GetCaster():Stop()
		EmitSoundOn("nevermore_nev_arc_attack_01",caster)
	end
	local enemies = FindUnitsInRadius(self:GetParent():GetTeamNumber(), self:GetParent():GetAbsOrigin(), nil, self.radius_find, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 1,false)
	for _,enemy in pairs(enemies) do
		if self:GetAbility().souls_mod and self:GetAbility().souls_mod:GetStackCount() > 0 then
			self:GetAbility().souls_mod:DecrementStackCount()
			self:GetAbility().souls_mod:DecrementStackCount()
			-- souls_mod:DecrementStackCount()
			-- souls_mod:SetStackCount(souls_mod:GetStackCount() - 1)
			local position = enemy:GetAbsOrigin()
			
			local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_nevermore/nevermore_shadowraze.vpcf", PATTACH_WORLDORIGIN, nil )
			ParticleManager:SetParticleControl( effect_cast, 0, position )
			ParticleManager:SetParticleControl( effect_cast, 1, Vector( self.radius_damage, 1, 1 ) )
			ParticleManager:ReleaseParticleIndex( effect_cast )
			EmitSoundOnLocationWithCaster( position, "Hero_Nevermore.Shadowraze", self:GetCaster() )
			
			local units = FindUnitsInRadius(self:GetParent():GetTeamNumber(), position, nil, self.radius_damage, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 1,false)
			for _,unit in pairs(units) do
				ApplyDamage({victim = unit,
				damage = damage + damage_per_soul*self:GetAbility().souls_mod:GetStackCount(),
				damage_type = DAMAGE_TYPE_MAGICAL,
				damage_flags = DOTA_DAMAGE_FLAG_NONE,
				ability = self:GetAbility(),
				attacker = self:GetCaster()
				})
			end
		end	
	end
end

modifier_npc_dota_hero_nevermore_spell6_animation = class({})

function modifier_npc_dota_hero_nevermore_spell6_animation:IsHidden()
    return true
end

function modifier_npc_dota_hero_nevermore_spell6_animation:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
        MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
    }
end

function modifier_npc_dota_hero_nevermore_spell6_animation:GetOverrideAnimation()
    return ACT_DOTA_TAUNT
end

function modifier_npc_dota_hero_nevermore_spell6_animation:GetOverrideAnimationRate()
    return 1
end

function modifier_npc_dota_hero_nevermore_spell6_animation:GetActivityTranslationModifiers()
    return "swag_gesture"
end