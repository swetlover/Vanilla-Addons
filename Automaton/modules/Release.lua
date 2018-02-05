local L = AceLibrary("AceLocale-2.2"):new("Automaton_Release")
Automaton_Release = Automaton:NewModule("战场施放灵魂", "AceEvent-2.0", "AceDebug-2.0")
local module = Automaton_Release

L:RegisterTranslations("enUS", function() return {
    ["Release"] = true,
	["Automatically release to ghost after dying in a battleground"] = true,
} end)

L:RegisterTranslations("koKR", function() return {
    ["Release"] = "전장 부활",
	["Automatically release to ghost after dying in a battleground"] = "전장에서 죽은 후에 유령상태시 자동으로 부활합니다.",
} end)
  
L:RegisterTranslations("esES", function() return {
    ["Release"] = "Liberar",
	["Automatically release to ghost after dying in a battleground"] = "Libera autom\195\161ticamente tu esp\195\173ritu cuando mueres en un campo de batalla",
} end)

L:RegisterTranslations("zhTW", function() return {
["Release"] = "釋放靈魂",
["Automatically release to ghost after dying in a battleground"] = "戰場中自動釋放靈魂",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Automatically release to ghost after dying in a battleground"] = "战场中死后自动释放灵魂",
} end)

module.description = L["Automatically release to ghost after dying in a battleground"]
module.options = {
}

function module:OnInitialize()
	self:RegisterOptions(self.options)
end

function module:OnEnable()
	self:RegisterEvent("PLAYER_DEAD")
end

function module:PLAYER_DEAD()
	if MiniMapBattlefieldFrame.status == "active" then
		self:Debug("Releasing...")
		RepopMe()
	end
end