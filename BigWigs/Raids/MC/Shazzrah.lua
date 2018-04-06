
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Shazzrah", "Molten Core")

module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"curse", "deaden", "blink", "counterspell", "bosskill"}

-- Proximity Plugin
-- module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
-- module.proximitySilent = false

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	cs = 16,
	firstCS = 15,
	curse =  20,
	firstCurse = 10,
	blink = 25,
	firstBlink = 25,
	earliestDeaden = 7,
	latestDeaden = 14,
	firstDeaden = 5,
}
local icon = {
	cs = "Spell_Frost_IceShock",
	curse = "Spell_Shadow_AntiShadow",
	blink = "Spell_Arcane_Blink",
	deaden = "Spell_Holy_SealOfSalvation",
}
local syncName = {
	cs = "ShazzrahCounterspell"..module.revision,
	curse = "ShazzrahCurse"..module.revision,
	blink = "ShazzrahBlink"..module.revision,
	deaden = "ShazzrahDeadenMagicOn"..module.revision,
	deadenOver = "ShazzrahDeadenMagicOff"..module.revision,
}

local _, playerClass = UnitClass("player")
local firstblink = true

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	blink_trigger = "施放了沙斯拉尔之门",
	deaden_trigger = "沙斯拉尔获得了衰减魔法的效果",
	curse_trigger = "效果从沙斯拉尔",
	cs_trigger2 = "沙斯拉尔施放了法术反制",
    cs_trigger = "沙斯拉尔的法术反制被(.+)抵抗了。",
	curse_trigger2 = "沙斯拉尔的诅咒被(.+)抵抗了。",
	deaden_over_trigger = "衰减魔法效果从沙斯拉尔身上消失。",

	blink_warn = "闪现术 - 45秒后施放!",
	blink_soon_warn = "3秒后闪现术!",
	deaden_warn = "衰减魔法! 快驱散!",
	curse_warn = "沙斯拉尔的诅咒! 驱散!",
	cs_now_warn = "法术反制! ~18 秒后施放!",
	cs_soon_warn = "3秒后施放法术反制 !",

	blink_bar = "可能闪现",
	deaden_bar = "衰减魔法(受到法伤降低50%)",
	curse_bar = "诅咒(蓝耗提高100%)",
	cs_bar = "可能法术反制(沉默)",

	cmd = "Shazzrah",
	
            
    -- counterspell after blink 2s later
	counterspell_cmd = "counterspell",
	counterspell_name = "法术反制警报",
	counterspell_desc = "法术反制的警报",
	
	curse_cmd = "curse",
	curse_name = "沙斯拉尔的诅咒警报",
	curse_desc = "沙斯拉尔的诅咒的警报",
	
	deaden_cmd = "deaden",
	deaden_name = "衰减魔法警报",
	deaden_desc = "衰减魔法的警报",
	
	blink_cmd = "blink",
	blink_name = "闪现术警报",
	blink_desc = "闪现术的警报",
} end)

L:RegisterTranslations("deDE", function() return {
	blink_trigger = "Shazzrah wirkt Portal von Shazzrah",
	deaden_trigger = "Shazzrah bekommt \'Magie dämpfen",
	curse_trigger = "von Shazzrahs Fluch betroffen",
	cs_trigger2 = "Shazzrah wirkt Gegenzauber",
	cs_trigger = "Shazzrahs Gegenzauber wurde von (.+) widerstanden",
	curse_trigger2 = "Shazzrahs Fluch(.)widerstanden",
	deaden_over_trigger = "Magie dämpfen schwindet von Shazzrah",

	blink_warn = "Blinzeln! Nächstes in ~45 Sekunden!",
	blink_soon_warn = "Blinzeln in ~5 Sekunden!",
	deaden_warn = "Magie dämpfen auf Shazzrah! Entferne magie!",
	curse_warn = "Shazzrahs Fluch! Entfluche JETZT!",
	cs_now_warn = "Gegenzauber - 40 Sekunden bis zum nächsten!",
	cs_soon_warn = "3 Sekunden bis Gegenzauber!",

	blink_bar = "Mögliches Blinzeln",
	deaden_bar = "Magie dämpfen",
	curse_bar = "Nächster Fluch",
	cs_bar = "Möglicher Gegenzauber",

	--cmd = "Shazzrah",

	--counterspell_cmd = "Gegenzauber",
	counterspell_name = "Alarm für Gegenzauber",
	counterspell_desc = "Warnen vor Shazzrahs Gegenzauber",

	--curse_cmd = "curse",
	curse_name = "Alarm für Shazzrahs Fluch",
	curse_desc = "Warnen vor Shazzrahs Fluch",

	--deaden_cmd = "deaden",
	deaden_name = "Alarm für Magie dämpfen",
	deaden_desc = "Warnen wenn Shazzrah Magie dämpfen hat",

	--blink_cmd = "blink",
	blink_name = "Alarm für Blinzeln",
	blink_desc = "Warnen wenn Shazzrah blinzelt",
} end)


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_BUFF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_BUFF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS", "Event")

	self:ThrottleSync(10, syncName.blink)
	self:ThrottleSync(10, syncName.curse)
	self:ThrottleSync(5, syncName.deaden)
	self:ThrottleSync(5, syncName.deadenOver)
	self:ThrottleSync(0.5, syncName.cs)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	firstblink = true
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.counterspell then
		self:Bar(L["cs_bar"], timer.firstCS, icon.cs)
	end
	self:DelayedSync(timer.firstCS, syncName.cs)

	if self.db.profile.blink then
		self:Bar(L["blink_bar"], timer.firstBlink, icon.blink)
	end
	self:DelayedSync(timer.firstBlink, syncName.blink)

	if self.db.profile.curse then
		self:Bar(L["curse_bar"], timer.firstCurse, icon.curse) -- seems to be completly random
	end
	if self.db.profile.deaden then
		self:Bar(L["deaden_bar"], timer.firstDeaden, icon.deaden)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end

------------------------------
--      Event Handlers      --
------------------------------

function module:Event(msg)
	if (string.find(msg, L["deaden_trigger"])) then
		self:Sync(syncName.deaden)
	elseif (string.find(msg, L["deaden_over_trigger"])) then
		self:Sync(syncName.deadenOver)
	elseif (string.find(msg, L["blink_trigger"])) then
		self:Sync(syncName.blink)
	elseif (string.find(msg, L["cs_trigger2"]) or string.find(msg, L["cs_trigger"])) then
		self:Sync(syncName.cs)
	elseif (string.find(msg, L["curse_trigger"]) or string.find(msg, L["curse_trigger2"])) then
		self:Sync(syncName.curse)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.blink then
		self:Blink()
	elseif sync == syncName.deaden  then
		self:DeadenMagic()
	elseif sync == syncName.deadenOver then
		self:DeadenMagicOver()
	elseif sync == syncName.curse then
		self:Curse()
	elseif sync == syncName.cs then
		self:Counterspell()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Counterspell()
	if self.db.profile.counterspell then
		self:Bar(L["cs_bar"], timer.cs, icon.cs)
	end
	self:DelayedSync(timer.cs, syncName.cs)
end

function module:Curse()
	self:Message(L["curse_warn"], "Attention", "Alarm")
	self:Bar(L["curse_bar"], timer.curse, icon.curse) -- seems to be completly random
end

function module:Blink()
	firstblink = false
	--self:KTM_Reset()

	if self.db.profile.blink then
		self:Message(L["blink_warn"], "Important")
		self:Bar(L["blink_bar"], timer.blink, icon.blink)

		self:DelayedMessage(timer.blink - 5, L["blink_soon_warn"], "Attention", "Alarm", nil, nil, true)
	end

	self:DelayedSync(timer.blink, syncName.blink)
end

function module:DeadenMagic()
	if self.db.profile.deaden then
		self:RemoveBar(L["deaden_bar"])
		self:Message(L["deaden_warn"], "Important")
		self:IntervalBar(L["deaden_bar"], timer.earliestDeaden, timer.latestDeaden, icon.deaden)
		if playerClass == "SHAMAN" or playerClass == "PRIEST" then
			self:WarningSign(icon.deaden, timer.earliestDeaden)
		end
	end
end

function module:DeadenMagicOver()
	if self.db.profile.deaden then
		if playerClass == "SHAMAN" or playerClass == "PRIEST" then
			self:RemoveWarningSign(icon.deaden)
		end
	end
end
