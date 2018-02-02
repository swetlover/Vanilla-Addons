local L = AceLibrary("AceLocale-2.2"):new("ChatLog")

--[[ Bindings ]]
BINDING_HEADER_CHATLOG = "ChatLog"
BINDING_NAME_TOGGLE = L["toggle"]

--[[ Managing config ]]
CHATLOG_DEFAULT_CONF = {
	["position"] = { x = 0, y = -150 },
	["copyposition"] = { x = 0, y = -175 },
	["colors"] = {
		["maxlog"] = { r = 1.0, g = 1.0, b = 1.0, a = 1.0 },
		["tab"] = { r = 1.0, g = 1.0, b = 1.0, a = 1.0 },
		["currentline"] = { r = 1.0, g = 1.0, b = 1.0, a = 1.0 },
		["disabledchannel"] = { r = 0.5, g = 0.5, b = 0.5, a = 1.0 }
	},
	["textcolors"] = {
		["info"] = "ffffff00",
		["raidleader"] = "ffffff00",
	},
	["maxlog"] = 1000,
	["scrollmaxlines"] = 32,
	["scrollpage"] = 20,
	["defaultindexes"] = {
		["whisper"] = 1,
		["raid"] = 2,
		["party"] = 3,
		["say"] = 4,
		["yell"] = 5,
		["officer"] = 6,
		["guild"] = 7,
	},
	["defaultnames"] = {
		["whisper"] = L["chatnames"]["whisper"],
		["raid"] = L["chatnames"]["raid"],
		["party"] = L["chatnames"]["party"],
		["say"] = L["chatnames"]["say"],
		["yell"] = L["chatnames"]["yell"],
		["officer"] = L["chatnames"]["officer"],
		["guild"] = L["chatnames"]["guild"],
	},
	["defaultlogindex"] = 1,
	["defaultline"] = 0,
	["copywindowpointer"] = "ChatLogCopyFrame",
	["copywindowmaxlines"] = 200,
	["savedconfdefaults"] = {
		["chatlog"] = false,
		["combatlog"] = false,
		["defaultlog"] = true,
	},
}

CHATLOG_SAVED_CONF = CHATLOG_DEFAULT_CONF["savedconfdefaults"]

CHATLOG_TEMP_CONF = {
	["currentlogindex"] = CHATLOG_DEFAULT_CONF["defaultlogindex"],
	["currentline"] = CHATLOG_DEFAULT_CONF["defaultline"],
}

--[[ Popup dialogs ]]
StaticPopupDialogs["CHATLOG_CLEARALL"] = {
	text = L["clearallpopup"][1],
	button1 = L["clearallpopup"][2],
	button2 = L["clearallpopup"][3],
	OnAccept = function ()
		ChatLog:ClearAllLogs()
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1,
	showAlert = 1,
}
StaticPopupDialogs["CHATLOG_EMPTY"] = {
	text = L["emptypopup"][1],
	button1 = L["emptypopup"][2],
	button2 = L["emptypopup"][3],
	OnAccept = function ()
		ChatLog:EmptyCurrentLog()
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1,
	showAlert = 1,
}
StaticPopupDialogs["CHATLOG_RESET"] = {
	text = L["resetpopup"][1],
	button1 = L["resetpopup"][2],
	button2 = L["resetpopup"][3],
	OnAccept = function ()
		ChatLog:Reset()
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1,
	showAlert = 1,
}

--[[ Logs ]]
CHATLOG_LOGS = {}

--[[ Creating AddOn ]]
ChatLog = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceEvent-2.0")
local DropdownCustomChats = AceLibrary("Dewdrop-2.0")
local DropdownGeneralChats = AceLibrary("Dewdrop-2.0")

function ChatLog:OnInitialize()
	local Fonts = {
		["GameFontNormal"] = {
			["Font"] = { GameFontNormal:GetFont() },
			["TextColor"] = { GameFontNormal:GetTextColor() },
		},
		["GameFontNormalSmall"] = {
			["Font"] = { GameFontNormalSmall:GetFont() },
			["TextColor"] = { GameFontNormalSmall:GetTextColor() },
		},
		["ChatFontNormal"] = {
			["Font"] = { ChatFontNormal:GetFont() },
			["TextColor"] = { ChatFontNormal:GetTextColor() },
		}
	}
	
	--[[ General frame ]]
	chatlogFrame = CreateFrame("Frame", "ChatLogFrame", UIParent)
	chatlogFrame:EnableMouse(true)
	chatlogFrame:SetMovable(true)
	chatlogFrame:SetToplevel(true)
	chatlogFrame:SetWidth(600)
	chatlogFrame:SetHeight(600)
	chatlogFrame:SetPoint("TOP", UIParent, "TOP", CHATLOG_DEFAULT_CONF["position"].x, CHATLOG_DEFAULT_CONF["position"].y)
	chatlogFrame:SetBackdrop ( {
		bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
		edgeFile = "Interface/DialogFrame/UI-DialogBox-Border", tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 5, right = 5, top = 5, bottom = 5 },
	} )
	chatlogFrame:SetScript("OnShow", function()
		getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"]):Hide()
		PlaySound("SPELLBOOKOPEN")
	end)
	chatlogFrame:SetScript("OnHide", function()
		PlaySound("SPELLBOOKCLOSE")
		DropdownCustomChats:Close()
		DropdownGeneralChats:Close()
	end)
	chatlogFrame:SetScript("OnMouseDown", function(args)
		if arg1 == "LeftButton" then
			chatlogFrame:StartMoving()
		end
		if arg1 == "MiddleButton" then
			self:ResetPosition()
		end
	end)
	chatlogFrame:SetScript("OnMouseUp", function() chatlogFrame:StopMovingOrSizing() end)
	
	local chatlogTitle = chatlogFrame:CreateTexture("ChatLogTitle", "ARTWORK")
	chatlogTitle:SetTexture("Interface/DialogFrame/UI-DialogBox-Header")
	chatlogTitle:SetWidth(256)
	chatlogTitle:SetHeight(64)
	chatlogTitle:SetPoint("TOP", 0, 12)
	
	local chatlogTitleText = chatlogFrame:CreateFontString()
	chatlogTitleText:SetFont(Fonts["GameFontNormal"]["Font"][1], Fonts["GameFontNormal"]["Font"][2], "OUTLINE")
	chatlogTitleText:SetTextColor(Fonts["GameFontNormal"]["TextColor"][1], Fonts["GameFontNormal"]["TextColor"][2], Fonts["GameFontNormal"]["TextColor"][3], Fonts["GameFontNormal"]["TextColor"][4])
	chatlogTitleText:SetPoint("TOP", chatlogTitle, "TOP", 0, -14)
	chatlogTitleText:SetText("ChatLog v" .. self.version)
	
	local chatlogTitleInfoFrame = CreateFrame("Frame", "ChatLogTitleInfoFrame", chatlogFrame)
	chatlogTitleInfoFrame:SetAllPoints(chatlogFrame)
	
	local chatlogTitleInfoMaxLog = chatlogTitleInfoFrame:CreateFontString()
	chatlogTitleInfoMaxLog:SetFont(Fonts["GameFontNormalSmall"]["Font"][1], Fonts["GameFontNormalSmall"]["Font"][2])
	chatlogTitleInfoMaxLog:SetTextColor(CHATLOG_DEFAULT_CONF["colors"]["maxlog"].r, CHATLOG_DEFAULT_CONF["colors"]["maxlog"].g, CHATLOG_DEFAULT_CONF["colors"]["maxlog"].b, CHATLOG_DEFAULT_CONF["colors"]["maxlog"].a)
	chatlogTitleInfoMaxLog:SetPoint("TOP", chatlogTitle, "TOP", 0, -44)
	chatlogTitleInfoMaxLog:SetText(L["maxlog"] .. CHATLOG_DEFAULT_CONF["maxlog"] .. L["maxloglines"])
	
	chatlogTitleInfoTab = chatlogTitleInfoFrame:CreateFontString()
	chatlogTitleInfoTab:SetFont(Fonts["GameFontNormalSmall"]["Font"][1], Fonts["GameFontNormalSmall"]["Font"][2])
	chatlogTitleInfoTab:SetTextColor(CHATLOG_DEFAULT_CONF["colors"]["tab"].r, CHATLOG_DEFAULT_CONF["colors"]["tab"].g, CHATLOG_DEFAULT_CONF["colors"]["tab"].b, CHATLOG_DEFAULT_CONF["colors"]["tab"].a)
	chatlogTitleInfoTab:SetPoint("TOP", chatlogTitleInfoMaxLog, "TOP", 0, -20)
	chatlogTitleInfoTab:SetText("< >")
	
	chatlogTitleInfoCurrentLine = chatlogTitleInfoFrame:CreateFontString()
	chatlogTitleInfoCurrentLine:SetFont(Fonts["GameFontNormalSmall"]["Font"][1], Fonts["GameFontNormalSmall"]["Font"][2])
	chatlogTitleInfoCurrentLine:SetTextColor(CHATLOG_DEFAULT_CONF["colors"]["currentline"].r, CHATLOG_DEFAULT_CONF["colors"]["currentline"].g, CHATLOG_DEFAULT_CONF["colors"]["currentline"].b, CHATLOG_DEFAULT_CONF["colors"]["currentline"].a)
	chatlogTitleInfoCurrentLine:SetPoint("TOP", chatlogFrame, "TOP", 0, -65)
	chatlogTitleInfoCurrentLine:SetText("0 / 0")
	
	local chatlogButtonClearAll = CreateFrame("Button", "ChatLogButtonClearAll", chatlogFrame, OptionsButtonTemplate)
	chatlogButtonClearAll:SetNormalTexture("Interface/Buttons/UI-DialogBox-Button-Up")
	chatlogButtonClearAll:SetPushedTexture("Interface/Buttons/UI-DialogBox-Button-Down")
	chatlogButtonClearAll:SetHighlightTexture("Interface/Buttons/UI-DialogBox-Button-Highlight")
	chatlogButtonClearAll:SetWidth(75)
	chatlogButtonClearAll:SetHeight(33)
	chatlogButtonClearAll:SetPoint("TOPLEFT", chatlogFrame, "TOPLEFT", 23, -20)
	chatlogButtonClearAll:SetFontString(chatlogButtonClearAll:CreateFontString())
	chatlogButtonClearAll:GetFontString():SetPoint("TOP", chatlogButtonClearAll, "TOP", 0, -4)
	chatlogButtonClearAll:GetFontString():SetFont(Fonts["GameFontNormal"]["Font"][1], Fonts["GameFontNormal"]["Font"][2], "OUTLINE")
	chatlogButtonClearAll:GetFontString():SetText(L["clearall"])
	chatlogButtonClearAll:SetScript("OnClick", function() StaticPopup_Show("CHATLOG_CLEARALL") end)
	
	local chatlogButtonReset = CreateFrame("Button", "ChatLogButtonReset", chatlogFrame, OptionsButtonTemplate)
	chatlogButtonReset:SetNormalTexture("Interface/Buttons/UI-DialogBox-Button-Up")
	chatlogButtonReset:SetPushedTexture("Interface/Buttons/UI-DialogBox-Button-Down")
	chatlogButtonReset:SetHighlightTexture("Interface/Buttons/UI-DialogBox-Button-Highlight")
	chatlogButtonReset:SetWidth(75)
	chatlogButtonReset:SetHeight(33)
	chatlogButtonReset:SetPoint("TOP", chatlogButtonClearAll, "BOTTOM", 0, 5)
	chatlogButtonReset:SetFontString(chatlogButtonReset:CreateFontString())
	chatlogButtonReset:GetFontString():SetPoint("TOP", chatlogButtonReset, "TOP", 0, -4)
	chatlogButtonReset:GetFontString():SetFont(Fonts["GameFontNormal"]["Font"][1], Fonts["GameFontNormal"]["Font"][2], "OUTLINE")
	chatlogButtonReset:GetFontString():SetText(L["reset"])
	chatlogButtonReset:SetScript("OnClick", function() StaticPopup_Show("CHATLOG_RESET") end)
	
	chatlogCheckboxEnabledDefault = CreateFrame("CheckButton", "ChatLogCheckboxEnabledDefault", chatlogFrame, OptionsCheckButtonTemplate)
	chatlogCheckboxEnabledDefault:SetNormalTexture("Interface/Buttons/UI-CheckBox-Up")
	chatlogCheckboxEnabledDefault:SetPushedTexture("Interface/Buttons/UI-CheckBox-Down")
	chatlogCheckboxEnabledDefault:SetHighlightTexture("Interface/Buttons/UI-CheckBox-Highlight")
	chatlogCheckboxEnabledDefault:SetCheckedTexture("Interface/Buttons/UI-CheckBox-Check")
	chatlogCheckboxEnabledDefault:SetWidth(33)
	chatlogCheckboxEnabledDefault:SetHeight(33)
	chatlogCheckboxEnabledDefault:SetPoint("LEFT", chatlogButtonClearAll, "RIGHT", 0, 5)
	chatlogCheckboxEnabledDefault:SetFontString(chatlogCheckboxEnabledDefault:CreateFontString())
	chatlogCheckboxEnabledDefault:GetFontString():SetPoint("LEFT", chatlogCheckboxEnabledDefault, "RIGHT")
	chatlogCheckboxEnabledDefault:GetFontString():SetFont(Fonts["GameFontNormalSmall"]["Font"][1], Fonts["GameFontNormalSmall"]["Font"][2], "OUTLINE")
	chatlogCheckboxEnabledDefault:GetFontString():SetTextColor(Fonts["GameFontNormalSmall"]["TextColor"][1], Fonts["GameFontNormalSmall"]["TextColor"][2], Fonts["GameFontNormalSmall"]["TextColor"][3], Fonts["GameFontNormalSmall"]["TextColor"][4])
	chatlogCheckboxEnabledDefault:GetFontString():SetText(L["enableddefault"])
	chatlogCheckboxEnabledDefault:SetScript("OnEnter", function() self:SetTooltip(L["enableddefaulttooltip"]) end)
	chatlogCheckboxEnabledDefault:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogCheckboxEnabledDefault:SetScript("OnClick", function()
		CHATLOG_SAVED_CONF["defaultlog"] = not CHATLOG_SAVED_CONF["defaultlog"]
	end)
	
	chatlogCheckboxChatLog = CreateFrame("CheckButton", "ChatLogCheckboxChatLog", chatlogFrame, OptionsCheckButtonTemplate)
	chatlogCheckboxChatLog:SetNormalTexture("Interface/Buttons/UI-CheckBox-Up")
	chatlogCheckboxChatLog:SetPushedTexture("Interface/Buttons/UI-CheckBox-Down")
	chatlogCheckboxChatLog:SetHighlightTexture("Interface/Buttons/UI-CheckBox-Highlight")
	chatlogCheckboxChatLog:SetCheckedTexture("Interface/Buttons/UI-CheckBox-Check")
	chatlogCheckboxChatLog:SetWidth(33)
	chatlogCheckboxChatLog:SetHeight(33)
	chatlogCheckboxChatLog:SetPoint("TOP", chatlogFrame, "TOP", 105, -17)
	chatlogCheckboxChatLog:SetFontString(chatlogCheckboxChatLog:CreateFontString())
	chatlogCheckboxChatLog:GetFontString():SetPoint("LEFT", chatlogCheckboxChatLog, "RIGHT")
	chatlogCheckboxChatLog:GetFontString():SetFont(Fonts["GameFontNormalSmall"]["Font"][1], Fonts["GameFontNormalSmall"]["Font"][2], "OUTLINE")
	chatlogCheckboxChatLog:GetFontString():SetTextColor(Fonts["GameFontNormalSmall"]["TextColor"][1], Fonts["GameFontNormalSmall"]["TextColor"][2], Fonts["GameFontNormalSmall"]["TextColor"][3], Fonts["GameFontNormalSmall"]["TextColor"][4])
	chatlogCheckboxChatLog:GetFontString():SetText(L["chatlog"])
	chatlogCheckboxChatLog:SetScript("OnEnter", function() self:SetTooltip(L["chatlogtooltip"]) end)
	chatlogCheckboxChatLog:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogCheckboxChatLog:SetScript("OnClick", function()
		CHATLOG_SAVED_CONF["chatlog"] = not CHATLOG_SAVED_CONF["chatlog"]
		self:ChatLogEnable(CHATLOG_SAVED_CONF["chatlog"])
	end)
	
	chatlogCheckboxCombatLog = CreateFrame("CheckButton", "ChatLogCheckboxCombatLog", chatlogFrame, OptionsCheckButtonTemplate)
	chatlogCheckboxCombatLog:SetNormalTexture("Interface/Buttons/UI-CheckBox-Up")
	chatlogCheckboxCombatLog:SetPushedTexture("Interface/Buttons/UI-CheckBox-Down")
	chatlogCheckboxCombatLog:SetHighlightTexture("Interface/Buttons/UI-CheckBox-Highlight")
	chatlogCheckboxCombatLog:SetCheckedTexture("Interface/Buttons/UI-CheckBox-Check")
	chatlogCheckboxCombatLog:SetWidth(33)
	chatlogCheckboxCombatLog:SetHeight(33)
	chatlogCheckboxCombatLog:SetPoint("TOP", chatlogFrame, "TOP", 105, -42)
	chatlogCheckboxCombatLog:SetFontString(chatlogCheckboxCombatLog:CreateFontString())
	chatlogCheckboxCombatLog:GetFontString():SetPoint("LEFT", chatlogCheckboxCombatLog, "RIGHT")
	chatlogCheckboxCombatLog:GetFontString():SetFont(Fonts["GameFontNormalSmall"]["Font"][1], Fonts["GameFontNormalSmall"]["Font"][2], "OUTLINE")
	chatlogCheckboxCombatLog:GetFontString():SetTextColor(Fonts["GameFontNormalSmall"]["TextColor"][1], Fonts["GameFontNormalSmall"]["TextColor"][2], Fonts["GameFontNormalSmall"]["TextColor"][3], Fonts["GameFontNormalSmall"]["TextColor"][4])
	chatlogCheckboxCombatLog:GetFontString():SetText(L["combatlog"])
	chatlogCheckboxCombatLog:SetScript("OnEnter", function() self:SetTooltip(L["combatlogtooltip"]) end)
	chatlogCheckboxCombatLog:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogCheckboxCombatLog:SetScript("OnClick", function()
		CHATLOG_SAVED_CONF["combatlog"] = not CHATLOG_SAVED_CONF["combatlog"]
		self:CombatLogEnable(CHATLOG_SAVED_CONF["combatlog"])
	end)
	
	chatlogScrollingMessageFrame = CreateFrame("ScrollingMessageFrame", "ChatLogScrollingMessageFrame", chatlogFrame)
	chatlogScrollingMessageFrame:SetFading(false)
	chatlogScrollingMessageFrame:SetMaxLines(CHATLOG_DEFAULT_CONF["scrollmaxlines"])
	chatlogScrollingMessageFrame:SetWidth(535)
	chatlogScrollingMessageFrame:SetHeight(450)
	chatlogScrollingMessageFrame:SetPoint("TOPLEFT", 30, -80)
	chatlogScrollingMessageFrame:CreateFontString()
	chatlogScrollingMessageFrame:SetFont(Fonts["ChatFontNormal"]["Font"][1], Fonts["ChatFontNormal"]["Font"][2])
	chatlogScrollingMessageFrame:SetJustifyH("LEFT")
	chatlogScrollingMessageFrame:SetScript("OnHyperlinkClick", function(args) SetItemRef(arg1, arg2, arg3) end)
	
	local chatlogButtonScrollBottom = CreateFrame("Button", "ChatLogButtonScrollBottom", chatlogFrame)
	chatlogButtonScrollBottom:SetNormalTexture("Interface/ChatFrame/UI-ChatIcon-ScrollEnd-Up")
	chatlogButtonScrollBottom:SetPushedTexture("Interface/ChatFrame/UI-ChatIcon-ScrollEnd-Down")
	chatlogButtonScrollBottom:SetHighlightTexture("Interface/Buttons/UI-Common-MouseHilight")
	chatlogButtonScrollBottom:SetWidth(32)
	chatlogButtonScrollBottom:SetHeight(32)
	chatlogButtonScrollBottom:SetPoint("BOTTOMLEFT", chatlogScrollingMessageFrame, "BOTTOMRIGHT")
	chatlogButtonScrollBottom:SetScript("OnEnter", function() self:SetTooltip(L["scroll"]["bottom"]) end)
	chatlogButtonScrollBottom:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonScrollBottom:SetScript("OnClick", function()
		PlaySound("igChatBottom")
		CHATLOG_TEMP_CONF["currentline"] = table.getn(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"])
		self:ShowCurrentLog()
	end)
	
	local chatlogButtonScrollDown = CreateFrame("Button", "ChatLogButtonScrollDown", chatlogFrame)
	chatlogButtonScrollDown:SetNormalTexture("Interface/ChatFrame/UI-ChatIcon-ScrollDown-Up")
	chatlogButtonScrollDown:SetPushedTexture("Interface/ChatFrame/UI-ChatIcon-ScrollDown-Down")
	chatlogButtonScrollDown:SetHighlightTexture("Interface/Buttons/UI-Common-MouseHilight")
	chatlogButtonScrollDown:SetWidth(32)
	chatlogButtonScrollDown:SetHeight(32)
	chatlogButtonScrollDown:SetPoint("BOTTOM", chatlogButtonScrollBottom, "TOP")
	chatlogButtonScrollDown:SetScript("OnEnter", function() self:SetTooltip(L["scroll"]["linedown"]) end)
	chatlogButtonScrollDown:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonScrollDown:SetScript("OnClick", function()
		PlaySound("igChatScrollDown")
		self:Scroll(1)
	end)
	chatlogButtonScrollDown:SetScript("OnUpdate", function()
		if chatlogButtonScrollDown:GetButtonState() == "PUSHED" then
			self:Scroll(1)
		end
	end)
	
	local chatlogButtonScrollUp = CreateFrame("Button", "ChatLogButtonScrollUp", chatlogFrame)
	chatlogButtonScrollUp:SetNormalTexture("Interface/ChatFrame/UI-ChatIcon-ScrollUp-Up")
	chatlogButtonScrollUp:SetPushedTexture("Interface/ChatFrame/UI-ChatIcon-ScrollUp-Down")
	chatlogButtonScrollUp:SetHighlightTexture("Interface/Buttons/UI-Common-MouseHilight")
	chatlogButtonScrollUp:SetWidth(32)
	chatlogButtonScrollUp:SetHeight(32)
	chatlogButtonScrollUp:SetPoint("BOTTOM", chatlogButtonScrollDown, "TOP")
	chatlogButtonScrollUp:SetScript("OnEnter", function() self:SetTooltip(L["scroll"]["lineup"]) end)
	chatlogButtonScrollUp:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonScrollUp:SetScript("OnClick", function()
		PlaySound("igChatScrollUp")
		self:Scroll(-1)
	end)
	chatlogButtonScrollUp:SetScript("OnUpdate", function()
		if chatlogButtonScrollUp:GetButtonState() == "PUSHED" then
			self:Scroll(-1)
		end
	end)
	
	local chatlogButtonScrollPageDown = CreateFrame("Button", "ChatLogButtonScrollPageDown", chatlogFrame)
	chatlogButtonScrollPageDown:SetNormalTexture("Interface/ChatFrame/UI-ChatIcon-ScrollDown-Disabled")
	chatlogButtonScrollPageDown:SetPushedTexture("Interface/ChatFrame/UI-ChatIcon-ScrollDown-Down")
	chatlogButtonScrollPageDown:SetHighlightTexture("Interface/Buttons/UI-Common-MouseHilight")
	chatlogButtonScrollPageDown:SetWidth(32)
	chatlogButtonScrollPageDown:SetHeight(32)
	chatlogButtonScrollPageDown:SetPoint("BOTTOM", chatlogButtonScrollUp, "TOP")
	chatlogButtonScrollPageDown:SetScript("OnEnter", function() self:SetTooltip(L["scroll"]["pagedown"]) end)
	chatlogButtonScrollPageDown:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonScrollPageDown:SetScript("OnClick", function()
		PlaySound("igChatScrollDown")
		self:Scroll(CHATLOG_DEFAULT_CONF["scrollpage"])
	end)
	
	local chatlogButtonScrollPageUp = CreateFrame("Button", "ChatLogButtonScrollPageUp", chatlogFrame)
	chatlogButtonScrollPageUp:SetNormalTexture("Interface/ChatFrame/UI-ChatIcon-ScrollUp-Disabled")
	chatlogButtonScrollPageUp:SetPushedTexture("Interface/ChatFrame/UI-ChatIcon-ScrollUp-Down")
	chatlogButtonScrollPageUp:SetHighlightTexture("Interface/Buttons/UI-Common-MouseHilight")
	chatlogButtonScrollPageUp:SetWidth(32)
	chatlogButtonScrollPageUp:SetHeight(32)
	chatlogButtonScrollPageUp:SetPoint("BOTTOM", chatlogButtonScrollPageDown, "TOP")
	chatlogButtonScrollPageUp:SetScript("OnEnter", function() self:SetTooltip(L["scroll"]["pageup"]) end)
	chatlogButtonScrollPageUp:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonScrollPageUp:SetScript("OnClick", function()
		PlaySound("igChatScrollUp")
		self:Scroll(-CHATLOG_DEFAULT_CONF["scrollpage"])
	end)
	
	local chatlogButtonScrollTop = CreateFrame("Button", "ChatLogButtonScrollTop", chatlogFrame)
	chatlogButtonScrollTop:SetNormalTexture("Interface/ChatFrame/UI-ChatIcon-Chat-Up")
	chatlogButtonScrollTop:SetPushedTexture("Interface/ChatFrame/UI-ChatIcon-Chat-Down")
	chatlogButtonScrollTop:SetHighlightTexture("Interface/Buttons/UI-Common-MouseHilight")
	chatlogButtonScrollTop:SetWidth(32)
	chatlogButtonScrollTop:SetHeight(32)
	chatlogButtonScrollTop:SetPoint("TOPLEFT", chatlogScrollingMessageFrame, "TOPRIGHT")
	chatlogButtonScrollTop:SetScript("OnEnter", function() self:SetTooltip(L["scroll"]["top"]) end)
	chatlogButtonScrollTop:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonScrollTop:SetScript("OnClick", function()
		PlaySound("igChatBottom")
		CHATLOG_TEMP_CONF["currentline"] = table.getn(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"])
		if CHATLOG_TEMP_CONF["currentline"] > 1 then
			CHATLOG_TEMP_CONF["currentline"] = 1
		end
		self:ShowCurrentLog()
	end)
	
	local chatlogButtonTabs = {}
	chatlogButtonTabs.chatlogButtonWhisperTab = CreateFrame("Button", "ChatLogButtonWhisperTab", chatlogFrame)
	chatlogButtonTabs.chatlogButtonWhisperTab:SetNormalTexture("Interface/Icons/Ability_Stealth")
	chatlogButtonTabs.chatlogButtonWhisperTab:SetPushedTexture("Interface/Icons/Ability_Stealth")
	chatlogButtonTabs.chatlogButtonWhisperTab:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
	chatlogButtonTabs.chatlogButtonWhisperTab:SetWidth(23)
	chatlogButtonTabs.chatlogButtonWhisperTab:SetHeight(23)
	chatlogButtonTabs.chatlogButtonWhisperTab:SetPoint("TOP", chatlogButtonScrollTop, "BOTTOM", 0, -5)
	chatlogButtonTabs.chatlogButtonWhisperTab:SetScript("OnEnter", function() self:SetTooltip( {L["chatnames"]["whisper"], self:GetEnabledMsg(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["whisper"]]["enabled"]), L["nblines"] .. table.getn(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["whisper"]]["logs"])} ) end)
	chatlogButtonTabs.chatlogButtonWhisperTab:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonTabs.chatlogButtonWhisperTab:SetScript("OnClick", function() self:ChangeLog(CHATLOG_DEFAULT_CONF["defaultindexes"]["whisper"]) end)
	
	chatlogButtonTabs.chatlogButtonRaidTab = CreateFrame("Button", "ChatLogButtonRaidTab", chatlogFrame)
	chatlogButtonTabs.chatlogButtonRaidTab:SetNormalTexture("Interface/Icons/INV_Misc_Head_Dragon_01")
	chatlogButtonTabs.chatlogButtonRaidTab:SetPushedTexture("Interface/Icons/INV_Misc_Head_Dragon_01")
	chatlogButtonTabs.chatlogButtonRaidTab:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
	chatlogButtonTabs.chatlogButtonRaidTab:SetWidth(23)
	chatlogButtonTabs.chatlogButtonRaidTab:SetHeight(23)
	chatlogButtonTabs.chatlogButtonRaidTab:SetPoint("TOP", chatlogButtonTabs.chatlogButtonWhisperTab, "BOTTOM")
	chatlogButtonTabs.chatlogButtonRaidTab:SetScript("OnEnter", function() self:SetTooltip( {L["chatnames"]["raid"], self:GetEnabledMsg(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["raid"]]["enabled"]), L["nblines"] .. table.getn(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["raid"]]["logs"])} ) end)
	chatlogButtonTabs.chatlogButtonRaidTab:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonTabs.chatlogButtonRaidTab:SetScript("OnClick", function() self:ChangeLog(CHATLOG_DEFAULT_CONF["defaultindexes"]["raid"]) end)
	
	chatlogButtonTabs.chatlogButtonPartyTab = CreateFrame("Button", "ChatLogButtonPartyTab", chatlogFrame)
	chatlogButtonTabs.chatlogButtonPartyTab:SetNormalTexture("Interface/Icons/Spell_Holy_PrayerofSpirit")
	chatlogButtonTabs.chatlogButtonPartyTab:SetPushedTexture("Interface/Icons/Spell_Holy_PrayerofSpirit")
	chatlogButtonTabs.chatlogButtonPartyTab:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
	chatlogButtonTabs.chatlogButtonPartyTab:SetWidth(23)
	chatlogButtonTabs.chatlogButtonPartyTab:SetHeight(23)
	chatlogButtonTabs.chatlogButtonPartyTab:SetPoint("TOP", chatlogButtonTabs.chatlogButtonRaidTab, "BOTTOM")
	chatlogButtonTabs.chatlogButtonPartyTab:SetScript("OnEnter", function() self:SetTooltip( {L["chatnames"]["party"], self:GetEnabledMsg(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["party"]]["enabled"]), L["nblines"] .. table.getn(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["party"]]["logs"])} ) end)
	chatlogButtonTabs.chatlogButtonPartyTab:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonTabs.chatlogButtonPartyTab:SetScript("OnClick", function() self:ChangeLog(CHATLOG_DEFAULT_CONF["defaultindexes"]["party"]) end)
	
	chatlogButtonTabs.chatlogButtonSayTab = CreateFrame("Button", "ChatLogButtonSayTab", chatlogFrame)
	chatlogButtonTabs.chatlogButtonSayTab:SetNormalTexture("Interface/Icons/INV_Misc_Bomb_04")
	chatlogButtonTabs.chatlogButtonSayTab:SetPushedTexture("Interface/Icons/INV_Misc_Bomb_04")
	chatlogButtonTabs.chatlogButtonSayTab:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
	chatlogButtonTabs.chatlogButtonSayTab:SetWidth(23)
	chatlogButtonTabs.chatlogButtonSayTab:SetHeight(23)
	chatlogButtonTabs.chatlogButtonSayTab:SetPoint("TOP", chatlogButtonTabs.chatlogButtonPartyTab, "BOTTOM")
	chatlogButtonTabs.chatlogButtonSayTab:SetScript("OnEnter", function() self:SetTooltip( {L["chatnames"]["say"], self:GetEnabledMsg(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["say"]]["enabled"]), L["nblines"] .. table.getn(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["say"]]["logs"])} ) end)
	chatlogButtonTabs.chatlogButtonSayTab:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonTabs.chatlogButtonSayTab:SetScript("OnClick", function() self:ChangeLog(CHATLOG_DEFAULT_CONF["defaultindexes"]["say"]) end)
	
	chatlogButtonTabs.chatlogButtonYellTab = CreateFrame("Button", "ChatLogButtonYellTab", chatlogFrame)
	chatlogButtonTabs.chatlogButtonYellTab:SetNormalTexture("Interface/Icons/Spell_Fire_Incinerate")
	chatlogButtonTabs.chatlogButtonYellTab:SetPushedTexture("Interface/Icons/Spell_Fire_Incinerate")
	chatlogButtonTabs.chatlogButtonYellTab:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
	chatlogButtonTabs.chatlogButtonYellTab:SetWidth(23)
	chatlogButtonTabs.chatlogButtonYellTab:SetHeight(23)
	chatlogButtonTabs.chatlogButtonYellTab:SetPoint("TOP", chatlogButtonTabs.chatlogButtonSayTab, "BOTTOM")
	chatlogButtonTabs.chatlogButtonYellTab:SetScript("OnEnter", function() self:SetTooltip( {L["chatnames"]["yell"], self:GetEnabledMsg(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["yell"]]["enabled"]), L["nblines"] .. table.getn(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["yell"]]["logs"])} ) end)
	chatlogButtonTabs.chatlogButtonYellTab:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonTabs.chatlogButtonYellTab:SetScript("OnClick", function() self:ChangeLog(CHATLOG_DEFAULT_CONF["defaultindexes"]["yell"]) end)
	
	chatlogButtonTabs.chatlogButtonOfficerTab = CreateFrame("Button", "ChatLogButtonOfficerTab", chatlogFrame)
	chatlogButtonTabs.chatlogButtonOfficerTab:SetNormalTexture("Interface/Icons/Spell_Nature_EnchantArmor")
	chatlogButtonTabs.chatlogButtonOfficerTab:SetPushedTexture("Interface/Icons/Spell_Nature_EnchantArmor")
	chatlogButtonTabs.chatlogButtonOfficerTab:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
	chatlogButtonTabs.chatlogButtonOfficerTab:SetWidth(23)
	chatlogButtonTabs.chatlogButtonOfficerTab:SetHeight(23)
	chatlogButtonTabs.chatlogButtonOfficerTab:SetPoint("TOP", chatlogButtonTabs.chatlogButtonYellTab, "BOTTOM")
	chatlogButtonTabs.chatlogButtonOfficerTab:SetScript("OnEnter", function() self:SetTooltip( {L["chatnames"]["officer"], self:GetEnabledMsg(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["officer"]]["enabled"]), L["nblines"] .. table.getn(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["officer"]]["logs"])} ) end)
	chatlogButtonTabs.chatlogButtonOfficerTab:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonTabs.chatlogButtonOfficerTab:SetScript("OnClick", function() self:ChangeLog(CHATLOG_DEFAULT_CONF["defaultindexes"]["officer"]) end)
	
	chatlogButtonTabs.chatlogButtonGuildTab = CreateFrame("Button", "ChatLogButtonGuildTab", chatlogFrame)
	chatlogButtonTabs.chatlogButtonGuildTab:SetNormalTexture("Interface/Icons/INV_Shirt_GuildTabard_01")
	chatlogButtonTabs.chatlogButtonGuildTab:SetPushedTexture("Interface/Icons/INV_Shirt_GuildTabard_01")
	chatlogButtonTabs.chatlogButtonGuildTab:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
	chatlogButtonTabs.chatlogButtonGuildTab:SetWidth(23)
	chatlogButtonTabs.chatlogButtonGuildTab:SetHeight(23)
	chatlogButtonTabs.chatlogButtonGuildTab:SetPoint("TOP", chatlogButtonTabs.chatlogButtonOfficerTab, "BOTTOM")
	chatlogButtonTabs.chatlogButtonGuildTab:SetScript("OnEnter", function() self:SetTooltip( {L["chatnames"]["guild"], self:GetEnabledMsg(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["guild"]]["enabled"]), L["nblines"] .. table.getn(CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["guild"]]["logs"])} ) end)
	chatlogButtonTabs.chatlogButtonGuildTab:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogButtonTabs.chatlogButtonGuildTab:SetScript("OnClick", function() self:ChangeLog(CHATLOG_DEFAULT_CONF["defaultindexes"]["guild"]) end)
	
	--[[ Custom chats & dropdown ]]
	chatlogButtonTabs.chatlogButtonCustomTab = CreateFrame("Button", "ChatLogButtonCustomTab", chatlogFrame)
	chatlogButtonTabs.chatlogButtonCustomTab:SetNormalTexture("Interface/Icons/Trade_Engineering")
	chatlogButtonTabs.chatlogButtonCustomTab:SetPushedTexture("Interface/Icons/Trade_Engineering")
	chatlogButtonTabs.chatlogButtonCustomTab:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
	chatlogButtonTabs.chatlogButtonCustomTab:SetWidth(23)
	chatlogButtonTabs.chatlogButtonCustomTab:SetHeight(23)
	chatlogButtonTabs.chatlogButtonCustomTab:SetPoint("TOP", chatlogButtonTabs.chatlogButtonGuildTab, "BOTTOM", 0, -10)
	chatlogButtonTabs.chatlogButtonCustomTab:SetScript("OnEnter", function() self:SetTooltip( {L["chatnames"]["custom"]} ) end)
	chatlogButtonTabs.chatlogButtonCustomTab:SetScript("OnLeave", function() self:UnsetTooltip() end)
	DropdownCustomChats:Register(chatlogButtonTabs.chatlogButtonCustomTab,
		'children', function()
			self:DropdownCustomChatsInitialize()
		end,
		'point', function()
			return "TOPRIGHT"
		end,
		'relativePoint', function()
			return "TOPLEFT"
		end
	)
	chatlogButtonTabs.chatlogButtonCustomTab:SetScript("OnClick", function()
		DropdownCustomChats:Open(chatlogButtonTabs.chatlogButtonCustomTab)
	end)
	
	--[[ General chats & dropdown ]]
	chatlogButtonTabs.chatlogButtonGeneralTab = CreateFrame("Button", "ChatLogButtonGeneralTab", chatlogFrame)
	chatlogButtonTabs.chatlogButtonGeneralTab:SetNormalTexture("Interface/Icons/Spell_Shadow_SoulGem")
	chatlogButtonTabs.chatlogButtonGeneralTab:SetPushedTexture("Interface/Icons/Spell_Shadow_SoulGem")
	chatlogButtonTabs.chatlogButtonGeneralTab:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
	chatlogButtonTabs.chatlogButtonGeneralTab:SetWidth(23)
	chatlogButtonTabs.chatlogButtonGeneralTab:SetHeight(23)
	chatlogButtonTabs.chatlogButtonGeneralTab:SetPoint("TOP", chatlogButtonTabs.chatlogButtonCustomTab, "BOTTOM")
	chatlogButtonTabs.chatlogButtonGeneralTab:SetScript("OnEnter", function() self:SetTooltip( {L["chatnames"]["general"]} ) end)
	chatlogButtonTabs.chatlogButtonGeneralTab:SetScript("OnLeave", function() self:UnsetTooltip() end)
	DropdownGeneralChats:Register(chatlogButtonTabs.chatlogButtonGeneralTab,
		'children', function()
			self:DropdownGeneralChatsInitialize()
		end,
		'point', function()
			return "TOPRIGHT"
		end,
		'relativePoint', function()
			return "TOPLEFT"
		end
	)
	chatlogButtonTabs.chatlogButtonGeneralTab:SetScript("OnClick", function()
		DropdownGeneralChats:Open(chatlogButtonTabs.chatlogButtonGeneralTab)
	end)
	
	chatlogButtonDelete = CreateFrame("Button", "ChatLogButtonDelete", chatlogFrame, OptionsButtonTemplate)
	chatlogButtonDelete:SetNormalTexture("Interface/Buttons/UI-DialogBox-Button-Up")
	chatlogButtonDelete:SetPushedTexture("Interface/Buttons/UI-DialogBox-Button-Down")
	chatlogButtonDelete:SetHighlightTexture("Interface/Buttons/UI-DialogBox-Button-Highlight")
	chatlogButtonDelete:SetDisabledTexture("Interface/Buttons/UI-DialogBox-Button-Disabled")
	chatlogButtonDelete:SetWidth(75)
	chatlogButtonDelete:SetHeight(33)
	chatlogButtonDelete:SetPoint("BOTTOMLEFT", chatlogFrame, 20, 20)
	chatlogButtonDelete:SetFontString(chatlogButtonDelete:CreateFontString())
	chatlogButtonDelete:GetFontString():SetPoint("TOP", chatlogButtonDelete, "TOP", 0, -4)
	chatlogButtonDelete:GetFontString():SetFont(Fonts["GameFontNormal"]["Font"][1], Fonts["GameFontNormal"]["Font"][2], "OUTLINE")
	chatlogButtonDelete:GetFontString():SetText(L["delete"])
	chatlogButtonDelete:SetScript("OnClick", function()
		self:DeleteCurrentLog()
		self:ChangeLog(CHATLOG_DEFAULT_CONF["defaultlogindex"])
		self:ShowCurrentLog()
	end)
	
	chatlogButtonEnable = CreateFrame("Button", "ChatLogButtonEnable", chatlogFrame, OptionsButtonTemplate)
	chatlogButtonEnable:SetNormalTexture("Interface/Buttons/UI-DialogBox-Button-Up")
	chatlogButtonEnable:SetPushedTexture("Interface/Buttons/UI-DialogBox-Button-Down")
	chatlogButtonEnable:SetHighlightTexture("Interface/Buttons/UI-DialogBox-Button-Highlight")
	chatlogButtonEnable:SetWidth(75)
	chatlogButtonEnable:SetHeight(33)
	chatlogButtonEnable:SetPoint("BOTTOM", chatlogFrame, 0, 20)
	chatlogButtonEnable:SetFontString(chatlogButtonEnable:CreateFontString())
	chatlogButtonEnable:GetFontString():SetPoint("TOP", chatlogButtonEnable, "TOP", 0, -4)
	chatlogButtonEnable:GetFontString():SetFont(Fonts["GameFontNormal"]["Font"][1], Fonts["GameFontNormal"]["Font"][2], "OUTLINE")
	chatlogButtonEnable:GetFontString():SetText(L["enable"])
	chatlogButtonEnable:SetScript("OnClick", function() self:ToggleEnableCurrentLog() end)
	
	local chatlogButtonEmpty = CreateFrame("Button", "ChatLogButtonEmpty", chatlogFrame, OptionsButtonTemplate)
	chatlogButtonEmpty:SetNormalTexture("Interface/Buttons/UI-DialogBox-Button-Up")
	chatlogButtonEmpty:SetPushedTexture("Interface/Buttons/UI-DialogBox-Button-Down")
	chatlogButtonEmpty:SetHighlightTexture("Interface/Buttons/UI-DialogBox-Button-Highlight")
	chatlogButtonEmpty:SetWidth(75)
	chatlogButtonEmpty:SetHeight(33)
	chatlogButtonEmpty:SetPoint("RIGHT", chatlogButtonEnable, "LEFT")
	chatlogButtonEmpty:SetFontString(chatlogButtonEmpty:CreateFontString())
	chatlogButtonEmpty:GetFontString():SetPoint("TOP", chatlogButtonEmpty, "TOP", 0, -4)
	chatlogButtonEmpty:GetFontString():SetFont(Fonts["GameFontNormal"]["Font"][1], Fonts["GameFontNormal"]["Font"][2], "OUTLINE")
	chatlogButtonEmpty:GetFontString():SetText(L["empty"])
	chatlogButtonEmpty:SetScript("OnClick", function() StaticPopup_Show("CHATLOG_EMPTY") end)
	
	chatlogButtonCopy = CreateFrame("Button", "ChatLogButtonCopy", chatlogFrame, OptionsButtonTemplate)
	chatlogButtonCopy:SetNormalTexture("Interface/Buttons/UI-DialogBox-Button-Up")
	chatlogButtonCopy:SetPushedTexture("Interface/Buttons/UI-DialogBox-Button-Down")
	chatlogButtonCopy:SetHighlightTexture("Interface/Buttons/UI-DialogBox-Button-Highlight")
	chatlogButtonCopy:SetDisabledTexture("Interface/Buttons/UI-DialogBox-Button-Disabled")
	chatlogButtonCopy:SetWidth(75)
	chatlogButtonCopy:SetHeight(33)
	chatlogButtonCopy:SetPoint("LEFT", chatlogButtonEnable, "RIGHT")
	chatlogButtonCopy:SetFontString(chatlogButtonCopy:CreateFontString())
	chatlogButtonCopy:GetFontString():SetPoint("TOP", chatlogButtonCopy, "TOP", 0, -4)
	chatlogButtonCopy:GetFontString():SetFont(Fonts["GameFontNormal"]["Font"][1], Fonts["GameFontNormal"]["Font"][2], "OUTLINE")
	chatlogButtonCopy:GetFontString():SetText(L["copy"])
	chatlogButtonCopy:SetScript("OnClick", function() self:ShowCopyWindow() end)
	
	local chatlogButtonClose = CreateFrame("Button", "ChatLogButtonClose", chatlogFrame, OptionsButtonTemplate)
	chatlogButtonClose:SetNormalTexture("Interface/Buttons/UI-DialogBox-Button-Up")
	chatlogButtonClose:SetPushedTexture("Interface/Buttons/UI-DialogBox-Button-Down")
	chatlogButtonClose:SetHighlightTexture("Interface/Buttons/UI-DialogBox-Button-Highlight")
	chatlogButtonClose:SetWidth(75)
	chatlogButtonClose:SetHeight(33)
	chatlogButtonClose:SetPoint("BOTTOMRIGHT", -20, 20)
	chatlogButtonClose:SetFontString(chatlogButtonClose:CreateFontString())
	chatlogButtonClose:GetFontString():SetPoint("TOP", chatlogButtonClose, "TOP", 0, -4)
	chatlogButtonClose:GetFontString():SetFont(Fonts["GameFontNormal"]["Font"][1], Fonts["GameFontNormal"]["Font"][2], "OUTLINE")
	chatlogButtonClose:GetFontString():SetText(L["close"])
	chatlogButtonClose:SetScript("OnClick", function() self:Toggle() end)
	
	chatlogFrame:Hide()
	
	--[[ Button frame ]]
	chatlogFrameMenuButton = CreateFrame("Button", "ChatLogFrameMenuButton", UIParent)
	chatlogFrameMenuButton:SetMovable(true)
	chatlogFrameMenuButton:SetWidth(32)
	chatlogFrameMenuButton:SetHeight(34)
	chatlogFrameMenuButton:SetPoint("BOTTOM", ChatFrameMenuButton, "TOP")
	chatlogFrameMenuButton:SetNormalTexture("Interface/Buttons/UI-SpellbookIcon-NextPage-Up")
	chatlogFrameMenuButton:SetPushedTexture("Interface/Buttons/UI-SpellbookIcon-NextPage-Down")
	chatlogFrameMenuButton:SetDisabledTexture("Interface/Buttons/UI-SpellbookIcon-NextPage-Disabled")
	chatlogFrameMenuButton:SetHighlightTexture("Interface/Buttons/UI-Common-MouseHilight")
	chatlogFrameMenuButton:SetScript("OnEnter", function() self:SetTooltip(L["toggletooltip"]) end)
	chatlogFrameMenuButton:SetScript("OnLeave", function() self:UnsetTooltip() end)
	chatlogFrameMenuButton:SetScript("OnClick", function() self:Toggle() end)
	chatlogFrameMenuButton:SetScript("OnMouseDown", function(args)
		if arg1 == "RightButton" then
			chatlogFrameMenuButton:StartMoving()
		end
		if arg1 == "MiddleButton" then
			self:ResetButtonPosition()
		end
	end)
	chatlogFrameMenuButton:SetScript("OnMouseUp", function() chatlogFrameMenuButton:StopMovingOrSizing() end)
	
	--[[ Copy window ]]
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"]):EnableMouse()
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"]):SetPoint("TOP", CHATLOG_DEFAULT_CONF["copyposition"].x, CHATLOG_DEFAULT_CONF["copyposition"].y)
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"]):SetScript("OnEnter", function()
		getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ScrollFrame"):UpdateScrollChildRect()
	end)
	
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "TitleText"):SetText(L["copywindow"])
	
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ScrollFrame" .. "EditBox"):SetAutoFocus(false)
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ScrollFrame" .. "EditBox"):SetScript("OnEnter", function()
		getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ScrollFrame"):UpdateScrollChildRect()
		getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ScrollFrame" .. "EditBox"):SetFocus()
	end)
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ScrollFrame" .. "EditBox"):SetScript("OnLeave", function()
		getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ScrollFrame" .. "EditBox"):ClearFocus()
	end)
	
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ButtonHide"):SetFont(Fonts["GameFontNormal"]["Font"][1], Fonts["GameFontNormal"]["Font"][2], "OUTLINE")
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ButtonHide"):SetTextColor(Fonts["ChatFontNormal"]["TextColor"][1], Fonts["ChatFontNormal"]["TextColor"][2], Fonts["ChatFontNormal"]["TextColor"][3], Fonts["ChatFontNormal"]["TextColor"][4])
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ButtonHide"):SetText(L["close"])
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ButtonHide"):SetScript("OnClick", function() getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"]):Hide() end)
	
	--[[ Disabling WoW Chatlog slashcommands ]]
	SlashCmdList["CHATLOG"] = function()
		self:Print(L["chatlogdisabled"])
	end
	SlashCmdList["COMBATLOG"] = function()
		self:Print(L["combatlogdisabled"])
	end
	
	--[[ Creating own slashcommands ]]
	local options = {
		type = 'group',
		args = {
			toggle = {
				type = 'execute',
				name = "toggle",
				desc = L["toggle"],
				func = function()
					self:Toggle()
				end,
			},
			reset = {
				type = 'execute',
				name = "reset",
				desc = L["resethelp"],
				func = function()
					StaticPopup_Show("CHATLOG_RESET")
				end,
			},
			resetloc = {
				type = 'execute',
				name = "resetloc",
				desc = L["resetloc"],
				func = function()
					self:ResetPosition()
				end,
			},
			resetbutton = {
				type = 'execute',
				name = "resetbutton",
				desc = L["resetbutton"],
				func = function()
					self:ResetButtonPosition()
				end,
			},
			logdefault = {
				type = 'toggle',
				name = "logdefault",
				desc = L["enableddefault"],
				get = function()
					return CHATLOG_SAVED_CONF["defaultlog"]
				end,
				set = function(isEnabled)
					CHATLOG_SAVED_CONF["defaultlog"] = isEnabled
					self:DefaultLogEnable(isEnabled)
				end,
			},
			logchat = {
				type = 'toggle',
				name = "logchat",
				desc = L["chatlog"],
				get = function()
					return CHATLOG_SAVED_CONF["chatlog"]
				end,
				set = function(isEnabled)
					CHATLOG_SAVED_CONF["chatlog"] = isEnabled
					self:ChatLogEnable(isEnabled)
				end,
			},
			logcombat = {
				type = 'toggle',
				name = "logcombat",
				desc = L["combatlog"],
				get = function()
					return CHATLOG_SAVED_CONF["combatlog"]
				end,
				set = function(isEnabled)
					CHATLOG_SAVED_CONF["combatlog"] = isEnabled
					self:CombatLogEnable(isEnabled)
				end,
			},
			clearall = {
				type = 'execute',
				name = "resetloc",
				desc = L["clearallhelp"],
				func = function()
					StaticPopup_Show("CHATLOG_CLEARALL")
				end,
			},
		}
	}
	self:RegisterChatCommand( {"/clog"}, options )
	
	--[[ Miscelleaneous elements status at loading ]]
	self:DefaultLogEnable(CHATLOG_SAVED_CONF["defaultlog"])
	self:ChatLogEnable(CHATLOG_SAVED_CONF["chatlog"])
	self:CombatLogEnable(CHATLOG_SAVED_CONF["combatlog"])
	
	--[[ Checks & creates default log structures ]]
	self:InitDefaultLogStructures()
	self:AddHeaderToStructures()
end

function ChatLog:OnEnable()
	--[[ Registering events ]]
	self:RegisterEvent("CHAT_MSG_WHISPER")
	self:RegisterEvent("CHAT_MSG_WHISPER_INFORM")
	self:RegisterEvent("CHAT_MSG_RAID")
	self:RegisterEvent("CHAT_MSG_RAID_LEADER")
	self:RegisterEvent("CHAT_MSG_RAID_WARNING")
	self:RegisterEvent("CHAT_MSG_PARTY")
	self:RegisterEvent("CHAT_MSG_SAY")
	self:RegisterEvent("CHAT_MSG_YELL")
	self:RegisterEvent("CHAT_MSG_OFFICER")
	self:RegisterEvent("CHAT_MSG_GUILD")
	self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
	self:RegisterEvent("CHAT_MSG_CHANNEL")
	
	--[[ Displays default log ]]
	CHATLOG_TEMP_CONF["currentline"] = table.getn(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"])
	self:ShowCurrentLog()
end

function ChatLog:InitDefaultLogStructures()
	local k,v
	for k,v in pairs(CHATLOG_DEFAULT_CONF["defaultindexes"]) do
		if not CHATLOG_LOGS[v] then
			self:CreateNewLogStructure(v, CHATLOG_DEFAULT_CONF["defaultnames"][k])
		end
	end
	
	for k,v in pairs(L["generalchats"]) do
		if not CHATLOG_LOGS[k] then
			self:CreateNewLogStructure(k, v["name"])
		end
	end
end

function ChatLog:InitCustomStructure(id, name)
	local i
	
	for k, v in pairs(CHATLOG_LOGS) do
		if k == id then
			return
		end
	end
	
	self:CreateNewLogStructure(id, name)
	if CHATLOG_LOGS[id]["enabled"] then
		self:AddHeaderToTable(CHATLOG_LOGS[id]["logs"])
	end
end

function ChatLog:CreateNewLogStructure(index, name)
	CHATLOG_LOGS[index] = {}
	
	CHATLOG_LOGS[index]["name"] = name
	CHATLOG_LOGS[index]["enabled"] = CHATLOG_SAVED_CONF["defaultlog"]
	CHATLOG_LOGS[index]["logs"] = {}
end

function ChatLog:AddHeaderToStructures()
	for k,v in pairs(CHATLOG_LOGS) do
		if v["enabled"] then
			self:AddHeaderToTable(v["logs"])
		end
		self:CheckTableSize(k)
	end
end

function ChatLog:AddHeaderToTable(t)
	-- Should only be used if the log of this chat IS enabled
	if table.getn(t) > 0 then
		self:AddMsgToTable(t, " ")
		self:AddMsgToTable(t, " ")
	end
	
	self:AddMsgToTable(t, ChatLog:GetEnableActionMsg(true))
end

function ChatLog:AddMsgToTable(t, msg)
	t[table.getn(t)+1] = msg
end

function ChatLog:CheckTableSize(index)
	local i=0
	
	while table.getn(CHATLOG_LOGS[index]["logs"]) > CHATLOG_DEFAULT_CONF["maxlog"] do
		table.remove(CHATLOG_LOGS[index]["logs"], 1)
		i = i+1
	end
	
	return i
end

function ChatLog:ChangeLog(index)
	CHATLOG_TEMP_CONF["currentlogindex"] = index
	CHATLOG_TEMP_CONF["currentline"] = table.getn(CHATLOG_LOGS[index]["logs"])
	self:ShowCurrentLog()
end

function ChatLog:ShowCurrentLog()	
	chatlogScrollingMessageFrame:Clear()
	
	self:SetObjectColorWithCurrentLogColor(chatlogTitleInfoTab)
	self:SetObjectColorWithCurrentLogColor(chatlogTitleInfoCurrentLine)
	self:SetObjectColorWithCurrentLogColor(chatlogScrollingMessageFrame)
	chatlogTitleInfoTab:SetText("< " .. CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["name"] .. " >")
	chatlogTitleInfoCurrentLine:SetText(CHATLOG_TEMP_CONF["currentline"] .. " / " .. table.getn(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"]))
	
	self:UpdateCurrentLogButtons()
	
	local i
	for i = CHATLOG_TEMP_CONF["currentline"]-CHATLOG_DEFAULT_CONF["scrollmaxlines"], CHATLOG_TEMP_CONF["currentline"] do
		if CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"][i] then
			chatlogScrollingMessageFrame:AddMessage(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"][i])
		end
	end
end

function ChatLog:ShowCopyWindow()
	chatlogFrame:Hide()
	
	self:SetObjectColorWithCurrentLogColor(getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ScrollFrame" .. "EditBox"))
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ScrollFrame" .. "EditBox"):SetText("")
	local i
	for i = CHATLOG_TEMP_CONF["currentline"]-CHATLOG_DEFAULT_CONF["copywindowmaxlines"], CHATLOG_TEMP_CONF["currentline"] do
		if CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"][i] then
			getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"] .. "ScrollFrame" .. "EditBox"):Insert(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"][i] .. "\n")
		end
	end
	
	getglobal(CHATLOG_DEFAULT_CONF["copywindowpointer"]):Show()
end

function ChatLog:UpdateCurrentLogButtons()
	if CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["enabled"] then
		chatlogButtonEnable:GetFontString():SetText(L["disable"])
	else
		chatlogButtonEnable:GetFontString():SetText(L["enable"])
	end
	if table.getn(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"]) > 0 then
		chatlogButtonCopy:Enable()
	else
		chatlogButtonCopy:Disable()
	end
	if L["generalchats"][CHATLOG_TEMP_CONF["currentlogindex"]] or (type(CHATLOG_TEMP_CONF["currentlogindex"]) == "number") then
		chatlogButtonDelete:Disable()
	elseif GetChannelName(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["name"]) > 0 then
		chatlogButtonDelete:Disable()
	else
		chatlogButtonDelete:Enable()
	end
end

function ChatLog:ForceCurrentLogDeleteButtonStatus(isEnabled)
	if isEnabled then
		chatlogButtonDelete:Enable()
	else
		chatlogButtonDelete:Disable()
	end
end

function ChatLog:EmptyCurrentLog()
	CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"] = {}
	if CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["enabled"] then
		self:AddHeaderToTable(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"])
	end
	
	self:Print(L["emptyconfirm"] .. CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["name"])
	
	CHATLOG_TEMP_CONF["currentline"] = table.getn(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"])
	self:ShowCurrentLog()
end

function ChatLog:ClearAllLogs()
	for k,v in pairs(CHATLOG_LOGS) do
		v["logs"] = {}
		if v["enabled"] then
			self:AddHeaderToTable(v["logs"])
		end
	end
	
	self:Print(L["clearallconfirm"])
	
	CHATLOG_TEMP_CONF["currentline"] = table.getn(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"])
	self:ShowCurrentLog()
end

function ChatLog:DeleteCurrentLog()
	self:Print(L["deleteconfirm"] .. CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["name"])
	CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]] = nil
end

function ChatLog:CaptureNewMessage(msg, index)
	table.insert(CHATLOG_LOGS[index]["logs"], table.getn(CHATLOG_LOGS[index]["logs"])+1, msg)
	
	if CHATLOG_TEMP_CONF["currentlogindex"] == index then
		--[[ Moves the current line if it WAS at the last line ]]
		if CHATLOG_TEMP_CONF["currentline"] == (table.getn(CHATLOG_LOGS[index]["logs"])-1) then
			CHATLOG_TEMP_CONF["currentline"] = CHATLOG_TEMP_CONF["currentline"] + 1
		end
		
		CHATLOG_TEMP_CONF["currentline"] = CHATLOG_TEMP_CONF["currentline"] - self:CheckTableSize(index)
		if CHATLOG_TEMP_CONF["currentline"] < 1 then
			CHATLOG_TEMP_CONF["currentline"] = 1
		end
		
		if CHATLOG_TEMP_CONF["currentline"] == table.getn(CHATLOG_LOGS[index]["logs"]) then
			--[[ Adds the message to the screen ]]
			chatlogScrollingMessageFrame:AddMessage(msg)
		end
		--[[ Updates current line text ]]
		chatlogTitleInfoCurrentLine:SetText(CHATLOG_TEMP_CONF["currentline"] .. " / " .. table.getn(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"]))
	else
		self:CheckTableSize(index)
	end
end

function ChatLog:Scroll(n)
	CHATLOG_TEMP_CONF["currentline"] = CHATLOG_TEMP_CONF["currentline"]+n
	if CHATLOG_TEMP_CONF["currentline"] < 1 then
		CHATLOG_TEMP_CONF["currentline"] = 1
	end
	if CHATLOG_TEMP_CONF["currentline"] > table.getn(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"]) then
		CHATLOG_TEMP_CONF["currentline"] = table.getn(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["logs"])
	end
	self:ShowCurrentLog()
end

function ChatLog:CHAT_MSG_WHISPER()
	if not CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["whisper"]]["enabled"] then return end
	
	local msg
	msg = "[" .. date("%H:%M:%S") .. "] |Hplayer:" .. arg2 .. "|h[" .. arg2 .. "]|h" .. L["whisperfrom"] .. ": " .. arg1
	self:CaptureNewMessage(msg, CHATLOG_DEFAULT_CONF["defaultindexes"]["whisper"])
end

function ChatLog:CHAT_MSG_WHISPER_INFORM()
	if not CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["whisper"]]["enabled"] then return end
	
	local msg
	msg = "[" .. date("%H:%M:%S") .. "] " .. L["whisperto"] .. "|Hplayer:" .. arg2 .. "|h[" .. arg2 .. "]|h: " .. arg1
	self:CaptureNewMessage(msg, CHATLOG_DEFAULT_CONF["defaultindexes"]["whisper"])
end

function ChatLog:CHAT_MSG_RAID()
	if not CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["raid"]]["enabled"] then return end
	
	local msg
	msg = "[" .. date("%H:%M:%S") .. "] |Hplayer:" .. arg2 .. "|h[" .. arg2 .. "]|h: " .. arg1
	self:CaptureNewMessage(msg, CHATLOG_DEFAULT_CONF["defaultindexes"]["raid"])
end

function ChatLog:CHAT_MSG_RAID_LEADER()
	if not CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["raid"]]["enabled"] then return end
	
	local msg
	msg = "|c" .. self:MakeTextHexColor(ChatTypeInfo["RAID_LEADER"].r, ChatTypeInfo["RAID_LEADER"].g, ChatTypeInfo["RAID_LEADER"].b, ChatTypeInfo["RAID_LEADER"].a) .. "[" .. date("%H:%M:%S") .. "] |Hplayer:" .. arg2 .. "|h[|r|c" .. CHATLOG_DEFAULT_CONF["textcolors"]["raidleader"] .. arg2 .. "|r|c" .. self:MakeTextHexColor(ChatTypeInfo["RAID_LEADER"].r, ChatTypeInfo["RAID_LEADER"].g, ChatTypeInfo["RAID_LEADER"].b, ChatTypeInfo["RAID_LEADER"].a) .. "]|h: " .. arg1 .. "|r"
	self:CaptureNewMessage(msg, CHATLOG_DEFAULT_CONF["defaultindexes"]["raid"])
end

function ChatLog:CHAT_MSG_RAID_WARNING()
	if not CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["raid"]]["enabled"] then return end
	
	local msg
	msg = "|c" .. self:MakeTextHexColor(ChatTypeInfo["RAID_WARNING"].r, ChatTypeInfo["RAID_WARNING"].g, ChatTypeInfo["RAID_WARNING"].b, ChatTypeInfo["RAID_WARNING"].a) .. "[" .. date("%H:%M:%S") .. "] |Hplayer:" .. arg2 .. "|h[" .. arg2 .. "]|h: " .. arg1 .. "|r"
	self:CaptureNewMessage(msg, CHATLOG_DEFAULT_CONF["defaultindexes"]["raid"])
end

function ChatLog:CHAT_MSG_PARTY()
	if not CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["party"]]["enabled"] then return end
	
	local msg
	msg = "[" .. date("%H:%M:%S") .. "] |Hplayer:" .. arg2 .. "|h[" .. arg2 .. "]|h: " .. arg1
	self:CaptureNewMessage(msg, CHATLOG_DEFAULT_CONF["defaultindexes"]["party"])
end

function ChatLog:CHAT_MSG_SAY()
	if not CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["say"]]["enabled"] then return end
	
	local msg
	msg = "[" .. date("%H:%M:%S") .. "] |Hplayer:" .. arg2 .. "|h[" .. arg2 .. "]|h: " .. arg1
	self:CaptureNewMessage(msg, CHATLOG_DEFAULT_CONF["defaultindexes"]["say"])
end

function ChatLog:CHAT_MSG_YELL()
	if not CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["yell"]]["enabled"] then return end
	
	local msg
	msg = "[" .. date("%H:%M:%S") .. "] |Hplayer:" .. arg2 .. "|h[" .. arg2 .. "]|h: " .. arg1
	self:CaptureNewMessage(msg, CHATLOG_DEFAULT_CONF["defaultindexes"]["yell"])
end

function ChatLog:CHAT_MSG_OFFICER()
	if not CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["officer"]]["enabled"] then return end
	
	local msg
	msg = "[" .. date("%H:%M:%S") .. "] |Hplayer:" .. arg2 .. "|h[" .. arg2 .. "]|h: " .. arg1
	self:CaptureNewMessage(msg, CHATLOG_DEFAULT_CONF["defaultindexes"]["officer"])
end

function ChatLog:CHAT_MSG_GUILD()
	if not CHATLOG_LOGS[CHATLOG_DEFAULT_CONF["defaultindexes"]["guild"]]["enabled"] then return end
	
	local msg
	msg = "[" .. date("%H:%M:%S") .. "] |Hplayer:" .. arg2 .. "|h[" .. arg2 .. "]|h: " .. arg1
	self:CaptureNewMessage(msg, CHATLOG_DEFAULT_CONF["defaultindexes"]["guild"])
end

function ChatLog:CHAT_MSG_CHANNEL_NOTICE()
	if (arg1 == nil) or (arg9 == nil) or (arg9 == "") then return end
	
	local larg9 = string.lower(arg9)
	local cIndex
	for k,v in pairs(L["generalchats"]) do
		if (larg9 == k) or string.find(larg9, k .. " - ") then
			cIndex = k
			break
		end
	end
	if cIndex == nil then cIndex = larg9 end
	
	if arg1 == "YOU_JOINED" then
		self:InitCustomStructure(cIndex, arg9)
		self:CaptureNewMessage("|c" .. CHATLOG_DEFAULT_CONF["textcolors"]["info"] .. L["customchat"]["join"] .. "|r", cIndex)
		if CHATLOG_TEMP_CONF["currentlogindex"] == cIndex then
			self:UpdateCurrentLogButtons()
		end
	end
	if arg1 == "YOU_LEFT" then
		self:CaptureNewMessage("|c" .. CHATLOG_DEFAULT_CONF["textcolors"]["info"] .. L["customchat"]["leave"] .. "|r", cIndex)
		self:CaptureNewMessage(" ", cIndex)
		if CHATLOG_TEMP_CONF["currentlogindex"] == cIndex then
			self:UpdateCurrentLogButtons()
			self:ForceCurrentLogDeleteButtonStatus(true)
		end
	end
end

function ChatLog:CHAT_MSG_CHANNEL()
	if (arg1 == nil) or (arg2 == nil) or (arg9 == nil) then return end
	
	local larg9 = string.lower(arg9)
	local cIndex
	for k,v in pairs(L["generalchats"]) do
		if (larg9 == k) or string.find(larg9, k .. " - ") then
			cIndex = k
			break
		end
	end
	if cIndex == nil then cIndex = larg9 end
	
	if not CHATLOG_LOGS[cIndex]["enabled"] then return end
	
	local msg = "[" .. date("%H:%M:%S") .. "] [" .. arg9 .. "] "
	if arg2 ~= "" then
		msg = msg .."|Hplayer:" .. arg2 .. "|h[" .. arg2 .. "]|h"
	end
	msg = msg .. ": " .. arg1
	self:CaptureNewMessage(msg, cIndex)
end

function ChatLog:GetEnableActionMsg(isEnabled)
	if isEnabled then
		return "|c" .. CHATLOG_DEFAULT_CONF["textcolors"]["info"] .. L["logstartedon"] .. date("%m/%d/%Y") .. L["logstartedat"] .. date("%H:%M:%S") .. ".|r"
	else
		return "|c" .. CHATLOG_DEFAULT_CONF["textcolors"]["info"] .. L["logstopped"] .. "|r"
	end
end

function ChatLog:GetEnabledMsg(isEnabled)
	if isEnabled then
		return L["enabled"]
	else
		return L["disabled"]
	end
end

function ChatLog:SetObjectColorWithCurrentLogColor(obj)
	local typeInfo
	
	if CHATLOG_TEMP_CONF["currentlogindex"] == CHATLOG_DEFAULT_CONF["defaultindexes"]["whisper"] then
		typeInfo = "WHISPER"
	elseif CHATLOG_TEMP_CONF["currentlogindex"] == CHATLOG_DEFAULT_CONF["defaultindexes"]["raid"] then
		typeInfo = "RAID"
	elseif CHATLOG_TEMP_CONF["currentlogindex"] == CHATLOG_DEFAULT_CONF["defaultindexes"]["party"] then
		typeInfo = "PARTY"
	elseif CHATLOG_TEMP_CONF["currentlogindex"] == CHATLOG_DEFAULT_CONF["defaultindexes"]["say"] then
		typeInfo = "SAY"
	elseif CHATLOG_TEMP_CONF["currentlogindex"] == CHATLOG_DEFAULT_CONF["defaultindexes"]["yell"] then
		typeInfo = "YELL"
	elseif CHATLOG_TEMP_CONF["currentlogindex"] == CHATLOG_DEFAULT_CONF["defaultindexes"]["officer"] then
		typeInfo = "OFFICER"
	elseif CHATLOG_TEMP_CONF["currentlogindex"] == CHATLOG_DEFAULT_CONF["defaultindexes"]["guild"] then
		typeInfo = "GUILD"
	else
		typeInfo = "CHANNEL"
	end
	
	obj:SetTextColor(ChatTypeInfo[typeInfo].r, ChatTypeInfo[typeInfo].g, ChatTypeInfo[typeInfo].b, ChatTypeInfo[typeInfo].a)
end

function ChatLog:MakeTextHexColor(r, g, b, a)
	local r = string.format("%02x", r*255)
	local g = string.format("%02x", g*255)
	local b = string.format("%02x", b*255)
	local a
	if a then
		a = string.format("%02x", a*255)
	else
		a = "FF"
	end
	
	return (a .. r .. g .. b)
end

function ChatLog:DefaultLogEnable(enabledStatus)
	if not (chatlogCheckboxEnabledDefault:GetChecked() == enabledStatus) then chatlogCheckboxEnabledDefault:SetChecked(enabledStatus) end
end

function ChatLog:ChatLogEnable(enabledStatus)
	if not (chatlogCheckboxChatLog:GetChecked() == enabledStatus) then chatlogCheckboxChatLog:SetChecked(enabledStatus) end
	if not (LoggingChat() == enabledStatus) then LoggingChat(enabledStatus) end
end

function ChatLog:CombatLogEnable(enabledStatus)
	if not (chatlogCheckboxCombatLog:GetChecked() == enabledStatus) then chatlogCheckboxCombatLog:SetChecked(enabledStatus) end
	if not (LoggingCombat() == enabledStatus) then LoggingCombat(enabledStatus) end
end

function ChatLog:ToggleEnableCurrentLog()
	CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["enabled"] = not CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["enabled"]
	
	if CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["enabled"] then
		self:CaptureNewMessage(" ", CHATLOG_TEMP_CONF["currentlogindex"])
		self:CaptureNewMessage(" ", CHATLOG_TEMP_CONF["currentlogindex"])
	end
	self:CaptureNewMessage(ChatLog:GetEnableActionMsg(CHATLOG_LOGS[CHATLOG_TEMP_CONF["currentlogindex"]]["enabled"]), CHATLOG_TEMP_CONF["currentlogindex"])
	
	self:UpdateCurrentLogButtons()
end

function ChatLog:SetTooltip(msg)
	if not (type(msg) == "table") then
		return
	end
	
	GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
	for i,v in ipairs(msg) do
		if i == 1 then
			GameTooltip:SetText("|c00FFFFFF" .. v .. "|r")
		else
			GameTooltip:AddLine(v)
		end
	end
	GameTooltip:Show()
end

function ChatLog:UnsetTooltip()
	if GameTooltip:IsVisible() then
		GameTooltip:Hide()
	end
end

function ChatLog:Toggle()
	if chatlogFrame:IsVisible() then
		chatlogFrame:Hide()
	else
		chatlogFrame:Show()
	end
end

function ChatLog:ResetPosition()
	chatlogFrame:ClearAllPoints()
	chatlogFrame:SetPoint("TOP", CHATLOG_DEFAULT_CONF["position"].x, CHATLOG_DEFAULT_CONF["position"].y)
end

function ChatLog:ResetButtonPosition()
	chatlogFrameMenuButton:ClearAllPoints()
	chatlogFrameMenuButton:SetPoint("BOTTOM", ChatFrameMenuButton, "TOP")
end

function ChatLog:DropdownCustomChatsInitialize()
	local index, tindex, k, v
	for index, tindex in pairs(CHATLOG_LOGS) do
		if not (type(index) == "number") then
			if not L["generalchats"][index] then
				local textR, textG, textB = nil, nil, nil
				
				if GetChannelName(tindex["name"]) == 0 then
					textR = CHATLOG_DEFAULT_CONF["colors"]["disabledchannel"].r
					textG = CHATLOG_DEFAULT_CONF["colors"]["disabledchannel"].g
					textB = CHATLOG_DEFAULT_CONF["colors"]["disabledchannel"].b
				end
				
				DropdownCustomChats:AddLine(
					'text', tindex["name"],
					'func', function(arg1)
						DropdownCustomChats:Close()
						self:ChangeLog(arg1)
					end,
					'arg1', index,
					'checked', tindex["enabled"],
					'textR', textR,
					'textG', textG,
					'textB', textB
				)
			end
		end
	end
end

function ChatLog:DropdownGeneralChatsInitialize()
	local index, tindex
	for index, tindex in pairs(CHATLOG_LOGS) do
		if type(index) == "string" then
			if L["generalchats"][index] then
				DropdownGeneralChats:AddLine(
					'text', tindex["name"],
					'func', function(arg1)
						DropdownGeneralChats:Close()
						self:ChangeLog(arg1)
					end,
					'arg1', index,
					'checked', tindex["enabled"]
				)
			end
		end
	end
end

function ChatLog:Reset()
	CHATLOG_LOGS = {}
	CHATLOG_SAVED_CONF = CHATLOG_DEFAULT_CONF["savedconfdefaults"]
	
	self:DefaultLogEnable(CHATLOG_SAVED_CONF["defaultlog"])
	self:ChatLogEnable(CHATLOG_SAVED_CONF["chatlog"])
	self:CombatLogEnable(CHATLOG_SAVED_CONF["combatlog"])
	
	local i, cname
	for i,cname in ipairs( {GetChannelList()} ) do
		if type(cname) == "string" then
			local lcname = string.lower(cname)
			local found = false
			local k,v
			for k,v in pairs(L["generalchats"]) do
				if (lcname == k) or string.find(lcname, k .. " - ") then
					found = true
					break
				end
			end
			if not found then
				self:InitCustomStructure(lcname, cname)
				self:CaptureNewMessage("|c" .. CHATLOG_DEFAULT_CONF["textcolors"]["info"] .. L["customchat"]["join"] .. "|r", lcname)
			end
		end
	end
	
	self:InitDefaultLogStructures()
	self:AddHeaderToStructures()
	self:ResetPosition()
	self:ChangeLog(CHATLOG_DEFAULT_CONF["defaultlogindex"])
	
	self:Print(L["resetconfirm"])
end