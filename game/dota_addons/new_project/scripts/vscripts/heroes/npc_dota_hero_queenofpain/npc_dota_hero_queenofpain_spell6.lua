LinkLuaModifier( "modifier_npc_dota_hero_queenofpain_spell6", "heroes/npc_dota_hero_queenofpain/npc_dota_hero_queenofpain_spell6", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_queenofpain_spell6 = class({})

function npc_dota_hero_queenofpain_spell6:OnSpellStart()
    local target = self:GetCursorTarget()
    target:AddNewModifier(self:GetCursorTarget(), self, "modifier_npc_dota_hero_queenofpain_spell6", {duration = self:GetSpecialValueFor("duration")})
    local effect_cast = ParticleManager:CreateParticle( "particles/items4_fx/bull_whip_enemy.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControlEnt(effect_cast, 0, self:GetCaster(), PATTACH_POINT_FOLLOW, "attach_hitloc", self:GetCaster():GetAbsOrigin(), true)
	ParticleManager:SetParticleControlEnt(effect_cast, 1, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetAbsOrigin(), true)
	ParticleManager:ReleaseParticleIndex( effect_cast )
    EmitSoundOn( "Item.Bullwhip.Cast", target )
    Timers:CreateTimer(0.3,function()
        local effect_cast = ParticleManager:CreateParticle( "particles/econ/items/doom/doom_2021_immortal_weapon/doom_2021_immortal_weapon_infernalblade_impact.vpcf", PATTACH_ABSORIGIN_FOLLOW, target )
        ParticleManager:ReleaseParticleIndex( effect_cast )
        EmitSoundOn( "Hero_DoomBringer.InfernalBlade.Target", target )
    end)
end

-----------------------------------------------------------------

modifier_npc_dota_hero_queenofpain_spell6 = class({})

function modifier_npc_dota_hero_queenofpain_spell6:IsHidden()
   return false
end

function modifier_npc_dota_hero_queenofpain_spell6:IsDebuff()
   return true
end

function modifier_npc_dota_hero_queenofpain_spell6:IsPurgable()
   return true
end

function modifier_npc_dota_hero_queenofpain_spell6:OnCreated()
    self.damage = self:GetAbility():GetSpecialValueFor("burn_damage")
    self:StartIntervalThink(0.5)
end

function modifier_npc_dota_hero_queenofpain_spell6:OnIntervalThink()
    if not IsServer() then return end
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetParent():GetAbsOrigin(), nil, self:GetAbility():GetSpecialValueFor("radius_flashback"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in ipairs(enemies) do
        if unit ~= self:GetParent() and not unit:HasModifier("modifier_npc_dota_hero_queenofpain_spell6") then
            unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_queenofpain_spell6", {duration = self:GetAbility():GetSpecialValueFor("duration")})
            local effect_cast = ParticleManager:CreateParticle( "particles/econ/items/doom/doom_2021_immortal_weapon/doom_2021_immortal_weapon_infernalblade_impact.vpcf", PATTACH_ABSORIGIN_FOLLOW, unit )
            ParticleManager:ReleaseParticleIndex( effect_cast )
            EmitSoundOn( "Hero_DoomBringer.InfernalBlade.Target", unit )
			break
        end
    end
    ApplyDamage({victim = self:GetParent(),
    damage = self.damage/2,
    damage_type = DAMAGE_TYPE_MAGICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self:GetAbility()})
end

function modifier_npc_dota_hero_queenofpain_spell6:GetEffectName()
	return "particles/units/heroes/hero_jakiro/jakiro_liquid_fire_debuff.vpcf"
end

function modifier_npc_dota_hero_queenofpain_spell6:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end