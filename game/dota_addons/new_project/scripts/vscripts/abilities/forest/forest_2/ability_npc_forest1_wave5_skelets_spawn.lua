ability_npc_forest1_wave5_skelets_spawn = class({})

LinkLuaModifier( "modifier_ability_npc_forest1_wave5_skelets_spawn","abilities/forest1/ability_npc_forest1_wave5_skelets_spawn", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_forest1_wave5_skelets_respawn","abilities/forest1/ability_npc_forest1_wave5_skelets_spawn", LUA_MODIFIER_MOTION_NONE )

function ability_npc_forest1_wave5_skelets_spawn:GetIntrinsicModifierName()
    return "modifier_ability_npc_forest1_wave5_skelets_spawn"
end

modifier_ability_npc_forest1_wave5_skelets_spawn = class({})

--Classifications template
function modifier_ability_npc_forest1_wave5_skelets_spawn:IsHidden()
   return true
end

function modifier_ability_npc_forest1_wave5_skelets_spawn:IsPurgable()
   return false
end

function modifier_ability_npc_forest1_wave5_skelets_spawn:RemoveOnDeath()
   return true
end

function modifier_ability_npc_forest1_wave5_skelets_spawn:OnCreated()
    self:StartIntervalThink(1)
    self.Skelets = 5
end

function modifier_ability_npc_forest1_wave5_skelets_spawn:OnIntervalThink()
    self.Skelets = self.Skelets - 1
    if self.Skelets <= 0 then 
        self:StartIntervalThink(-1)
    end
    if IsClient() then return end
	local unit = CreateUnitByName("npc_forest1_wave5_skelet", self:GetParent():GetAbsOrigin() + RandomVector(300), true, nil, nil, DOTA_TEAM_BADGUYS )
    unit:AddNewModifier(nil, nil, "modifier_ability_npc_forest1_wave5_skelets_respawn", nil).parent = self:GetParent()
end

modifier_ability_npc_forest1_wave5_skelets_respawn = class({})
--Classifications template
function modifier_ability_npc_forest1_wave5_skelets_respawn:IsHidden()
   return false
end

function modifier_ability_npc_forest1_wave5_skelets_respawn:IsDebuff()
   return false
end

function modifier_ability_npc_forest1_wave5_skelets_respawn:IsPurgable()
   return false
end

function modifier_ability_npc_forest1_wave5_skelets_respawn:RemoveOnDeath()
    return true
end

function modifier_ability_npc_forest1_wave5_skelets_respawn:OnDestroy()
    if IsClient() then return end
    self.unit = self:GetParent()
    print(self.parent:GetUnitName())
    if self.parent ~= nil and self.parent:IsAlive() then
        Timers:CreateTimer(3,function()
            self.unit:RespawnUnit()
            MapLogic.SkeletsCalculator = MapLogic.SkeletsCalculator + 1
            self.unit:AddNewModifier(nil, nil, "modifier_ability_npc_forest1_wave5_skelets_respawn", nil)
        end)
    end
end

