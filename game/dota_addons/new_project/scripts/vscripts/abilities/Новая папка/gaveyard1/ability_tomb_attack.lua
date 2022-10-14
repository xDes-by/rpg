ability_tomb_attack = class({})

LinkLuaModifier( "modifier_ability_tomb_attack", "abilities/gaveyard1/ability_tomb_attack", LUA_MODIFIER_MOTION_NONE )

function ability_tomb_attack:GetIntrinsicModifierName()
    return "modifier_ability_tomb_attack"
end

modifier_ability_tomb_attack = class({})
--Classifications template
function modifier_ability_tomb_attack:IsHidden()
   return true
end

function modifier_ability_tomb_attack:IsPurgable()
   return false
end

function modifier_ability_tomb_attack:IsPurgeException()
    return false
end

function modifier_ability_tomb_attack:RemoveOnDeath()
   return true
end

function modifier_ability_tomb_attack:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
       MODIFIER_EVENT_ON_ATTACKED
}
end

function modifier_ability_tomb_attack:CheckState()
	return {
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
	}
end

function modifier_ability_tomb_attack:OnCreated()
    if IsClient() then return end
    self:GetParent():SetBaseMaxHealth(10)
    self:GetParent():SetMaxHealth(10)
    self:GetParent():SetHealth(10)
end

function modifier_ability_tomb_attack:OnDestroy()
    if IsClient() then
        return
    end
    MapLogic:TombKill()
end

function modifier_ability_tomb_attack:GetModifierIncomingDamage_Percentage(data)
    return -100
end

function modifier_ability_tomb_attack:OnAttacked(data)
    if IsClient() then
        return
    end
    if data.attacker:IsRealHero() and data.target == self:GetParent() then
        self:GetParent():SetHealth( self:GetParent():GetHealth() - 1 )
        MapLogic:SpawnSkelets(self:GetParent().Number,5)
        if self:GetParent():GetHealth() == 0 then 
            self:GetParent():ForceKill(false)
        end
    end
end
