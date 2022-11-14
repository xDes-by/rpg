ability_npc_boss_jungle1_1_spell_1 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_jungle1_1_spell_1", "abilities/jungle/jungle_1/ability_npc_boss_jungle1_1_spell_1", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_jungle1_1_spell_1_thinker", "abilities/jungle/jungle_1/ability_npc_boss_jungle1_1_spell_1", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_jungle1_1_spell_1:OnSpellStart()

	self:GetCaster():EmitSound("Hero_Tidehunter.Taunt.BackStroke")
	local caster_pos = self:GetCaster():GetAbsOrigin()
	_G.tide_points = {}
	for i = 1, 5 do
		local angle = RandomInt(0, 360)
		local variance = RandomInt(-600, 600)
		local dy = math.sin(angle) * variance
		local dx = math.cos(angle) * variance
		local position = Vector(caster_pos.x + dx, caster_pos.y + dy, caster_pos.z)
		table.insert(_G.tide_points, position)
	end	
	self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_jungle1_1_spell_1", {duration = 3.6})
end

----------------------------------------------------------------------------------

modifier_ability_npc_boss_jungle1_1_spell_1 = class({})

function modifier_ability_npc_boss_jungle1_1_spell_1:IsHidden()
    return false
end

function modifier_ability_npc_boss_jungle1_1_spell_1:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_jungle1_1_spell_1:CheckState()
	return {
	[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
	[MODIFIER_STATE_COMMAND_RESTRICTED] = true,
	}
end

function modifier_ability_npc_boss_jungle1_1_spell_1:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
        MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
    }
end

function modifier_ability_npc_boss_jungle1_1_spell_1:GetOverrideAnimation()
    return ACT_DOTA_TAUNT_STATUE
end

function modifier_ability_npc_boss_jungle1_1_spell_1:GetOverrideAnimationRate()
    return 1.0
end

function modifier_ability_npc_boss_jungle1_1_spell_1:GetActivityTranslationModifiers()
    return "backstroke_gesture"
end

function modifier_ability_npc_boss_jungle1_1_spell_1:OnCreated()
	if not IsServer() then return end
    self.startPos = self:GetParent():GetAbsOrigin()
    self.range = 0
    self:StartIntervalThink(0.1)
    self:OnIntervalThink()
end



function modifier_ability_npc_boss_jungle1_1_spell_1:Move(caster)	
	if #_G.tide_points > 0 then
		move_point = _G.tide_points[1]
		if move_point ~= nil then
			if(caster:GetAbsOrigin() - move_point):Length2D() > 150 then
				caster:MoveToPosition(move_point)
			else
				for i, point in ipairs(_G.tide_points ) do
					if move_point == point then
						table.remove(_G.tide_points, i )
						self:Move(caster)
					end
				end
			end
		end	
	end
end


function modifier_ability_npc_boss_jungle1_1_spell_1:OnIntervalThink()
	self:Move(self:GetParent())

    self.endPos = self:GetParent():GetAbsOrigin()
    local curRange = (self.startPos - self.endPos):Length2D() + self.range
    if curRange > 200 then
        self.range = 0
        CreateModifierThinker(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_boss_jungle1_1_spell_1_thinker", {duration = 1.6}, self.endPos, self:GetCaster():GetTeamNumber(), false)
    else
        self.range = curRange + self.range
    end
    self.startPos = self.endPos
end

modifier_ability_npc_boss_jungle1_1_spell_1_thinker = class({})

function modifier_ability_npc_boss_jungle1_1_spell_1_thinker:OnCreated()
    local pfx = ParticleManager:CreateParticle("particles/econ/items/kunkka/divine_anchor/hero_kunkka_dafx_skills/kunkka_spell_torrent_bubbles_fxset.vpcf", PATTACH_POINT, self:GetParent())
    ParticleManager:ReleaseParticleIndex(pfx)
end

function modifier_ability_npc_boss_jungle1_1_spell_1_thinker:OnDestroy()
if not IsServer() then return end
    local pfx = ParticleManager:CreateParticle("particles/econ/items/kunkka/divine_anchor/hero_kunkka_dafx_skills/kunkka_spell_torrent_splash_fxset.vpcf", PATTACH_WORLDORIGIN, self:GetParent())
    ParticleManager:SetParticleControl(pfx, 0, self:GetParent():GetAbsOrigin())
    ParticleManager:ReleaseParticleIndex(pfx)
    local enemies = FindUnitsInRadius( self:GetParent():GetTeamNumber(), self:GetParent():GetAbsOrigin(), nil, 225, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
    for _,unit in pairs(enemies) do
        if not unit:HasModifier("modifier_generic_arc_lua") then
            unit:AddNewModifier(self:GetCaster(),self,"modifier_generic_arc_lua", {
            height = 500, duration = 1.6, isStun = true, activity = ACT_DOTA_FLAIL})
            ApplyDamage({victim = unit,
            damage =  self:GetAbility():GetSpecialValueFor("damage"),
            damage_type = DAMAGE_TYPE_MAGICAL,
            damage_flags = DOTA_DAMAGE_FLAG_NONE,
            attacker = self:GetCaster(),
            ability = self:GetAbility()})
        end
    end
    UTIL_Remove(self:GetParent())
end



