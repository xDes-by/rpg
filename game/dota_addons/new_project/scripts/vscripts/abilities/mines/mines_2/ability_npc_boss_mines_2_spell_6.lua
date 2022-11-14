ability_npc_boss_mines_2_spell_6 = class({})

function ability_npc_boss_mines_2_spell_6:OnSpellStart()
if not IsServer() then return end
    local duration = self:GetSpecialValueFor("stun")
    local targetcount = self:GetSpecialValueFor("targetcount")
    local count = 0
    local mod = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_disarmed", {})
    local mod1 = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_rooted", {})
    Timers:CreateTimer(0,function()
        count = count + 1
        if count < targetcount then
            local pfx1 = ParticleManager:CreateParticle("particles/units/heroes/hero_nyx_assassin/nyx_assassin_burrow.vpcf", PATTACH_POINT, self:GetCaster())
            ParticleManager:ReleaseParticleIndex(pfx1)
            self:GetCaster():StartGesture(ACT_DOTA_CAST_ABILITY_5)
            FindClearSpaceForUnit(self:GetCaster(), self:GetCaster():GetAbsOrigin() + RandomVector(RandomInt(200,500)), true)
            local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_earth_spirit/earthspirit_petrify_shockwave.vpcf", PATTACH_POINT, self:GetCaster())
            ParticleManager:SetParticleControl(pfx, 1, Vector(300, 0, 0))
            ParticleManager:ReleaseParticleIndex(pfx)
            local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetCaster():GetAbsOrigin(), nil, 300, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
            for _,unit in pairs(enemies) do
                unit:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = duration})
            end
            return 1
        else
            FindClearSpaceForUnit(self:GetCaster(), self:GetCaster():GetAbsOrigin() + RandomVector(RandomInt(200,500)), true)
            local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_earth_spirit/earthspirit_petrify_shockwave.vpcf", PATTACH_POINT, self:GetCaster())
            ParticleManager:SetParticleControl(pfx, 1, Vector(300, 0, 0))
            ParticleManager:ReleaseParticleIndex(pfx)
            local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetCaster():GetAbsOrigin(), nil, 300, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
            for _,unit in pairs(enemies) do
                unit:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = duration})
            end
            mod:Destroy()
            mod1:Destroy()
        end
    end)
end