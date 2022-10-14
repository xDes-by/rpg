ablility_npc_desert3_boss1_spell3 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert3_boss1_spell3","abilities/desert3/ablility_npc_desert3_boss1_spell3", LUA_MODIFIER_MOTION_NONE )

function ablility_npc_desert3_boss1_spell3:Precache(context)
    PrecacheResource( "particle", "particles/econ/items/elder_titan/elder_titan_ti7/elder_titan_echo_stomp_ti7_physical.vpcf", context )
    PrecacheResource( "particle", "particles/econ/items/elder_titan/elder_titan_ti7/elder_titan_echo_stomp_cast_combined_detail_ti7.vpcf", context )
end

function ablility_npc_desert3_boss1_spell3:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ablility_npc_desert3_boss1_spell3", {duration = self:GetSpecialValueFor("duration")})
    local pfx = ParticleManager:CreateParticle("particles/econ/items/elder_titan/elder_titan_ti7/elder_titan_echo_stomp_cast_combined_detail_ti7.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    ParticleManager:ReleaseParticleIndex(pfx)
end

modifier_ablility_npc_desert3_boss1_spell3 = class({})
--Classifications template
function modifier_ablility_npc_desert3_boss1_spell3:IsHidden()
    return false
end

function modifier_ablility_npc_desert3_boss1_spell3:IsDebuff()
    return false
end

function modifier_ablility_npc_desert3_boss1_spell3:IsPurgable()
    return false
end

function modifier_ablility_npc_desert3_boss1_spell3:RemoveOnDeath()
    return true
end

function modifier_ablility_npc_desert3_boss1_spell3:DestroyOnExpire()
    return true
end

function modifier_ablility_npc_desert3_boss1_spell3:OnCreated()
    if IsClient() then
        return
    end
    self:StartIntervalThink(1.5)
end

function modifier_ablility_npc_desert3_boss1_spell3:OnIntervalThink()
    if self:GetElapsedTime() < 4 then
        local pfx = ParticleManager:CreateParticle("particles/econ/items/elder_titan/elder_titan_ti7/elder_titan_echo_stomp_cast_combined_detail_ti7.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
        ParticleManager:ReleaseParticleIndex(pfx)
    end
    local pfx = ParticleManager:CreateParticle("particles/econ/items/elder_titan/elder_titan_ti7/elder_titan_echo_stomp_ti7_physical.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    ParticleManager:SetParticleControl(pfx, 1, Vector(500, 0, 0))
    ParticleManager:ReleaseParticleIndex(pfx)
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 500, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage =  self:GetAbility():GetSpecialValueFor("damage"),
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
end