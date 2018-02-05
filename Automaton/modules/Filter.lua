local L = AceLibrary("AceLocale-2.2"):new("Automaton_Filter")
Automaton_Filter = Automaton:NewModule("技能学习过滤", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")
local module = Automaton_Filter

L:RegisterTranslations("enUS", function() return {
    ["Filter"] = true,
	["Show only available skills at trainers by default."] = true,
} end)

L:RegisterTranslations("koKR", function() return {
    ["Filter"] = "필터",
	["Show only available skills at trainers by default."] = "상급자에게 스킬을 배울시 사용 가능한 기술만 표시합니다.",
} end)

L:RegisterTranslations("esES", function() return {
    ["Filter"] = "Filtrar",
	["Show only available skills at trainers by default."] = "Mostrar \195\186nicamente las habilidades disponibles de los entrenadores",
} end)

L:RegisterTranslations("zhTW", function() return {
["Filter"] = "過濾技能",
["Show only available skills at trainers by default."] = "只顯示可學習的技能",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Show only available skills at trainers by default."] = "在跟导师学习技能时默认只显示可学技能",
} end)

module.description = L["Show only available skills at trainers by default."]
module.options = {
}

function module:OnInitialize()
	self:RegisterOptions(module.options)
end

function module:OnEnable()
	self:RegisterEvent("TRAINER_SHOW")
end

function module:TRAINER_SHOW()
	SetTrainerServiceTypeFilter("unavailable", 0)
end