npc_dota_hero_techies_spell1 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_techies_spell1", "heroes/npc_dota_hero_techies/npc_dota_hero_techies_spell1", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_techies_spell1:OnSpellStart()
    self.pos = self:GetCursorPosition()
    local unit = CreateUnitByName("npc_npc_dota_hero_techies_spell1_mine", self:GetCaster():GetAbsOrigin() + self:GetCaster():GetForwardVector():Normalized(), true, nil, nil, DOTA_TEAM_GOODGUYS )
    unit:AddNewModifier(self:GetCaster(), self, "modifier_npc_dota_hero_techies_spell1", {duration = 3})
    EmitSoundOn("Hero_Techies.StickyBomb.Cast", unit)
    local distance = (unit:GetAbsOrigin() - self.pos):Length2D()
    unit:AddNewModifier(
        caster, -- player source
        ability, -- ability source
        "modifier_generic_arc_lua", -- modifier name
        {
            target_x = self.pos.x,
            target_y = self.pos.y,
            duration = 1,
            distance = distance,
            height = 400,
            speed = distance,
            fix_duration = false,
            isStun = true,
            --activity = ACT_DOTA_FLAIL,
        }) -- kv
    Timers:CreateTimer(1,function()
        EmitSoundOn("Hero_Techies.StasisTrap.Plant", self:GetCaster())
    end)
end

modifier_npc_dota_hero_techies_spell1 = class({})
--Classifications template
function modifier_npc_dota_hero_techies_spell1:IsHidden()
    return true
end

function modifier_npc_dota_hero_techies_spell1:OnDestroy()
    if IsClient() then
        return
    end
    self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_techies/techies_remote_mines_detonate.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControl( self.effect_cast, 0, self:GetParent():GetAbsOrigin() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 200, 1, 1 ) ) 
    ParticleManager:ReleaseParticleIndex(self.effect_cast)
    local radius = self:GetAbility():GetSpecialValueFor("radius")
	local enemies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetParent():GetAbsOrigin(), nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    EmitSoundOn("Hero_Techies.StickyBomb.Detonate", self:GetParent())
    for _,unit in pairs(enemies) do
        local upos = unit:GetAbsOrigin()
        local direstion = (self:GetAbility().pos - upos):Normalized()
        local pos = upos - direstion
        unit:AddNewModifier(
        caster, -- player source
        ability, -- ability source
        "modifier_generic_arc_lua", -- modifier name
        {
            target_x = pos.x,
            target_y = pos.y,
            duration = 0.3,
            distance = 200,
            height = 50,
            speed = distance,
            fix_duration = false,
            isStun = true,
            activity = ACT_DOTA_FLAIL,
        }) -- kv
    end
    UTIL_Remove(self:GetParent())
end

