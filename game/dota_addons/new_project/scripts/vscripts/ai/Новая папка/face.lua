function Spawn()
    if IsClient() or thisEntity:IsNull() then
        return
    end
    local fun = function()
        if not thisEntity:IsAlive() then
            return
        end
        local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, thisEntity:GetAbsOrigin(), nil, 400, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
        if #enemies > 0 then
            thisEntity:FaceTowards(enemies[1]:GetOrigin())
        end
        return 0.03
    end
    thisEntity:SetContextThink( "NeutralThink", fun, 0.03 )
end