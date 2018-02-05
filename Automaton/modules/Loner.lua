local L = AceLibrary("AceLocale-2.2"):new("Automaton_Loner")
Automaton_Loner = Automaton:NewModule("自动拒绝工会邀请", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")
local module = Automaton_Loner

L:RegisterTranslations("enUS", function() return {
    ["Loner"] = true,
	["Decline all incoming guild requests and petitions."] = true,
	["Canceling guild invite..."] = true,
	["Canceling petition..."] = true,
} end)

L:RegisterTranslations("koKR", function() return {
    ["Loner"] = "길드 초대",
	["Decline all incoming guild requests and petitions."] = "모든 길드 초대 요구를 거절합니다.",
	["Canceling guild invite..."] = "길드 초대 거절...",
} end)

L:RegisterTranslations("esES", function() return {
    ["Loner"] = "Solitario",
	["Decline all incoming guild requests and petitions."] = "Declina todas las invitaciones para unirse a una Hermandad",
	["Canceling guild invite..."] = "Cancelando invitaci\195\179n a hermandad...",
} end)

L:RegisterTranslations("zhTW", function() return {
	["Loner"] = "拒絕公會邀請",
	["Decline all incoming guild requests and petitions."] = "自動拒絕公會邀請",
	["Canceling guild invite..."] = "拒絕了公會邀請...",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Decline all incoming guild requests and petitions."] = "自动拒绝所有的公会邀请",
	["Canceling guild invite..."] = "公会邀请已拒绝……",
} end)

module.description = L["Decline all incoming guild requests and petitions."]
module.options = {}

function module:OnInitialize()
    self.db = Automaton:AcquireDBNamespace("Loner")
    Automaton:RegisterDefaults("Loner", "profile", {
		disabled = true,
    })
	Automaton:SetDisabledAsDefault(self, "Loner")
	self:RegisterOptions(self.options)
end

function module:OnEnable()
	self:RegisterEvent("GUILD_INVITE_REQUEST")
	self:RegisterEvent("PETITION_SHOW")
end

function module:GUILD_INVITE_REQUEST()
	self:Print(L["Canceling guild invite..."])
	DeclineGuild()
	StaticPopup_Hide("GUILD_INVITE")
end

function module:PETITION_SHOW()
	self:Print(L["Canceling petition..."])
	ClosePetition()
end