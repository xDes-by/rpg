if forest_1 == nil then
	forest_1 = class({})
end

function forest_1:Init()
	self.listen_cut = ListenToGameEvent("tree_cut", Dynamic_Wrap(self, 'On_tree_cut'), self)
	self.listen_kill = ListenToGameEvent("entity_killed", Dynamic_Wrap( self, 'OnEntityKilled' ), self )
	forest_1:spawn_trees()
	forest_1:start_quest()
	forest_1:spawn_creeps()
	forest_1.count = 14
end

function forest_1:start_quest()
	Timers:CreateTimer(3.5, function() --таймер для старта квеста после телепортации!
		local hRelay = Entities:FindByName( nil, "forest_1_logic" )
		hRelay:Trigger(nil,nil)	
		local newItem = CreateItem( "item_quelling_blade", nil, nil )
		local drop = CreateItemOnPositionForLaunch( hRelay:GetAbsOrigin() + RandomVector( RandomInt( 50, 300 )), newItem )
		Quest:MapActivate('forest_1')
	end)
end

function forest_1:OnEntityKilled(keys)
	local KilledUnit = EntIndexToHScript( keys.entindex_killed )
	local killerEntity = EntIndexToHScript( keys.entindex_attacker )
	if KilledUnit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
		if KilledUnit:GetUnitName() == "npc_forest_1_boss" then
			Quest:UpdateCounter('forest_1', 2)
			StopListeningToGameEvent(self.listen_kill)
		end
	end				
end 

function forest_1:On_tree_cut(keys)
	local tree_position = Vector(keys.tree_x,keys.tree_y,0)
	local trees = GridNav:GetAllTreesAroundPoint(tree_position, 10, false)
    for _,t in pairs(forest_1.all_trees) do
        local pos = t:GetAbsOrigin()
        if pos.x == tree_position.x and pos.y == tree_position.y then
			ParticleManager:DestroyParticle(t.pfx, false)
			ParticleManager:ReleaseParticleIndex(t.pfx)
			forest_1:spawn_treants(pos)
			Quest:UpdateCounter('forest_1', 1)
			forest_1.count = forest_1.count - 1
			if forest_1.count == 0 then
				StopListeningToGameEvent(self.listen_cut)
			end
            break
        end
    end
end

function forest_1:spawn_trees()
	self.all_trees = {}
	for i = 1, 14 do
		local point = Entities:FindByName(nil, "tree_point_"..i):GetAbsOrigin()
		local trees = GridNav:GetAllTreesAroundPoint(point, 300, false)
		local tree = trees[RandomInt(1,#trees)] 
		self.tree = tree
		table.insert( self.all_trees, self.tree )
		local unit = CreateUnitByName("npc_dummy_unit", self.tree:GetAbsOrigin(), true, nil, nil, DOTA_TEAM_GOODGUYS)
		unit:AddNewModifier(unit, nil, "modifier_dummy", {})
		self.tree.pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_treant/treant_livingarmor.vpcf", PATTACH_ABSORIGIN_FOLLOW, unit)
		ParticleManager:SetParticleControl(self.tree.pfx, 1, self.tree:GetAbsOrigin())
	end
end

function forest_1:spawn_treants(position)
	for i = 1, 4 do
		local unit = CreateUnitByName("npc_forest_1_treant_small", position + RandomVector( RandomInt( 100, 500 )), true, nil, nil, DOTA_TEAM_BADGUYS)
		Rules:unit_settings(unit, "creep", "mini", 30, 104, 100)
		Rules:SetAbilityLevel(unit)
		GridNav:DestroyTreesAroundPoint( unit:GetOrigin(), 200, true )
	end
	
	local unit = CreateUnitByName("npc_forest_1_treant_big", position + RandomVector( RandomInt( 50, 400 )), true, nil, nil, DOTA_TEAM_BADGUYS)
	Rules:unit_settings(unit, "creep", "big", 30, 104, 100)
	Rules:SetAbilityLevel(unit)
	GridNav:DestroyTreesAroundPoint( unit:GetOrigin(), 200, true )
end

function forest_1:spawn_creeps()
	local count = 0
	Timers:CreateTimer(0, function()
	if count < 16 then
		count = count + 1
		local point = Entities:FindByName( nil, "forest_1_creep_spawn_"..count):GetAbsOrigin()
		if count % 2 == 0 then  
			for i = 1, 4 do
				if i == 1 then 
					local unit = CreateUnitByName("npc_forest_creep_big_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
					Rules:unit_settings(unit, "creep", "big", 30, 104, 100)
					Rules:SetAbilityLevel(unit)
				else	
					local unit = CreateUnitByName("npc_forest_creep_mini_1", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
					Rules:unit_settings(unit, "creep", "mini", 30, 104, 100)
					Rules:SetAbilityLevel(unit)
				end	
			end
		else
			for i = 1, 4 do
				if i == 1 then 
					local unit = CreateUnitByName("npc_forest_creep_big_2", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
					Rules:unit_settings(unit, "creep", "big", 30, 104, 100)
					Rules:SetAbilityLevel(unit)
				else	
					local unit = CreateUnitByName("npc_forest_creep_mini_2", point + RandomVector( RandomInt( 50, 350 )), true, nil, nil, DOTA_TEAM_BADGUYS)
					Rules:unit_settings(unit, "creep", "mini", 30, 104, 100)
					Rules:SetAbilityLevel(unit)
				end	
			end
		end	
		return 0.1
	else
		Rules:clear(count, "forest_1_creep_spawn_")
		return nil
		end
	end)
end