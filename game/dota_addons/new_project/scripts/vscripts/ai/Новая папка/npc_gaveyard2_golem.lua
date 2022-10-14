function Spawn()
    if IsClient() or thisEntity:IsNull() then 
        return
    end
    local abi = thisEntity:FindAbilityByName("ability_npc_gaveyard2_golem_root")
    local fun = function()
        if ( not thisEntity:IsAlive() ) then
            return -1 
        end
        local boolean, RandomHero = AICore:IsHeroesNearby( thisEntity, 300 )
        if boolean then
            if abi:GetToggleState() then
                --AICore:OrderAttackTarget(thisEntity, RandomHero)
            else
                abi:ToggleAbility()
                --AICore:OrderAttackTarget(thisEntity, RandomHero)
            end
        else
            if abi:GetToggleState() then
                abi:ToggleAbility()
            end
        end
        return 1
    end
    AICore:StartThink( thisEntity, fun )
end