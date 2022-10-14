ability_npc_boss_cave3_spell4 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_cave3_spell4","abilities/cave3/ability_npc_boss_cave3_spell4", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_cave3_spell4:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_cave3_spell4", {duration = 3})
end

modifier_ability_npc_boss_cave3_spell4 = class({})
--Classifications template
function modifier_ability_npc_boss_cave3_spell4:IsHidden()
    return false
end

function modifier_ability_npc_boss_cave3_spell4:IsDebuff()
    return false
end

function modifier_ability_npc_boss_cave3_spell4:IsPurgable()
    return false
end

function modifier_ability_npc_boss_cave3_spell4:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_cave3_spell4:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_cave3_spell4:OnCreated()
    local effect_cast = ParticleManager:CreateParticle("particles/ability_npc_boss_cave3_spell4.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
	self:AddParticle(
		effect_cast,
		false, -- bDestroyImmediately
		false, -- bStatusEffect
		-1, -- iPriority
		false, -- bHeroEffect
		false -- bOverheadEffect
	)
    self.damage = 0
end

function modifier_ability_npc_boss_cave3_spell4:OnDestroy()
    EmitSoundOn("Ability.LightStrikeArray", self:GetCaster())
    local pfx = ParticleManager:CreateParticle("particles/econ/items/lina/lina_ti7/lina_spell_light_strike_array_ti7_gold.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 1, Vector(400, 0, 0))
    ParticleManager:ReleaseParticleIndex(pfx)
    if IsClient() then
        return
    end
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 400, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
    local damage = self.damage / #enemies
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
end

function modifier_ability_npc_boss_cave3_spell4:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK
    }
end

function modifier_ability_npc_boss_cave3_spell4:GetModifierTotal_ConstantBlock(data)
    self.damage = self.damage + data.damage
    return data.damage
end
