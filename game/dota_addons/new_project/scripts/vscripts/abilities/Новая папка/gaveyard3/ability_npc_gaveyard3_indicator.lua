ability_npc_gaveyard3_indicator = class({})

pfxunit = {
    ["npc_gaveyard3_gohost_blue"] = "",
    ["npc_gaveyard3_gohost_red"] = "",
    ["npc_gaveyard3_spider"] = "",
}
function ability_npc_gaveyard3_indicator:Spawn()
    if IsClient() then
        return
    end
    self:GetCaster():SetIdleAcquire(true)
    self[self:GetCaster():GetUnitName()] (self)
end

function ability_npc_gaveyard3_indicator:npc_gaveyard3_gohost_blue()
    ParticleManager:CreateParticle("particles/npc_gaveyard3_gohost_blue_indicator.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
end

function ability_npc_gaveyard3_indicator:npc_gaveyard3_gohost_red()
    ParticleManager:CreateParticle("particles/npc_gaveyard3_gohost_red_indicator.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
end

function ability_npc_gaveyard3_indicator:npc_gaveyard3_spider()
    ParticleManager:CreateParticle("particles/npc_gaveyard3_spider_indicator.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
end