item_forest3_quelling_blade = class({})

function item_forest3_quelling_blade:GetCastRange()
    return 150
end

function item_forest3_quelling_blade:OnSpellStart()
    if self:GetCursorTarget().IsTreeInfect then
        MapLogic.Forest3TreesDestroyed = MapLogic.Forest3TreesDestroyed + 1
        if MapLogic.Forest3TreesDestroyed == 10 then
            MapLogic:tree_treeantment_end()
        else
            MapLogic:SpawnTreantsForest3(5, self:GetCursorTarget().CampForCeeps + RandomVector(RandomInt(1, 300)))
        end
        UTIL_Remove(self:GetCursorTarget())
    end
end
