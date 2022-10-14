npc_dota_hero_shredder_spell6 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_shredder_spell6","heroes/npc_dota_hero_shredder/npc_dota_hero_shredder_spell6", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_shredder_spell6:OnToggle()
    if self:GetToggleState() then
        self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_shredder_spell6", {})
    else
        self:GetCaster():RemoveModifierByName("modifier_npc_dota_hero_shredder_spell6")
    end
end

modifier_npc_dota_hero_shredder_spell6 = class({})
--Classifications template
function modifier_npc_dota_hero_shredder_spell6:IsHidden()
    return false
end

function modifier_npc_dota_hero_shredder_spell6:IsDebuff()
    return false
end

function modifier_npc_dota_hero_shredder_spell6:IsPurgable()
    return false
end

function modifier_npc_dota_hero_shredder_spell6:OnCreated()
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
    self.mana = self:GetAbility():GetSpecialValueFor("mana_sec")
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    if IsClient() then
        return
    end
    self:StartIntervalThink(1)
end

function modifier_npc_dota_hero_shredder_spell6:OnIntervalThink()
    if self:GetCaster():GetMana() > 20 then
        self:GetCaster():SpendMana(self.mana, self:GetAbility())
    else
        self:GetAbility():ToggleAbility()
        return
    end
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetCaster():GetAbsOrigin(), nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_shredder/shredder_whirling_death.vpcf", PATTACH_CENTER_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControlEnt(effect_cast, 1, self:GetCaster(), PATTACH_CENTER_FOLLOW, "attach_hitloc", Vector(0,0,0), true)
	ParticleManager:SetParticleControl( effect_cast, 2, Vector( self.radius, self.radius, self.radius ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )

	EmitSoundOn( "Hero_Shredder.WhirlingDeath.Cast", self:GetCaster() )
	if #enemies > 0 then
		EmitSoundOn( "Hero_Shredder.WhirlingDeath.Damage", self:GetCaster() )
	end
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage = self.damage,
        damage_type = self:GetAbility():GetAbilityDamageType(),
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
end