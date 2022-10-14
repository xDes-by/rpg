ability_npc_hell2_colume_attack = class({})

LinkLuaModifier( "modifier_ability_npc_hell2_colume_attack", "abilities/hell2/ability_npc_hell2_colume_attack", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_hell2_colume_attack_weak", "abilities/hell2/ability_npc_hell2_colume_attack", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell2_colume_attack:GetIntrinsicModifierName()
    return "modifier_ability_npc_hell2_colume_attack"
end

modifier_ability_npc_hell2_colume_attack = class({})
--Classifications template
function modifier_ability_npc_hell2_colume_attack:IsHidden()
   return true
end

function modifier_ability_npc_hell2_colume_attack:IsPurgable()
   return false
end

function modifier_ability_npc_hell2_colume_attack:IsPurgeException()
    return false
end

function modifier_ability_npc_hell2_colume_attack:RemoveOnDeath()
   return true
end

function modifier_ability_npc_hell2_colume_attack:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
       MODIFIER_EVENT_ON_ATTACKED
}
end

function modifier_ability_npc_hell2_colume_attack:CheckState()
	return {
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
	}
end

function modifier_ability_npc_hell2_colume_attack:OnCreated()
    if IsClient() then return end
    self:GetParent():SetBaseMaxHealth(10)
    self:GetParent():SetMaxHealth(10)
    self:GetParent():SetHealth(10)
end

function modifier_ability_npc_hell2_colume_attack:OnDestroy()
    if IsClient() then
        return
    end
end

function modifier_ability_npc_hell2_colume_attack:GetModifierIncomingDamage_Percentage(data)
    return -100
end

function modifier_ability_npc_hell2_colume_attack:OnAttacked(data)
    if IsClient() then
        return
    end
    if data.attacker:IsRealHero() and data.target == self:GetParent() then
        self:GetParent():SetHealth( self:GetParent():GetHealth() - 1 )
        data.attacker:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_hell2_colume_attack_weak", {duration = 10})
        if self:GetParent():GetHealth() == 0 then 
            self:GetParent():ForceKill(false)
        end
    end
end

modifier_ability_npc_hell2_colume_attack_weak = class({})
--Classifications template
function modifier_ability_npc_hell2_colume_attack_weak:IsHidden()
    return false
end

function modifier_ability_npc_hell2_colume_attack_weak:IsDebuff()
    return true
end

function modifier_ability_npc_hell2_colume_attack_weak:IsPurgable()
    return false
end

function modifier_ability_npc_hell2_colume_attack_weak:RemoveOnDeath()
    return true
end

function modifier_ability_npc_hell2_colume_attack_weak:DestroyOnExpire()
    return true
end

function modifier_ability_npc_hell2_colume_attack_weak:OnRefresh()
    self:IncrementStackCount()
    self:SetDuration(self:GetRemainingTime() + 2, true)
end

function modifier_ability_npc_hell2_colume_attack_weak:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_BONUSDAMAGEOUTGOING_PERCENTAGE
    }
end

function modifier_ability_npc_hell2_colume_attack_weak:GetModifierDamageOutgoing_Percentage()
    return -10 * self:GetStackCount()
end
