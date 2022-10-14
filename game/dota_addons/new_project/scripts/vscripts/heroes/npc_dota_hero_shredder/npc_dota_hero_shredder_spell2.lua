npc_dota_hero_shredder_spell2 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_shredder_spell2","heroes/npc_dota_hero_shredder/npc_dota_hero_shredder_spell2", LUA_MODIFIER_MOTION_NONE )


function npc_dota_hero_shredder_spell2:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_shredder_spell2", {duration = 2})
    EmitSoundOn("DOTA_Item.ExMachina.Cast", self:GetCaster())
end

modifier_npc_dota_hero_shredder_spell2 = class({})
--Classifications template
function modifier_npc_dota_hero_shredder_spell2:IsHidden()
    return false
end

function modifier_npc_dota_hero_shredder_spell2:IsDebuff()
    return false
end

function modifier_npc_dota_hero_shredder_spell2:IsPurgable()
    return false
end

function modifier_npc_dota_hero_shredder_spell2:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_shredder_spell2:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_shredder_spell2:OnCreated()
    self.pfx = ParticleManager:CreateParticle("particles/npc_dota_hero_shredder/npc_dota_hero_shredder_spell2.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
end

function modifier_npc_dota_hero_shredder_spell2:OnDestroy()
    EmitSoundOn("DOTA_Item.IronTalon.Activate", self:GetCaster())
    ParticleManager:DestroyParticle(self.pfx, false)
    ParticleManager:ReleaseParticleIndex(self.pfx)
    if IsClient() then
        return
    end
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetCaster():GetAbsOrigin(), nil, self:GetAbility():GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        unit:AddNewModifier(self:GetCaster(), self, "modifier_stunned", {duration = self:GetAbility():GetSpecialValueFor("duration")})
    end
end    
