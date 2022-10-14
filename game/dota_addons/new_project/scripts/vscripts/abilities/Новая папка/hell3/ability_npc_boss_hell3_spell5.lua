ability_npc_boss_hell3_spell5 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_hell3_spell5","abilities/hell3/ability_npc_boss_hell3_spell5", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_hell3_spell5:OnSpellStart()
    CreateModifierThinker(self:GetCaster(),self,"modifier_ability_npc_boss_hell3_spell5",{duration = self:GetSpecialValueFor("thinker_duration")},self:GetCursorPosition(),self:GetCaster():GetTeamNumber(),false)
end

modifier_ability_npc_boss_hell3_spell5 = class({})

function modifier_ability_npc_boss_hell3_spell5:OnCreated()
    self.pos = self:GetParent():GetOrigin()
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self:StartIntervalThink(1)
end

function modifier_ability_npc_boss_hell3_spell5:OnIntervalThink()
    local effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/heroes_underlord/abyssal_underlord_firestorm_wave.vpcf", PATTACH_WORLDORIGIN, self:GetParent() )
	ParticleManager:SetParticleControl( effect_cast, 0, self.pos )
	ParticleManager:SetParticleControl( effect_cast, 4, Vector( self.radius, 0, 0 ) )
	ParticleManager:ReleaseParticleIndex( effect_cast )
	EmitSoundOn( "Hero_AbyssalUnderlord.Firestorm", self:GetParent() )
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self.pos, nil, self.radius, DOTA_UNIT_TARGET_TEAM_ENEMY,DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, 0, 0,false)
    for _,unti in pairs(enemies) do
        ApplyDamage({victim = unit,
        damage =  self.damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
end
