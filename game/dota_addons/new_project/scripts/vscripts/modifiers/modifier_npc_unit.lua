LinkLuaModifier("modifier_npc_unit_aura", "modifiers/modifier_npc_unit", LUA_MODIFIER_MOTION_NONE)

if modifier_npc_unit == nil then
	modifier_npc_unit = class({})
end

-- function modifier_npc_unit:OnCreated()
    -- self:StartIntervalThink(0.1)
-- end

-- function modifier_npc_unit:OnIntervalThink(kv)
	-- if not _G.game_start then
		-- if not self.particleLeader then
			-- self.particleLeader = ParticleManager:CreateParticle( "particles/blacksmith_kit.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetCaster())

			-- ParticleManager:SetParticleControl(self.particleLeader, 0, self:GetCaster():GetAbsOrigin())
			-- ParticleManager:SetParticleControl(self.particleLeader, 1, self:GetCaster():GetAbsOrigin())
			-- ParticleManager:SetParticleControl(self.particleLeader, 2, self:GetCaster():GetAbsOrigin())		
		-- end
	-- else
		-- if self.particleLeader then
			-- ParticleManager:DestroyParticle(self.particleLeader, true)
			-- ParticleManager:ReleaseParticleIndex(self.particleLeader)
			-- self.particleLeader = nil
		-- end
	-- end
-- end

function modifier_npc_unit:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_DISABLE_AUTOATTACK,
        MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_MAGICAL,
        MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_PHYSICAL,
        MODIFIER_PROPERTY_ABSOLUTE_NO_DAMAGE_PURE,
        MODIFIER_PROPERTY_MIN_HEALTH,
    }
    return funcs
end

function modifier_npc_unit:CheckState()
	local state = {
		[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = false,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_LOW_ATTACK_PRIORITY] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_UNTARGETABLE] = true,
		[MODIFIER_STATE_UNSELECTABLE] = false,
	}
  	return state
end

function modifier_npc_unit:GetAbsoluteNoDamageMagical()
  	return 1
end

function modifier_npc_unit:GetAbsoluteNoDamagePhysical()
  	return 1
end

function modifier_npc_unit:GetAbsoluteNoDamagePure()
  	return 1
end

function modifier_npc_unit:GetMinHealth()
  	return 1
end

function modifier_npc_unit:IsHidden()
    return true
end

function modifier_npc_unit:IsAura()
  	return true
end

function modifier_npc_unit:GetModifierAura()
  	return "modifier_npc_unit_aura"
end

function modifier_npc_unit:GetAuraRadius()
  	return 250
end

function modifier_npc_unit:GetAuraSearchType()
  	return DOTA_UNIT_TARGET_HERO
end

function modifier_npc_unit:GetAuraSearchTeam()
  	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

function modifier_npc_unit:GetAuraDuration()
  	return 0.1
end

------------------------------------

if modifier_npc_unit_aura == nil then
	modifier_npc_unit_aura = class({})
end

function modifier_npc_unit_aura:IsHidden()
  	return true
end

function modifier_npc_unit_aura:OnCreated(t)
	if IsServer() then
		self.pid = self:GetParent():GetPlayerOwnerID()
		CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(self.pid),"ActivateNPC",{})
	end
end

function modifier_npc_unit_aura:OnDestroy(t)
	if IsServer() then
		CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(self.pid),"DeactivateNPC",{})
	end
end