local L = AceLibrary("AceLocale-2.2"):new("Automaton_Wuss")
Automaton_Wuss = Automaton:NewModule("自动拒绝决斗", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")
local module = Automaton_Wuss

L:RegisterTranslations("enUS", function() return {
    ["Wuss"] = true,
	["Decline all incoming duels. Like the wuss you are."] = true,
    ["Canceling duel..."] = true,
} end)

L:RegisterTranslations("koKR", function() return {
    ["Wuss"] = "결투 거절",
	["Decline all incoming duels. Like the wuss you are."] = "모든 결투 신청을 거절합니다.",
    ["Canceling duel..."] = "결투 취소...",
} end)

L:RegisterTranslations("esES", function() return {
    ["Wuss"] = "Cobarde",
	["Decline all incoming duels. Like the wuss you are."] = "Declina todos los duelos. Como el cobarde que eres",
    ["Canceling duel..."] = "Cancelando duelo...",
} end)

L:RegisterTranslations("zhTW", function() return {
    ["Wuss"] = "軟腳蝦",
	["Decline all incoming duels. Like the wuss you are."] = "自動拒絕決鬥邀請",
    ["Canceling duel..."] = "自動拒絕決鬥邀請...",
} end)
L:RegisterTranslations("zhCN", function() return {
	["Decline all incoming duels. Like the wuss you are."] = "像懦夫一般的拒绝决斗邀请！",
    ["Canceling duel..."] = "决斗邀请已拒绝……",
} end)

module.description = L["Decline all incoming duels. Like the wuss you are."]
module.options = {}

function module:OnInitialize()
	self.db = Automaton:AcquireDBNamespace("Wuss")
	Automaton:RegisterDefaults('Wuss', 'profile', {
		disabled = true,
	})
	Automaton:SetDisabledAsDefault(self,"Wuss")
	self:RegisterOptions(self.options)
end

function module:OnEnable()
	self:RegisterEvent("DUEL_REQUESTED")
end

function module:DUEL_REQUESTED()
	self:Print(L["Canceling duel..."])
	CancelDuel()
	StaticPopup_Hide("DUEL_REQUESTED")
end
