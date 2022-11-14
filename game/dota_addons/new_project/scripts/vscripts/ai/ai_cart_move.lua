function Spawn( entityKeyValues )
    if not IsServer() then
        return
    end

    if thisEntity == nil then
        return
    end
	
    thisEntity:SetContextThink( "CartThink", CartThink, 1 )
	
	_G.cart_count = 1
end

function CartThink()
    if ( not thisEntity:IsAlive() ) then
		return -1
	end	

	if GameRules:IsGamePaused() == true then
		return 1
	end
	
	local all = FindUnitsInRadius(thisEntity:GetTeamNumber(), thisEntity:GetOrigin(), nil, 300, DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_ALL, DOTA_UNIT_TARGET_FLAG_NONE, FIND_CLOSEST, false )
	if #all > 0 then
		for _, unit in ipairs(all) do
			if thisEntity ~= unit then
				if unit:GetTeamNumber() == thisEntity:GetTeamNumber() and unit:IsHero() then
					local point = Entities:FindByName(nil, "path_mines".._G.cart_count):GetAbsOrigin()
					if (point - thisEntity:GetOrigin() ):Length2D() < 200 then
						_G.cart_count = _G.cart_count + 1
					end
					Move(point)
				else
					thisEntity:Stop()
				end
			end
		end	
	end
	return 0.2
end

function Move(point)
	ExecuteOrderFromTable({
		UnitIndex = thisEntity:entindex(),
		OrderType = DOTA_UNIT_ORDER_MOVE_TO_POSITION,
		Position = point,
	})
	return 1
end