modifier_animation_test = class({})

function modifier_animation_test:IsHidden()
    return true
end

function modifier_animation_test:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_DISABLE_TURNING,
        MODIFIER_PROPERTY_MOVESPEED_LIMIT,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
        MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE,
        MODIFIER_PROPERTY_TRANSLATE_ACTIVITY_MODIFIERS,
    }
end

function modifier_animation_test:GetModifierDisableTurning()
    return 1
end

function modifier_animation_test:GetModifierMoveSpeed_Limit()
    return 0.1
end

function modifier_animation_test:GetOverrideAnimation()
    return ACT_DOTA_TAUNT
end

function modifier_animation_test:GetOverrideAnimationRate()
    return 2.0
end

function modifier_animation_test:GetActivityTranslationModifiers()
    return "sharp_blade"
end