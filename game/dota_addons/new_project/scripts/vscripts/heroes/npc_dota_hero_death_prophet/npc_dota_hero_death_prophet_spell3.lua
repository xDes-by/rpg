npc_dota_hero_death_prophet_spell3 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_death_prophet_spell3","heroes/npc_dota_hero_death_prophet/npc_dota_hero_death_prophet_spell3", LUA_MODIFIER_MOTION_BOTH )
LinkLuaModifier( "modifier_npc_dota_hero_death_prophet_spell3_slow","heroes/npc_dota_hero_death_prophet/npc_dota_hero_death_prophet_spell3", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_death_prophet_spell3:CreateGhost(unit)
	local ghost = CreateUnitByName("npc_boss_gaveyard2_spell4_ghost", self:GetCaster():GetAbsOrigin(), true, nil, nil, DOTA_TEAM_GOODGUYS )
    local direction = unit:GetAbsOrigin() - self:GetCaster():GetAbsOrigin()
    direction.z = 0
    local dis = direction:Length2D()
    ghost.IsReturn = true
    ghost:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_death_prophet_spell3", {
    s = dis/2, target = unit:entindex()})
end

modifier_npc_dota_hero_death_prophet_spell3 = class({})

function modifier_npc_dota_hero_death_prophet_spell3:IsHidden()
	return true
end

function modifier_npc_dota_hero_death_prophet_spell3:IsPurgable()
	return false
end

function modifier_npc_dota_hero_death_prophet_spell3:OnCreated( kv )
	if IsServer() then
        self.target = EntIndexToHScript(kv.target)
		self.speed = kv.s
        
		if self:ApplyHorizontalMotionController() == false then
			self:Destroy()
		end
	end
end

function modifier_npc_dota_hero_death_prophet_spell3:OnRefresh( kv )
	if IsServer() then
		-- references
        self.target = EntIndexToHScript(kv.target)
		self.speed = kv.s
		if self:ApplyHorizontalMotionController() == false then 
			self:Destroy()
		end
	end	
end

function modifier_npc_dota_hero_death_prophet_spell3:OnDestroy( kv )
	if IsServer() then
        self:GetParent():InterruptMotionControllers( true )
        ApplyDamage({victim = self.target,
        damage = self:GetAbility():GetSpecialValueFor("damage"),
        damage_type = self:GetAbility():GetAbilityDamageType(),
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
	    SendOverheadEventMessage(nil, OVERHEAD_ALERT_BONUS_SPELL_DAMAGE, self.target, self:GetAbility():GetSpecialValueFor("damage"), nil)
        self.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_death_prophet_spell3_slow", {duration = self:GetAbility():GetSpecialValueFor("slow_dur")})
        UTIL_Remove(self:GetParent())
	end
end

function modifier_npc_dota_hero_death_prophet_spell3:UpdateHorizontalMotion( me, dt )
    if self.target:IsAlive() then
        local pos = self:GetParent():GetOrigin()
        local tpos = self.target:GetOrigin()
        if (pos - tpos):Length2D() > 50 then
            local direction = self:UpdateDirection()
            self:GetParent():FaceTowards(tpos)
            local target = pos + direction * (self.speed*dt)
            self:GetParent():SetOrigin( target )
        else
            self:Destroy()
        end
    else
        self:Destroy()
    end
end

function modifier_npc_dota_hero_death_prophet_spell3:OnHorizontalMotionInterrupted()
	if IsServer() then
		self:Destroy()
	end
end

function modifier_npc_dota_hero_death_prophet_spell3:UpdateDirection()
    direction = (self.target:GetAbsOrigin() - self:GetParent():GetAbsOrigin()):Normalized()
    direction.z = 0
    return direction
end

modifier_npc_dota_hero_death_prophet_spell3_slow = class({})
--Classifications template
function modifier_npc_dota_hero_death_prophet_spell3_slow:IsHidden()
    return false
end

function modifier_npc_dota_hero_death_prophet_spell3_slow:IsDebuff()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell3_slow:IsPurgable()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell3_slow:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell3_slow:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_death_prophet_spell3_slow:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE
    }
end

function modifier_npc_dota_hero_death_prophet_spell3_slow:GetModifierMoveSpeedBonus_Percentage()
    return self:GetAbility():GetSpecialValueFor("slow_pers")
end