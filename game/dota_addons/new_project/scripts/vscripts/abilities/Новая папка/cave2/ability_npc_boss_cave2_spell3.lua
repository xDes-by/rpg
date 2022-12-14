ability_npc_boss_cave2_spell3 = class({})

LinkLuaModifier( "modifier_ability_npc_boss_cave2_spell3","abilities/cave2/ability_npc_boss_cave2_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_cave2_spell3_root","abilities/cave2/ability_npc_boss_cave2_spell3", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_ability_npc_boss_cave2_spell3_helper","abilities/cave2/ability_npc_boss_cave2_spell3", LUA_MODIFIER_MOTION_NONE )

function ability_npc_boss_cave2_spell3:OnSpellStart()
    self:GetCaster():AddNewModifier(self:GetCaster(), self, "modifier_ability_npc_boss_cave2_spell3_helper", {})
    --local pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_meepo/meepo_earthbind_projectile_fx.vpcf", PATTACH_POINT, self:GetCaster())

end

modifier_ability_npc_boss_cave2_spell3_helper = class({})
--Classifications template
function modifier_ability_npc_boss_cave2_spell3_helper:IsHidden()
    return true
end

function modifier_ability_npc_boss_cave2_spell3_helper:IsPurgable()
    return false
end

function modifier_ability_npc_boss_cave2_spell3_helper:OnCreated()
    self.pos = self:GetCaster():GetAbsOrigin()
    self.root = self:GetAbility():GetSpecialValueFor("root")
    self.count = self:GetAbility():GetSpecialValueFor("count")
    self:StartIntervalThink(0.2)
end

function modifier_ability_npc_boss_cave2_spell3_helper:OnIntervalThink()
    self.count = self.count + 1
    if self.count ~= 15 then
        local point = self.pos + RandomVector(RandomInt(100, 600))
        local duration = (self.pos - point):Length2D() / 1200
        local target = CreateModifierThinker(self:GetCaster(),self:GetAbility(),"modifier_ability_npc_boss_cave2_spell3",{duration = duration},point,self:GetCaster():GetTeamNumber(),false)
        EmitSoundOn("Hero_Meepo.Earthbind.Cast", self:GetCaster())
        target.rootdur = self.root
        ProjectileManager:CreateTrackingProjectile({		
            Source = self:GetCaster(),
            Ability = self:GetAbility(),	
            Target = target,
            EffectName = "particles/units/heroes/hero_meepo/meepo_earthbind_projectile_fx.vpcf",
            iMoveSpeed = 1200,
            vSourceLoc= self:GetCaster():GetAbsOrigin(),                -- Optional (HOW)
        })
    else
        self:Destroy()
    end
end

modifier_ability_npc_boss_cave2_spell3 = class({})

function modifier_ability_npc_boss_cave2_spell3:OnDestroy(kv)
    local enemies = FindUnitsInRadius(DOTA_TEAM_BADGUYS, self:GetParent():GetAbsOrigin(), nil, 300, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 0, 0,false)
    if #enemies > 0 then
        EmitSoundOn("Hero_Meepo.Earthbind.Target", enemies[1])
    end
    for _,unit in pairs(enemies) do
        unit:AddNewModifier(self:GetCaster(), self:GetAbility(), "modifier_ability_npc_boss_cave2_spell3_root", {duration = self:GetParent().rootdur})
    end
    UTIL_Remove(self:GetParent())
end

modifier_ability_npc_boss_cave2_spell3_root = class({})
--Classifications template
function modifier_ability_npc_boss_cave2_spell3_root:IsHidden()
    return false
end

function modifier_ability_npc_boss_cave2_spell3_root:IsDebuff()
    return true
end

function modifier_ability_npc_boss_cave2_spell3_root:IsPurgable()
    return true
end

function modifier_ability_npc_boss_cave2_spell3_root:RemoveOnDeath()
    return true
end

function modifier_ability_npc_boss_cave2_spell3_root:DestroyOnExpire()
    return true
end

function modifier_ability_npc_boss_cave2_spell3_root:CheckState()
    return {
        [MODIFIER_STATE_ROOTED] = true
    }
end

function modifier_ability_npc_boss_cave2_spell3_root:GetEffectName()
    return "particles/units/heroes/hero_meepo/meepo_earthbind.vpcf"
end