ablility_npc_desert2_boss_spell2 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert2_boss_spell2","abilities/desert2/ablility_npc_desert2_boss_spell2", LUA_MODIFIER_MOTION_NONE )

function ablility_npc_desert2_boss_spell2:OnSpellStart()
    local pos = self:GetCaster():GetAbsOrigin()
    local forvard = self:GetCaster():GetForwardVector() * 500
    local unittable = {}
    local mod = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ablility_npc_desert2_boss_spell2", {})
    for i=0,2 do 
        local direction = RotatePosition(Vector(0, 0, 0), QAngle(0, i * 120, 0), forvard)
        local unit = CreateUnitByName("npc_desert2_boss_summon", pos + direction, true, nil, nil, DOTA_TEAM_BADGUYS )
        table.insert( unittable, unit )
    end
    Timers:CreateTimer(0.2,function()
        for _,unit in pairs(unittable) do
            if not unit:IsAlive() then
                mod:Destroy()
                return
            end
        end
        return 0.2
    end)
end

modifier_ablility_npc_desert2_boss_spell2 = class({})
--Classifications template
function modifier_ablility_npc_desert2_boss_spell2:IsHidden()
    return false
end

function modifier_ablility_npc_desert2_boss_spell2:IsDebuff()
    return false
end

function modifier_ablility_npc_desert2_boss_spell2:IsPurgable()
    return false
end

function modifier_ablility_npc_desert2_boss_spell2:GetEffectName()
	return "particles/items_fx/black_king_bar_avatar.vpcf"
end

function modifier_ablility_npc_desert2_boss_spell2:OnCreated()
    self.regen = self:GetAbility():GetSpecialValueFor("regen")
end

function modifier_ablility_npc_desert2_boss_spell2:CheckState()
    return {
        [MODIFIER_STATE_MAGIC_IMMUNE] = true
    }
end

function modifier_ablility_npc_desert2_boss_spell2:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE
    }
end

function modifier_ablility_npc_desert2_boss_spell2:GetModifierHealthRegenPercentage()
    return self.regen
end
