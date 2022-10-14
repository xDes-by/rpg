item_gaveyard_2_torch = class({})

--function item_gaveyard_2_torch:GetCastRange()
--    return 500
--end

function item_gaveyard_2_torch:OnSpellStart()
    local target = self:GetCursorTarget()
    --if target.torch then
        target.torch = false
        local pfx = ParticleManager:CreateParticle("particles/econ/courier/courier_wyvern_hatchling/courier_wyvern_hatchling_fire.vpcf", PATTACH_POINT_FOLLOW, target)
	    ParticleManager:SetParticleControlEnt(pfx, 0, target, PATTACH_POINT_FOLLOW, "attach_attack1", target:GetAbsOrigin() + Vector(0,0,200), true)
	    ParticleManager:SetParticleControl(pfx, 2, target:GetAbsOrigin())
        MapLogic:Gaveyard2TorchLit()
    --end
end