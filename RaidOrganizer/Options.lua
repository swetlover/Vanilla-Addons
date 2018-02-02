
assert(RaidOrganizer, "RaidOrganizer not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.1"):GetInstance("RaidOrganizerOptions", true)
local tablet = AceLibrary("Tablet-2.0")

RaidOrganizerOptions = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0", "AceDB-2.0", "FuBarPlugin-2.0")

local deuce = RaidOrganizer:NewModule("Options Menu")
deuce.hasFuBar = IsAddOnLoaded("FuBar") and FuBar
deuce.consoleCmd = not deuce.hasFuBar and "Minimap"
deuce.consoleOptions = not deuce.hasFuBar and {
	type = "toggle",
	name = "Minimap",
	desc = "Toggle Minimap",
	get = function() return RaidOrganizerOptions.minimapFrame and RaidOrganizerOptions.minimapFrame:IsVisible() or false end,
	set = function(v)
		if v then
			RaidOrganizerOptions:Show()
		else
			RaidOrganizerOptions:Hide()
		end
	end,
	map = {[false] = "hidden", [true] = "shown"},
	message = "%s icon is now %s.",
	hidden = function() return deuce.hasFuBar end,
}

RaidOrganizerOptions.name = "FuBar - Raid Organizer"
RaidOrganizerOptions:RegisterDB("RaidOrganizerFubarDB")

RaidOrganizerOptions.hasNoColor = true
RaidOrganizerOptions.hasIcon = "Interface\\AddOns\\RaidOrganizer\\Textures\\Icons\\INV_Misc_Head_Dragon_Black_Enable.tga"
RaidOrganizerOptions.lockMinimap = true
RaidOrganizerOptions.defaultMinimapPosition = 180
RaidOrganizerOptions.clickableTooltip = true
RaidOrganizerOptions.hideWithoutStandby = true

RaidOrganizerOptions.OnMenuRequest = RaidOrganizer.options
local args = AceLibrary("FuBarPlugin-2.0"):GetAceOptionsDataTable(RaidOrganizerOptions)
for k,v in pairs(args) do
	if RaidOrganizerOptions.OnMenuRequest.args[k] == nil then
		RaidOrganizerOptions.OnMenuRequest.args[k] = v
	end
end
-----------------------------
--      Icon Handling      --
-----------------------------

function RaidOrganizerOptions:OnEnable()
	self:RegisterEvent("RaidOrganizer_Enabled", "OnStateChange")
	self:RegisterEvent("RaidOrganizer_Disabled", "OnStateChange")
	self:RegisterEvent("RaidOrganizer_OnTooltipUpdate", "UpdateTooltip")
	self:OnStateChange()		
end

function RaidOrganizerOptions:OnStateChange()
	if RaidOrganizer:IsActive() then
		self:SetIcon("Interface\\AddOns\\RaidOrganizer\\Textures\\Icons\\Ruins_icon_enable.tga")
	else
		self:SetIcon("Interface\\AddOns\\RaidOrganizer\\Textures\\Icons\\Ruins_icon_disable.tga")
	end
	self:UpdateTooltip()
end

-----------------------------
--      FuBar Methods      --
-----------------------------

function RaidOrganizerOptions:OnTooltipUpdate()
	RaidOrganizer:TooltipUpdate(tablet)
end


function RaidOrganizerOptions:OnClick()
	if RaidOrganizer:IsActive() then
		if IsShiftKeyDown() then
			RaidOrganizer:Dialog()
		else
			RaidOrganizer.db.char.showBar = not RaidOrganizer.db.char.showBar
			RaidOrganizer:ShowBar()
		end
	else
		RaidOrganizer:ToggleActive(true)
		RaidOrganizer.db.char.showBar = true
		RaidOrganizer:ShowBar()
	end
end