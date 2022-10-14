_G.AICore = {
    [DOTA_UNIT_ORDER_CAST_POSITION] = function(hUnit, hAbility, vPosition)
        ExecuteOrderFromTable({
            UnitIndex = hUnit:entindex(),
            OrderType = DOTA_UNIT_ORDER_CAST_POSITION,
            AbilityIndex = hAbility:entindex(),
            Position = vPosition,
            Queue = false,
        })
    end,
    [DOTA_UNIT_ORDER_CAST_TARGET] = function(hUnit, hAbility, _, hTarget)
        ExecuteOrderFromTable({
            UnitIndex = hUnit:entindex(),
            OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
            TargetIndex = hTarget:entindex(),
            AbilityIndex = hAbility:entindex(),
            Queue = false,
        })
    end,
    [DOTA_UNIT_ORDER_CAST_NO_TARGET] = function(hUnit, hAbility)
        ExecuteOrderFromTable({
            UnitIndex = hUnit:entindex(),
            OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
            AbilityIndex = hAbility:entindex(),
            Queue = false,
        })
    end,
    [DOTA_UNIT_ORDER_CAST_TOGGLE] = function(hUnit, hAbility)
        ExecuteOrderFromTable({
            UnitIndex = hUnit:entindex(),
            OrderType = DOTA_UNIT_ORDER_CAST_TOGGLE,
            AbilityIndex = hAbility:entindex(),
            Queue = false,
        })
    end,
    [DOTA_UNIT_ORDER_CONTINUE] = function(hUnit)
        ExecuteOrderFromTable({
            UnitIndex = hUnit:entindex(),
            OrderType = DOTA_UNIT_ORDER_CONTINUE,
            Queue = true,
        })
    end,
}

function AICore:OrderAttackTarget(hUnit, hTarget)
    ExecuteOrderFromTable({
        UnitIndex = hUnit:entindex(),
        OrderType = DOTA_UNIT_ORDER_ATTACK_TARGET,
        TargetIndex = hTarget:entindex(),
        Queue = false,
    })
end

function AICore:OrderAttackMove(hUnit, vPosition)
    ExecuteOrderFromTable({
        UnitIndex = hUnit:entindex(),
        OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
        Position = vPosition,
        Queue = false,
    })
end

function AICore:RandomEnemyHeroInRange( entity, range )
	local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, entity:GetAbsOrigin(), nil, range, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0, false )
	if #enemies > 0 then
		local index = RandomInt( 1, #enemies )
		return enemies[index]
	else
		return nil
	end
end

function AICore:IsLastAlivePlayer( entity, range )
	local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, entity:GetAbsOrigin(), nil, range, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0, false )
	if #enemies == 1 then
        return true
	else
		return false
	end
end

function AICore:IsHeroesNearby( entity, range )
	local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, entity:GetAbsOrigin(), nil, range, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0, false )
	if #enemies ~= 0 then
        return true, table.random(enemies)
	else
		return false
	end
end

function AICore:FindAllHeroes( entity, range )
	local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, entity:GetAbsOrigin(), nil, range, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0, false )
	if #enemies >= 1 then
        return enemies
	else
		return nil
	end
end

function AICore:WeakestEnemyHeroInRange( entity, range )
	local enemies = FindUnitsInRadius( DOTA_TEAM_BADGUYS, entity:GetAbsOrigin(), nil, range, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0, false )
    
	local minHP = nil
	local target = nil
    if enemies ~= nil then
        for _,enemy in pairs(enemies) do
            local distanceToEnemy = (entity:GetAbsOrigin() - enemy:GetAbsOrigin()):Length()
            local HP = enemy:GetHealth()
            if enemy:IsAlive() and (minHP == nil or HP < minHP) and distanceToEnemy < range then
                minHP = HP
                target = enemy
            end
        end
	    return target
    else
        return nil
    end
end

function AICore:StartThink( entity, func)
    entity:SetContextThink( "NeutralThink", func, 1 )
end






--function Spawn()
--    if IsClient() or thisEntity:IsNull() then
--        return
--    end
--    local AllAbilities = {}
--    table.insert( AllAbilities[thisEntity:FindAbilityByName("ability_npc_boss_hell3_spell5")], DOTA_ABILITY_BEHAVIOR_POINT )




--    local fun = function()
--        if not thisEntity:IsAlive() then
--            return -1
--        end
--        local temp = {}
--        for abi,behabior in pairs(AllAbilities) do
--            if abi:IsFullyCastable() then
--                table.insert( temp[abi], behabior )
--            end
--        end
--        local abi,beh  = table.random(temp)
--        if beh == DOTA_ABILITY_BEHAVIOR_POINT and abi:GetAbilityName() == "ability_npc_boss_hell3_spell5" then
--            point = thisEntity:GetOrigin() + RandomVector(RandomInt(100, 500))

--            unit = AICore:RandomEnemyHeroInRange( thisEntity, 500 )
--            point = unit:GetOrigin()

--            AICore[DOTA_UNIT_ORDER_CAST_POSITION] (thisEntity, abi, point)
--            return 1
--        end

--        if beh == DOTA_ABILITY_BEHAVIOR_UNIT_TARGET then
--            if AICore:IsLastAlivePlayer( thisEntity, 1000 ) then
--            else
--                AICore[DOTA_UNIT_ORDER_CAST_TARGET] (thisEntity, abi, _, target)
--            end
--        end
--    end


--    AICore:StartThink( thisEntity, fun )
--end


--AICore[DOTA_UNIT_ORDER_CAST_TARGET] (thisEntity, abi, _, target)
--AICore[DOTA_UNIT_ORDER_CAST_NO_TARGET] (thisEntity, abi)
--AICore[DOTA_UNIT_ORDER_CAST_TOGGLE] (thisEntity, abi)
--AICore[DOTA_UNIT_ORDER_CAST_POSITION] (thisEntity, abi, point)