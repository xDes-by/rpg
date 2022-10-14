ablility_npc_desert2_boss_spell4 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert2_boss_spell4", "abilities/desert2/ablility_npc_desert2_boss_spell4", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ablility_npc_desert2_boss_spell4_effect", "abilities/desert2/ablility_npc_desert2_boss_spell4", LUA_MODIFIER_MOTION_NONE )

function ablility_npc_desert2_boss_spell4:Precache(context)
    PrecacheResource( "particle", "particles/units/heroes/hero_pangolier/pangolier_gyroshell_cast.vpcf", context )
    PrecacheResource( "particle", "particles/units/heroes/hero_pangolier/pangolier_gyroshell.vpcf", context )
    PrecacheResource( "model", "models/heroes/pangolier/pangolier_gyroshell2_rubick.vmdl", context )
    PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_pangolier.vsndevts", context )
end

function ablility_npc_desert2_boss_spell4:GetChannelTime()
    return 1.2
end

function ablility_npc_desert2_boss_spell4:OnSpellStart()
    self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_pangolier/pangolier_gyroshell_cast.vpcf", PATTACH_POINT, self:GetCaster())
    ParticleManager:SetParticleControl(self.pfx, 0, self:GetCaster():GetForwardVector())
    ParticleManager:SetParticleControl(self.pfx, 3, self:GetCaster():GetAbsOrigin())
end

function ablility_npc_desert2_boss_spell4:OnChannelFinish(bInterrupted)
    if not bInterrupted then
        self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ablility_npc_desert2_boss_spell4", {duration = 10})
    end
    ParticleManager:DestroyParticle(self.pfx, true)
    ParticleManager:ReleaseParticleIndex(self.pfx)
end

modifier_ablility_npc_desert2_boss_spell4 = class({})
--Classifications template
function modifier_ablility_npc_desert2_boss_spell4:IsHidden()
    return false
end

function modifier_ablility_npc_desert2_boss_spell4:IsDebuff()
    return false
end

function modifier_ablility_npc_desert2_boss_spell4:IsPurgable()
    return false
end

function modifier_ablility_npc_desert2_boss_spell4:RemoveOnDeath()
    return true
end

function modifier_ablility_npc_desert2_boss_spell4:DestroyOnExpire()
    return true
end

function modifier_ablility_npc_desert2_boss_spell4:OnCreated()
    self.part = ParticleManager:CreateParticle("particles/units/heroes/hero_pangolier/pangolier_gyroshell.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster())
    self.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_pangolier/pangolier_gyroshell_jump_trail.vpcf", PATTACH_POINT_FOLLOW, self:GetParent())
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.05)
end

function modifier_ablility_npc_desert2_boss_spell4:OnDestroy()
    ParticleManager:DestroyParticle(self.pfx, false)
    ParticleManager:ReleaseParticleIndex(self.pfx)
    ParticleManager:DestroyParticle(self.part, false)
    ParticleManager:ReleaseParticleIndex(self.part)
end

function modifier_ablility_npc_desert2_boss_spell4:OnIntervalThink()
    local position = self:GetCaster():GetAbsOrigin()
	local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, position, nil, 150, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        if not unit:HasModifier("modifier_ablility_npc_desert2_boss_spell4_effect") then
            local direction = position - unit:GetAbsOrigin()
            local mnoj = 250 / direction:Length2D()
            if mnoj > 1 then
                direction = direction * mnoj
            end
            local point = position - direction
            unit:AddNewModifier(self:GetCaster(),self:GetAbility(),"modifier_generic_arc_lua", {
            target_x = point.x, target_y = point.y, duration = 0.5, distance = 250, height = 250,
            speed = 500, fix_duration = false, isStun = true, activity = ACT_DOTA_FLAIL})
            unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ablility_npc_desert2_boss_spell4_effect", {duration = 5})
        end
    end
end

function modifier_ablility_npc_desert2_boss_spell4:CheckState()
    return {
        [MODIFIER_STATE_DISARMED] = true
    }
end

function modifier_ablility_npc_desert2_boss_spell4:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_TURN_RATE_OVERRIDE,
        MODIFIER_PROPERTY_MODEL_CHANGE,
        MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE
    }
end

function modifier_ablility_npc_desert2_boss_spell4:GetModifierTurnRate_Override()
    return 0.1
end

function modifier_ablility_npc_desert2_boss_spell4:GetModifierModelChange()
    return "models/heroes/pangolier/pangolier_gyroshell2_rubick.vmdl"
end

function modifier_ablility_npc_desert2_boss_spell4:GetModifierMoveSpeed_Absolute()
    return 550
end

modifier_ablility_npc_desert2_boss_spell4_effect = class({})
--Classifications template
function modifier_ablility_npc_desert2_boss_spell4_effect:IsHidden()
    return false
end

function modifier_ablility_npc_desert2_boss_spell4_effect:IsDebuff()
    return true
end

function modifier_ablility_npc_desert2_boss_spell4_effect:IsPurgable()
    return true
end

function modifier_ablility_npc_desert2_boss_spell4_effect:RemoveOnDeath()
    return true
end

function modifier_ablility_npc_desert2_boss_spell4_effect:DestroyOnExpire()
    return true
end

function modifier_ablility_npc_desert2_boss_spell4_effect:OnCreated()
    EmitSoundOn("Hero_Pangolier.Gyroshell.Stun", self:GetParent())
    self:StartIntervalThink(0.5)
end

function modifier_ablility_npc_desert2_boss_spell4_effect:OnIntervalThink()
    self:StartIntervalThink(-1)
end

function modifier_ablility_npc_desert2_boss_spell4_effect:CheckState()
    return {
        [MODIFIER_STATE_SILENCED] = true,
        [MODIFIER_STATE_DISARMED] = true
    }
end
