npc_dota_hero_skeleton_king_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_skeleton_king_spell1", "heroes/npc_dota_hero_skeleton_king/npc_dota_hero_skeleton_king_spell1", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_skeleton_king_spell1:GetIntrinsicModifierName()
    return  "modifier_npc_dota_hero_skeleton_king_spell1"
end

modifier_npc_dota_hero_skeleton_king_spell1 = class({})

function modifier_npc_dota_hero_skeleton_king_spell1:IsHidden()
    return true
end

function modifier_npc_dota_hero_skeleton_king_spell1:IsPurgable()
    return false
end

function modifier_npc_dota_hero_skeleton_king_spell1:RemoveOnDeath()
    return false
end

function modifier_npc_dota_hero_skeleton_king_spell1:OnCreated()
    self.chance = self:GetAbility():GetSpecialValueFor("chance")
end

function modifier_npc_dota_hero_skeleton_king_spell1:DeclareFunctions()
    return {
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
    }
end

function modifier_npc_dota_hero_skeleton_king_spell1:GetModifierProcAttack_Feedback(data)
    if RollPseudoRandom(self.chance,self:GetParent()) then 
        EmitSoundOn("DOTA_Item.SkullBasher",self:GetParent())
        data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_stunned", {duration = 1})
        self:GetAbility():UseResources(false,false,true)
    end
end
