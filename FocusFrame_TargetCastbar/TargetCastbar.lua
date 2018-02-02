local _G = getfenv(0)
local Focus = assert(_G.FocusCore, "FocusCore not loaded.")
local castbar = _G.Focus_TargetCastingBar

-- Check if using incompatible FocusFrame version
local version = string.gsub(GetAddOnMetadata("FocusFrame", "version"), "%W", "")
if tonumber(version) <= 122 then
    return DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000TargetCastbar requires FocusFrame v1.2.3+ to work.|r")
end

local function CastingBarOnUpdate()
    if not UnitExists("target") then return end
	local cast, value, maxValue, sparkPosition, timer = Focus:GetCast(UnitName("target"))

	if cast then
		castbar:SetMinMaxValues(0, maxValue)
		castbar:SetValue(value)
		castbar.spark:SetPoint("CENTER", castbar, "LEFT", sparkPosition * castbar:GetWidth(), 0)
		castbar.timer:SetText(timer)

		if cast.immune then
			castbar.shield:Show()
		else
			castbar.shield:Hide()
		end

		if not castbar:IsVisible() or castbar.text:GetText() ~= cast.spell then
			castbar.text:SetText(cast.spell)
			castbar.icon:SetTexture(cast.icon)
			castbar:SetAlpha(castbar:GetAlpha())
			castbar:Show()
		end
	else
		castbar:Hide()
	end
end

local shouldRegister = true
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_TARGET_CHANGED")
f:SetScript("OnEvent", function()
    -- Ensure OnUpdate is only registered once when we have a target
    if TargetFrame:IsVisible() then
        if shouldRegister then
            f:SetScript("OnUpdate", CastingBarOnUpdate)
            shouldRegister = false
        end
    else
        f:SetScript("OnUpdate", nil)
        shouldRegister = true
    end
end)
