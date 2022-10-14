function Spawn()
    if IsClient() or thisEntity:IsNull() then 
        return
    end
    local AllAbilities = {}
    AllAbilities[thisEntity:FindAbilityByName("ability_npc_boss_gaveyard1_spell1")] = DOTA_ABILITY_BEHAVIOR_UNIT_TARGET --дикей
    AllAbilities[thisEntity:FindAbilityByName("ability_npc_boss_gaveyard1_spell2")] = DOTA_ABILITY_BEHAVIOR_POINT --томба
    AllAbilities[thisEntity:FindAbilityByName("ability_npc_boss_gaveyard1_spell4")] = DOTA_ABILITY_BEHAVIOR_POINT --скивер
    AllAbilities[thisEntity:FindAbilityByName("ability_npc_boss_gaveyard1_spell5")] = DOTA_ABILITY_BEHAVIOR_NO_TARGET --скивер
    local fun = function()
        if thisEntity:HasModifier("modifier_boss_invelurable") then
            return 1
        end
        if not thisEntity:IsAlive() then
            return -1 
        end
        if thisEntity:IsChanneling() or GameRules:IsGamePaused() then
            return 0.1
        end
        local beh,abi  = table.random(AllAbilities)
        if abi:IsCooldownReady() then
            if beh == DOTA_ABILITY_BEHAVIOR_UNIT_TARGET then
                local target = AICore:RandomEnemyHeroInRange( thisEntity, 500 )
                if target then
                    AICore[DOTA_UNIT_ORDER_CAST_TARGET] (thisEntity, abi, _, target)
                end
                return 1
            end
            if beh == DOTA_ABILITY_BEHAVIOR_UNIT_TARGET then
                local target = AICore:RandomEnemyHeroInRange( thisEntity, 500 )
                if target then
                    AICore[DOTA_UNIT_ORDER_CAST_TARGET] (thisEntity, abi, _, target)
                end
                return 1
            end
            local name = abi:GetAbilityName()
            if name == "ability_npc_boss_gaveyard1_spell2" then
                local point = thisEntity:GetForwardVector() * 300 * -1 + thisEntity:GetOrigin()
                AICore[DOTA_UNIT_ORDER_CAST_POSITION] (thisEntity, abi, point)
                return 1
            end
            if name == "ability_npc_boss_gaveyard1_spell4" then
                local unit = AICore:WeakestEnemyHeroInRange( thisEntity, 500 )
                if unit then
                    point = unit:GetOrigin()
                    AICore[DOTA_UNIT_ORDER_CAST_POSITION] (thisEntity, abi, point)
                end
                return 1
            end
        end
        return 3
    end
    AICore:StartThink( thisEntity, fun )
end