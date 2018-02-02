
assert(BigWigs, "BigWigs not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsOptions")
local tablet = AceLibrary("Tablet-2.0")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	["|cff00ff00Module running|r"] = "|cff00ff00模块运行|r",
	["|cffeda55fClick|r to reset all running modules. |cffeda55fCtrl+Click|r to force reboot for everyone (Requires assistant or higher). |cffeda55fAlt+Click|r to disable them. |cffeda55fCtrl+Alt+Click|r to disable Big Wigs completely."] = "|cffeda55f点击|r 重置所有模块. |cffeda55fCtrl+点击|r 强制重新启动 (需要L或A). |cffeda55fAlt+点击|r 禁用. |cffeda55fCtrl+Alt+点击|r 完全禁用 Big Wigs.",
	["|cffeda55fClick|r to enable."] = "|cffeda55f点击|r 开启.",
	["Big Wigs is currently disabled."] = "Big Wigs 当前被禁用.",
	["Active boss modules"] = "激活的Boss模块",
	["hidden"] = "隐藏",
	["shown"] = "显示",
	["minimap"] = "迷你地图",
	["Minimap"] = "迷你地图",
	["Toggle the minimap button."] = "切换小地图按钮.",
	["All running modules have been reset."] = "所有运行模块已重置.",
	["All running modules have been rebooted for all raid members."] = "所有运行的模块已经为团队成员重新启动.",
	["All running modules have been disabled."] = "所有运行模块已被禁用.",
	["%s reset."] = "%s 重置.",
	["%s disabled."] = "%s 禁用.",
	["%s icon is now %s."] = "%s 图标现在是 %s.",
	["Show it again with /bw plugin minimap."] = "再次显示它 /bw 小地图插件.",
	["You need to be an assistant or raid leader to use this function."] = "使用此功能要有A或RAID领导人.",
} end)

L:RegisterTranslations("deDE", function() return {
	["|cff00ff00Module running|r"] = "|cff00ff00Modul aktiviert|r",
	["|cffeda55fClick|r to reset all running modules. |cffeda55fCtrl+Click|r to force reboot for everyone (Requires assistant or higher). |cffeda55fAlt+Click|r to disable them. |cffeda55fCtrl+Alt+Click|r to disable Big Wigs completely."] = "|cffeda55fKlicken|r, um alle laufenden Module zurückzusetzen. |cffeda55fStrg+Klick|r um Reset für jedermann zu erzwingen (Benötigt Assistent oder höher). |cffeda55fAlt+Klick|r um alle laufenden Module zu beenden. |cffeda55fStrg+Shift+Klick|r um BigWigs komplett zu beenden.",
	["|cffeda55fClick|r to enable."] = "|cffeda55fKlicken|r um zu aktivieren.",
	["Big Wigs is currently disabled."] = "Big Wigs ist momentan deaktiviert.",
	["Active boss modules"] = "Aktive Boss Module",
	["hidden"] = "versteckt",
	["shown"] = "angezeigt",
	-- ["minimap"] = true,
	["Minimap"] = "Minimap",
	["Toggle the minimap button."] = "Minimap Button anzeigen.",
	["All running modules have been reset."] = "Alle laufenden Module wurden zurückgesetzt.",
	["All running modules have been rebooted for all raid members."] = "Alle laufenden Module wurden für alle Schlachtzugsmitglieder neu gestartet.",
	["All running modules have been disabled."] = "Alle laufenden Module wurden beendet.",
	["%s reset."] = "%s zurückgesetzt.",
	["%s disabled."] = "%s beendet.",
	["%s icon is now %s."] = "%s Icon ist jetzt %s.",
	["You need to be an assistant or raid leader to use this function."] = "Du musst Schlachtzugsleiter oder Assistent sein, um diese Funktion zu benutzen.",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

local deuce = BigWigs:NewModule("Options Menu")
deuce.hasFuBar = IsAddOnLoaded("FuBar") and FuBar
deuce.consoleCmd = not deuce.hasFuBar and L["minimap"]
deuce.consoleOptions = not deuce.hasFuBar and {
	type = "toggle",
	name = L["Minimap"],
	desc = L["Toggle the minimap button."],
	get = function() return BigWigsOptions.minimapFrame and BigWigsOptions.minimapFrame:IsVisible() or false end,
	set = function(v)
		if v then
			BigWigsOptions:Show()
		else
			BigWigsOptions:Hide()
			BigWigs:Print(L["Show it again with /bw plugin minimap."])
		end
	end,
	map = {[false] = L["hidden"], [true] = L["shown"]},
	message = L["%s icon is now %s."],
	hidden = function() return deuce.hasFuBar end,
}

----------------------------
--      FuBar Plugin      --
----------------------------

BigWigsOptions = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0", "AceDB-2.0", "FuBarPlugin-2.0")
BigWigsOptions.name = "FuBar - BigWigs"
BigWigsOptions:RegisterDB("BigWigsFubarDB")

BigWigsOptions.hasNoColor = true
BigWigsOptions.hasIcon = "Interface\\AddOns\\BigWigs\\Icons\\core-enabled"
BigWigsOptions.defaultMinimapPosition = 180
BigWigsOptions.clickableTooltip = true
BigWigsOptions.hideWithoutStandby = true
--BigWigsOptions.hasNoText = true

-- XXX total hack
BigWigsOptions.OnMenuRequest = deuce.core.cmdtable
local args = AceLibrary("FuBarPlugin-2.0"):GetAceOptionsDataTable(BigWigsOptions)
for k,v in pairs(args) do
	if BigWigsOptions.OnMenuRequest.args[k] == nil then
		BigWigsOptions.OnMenuRequest.args[k] = v
	end
end
-- XXX end hack

-----------------------------
--      Icon Handling      --
-----------------------------

function BigWigsOptions:OnEnable()
	self:RegisterEvent("BigWigs_CoreEnabled", "CoreState")
	self:RegisterEvent("BigWigs_CoreDisabled", "CoreState")

	self:CoreState()
end

function BigWigsOptions:CoreState()
	if BigWigs:IsActive() then
		self:SetIcon("Interface\\AddOns\\BigWigs\\Icons\\core-enabled")
	else
		self:SetIcon("Interface\\AddOns\\BigWigs\\Icons\\core-disabled")
	end

	self:UpdateTooltip()
end

-----------------------------
--      FuBar Methods      --
-----------------------------

function BigWigsOptions:ModuleAction(module)
	if IsAltKeyDown() then
		deuce.core:ToggleModuleActive(module, false)
		self:Print(string.format(L["%s disabled."], module:ToString()))
	else
		deuce.core:BigWigs_RebootModule(module:ToString())
		self:Print(string.format(L["%s reset."], module:ToString()))
	end
	self:UpdateTooltip()
end

function BigWigsOptions:OnTooltipUpdate()
	if BigWigs:IsActive() then
		local cat = tablet:AddCategory("text", L["Active boss modules"])
		for name, module in deuce.core:IterateModules() do
			if module:IsBossModule() and deuce.core:IsModuleActive(module) then
				cat:AddLine("text", name, "func", function(mod) BigWigsOptions:ModuleAction(mod) end, "arg1", module)
			end
		end
		tablet:SetHint(L["|cffeda55fClick|r to reset all running modules. |cffeda55fCtrl+Click|r to force reboot for everyone (Requires assistant or higher). |cffeda55fAlt+Click|r to disable them. |cffeda55fCtrl+Alt+Click|r to disable Big Wigs completely."])
	else
		-- use a text line for this, since the hint is not shown when we are
		-- detached.
		local cat = tablet:AddCategory("colums", 1)
		cat:AddLine("text", L["Big Wigs is currently disabled."], "func", function() BigWigsOptions:OnClick() end)
		tablet:SetHint(L["|cffeda55fClick|r to enable."])
	end
end

function BigWigsOptions:OnClick()
	if BigWigs:IsActive() then
		if IsAltKeyDown() then
			if IsControlKeyDown() then
				BigWigs:ToggleActive(false)
				self:UpdateTooltip()
			else
				for name, module in deuce.core:IterateModules() do
					if module:IsBossModule() and deuce.core:IsModuleActive(module) then
						deuce.core:ToggleModuleActive(module, false)
					end
				end
				self:Print(L["All running modules have been disabled."])
			end
		elseif IsControlKeyDown() then
			for name, module in deuce.core:IterateModules() do
				if module:IsBossModule() and deuce.core:IsModuleActive(module) then
					if (IsRaidLeader() or IsRaidOfficer()) then
						deuce.core:TriggerEvent("BigWigs_SendSync", "RebootModule "..tostring(module))
					end
				end
			end
			if (IsRaidLeader() or IsRaidOfficer()) then
				self:Print(L["All running modules have been rebooted for all raid members."])
			else
				self:Print(L["You need to be an assistant or raid leader to use this function."])
			end
		else
			for name, module in deuce.core:IterateModules() do
				if module:IsBossModule() and deuce.core:IsModuleActive(module) then
					deuce.core:BigWigs_RebootModule(name)
				end
			end
			self:Print(L["All running modules have been reset."])
		end
	else
		BigWigs:ToggleActive(true)
	end

	self:UpdateTooltip()
end

