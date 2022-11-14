ability_npc_boss_jungle1_1_spell_2 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle1_1_spell_2", "abilities/jungle/jungle_1/ability_npc_boss_jungle1_1_spell_2", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle1_1_spell_2:OnSpellStart()
    local pos = self:GetCaster():GetAbsOrigin()
    local waves = self:GetSpecialValueFor("waves")
    for i=1,waves do
        CreateModifierThinker(self:GetCaster(), self, "modifier_ability_npc_boss_jungle1_1_spell_2", {duration = 1}, pos + RandomVector(500), self:GetCaster():GetTeamNumber(), false)
    end
	
	EmitSoundOn( "Ability.GushCast", self:GetCaster() )
end

modifier_ability_npc_boss_jungle1_1_spell_2 = class({})

function modifier_ability_npc_boss_jungle1_1_spell_2:OnCreated()
    if IsClient() then
        return
    end
    ProjectileManager:CreateTrackingProjectile({		
        Source = self:GetParent(),
        Ability = self:GetAbility(),	
        Target = self:GetCaster(),
        EffectName = "particles/units/heroes/hero_tidehunter/tidehunter_gush.vpcf",
        iMoveSpeed = 1200,
        vSourceLoc= self:GetParent():GetAbsOrigin(),                -- Optional (HOW)
    })
    local position = self:GetCaster():GetAbsOrigin()
    local enemies = FindUnitsInLine( DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), position, nil, 150, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0)
    for _,unit in pairs(enemies) do
        local direction = position - unit:GetAbsOrigin()
        local dis = direction:Length2D() / 2
        unit:AddNewModifier(self:GetCaster(), self, "modifier_simply_motion_controll", {
        x = direction.x, y = direction.y, r = dis, s = dis*4})
    end
end

function modifier_ability_npc_boss_jungle1_1_spell_2:OnDestroy()
    if IsClient() then
        return
    end
    UTIL_Remove(self:GetParent())
end