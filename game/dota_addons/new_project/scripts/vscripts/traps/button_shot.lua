local triggerActive = true

function OnStartTouch(trigger)
	local triggerName = thisEntity:GetName()
	local team = trigger.activator:GetTeam()
	local level = trigger.activator:GetLevel()
	if not triggerActive then
		return
	end
	
	triggerActive = false
	local button = triggerName .. "_button"

	local model = triggerName .. "_model"
	local npc = Entities:FindByName( nil, triggerName ..  "_npc")
	local target = Entities:FindByName( nil, triggerName .. "_target" )
	if npc ~= nil then
		local venomTrap = npc:FindAbilityByName("arrow_shot")
		npc:SetContextThink( "ResetButtonModel", function() ResetButtonModel() end, 0.5 )
		npc:CastAbilityOnPosition(target:GetOrigin(), venomTrap, -1 )
		DoEntFire( model, "SetAnimation", "fang_attack", .4, self, self )
	end

	DoEntFire( button, "SetAnimation", "ancient_trigger001_down", 0, self, self )
	DoEntFire( button, "SetAnimation", "ancient_trigger001_down_idle", .35, self, self )
	DoEntFire( button, "SetAnimation", "ancient_trigger001_up", 0.5, self, self )
	DoEntFire( button, "SetAnimation", "ancient_trigger001_idle", 0.6, self, self )

	local heroIndex = trigger.activator:GetEntityIndex()
	local heroHandle = EntIndexToHScript(heroIndex)
	npc.KillerToCredit = heroHandle
end

function OnEndTouch(trigger)
	local triggerName = thisEntity:GetName()
	local team = trigger.activator:GetTeam()
	local heroIndex = trigger.activator:GetEntityIndex()
	local heroHandle = EntIndexToHScript(heroIndex)
end

function ResetButtonModel()
	triggerActive = true
end