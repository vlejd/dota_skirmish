test_modifier = class({})

--------------------------------------------------------------------------------

function test_modifier:IsDebuff()
	return true
end

--------------------------------------------------------------------------------

function test_modifier:IsStunDebuff()
	return true
end

--------------------------------------------------------------------------------

function test_modifier:GetEffectName()
	return "particles/generic_gameplay/generic_stunned.vpcf"
end

--------------------------------------------------------------------------------

function test_modifier:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end

--------------------------------------------------------------------------------

function test_modifier:DeclareFunctions()
	local funcs = {
        MODIFIER_PROPERTY_EXTRA_HEALTH_BONUS,
        MODIFIER_PROPERTY_HEALTH_BONUS
	}

	return funcs
end

--------------------------------------------------------------------------------
function test_modifier:GetModifierHealthBonus( params )
    return 100000
end

function test_modifier:GetModifierExtraHealthBonus( params )
	return 10000
end

--------------------------------------------------------------------------------

function test_modifier:CheckState()
	local state = {
	}

	return state
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------