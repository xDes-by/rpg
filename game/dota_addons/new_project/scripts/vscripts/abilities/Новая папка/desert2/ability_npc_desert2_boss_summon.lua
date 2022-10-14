ability_npc_desert2_boss_summon = class({})

LinkLuaModifier( "modifier_ability_npc_desert2_boss_summon", "abilities/desert2/ability_npc_desert2_boss_summon", LUA_MODIFIER_MOTION_NONE )

function ability_npc_desert2_boss_summon:Precache(context)
    PrecacheResource( "particle", "particles/units/heroes/hero_sandking/sandking_sandstorm.vpcf", context )
    PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_sandking.vsndevts", context )
end

function ability_npc_desert2_boss_summon:GetIntrinsicModifierName()
    return "modifier_ability_npc_desert2_boss_summon"
end

modifier_ability_npc_desert2_boss_summon = class({})
--Classifications template
function modifier_ability_npc_desert2_boss_summon:IsHidden()
   return true
end

function modifier_ability_npc_desert2_boss_summon:IsPurgable()
   return false
end

function modifier_ability_npc_desert2_boss_summon:IsPurgeException()
    return false
end

function modifier_ability_npc_desert2_boss_summon:RemoveOnDeath()
   return true
end

function modifier_ability_npc_desert2_boss_summon:DeclareFunctions()
   return {
       MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
       MODIFIER_EVENT_ON_ATTACKED
}
end

function modifier_ability_npc_desert2_boss_summon:CheckState()
	return {
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
	}
end

function modifier_ability_npc_desert2_boss_summon:OnCreated()
	self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_sandking/sandking_sandstorm.vpcf", PATTACH_POINT, self:GetParent() )
	--ParticleManager:SetParticleControl( self.effect_cast, 0, self:GetParent():GetOrigin() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 300, 300, 300 ) )
	EmitSoundOn( "Ability.SandKing_SandStorm.loop", self:GetParent() )
    if IsClient() then return end
    self.pos = self:GetParent():GetOrigin()
    self:GetParent():SetBaseMaxHealth(10)
    self:GetParent():SetMaxHealth(10)
    self:GetParent():SetHealth(10)
end
function modifier_ability_npc_desert2_boss_summon:OnRefresh()
    self:OnCreated()
end
function modifier_ability_npc_desert2_boss_summon:OnDestroy()
	ParticleManager:DestroyParticle( self.effect_cast, false )
	ParticleManager:ReleaseParticleIndex( self.effect_cast )
	StopSoundOn( "Ability.SandKing_SandStorm.loop", self:GetParent() )
end

function modifier_ability_npc_desert2_boss_summon:GetModifierIncomingDamage_Percentage(data)
    return -100
end

function modifier_ability_npc_desert2_boss_summon:OnAttacked(data)
    if IsClient() then
        return
    end
    if data.attacker:IsRealHero() and data.target == self:GetParent() then
        self:GetParent():SetHealth( self:GetParent():GetHealth() - 1 )
        if self:GetParent():GetHealth() == 0 then 
            self:GetParent():ForceKill(false)
        end
    end
end
