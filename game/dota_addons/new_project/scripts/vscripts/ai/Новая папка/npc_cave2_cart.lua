function Spawn()
    if IsClient() or thisEntity:IsNull() then 
        return
    end
    thisEntity.CurrentPoint = 1
    local fun = function()
        if ( not thisEntity:IsAlive() ) then
            return -1 
        end
        local mypos = thisEntity:GetAbsOrigin()
        local enemies = FindUnitsInRadius( DOTA_TEAM_GOODGUYS, mypos, nil, 200, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, 0, 0, false )
        if #enemies > 0 then
            if (mypos - MapLogic.Cave2MovePoints[thisEntity.CurrentPoint]):Length2D() <= 100 then
                thisEntity.CurrentPoint = thisEntity.CurrentPoint + 1
                if thisEntity.CurrentPoint > 42  then
                    MapLogic:Cave2End()
                    return
                end
            end
            if thisEntity.CurrentPoint ~= 40 or (MapLogic.BossCave2 == nil or not MapLogic.BossCave2:IsAlive()) then
                MapLogic:Cave2SpawnEnemies(thisEntity.CurrentPoint + 2)
                thisEntity:MoveToPosition(MapLogic.Cave2MovePoints[thisEntity.CurrentPoint])
            end
        else
            thisEntity:Stop()
        end
        return 0.5
    end
    AICore:StartThink( thisEntity, fun )
end
