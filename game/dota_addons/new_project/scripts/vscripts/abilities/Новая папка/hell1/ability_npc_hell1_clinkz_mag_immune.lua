ability_npc_hell1_clinkz_mag_immune = class({})

LinkLuaModifier( "modifier_ability_npc_hell1_clinkz_mag_immune","abilities/hell1/ability_npc_hell1_clinkz_mag_immune", LUA_MODIFIER_MOTION_NONE )

function ability_npc_hell1_clinkz_mag_immune:GetIntrinsicModifierName()
    return "modifier_ability_npc_hell1_clinkz_mag_immune"
end

modifier_ability_npc_hell1_clinkz_mag_immune = class({})

--Classifications template
function modifier_ability_npc_hell1_clinkz_mag_immune:IsHidden()
   return true
end

function modifier_ability_npc_hell1_clinkz_mag_immune:CheckState()
    return {[MODIFIER_STATE_MAGIC_IMMUNE] = true}
end