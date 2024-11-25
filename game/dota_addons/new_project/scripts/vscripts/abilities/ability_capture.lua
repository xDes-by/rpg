ability_capture_lua = class({})

function ability_capture_lua:GetChannelTime()
	return 3
end

function ability_capture_lua:GetChannelAnimation()
	return ACT_DOTA_TELEPORT
end

function ability_capture_lua:CastFilterResultLocation(pos)
	self.pos = pos
end

function ability_capture_lua:OnSpellStart(keys)
	StartSoundEvent("Outpost.Channel", self:GetCaster())
end

function ability_capture_lua:OnChannelFinish( bInterrupted )
	if not bInterrupted then
		local items_on_the_ground_name = Entities:FindAllByNameWithin("item_tombstone", self.pos, 200)
		for _,item in pairs(items_on_the_ground_name) do
			if item then
				local hero = item:GetPurchaser()
				hero:RespawnHero(false, false)
				hero:SetAbsOrigin( self.pos )
				FindClearSpaceForUnit(hero, self.pos, false) 
				hero:Stop()
				hero:RemoveModifierByName("modifier_fountain_invulnerability")
				UTIL_Remove(item_ground)
			end
		end
	end
	StopSoundEvent("Outpost.Channel", self:GetCaster())
end