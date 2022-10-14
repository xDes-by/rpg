npc_dota_hero_tinker_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_tinker_spell1", "heroes/npc_dota_hero_tinker/npc_dota_hero_tinker_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_tinker_spell1_animation", "heroes/npc_dota_hero_tinker/npc_dota_hero_tinker_spell1", LUA_MODIFIER_MOTION_NONE )

LinkLuaModifier( "modifier_npc_dota_hero_tinker_spell1_heal", "heroes/npc_dota_hero_tinker/npc_dota_hero_tinker_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_tinker_spell1_heal_effect", "heroes/npc_dota_hero_tinker/npc_dota_hero_tinker_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_tinker_spell1_mana", "heroes/npc_dota_hero_tinker/npc_dota_hero_tinker_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_tinker_spell1_mana_effect", "heroes/npc_dota_hero_tinker/npc_dota_hero_tinker_spell1", LUA_MODIFIER_MOTION_NONE )

LinkLuaModifier( "modifier_npc_dota_hero_tinker_spell1_armor", "heroes/npc_dota_hero_tinker/npc_dota_hero_tinker_spell1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_tinker_spell1_mgrez", "heroes/npc_dota_hero_tinker/npc_dota_hero_tinker_spell1", LUA_MODIFIER_MOTION_NONE )

local ModifierTable = {"modifier_npc_dota_hero_tinker_spell1_heal","modifier_npc_dota_hero_tinker_spell1_armor","modifier_npc_dota_hero_tinker_spell1_mgrez","modifier_npc_dota_hero_tinker_spell1_mana"}

function npc_dota_hero_tinker_spell1:GetChannelTime()
    return 10
end

function npc_dota_hero_tinker_spell1:OnChannelFinish(bInterrupted)
    self.mod1:Destroy()
    self.mod:Destroy()
end

function npc_dota_hero_tinker_spell1:OnSpellStart()
    self.mod1 = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_tinker_spell1", {})
    self.mod = self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_tinker_spell1_animation", {duration = 2.5})
end

modifier_npc_dota_hero_tinker_spell1_animation = class({})

function modifier_npc_dota_hero_tinker_spell1_animation:IsHidden()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_animation:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
        MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
    }
end

function modifier_npc_dota_hero_tinker_spell1_animation:GetOverrideAnimation()
    return ACT_DOTA_TAUNT
end

function modifier_npc_dota_hero_tinker_spell1_animation:GetOverrideAnimationRate()
    return 1.5
end

function modifier_npc_dota_hero_tinker_spell1_animation:GetActivityTranslationModifiers()
    return "ti10_taunt"
end


modifier_npc_dota_hero_tinker_spell1 = class({})
--Classifications template
function modifier_npc_dota_hero_tinker_spell1:IsHidden()
    return true
end

function modifier_npc_dota_hero_tinker_spell1:IsPurgable()
    return false
end

function modifier_npc_dota_hero_tinker_spell1:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_tinker_spell1:OnCreated()
    if IsClient() then
        return
    end
    self.part = ParticleManager:CreateParticle("particles/econ/items/tinker/boots_of_travel/teleport_end_bots.vpcf", PATTACH_POINT_FOLLOW, self:GetCaster())
    self.duration = self:GetAbility():GetSpecialValueFor("duration")
    self.heroes = {}
    self:StartIntervalThink(2.49)
end

function modifier_npc_dota_hero_tinker_spell1:OnDestroy()
    if IsClient() then
        return
    end
    ParticleManager:DestroyParticle(self.part, false)
end

function modifier_npc_dota_hero_tinker_spell1:OnIntervalThink()
    if self:GetCaster():IsChanneling() then
        self:GetAbility().mod = self:GetCaster():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_tinker_spell1_animation", {duration = 2.5})
	    local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetCaster():GetAbsOrigin(), nil, self:GetAbility():GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, 0, 1,false)
        table.remove_item( enemies, self:GetCaster() )
        for _,unit in pairs(self.heroes) do
            table.remove_item( enemies, unit )
        end
        if #enemies == 0 then
            if not table.has_value(self.heroes, self:GetCaster()) then
                self:GetCaster():AddNewModifier(self:GetCaster(), self:GetAbility(), table.random(ModifierTable), {duration = self.duration})
                EmitSoundOn("DOTA_Item.RepairKit.Target", self:GetCaster())
                table.insert( self.heroes,self:GetCaster() )
            else
                self:Destroy()
                self:GetAbility().mod:Destroy()
                self:GetCaster():InterruptChannel()
            end
        else
            enemies[1]:AddNewModifier(self:GetCaster(), self:GetAbility(), table.random(ModifierTable), {duration = self.duration})
            EmitSoundOn("DOTA_Item.RepairKit.Target", enemies[1])
            table.insert( self.heroes,enemies[1] )
        end
    end
end
----------------------------------------------------------
--heal
----------------------------------------------------------
modifier_npc_dota_hero_tinker_spell1_heal = class({})
--Classifications template
function modifier_npc_dota_hero_tinker_spell1_heal:IsHidden()
    return false
end

function modifier_npc_dota_hero_tinker_spell1_heal:IsDebuff()
    return false
end

function modifier_npc_dota_hero_tinker_spell1_heal:IsPurgable()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_heal:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_heal:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_heal:OnCreated()
	self.shield_particle = ParticleManager:CreateParticle("particles/econ/events/ti8/mjollnir_shield_ti8.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	self:AddParticle(self.shield_particle, false, false, -1, false, false)
end

function modifier_npc_dota_hero_tinker_spell1_heal:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_ATTACKED
    }
end

function modifier_npc_dota_hero_tinker_spell1_heal:OnAttacked(data)
    if self:GetParent() ~= data.target then 
        return
    end
    if RollPseudoRandom(10,self:GetParent()) then
        self:GetParent():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_tinker_spell1_heal_effect", {starting_unit_entindex = data.attacker:entindex() })
    end
end

modifier_npc_dota_hero_tinker_spell1_heal_effect = class({})

function modifier_npc_dota_hero_tinker_spell1_heal_effect:IsHidden()		return true end
function modifier_npc_dota_hero_tinker_spell1_heal_effect:IsPurgable()		return false end
function modifier_npc_dota_hero_tinker_spell1_heal_effect:RemoveOnDeath()	return false end
function modifier_npc_dota_hero_tinker_spell1_heal_effect:GetAttributes()	return MODIFIER_ATTRIBUTE_MULTIPLE end

function modifier_npc_dota_hero_tinker_spell1_heal_effect:OnCreated(kv)
	self.static_radius		= self:GetAbility():GetSpecialValueFor("radius")
	self.static_strikes		= self:GetAbility():GetSpecialValueFor("heal_jumps")
	self.heal_count		= self:GetAbility():GetSpecialValueFor("heal_count")
	self.units_affected			= {}
    self.starting_unit_entindex = kv.starting_unit_entindex
	if self.starting_unit_entindex and EntIndexToHScript(self.starting_unit_entindex) then
		self.current_unit = EntIndexToHScript(self.starting_unit_entindex)
		self.units_affected[self.current_unit] = 1
        self.current_unit:Heal(self.heal_count, self:GetAbility())
        SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self.current_unit, self.heal_count, nil)
	else
		self:Destroy()
		return
    end	
	self.unit_counter = 0
	self:StartIntervalThink(0.1)
	EmitSoundOn("DOTA_Item.MinotaurHorn.Cast", self.current_unit)
end

function modifier_npc_dota_hero_tinker_spell1_heal_effect:OnIntervalThink()
	self.zapped = false
	if (self.unit_counter >= self.static_strikes and self.static_strikes > 0) or not self.zapped then
		for _, enemy in pairs(FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self.current_unit:GetAbsOrigin(), nil, self.static_radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_CLOSEST, false)) do
			if not self.units_affected[enemy] and enemy ~= self.current_unit and enemy ~= self.previous_unit then
				
				self.lightning_particle = ParticleManager:CreateParticle("particles/econ/events/ti8/mjollnir_shield_ti8_f.vpcf", PATTACH_ABSORIGIN_FOLLOW, self.current_unit)
				ParticleManager:SetParticleControlEnt(self.lightning_particle, 0, self.current_unit, PATTACH_POINT_FOLLOW, "attach_hitloc", self.current_unit:GetAbsOrigin(), true)
				ParticleManager:SetParticleControlEnt(self.lightning_particle, 1, enemy, PATTACH_POINT_FOLLOW, "attach_hitloc", enemy:GetAbsOrigin(), true)
				ParticleManager:SetParticleControl(self.lightning_particle, 62, Vector(2, 0, 2))
				ParticleManager:ReleaseParticleIndex(self.lightning_particle)
				
				self.unit_counter = self.unit_counter + 1
				self.previous_unit = self.current_unit
				self.current_unit = enemy
				
				if self.units_affected[self.current_unit] then
					self.units_affected[self.current_unit]	= self.units_affected[self.current_unit] + 1
				else
					self.units_affected[self.current_unit]	= 1
				end
				
				self.zapped	= true
		
				self.current_unit:Heal(self.heal_count, self:GetAbility())
                SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self.current_unit, self.heal_count, nil)
				
				break
			end
		end
		if (self.unit_counter >= self.static_strikes and self.static_strikes > 0) or not self.zapped then
			self:StartIntervalThink(-1)
			self:Destroy()
		end
	end
end
----------------------------------------------------------
--mana
----------------------------------------------------------
modifier_npc_dota_hero_tinker_spell1_mana = class({})
--Classifications template
function modifier_npc_dota_hero_tinker_spell1_mana:IsHidden()
    return false
end

function modifier_npc_dota_hero_tinker_spell1_mana:IsDebuff()
    return false
end

function modifier_npc_dota_hero_tinker_spell1_mana:IsPurgable()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_mana:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_mana:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_mana:OnCreated()
	self.shield_particle = ParticleManager:CreateParticle("particles/econ/events/ti7/mjollnir_shield_ti7.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	self:AddParticle(self.shield_particle, false, false, -1, false, false)
end

function modifier_npc_dota_hero_tinker_spell1_mana:DeclareFunctions()
    return {
        MODIFIER_EVENT_ON_ATTACKED
    }
end

function modifier_npc_dota_hero_tinker_spell1_mana:OnAttacked(data)
    if self:GetParent() ~= data.target then 
        return
    end
    if RollPseudoRandom(10,self:GetParent()) then
        self:GetParent():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_tinker_spell1_mana_effect", {starting_unit_entindex = data.attacker:entindex()})
    end
end

modifier_npc_dota_hero_tinker_spell1_mana_effect = class({})

function modifier_npc_dota_hero_tinker_spell1_mana_effect:IsHidden()		return true end
function modifier_npc_dota_hero_tinker_spell1_mana_effect:IsPurgable()		return false end
function modifier_npc_dota_hero_tinker_spell1_mana_effect:RemoveOnDeath()	return false end
function modifier_npc_dota_hero_tinker_spell1_mana_effect:GetAttributes()	return MODIFIER_ATTRIBUTE_MULTIPLE end

function modifier_npc_dota_hero_tinker_spell1_mana_effect:OnCreated(kv)
	self.static_radius		= self:GetAbility():GetSpecialValueFor("radius")
	self.static_strikes		= self:GetAbility():GetSpecialValueFor("mana_jumps")
	self.mana_count		= self:GetAbility():GetSpecialValueFor("mana_count")
	self.units_affected			= {}
    self.starting_unit_entindex = kv.starting_unit_entindex
	if self.starting_unit_entindex and EntIndexToHScript(self.starting_unit_entindex) then
		self.current_unit = EntIndexToHScript(self.starting_unit_entindex)
		self.units_affected[self.current_unit] = 1
        self.current_unit:GiveMana(self.mana_count)
        SendOverheadEventMessage(nil, OVERHEAD_ALERT_MANA_ADD, self.current_unit, self.mana_count, nil)
	else
		self:Destroy()
		return
    end	
	self.unit_counter = 0
	self:StartIntervalThink(0.1)
	EmitSoundOn("DOTA_Item.MagicLamp.Cast", self.current_unit)
end

function modifier_npc_dota_hero_tinker_spell1_mana_effect:OnIntervalThink()
	self.zapped = false
	if (self.unit_counter >= self.static_strikes and self.static_strikes > 0) or not self.zapped then
		for _, enemy in pairs(FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self.current_unit:GetAbsOrigin(), nil, self.static_radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_CLOSEST, false)) do
			if not self.units_affected[enemy] and enemy ~= self.current_unit and enemy ~= self.previous_unit then

				self.lightning_particle = ParticleManager:CreateParticle("particles/econ/events/ti6/mjollnir_shield_ti6_f.vpcf", PATTACH_ABSORIGIN_FOLLOW, self.current_unit)
				ParticleManager:SetParticleControlEnt(self.lightning_particle, 0, self.current_unit, PATTACH_POINT_FOLLOW, "attach_hitloc", self.current_unit:GetAbsOrigin(), true)
				ParticleManager:SetParticleControlEnt(self.lightning_particle, 1, enemy, PATTACH_POINT_FOLLOW, "attach_hitloc", enemy:GetAbsOrigin(), true)
				ParticleManager:SetParticleControl(self.lightning_particle, 62, Vector(2, 0, 2))
				ParticleManager:ReleaseParticleIndex(self.lightning_particle)
				
				self.unit_counter = self.unit_counter + 1
				self.previous_unit = self.current_unit
				self.current_unit = enemy
				
				if self.units_affected[self.current_unit] then
					self.units_affected[self.current_unit]	= self.units_affected[self.current_unit] + 1
				else
					self.units_affected[self.current_unit]	= 1
				end
				
				self.zapped	= true
		
				self.current_unit:GiveMana(self.mana_count)
                SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, self.current_unit, self.mana_count, nil)
				
				break
			end
		end
		if (self.unit_counter >= self.static_strikes and self.static_strikes > 0) or not self.zapped then
			self:StartIntervalThink(-1)
			self:Destroy()
		end
	end
end
----------------------------------------------------------
--armor
----------------------------------------------------------
modifier_npc_dota_hero_tinker_spell1_armor = class({})
--Classifications template
function modifier_npc_dota_hero_tinker_spell1_armor:IsHidden()
    return false
end

function modifier_npc_dota_hero_tinker_spell1_armor:IsDebuff()
    return false
end

function modifier_npc_dota_hero_tinker_spell1_armor:IsPurgable()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_armor:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_armor:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_armor:OnCreated()
    self.armor = self:GetAbility():GetSpecialValueFor("armor_count")
    self.shield_particle = ParticleManager:CreateParticle("particles/econ/events/ti10/mjollnir_shield_ti10.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	self:AddParticle(self.shield_particle, false, false, -1, false, false)
end

function modifier_npc_dota_hero_tinker_spell1_armor:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS
    }
end

function modifier_npc_dota_hero_tinker_spell1_armor:GetModifierPhysicalArmorBonus()
    return self.armor
end
----------------------------------------------------------
--mgrez
----------------------------------------------------------
modifier_npc_dota_hero_tinker_spell1_mgrez = class({})
--Classifications template
function modifier_npc_dota_hero_tinker_spell1_mgrez:IsHidden()
    return false
end

function modifier_npc_dota_hero_tinker_spell1_mgrez:IsDebuff()
    return false
end

function modifier_npc_dota_hero_tinker_spell1_mgrez:IsPurgable()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_mgrez:RemoveOnDeath()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_mgrez:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_tinker_spell1_mgrez:OnCreated()
    self.mgrez = self:GetAbility():GetSpecialValueFor("mgrez_count")
    self.shield_particle = ParticleManager:CreateParticle("particles/econ/events/ti9/mjollnir_shield_ti9.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	self:AddParticle(self.shield_particle, false, false, -1, false, false)
end

function modifier_npc_dota_hero_tinker_spell1_mgrez:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS
    }
end

function modifier_npc_dota_hero_tinker_spell1_mgrez:GetModifierMagicalResistanceBonus()
    return self.mgrez
end