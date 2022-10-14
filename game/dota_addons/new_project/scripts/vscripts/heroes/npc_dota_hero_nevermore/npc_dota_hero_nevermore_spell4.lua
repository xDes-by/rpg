npc_dota_hero_nevermore_spell4 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_nevermore_spell4","heroes/npc_dota_hero_nevermore/npc_dota_hero_nevermore_spell4", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_nevermore_spell4:OnOwnerSpawned()
    self:SetLevel(1)
end

function npc_dota_hero_nevermore_spell4:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_nevermore_spell4"
end

modifier_npc_dota_hero_nevermore_spell4 = class({})

--Classifications template
function modifier_npc_dota_hero_nevermore_spell4:IsHidden()
    return false
end

function modifier_npc_dota_hero_nevermore_spell4:IsDebuff()
    return false
end

function modifier_npc_dota_hero_nevermore_spell4:IsPurgable()
    return false
end

function modifier_npc_dota_hero_nevermore_spell4:OnCreated()
    self:SetStackCount(20)
    self.maxstacks = self:GetAbility():GetSpecialValueFor("max_souls")
    self.chance = self:GetAbility():GetSpecialValueFor("chance")
    if IsClient() then
        return
    end
    self:GetParent():FindModifierByName("modifier_npc_dota_hero_nevermore_spell1"):FindMod()
end

function modifier_npc_dota_hero_nevermore_spell4:DeclareFunctions()
    return {
       MODIFIER_EVENT_ON_DEATH 
    }
end

function modifier_npc_dota_hero_nevermore_spell4:OnDeath(data)
    if data.attacker == self:GetParent() and data.unit.HasSoul == nil then
        if self:GetStackCount() < self.maxstacks and RollPseudoRandom(self.chance,self:GetCaster()) then
            self:IncrementStackCount()
        end
    end
end
