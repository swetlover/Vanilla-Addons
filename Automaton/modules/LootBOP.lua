local L = AceLibrary("AceLocale-2.2"):new("Automaton_LootBOP")
Automaton_LootBOP = Automaton:NewModule("拾取绑定忽略", "AceEvent-2.0", "AceDebug-2.0")
local module = Automaton_LootBOP

L:RegisterTranslations("enUS", function() return {
    ["LootBOP"] = true,
	["Ignore BOP confirm message when not in a party or raid"] = true,
} end)

L:RegisterTranslations("koKR", function() return {
    ["LootBOP"] = "획득 메시지 무시",
	["Ignore BOP confirm message when not in a party or raid"] = "파티 또는 공격대시 아이템 획득 확인 메시지를 무시합니다.",
} end)

L:RegisterTranslations("esES", function() return {
    ["LootBOP"] = "Bot\195\173n BoP",
	["Ignore BOP confirm message when not in a party or raid"] = "Ignora los mensajes de confirmaci\195\179n de BoP ('se liga al cogerlo') cuando no est\195\161s en un grupo o banda",
} end)

L:RegisterTranslations("zhTW", function() return {
["LootBOP"] = "拾取綁定",
["Ignore BOP confirm message when not in a party or raid"] = "當不在隊伍時自動忽略拾取綁定信息確認",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Ignore BOP confirm message when not in a party or raid"] = "当你不在队伍或者团队中时自动忽略“拾取绑定”提示信息",
} end)

module.description = L["Ignore BOP confirm message when not in a party or raid"]
module.options = {
}

function module:OnInitialize()
	self:RegisterOptions(self.options)
end

function module:OnEnable()
	self:RegisterEvent("LOOT_BIND_CONFIRM")
end

function ConfirmLootSlot()
	local dialog = StaticPopup_Show("LOOT_BIND")
	local T,F=T or 0,F or CreateFrame("frame")
	local t = GetTime()
	if dialog then
		dialog.data = arg1
			X = function()
			if t-T>1 then 
				StaticPopup1Button1:Click()
			end
			T = t
			end
			F:SetScript ("OnUpdate",X) 
	end
end

function module:LOOT_BIND_CONFIRM()
	if GetNumPartyMembers() == 0 and GetNumRaidMembers() == 0 then
		self:Debug("Looting...")
		ConfirmLootSlot()
	end
end