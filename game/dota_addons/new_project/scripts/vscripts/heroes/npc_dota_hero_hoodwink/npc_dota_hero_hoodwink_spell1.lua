npc_dota_hero_hoodwink_spell1 = class({})

function npc_dota_hero_hoodwink_spell1:OnSpellStart()
	if IsServer() then
		local hTarget = self:GetCursorTarget()
		self.tJumpTargets = {}
		
		self:GetCaster():EmitSound("Hero_Hoodwink.AcornShot.Cast")

		local projectile =
			{
				Target = hTarget,
				Source = self:GetCaster(),
				Ability = self,
				EffectName = "particles/units/heroes/hero_hoodwink/hoodwink_acorn_shot_tracking.vpcf",
				bDodgable = false,
				bProvidesVision = false,
				iMoveSpeed = 700,
				iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
				ExtraData =
				{
					duration = self:GetSpecialValueFor("duration"),
					damage = self:GetSpecialValueFor("damage"),
					speed = 700,
				}
			}
		ProjectileManager:CreateTrackingProjectile(projectile)
	end
end

function npc_dota_hero_hoodwink_spell1:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
	local sound_target = "Hero_Hoodwink.AcornShot.Target"
	EmitSoundOn( sound_target, hTarget )

	if hTarget then	
		if hTarget:GetTeamNumber() ~= self:GetCaster():GetTeamNumber() then
			if not hTarget:IsMagicImmune() then
				hTarget:AddNewModifier(hTarget, self, "modifier_stunned", {duration = ExtraData.duration * (1 - hTarget:GetStatusResistance())})
				ApplyDamage({victim = hTarget, attacker = self:GetCaster(), damage = ExtraData.damage, damage_type = self:GetAbilityDamageType()})
			end
		else
			local heal = ExtraData.damage
			hTarget:Heal(heal, self:GetCaster())
			SendOverheadEventMessage(nil, OVERHEAD_ALERT_HEAL, hTarget, heal, nil)
		end
	end
	
	Timers:CreateTimer(0.1, function()
		local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), hTarget:GetAbsOrigin(), nil, 300, DOTA_UNIT_TARGET_TEAM_BOTH, self:GetAbilityTargetType(), DOTA_UNIT_TARGET_FLAG_NO_INVIS, 0, false)	
		for _,unit in pairs(enemies) do
			if unit ~= hTarget and not unit:IsOther() and #self.tJumpTargets < (self:GetSpecialValueFor("count") - 1) then
				table.insert(self.tJumpTargets, unit)
				
				local projectile =
				{
					Target = unit,
					Source = hTarget,
					Ability = self,
					EffectName = "particles/units/heroes/hero_hoodwink/hoodwink_acorn_shot_tracking.vpcf",
					bDodgable = false,
					bProvidesVision = false,
					iMoveSpeed = 700,
					iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION,
					ExtraData =
					{
						duration = self:GetSpecialValueFor("duration"),
						damage = self:GetSpecialValueFor("damage"),
						speed = 700,
					}
				}
				ProjectileManager:CreateTrackingProjectile(projectile)
					
				if #self.tJumpTargets == (self:GetSpecialValueFor("count") - 1) then
					break
				end
			end
		end
	end)
end