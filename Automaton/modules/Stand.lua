local L = AceLibrary("AceLocale-2.2"):new("Automaton_Stand")
Automaton_Stand = Automaton:NewModule("自动站立", "AceEvent-2.0", "AceDebug-2.0")
local module = Automaton_Stand

L:RegisterTranslations("enUS", function() return {
    ["Stand"] = true,
	["Automatically stand when you receive the 'You must be standing' error"] = true,
} end)

L:RegisterTranslations("koKR", function() return {
    ["Stand"] = "일어서기",
	["Automatically stand when you receive the 'You must be standing' error"] = "'일어서기' 오류시 자동으로 일어납니다.",
} end)

L:RegisterTranslations("esES", function() return {
    ["Stand"] = "En pie",
	["Automatically stand when you receive the 'You must be standing' error"] = "Te pone de pie autom\195\161ticamente cuando recibes el error 'Debes estar de pie'",
} end)

L:RegisterTranslations("zhTW", function() return {
    ["Stand"] = "站立",
	["Automatically stand when you receive the 'You must be standing' error"] = "當你收到'你必須處於站立狀態'的訊息時自動站立",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Automatically stand when you receive the 'You must be standing' error"] = "当收到“你必须处于站立状态”错误信息时自动起立",
} end)

module.description = L["Automatically stand when you receive the 'You must be standing' error"]
module.options = {
}

function module:OnInitialize()
	self:RegisterOptions(self.options)
end

function module:OnEnable()
	self:RegisterEvent("UI_ERROR_MESSAGE")
	self:RegisterEvent("UI_INFO_MESSAGE","UI_ERROR_MESSAGE")
end

local messages = {
	[SPELL_FAILED_NOT_STANDING] = true,
	[ERR_CANTATTACK_NOTSTANDING] = true,
	[ERR_LOOT_NOTSTANDING] = true,
	[ERR_TAXINOTSTANDING] = true,
}

function module:UI_ERROR_MESSAGE(msg)
	if messages[msg] then
		DoEmote('stand')
	end
end