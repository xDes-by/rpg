local function damage(self)
	local parent = self:GetParent()
	local name = self.name
	local formulas = {
		["npc_dota_hero_juggernaut"] = {min = (parent:GetStrength() + self.str) / 5, max = (parent:GetStrength() + self.str) / 3},
	}
    return formulas[name].min, formulas[name].max
end

local function speed(self)
	local parent = self:GetParent()
	local name = self.name
	local formulas = {
		["npc_dota_hero_juggernaut"] = {speed = parent:GetAgility() / 15},
	}
    return formulas[name].speed
end

local function armor(self)
	local parent = self:GetParent()
	local name = self.name
	local formulas = {
		["npc_dota_hero_juggernaut"] = {armor = parent:GetAgility() / 3},
	}
    return formulas[name].armor
end


local heroes_stats = {
    ["npc_dota_hero_juggernaut"] = {str = 28, agi = 20, vit = 25, eng = 10, hp = 110, mp = 20, hp_per_level = 2, mp_per_level = 1, hp_per_vit = 30, mp_per_eng = 1, damage = damage, speed = speed, armor = armor}, 		-- воин 
    ["npc_dota_hero_death_prophet"] = {str = 28, agi = 20, vit = 25, eng = 10, hp = 110, mp = 20, hp_per_level = 2, mp_per_level = 1, hp_per_vit = 30, mp_per_eng = 1, damage = damage, speed = speed, armor = armor},		-- маг
}

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

if modifier_hero_stats == nil then modifier_hero_stats = class({}) end

function modifier_hero_stats:IsHidden()
    return true
end

function modifier_hero_stats:IsPurgable()
    return false
end

function modifier_hero_stats:RemoveOnDeath()
    return false
end

function modifier_hero_stats:OnCreated(kv)
    if not IsServer() then return end
    self.name = self:GetCaster():GetUnitName()
    self:SetupRewards(kv)
    self:SetHasCustomTransmitterData(true)
    self:StartIntervalThink(0.1)
end

function modifier_hero_stats:OnRefresh(kv)
    if not IsServer() then return end
    self.name = self:GetCaster():GetUnitName()
    self:SetupRewards(kv)
end


function modifier_hero_stats:SetupRewards(kv)
    self.str = kv.str or 0
    self.agi = kv.agi or 0
    self.vit = kv.vit or 0
    self.eng = kv.eng or 0
end

function modifier_hero_stats:AddCustomTransmitterData()
    return {
        str = self.str,
        agi = self.agi,
        vit = self.vit,
        eng = self.eng,
    }
end

function modifier_hero_stats:HandleCustomTransmitterData(data)
    self.str = data.str
    self.agi = data.agi
    self.vit = data.vit
    self.eng = data.eng
end

function modifier_hero_stats:OnIntervalThink()
    local hero_data = heroes_stats[self.name]
    self:SetStackCount(hero_data.vit + self.vit) -- стаки этого модификатора это виталити
    local min_damage, max_damage = hero_data.damage(self)
	
    self:GetParent():SetBaseStrength(heroes_stats[self.name].str + self.str)
    self:GetParent():SetBaseAgility(heroes_stats[self.name].agi + self.agi)
    self:GetParent():SetBaseIntellect(heroes_stats[self.name].eng + self.eng)
	
    self:GetParent():SetBaseDamageMin(min_damage)
    self:GetParent():SetBaseDamageMax(max_damage)
	
    self:GetParent():SetPhysicalArmorBaseValue(hero_data.armor(self))
	
    self:GetParent():CalculateStatBonus(true)
end

function modifier_hero_stats:DeclareFunctions()
    return {
        -- MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        -- MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        -- MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
        MODIFIER_PROPERTY_MANA_BONUS,
        MODIFIER_PROPERTY_HEALTH_BONUS,
		--------------------------------
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_DIRECT_MODIFICATION,
		MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT
    }
end

-- function modifier_hero_stats:GetModifierBonusStats_Strength()
    -- return heroes_stats[self.name].str + self.str
-- end

-- function modifier_hero_stats:GetModifierBonusStats_Agility()
    -- return heroes_stats[self.name].agi + self.agi
-- end

-- function modifier_hero_stats:GetModifierBonusStats_Intellect()
    -- return heroes_stats[self.name].eng + self.eng
-- end

function modifier_hero_stats:GetModifierHealthBonus()
    return heroes_stats[self.name].hp + self:GetCaster():GetLevel() * heroes_stats[self.name].hp_per_level + self:GetStackCount() * heroes_stats[self.name].hp_per_vit
end

function modifier_hero_stats:GetModifierManaBonus()
    return heroes_stats[self.name].mp + self:GetCaster():GetLevel() * heroes_stats[self.name].mp_per_level + self:GetCaster():GetIntellect(true) * heroes_stats[self.name].mp_per_eng
end

-------------


function modifier_hero_stats:GetModifierConstantHealthRegen()
	return -0.1 * self:GetParent():GetStrength()
end

function modifier_hero_stats:GetModifierMagicalResistanceDirectModification()
	return -0.1 * self:GetParent():GetIntellect(true)
end

function modifier_hero_stats:GetModifierConstantManaRegen()
	return -0.049 * self:GetParent():GetIntellect(true)
end