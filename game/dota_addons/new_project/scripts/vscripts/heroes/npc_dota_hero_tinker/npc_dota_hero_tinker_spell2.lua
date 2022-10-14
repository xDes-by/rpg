npc_dota_hero_tinker_spell2 = class({})

function npc_dota_hero_tinker_spell2:OnSpellStart()
	local allies = FindUnitsInRadius(DOTA_TEAM_GOODGUYS, self:GetCaster():GetAbsOrigin(), nil, self:GetSpecialValueFor("radius"), DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, 0, 0,false)
    allies = table.remove_item( allies, self:GetCaster() )
    local heal = self:GetSpecialValueFor("heal_amount")
    for i=1,2 do
        ProjectileManager:CreateTrackingProjectile({
            Target 				= allies[i],
            Source 				= self:GetCaster(),
            Ability 			= self,
            EffectName 			= "particles/units/heroes/hero_tinker/tinker_missile.vpcf",
            bDodgeable 			= false,
            bProvidesVision 	= false,
            iMoveSpeed 			= self:GetSpecialValueFor("proj_speed"),
            iSourceAttachment	= self:GetCaster():ScriptLookupAttachment("attach_attack3"),
            ExtraData			= {heal = heal}
        })
    end
    if allies[1] then
        EmitSoundOn("Hero_Tinker.Heat-Seeking_Missile", self:GetCaster())
    else
        EmitSoundOn("Hero_Tinker.Heat-Seeking_Missile_Dud", self:GetCaster())
    end
end

function npc_dota_hero_tinker_spell2:OnProjectileHit_ExtraData(hTarget, vLocation, table)
    hTarget:Heal(table.heal, self)
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, hTarget, table.heal, nil)
    local pfx = ParticleManager:CreateParticle("particles/items5_fx/essence_ring.vpcf", PATTACH_ABSORIGIN_FOLLOW, hTarget)
    EmitSoundOn("DOTA_Item.SpiritVessel.Target.Ally", hTarget)
    Timers:CreateTimer(3,function()
        ParticleManager:DestroyParticle(pfx, false)
        ParticleManager:ReleaseParticleIndex(pfx)
    end)
end
