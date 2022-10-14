ability_npc_boss_gaveyard1_spell6 = class({})

function ability_npc_boss_gaveyard1_spell6:OnOwnerSpawned()
    self:GetCaster():SetUnitCanRespawn(true)
end

function ability_npc_boss_gaveyard1_spell6:OnOwnerDied()
    if self:IsCooldownReady() then
        local caster = self:GetCaster()
        self:StartCooldown(9999)
        Timers:CreateTimer(3,function()
            caster:RespawnUnit()
            caster:SetUnitCanRespawn(false)
        end)
    else
        MapLogic:ClearGaveyard1()
        MapLogic:TPHome()
    end
end