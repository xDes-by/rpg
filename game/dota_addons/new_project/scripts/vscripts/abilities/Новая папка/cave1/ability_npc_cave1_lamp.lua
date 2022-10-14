ability_npc_cave1_lamp = class({})

LinkLuaModifier( "modifier_ability_npc_cave1_lamp","abilities/cave1/ability_npc_cave1_lamp", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_cave1_lamp_stack","abilities/cave1/ability_npc_cave1_lamp", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_cave1_lamp_effect","abilities/cave1/ability_npc_cave1_lamp", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave1_lamp:GetIntrinsicModifierName()
    return "modifier_ability_npc_cave1_lamp"
end

modifier_ability_npc_cave1_lamp = class({})

--Classifications template
function modifier_ability_npc_cave1_lamp:IsHidden()
   return true
end

function modifier_ability_npc_cave1_lamp:IsPurgable()
   return false
end

function modifier_ability_npc_cave1_lamp:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_cave1_lamp:GetModifierProcAttack_Feedback(data)
    if RollPseudoRandom(100, self:GetParent()) then
        data.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_cave1_lamp_stack", {duration = 10})
    end
end

modifier_ability_npc_cave1_lamp_stack = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_ability_npc_cave1_lamp_stack:IsHidden()
	return true
end

function modifier_ability_npc_cave1_lamp_stack:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE 
end

function modifier_ability_npc_cave1_lamp_stack:IsPurgable()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_ability_npc_cave1_lamp_stack:OnCreated( kv )
	if IsServer() then
		self.mod = self:GetParent():AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_ability_npc_cave1_lamp_effect", {duration = 10})
		self.mod:IncrementStackCount()
	end
end

function modifier_ability_npc_cave1_lamp_stack:OnDestroy( kv )
	if IsServer() then
		self.mod:DecrementStackCount()
	end
end

modifier_ability_npc_cave1_lamp_effect = class({})
--Classifications template
function modifier_ability_npc_cave1_lamp_effect:IsHidden()
   return false
end

function modifier_ability_npc_cave1_lamp_effect:IsDebuff()
   return true
end

function modifier_ability_npc_cave1_lamp_effect:IsPurgable()
   return true
end

function modifier_ability_npc_cave1_lamp_effect:RemoveOnDeath()
   return true
end

function modifier_ability_npc_cave1_lamp_effect:DestroyOnExpire()
    return true
end

function modifier_ability_npc_cave1_lamp_effect:GetStatusEffectName()
    return "particles/units/heroes/hero_batrider/batrider_stickynapalm_debuff.vpcf"
end

function modifier_ability_npc_cave1_lamp_effect:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
}
end

function modifier_ability_npc_cave1_lamp_effect:GetModifierProcAttack_Feedback(data)
    if IsClient() then
        return
    end
    if data.unit == self:GetParent() then
        ApplyDamage({victim = self:GetParent(),
        damage =  self:GetAbility():GetSpecialValueFor("damage") * self:GetStackCount(),
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
end