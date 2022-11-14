modidfier_ability_npc_boss_cave1_spell2 = class({})
--Classifications template
function modidfier_ability_npc_boss_cave1_spell2:IsHidden()
    return false
end

function modidfier_ability_npc_boss_cave1_spell2:IsDebuff()
    return false
end

function modidfier_ability_npc_boss_cave1_spell2:IsPurgable()
    return false
end

function modidfier_ability_npc_boss_cave1_spell2:RemoveOnDeath()
    return true
end

function modidfier_ability_npc_boss_cave1_spell2:OnCreated()
    self.maxdmg = self:GetAbility():GetSpecialValueFor("maxdmg")
    self.totaldmg = 0
	local effect_cast = ParticleManager:CreateParticle( "particles/econ/items/pangolier/pangolier_ti8_immortal/pangolier_ti8_immortal_shield_buff.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent() )
	ParticleManager:SetParticleControlEnt(effect_cast, 1, self:GetParent(),PATTACH_ABSORIGIN_FOLLOW, "attach_hitloc", Vector(0,0,0), true)
	ParticleManager:SetParticleControl( effect_cast, 3, Vector( 5, 0, 0 ) )
	self:AddParticle(effect_cast,false,false,-1,false, false)
    
end

function modidfier_ability_npc_boss_cave1_spell2:OnRefresh()
    self:OnCreated()
end

function modidfier_ability_npc_boss_cave1_spell2:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_TOTAL_CONSTANT_BLOCK
    }
end

function modidfier_ability_npc_boss_cave1_spell2:GetModifierTotal_ConstantBlock(data)
    self.totaldmg = self.totaldmg + data.damage
    if self.maxdmg < self.totaldmg then
        return data.damade
    else
        self:Destroy()
        return self.totaldmg - self.maxdmg
    end
end

function modidfier_ability_npc_boss_cave1_spell2:GetStatusEffectName()
	return "particles/status_fx/status_effect_pangolier_shield.vpcf"
end

function modidfier_ability_npc_boss_cave1_spell2:StatusEffectPriority()
	return MODIFIER_PRIORITY_NORMAL
end