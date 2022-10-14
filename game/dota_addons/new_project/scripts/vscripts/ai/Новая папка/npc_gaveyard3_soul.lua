function Spawn()
    if IsClient() or thisEntity:IsNull() then
        return
    end
    local fun = function()
        if thisEntity.CanMove then
            if (MapLogic.Gaveyard3Boss:GetOrigin() - thisEntity:GetOrigin()):Length2D() < 200 then
                MapLogic.Gaveyard3Boss:RemoveModifierByName("modifier_ability_npc_boss_gaveyard3_sleep")
                MapLogic.Gaveyard3Boss:SetHealth(MapLogic.Gaveyard3Boss:GetMaxHealth() * 0.7)
                UTIL_Remove(thisEntity)
            else
                thisEntity:MoveToNPC(MapLogic.Gaveyard3Boss)
                return 1
            end
        end
        return 1
    end
    AICore:StartThink( thisEntity, fun )
end
