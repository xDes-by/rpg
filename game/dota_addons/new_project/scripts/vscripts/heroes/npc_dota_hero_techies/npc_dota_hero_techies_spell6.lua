npc_dota_hero_techies_spell6 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_techies_spell6_spawn", "heroes/npc_dota_hero_techies/npc_dota_hero_techies_spell6", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_npc_dota_hero_techies_spell6_explotion", "heroes/npc_dota_hero_techies/npc_dota_hero_techies_spell6", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_techies_spell6:GetChannelTime()
    return 5
end

function npc_dota_hero_techies_spell6:OnSpellStart()
    self.unit = CreateUnitByName("npc_npc_dota_hero_techies_spell6_mine", self:GetCursorPosition(), true, nil, nil, DOTA_TEAM_GOODGUYS )
    self.unit:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_techies_spell6_spawn", {duration = 4.9})
end

modifier_npc_dota_hero_techies_spell6_spawn = class({})
--Classifications template
function modifier_npc_dota_hero_techies_spell6_spawn:IsHidden()
    return true
end

function modifier_npc_dota_hero_techies_spell6_spawn:IsPurgable()
    return false
end

function modifier_npc_dota_hero_techies_spell6_spawn:OnCreated()
    self.scale = 10
    if IsClient() then
        return
    end
    self:StartIntervalThink(0.03)
end

function modifier_npc_dota_hero_techies_spell6_spawn:OnIntervalThink()
    self.scale = self.scale + 1
    if not self:GetCaster():IsChanneling() then
        self:GetAbility().unit:ForceKill(false)
    end
end

function modifier_npc_dota_hero_techies_spell6_spawn:OnDestroy()
    if IsClient() then
        return
    end
    if self:GetCaster():IsChanneling() then
        self:GetParent():AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_npc_dota_hero_techies_spell6_explotion", {duration = 3, scale = self.scale})
    end
end

function modifier_npc_dota_hero_techies_spell6_spawn:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MODEL_SCALE
    }
end

function modifier_npc_dota_hero_techies_spell6_spawn:GetModifierModelScale()
    return self.scale
end

modifier_npc_dota_hero_techies_spell6_explotion = class({})
--Classifications template
function modifier_npc_dota_hero_techies_spell6_explotion:IsHidden()
    return false
end

function modifier_npc_dota_hero_techies_spell6_explotion:IsDebuff()
    return false
end

function modifier_npc_dota_hero_techies_spell6_explotion:IsPurgable()
    return false
end

function modifier_npc_dota_hero_techies_spell6_explotion:DestroyOnExpire()
    return true
end

function modifier_npc_dota_hero_techies_spell6_explotion:OnCreated(kv)
    self.scale = kv.scale
    self.time = 3
    self:StartIntervalThink(0.5)
end

function modifier_npc_dota_hero_techies_spell6_explotion:OnIntervalThink()
    self.time = self.time - 0.5
	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_alchemist/alchemist_unstable_concoction_timer.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( 1, self.time, 1 ) )
	ParticleManager:SetParticleControl( effect_cast, 2, Vector( 2, 0, 0 ) )

	if self.time<1 then
		ParticleManager:SetParticleControl( effect_cast, 2, Vector( 1, 0, 0 ) )
	end

	ParticleManager:ReleaseParticleIndex( effect_cast )
end

function modifier_npc_dota_hero_techies_spell6_explotion:OnDestroy()
    if IsClient() then
        return
    end
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetParent():GetAbsOrigin(), nil, self:GetAbility():GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_BOTH, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        if unit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
            ApplyDamage({victim = unit,
            damage =  self:GetAbility():GetSpecialValueFor("damage"),
            damage_type = self:GetAbility():GetAbilityDamageType(),
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            attacker = self:GetCaster(),
            ability = self:GetAbility()})
        else
            ApplyDamage({victim = unit,
            damage =  self:GetAbility():GetSpecialValueFor("damage") / 2,
            damage_type = self:GetAbility():GetAbilityDamageType(),
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            attacker = self:GetCaster(),
            ability = self:GetAbility()})
        end
    end
    local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_techies/techies_suicide.vpcf", PATTACH_ABSORIGIN, self:GetParent())
    ParticleManager:SetParticleControl(pfx, 1, Vector(self:GetAbility():GetSpecialValueFor("radius") / 4, 0, 0))
    ParticleManager:SetParticleControl(pfx, 2, Vector(self:GetAbility():GetSpecialValueFor("radius"),1,1))
    ParticleManager:ReleaseParticleIndex(pfx)
    self:GetParent():ForceKill(false)
end

function modifier_npc_dota_hero_techies_spell6_explotion:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MODEL_SCALE
    }
end

function modifier_npc_dota_hero_techies_spell6_explotion:GetModifierModelScale()
    return self.scale
end