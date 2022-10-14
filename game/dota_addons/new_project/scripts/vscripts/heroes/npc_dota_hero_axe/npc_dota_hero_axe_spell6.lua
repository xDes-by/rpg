LinkLuaModifier( "modifier_npc_dota_hero_axe_spell6", "heroes/npc_dota_hero_axe/npc_dota_hero_axe_spell6", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_axe_spell6 = class({})

function npc_dota_hero_axe_spell6:GetIntrinsicModifierName()
	return "modifier_npc_dota_hero_axe_spell6"
end

--------------------------------------------------------------------------------

modifier_npc_dota_hero_axe_spell6 = class({})

function modifier_npc_dota_hero_axe_spell6:IsHidden()
	return true
end

function modifier_npc_dota_hero_axe_spell6:IsPurgable()
	return false
end

function modifier_npc_dota_hero_axe_spell6:OnCreated( kv )
	self.str = self:GetAbility():GetSpecialValueFor( "str" )
	self.armor = self:GetAbility():GetSpecialValueFor( "armor" )
	self.max_threshold = 10
	self.range = 100-self.max_threshold
	self.max_size = 45
	self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_axe_spell6:OnRefresh( kv )
	self.str = self:GetAbility():GetSpecialValueFor( "str" )
	self.armor = self:GetAbility():GetSpecialValueFor( "armor" )
	self.max_threshold = 10
	self.range = 100-self.max_threshold
end

function modifier_npc_dota_hero_axe_spell6:OnIntervalThink()
if not IsServer() then return end
	self:GetParent():CalculateStatBonus(true)
end

function modifier_npc_dota_hero_axe_spell6:OnRemoved()
end

function modifier_npc_dota_hero_axe_spell6:OnDestroy()
end

function modifier_npc_dota_hero_axe_spell6:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_MODEL_SCALE,
	}
	return funcs
end

function modifier_npc_dota_hero_axe_spell6:GetModifierPhysicalArmorBonus()
	local pct = math.max((self:GetParent():GetHealthPercent()-self.max_threshold)/self.range,0)
	return (1-pct)*self.armor
end

function modifier_npc_dota_hero_axe_spell6:GetModifierBonusStats_Strength()
	local pct = math.max((self:GetParent():GetHealthPercent()-self.max_threshold)/self.range,0)
	return (1-pct)*self.str
end


function modifier_npc_dota_hero_axe_spell6:GetModifierModelScale()
	if IsServer() then
		local pct = math.max((self:GetParent():GetHealthPercent()-self.max_threshold)/self.range,0)
		return (1-pct)*self.max_size
	end
end