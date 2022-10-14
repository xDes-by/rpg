LinkLuaModifier("modifier_hoodwink_skill_3", "heroes/npc_dota_hero_hoodwink/npc_dota_hero_hoodwink_spell3", LUA_MODIFIER_MOTION_NONE)

npc_dota_hero_hoodwink_spell3 = class({})

function npc_dota_hero_hoodwink_spell3:OnSpellStart()
	local front = self:GetCaster():GetForwardVector():Normalized()
	local pos = self:GetCaster():GetOrigin() + front * 250
	
    local duration = self:GetSpecialValueFor("duration") 
    CreateModifierThinker(self:GetCaster(), self, "modifier_hoodwink_skill_3", {duration = duration}, pos, self:GetCaster():GetTeamNumber(), false)
end

modifier_hoodwink_skill_3 = class({})

function modifier_hoodwink_skill_3:IsHidden() 			
    return true 
end

function modifier_hoodwink_skill_3:IsPurgable() 			
    return false 
end


function modifier_hoodwink_skill_3:OnCreated() 
    self.rg = 350
    self.wh = 50
    if IsServer() then 
        self.pos = self:GetParent():GetAbsOrigin()
        self.team = self:GetCaster():GetTeam()
        self.start_pos = self.pos + self:GetCaster():GetRightVector() * self.rg
        self.end_pos = self.pos + self:GetCaster():GetRightVector() *- self.rg
        local wall = ParticleManager:CreateParticle("particles/units/heroes/hero_dark_seer/dark_seer_wall_of_replica.vpcf", PATTACH_WORLDORIGIN,nil)
        ParticleManager:SetParticleControl(wall,0,self.start_pos)
        ParticleManager:SetParticleControl(wall,1,self.end_pos)
        ParticleManager:SetParticleControl(wall,2,Vector(1,1,0))
        ParticleManager:SetParticleControl(wall,60,Vector(255,206,120))
        ParticleManager:SetParticleControl(wall,61,Vector(1,0,0))
        self:AddParticle( wall, false, false, -1, false, false )   
        self:OnIntervalThink()
        self:StartIntervalThink(FrameTime())
    end
end

function modifier_hoodwink_skill_3:OnIntervalThink()
    local enemies = FindUnitsInLine(self.team,  self.start_pos, self.end_pos, self:GetCaster(), self.wh, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE)
    if #enemies>0 then 
    for _,unit in pairs(enemies) do
		if not unit:IsMagicImmune() then 
			local front = unit:GetForwardVector():Normalized()
			local pos = unit:GetOrigin() - front * 15
			unit:SetAbsOrigin( pos)
            end 
        end
    end  
end