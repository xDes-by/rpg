modifier_ice_resist = class({})

function modifier_ice_resist:IsHidden() return false end
function modifier_ice_resist:IsDebuff() return false end
function modifier_ice_resist:IsPurgable() return false end
function modifier_ice_resist:RemoveOnDeath() return false end
function modifier_ice_resist:AllowIllusionDuplicate() return false end
function modifier_ice_resist:GetTexture() return "cold_resist" end
