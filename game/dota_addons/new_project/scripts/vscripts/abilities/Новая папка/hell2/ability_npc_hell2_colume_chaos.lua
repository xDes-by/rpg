ability_npc_hell2_colume_chaos = class({})

LinkLuaModifier( "modifier_ability_npc_hell2_colume_chaos","abilities/hell2/ability_npc_hell2_colume_chaos", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell2_colume_chaos:GetIntrinsicModifierName()
    return "modifier_ability_npc_hell2_colume_chaos"
end

modifier_ability_npc_hell2_colume_chaos = class({})

--Classifications template
function modifier_ability_npc_hell2_colume_chaos:IsHidden()
    return true
end

function modifier_ability_npc_hell2_colume_chaos:IsPurgable()
    return false
end

function modifier_ability_npc_hell2_colume_chaos:OnCreated()
    self.ColumeAbilities = {
        "ability_npc_hell2_colume_shtorm",
        "ability_npc_hell2_colume_fire_sun",
        "ability_npc_hell2_colume_fire_meatball",
        "ability_npc_hell2_colume_cold",
        "ability_npc_hell2_colume_earth",
        "ability_npc_hell2_colume_soul"
    }
    if IsClient() then
        return
    end
    self:StartIntervalThink(3)
end

function modifier_ability_npc_hell2_colume_chaos:OnIntervalThink()
    self:GetCaster():AddAbility(table.random(self.ColumeAbilities)):Spawn()
end