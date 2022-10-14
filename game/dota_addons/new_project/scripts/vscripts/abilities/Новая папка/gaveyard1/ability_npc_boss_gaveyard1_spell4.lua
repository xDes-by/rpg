ability_npc_boss_gaveyard1_spell4 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_gaveyard1_spell4","abilities/gaveyard1/ability_npc_boss_gaveyard1_spell4", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_gaveyard1_spell4:OnSpellStart()
    local direction = self:GetCursorPosition() - self:GetCaster():GetAbsOrigin()
    local dis = direction:Length2D()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_simply_motion_controll", {
    x = direction.x, y = direction.y, r = dis, s = dis*2})
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_gaveyard1_spell4", {duration = 0.5})
    self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_pangolier/pangolier_gyroshell.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster())

    EmitSoundOn("Hero_Undying.FleshGolem.Cast", self:GetCaster())
end

modifier_ability_npc_boss_gaveyard1_spell4 = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard1_spell4:IsHidden()
    return false
end

function modifier_ability_npc_boss_gaveyard1_spell4:IsDebuff()
    return false
end

function modifier_ability_npc_boss_gaveyard1_spell4:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard1_spell4:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell4:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_gaveyard1_spell4:OnCreated()
    self.table = {victim = self:GetParent(),
    damage = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * 6,
    damage_type = DAMAGE_TYPE_PHYSICAL,
    damage_flags = DOTA_DAMAGE_FLAG_NONE,
    attacker = self:GetCaster(),
    ability = self}

    self:StartIntervalThink(0.03)
end

function modifier_ability_npc_boss_gaveyard1_spell4:OnDestroy()
    if IsClient() then
        return
    end
    FindClearSpaceForUnit(self:GetParent(), self:GetParent():GetAbsOrigin(), false)
    for _,unit in pairs(self.enemies) do
        self.table.victim = unit
        ApplyDamage(self.table)
        FindClearSpaceForUnit(unit, unit:GetAbsOrigin(), false)
    end   
    ParticleManager:DestroyParticle(self:GetAbility().pfx,false)
end

function modifier_ability_npc_boss_gaveyard1_spell4:OnIntervalThink()
    local point = self:GetCaster():GetAbsOrigin() + self:GetCaster():GetForwardVector() * 50
	self.enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetCaster():GetAbsOrigin(), nil, 100, DOTA_UNIT_TARGET_TEAM_ENEMY,DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(self.enemies) do
        unit:SetAbsOrigin(point)
    end
end
