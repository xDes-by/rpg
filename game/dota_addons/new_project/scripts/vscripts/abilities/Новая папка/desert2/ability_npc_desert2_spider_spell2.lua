ability_npc_desert2_spider_spell2 = class({})

LinkLuaModifier( "modifier_ability_npc_desert2_spider_spell2","abilities/desert2/ability_npc_desert2_spider_spell2", LUA_MODIFIER_MOTION_NONE )

function ability_npc_desert2_spider_spell2:GetIntrinsicModifierName()
    return "modifier_ability_npc_desert2_spider_spell2"
end

modifier_ability_npc_desert2_spider_spell2 = class({})

--Classifications template
function modifier_ability_npc_desert2_spider_spell2:IsHidden()
    return true
end

function modifier_ability_npc_desert2_spider_spell2:IsPurgable()
    return false
end

function modifier_ability_npc_desert2_spider_spell2:RemoveOnDeath()
    return false
end

function modifier_ability_npc_desert2_spider_spell2:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_ability_npc_desert2_spider_spell2:GetModifierProcAttack_Feedback(data)
    if RollPseudoRandom(5,self:GetParent()) then
        -- unit identifier
        local caster = self:GetCaster()
        local target = data.target

        -- load data
        local mana_damage_pct = self:GetSpecialValueFor("mana_void_damage_per_mana")
        local mana_stun = self:GetSpecialValueFor("mana_void_ministun")
        local radius = self:GetSpecialValueFor( "mana_void_aoe_radius" )

        -- Add modifier
        target:AddNewModifier(
            caster, -- player source
            self, -- ability source
            "modifier_stunned", -- modifier name
            { duration = mana_stun } -- kv
        )

        -- Get damage value
        local mana_damage_pct = (target:GetMaxMana() - target:GetMana()) * mana_damage_pct

        -- Apply Damage	 
        local damageTable = {
            victim = target,
            attacker = caster,
            damage = mana_damage_pct,
            damage_type = DAMAGE_TYPE_MAGICAL,
            ability = self, --Optional.
        }
        -- ApplyDamage(damageTable)

        -- Find Units in Radius
        local enemies = FindUnitsInRadius(
            self:GetCaster():GetTeamNumber(),	-- int, your team number
            target:GetOrigin(),	-- point, center point
            nil,	-- handle, cacheUnit. (not known)
            radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
            DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
            DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
            0,	-- int, flag filter
            0,	-- int, order filter
            false	-- bool, can grow cache
        )

        for _,enemy in pairs(enemies) do
            damageTable.victim = enemy
            ApplyDamage(damageTable)
        end

        -- Play Effects
        self:PlayEffects2( target, radius )
    end
end
--------------------------------------------------------------------------------
function modifier_ability_npc_desert2_spider_spell2:PlayEffects1( bStart )
	local sound_cast = "Hero_Antimage.ManaVoidCast"

	if bStart then
		self.target = self:GetCursorTarget()
		EmitSoundOn( sound_cast, self.target )
	else
		StopSoundOn(sound_cast, self.target)
		self.target = nil
	end
end

function modifier_ability_npc_desert2_spider_spell2:PlayEffects2( target, radius )
	-- Get Resources
	local particle_target = "particles/units/heroes/hero_antimage/antimage_manavoid.vpcf"
	local sound_target = "Hero_Antimage.ManaVoid"

	-- Create Particle
	 local effect_target = ParticleManager:CreateParticle( particle_target, PATTACH_POINT_FOLLOW, target )
	--local effect_target = assert(loadfile("lua_abilities/rubick_spell_steal_lua/rubick_spell_steal_lua_arcana"))(self, particle_target, PATTACH_POINT_FOLLOW, target )
	ParticleManager:SetParticleControl( effect_target, 1, Vector( radius, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_target )

	-- Create Sound
	EmitSoundOn( sound_target, target )
end