ability_npc_boss_cave3_spell1 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_cave3_spell1","abilities/cave3/ability_npc_boss_cave3_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_cave3_spell1_debuff","abilities/cave3/ability_npc_boss_cave3_spell1", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_cave3_spell1:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_cave3_spell1"
end

modifier_ability_npc_boss_cave3_spell1 = class({})

--Classifications template
function modifier_ability_npc_boss_cave3_spell1:IsHidden()
    return true
end

function modifier_ability_npc_boss_cave3_spell1:IsPurgable()
    return false
end

function modifier_ability_npc_boss_cave3_spell1:RemoveOnDeath()
    return false
end

function modifier_ability_npc_boss_cave3_spell1:OnCreated()
    self.count = 0
    self.count = self:GetAbility():GetSpecialValueFor("")
end

function modifier_ability_npc_boss_cave3_spell1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_ability_npc_boss_cave3_spell1:GetModifierProcAttack_Feedback(data)
    self.count = self.count + 1
    if self.count == 5 then
        self.count = 0
        data.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_boss_cave3_spell1_debuff", {duration = 2})
    end
end

modifier_ability_npc_boss_cave3_spell1_debuff = class({})
--Classifications template
function modifier_ability_npc_boss_cave3_spell1_debuff:IsHidden()
    return false
end

function modifier_ability_npc_boss_cave3_spell1_debuff:IsDebuff()
    return true
end

function modifier_ability_npc_boss_cave3_spell1_debuff:IsPurgable()
    return false
end

function modifier_ability_npc_boss_cave3_spell1_debuff:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_cave3_spell1_debuff:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_cave3_spell1_debuff:OnCreated()
    local pfx = ParticleManager:CreateParticle("particles/items_fx/item_sheepstick.vpcf", PATTACH_POINT, self:GetParent())
    ParticleManager:ReleaseParticleIndex(pfx)
end

function modifier_ability_npc_boss_cave3_spell1_debuff:OnDestroy()
    if IsClient() then
        return
    end
    local pfx = ParticleManager:CreateParticle("particles/npc_boss_cave3_spell1.vpcf", PATTACH_POINT, self:GetParent())
    ParticleManager:SetParticleControl(pfx, 0, self:GetParent():GetAbsOrigin())
    ParticleManager:SetParticleControl(pfx, 1, self:GetParent():GetAbsOrigin())
    ParticleManager:SetParticleControl(pfx, 2, Vector(300, 300, 300))
    ParticleManager:ReleaseParticleIndex(pfx)
    local damage = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * self:GetAbility():GetSpecialValueFor("damagemnoj") / 100
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 300, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage =  damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
end
