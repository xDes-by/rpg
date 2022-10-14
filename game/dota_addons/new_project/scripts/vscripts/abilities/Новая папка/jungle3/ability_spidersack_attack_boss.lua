ability_spidersack_attack_boss = class({})

LinkLuaModifier( "modifier_ability_spidersack_attack_boss", "abilities/jungle3/ability_spidersack_attack_boss", LUA_MODIFIER_MOTION_NONE )

function ability_spidersack_attack_boss:GetIntrinsicModifierName()
    return "modifier_ability_spidersack_attack_boss"
end

modifier_ability_spidersack_attack_boss = class({})
--Classifications template
function modifier_ability_spidersack_attack_boss:IsHidden()
   return true
end

function modifier_ability_spidersack_attack_boss:IsPurgable()
   return false
end

function modifier_ability_spidersack_attack_boss:IsPurgeException()
    return false
end

function modifier_ability_spidersack_attack_boss:RemoveOnDeath()
   return true
end

function modifier_ability_spidersack_attack_boss:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
       MODIFIER_EVENT_ON_ATTACKED
}
end

function modifier_ability_spidersack_attack_boss:CheckState()
	return {
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
	}
end

function modifier_ability_spidersack_attack_boss:OnCreated()
    if IsClient() then return end
    self.pos = self:GetParent():GetOrigin()
    self:GetParent():SetBaseMaxHealth(10)
    self:GetParent():SetMaxHealth(10)
    self:GetParent():SetHealth(10)
    self:StartIntervalThink(1)
end

function modifier_ability_spidersack_attack_boss:OnIntervalThink()
    CreateUnitByName("npc_jungle3_spider_boss", self.pos + RandomVector(300), true, nil, nil, DOTA_TEAM_BADGUYS )
end

function modifier_ability_spidersack_attack_boss:GetModifierIncomingDamage_Percentage(data)
    return -100
end

function modifier_ability_spidersack_attack_boss:OnAttacked(data)
    if IsClient() then
        return
    end
    if data.attacker:IsRealHero() and data.target == self:GetParent() then
        self:GetParent():SetHealth( self:GetParent():GetHealth() - 1 )
        CreateUnitByName("npc_jungle3_spider_boss", self.pos + RandomVector(300), true, nil, nil, DOTA_TEAM_BADGUYS )
        if self:GetParent():GetHealth() == 0 then 
            self:GetParent():ForceKill(false)
        end
    end
end
