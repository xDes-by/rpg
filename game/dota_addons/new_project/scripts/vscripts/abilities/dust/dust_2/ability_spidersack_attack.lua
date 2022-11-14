ability_spidersack_attack = class({})

LinkLuaModifier( "modifier_ability_spidersack_attack", "abilities/jungle3/ability_spidersack_attack", LUA_MODIFIER_MOTION_NONE )

function ability_spidersack_attack:GetIntrinsicModifierName()
    return "modifier_ability_spidersack_attack"
end

modifier_ability_spidersack_attack = class({})
--Classifications template
function modifier_ability_spidersack_attack:IsHidden()
   return true
end

function modifier_ability_spidersack_attack:IsPurgable()
   return false
end

function modifier_ability_spidersack_attack:IsPurgeException()
    return false
end

function modifier_ability_spidersack_attack:RemoveOnDeath()
   return true
end

function modifier_ability_spidersack_attack:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
       MODIFIER_EVENT_ON_ATTACKED
}
end

function modifier_ability_spidersack_attack:CheckState()
	return {
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
	}
end

function modifier_ability_spidersack_attack:OnCreated()
    if IsClient() then return end
    self.pos = self:GetParent():GetOrigin()
    self:GetParent():SetBaseMaxHealth(10)
    self:GetParent():SetMaxHealth(10)
    self:GetParent():SetHealth(10)
end

function modifier_ability_spidersack_attack:GetModifierIncomingDamage_Percentage(data)
    return -100
end

function modifier_ability_spidersack_attack:OnAttacked(data)
    if IsClient() then
        return
    end
    if data.attacker:IsRealHero() and data.target == self:GetParent() then
        self:GetParent():SetHealth( self:GetParent():GetHealth() - 1 )
        CreateUnitByName("npc_jungle3_spider", self.pos + RandomVector(300), true, nil, nil, DOTA_TEAM_BADGUYS )
        if self:GetParent():GetHealth() == 0 then 
            self:GetParent():ForceKill(false)
        end
    end
end
