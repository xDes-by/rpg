LinkLuaModifier( "modifier_npc_dota_hero_nevermore_spell3","heroes/npc_dota_hero_nevermore/npc_dota_hero_nevermore_spell3", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_nevermore_spell3 = class({})

function npc_dota_hero_nevermore_spell3:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_nevermore_spell3"
end

------------------------------------------------------------------------

modifier_npc_dota_hero_nevermore_spell3 = class({})

function modifier_npc_dota_hero_nevermore_spell3:IsHidden()
    return false
end

function modifier_npc_dota_hero_nevermore_spell3:IsDebuff()
    return false
end

function modifier_npc_dota_hero_nevermore_spell3:IsPurgable()
    return false
end

function modifier_npc_dota_hero_nevermore_spell3:OnCreated( kv )
	self.phys_damage = self:GetAbility():GetSpecialValueFor("phys_damage")
	if IsServer() then
		self:SetStackCount(0)
	end
end

function modifier_npc_dota_hero_nevermore_spell3:OnRefresh( kv )
	self.phys_damage = self:GetAbility():GetSpecialValueFor("phys_damage")
end
	
function modifier_npc_dota_hero_nevermore_spell3:DeclareFunctions()
    return {
       MODIFIER_EVENT_ON_DEATH,
	   MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
    }
end

function modifier_npc_dota_hero_nevermore_spell3:OnDeath(data)
	if data.inflictor and "npc_dota_hero_nevermore_spell6" == data.inflictor:GetAbilityName() then
		return
	end
    if data.attacker == self:GetParent() and not data.unit:HasModifier("modifier_npc_dota_hero_nevermore_spell1_soul_burn") then
		self:IncrementStackCount()
    end
end

function modifier_npc_dota_hero_nevermore_spell3:GetModifierPreAttack_BonusDamage( params )
	if not self:GetParent():IsIllusion() then        
		return self:GetStackCount() * self.phys_damage
	end
end