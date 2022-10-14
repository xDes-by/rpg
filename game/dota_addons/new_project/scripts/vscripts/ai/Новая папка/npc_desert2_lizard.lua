function Spawn()
    if IsClient() or thisEntity:IsNull() then
        return
    end
    local abi = thisEntity:FindAbilityByName("ability_npc_desert2_lizard_spell1")
    local abi1 = thisEntity:FindAbilityByName("ability_npc_desert2_lizard_spell2")
    local fun = function()
        if not thisEntity:IsAlive() then
            return -1
        end
        if abi:IsFullyCastable() then 
            local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, thisEntity:GetAbsOrigin(), nil, 500, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
            for _,unit in pairs(enemies) do
                if unit:GetUnitName() == "npc_desert2_siege" then
                    AICore[DOTA_UNIT_ORDER_CAST_TARGET] (thisEntity, abi, _, unit)
                    return 1
                end
            end
            if #enemies > 0 then
                AICore[DOTA_UNIT_ORDER_CAST_TARGET] (thisEntity, abi, _, table.random(enemies))
            end
        end
        return 1
    end
    AICore:StartThink( thisEntity, fun )
end