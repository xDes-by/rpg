ability_npc_cave2_grevil_dig = class({})

LinkLuaModifier( "modifier_ability_npc_cave2_grevil_dig","abilities/cave2/ability_npc_cave2_grevil_dig", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_cave2_grevil_under_ground","abilities/cave2/ability_npc_cave2_grevil_dig", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave2_grevil_dig:GetIntrinsicModifierName()
    return "modifier_ability_npc_cave2_grevil_dig"
end

modifier_ability_npc_cave2_grevil_dig = class({})

--Classifications template
function modifier_ability_npc_cave2_grevil_dig:IsHidden()
   return true
end

function modifier_ability_npc_cave2_grevil_dig:IsDebuff()
   return false
end

function modifier_ability_npc_cave2_grevil_dig:IsPurgable()
   return false
end

function modifier_ability_npc_cave2_grevil_dig:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
       MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE 
}
end

function modifier_ability_npc_cave2_grevil_dig:GetModifierProcAttack_Feedback(data)
	self.effect_cast = ParticleManager:CreateParticle( "particles/econ/events/ti9/shovel_dig.vpcf", PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( self.effect_cast, 0, data.target:GetAbsOrigin() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 90, 90, 90 ) )
    data.attacker:ForceKill(false)
    data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_rooted", {duration = 2})
    Timers:CreateTimer(1.5,function()
        data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_cave2_grevil_under_ground", nil)
        ParticleManager:DestroyParticle(self.effect_cast, false)
    end)
end

function modifier_ability_npc_cave2_grevil_dig:GetModifierMoveSpeed_Absolute()
    return 1000
end

function modifier_ability_npc_cave2_grevil_dig:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
    }
end

modifier_ability_npc_cave2_grevil_under_ground = class({})

--Classifications template
function modifier_ability_npc_cave2_grevil_under_ground:IsHidden()
   return false
end

function modifier_ability_npc_cave2_grevil_under_ground:IsDebuff()
   return true
end

function modifier_ability_npc_cave2_grevil_under_ground:IsPurgable()
   return false
end

function modifier_ability_npc_cave2_grevil_under_ground:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_MODEL_CHANGE 
}
end

function modifier_ability_npc_cave2_grevil_under_ground:GetModifierModelChange()
    return "models/heroes/nerubian_assassin/mound.vmdl"
end

function modifier_ability_npc_cave2_grevil_under_ground:CheckState()
	return {
		--[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		--[MODIFIER_STATE_UNSELECTABLE] = true,
		--[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
		--[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_ROOTED] = true,
	}
end

function modifier_ability_npc_cave2_grevil_under_ground:OnCreated()
    if IsClient() then
        return
    end
    self:GetParent():AddAbility("ability_npc_cave2_grevil_dig_out"):SetLevel(1)
    self.abi1 = "ability_npc_cave2_grevil_dig_out"
    self.abi2 = self:GetParent():GetAbilityByIndex(0):GetAbilityName()
    self:GetParent():SwapAbilities(self.abi1, self.abi2, true, false)
    for i=1,5 do
        self:GetParent():GetAbilityByIndex(i):SetHidden(true)
    end
end

function modifier_ability_npc_cave2_grevil_under_ground:OnDestroy()
    if IsClient() then
        return
    end
    self:GetParent():SwapAbilities(self.abi2, self.abi1, true, false)
    self:GetParent():RemoveAbility("ability_npc_cave2_grevil_dig_out")
    for i=1,5 do
        local abi = self:GetParent():GetAbilityByIndex(i)
        if abi:GetAbilityName() ~= "generic_hidden" then
            abi:SetHidden(false)
        end
    end
end

ability_npc_cave2_grevil_dig_out = class({})

function ability_npc_cave2_grevil_dig_out:OnSpellStart()
    if RollPseudoRandom(30, self:GetCaster()) then
        self:GetCaster():RemoveModifierByName("modifier_ability_npc_cave2_grevil_under_ground")
    else
        self:StartCooldown(3)
    end
end
