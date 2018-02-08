------------------------------
-- Are you local?      		--
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsTest")
local health = nil

----------------------------
-- Localization      	  --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["test"] = true,
	["Test"] = true,
	["Test Bar"] = true,
	["Test irregular Bar"] = true,
	["Test Bar 3"] = true,
	["Test Bar 4"] = true,
	["Testing"] = true,
	["OMG Bear!"] = true,
	["*RAWR*"] = true,
	["Victory!"] = true,
	["Options for testing."] = true,
	["local"] = true,
	["Local test"] = true,
	["Perform a local test of BigWigs."] = true,
	["sync"] = true,
	["Sync test"] = true,
	["Perform a sync test of BigWigs."] = true,
	["Testing Sync"] = true,
	["Test HP Bar 1"] = true,
	["Test HP Bar 2"] = true,
}
end)

L:RegisterTranslations("zhCN", function() return {
	["test"] = "test",
	["Test"] = "测试",
	["Test Bar"] = "测试条",
	["Test irregular Bar"] = "测试不规则条",
	["Test Bar 3"] = "测试条 3",
	["Test Bar 4"] = "测试条 4",
	["Testing"] = "测试中...",
	["OMG Bear!"] = "我的天!熊!",
	["*RAWR*"] = "*警报*",
	["Victory!"] = "胜利!",
	["Options for testing."] = "测试设置",
	["local"] = "本地",
	["Local test"] = "本地测试",
	["Perform a local test of BigWigs."] = "BigWigs的本地测试",
	["sync"] = "同步",
	["Sync test"] = "同步测试",
	["Perform a sync test of BigWigs."] = "BigWigs的同步测试",
	["Testing Sync"] = "同步测试中...",
	["Test HP Bar 1"] = "测试血条 1",
	["Test HP Bar 2"] = "测试血条 2",
}
end)

----------------------------------
-- Module Declaration      		--
----------------------------------

BigWigsTest = BigWigs:NewModule(L["Test"])
BigWigsTest.revision = 20011

BigWigsTest.consoleCmd = L["test"]
BigWigsTest.consoleOptions = {
	type = "group",
	name = L["Test"],
	desc = L["Options for testing."],
	args = {
		[L["local"]] = {
			type = "execute",
			name = L["Local test"],
			desc = L["Perform a local test of BigWigs."],
			func = function() BigWigsTest:TriggerEvent("BigWigs_Test") end,
		},
		[L["sync"]] = {
			type = "execute",
			name = L["Sync test"],
			desc = L["Perform a sync test of BigWigs."],
			func = function() BigWigsTest:TriggerEvent("BigWigs_SyncTest") end,
			disabled = function() return (not IsRaidLeader() and not IsRaidOfficer()) end,
		},
	}
}

function BigWigsTest:OnEnable()
	self:RegisterEvent("BigWigs_Test")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "TestSync", 5)
	self:RegisterEvent("BigWigs_SyncTest")
end


function BigWigsTest:BigWigs_SyncTest()
	self:TriggerEvent("BigWigs_SendSync", "TestSync")
end


function BigWigsTest:BigWigs_RecvSync(sync, rest, nick)
	if sync == "TestSync" then
		self:Message(L["Testing Sync"], "Positive")
		self:Bar(L["Testing Sync"], 10, "Spell_Frost_FrostShock", true, "Green", "Blue", "Yellow", "Red")
	elseif sync == "TestNumber" and rest then
		rest = tonumber(rest)
		if type(rest) == "number" then
		end
	end
end


function BigWigsTest:BigWigs_Test()
	self:Message(L["Testing"], "Attention", true, "Long")
	self:Bar(L["Test Bar 4"], 3, "Spell_Nature_ResistNature", true, "black")
	self:Bar(L["Test Bar 3"], 5, "Spell_Nature_ResistNature", true, "red")
	self:IrregularBar(L["Test irregular Bar"], 11, 16, "Inv_Hammer_Unique_Sulfuras")
	self:Bar(L["Test Bar"], 20, "Spell_Nature_ResistNature")
	self:WarningSign("Inv_Hammer_Unique_Sulfuras", 10)

	self:DelayedMessage(5, L["OMG Bear!"], "Important", true, "Alert")
	self:DelayedMessage(10, L["*RAWR*"], "Urgent", true, "Alarm")
	self:DelayedMessage(20, L["Victory!"], "Bosskill", true, "Victory")

	self:Sync("TestNumber 5")

	BigWigs:Proximity()

	local function deactivate()
		BigWigs:RemoveProximity()
	end

	--HPBar
	health = 100
	self:TriggerEvent("BigWigs_StartHPBar", self, L["Test HP Bar 1"], health)
	self:TriggerEvent("BigWigs_StartHPBar", self, L["Test HP Bar 2"], health)

	self:ScheduleRepeatingEvent("bwtesthpbarrepeat", self.UpdateTestHPBars, 0.1, self)

	self:ScheduleEvent("BigWigsTestOver", deactivate, 20, self)
end

function BigWigsTest:UpdateTestHPBars()
	if health > 0 then
		health = health - 1
		self:TriggerEvent("BigWigs_SetHPBar", self, L["Test HP Bar 1"], 100 - health)
		self:TriggerEvent("BigWigs_SetHPBar", self, L["Test HP Bar 2"], 100 - health)
	end
end
