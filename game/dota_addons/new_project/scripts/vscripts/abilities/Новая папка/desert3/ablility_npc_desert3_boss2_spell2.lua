ablility_npc_desert3_boss2_spell2 = class({})

LinkLuaModifier( "modifier_ablility_npc_desert3_boss2_spell2","abilities/desert3/ablility_npc_desert3_boss2_spell2", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ablility_npc_desert3_boss2_spell2_damage","abilities/desert3/ablility_npc_desert3_boss2_spell2", LUA_MODIFIER_MOTION_NONE )



function ablility_npc_desert3_boss2_spell2:GetIntrinsicModifierName()
    return "modifier_ablility_npc_desert3_boss2_spell2"
end

modifier_ablility_npc_desert3_boss2_spell2 = class({})

--Classifications template
function modifier_ablility_npc_desert3_boss2_spell2:IsHidden()
    return true
end

function modifier_ablility_npc_desert3_boss2_spell2:IsPurgable()
    return false
end

function modifier_ablility_npc_desert3_boss2_spell2:OnCreated()
    self.delay = self:GetAbility():GetSpecialValueFor("delay")
    self.chance = self:GetAbility():GetSpecialValueFor("chance")
end

function modifier_ablility_npc_desert3_boss2_spell2:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
    }
end

function modifier_ablility_npc_desert3_boss2_spell2:GetModifierProcAttack_Feedback(data)
    if RollPseudoRandom(self.chance,self:GetParent()) then
        if not data.target:HasModifier("modifier_ablility_npc_desert3_boss2_spell2_damage") then
            data.target:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ablility_npc_desert3_boss2_spell2_damage", {duration = self.delay})
        end
    end
end

modifier_ablility_npc_desert3_boss2_spell2_damage = class({})
--Classifications template
function modifier_ablility_npc_desert3_boss2_spell2_damage:IsHidden()
    return false
end

function modifier_ablility_npc_desert3_boss2_spell2_damage:IsDebuff()
    return true
end

function modifier_ablility_npc_desert3_boss2_spell2_damage:IsPurgable()
    return false
end

function modifier_ablility_npc_desert3_boss2_spell2_damage:RemoveOnDeath()
    return true
end

function modifier_ablility_npc_desert3_boss2_spell2_damage:DestroyOnExpire()
    return true
end

function modifier_ablility_npc_desert3_boss2_spell2_damage:OnCreated()
    self.radius = self:GetAbility():GetSpecialValueFor("radius")
    self.damage = self:GetAbility():GetSpecialValueFor("damage")
    self.pfx = ParticleManager:CreateParticle("particles/econ/items/dark_willow/dark_willow_ti8_immortal_head/dw_crimson_ti8_immortal_cursed_crownstart.vpcf", PATTACH_OVERHEAD_FOLLOW, self:GetParent())
    self:StartIntervalThink(1)
end

function modifier_ablility_npc_desert3_boss2_spell2_damage:OnIntervalThink()
    EmitSoundOn("Hero_DarkWillow.Ley.Count", self:GetParent())
end

function modifier_ablility_npc_desert3_boss2_spell2_damage:OnDestroy()
    ParticleManager:DestroyParticle(self.pfx,false)
    ParticleManager:ReleaseParticleIndex(self.pfx)
    EmitSoundOn("Hero_DarkWillow.Ley.Stun", self:GetParent())
    local pfx = ParticleManager:CreateParticle("particles/econ/items/dark_willow/dark_willow_ti8_immortal_head/dw_crimson_ti8_immortal_cursed_crownmarker.vpcf", PATTACH_POINT, self:GetParent())
    ParticleManager:SetParticleControl(pfx, 0, self:GetParent():GetAbsOrigin())
    ParticleManager:SetParticleControl(pfx, 2, Vector(self.radius, 0, 0))
    ParticleManager:ReleaseParticleIndex(pfx)
    if IsClient() then
        return
    end
    local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),	-- int, your team number
		self:GetParent():GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		0,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)
    for _,unit in pairs(enemies) do
        ApplyDamage({victim = self:GetParent(),
        damage = self.damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        damage_flags = DOTA_DAMAGE_FLAG_NONE,
        attacker = self:GetCaster(),
        ability = self:GetAbility()})
    end
end
