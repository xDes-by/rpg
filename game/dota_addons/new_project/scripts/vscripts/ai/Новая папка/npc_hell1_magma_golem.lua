function Spawn()
    if IsClient() or thisEntity:IsNull() then
        return
    end
    local abi = thisEntity:FindAbilityByName("ability_npc_hell1_magma_golem")
    local fun = function()
        if not thisEntity:IsAlive() then
            return
        end
        if abi:IsFullyCastable() and RandomInt(1,3) == 3 then
            local target = AICore:WeakestEnemyHeroInRange( thisEntity, 600 )
            if target ~= nil then
                AICore[DOTA_UNIT_ORDER_CAST_TARGET] (thisEntity, abi, _, target)
            end
        end
        return 1
    end
    AICore:StartThink( thisEntity, fun )
end
