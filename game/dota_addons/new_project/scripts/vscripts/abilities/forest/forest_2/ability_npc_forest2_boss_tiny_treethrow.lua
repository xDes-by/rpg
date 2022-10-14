ability_npc_forest2_boss_tiny_treethrow = class({})

LinkLuaModifier( "modifier_ability_npc_forest2_boss_tiny_treethrow","abilities/forest2/ability_npc_forest2_boss_tiny_treethrow", LUA_MODIFIER_MOTION_NONE )

function ability_npc_forest2_boss_tiny_treethrow:OnSpellStart()
    local pos = self:GetCaster():GetAbsOrigin()
    CreateTempTree(pos+ RandomVector(RandomInt(100,400)), 5)
    self.Target = self:GetCursorTarget()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_invulnerable", {})
    self.trees = GridNav:GetAllTreesAroundPoint(self:GetCaster():GetAbsOrigin(), 400, true)
	self.effect_cast = ParticleManager:CreateParticle( "particles/units/heroes/hero_tiny/tiny_tree_channel.vpcf", PATTACH_WORLDORIGIN, nil )
	ParticleManager:SetParticleControl( self.effect_cast, 0, self:GetCaster():GetAbsOrigin() )
	ParticleManager:SetParticleControl( self.effect_cast, 1, Vector( 90, 90, 90 ) )
    self.GetChannelTime = function() return #self.trees * 0.7 end
        Timers:CreateTimer(0.7,function()
            if self.trees[1] ~= nil then
                ProjectileManager:CreateTrackingProjectile({
                    Target 				= self.Target,
                    Source 				= self:GetCaster(),
                    Ability 			= self,
                    EffectName 			= "particles/units/heroes/hero_tiny/tiny_tree_proj.vpcf",
                    iMoveSpeed			= 500,
                    vSourceLoc 			= self.Target:GetAbsOrigin(),
                    bDrawsOnMinimap 	= false,
                    bDodgeable 			= false,
                    bIsAttack 			= false,
                    bVisibleToEnemies 	= true,
                    bReplaceExisting 	= false,
                    flExpireTime 		= GameRules:GetGameTime() + 20,
                    bProvidesVision 	= false,
                })
                UTIL_Remove(self.trees[1])
                table.remove( self.trees, 1 )
            return 0.7
            end
        end)
    EmitSoundOn("sounds/weapons/hero/tiny/tiny_tree_impact_02.vsnd", self:GetCaster())
end

function ability_npc_forest2_boss_tiny_treethrow:OnChannelFinish( bInterrupted )
    if IsClient() then
        return
    end
    EmitSoundOn("sounds/weapons/hero/tiny/tiny_tree_impact_02.vsnd", self.Target)
    self:GetCaster():RemoveModifierByName("modifier_invulnerable")
    ParticleManager:DestroyParticle(self.effect_cast, false)
end
