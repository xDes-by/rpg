ability_npc_boss_gaveyard2_spell4 = class({})

LinkLuaModifier("modifier_ability_npc_boss_gaveyard2_spell4", "abilities/gaveyard2/ability_npc_boss_gaveyard2_spell4", LUA_MODIFIER_MOTION_NONE)


function ability_npc_boss_gaveyard2_spell4:GetChannelTime()
    return 10
end

function ability_npc_boss_gaveyard2_spell4:GetChannelAnimation()
    return ACT_DOTA_CHANNEL_ABILITY_4
end

function ability_npc_boss_gaveyard2_spell4:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_gaveyard2_spell4", {duration = 10})
    EmitSoundOn("Hero_DeathProphet.Exorcism.Cast", self:GetCaster())
    EmitSoundOn("Hero_DeathProphet.Exorcism", self:GetCaster())
end

function ability_npc_boss_gaveyard2_spell4:OnChannelFinish()
    StopSoundOn("Hero_DeathProphet.Exorcism", self:GetCaster())
end

modifier_ability_npc_boss_gaveyard2_spell4 = class({})
--Classifications template
function modifier_ability_npc_boss_gaveyard2_spell4:IsHidden()
    return true
end

function modifier_ability_npc_boss_gaveyard2_spell4:IsPurgable()
    return false
end

function modifier_ability_npc_boss_gaveyard2_spell4:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_gaveyard2_spell4:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_gaveyard2_spell4:OnCreated()
    self.startpos = self:GetCaster():GetAbsOrigin()
    self.AllUnits = {}
    self.thinker = 1
    self.AllGhostSpawned = false
    self.forvard = self:GetCaster():GetForwardVector() * 500
    if IsClient() then
        return
    end
    self.pos = 0
    self:StartIntervalThink(0.5)
    self:OnIntervalThink()
end

function modifier_ability_npc_boss_gaveyard2_spell4:OnDestroy()
    if IsClient() then
        return
    end
    for _,unit in pairs(self.AllUnits) do
        local pos = unit:GetAbsOrigin()
        local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, pos, nil, 300, DOTA_UNIT_TARGET_TEAM_ENEMY,DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
        for _,target in pairs(enemies) do
            ApplyDamage({victim = unit,
            damage = self:GetAbility():GetSpecialValueFor("damage"),
            damage_type = self:GetAbility():GetAbilityDamageType(),
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            attacker = self:GetCaster(),
            ability = self:GetAbility()})
        end
        local pfx = ParticleManager:CreateParticle("particles/econ/items/leshrac/leshrac_tormented_staff_retro/leshrac_split_retro_groundflash_lines_tormented.vpcf", PATTACH_POINT, unit)
        Timers:CreateTimer(1,function()
            UTIL_Remove(unit)
        end)
    end
end

function modifier_ability_npc_boss_gaveyard2_spell4:OnIntervalThink()
    if self.AllGhostSpawned then
        self.thinker = self.thinker + 1 
        for num,unit in pairs(self.AllUnits) do
            if num ~= 6 then
                local pos = self.AllUnits[num + 1]:GetAbsOrigin()
                local direction = pos - unit:GetAbsOrigin() 
                unit:FaceTowards(pos)
                local dis = direction:Length2D()
                unit:AddNewModifier(self:GetCaster(), self, "modifier_simply_motion_controll", {
                x = direction.x, y = direction.y, r = dis, s = dis*3})
            else
                local pos = self.AllUnits[1]:GetAbsOrigin()
                local direction = pos - unit:GetAbsOrigin() 
                unit:FaceTowards(pos)
                local dis = direction:Length2D()
                unit:AddNewModifier(self:GetCaster(), self, "modifier_simply_motion_controll", {
                x = direction.x, y = direction.y, r = dis, s = dis*3})
            end
        end
        return
    end
    if #self.AllUnits <= 5 then
        local unit = CreateUnitByName("npc_boss_gaveyard2_spell4_ghost", self.startpos, true, nil, nil, DOTA_TEAM_BADGUYS )
        table.insert( self.AllUnits, unit )
        self.pos = RotatePosition( Vector(0,0,0), QAngle( 0, 60 * #self.AllUnits, 0 ), self.forvard ) + self.startpos
        local direction = self.pos - self.startpos
        local dis = direction:Length2D()
        unit:SetForwardVector(direction)
        unit:AddNewModifier(self:GetCaster(), self, "modifier_simply_motion_controll", {
        x = direction.x, y = direction.y, r = dis, s = dis*2.3})
    elseif #self.AllUnits == 6 then
        self.AllGhostSpawned = true
        self:StartIntervalThink(0.3)
    end
end

function modifier_ability_npc_boss_gaveyard2_spell4:DeclareFunctions()
    return {
        
    }
end

function modifier_ability_npc_boss_gaveyard2_spell4:CheckState()
   return {
    	[MODIFIER_STATE_INVULNERABLE] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		--[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
		--[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
		[MODIFIER_STATE_ATTACK_IMMUNE] = true,
		[MODIFIER_STATE_DISARMED] = true,
		--[MODIFIER_STATE_ROOTED] = true,
    }
end

