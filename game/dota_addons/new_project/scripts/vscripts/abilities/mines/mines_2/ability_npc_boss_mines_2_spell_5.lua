LinkLuaModifier( "modifier_ability_npc_boss_mines_2_spell_5", "abilities/mines/mines_2/ability_npc_boss_mines_2_spell_5", LUA_MODIFIER_MOTION_NONE )

ability_npc_boss_mines_2_spell_5 = class({})

function ability_npc_boss_mines_2_spell_5:OnSpellStart()
    self:GetCaster():StartGestureWithPlaybackRate(ACT_DOTA_CAST_ABILITY_2, 0.1)
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_mines_2_spell_5", {})
end

-----------------------------------------------------------------

modifier_ability_npc_boss_mines_2_spell_5 = class({})

function modifier_ability_npc_boss_mines_2_spell_5:IsHidden()
    return true
end

function modifier_ability_npc_boss_mines_2_spell_5:IsPurgable()
    return false
end

function modifier_ability_npc_boss_mines_2_spell_5:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_mines_2_spell_5:OnCreated()
    self.count = 0 
    self.targetcount = self:GetAbility():GetSpecialValueFor("count")
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self:StartIntervalThink(1)
end

function modifier_ability_npc_boss_mines_2_spell_5:OnIntervalThink()
if not IsServer() then return end
    self.count = self.count + 1
    if self.count ~= self.targetcount then
        EmitSoundOn("Hero_EarthShaker.EchoSlam.Arcana", self:GetCaster())
        local pfx = ParticleManager:CreateParticle("particles/econ/items/earthshaker/earthshaker_arcana/earthshaker_arcana_echoslam_start.vpcf", PATTACH_POINT, self:GetCaster())
        ParticleManager:ReleaseParticleIndex(pfx)
        local pfx = ParticleManager:CreateParticle("particles/econ/items/earthshaker/earthshaker_arcana/earthshaker_arcana_echoslam_start_dust_sphere.vpcf", PATTACH_POINT, self:GetCaster())
        ParticleManager:ReleaseParticleIndex(pfx)
        local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 600, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
        for _,unit in pairs(enemies) do
            EmitSoundOn("Hero_EarthShaker.EchoSlamEcho.Arcana", unit)
            local damage = ApplyDamage({victim = unit,
            damage =  self.damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            attacker = self:GetCaster(),
            ability = self:GetAbility()})
            self:GetCaster():Heal(damage, self:GetAbility())
	        SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetCaster(), damage, nil)
			local lifesteal_pfx = ParticleManager:CreateParticle("particles/items3_fx/octarine_core_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster())
			ParticleManager:ReleaseParticleIndex(lifesteal_pfx)
        end
    else
        EmitSoundOn("Hero_EarthShaker.EchoSlam.Arcana", self:GetCaster())
        local pfx = ParticleManager:CreateParticle("particles/econ/items/earthshaker/earthshaker_arcana/earthshaker_arcana_echoslam_start.vpcf", PATTACH_POINT, self:GetCaster())
        ParticleManager:ReleaseParticleIndex(pfx)
        local pfx = ParticleManager:CreateParticle("particles/econ/items/earthshaker/earthshaker_arcana/earthshaker_arcana_echoslam_start_dust_sphere.vpcf", PATTACH_POINT, self:GetCaster())
        ParticleManager:ReleaseParticleIndex(pfx)
        local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 600, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
        for _,unit in pairs(enemies) do
            EmitSoundOn("Hero_EarthShaker.EchoSlamEcho.Arcana", unit)
            local damage = ApplyDamage({victim = unit,
            damage =  self.damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            attacker = self:GetCaster(),
            ability = self:GetAbility()})
            self:GetCaster():Heal(damage, self:GetAbility())
	        SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self:GetCaster(), damage, nil)
			local lifesteal_pfx = ParticleManager:CreateParticle("particles/items3_fx/octarine_core_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster())
			ParticleManager:ReleaseParticleIndex(lifesteal_pfx)
        end
        self:GetCaster():FadeGesture(ACT_DOTA_CAST_ABILITY_2)
        self:Destroy()
    end
end

function modifier_ability_npc_boss_mines_2_spell_5:CheckState()
    return {
        [MODIFIER_STATE_INVULNERABLE] = true,
        [MODIFIER_STATE_DISARMED] = true,
        [MODIFIER_STATE_ROOTED] = true,
        [MODIFIER_STATE_NO_HEALTH_BAR] = true
    }
end
