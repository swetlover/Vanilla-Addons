local L = AceLibrary("AceLocale-2.2"):new("Automaton_Plates")
Automaton_Plates = Automaton:NewModule("血条面板显示设置", "AceEvent-2.0", "AceDebug-2.0")
local module = Automaton_Plates

L:RegisterTranslations("enUS", function() return {
	["Plates"] = true,
	["Shows name plates in combat."] = true,
} end)

L:RegisterTranslations("koKR", function() return {
	["Plates"] = "이름표 표시",
	["Shows name plates in combat."] = "전투 상태시 이름을 표시합니다.",
} end)

L:RegisterTranslations("esES", function() return {
	["Plates"] = "Placas",
	["Shows name plates in combat."] = "Muestra las placas identificativas cuando est\195\161s en combate",
} end)

L:RegisterTranslations("zhTW", function() return {
["Plates"] = "敵對名稱面板",
["Shows name plates in combat."] = "戰鬥時顯示敵對名稱面板",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Shows name plates in combat."] = "战斗中显示敌方血条面板",
} end)

module.description = L["Shows name plates in combat."]
module.options = {
}

function module:OnInitialize()
	self.db = Automaton:AcquireDBNamespace("Plates")
	Automaton:RegisterDefaults("Plates", "profile", {
		disabled = true,
    })
	Automaton:SetDisabledAsDefault(self, "Plates")
	self:RegisterOptions(self.options)
end

function module:OnEnable()
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
end

function module:PLAYER_REGEN_ENABLED()
	HideNameplates()
	NAMEPLATES_ON = false
end

function module:PLAYER_REGEN_DISABLED()
	ShowNameplates()
	NAMEPLATES_ON = true
end