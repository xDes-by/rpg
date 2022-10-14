npc_dota_hero_queenofpain_spell4 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_queenofpain_spell4","heroes/npc_dota_hero_queenofpain/npc_dota_hero_queenofpain_spell4", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_queenofpain_spell4:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_queenofpain_spell4"
end

modifier_npc_dota_hero_queenofpain_spell4 = class({})

--Classifications template
function modifier_npc_dota_hero_queenofpain_spell4:IsHidden()
   return true
end

function modifier_npc_dota_hero_queenofpain_spell4:IsPurgable()
   return false
end

function modifier_npc_dota_hero_queenofpain_spell4:OnCreated()
    self.ability = self:GetCaster():FindAbilityByName("npc_dota_hero_queenofpain_spell2")
end

function modifier_npc_dota_hero_queenofpain_spell4:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_ABILITY_FULLY_CAST
}
end

function modifier_npc_dota_hero_queenofpain_spell4:OnAbilityFullyCast(data)
    if data.unit == self:GetParent() and self.ability ~= data.ability then
        if not self.ability:IsCooldownReady() then
            local remaining = self.ability:GetCooldownTimeRemaining()
            print(remaining)
            if remaining <= 1 then
                self.ability:EndCooldown()
            else
                self.ability:EndCooldown()
                self.ability:StartCooldown(remaining - 1)
            end
        end
    end
end

