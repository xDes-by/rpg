	local chances_table = {
		{1, 0.015604},
		{2, 0.062009},
		{3, 0.138618},
		{4, 0.244856},
		{5, 0.380166},
		{6, 0.544011},
		{7, 0.735871},
		{8, 0.955242},
		{9, 1.201637},
		{10, 1.474584},
		{11, 1.773627},
		{12, 2.098323},
		{13, 2.448241},
		{14, 2.822965},
		{15, 3.222091},
		{16, 3.645227},
		{17, 4.091991},
		{18, 4.562014},
		{19, 5.054934},
		{20, 5.570404},
		{21, 6.108083},
		{22, 6.667640},
		{23, 7.248754},
		{24, 7.851112},
		{25, 8.474409},
		{26, 9.118346},
		{27, 9.782638},
		{28, 10.467023},
		{29, 11.171176},
		{30, 11.894919},
		{31, 12.637932},
		{32, 13.400086},
		{33, 14.180520},
		{34, 14.981009},
		{35, 15.798310},
		{36, 16.632878},
		{37, 17.490924},
		{38, 18.362465},
		{39, 19.248596},
		{40, 20.154741},
		{41, 21.092003},
		{42, 22.036458},
		{43, 22.989868},
		{44, 23.954015},
		{45, 24.930700},
		{46, 25.987235},
		{47, 27.045294},
		{48, 28.100764},
		{49, 29.155227},
		{50, 30.210303},
		{51, 31.267664},
		{52, 32.329055},
		{53, 33.411996},
		{54, 34.736999},
		{55, 36.039785},
		{56, 37.321683},
		{57, 38.583961},
		{58, 39.827833},
		{59, 41.054464},
		{60, 42.264973},
		{61, 43.460445},
		{62, 44.641928},
		{63, 45.810444},
		{64, 46.966991},
		{65, 48.112548},
		{66, 49.248078},
		{67, 50.746269},
		{68, 52.941176},
		{69, 55.072464},
		{70, 57.142857},
		{71, 59.154930},
		{72, 61.111111},
		{73, 63.013699},
		{74, 64.864865},
		{75, 66.666667},
		{76, 68.421053},
		{77, 70.129870},
		{78, 71.794872},
		{79, 73.417722},
		{80, 75.000000},
		{81, 76.543210},
		{82, 78.048780},
		{83, 79.518072},
		{84, 80.952381},
		{85, 82.352941},
		{86, 83.720930},
		{87, 85.057471},
		{88, 86.363636},
		{89, 87.640449},
		{90, 88.888889},
		{91, 90.109890},
		{92, 91.304348},
		{93, 92.473118},
		{94, 93.617021},
		{95, 94.736842},
		{96, 95.833333},
		{97, 96.907216},
		{98, 97.959184},
		{99, 98.989899},	
		{100, 100}
	}
function RollPseudoRandom(base_chance, entity)
	if not entity then
		print("Missing or invalid entity!")
		return
	end

	entity.pseudoRandomModifier = entity.pseudoRandomModifier or 0

	local prngBase
    --!переписать на 1 таблицу
	for i = 1, #chances_table do
		if base_chance == chances_table[i][1] then		  
			prngBase = chances_table[i][2]
		end	 
	end

	if not prngBase then
		return false
	end
	if RollPercentage( prngBase + entity.pseudoRandomModifier ) then
		entity.pseudoRandomModifier = 0
		return true
	else
		entity.pseudoRandomModifier = entity.pseudoRandomModifier + prngBase		
		return false
	end
end

function CDOTA_BaseNPC:Fear(owner, duration)
	local direction = self:GetOrigin() - owner:GetOrigin()
    ExecuteOrderFromTable({
        UnitIndex = self:entindex(),
        OrderType = DOTA_UNIT_ORDER_MOVE_TO_DIRECTION,
        Position = self:GetOrigin() + direction * duration,
        Queue = false,
    })
    self:AddNewModifier(owner, nil, "modifier_fear", {duration = duration})
end

function FindUnitsInCone( nTeamNumber, vCenterPos, vStartPos, vEndPos, fStartRadius, fEndRadius, hCacheUnit, nTeamFilter, nTypeFilter, nFlagFilter, nOrderFilter, bCanGrowCache )
	--local enemies = self:FindUnitsInCone(
	--	caster:GetTeamNumber(),	-- nTeamNumber
	--	target:GetAbsOrigin(),	-- vCenterPos
	--	caster:GetAbsOrigin(),	-- vStartPos
	--	caster:GetAbsOrigin() + direction*distance,	-- vEndPos
	--	start_radius,	-- fStartRadius
	--	end_radius,	-- fEndRadius
	--	nil,	-- hCacheUnit
	--	DOTA_UNIT_TARGET_TEAM_ENEMY,	-- nTeamFilter
	--	DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- nTypeFilter
	--	0,	-- nFlagFilter
	--	FIND_CLOSEST,	-- nOrderFilter
	--	false	-- bCanGrowCache
	--)
	-- get cast direction and length distance
	local direction = vEndPos-vStartPos
	direction.z = 0

	local distance = direction:Length2D()
	direction = direction:Normalized()

	-- get max radius circle search
	local big_radius = distance + math.max(fStartRadius, fEndRadius)

	-- find enemies closest to primary target within max radius
	local units = FindUnitsInRadius(
		nTeamNumber,	-- int, your team number
		vCenterPos,	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		big_radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		nTeamFilter,	-- int, team filter
		nTypeFilter,	-- int, type filter
		nFlagFilter,	-- int, flag filter
		nOrderFilter,	-- int, order filter
		bCanGrowCache	-- bool, can grow cache
	)

	-- Filter within cone
	local targets = {}
	for _,unit in pairs(units) do

		-- get unit vector relative to vStartPos
		local vUnitPos = unit:GetAbsOrigin()-vStartPos

		-- get projection scalar of vUnitPos onto direction using dot-product
		local fProjection = vUnitPos.x*direction.x + vUnitPos.y*direction.y + vUnitPos.z*direction.z

		-- clamp projected scalar to [0,distance]
		fProjection = math.max(math.min(fProjection,distance),0)
		
		-- get projected vector of vUnitPos onto direction
		local vProjection = direction*fProjection

		-- calculate distance between vUnitPos and the projected vector
		local fUnitRadius = (vUnitPos - vProjection):Length2D()

		-- calculate interpolated search radius at projected vector
		local fInterpRadius = (fProjection/distance)*(fEndRadius-fStartRadius) + fStartRadius

		-- if unit is within distance, add them
		if fUnitRadius<=fInterpRadius then
			table.insert( targets, unit )
		end
	end

	return targets
end

function GetRandomPosition2D(vPosition, fRadius)
	local newPos = vPosition + Vector(1,0,0) * math.random(0-fRadius, fRadius)
	return RotatePosition(vPosition, QAngle(0,math.random(-360,360),0), newPos)
end

function CreateCustomIllusion( caster, location, duration, outgoing_damage, incoming_damage )
	local illusions = {}
	local modifyIllusion = function ( illusion )
		illusion:SetForwardVector( caster:GetForwardVector() )
		while illusion:GetLevel() < caster:GetLevel() do
			illusion:HeroLevelUp( false )
		end
		if illusion:IsRealHero() then
			illusion:SetAbilityPoints( 0 )
		end
		local abilityCount = caster:GetAbilityCount()
		for i=0,abilityCount-1 do
			local ability = caster:GetAbilityByIndex(i)
			if ability and illusion:GetAbilityByIndex(i) then
				illusion:GetAbilityByIndex(i):SetLevel( ability:GetLevel() )
			end
		end
		local eslot = nil
		for slot=0,5 do
			local iItem = illusion:GetItemInSlot(slot)
			if iItem then illusion:RemoveItem( illusion:GetItemInSlot(slot) ) end
			local item = caster:GetItemInSlot(slot)
			if item then
				illusion:AddItemByName( item:GetName() )
				if eslot and eslot~=slot then
					illusion:SwapItems( eslot, slot )
				end
			elseif not eslot then
				eslot = slot
			end
		end
		illusion:MakeIllusion()
		illusion:SetOwner( caster )
        if caster:IsRealHero() then
            illusion:SetControllableByPlayer( caster:GetPlayerID(), false ) -- (playerID, bSkipAdjustingPosition)
            illusion:SetPlayerID( caster:GetPlayerID() )
        end
		illusion:AddNewModifier(
			caster,
			self,
			"modifier_illusion",
			{
				duration = duration,
				outgoing_damage = outgoing_damage,
				incoming_damage = incoming_damage,
			}
		)
		table.insert( illusions, illusion )
	end

	-- Create unit
	local illusion = CreateUnitByNameAsync(
		caster:GetUnitName(), -- szUnitName
		location, -- vLocation,
		true, -- bFindClearSpace,
		caster, -- hNPCOwner,
		nil, -- hUnitOwner,
		caster:GetTeamNumber(), -- iTeamNumber
		modifyIllusion
	)

	return illusions
end