function Spawn( entityKeyValues )
	if not IsServer() then
		return
	end

	if thisEntity == nil then
		return
	end
	thisEntity:SetContextThink( "Demon_Think", Demon_Think, 0.5 )
end

function Demon_Think()
	if not IsServer() then
		return
	end

	if ( not thisEntity:IsAlive() ) then
		return -1
	end

	if GameRules:IsGamePaused() == true then
		return 0.5
	end
	
	thisEntity.owner = thisEntity:GetOwner()
	
	local creatures = FindUnitsInRadius( thisEntity:GetTeamNumber(), thisEntity:GetOrigin(), nil, FIND_UNITS_EVERYWHERE, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NONE, FIND_CLOSEST, false )
	if #creatures > 0 then
		for _, creature in pairs( creatures ) do
			if creature ~= nil and creature:IsAlive() then
				if creature == thisEntity.owner then
					if flDist >= 400 and flDist < 1000 then
						return Approach(creature)
					end
					if flDist > 1200 then
						return blink(creature)
					end
				end
			end
		end
	end
	return 1
end

function blink(unit)
	local vToEnemy = unit:GetOrigin() - thisEntity:GetOrigin()
	vToEnemy = vToEnemy:Normalized()
	ExecuteOrderFromTable({
		UnitIndex = thisEntity:entindex(),
		thisEntity:SetAbsOrigin( unit:GetOrigin() + RandomVector( RandomFloat(50, 50 )))
		})
		FindClearSpaceForUnit(thisEntity, unit:GetOrigin()+ RandomVector( RandomFloat(50, 50 )), false)
	return 1
end

function Approach(unit)
	local vToEnemy = unit:GetOrigin() - thisEntity:GetOrigin()
	vToEnemy = vToEnemy:Normalized()
	ExecuteOrderFromTable({
		UnitIndex = thisEntity:entindex(),
		OrderType = DOTA_UNIT_ORDER_MOVE_TO_POSITION,
		Position = thisEntity:GetOrigin() + vToEnemy * thisEntity:GetIdealSpeed()
	})
	return 1
end