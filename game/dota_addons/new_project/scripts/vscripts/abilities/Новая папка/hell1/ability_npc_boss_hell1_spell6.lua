ability_npc_boss_hell1_spell6 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_hell1_spell6","abilities/hell1/ability_npc_boss_hell1_spell6", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_hell1_spell6:GetIntrinsicModifierName()
    return "modifier_ability_npc_boss_hell1_spell6"
end

modifier_ability_npc_boss_hell1_spell6 = class({})

--Classifications template
function modifier_ability_npc_boss_hell1_spell6:IsHidden()
    return true
end

function modifier_ability_npc_boss_hell1_spell6:IsPurgable()
    return false
end

function modifier_ability_npc_boss_hell1_spell6:OnCreated()
    if IsClient() then
        return
    end
    self.table = {
        [1] = {
            ["projectile"] = "particles/units/heroes/hero_dragon_knight/dragon_knight_elder_dragon_frost.vpcf",
            ["attack_sound"] = "Hero_DragonKnight.ElderDragonShoot3.Attack",
            ["transform"] = "particles/units/heroes/hero_dragon_knight/dragon_knight_transform_blue.vpcf",
            ["scale"] = 20,
        },
        [2] = {
            ["projectile"] = "particles/units/heroes/hero_dragon_knight/dragon_knight_elder_dragon_fire.vpcf",
            ["attack_sound"] = "Hero_DragonKnight.ElderDragonShoot2.Attack",
            ["transform"] = "particles/units/heroes/hero_dragon_knight/dragon_knight_transform_red.vpcf",
            ["scale"] = 10,
        },
        [3] = {
            ["projectile"] = "particles/units/heroes/hero_dragon_knight/dragon_knight_elder_dragon_attack_black.vpcf",
            ["attack_sound"] = "Hero_DragonKnight.ElderDragonShoot4.Attack",
            ["transform"] = "particles/units/heroes/hero_dragon_knight/dragon_knight_transform_blue.vpcf",
            ["scale"] = 50,
        },
    }
    self.level = 1
    self.magic_resist = 0
    self.attack_sound = self.table[self.level]["attack_sound"]
    self.projectile = self.table[self.level]["projectile"]
    self:GetCaster():SetMaterialGroup("2")
    self:GetCaster().form = 1
    self:StartIntervalThink(0.2)
end

function modifier_ability_npc_boss_hell1_spell6:OnIntervalThink()
    local persent = self:GetCaster():GetHealthPercent()
    if persent < 80 and persent > 50 and self.projectile ~= self.table[2]["projectile"] then
        self.level = self.level + 1
        self.attack_sound = self.table[self.level]["attack_sound"]
        self.projectile = self.table[self.level]["projectile"]
        local particle = ParticleManager:CreateParticle(self.table[self.level]["transform"], PATTACH_POINT, self:GetCaster())
        ParticleManager:ReleaseParticleIndex(particle)
        self:GetCaster():SetMaterialGroup("1")
        self:GetCaster().form = 2
    elseif persent < 50 then
        self.level = self.level + 1
        self.attack_sound = self.table[self.level]["attack_sound"]
        self.projectile = self.table[self.level]["projectile"]
        local particle = ParticleManager:CreateParticle(self.table[self.level]["transform"], PATTACH_POINT, self:GetCaster())
        ParticleManager:ReleaseParticleIndex(particle)
        self.magic_resist = self:GetAbility():GetSpecialValueFor("resist")
        self:GetCaster():SetMaterialGroup("3")
        self:StartIntervalThink(-1)
        self:GetCaster().form = 3
    end
end

function modifier_ability_npc_boss_hell1_spell6:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS,
        MODIFIER_PROPERTY_TRANSLATE_ATTACK_SOUND,
		MODIFIER_PROPERTY_PROJECTILE_NAME,
        MODIFIER_PROPERTY_MODEL_SCALE,

    }
end

function modifier_ability_npc_boss_hell1_spell6:GetModifierMagicalResistanceBonus()
	return self.magic_resist
end

function modifier_ability_npc_boss_hell1_spell6:GetAttackSound()
	return self.attack_sound
end

function modifier_ability_npc_boss_hell1_spell6:GetModifierProjectileName()
	return self.projectile
end

function modifier_ability_npc_boss_hell1_spell6:GetModifierModelScale()
	return self.scale
end