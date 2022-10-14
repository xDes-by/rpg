function Spawn()
    if IsClient() or thisEntity:IsNull() then 
        return
    end
    local fun = function()
        if (thisEntity:GetAbsOrigin() - MapLogic.FontainPoint):Length2D() <= 250 then
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