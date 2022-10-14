ability_npc_boss_jungle1_spell3 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle1_spell3","abilities/jungle1/ability_npc_boss_jungle1_spell3", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle1_spell3:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_jungle1_spell3"
end

modifier_ability_npc_boss_jungle1_spell3 = class({})

--Classifications template
function modifier_ability_npc_boss_jungle1_spell3:IsHidden()
    return true
end

function modifier_ability_npc_boss_jungle1_spell3:IsPurgable()
    return false
end

function modifier_ability_npc_boss_jungle1_spell3:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_jungle1_spell3:OnCreated()
    self.chance = self:GetAbility():GetSpecialValueFor("chance")
end

function modifier_ability_npc_boss_jungle1_spell3:OnRefresh()
    self.chance = self:GetAbility():GetSpecialValueFor("chance")
end

function modifier_ability_npc_boss_jungle1_spell3:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_ability_npc_boss_jungle1_spell3:GetModifierProcAttack_Feedback(data)
    if RollPseudoRandom(self.chance,self:GetParent()) then
	    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS,self:GetParent():GetAbsOrigin(),nil,225,DOTA_UNIT_TARGET_TEAM_ENEMY,DOTA_UNIT_TARGET_BASIC,DOTA_UNIT_TARGET_FLAG_NOT_ANCIENTS,FIND_CLOSEST,false)
        for _,unit in pairs(enemies) do
            for i=0,5 do
                local abi = unit:GetAbilityByIndex(i)
                if abi and not abi:IsCooldownReady() then
                    local cd = abi:GetCooldownTimeRemaining() + 5
                    abi:EndCooldown()
                    abi:StartCooldown(cd)
                end
            end
        end
    end
end
