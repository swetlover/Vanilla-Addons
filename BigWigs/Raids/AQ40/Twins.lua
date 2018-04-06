
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("The Twin Emperors", "Ahn'Qiraj")

------------------------------
--      Are you local?      --
------------------------------

local veklor = AceLibrary("Babble-Boss-2.2")["Emperor Vek'lor"]
local veknilash = AceLibrary("Babble-Boss-2.2")["Emperor Vek'nilash"]
local boss = AceLibrary("Babble-Boss-2.2")["The Twin Emperors"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs" .. boss)
local twinstarted = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Twins",

	bug_cmd = "bug",
	bug_name = "爆炸虫警报",
	bug_desc = "爆炸虫警报",

	teleport_cmd = "teleport",
	teleport_name = "传送警报",
	teleport_desc = "传送警报",

	enrage_cmd = "enrage",
	enrage_name = "激怒警报",
	enrage_desc = "激怒警报",

	heal_cmd = "heal",
	heal_name = "治疗警报",
	heal_desc = "双子皇帝互相治疗时发出警报",
            
    blizzard_cmd = "blizzard",
    blizzard_name = "暴风雪警报",
    blizzard_desc = "显示图标如果你中暴风雪警报",

	porttrigger = "获得了双子传送的效果。",
	portwarn = "传送!",
	portdelaywarn = "传送 5 秒!",
	portdelaywarn10 = "传送 10 秒!",
	bartext = "双子传送(近战跑位)",
	explodebugtrigger = "获得了爆炸虫",
	explodebugwarn = "爆炸虫即将出现！",
	enragetrigger = "becomes enraged.",
	--trigger = "Blizzard",
	enragewarn = "双子皇帝获得了激怒的效果！",
	healtrigger1 = "的治疗兄弟为",
	healtrigger2 = "的治疗兄弟为",
	healwarn = "正在施放治疗兄弟 - 快将他们分开！",
	startwarn = "双子皇帝开始! 15分钟后激怒!",
	enragebartext = "激怒",
	warn1 = "激怒 10 分钟",
	warn2 = "激怒 5 分钟",
	warn3 = "激怒 3 分钟",
	warn4 = "激怒 90 秒",
	warn5 = "激怒 60 秒",
	warn6 = "激怒 30 秒",
	warn7 = "激怒 10 秒",
    
    blizzard_trigger = "你受到了暴风雪效果的影响。",
    blizzard_gone_trigger = "暴风雪效果从你身上",
	blizzard_warn = "离开暴雪!",


	pull_trigger1 = "Ah, lambs to the slaughter.",
	pull_trigger2 = "Prepare to embrace oblivion!",
	pull_trigger3 = "Join me brother, there is blood to be shed.",
	pull_trigger4 = "To decorate our halls.",
	pull_trigger5 = "Let none survive!",
	pull_trigger6 = "It's too late to turn away.",
	pull_trigger7 = "Look brother, fresh blood.",
	pull_trigger8 = "Like a fly in a web.",
	pull_trigger9 = "Shall be your undoing!",
	pull_trigger10 = "Your brash arrogance",

	kill_trigger = "My brother...NO!",
} end )

L:RegisterTranslations("deDE", function() return {

		bug_name = "Explodierende K\195\164fer",
		bug_desc = "Warnung vor explodierenden K\195\164fern.",

		teleport_name = "Teleport",
		teleport_desc = "Warnung, wenn die Zwillings Imperatoren sich teleportieren.",

		enrage_name = "Wutanfall",
		enrage_desc = "Warnung, wenn die Zwillings Imperatoren w\195\188tend werden.",

		heal_name = "Heilung",
		heal_desc = "Warnung, wenn die Zwillings Imperatoren sich heilen.",

		blizzard_name = "Blizzard Warnung",
		blizzard_desc = "Zeigt ein Icon wenn du im Blizzard stehst",

		porttrigger = "wirkt Zwillingsteleport.",
		portwarn = "Teleport!",
		portdelaywarn = "Teleport in ~5 Sekunden!",
		portdelaywarn10 = "Teleport in ~10 Sekunden!",
		bartext = "Teleport",
		explodebugtrigger = "bekommt 'Käfer explodieren lassen'",
		explodebugwarn = "K\195\164fer explodiert!",
		enragetrigger = "wird w\195\188tend.", -- ? "bekommt 'Wutanfall'"
		enragewarn = "Zwillings Imperatoren sind w\195\188tend!",
		healtrigger1 = "'s Bruder heilen heilt",
		healtrigger2 = " Bruder heilen heilt",
		healwarn = "Heilung gewirkt!",
		startwarn = "Zwillings Imperatoren angegriffen! Wutanfall in 15 Minuten!",
		enragebartext = "Wutanfall",
		warn1 = "Wutanfall in 10 Minuten",
		warn2 = "Wutanfall in 5 Minuten",
		warn3 = "Wutanfall in 3 Minuten",
		warn4 = "Wutanfall in 90 Sekunden",
		warn5 = "Wutanfall in 60 Sekunden",
		warn6 = "Wutanfall in 30 Sekunden",
		warn7 = "Wutanfall in 10 Sekunden",

		blizzard_trigger = "Ihr seid von Blizzard betroffen.",
		blizzard_gone_trigger = "'Blizzard' schwindet von Euch.",
		blizzard_warn = "Lauf aus Blizzard!",

		pull_trigger1 = "Ihr seid nichts weiter als",
		pull_trigger2 = "Seid bereit in die",
		pull_trigger3 = "Komm Bruder",
		pull_trigger4 = "Um unsere Hallen",
		pull_trigger5 = "Niemand wird",
		pull_trigger6 = "Nun gibt es kein",
		pull_trigger7 = "Sieh Bruder",
		pull_trigger8 = "Wie eine Fliege",
		pull_trigger9 = "Wird euer Untergang",
		pull_trigger10 = "Eure unversch",

		kill_trigger = "Mein Bruder...",
} end )


-- module variables
module.revision = 20008 -- To be overridden by the module!
local veklor = AceLibrary("Babble-Boss-2.2")["Emperor Vek'lor"]
local veknilash = AceLibrary("Babble-Boss-2.2")["Emperor Vek'nilash"]
module.enabletrigger = {veklor, veknilash} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"bug", "teleport", "enrage", "heal", "blizzard", "bosskill"}

-- locals
local timer = {
	earliestTeleport = 32,
	latestTeleport = 40,
	enrage = 900,
	blizzard = 10,
}
local icon = {
	teleport = "Spell_Arcane_Blink",
	enrage = "Spell_Shadow_UnholyFrenzy",
	blizzard = "Spell_Frost_IceStorm",
}
local syncName = {
	teleport = "TwinsTeleport"..module.revision,
	teleport_old = "TwinsTeleport"..module.revision,
}

local berserkannounced = nil


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["pull_trigger1"])
module:RegisterYellEngage(L["pull_trigger2"])
module:RegisterYellEngage(L["pull_trigger3"])
module:RegisterYellEngage(L["pull_trigger4"])
module:RegisterYellEngage(L["pull_trigger5"])
module:RegisterYellEngage(L["pull_trigger6"])
module:RegisterYellEngage(L["pull_trigger7"])
module:RegisterYellEngage(L["pull_trigger8"])
module:RegisterYellEngage(L["pull_trigger9"])
module:RegisterYellEngage(L["pull_trigger10"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")

	self:ThrottleSync(28, syncName.teleport)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
end

-- called after boss is engaged
function module:OnEngage()
	self:Sync(syncName.teleport)

	if self.db.profile.enrage then
		self:Message(L["startwarn"], "Important")
		self:Bar(L["enragebartext"], timer.enrage, icon.enrage)

		self:DelayedMessage(timer.enrage - 10 * 60, L["warn1"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 5 * 60, L["warn2"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 3 * 60, L["warn3"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 90, L["warn4"], "Urgent", nil, nil, true)
		self:DelayedMessage(timer.enrage - 60, L["warn5"], "Urgent", nil, nil, true)
		self:DelayedMessage(timer.enrage - 30, L["warn6"], "Important", nil, nil, true)
		self:DelayedMessage(timer.enrage - 10, L["warn7"], "Important", nil, nil, true)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CheckForBossDeath(msg)
	if msg == string.format(UNITDIESOTHER, veklor) or msg == string.format(UNITDIESOTHER, veknilash) then
		self:SendBossDeathSync()
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["kill_trigger"]) then
		self:SendBossDeathSync()
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE(msg)
	if string.find(msg, L["blizzard_trigger"]) then
		if self.db.profile.blizzard then
			self:Message(L["blizzard_warn"], "Personal", true, "Alarm")
			self:WarningSign(icon.blizzard, timer.blizzard)
		end
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, L["blizzard_gone_trigger"]) then
		self:RemoveWarningSign(icon.blizzard)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if (string.find(msg, L["porttrigger"])) then
		self:Sync(syncName.teleport_old)
		self:Sync(syncName.teleport)
		self:DebugMessage("real port trigger")
	end
	if (string.find(msg, L["explodebugtrigger"]) and self.db.profile.bug) then
		self:Message(L["explodebugwarn"], "Personal", true)
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if (not self.prior and (string.find(msg, L["healtrigger1"]) or string.find(msg, L["healtrigger2"])) and self.db.profile.heal) then
		self:Message(L["healwarn"], "Important")
		self.prior = true
		self:ScheduleEvent(function() module.prior = nil end, 10)
	end
end

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if (string.find(msg, L["enragetrigger"]) and self.db.profile.enrage) then
		self:Message(L["enragewarn"], "Important")
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.teleport then
		self:Teleport()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Teleport()
	if self.db.profile.teleport then
		self:IntervalBar(L["bartext"], timer.earliestTeleport, timer.latestTeleport, icon.teleport)

		--self:DelayedSync(timer.teleport, syncName.teleport_old)
		--self:DelayedSync(timer.teleport, syncName.teleport)
		self:KTM_Reset()

		self:DelayedSound(timer.earliestTeleport - 10, "Ten")
		self:DelayedSound(timer.earliestTeleport - 3, "Three")
		self:DelayedSound(timer.earliestTeleport - 2, "Two")
		self:DelayedSound(timer.earliestTeleport - 1, "One")
		self:DelayedMessage(timer.earliestTeleport - 0.1, L["portwarn"], "Attention", false, "Alarm")
	end
end