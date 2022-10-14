function Spawn()
    if IsClient() or thisEntity:IsNull() then 
        return
    end
    local abi = thisEntity:FindAbilityByName("ability_npc_forest1_wave2_bone")
    local fun = function()
        if ( not thisEntity:IsAlive() ) then
            return -1 
        end
        if (thisEntity:GetAbsOrigin() - MapLogic.FontainPoint):Length2D() <= 250 then
            if abi:IsFullyCastable() then
                local hTarget = AICore:WeakestEnemyHeroInRange(thisEntity, 400)
                if hTarget ~= nil then
                    AICore[DOTA_UNIT_ORDER_CAST_TARGET] (thisEntity, abi, vPosition, hTarget)
                    return 1
                end
            end
            local hero = AICore:RandomEnemyHeroInRange( thisEntity, 400 )
            if hero then
                AICore:OrderAttackTarget(thisEntity, hero)
                return 1
            end
        end
            AICore:OrderAttackMove(thisEntity, MapLogic.FontainPoint)
        return 1
    end
    AICore:StartThink( thisEntity, fun )
end