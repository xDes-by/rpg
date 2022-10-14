item_gaveyard_3_flask = class({})

function item_gaveyard_3_flask:OnSpellStart()
    if self:GetCursorTarget() == MapLogic.Gaveyard3Soul then
        MapLogic:Gaveyard3Flask()
    end
    UTIL_Remove(self)
end
