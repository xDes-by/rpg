function Spawn()
    if IsClient() or thisEntity:IsNull() then
        return
    end
    local abi = thisEntity:FindAbilityByName("ability_npc_desert2_king_spell1")
    local abi1 = thisEntity:FindAbilityByName("ability_npc_desert2_king_spell2")
    local fun = function()
        if not thisEntity:IsAlive() then
            return
        end
        if abi:IsFullyCastable() then
            local unit = AICore:WeakestEnemyHeroInRange( thisEntity, 500 )
            if unit then
                local point = unit:GetOrigin()
                AICore[DOTA_UNIT_ORDER_CAST_POSITION] (thisEntity, abi, point)
            end
        end
        if abi1:IsFullyCastable() then
            AICore[DOTA_UNIT_ORDER_CAST_NO_TARGET] (thisEntity, abi1)
        end
        return 1
    end
    AICore:StartThink( thisEntity, fun )
end