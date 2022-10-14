function Spawn()
    if IsClient() or thisEntity:IsNull() then 
        return
    end
    local abi = thisEntity:FindAbilityByName("ability_npc_gaveyard2_familiar_sitdown")
    local fun = function()
        if thisEntity:IsAlive() then
            local boolean, RandomHero = AICore:IsHeroesNearby( thisEntity, 300 )
            if boolean and thisEntity:GetHealthPercent() < 30 and abi:IsFullyCastable() then
                AICore[DOTA_UNIT_ORDER_CAST_NO_TARGET] (thisEntity, abi)
            else
                --AICore:OrderAttackTarget(thisEntity, RandomHero)
            end
            return 1
        end
    end
    AICore:StartThink( thisEntity, fun )
end