if Events == nil then
	Events = class({})
end

function Events:Init()
	GameRules:GetGameModeEntity():SetExecuteOrderFilter(Dynamic_Wrap( self, 'GameEventsFilter' ), self)
	
	self.count = 0 -- сколько ебланов выбрали раунд 
	self.round = 0 -- стартовый показатель раунда!
	self.round_process = false
end

zones = {"dust"}--, "dust"}-- "mines", "dark", "jungle", "hell", "snow"}

function Events:GameEventsFilter(data) -- фильтр для выбора карты
    local target = EntIndexToHScript(data.entindex_target)
	local hero = EntIndexToHScript(data.units["0"])
    if target == Rules.dummy and self.round_process == false then
        if data.order_type == DOTA_UNIT_ORDER_MOVE_TO_TARGET or data.order_type == DOTA_UNIT_ORDER_ATTACK_TARGET then
			ExecuteOrderFromTable({
				UnitIndex = hero:entindex(),
				OrderType = DOTA_UNIT_ORDER_CAST_TARGET,
				AbilityIndex = hero:FindAbilityByName("ability_capture_lua"):entindex(),
				TargetIndex = target:entindex(),
				Queue = false,
			})
			return false
        end
    end
    return true
end

function Events:HeroSelectRoom() -- выбор карты
	self.count = self.count + 1
	ParticleManager:SetParticleControl(Rules.dummy.pfx, 1, Vector( 0, self.count, 0 ))
	if self.count == Rules:PlayersInGameCount() then
		map_name = table.random(zones)
		table.remove_item(zones, map_name)
		self.round_process = true
		self.round = self.round + 1
		Events:MoveToZone(map_name)
		Events:RandomUnlockZone(map_name)
		self.count = 0
		ParticleManager:SetParticleControl( Rules.dummy.pfx, 1, Vector( 0, self.count, 0 ) )
		if #zones == 0 then
			Rules.dummy:ForceKill(false)
		end
	end
end

function Events:MoveToZone(map_name) -- телепорт между картами
	for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
		if PlayerResource:IsValidPlayerID(nPlayerID) then
			local unit = PlayerResource:GetSelectedHeroEntity( nPlayerID )
			if not unit:IsAlive() then 
				unit:RespawnHero(false, false)
				unit:SetHealth( unit:GetMaxHealth() )
				unit:SetMana( unit:GetMaxMana() )
			end
			unit:AddNewModifier(unit, nil, "modifier_selector", {})
			unit:EmitSound("Portal.Loop_Appear")
			teleport_particle = ParticleManager:CreateParticle( "particles/econ/items/tinker/boots_of_travel/teleport_start_bots.vpcf", PATTACH_ABSORIGIN_FOLLOW, unit)
			Timers:CreateTimer(3, function()
			unit:RemoveModifierByName("modifier_ready")
				local point = Entities:FindByName( nil, map_name.."_point"):GetAbsOrigin()
				FindClearSpaceForUnit(unit, point + RandomVector( RandomInt( 100, 100 )), false)
				unit:Stop()
				unit:StopSound("Portal.Loop_Appear")
				unit:RemoveModifierByName("modifier_selector")
				ParticleManager:DestroyParticle( teleport_particle, false)
				PlayerResource:SetCameraTarget(unit:GetPlayerOwnerID(), unit)
				Timers:CreateTimer(0.1, function()
					PlayerResource:SetCameraTarget(unit:GetPlayerOwnerID(), nil)
				return nil
				end)
			end)
		end
	end
end

function Events:spawn_boss(map_name) -- спавн босса на карте!
	local hRelay = Entities:FindByName( nil, map_name.."_logic_boss" )
	hRelay:Trigger(nil,nil)	
	local point = Entities:FindByName( nil, map_name.."_boss_spawn"):GetAbsOrigin()
	if point then
		local unit = CreateUnitByName("npc_"..map_name.."_boss", point, true, nil, nil, DOTA_TEAM_BADGUYS)
		Rules:unit_settings(unit, "boss", nil, 1, 1, 100)
	end
end

function Events:RandomUnlockZone(map_name)
	local zone = RandomInt(2,2)	--выбор комнаны на карте!
	if map_name == "forest" then
		if zone == 1 then
			forest_1:Init()
		else
			forest_:Init()
		end	
	end	
	if map_name == "dust" then
		if zone == 1 then
			dust_1:Init()
		else
			dust_2:Init()
		end	
	end	
	if map_name == "mines" then
		if zone == 1 then
			mines_1:Init()
		else
			mines_2:Init()
		end	
	end	
	if map_name == "dark" then
		if zone == 1 then
			dark_1:Init()
		else
			dark_2:Init()
		end
	end	
	if map_name == "jungle" then
		if zone == 1 then
			jungle_1:Init()
		else
			jungle_2:Init()
		end
	end	
	if map_name == "hell" then
		if zone == 1 then
			hell_1:Init()
		else
			hell_2:Init()
		end
	end	
	if map_name == "snow" then
		if zone == 1 then
			snow_1:Init()
		else
			snow_2:Init()
		end		
	end
end