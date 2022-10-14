ability_npc_boss_jungle2_spell3 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle2_spell3","abilities/jungle2/ability_npc_boss_jungle2_spell3", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle2_spell3:Precache(context)
    PrecacheResource( "particle", "particles/econ/items/faceless_void/faceless_void_weapon_bfury/faceless_void_weapon_bfury_cleave.vpcf", context )
end

function ability_npc_boss_jungle2_spell3:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_jungle2_spell3"
end

modifier_ability_npc_boss_jungle2_spell3 = class({})

--Classifications template
function modifier_ability_npc_boss_jungle2_spell3:IsHidden()
    return true
end

function modifier_ability_npc_boss_jungle2_spell3:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle2_spell3:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_ability_npc_boss_jungle2_spell3:OnCreated()
    self.mult = self:GetAbility():GetSpecialValueFor("splash") * 0.01
end

function modifier_ability_npc_boss_jungle2_spell3:OnRefresh()
    self:OnCreated()
end


function modifier_ability_npc_boss_jungle2_spell3:GetModifierProcAttack_Feedback(data)
    DoCleaveAttack(
        self:GetParent(),
        data.target,
        self:GetAbility(),
        self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster())*self.mult,
        150,
        360,
        360,
        'particles/econ/items/faceless_void/faceless_void_weapon_bfury/faceless_void_weapon_bfury_cleave.vpcf'
    )
end