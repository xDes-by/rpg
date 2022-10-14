ablility_npc_desert2_boss_spell1 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert2_boss_spell1","abilities/desert2/ablility_npc_desert2_boss_spell1", LUA_MODIFIER_MOTION_NONE )

function ablility_npc_desert2_boss_spell1:GetIntrinsicModifierName()
    return "modifier_ablility_npc_desert2_boss_spell1"
end

modifier_ablility_npc_desert2_boss_spell1 = class({})

--Classifications template
function modifier_ablility_npc_desert2_boss_spell1:IsHidden()
    return true
end

function modifier_ablility_npc_desert2_boss_spell1:IsPurgable()
    return false
end

function modifier_ablility_npc_desert2_boss_spell1:OnCreated()
    self.toss = true
end

function modifier_ablility_npc_desert2_boss_spell1:OnIntervalThink()
    self.toss = true
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self:StartIntervalThink(-1)
end

function modifier_ablility_npc_desert2_boss_spell1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_ablility_npc_desert2_boss_spell1:GetModifierProcAttack_Feedback(data)
    if self.toss then
        self.toss = false
        self:StartIntervalThink(2)
        local dis = self:GetCaster():GetForwardVector() * 400
        local point = self:GetCaster():GetAbsOrigin() - dis
        data.target:AddNewModifier(self:GetCaster(),self:GetAbility(),"modifier_generic_arc_lua", {
        target_x = point.x, target_y = point.y, duration = 0.5, distance = 400, height = 150,
        speed = 800, fix_duration = false, isStun = true, activity = ACT_DOTA_FLAIL})
        ApplyDamage({victim = data.target,
        damage = self.damage,
        damage_type = DAMAGE_TYPE_PHYSICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
end
    