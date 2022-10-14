function Spawn()
    if IsClient() or thisEntity:IsNull() then 
        return
    end
    thisEntity.gold_parts = 0
    local abi = thisEntity:FindAbilityByName("ability_npc_cave1_miner_start_dig")
    local fun = function()
        if ( not thisEntity:IsAlive() ) then
            return -1 
        end
        if thisEntity:IsCommandRestricted() then
            return 1
        end
        if thisEntity.gold_parts == 5 then 
            MapLogic:Cave1StopCreepSpawning()
            thisEntity:Kill(nil,nil)
            return
        end
        local point = thisEntity:GetAbsOrigin() + RandomVector(RandomInt(200,500))
        AICore[DOTA_UNIT_ORDER_CAST_POSITION] (thisEntity, abi, point)
        thisEntity.gold_parts = thisEntity.gold_parts + 1
        return 10
    end
    AICore:StartThink( thisEntity, fun )
end