local L = AceLibrary("AceLocale-2.2"):new("Automaton")
Automaton = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceEvent-2.0", "AceDebug-2.0", "AceDB-2.0", "AceModuleCore-2.0")

L:RegisterTranslations("enUS", function() return {
	["Config"] = true,
	["Open config dialog"] = true,
	['Enabled'] = true,
	["Suspend/resume this module"] = true,
	["Debugging"] = true,
	["Toggle debugging for this module"] = true,
} end)


L:RegisterTranslations("zhCN", function() return {
	["Config"] = "配置选项",
	["Open config dialog"] = "打开配置选项对话框",
	['Enabled'] = "启用",
	["Suspend/resume this module"] = "暂停/恢复该模块",
	["Debugging"] = "调试",
	["Toggle debugging for this module"] = "开关该模块的调试模式",
} end)

Automaton.options = {
	type = 'group',
	args = {}
	}

Automaton:RegisterChatCommand({"/auto", "/automaton"}, Automaton.options)

Automaton:RegisterDB("AutomatonDB")

function Automaton:OnInitialize()
	Automaton.hasNoColor = true
	Automaton.cannotDetachTooltip = true
	Automaton.hideWithoutStandby = true
	Automaton.OnMenuRequest = self.options
end



function Automaton:SetDisabledAsDefault(object,name)
	if object.db.profile.disabled then
		object.db.profile.disabled = false
		--self:ToggleModuleActive(name, false)
	end
end

function Automaton.modulePrototype:RegisterOptions(options)
	options.enabled = {
		order = 1,
		type = 'toggle',
		name = L["Enabled"],
		desc = L["Suspend/resume this module"],
		get = function() return Automaton:IsModuleActive(self.name) end,
		set = function(v) Automaton:ToggleModuleActive(self.name, v) end,
	}
	options.debugging = {
		order = 999,
		type = 'toggle',
		name = L["Debugging"],
		desc = L["Toggle debugging for this module"],
		get = function() return self:IsDebugging() end,
		set = function(v) self:SetDebugging(v) end,
	}

	Automaton.options.args[self.name] = {
		type = 'group',
		name = self.name,
		desc = self.description,
		args = options,
	}
end
