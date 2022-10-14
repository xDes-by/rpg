npc_dota_hero_gyrocopter_spell6 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_gyrocopter_spell6_normal", "heroes/npc_dota_hero_gyrocopter/npc_dota_hero_gyrocopter_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_gyrocopter_spell6_explotion", "heroes/npc_dota_hero_gyrocopter/npc_dota_hero_gyrocopter_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_gyrocopter_spell6_electro", "heroes/npc_dota_hero_gyrocopter/npc_dota_hero_gyrocopter_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_gyrocopter_spell6_electro_effect", "heroes/npc_dota_hero_gyrocopter/npc_dota_hero_gyrocopter_spell6", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_gyrocopter_spell6:Precache(context)
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_jakiro.vsndevts", context )
end

function npc_dota_hero_gyrocopter_spell6:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_gyrocopter_spell6_normal"
end

function npc_dota_hero_gyrocopter_spell6:OnSpellStart()
    if self:GetCaster():HasModifier("modifier_npc_dota_hero_gyrocopter_spell6_normal") then
        self:GetCaster():RemoveModifierByName("modifier_npc_dota_hero_gyrocopter_spell6_normal")
        self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_gyrocopter_spell6_explotion", {})
    elseif self:GetCaster():HasModifier("modifier_npc_dota_hero_gyrocopter_spell6_explotion") then
        self:GetCaster():RemoveModifierByName("modifier_npc_dota_hero_gyrocopter_spell6_explotion")
        self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_gyrocopter_spell6_electro", {})
    elseif self:GetCaster():HasModifier("modifier_npc_dota_hero_gyrocopter_spell6_electro") then
        self:GetCaster():RemoveModifierByName("modifier_npc_dota_hero_gyrocopter_spell6_electro")
        self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_gyrocopter_spell6_normal", {})
    end
end

modifier_npc_dota_hero_gyrocopter_spell6_normal = class({})
--Classifications template
function modifier_npc_dota_hero_gyrocopter_spell6_normal:IsHidden()
    return false
end

function modifier_npc_dota_hero_gyrocopter_spell6_normal:IsPurgable()
    return false
end

modifier_npc_dota_hero_gyrocopter_spell6_explotion = class({})
--Classifications template
function modifier_npc_dota_hero_gyrocopter_spell6_explotion:IsHidden()
    return true
end

function modifier_npc_dota_hero_gyrocopter_spell6_explotion:IsPurgable()
    return false
end

function modifier_npc_dota_hero_gyrocopter_spell6_explotion:OnCreated()
    if IsClient() then
        return
    end
    self.damage = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster()) * 0.01 * self:GetAbility():GetSpecialValueFor("exp_damage_persent")
    self:SetStackCount(self.damage)
end

function modifier_npc_dota_hero_gyrocopter_spell6_explotion:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
        MODIFIER_PROPERTY_BASEATTACK_BONUSDAMAGE
    }
end

function modifier_npc_dota_hero_gyrocopter_spell6_explotion:GetModifierBaseAttack_BonusDamage()
    return -self:GetStackCount()
end

function modifier_npc_dota_hero_gyrocopter_spell6_explotion:GetModifierProcAttack_Feedback(data)
    local rad = self:GetAbility():GetSpecialValueFor("exp_ratius")
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, data.target:GetAbsOrigin(), nil, rad, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0, false)
    enemies = table.remove_item(enemies, data.target)
    local dmg = self:GetCaster():GetAverageTrueAttackDamage(self:GetCaster())
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage = dmg,
        damage_type = DAMAGE_TYPE_PHYSICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_jakiro/jakiro_liquid_fire_explosion.vpcf", PATTACH_ABSORIGIN_FOLLOW, data.target )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( rad, 1, 1 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	EmitSoundOn( "Hero_Jakiro.LiquidFire", data.target )		
end

modifier_npc_dota_hero_gyrocopter_spell6_electro = class({})
--Classifications template
function modifier_npc_dota_hero_gyrocopter_spell6_electro:IsHidden()
    return false
end

function modifier_npc_dota_hero_gyrocopter_spell6_electro:IsPurgable()
    return false
end

function modifier_npc_dota_hero_gyrocopter_spell6_electro:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_npc_dota_hero_gyrocopter_spell6_electro:GetModifierProcAttack_Feedback(data)
    data.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_gyrocopter_spell6_electro_effect", {starting_unit_entindex = data.target:entindex()})
    data.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_fissure_rooted", {duration = 0.1})
end

modifier_npc_dota_hero_gyrocopter_spell6_electro_effect = class({})

function modifier_npc_dota_hero_gyrocopter_spell6_electro_effect:IsHidden()		return true end
function modifier_npc_dota_hero_gyrocopter_spell6_electro_effect:IsPurgable()		return false end
function modifier_npc_dota_hero_gyrocopter_spell6_electro_effect:RemoveOnDeath()	return false end
function modifier_npc_dota_hero_gyrocopter_spell6_electro_effect:GetAttributes()	return MODIFIER_ATTRIBUTE_MULTIPLE end

function modifier_npc_dota_hero_gyrocopter_spell6_electro_effect:OnCreated(kv)
	self.static_damage	 	= self:GetAbility():GetSpecialValueFor("electro_damage")
	self.static_radius		= self:GetAbility():GetSpecialValueFor("electro_ratius")
	self.static_strikes		= self:GetAbility():GetSpecialValueFor("electro_trigers")
	self.units_affected			= {}
    self.starting_unit_entindex = kv.starting_unit_entindex
	if self.starting_unit_entindex and EntIndexToHScript(self.starting_unit_entindex) then
		self.current_unit = EntIndexToHScript(self.starting_unit_entindex)
		self.units_affected[self.current_unit] = 1
		ApplyDamage({
			victim 			= self.current_unit,
			damage 			= self.static_damage,
			damage_type		= DAMAGE_TYPE_MAGICAL,
			damage_flags 	= DOTA_DAMAGE_FLAG_NONE,
			attacker 		= self:GetCaster(),
			ability 		= self:GetAbility()
		})
		EmitSoundOn("Item.Stormcrafter.Lightning", self.current_unit)
	else
		self:Destroy()
		return
	end
	
	self.unit_counter = 0
	
	self:StartIntervalThink(0.1)
end

function modifier_npc_dota_hero_gyrocopter_spell6_electro_effect:OnIntervalThink()
	self.zapped = false
	if (self.unit_counter >= self.static_strikes and self.static_strikes > 0) or not self.zapped then
		for _, enemy in pairs(FindUnitsInRadius(self:GetCaster():GetTeamNumber(), self.current_unit:GetAbsOrigin(), nil, self.static_radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS, FIND_CLOSEST, false)) do
			if not self.units_affected[enemy] and enemy ~= self.current_unit and enemy ~= self.previous_unit then
				
				EmitSoundOn("Item.Stormcrafter.Lightning", enemy)
				self.lightning_particle = ParticleManager:CreateParticle("particles/items_fx/chain_lightning.vpcf", PATTACH_ABSORIGIN_FOLLOW, self.current_unit)
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
		
				ApplyDamage({
					victim 			= enemy,
					damage 			= self.static_damage,
					damage_type		= DAMAGE_TYPE_MAGICAL,
					damage_flags 	= DOTA_DAMAGE_FLAG_NONE,
					attacker 		= self:GetCaster(),
					ability 		= self:GetAbility()
				})
				
				break
			end
		end
		if (self.unit_counter >= self.static_strikes and self.static_strikes > 0) or not self.zapped then
			self:StartIntervalThink(-1)
			self:Destroy()
		end
	end
end
