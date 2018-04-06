
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Moam", "Ruins of Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Moam",

	adds_cmd = "adds",
	adds_name = "召唤警报",
	adds_desc = "召唤元素恶魔出现时发出警报",

	paralyze_cmd = "paralyze",
	paralyze_name = "石化警报",
	paralyze_desc = "莫阿姆进入石化状态时发出警报",

	starttrigger = "%s senses your fear.",
	startwarn = "莫阿姆已激活 - 90秒后召唤元素恶魔",
	addsbar = "召唤(招出小怪)",
	addsincoming = "元素恶魔将%s秒后被召唤！",
	addstrigger = "drains your mana and turns to stone.",
	addswarn = "元素恶魔被召唤！术士放逐！莫阿姆石化90秒！",
	paralyzebar = "石化(无法移动)",
	returnincoming = "莫阿姆将在%s秒后解除石化！",
	returntrigger = "充能效果从莫阿姆身上消失。",
    returntrigger2 = "充满能量",
	returnwarn = "莫阿姆解除石化！90秒后重新召唤元素恶魔！",	
} end )

L:RegisterTranslations("deDE", function() return {
	adds_name = "Elementare",
	adds_desc = "Warnung, wenn Elementare erscheinen.",

	paralyze_name = "Steinform",
	paralyze_desc = "Warnung, wenn Moam in Steinform.",

	starttrigger = "%s sp\195\188rt Eure Angst.",
	startwarn = "Moam angegriffen! Elementare in 90 Sekunden!",

	addsbar = "Elementare",
	addsincoming = "Elementare in %s Sekunden!",
	addstrigger = "entzieht Euch Euer Mana und versteinert Euch.",
	addswarn = "Elementare! Moam in Steinform f\195\188r 90 Sekunden.",

	paralyzebar = "Steinform",
	returnincoming = "Moam erwacht in %s Sekunden!",
	returntrigger = "Energiezufuhr schwindet von Moam.",
	returnwarn = "Moam erwacht! Elementare in 90 Sekunden!",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20006 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"adds", "paralyze", "bosskill"}

-- locals
local timer = {
	paralyze = 90,
	unparalyze = 90,
}
local icon = {
	paralyze = "Spell_Shadow_CurseOfTounges",
	unparalyze = "Spell_Shadow_CurseOfTounges"
}
local syncName = {
	paralyze = "MoamParalyze"..module.revision,
	unparalyze = "MoamUnparalyze"..module.revision,
}

local firstunparalyze = nil


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Emote")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Emote")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")

	self:ThrottleSync(10, syncName.paralyze)
	self:ThrottleSync(10, syncName.unparalyze)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	firstunparalyze = true
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.adds then
		self:Message(L["startwarn"], "Important")
	end
	self:Unparalyze()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:Emote(msg)
	self:DebugMessage("moam raid boss emote: " .. msg)
	if string.find(msg, L["addstrigger"]) then -- alternative trigger: Moam gains Energize.
		self:Sync(syncName.paralyze)
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	if string.find( msg, L["returntrigger"]) then
		self:Sync(syncName.unparalyze)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.paralyze then
		self:Paralyze()
	elseif sync == syncName.unparalyze then
		self:Unparalyze()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Paralyze()
	self:RemoveBar(L["paralyzebar"])
	self:RemoveBar(L["addsbar"])
	if self.db.profile.adds then
		self:Message(L["addswarn"], "Important")
	end
	if self.db.profile.paralyze then
		self:DelayedMessage(timer.paralyze - 60, format(L["returnincoming"], 60), "Attention", nil, nil, true)
		self:DelayedMessage(timer.paralyze - 30, format(L["returnincoming"], 30), "Attention", nil, nil, true)
		self:DelayedMessage(timer.paralyze - 15, format(L["returnincoming"], 15), "Urgent", nil, nil, true)
		self:DelayedMessage(timer.paralyze - 5, format(L["returnincoming"], 5), "Important", nil, nil, true)
		self:Bar(L["paralyzebar"], timer.paralyze, icon.paralyze)
	end
end

function module:Unparalyze()
	self:RemoveBar(L["paralyzebar"])
	self:RemoveBar(L["addsbar"])
	if firstunparalyze then
		firstunparalyze = false
	elseif self.db.profile.paralyze then
		self:Message(L["returnwarn"], "Important")
	end

	if self.db.profile.adds then
		self:DelayedMessage(timer.unparalyze - 60, format(L["addsincoming"], 60), "Attention", nil, nil, true)
		self:DelayedMessage(timer.unparalyze - 30, format(L["addsincoming"], 30), "Attention", nil, nil, true)
		self:DelayedMessage(timer.unparalyze - 15, format(L["addsincoming"], 15), "Urgent", nil, nil, true)
		self:DelayedMessage(timer.unparalyze - 5, format(L["addsincoming"], 5), "Important", nil, nil, true)
		self:Bar(L["addsbar"], timer.unparalyze, icon.unparalyze)
	end
end
