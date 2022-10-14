npc_dota_hero_tinker_spell3 = class({})

LinkLuaModifier( "modifier_npc_dota_hero_tinker_spell3","heroes/npc_dota_hero_tinker/npc_dota_hero_tinker_spell3", LUA_MODIFIER_MOTION_NONE )

function npc_dota_hero_tinker_spell3:GetIntrinsicModifierName()
    return "modifier_npc_dota_hero_tinker_spell3"
end

function npc_dota_hero_tinker_spell3:IsRefreshable()
    return false
end

modifier_npc_dota_hero_tinker_spell3 = class({})

--Classifications template
function modifier_npc_dota_hero_tinker_spell3:IsHidden()
    return true
end

function modifier_npc_dota_hero_tinker_spell3:IsPurgable()
    return false
end

function modifier_npc_dota_hero_tinker_spell3:OnCreated()
    if IsClient() then
        return
    end
    self.AbilitiesTable = {}
    self.Heroes = {}
    for nPlayerID = 0, DOTA_MAX_TEAM_PLAYERS-1 do
        if PlayerResource:IsValidPlayerID(nPlayerID) then
            local hero = PlayerResource:GetSelectedHeroEntity( nPlayerID )
            self.Heroes[hero] = {}
            for i=0,6 do
                local abi = hero:GetAbilityByIndex(i)
                if abi and abi:GetName() ~= "generc_hidden" then
                    table.insert( self.AbilitiesTable[hero], abi )
                end
            end
        end
    end
    self:StartIntervalThink(7)
end

function modifier_npc_dota_hero_tinker_spell3:OnIntervalThink()
    for _,hero in pairs(self.Heroes) do
        for _,ability in pairs(self.AbilitiesTable[hero]) do
            if not ability:IsCooldownReady() then
                local cd = ability:GetCooldownTimeRemaining()
                ability:EndCooldown()
                ability:StartCooldown(cd-2)
                break
            end
        end
        self.AbilitiesTable[hero] = table.shuffle(self.AbilitiesTable[hero])
    end
    UseResources(false, false, true)
end

