function Spawn( entityKeyValues )
	if not IsServer() then
		return
	end

	if thisEntity == nil then
		return
	end
	
	CrystalField = thisEntity:FindAbilityByName( "crystal_freezing_field_lua" )

	thisEntity:SetContextThink( "FireThink", FireThink, 0.2 )
end

--------------------------------------------------------------------------------

function FireThink()
	if not IsServer() then return end

	if not thisEntity:IsAlive() then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	if thisEntity:IsChanneling() then  
        return 1 
    end
	
	local hEnemies = FindUnitsInRadius( thisEntity:GetTeamNumber(), thisEntity:GetOrigin(), nil, 700, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_CLOSEST, false )
	if #hEnemies > 0 then
		for _, hEnemy in pairs( hEnemies ) do
			if CrystalField ~= nil and CrystalField:IsFullyCastable() then
				CrystalFieldCast()
				return 1
			end	
		end
	end
	return 0.1
end


function CrystalFieldCast()	
	ExecuteOrderFromTable({
		UnitIndex = thisEntity:entindex(),
		OrderType = DOTA_UNIT_ORDER_CAST_NO_TARGET,
		AbilityIndex = CrystalField:entindex(),
		Queue = false,
	})
	return 0.5
end