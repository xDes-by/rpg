ability_npc_boss_gaveyard3_spell1 = class({})

LinkLuaModifier("modifier_ability_npc_boss_gaveyard3_spell1", "abilities/gaveyard3/ability_npc_boss_gaveyard3_spell1", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ability_npc_boss_gaveyard3_spell1_illusion", "abilities/gaveyard3/ability_npc_boss_gaveyard3_spell1", LUA_MODIFIER_MOTION_NONE)

function ability_npc_boss_gaveyard3_spell1:OnSpellStart()
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetCursorPosition(), nil, 400, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0,false)
    for _,unit in pairs(enemies) do
        unit:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_gaveyard3_spell1", {duration = self:GetSpecialValueFor("duration")})
    end
end

modifier_ability_npc_boss_gaveyard3_spell1 = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard3_spell1:IsHidden()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell1:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard3_spell1:OnCreated()
    local illusions = CreateIllusions(self:GetCaster(), self:GetParent(),
    {outgoing_damage = 100, duration = self:GetDuration()},
    1, 50, false, true)
    illusions[1]:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_gaveyard3_spell1_illusion", {duration = 5, target = self:GetParent():entindex()})
end

function modifier_ability_npc_boss_gaveyard3_spell1:GetEffectName()
	return "particles/units/heroes/hero_terrorblade/terrorblade_reflection_slow.vpcf"
end

function modifier_ability_npc_boss_gaveyard3_spell1:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

modifier_ability_npc_boss_gaveyard3_spell1_illusion = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard3_spell1_illusion:IsHidden()
    return true
end

function modifier_ability_npc_boss_gaveyard3_spell1_illusion:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard3_spell1_illusion:OnCreated(kv)
    self.target = EntIndexToHScript(kv.target)
    self:StartIntervalThink(0.5)
end
function modifier_ability_npc_boss_gaveyard3_spell1_illusion:OnRefresh()
    self:OnCreated()
end

function modifier_ability_npc_boss_gaveyard3_spell1_illusion:IsPurgable()
    self:GetParent():MoveToTargetToAttack(self.target)
end

function modifier_ability_npc_boss_gaveyard3_spell1_illusion:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE,
	}
end

function modifier_ability_npc_boss_gaveyard3_spell1_illusion:GetModifierMoveSpeed_Absolute()
	return 550
end

function modifier_ability_npc_boss_gaveyard3_spell1_illusion:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_OUT_OF_GAME] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
	}
end

function modifier_ability_npc_boss_gaveyard3_spell1_illusion:GetStatusEffectName()
	return "particles/status_fx/status_effect_terrorblade_reflection.vpcf"
end