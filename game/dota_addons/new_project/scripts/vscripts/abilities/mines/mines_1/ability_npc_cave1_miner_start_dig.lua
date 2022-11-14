ability_npc_cave1_miner_start_dig = class({})

LinkLuaModifier( "modifier_ability_npc_cave1_miner_start_dig","abilities/cave1/ability_npc_cave1_miner_start_dig", LUA_MODIFIER_MOTION_NONE )

function ability_npc_cave1_miner_start_dig:OnSpellStart()
    local pos = self:GetCursorPosition()
    self.effect_cast = ParticleManager:CreateParticle( "particles/econ/events/ti9/shovel_dig.vpcf", PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( self.effect_cast, 0, pos )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 90, 90, 90 ) )
    Timers:CreateTimer(10,function()
        CreateItemOnPositionSync(pos, CreateItem( "item_cave1_crystall", nil, nil ))
        ParticleManager:DestroyParticle(self.effect_cast, false)
    end)
end

function ability_npc_cave1_miner_start_dig:OnOwnerDied()
	MapLogic:Cave1StopCreepSpawning()
end

function ability_npc_cave1_miner_start_dig:GetIntrinsicModifierName()
    return "modifier_ability_npc_cave1_miner_start_dig"
end

modifier_ability_npc_cave1_miner_start_dig = class({})

function modifier_ability_npc_cave1_miner_start_dig:IsHidden()
    return true
end

function modifier_ability_npc_cave1_miner_start_dig:IsPurgable()
    return false
end

function modifier_ability_npc_cave1_miner_start_dig:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		--[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		--[MODIFIER_STATE_UNSELECTABLE] = true,
		--[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
		--[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_ROOTED] = true,
	}
end