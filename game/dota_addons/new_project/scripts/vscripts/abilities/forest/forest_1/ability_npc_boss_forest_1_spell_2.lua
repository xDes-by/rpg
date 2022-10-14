LinkLuaModifier( "modifier_ability_npc_boss_forest_1_spell_2", "abilities/forest/forest_1/ability_npc_boss_forest_1_spell_2", LUA_MODIFIER_MOTION_NONE )

ability_npc_boss_forest_1_spell_2 = class({})

function ability_npc_boss_forest_1_spell_2:GetChannelTime()
    return self:GetSpecialValueFor("duration")
end

function ability_npc_boss_forest_1_spell_2:GetChannelAnimation()
    return ACT_DOTA_DISABLED
end

function ability_npc_boss_forest_1_spell_2:OnSpellStart()
    self.mod = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_forest_1_spell_2", {duration = self:GetSpecialValueFor("duration")})
end

function ability_npc_boss_forest_1_spell_2:OnChannelFinish()
    self.mod:Destroy()
end

-------------------------------------------------------------------------------------------------------------------------------------

modifier_ability_npc_boss_forest_1_spell_2 = class({})

function modifier_ability_npc_boss_forest_1_spell_2:IsHidden()
    return true
end

function modifier_ability_npc_boss_forest_1_spell_2:IsPurgable()
    return false
end

function modifier_ability_npc_boss_forest_1_spell_2:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_forest_1_spell_2:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_forest_1_spell_2:OnCreated()
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self.pos = self:GetCaster():GetAbsOrigin()
    self:StartIntervalThink(0.4)
end

function modifier_ability_npc_boss_forest_1_spell_2:OnRefresh()
    self:OnCreated()
end

function modifier_ability_npc_boss_forest_1_spell_2:OnIntervalThink()
if not IsServer() then return end
    local smoke_point = self.pos + RandomVector(RandomInt(100, 500))
    local pfx = ParticleManager:CreateParticle("particles/econ/events/ti8/shivas_guard_ti8_active_smoke_b.vpcf", PATTACH_POINT, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 0, smoke_point)
    ParticleManager:ReleaseParticleIndex(pfx)
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, smoke_point, nil, 300, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage = self.damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
end