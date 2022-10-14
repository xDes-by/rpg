npc_dota_hero_nevermore_spell3 = class({})

function npc_dota_hero_nevermore_spell3:OnSpellStart()
    local mod = self:GetCaster():FindModifierByName("modifier_npc_dota_hero_nevermore_spell4")
    if mod:GetStackCount() > 0 then
        mod:DecrementStackCount()
        self.outgoing = mod:GetStackCount() * 2
        self.incoming = self:GetSpecialValueFor("incoming")
        self.duration = self:GetSpecialValueFor("duration")
        CreateIllusions(self:GetCaster(),self:GetCaster(),
        {outgoing_damage = self.outgoing, incoming_damage = self.incoming, duration = self.duration,},
        1,100,true,true)
    end
end