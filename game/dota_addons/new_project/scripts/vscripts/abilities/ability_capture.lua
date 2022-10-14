LinkLuaModifier( "modifier_ability_capture_lua", "abilities/ability_capture", LUA_MODIFIER_MOTION_NONE )

ability_capture_lua = class({})

function ability_capture_lua:GetChannelTime()
	return 3
end

function ability_capture_lua:OnHeroLevelUp()

end

function ability_capture_lua:GetChannelAnimation()
	return ACT_DOTA_TELEPORT
end

function ability_capture_lua:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_capture_lua", {duration = 5})
	StartSoundEvent("Outpost.Channel", self:GetCaster())
end

function ability_capture_lua:OnChannelFinish( bInterrupted )
	StopSoundEvent("Outpost.Channel", self:GetCaster())
    if not bInterrupted then
        Events:HeroSelectRoom()
        self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ready", {})
    end
end

------------------------------------------------------------------------------------------------------------------

modifier_ability_capture_lua = class({})

function modifier_ability_capture_lua:IsHidden()
    return true
end