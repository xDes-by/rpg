LinkLuaModifier( "modifier_axe_skill_ultimate", "heroes/npc_dota_hero_axe/npc_dota_hero_axe_ultimate", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_axe_ultimate = class({})

function npc_dota_hero_axe_ultimate:GetIntrinsicModifierName()
	return "modifier_axe_skill_ultimate"
end

--------------------------------------------------------------------------------

modifier_axe_skill_ultimate = class({})

function modifier_axe_skill_ultimate:IsHidden()
	return true
end

function modifier_axe_skill_ultimate:IsPurgable()
	return false
end

function modifier_axe_skill_ultimate:OnCreated( kv )
	self.str = self:GetAbility():GetSpecialValueFor( "str" )
	self.armor = self:GetAbility():GetSpecialValueFor( "armor" )
	self.max_threshold = 10
	self.range = 100-self.max_threshold
	self.max_size = 45
	self:StartIntervalThink(1)
end

function modifier_axe_skill_ultimate:OnRefresh( kv )
	self.str = self:GetAbility():GetSpecialValueFor( "str" )
	self.armor = self:GetAbility():GetSpecialValueFor( "armor" )
	self.max_threshold = 10
	self.range = 100-self.max_threshold
end

function modifier_axe_skill_ultimate:OnIntervalThink()
if not IsServer() then return end
	self:GetParent():CalculateStatBonus(true)
end

function modifier_axe_skill_ultimate:OnRemoved()
end

function modifier_axe_skill_ultimate:OnDestroy()
end

function modifier_axe_skill_ultimate:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_MODEL_SCALE,
	}
	return funcs
end

function modifier_axe_skill_ultimate:GetModifierPhysicalArmorBonus()
	local pct = math.max((self:GetParent():GetHealthPercent()-self.max_threshold)/self.range,0)
	return (1-pct)*self.armor
end

function modifier_axe_skill_ultimate:GetModifierBonusStats_Strength()
	local pct = math.max((self:GetParent():GetHealthPercent()-self.max_threshold)/self.range,0)
	return (1-pct)*self.str
end


function modifier_axe_skill_ultimate:GetModifierModelScale()
	if IsServer() then
		local pct = math.max((self:GetParent():GetHealthPercent()-self.max_threshold)/self.range,0)
		return (1-pct)*self.max_size
	end
end