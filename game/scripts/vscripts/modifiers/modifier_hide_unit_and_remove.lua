modifier_hide_unit_and_remove = class({})
function modifier_hide_unit_and_remove:IsHidden() return true end
function modifier_hide_unit_and_remove:IsDebuff() return false end
function modifier_hide_unit_and_remove:IsPurgable() return false end
function modifier_hide_unit_and_remove:IsPurgeException() return false end
function modifier_hide_unit_and_remove:IsStunDebuff() return false end
function modifier_hide_unit_and_remove:RemoveOnDeath() return false end
function modifier_hide_unit_and_remove:DestroyOnExpire() return true end

function modifier_hide_unit_and_remove:OnCreated(data)
    if not IsServer() then return end

    if data.zone_name then
        self.zone_name = data.zone_name
    end
    self:GetParent():AddNoDraw()
end

function modifier_hide_unit_and_remove:OnDestroy()
    if not IsServer() then return end

    if self:GetElapsedTime() >= (self:GetDuration() - 0.1) then
        local parent = self:GetParent()
        for index,unit in pairs(Spawner.creep_pool[self.zone_name]) do
            if parent == unit then
                table.remove(Spawner.creep_pool[self.zone_name], index)
                break
            end
        end
        UTIL_Remove(self:GetParent())
    else
        self:GetParent():RemoveNoDraw()
        self:Destroy()
    end
end

function modifier_hide_unit_and_remove:CheckState()
    return {
        [MODIFIER_STATE_UNTARGETABLE] = true,
        [MODIFIER_STATE_INVULNERABLE] = true,
        [MODIFIER_STATE_NOT_ON_MINIMAP] = true,
        [MODIFIER_STATE_NOT_ON_MINIMAP_FOR_ENEMIES] = true,
        [MODIFIER_STATE_CANNOT_BE_MOTION_CONTROLLED] = true,
        [MODIFIER_STATE_NO_UNIT_COLLISION] = true,
        [MODIFIER_STATE_INVISIBLE] = true,
        [MODIFIER_STATE_ATTACK_IMMUNE] = true,
        [MODIFIER_STATE_STUNNED] = true,
        [MODIFIER_STATE_UNSELECTABLE] = true,
        [MODIFIER_STATE_NO_HEALTH_BAR] = true,
        [MODIFIER_STATE_OUT_OF_GAME] = true
    }
end