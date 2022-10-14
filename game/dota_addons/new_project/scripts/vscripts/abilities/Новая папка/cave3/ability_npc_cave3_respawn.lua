ability_npc_cave3_respawn = class({})

function ability_npc_cave3_respawn:OnOwnerDied()
    local unit = self:GetCaster()
    if not MapLogic.Cave3ZoneEnd then
        Timers:CreateTimer(3,function()
            unit:RespawnUnit()
        end)
    end
end