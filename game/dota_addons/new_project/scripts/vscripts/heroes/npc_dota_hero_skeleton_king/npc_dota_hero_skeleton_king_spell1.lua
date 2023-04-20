LinkLuaModifier( "modifier_npc_dota_hero_skeleton_king_spell1", "heroes/npc_dota_hero_skeleton_king/npc_dota_hero_skeleton_king_spell1", LUA_MODIFIER_MOTION_NONE )

npc_dota_hero_skeleton_king_spell1 = class({})

function npc_dota_hero_skeleton_king_spell1:GetIntrinsicModifierName()
    return  "modifier_npc_dota_hero_skeleton_king_spell1"
end

--------------------------------------------------------------------

modifier_npc_dota_hero_skeleton_king_spell1 = class({})

function modifier_npc_dota_hero_skeleton_king_spell1:IsHidden()
    return true
end

function modifier_npc_dota_hero_skeleton_king_spell1:IsPurgable()
    return false
end

function modifier_npc_dota_hero_skeleton_king_spell1:RemoveOnDeath()
    return false
end

function modifier_npc_dota_hero_skeleton_king_spell1:OnCreated()
    self.chance = self:GetAbility():GetSpecialValueFor("chance")
end

function modifier_npc_dota_hero_skeleton_king_spell1:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PROCATTACK_FEEDBACK,
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PHYSICAL,
	}

	return funcs
end

function modifier_npc_dota_hero_skeleton_king_spell1:GetModifierProcAttack_BonusDamage_Physical( params )
	if IsServer() then
		if params.target:IsBuilding() or params.target:IsOther() then
			return 0
		end
		if self:GetParent():IsIllusion() or self:GetParent():PassivesDisabled() then
			return 0
		end
		if RandomInt(1,100) <= self.chance and self:GetAbility():IsCooldownReady() then 
			self.record = params.record
			return self.damage
		end
	end
end

function modifier_npc_dota_hero_skeleton_king_spell1:GetModifierProcAttack_Feedback( params )
	if IsServer() then
		if params.record == self.record then
			DoCleaveAttack( params.attacker, params.target, self.ability, params.damage, 70,300, 360, "particles/wk_1.vpcf")
			params.target:AddNewModifier( self:GetParent(), self:GetAbility(), "modifier_stunned", { duration = 1 } )
			EmitSoundOn( "Hero_Slardar.Bash", params.target )
			self:GetAbility():UseResources(false, false, true)
		end
	end
end