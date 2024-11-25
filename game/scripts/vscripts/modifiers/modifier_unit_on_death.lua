LinkLuaModifier( "modifier_unit_on_death", "modifiers/modifier_unit_on_death", LUA_MODIFIER_MOTION_NONE )

----------------------------------------------------------------

RESPAWN_CREEP_TIME = 3

if modifier_unit_on_death == nil then modifier_unit_on_death = class({}) end

function modifier_unit_on_death:IsHidden()
	return true
end

function modifier_unit_on_death:IsPurgable()
	return false
end

function modifier_unit_on_death:RemoveOnDeath()
	return false
end

function modifier_unit_on_death:OnCreated(kv)
	if not IsServer() then return end
	self:GetParent():SetUnitCanRespawn(true)
	self.spawnPos = Vector(kv.posX, kv.posY, kv.posZ)
	self.unitName = kv.name
end

function modifier_unit_on_death:DeclareFunctions()
	local funcs = 
	{
		MODIFIER_EVENT_ON_DEATH
	}
	return funcs
end

function modifier_unit_on_death:OnDeath(event)
    if not IsServer() then return end
    if event.unit ~= self:GetParent() then return end
	self:GetParent():AddNoDraw()
	self:StartIntervalThink(RESPAWN_CREEP_TIME)
	return
end

function modifier_unit_on_death:OnIntervalThink()
	local unit = CreateUnitByName(self.unitName, self.spawnPos, true, nil, nil, DOTA_TEAM_BADGUYS)
	Spawner:unit_settings(unit, self.unitName)
	-- unit:AddNewModifier(unit, nil, "modifier_unit_on_death", {posX = self.spawnPos.x, posY = self.spawnPos.y, posZ = self.spawnPos.z, name = self.unitName})
	
	
	UTIL_Remove(self:GetParent())
end