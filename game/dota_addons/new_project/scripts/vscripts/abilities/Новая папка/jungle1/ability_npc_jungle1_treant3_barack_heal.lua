ability_npc_jungle1_treant3_barack_heal = class({})

LinkLuaModifier( "modifier_ability_npc_jungle1_treant3_barack_heal", "abilities/jungle1/ability_npc_jungle1_treant3_barack_heal", LUA_MODIFIER_MOTION_NONE )

function ability_npc_jungle1_treant3_barack_heal:GetChannelTime()
	return 15
end

function ability_npc_jungle1_treant3_barack_heal:OnSpellStart()
    if IsClient() then
        return
    end
    self.target = self:GetCursorTarget()
    self.target:AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_jungle1_treant3_barack_heal", {})
end

function ability_npc_jungle1_treant3_barack_heal:OnChannelFinish( bInterrupted )
    if IsClient() then
        return
    end
    if not bInterrupted then
        self.target:RemoveModifierByName("modifier_ability_npc_jungle1_treant3_barack_heal")
    end
end

modifier_ability_npc_jungle1_treant3_barack_heal = class({})
--Classifications template
function modifier_ability_npc_jungle1_treant3_barack_heal:IsHidden()
   return false
end

function modifier_ability_npc_jungle1_treant3_barack_heal:IsDebuff()
   return false
end

function modifier_ability_npc_jungle1_treant3_barack_heal:IsPurgable()
   return false
end

function modifier_ability_npc_jungle1_treant3_barack_heal:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
}
end

function modifier_ability_npc_jungle1_treant3_barack_heal:GetModifierConstantHealthRegen()
    return 10
end
