ability_npc_boss_cave3_spell5 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_cave3_spell5","abilities/cave3/ability_npc_boss_cave3_spell5", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_cave3_spell5:OnSpellStart()
    local pos = self:GetCaster():GetOrigin()
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, pos, nil, 500, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
    for num,unit in pairs(enemies) do
        enemies[num] = unit:GetOrigin()
    end
    if #enemies <3 then
        for i=1,(3 - #enemies) do
            table.insert( enemies, pos + RandomVector(RandomInt(100, 500)) )
        end
    end
    for num,position in pairs(enemies) do
        local direction = position - pos
        local npc = CreateModifierThinker(self:GetCaster(), self, "modifier_ability_npc_boss_cave3_spell5", {}, position, self:GetCaster():GetTeamNumber(), false)
        npc.effect_cast = ParticleManager:CreateParticle( "particles/econ/items/shredder/hero_shredder_icefx/shredder_chakram_ice.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
        ParticleManager:SetParticleControl( npc.effect_cast, 1, direction )
    end
    EmitSoundOn("Hero_Shredder.Chakram", self:GetCaster())
end

modifier_ability_npc_boss_cave3_spell5 = class({})

function modifier_ability_npc_boss_cave3_spell5:OnCreated(kv)
    if IsClient() then
        return
    end
    self.think = 0
    self.damage = self:GetAbility():GetSpecialValueFor("damage") * FrameTime()
    self.centerpos = self:GetParent():GetOrigin()
    self.const = 180 * FrameTime()
    self.duration = self:GetAbility():GetSpecialValueFor("duration")
    self:StartIntervalThink(1)
end

function modifier_ability_npc_boss_cave3_spell5:OnIntervalThink()
    self.think = self.think + 1
    if self.think == 1 then
        EmitSoundOn("Hero_Shredder.Chakram.Target", self:GetParent())
        ParticleManager:DestroyParticle( self:GetParent().effect_cast, false )
        ParticleManager:ReleaseParticleIndex( self:GetParent().effect_cast )
        self.pfx = ParticleManager:CreateParticle("particles/econ/items/shredder/hero_shredder_icefx/shredder_chakram_stay_ice.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
        ParticleManager:SetParticleControl(self.pfx, 0, self:GetParent():GetAbsOrigin())
        return
    end
    if self.think == 2 then
        local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_dark_seer/dark_seer_vacuum.vpcf", PATTACH_WORLDORIGIN, self:GetParent() )
	    ParticleManager:SetParticleControl( effect_cast, 0, self.centerpos )
        ParticleManager:SetParticleControl( effect_cast, 1, Vector( 500, 500, 500 ) )
        ParticleManager:ReleaseParticleIndex( effect_cast )
        local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self.centerpos, nil, 500, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
        for _,unit in pairs(enemies) do
            local direction = self.centerpos - unit:GetOrigin()
            local dis = direction:Length2D()
            unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_simply_motion_controll", {
            x = direction.x, y = direction.y, r = dis, s = dis * 3})
        end
        self:StartIntervalThink(FrameTime())
        return
    end
    if self:GetElapsedTime() > self.duration then
        self:Destroy()
    else
        local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self.centerpos, nil, 250, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
        for _,unit in pairs(enemies) do
            local pos = unit:GetOrigin()
            local direction = (pos - self:GetParent():GetOrigin()):Normalized() * self.const
            local newpos = pos - direction
            FindClearSpaceForUnit(unit, newpos, false)
            ApplyDamage({victim = unit,
            damage = self.damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            attacker = self:GetCaster(),
            ability = self:GetAbility()})
        end        
    end
end

function modifier_ability_npc_boss_cave3_spell5:OnDestroy()
    UTIL_Remove(self:GetParent())
end
