ability_npc_boss_jungle1_spell1 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle1_spell1", "abilities/jungle1/ability_npc_boss_jungle1_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_jungle1_spell1_thinker", "abilities/jungle1/ability_npc_boss_jungle1_spell1", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle1_spell1:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_jungle1_spell1", {duration = 3.6})
end

modifier_ability_npc_boss_jungle1_spell1 = class({})

function modifier_ability_npc_boss_jungle1_spell1:IsHidden()
    return false
end

function modifier_ability_npc_boss_jungle1_spell1:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_jungle1_spell1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
        MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
    }
end

function modifier_ability_npc_boss_jungle1_spell1:GetOverrideAnimation()
    return ACT_DOTA_TAUNT_STATUE
end

function modifier_ability_npc_boss_jungle1_spell1:GetOverrideAnimationRate()
    return 1.0
end

function modifier_ability_npc_boss_jungle1_spell1:GetActivityTranslationModifiers()
    return "backstroke_gesture"
end

function modifier_ability_npc_boss_jungle1_spell1:OnCreated()
    self.startPos = self:GetParent():GetAbsOrigin()
    self.range = 0
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.1)
    self:OnIntervalThink()
end

function modifier_ability_npc_boss_jungle1_spell1:OnIntervalThink()
    self.endPos = self:GetParent():GetAbsOrigin()
    local curRange = (self.startPos - self.endPos):Length2D() + self.range
    print(curRange)
    print(self.range)
    if curRange > 250 then
        self.range = 0
        CreateModifierThinker(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_boss_jungle1_spell1_thinker", {duration = 1.6}, self.endPos, self:GetCaster():GetTeamNumber(), false)
    else
        self.range = curRange + self.range
    end
    self.startPos = self.endPos
end

modifier_ability_npc_boss_jungle1_spell1_thinker = class({})

function modifier_ability_npc_boss_jungle1_spell1_thinker:OnCreated()
    print("11111")
    local pfx = ParticleManager:CreateParticle("particles/econ/items/kunkka/divine_anchor/hero_kunkka_dafx_skills/kunkka_spell_torrent_bubbles_fxset.vpcf", PATTACH_POINT, self:GetParent())
    ParticleManager:ReleaseParticleIndex(pfx)
end

function modifier_ability_npc_boss_jungle1_spell1_thinker:OnDestroy()
    local pfx = ParticleManager:CreateParticle("particles/econ/items/kunkka/divine_anchor/hero_kunkka_dafx_skills/kunkka_spell_torrent_splash_fxset.vpcf", PATTACH_WORLDORIGIN, self:GetParent())
    ParticleManager:SetParticleControl(pfx, 0, self:GetParent():GetAbsOrigin())
    ParticleManager:ReleaseParticleIndex(pfx)
    if IsClient() then
        return
    end
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 225, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
    for _,unit in pairs(enemies) do
        if not unit:HasModifier("modifier_generic_arc_lua") then
            unit:AddNewModifier(self:GetCaster(),self,"modifier_generic_arc_lua", {
            height = 500, duration = 1.6, isStun = true, activity = ACT_DOTA_FLAIL})
            ApplyDamage({victim = unit,
            damage =  self:GetAbility():GetSpecialValueFor("damage"),
            damage_type = DAMAGE_TYPE_MAGICAL,
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            attacker = self:GetCaster(),
            ability = self:GetAbility()})
        end
    end
    UTIL_Remove(self:GetParent())
end



