if dust_1 == nil then
	dust_1 = class({})
end

function dust_1:Init()
	_G.dust_1_buttonActiveCount = 0
	_G.dust_1_start_quest_logic = false 
	dust_1:start_quest()
	dust_1:spawn_boxes()
end

function dust_1:start_quest()
	Timers:CreateTimer(3.5, function()
		local hRelay = Entities:FindByName( nil, "dust_1_logic" )
		hRelay:Trigger(nil,nil)	
		Quest:MapActivate('dust_1')
	end)
end

function dust_1:spawn_boxes()
	local point = Entities:FindByName( nil, "trap_point"):GetAbsOrigin()
	for i = 1, 4 - Rules:PlayersInGameCount() do
		local box = CreateUnitByName("npc_dota_crate", point + RandomVector( RandomInt( 50, 450 )), true, nil, nil, DOTA_TEAM_BADGUYS)
	end
end

local buttonActive = true

function OnStartTouch(trigger)
	if not _G.dust_1_start_quest_logic then
		local triggerName = thisEntity:GetName()
		if not buttonActive then
			return
		end

		buttonActive = false
		local button = triggerName .. "_button"
		_G.dust_1_buttonActiveCount = _G.dust_1_buttonActiveCount + 1 
		
		DoEntFire( button, "SetAnimation", "ancient_trigger001_down", 0, self, self )
		DoEntFire( button, "SetAnimation", "ancient_trigger001_down_idle", .35, self, self )

		local heroIndex = trigger.activator:GetEntityIndex()
		local heroHandle = EntIndexToHScript(heroIndex)
		
		if _G.dust_1_buttonActiveCount == 4 then
			_G.dust_1_start_quest_logic = true
			Quest:UpdateCounter('dust_1', 1)
			Rules:add_trap_reward()
			
			for i = 1, 20 do
			local point = Entities:FindByName( nil, i.."_venom_trap_npc")
			local point2 = Entities:FindByName( nil, i.."_venom_trap_target")
				if point and point2 then
					UTIL_Remove( point )
					UTIL_Remove( point2 )
				end
			end	
		
			for _, i in pairs(Entities:FindAllByModel( "models/gameplay/breakingcrate_dest.vmdl")) do
				i:ForceKill(false)
			end			
			EmitGlobalSound("Dungeon.SmashCrateShort")
		end
	end
end

function OnEndTouch(trigger)
	local triggerName = thisEntity:GetName()
	local heroIndex = trigger.activator:GetEntityIndex()
	local heroHandle = EntIndexToHScript(heroIndex)
	buttonActive = true
	_G.dust_1_buttonActiveCount = _G.dust_1_buttonActiveCount - 1 
	
	local button = triggerName .. "_button"	
	DoEntFire( button, "SetAnimation", "ancient_trigger001_up", 0.5, self, self )
	DoEntFire( button, "SetAnimation", "ancient_trigger001_idle", 0.6, self, self )
end