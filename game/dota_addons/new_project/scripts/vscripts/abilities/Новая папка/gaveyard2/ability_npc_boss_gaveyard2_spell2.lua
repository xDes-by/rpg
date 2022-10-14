ability_npc_boss_gaveyard2_spell2 = class({})



function ability_npc_boss_gaveyard2_spell2:OnSpellStart()
    local point = self:GetCaster():GetAbsOrigin() + (self:GetCaster():GetForwardVector() * 50)
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, point, nil, self:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_ENEMY,DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unit in pairs(enemies) do
        local direction = point - unit:GetAbsOrigin()
        local dis = direction:Length2D()
        unit:AddNewModifier(self:GetCaster(), self, "modifier_simply_motion_controll", {
        x = direction.x, y = direction.y, r = dis, s = dis*4})
    end

	local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_magnataur/magnataur_reverse_polarity.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	ParticleManager:SetParticleControl( effect_cast, 1, Vector( 500, 500, 500 ) )
	ParticleManager:SetParticleControl( effect_cast, 2, Vector( 0.2, 0, 0 ) )
	ParticleManager:SetParticleControlEnt(effect_cast, 3, self:GetCaster(), PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector(0,0,0), true)
	ParticleManager:SetParticleControlForward( effect_cast, 3, self:GetCaster():GetForwardVector() )
	EmitSoundOn( "Hero_Magnataur.ReversePolarity.Cast", self:GetCaster() )
end
