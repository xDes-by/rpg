function Spawn()
    if IsClient() or thisEntity:IsNull() then
        return
    end
    local abi = thisEntity:FindAbilityByName("ability_npc_hell1_druid_fissure")
    local fun = function()
        if not thisEntity:IsAlive() then
            return -1
        end
        if abi:IsFullyCastable() and RandomInt(1,3) == 3 then
            local hero = AICore:RandomEnemyHeroInRange( thisEntity, 600 )
            if hero ~= nil then
                AICore[DOTA_UNIT_ORDER_CAST_POSITION] (thisEntity, abi, hero:GetAbsOrigin())
            end
        end
        return 1
    end
    AICore:StartThink( thisEntity, fun )
end