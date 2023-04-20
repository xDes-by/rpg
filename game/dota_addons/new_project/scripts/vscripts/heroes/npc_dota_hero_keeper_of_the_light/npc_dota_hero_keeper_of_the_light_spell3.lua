LinkLuaModifier("modifier_npc_dota_hero_keeper_of_the_light_spell3", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell3", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_npc_dota_hero_keeper_of_the_light_spell3_debuff", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell3", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_keeper_dummy", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell3", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_wall_hp", "heroes/npc_dota_hero_keeper_of_the_light/npc_dota_hero_keeper_of_the_light_spell3", LUA_MODIFIER_MOTION_NONE)

npc_dota_hero_keeper_of_the_light_spell3=class({})

function npc_dota_hero_keeper_of_the_light_spell3:OnSpellStart()
    local caster = self:GetCaster()
	local front = self:GetCaster():GetForwardVector():Normalized()
	local pos = self:GetCaster():GetOrigin() + front * 150
	local pos_spawn = self:GetCaster():GetOrigin() + front * 50
	
    local duration = self:GetSpecialValueFor("duration") 
    EmitSoundOn( "Hero_Dark_Seer.Wall_of_Replica_Start", caster )
		
    CreateModifierThinker(caster, self, "modifier_npc_dota_hero_keeper_of_the_light_spell3", {duration = duration}, pos, caster:GetTeamNumber(), false)
end

-----------------------------------------------------------------------------------------

modifier_npc_dota_hero_keeper_of_the_light_spell3 = class({})

function modifier_npc_dota_hero_keeper_of_the_light_spell3:IsHidden() 			
    return true 
end

function modifier_npc_dota_hero_keeper_of_the_light_spell3:IsPurgable() 			
    return false 
end

function modifier_npc_dota_hero_keeper_of_the_light_spell3:OnCreated() 
    self.caster = self:GetCaster()
	local width = self:GetAbility():GetSpecialValueFor("width") / 2
	local hp = self:GetAbility():GetSpecialValueFor("hp")/100
    self.wh = 200
    if IsServer() then 
        self.pos = self:GetParent():GetAbsOrigin()
		
		self.wall_creep = CreateUnitByName("npc_dummy_unit", self.pos, false, self:GetCaster(), self:GetCaster(), self:GetCaster():GetTeamNumber())
		self.wall_creep:SetPhysicalArmorBaseValue(self.caster:GetPhysicalArmorBaseValue())
		self.wall_creep:SetMaxHealth(self.caster:GetMaxHealth()*hp)
		self.wall_creep:SetBaseMaxHealth(self.caster:GetBaseMaxHealth()*hp)
		self.wall_creep:SetHealth(self.caster:GetMaxHealth()*hp)	
		self.wall_creep:AddNewModifier(self:GetCaster(),self,"modifier_keeper_dummy",{} )
		
		self:GetCaster():AddNewModifier(self.wall_creep, nil, "modifier_wall_hp", {}):SetStackCount(self.wall_creep:GetHealth())
		
		
        self.start_pos = self.pos + self.caster:GetRightVector() * width
        self.end_pos = self.pos + self.caster:GetRightVector() * -width
		
		local front = self.caster:GetForwardVector():Normalized()
		local pos_find = self:GetCaster():GetOrigin() + front * 350
		
		self.start_pos_find = pos_find + self.caster:GetRightVector() * width
        self.end_pos_find = pos_find + self.caster:GetRightVector() * -width
		
        local P = ParticleManager:CreateParticle("particles/units/heroes/hero_dark_seer/dark_seer_wall_of_replica.vpcf", PATTACH_WORLDORIGIN, nil)
        ParticleManager:SetParticleControl(P, 0, self.start_pos)
        ParticleManager:SetParticleControl(P, 1, self.end_pos)
        ParticleManager:SetParticleControl(P, 2, Vector(1,1,0))
        ParticleManager:SetParticleControl(P, 60, Vector(218,250,255))
        ParticleManager:SetParticleControl(P, 61, Vector(1,0,0))
        self:AddParticle(P, false, false, -1, false, false )   
        self:OnIntervalThink()
        self:StartIntervalThink(FrameTime())
    end
end

function modifier_npc_dota_hero_keeper_of_the_light_spell3:OnDestroy()
	if not IsServer() then return end
	if self.wall_creep:IsAlive() then
		self.wall_creep:ForceKill(false)
	end
end

function modifier_npc_dota_hero_keeper_of_the_light_spell3:OnIntervalThink()
	if self.wall_creep:IsAlive() then
		local enemies = FindUnitsInLine(self.caster:GetTeamNumber(),  self.start_pos_find, self.end_pos_find, self.caster, self.wh, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE)
		if #enemies>0 then 
		for _,enemy in pairs(enemies) do
				if not enemy:IsMagicImmune() then
					enemy:AddNewModifier(self.caster, self, "modifier_npc_dota_hero_keeper_of_the_light_spell3_debuff", { duration = 0.1})
					if enemy:HasModifier("modifier_npc_dota_hero_keeper_of_the_light_spell3_debuff") then 
						enemy:SetForceAttackTarget(self.wall_creep)
						enemy:MoveToTargetToAttack(self.wall_creep)
					else
						enemy:SetForceAttackTarget( nil )
						enemy:MoveToTargetToAttack( nil )
					end
					
				end 
			end
		end
	else
		self:Destroy()
		self:StartIntervalThink(-1)
	end
end

------------------------------------------

modifier_wall_hp = class({})

function modifier_wall_hp:IsHidden()
    return false
end

function modifier_wall_hp:IsPurgable()
    return false
end

function modifier_wall_hp:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

function modifier_wall_hp:OnCreated()
	self:StartIntervalThink(FrameTime())
end

function modifier_wall_hp:OnIntervalThink()
	if not self:GetCaster() or self:GetCaster():GetHealth() <= 0 then
		self:Destroy()
	else
		self:SetStackCount(self:GetCaster():GetHealth())
	end
end

------------------------------------------

modifier_keeper_dummy = class({})

function modifier_keeper_dummy:IsHidden()
    return true
end

function modifier_keeper_dummy:IsPurgable()
    return false
end

function modifier_keeper_dummy:CheckState()
	local state = {
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
		[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
		[MODIFIER_STATE_FLYING_FOR_PATHING_PURPOSES_ONLY] = true,
	}
	return state
end

------------------------------------------

modifier_npc_dota_hero_keeper_of_the_light_spell3_debuff = class({})

function modifier_npc_dota_hero_keeper_of_the_light_spell3_debuff:IsHidden()
	return true
end

function modifier_npc_dota_hero_keeper_of_the_light_spell3_debuff:IsDebuff()
	return true
end

function modifier_npc_dota_hero_keeper_of_the_light_spell3_debuff:IsStunDebuff()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell3_debuff:IsPurgable()
	return false
end

function modifier_npc_dota_hero_keeper_of_the_light_spell3_debuff:OnRemoved()
	if IsServer() then
		self:GetParent():SetForceAttackTarget( nil )
	end
end

function modifier_npc_dota_hero_keeper_of_the_light_spell3_debuff:CheckState()
	local state = {
		[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
	}
	return state
end