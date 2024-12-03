function CDOTA_BaseNPC_Hero:GetCurrentZoneName()
    return self.CurrentZoneName or "lorencia"
end

--пока по дефолту возвращает 1, нужно написать логику уменьшения времени респавна
function CDOTA_BaseNPC_Hero:GetRespawnMultiplier()
    return 1
end