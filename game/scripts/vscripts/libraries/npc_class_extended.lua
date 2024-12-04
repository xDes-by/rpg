function CDOTA_BaseNPC:GetZoneName()
    return self.ZoneName or assert(true, "Юниту не присвоена зона")--можно заменить на обычный принт
end