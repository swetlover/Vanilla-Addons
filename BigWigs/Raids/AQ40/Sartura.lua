
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Battleguard Sartura", "Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Sartura",
	
	add_name = "沙尔图拉皇家卫士",
	starttrigger = "defiling these sacred grounds",
	endtrigger = "I serve to the last!",
	startwarn = "沙尔图拉开始 - 10 分钟后狂暴!",
	enragetrigger = "获得了激怒的效果。",
	enragetrigger2 = "沙尔图拉获得了激怒的效果。",
	berserktrigger = "沙尔图拉获得了狂暴的效果。",
	enragewarn = "激怒! 加大治疗!",
	berserkwarn = "狂暴!",
	berserktext = "狂暴(Boss伤害增加到1万)",
	warn1 = "狂暴 5 分钟!",
	warn2 = "狂暴 3 分钟!",
	warn3 = "狂暴 90 秒!",
	warn4 = "狂暴 60 秒!",
	warn5 = "狂暴 30 秒!",
	warn6 = "狂暴 10 秒!",
	whirlwindon = "沙尔图拉获得了旋风斩的效果。",
	whirlwindoff = "旋风斩效果从沙尔图拉身上消失。",
	whirlwindonwarn = "旋风斩!",
	whirlwindoffwarn = "旋风斩结束!",
	whirlwindbartext = "旋风斩(360度10码内AOE)",
	whirlwindnextbartext = "可能旋风斩(360度10码内AOE)",
	whirlwindfirstbartext = "第一次旋风斩(360度10码内AOE)",
	whirlwindinctext = "旋风斩来临!",
	deadaddtrigger = "沙尔图拉皇家卫士死亡了。",
	deadbosstrigger = "沙尔图拉死亡了。",
	addmsg = "%d/3 沙尔图拉皇家卫士死亡!",

	knockback_message = "击退10秒",
 	knockback_warn = "可能马上击退!",
 	knockbackbartext = "击退!",
 
	
	adds_cmd = "adds",
	adds_name = "小怪死亡",
	adds_desc = "沙尔图拉的皇家卫兵通告.",
	
	enrage_cmd = "enrage",
	enrage_name = "激怒",
	enrage_desc = "通告在 20% 血的时候激怒.",
	
	berserk_cmd = "berserk",
	berserk_name = "狂暴",
	berserk_desc = "boss开始后10分钟狂暴提示.",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "旋风斩",
	whirlwind_desc = "旋风斩计时.",

	knockback_cmd = "knockback",
 	knockback_name = "击退警报",
 	knockback_desc = "击退的警报",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Sartura",

	add_name = "Sarturas Königswache",
	starttrigger = "defiling these sacred grounds", -- translation missing
	endtrigger = "I serve to the last!", -- translation missing
	startwarn = "Sartura angegriffen! Berserker in 10 Minuten!",
	enragetrigger = "becomes enraged", -- translation missing
	enragetrigger2 = "Schlachtwache Sartura bekommt 'Wutanfall'.",
	berserktrigger = "Schlachtwache Sartura bekommt 'Berserker'.",
	enragewarn = "Wutanfall! Spam heilung!",
	berserkwarn = "Berserker!",
	berserktext = "Berserker",
	warn1 = "Berserker in 5 Minuten!",
	warn2 = "Berserker in 3 Minuten!",
	warn3 = "Berserker in 90 Sekunden!",
	warn4 = "Berserker in 60 Sekunden!",
	warn5 = "Berserker in 30 Sekunden!",
	warn6 = "Berserker in 10 Sekunden!",
	whirlwindon = "Schlachtwache Sartura bekommt 'Wirbelwind'.",
	whirlwindoff = "Wirbelwind schwindet von Schlachtwache Sartura.",
	whirlwindonwarn = "Wirbelwind!",
	whirlwindoffwarn = "Wirbelwind ist zu Ende!",
	whirlwindbartext = "Wirbelwind",
	whirlwindnextbartext = "Möglicher Wirbelwind",
	whirlwindfirstbartext = "Erster Wirbelwind",
	whirlwindinctext = "Wirbelwind bald!",
	deadaddtrigger = "Sarturas Königswache stirbt.",
	deadbosstrigger = "Schlachtwache Sartura stirbt.",
	addmsg = "%d/3 Sarturas Königswache tot!",

	adds_cmd = "adds",
	adds_name = "Z\195\164hler f\195\188r tote Adds",
	adds_desc = "Verk\195\188ndet Sarturas Königswache Tod.",

	enrage_cmd = "enrage",
	enrage_name = "Wutanfall",
	enrage_desc = "Meldet den Wutanfall, wenn der Boss bei 20% HP ist.",

	berserk_cmd = "berserk",
	berserk_name = "Berserker",
	berserk_desc = "Warnt vor dem Berserkermodus, in den der Boss nach 10 Minuten geht.",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Wirbelwind",
	whirlwind_desc = "Timer und Balken f\195\188r Wirbelwinde.",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"whirlwind", "adds", "enrage", "berserk", "knockback", "bosskill"}


-- locals
local timer = {
	berserk = 600,
	firstWhirlwind = 20,
	firstWhirlwind = 8,
	whirlwind = 15,
	earliestNextWhirlwind = 5,
	latestNextWhirlwind = 10,
	firstKnockback = 10,
}
local icon = {
	berserk = "Spell_Shadow_UnholyFrenzy",
	whirlwind = "Ability_Whirlwind",
	knockback = "Ability_Rogue_FeignDeath",
}
local syncName = {
	whirlwind = "SarturaWhirlwindStart"..module.revision,
	whirlwindOver = "SarturaWhirlwindEnd"..module.revision,
	enrage = "SarturaEnrage"..module.revision,
	berserk = "SarturaBerserk"..module.revision,
	add = "SarturaAddDead"..module.revision,
}

local guard = 0


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")

	self:ThrottleSync(3, syncName.whirlwind)
	self:ThrottleSync(3, syncName.whirlwindOver)
	self:ThrottleSync(5, syncName.enrage)
	self:ThrottleSync(5, syncName.berserk)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	guard = 0

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.berserk then
		self:Message(L["startwarn"], "Important")
		self:Bar(L["berserktext"], timer.berserk, icon.berserk)
		self:DelayedMessage(timer.berserk - 5 * 60, L["warn1"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.berserk - 3 * 60, L["warn2"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.berserk - 90, L["warn3"], "Urgent", nil, nil, true)
		self:DelayedMessage(timer.berserk - 60, L["warn4"], "Urgent", nil, nil, true)
		self:DelayedMessage(timer.berserk - 30, L["warn5"], "Important", nil, nil, true)
		self:DelayedMessage(timer.berserk - 10, L["warn6"], "Important", nil, nil, true)
	end
	if self.db.profile.whirlwind then
		self:Bar(L["whirlwindfirstbartext"], timer.firstWhirlwind, icon.whirlwind)
 		self:DelayedMessage(timer.firstWhirlwind - 3, L["whirlwindinctext"], "Attention", true, "Alarm")
 	end
 	if self.db.profile.knockback then
 		self:Bar(L["knockbackbartext"], timer.firstKnockback, icon.knockback)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["whirlwindon"] then
		self:Sync(syncName.whirlwind)
	elseif msg == L["enragetrigger2"] then
		self:Sync(syncName.enrage)
	elseif msg == L["berserktrigger"] then
		self:Sync(syncName.berserk)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if msg == L["deadaddtrigger"] then
		self:Sync(syncName.add.." "..guard+1)
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["endtrigger"] then
		self:SendBossDeathSync()
	end
end

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(msg, L["enragetrigger"]) then
		self:Sync(syncName.enrage)
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	if msg == L["whirlwindoff"] then
		self:Sync(syncName.whirlwindOver)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.whirlwind and self.db.profile.whirlwind then
		self:Message(L["whirlwindonwarn"], "Important")
		self:Bar(L["whirlwindbartext"], timer.whirlwind, icon.whirlwind)
		self:RemoveBar(L["whirlwindnextbartext"])
		self:DelayedIntervalBar(timer.whirlwind, L["whirlwindnextbartext"], timer.earliestNextWhirlwind, timer.latestNextWhirlwind, icon.whirlwind)
		self:DelayedMessage(timer.earliestNextWhirlwind+timer.whirlwind - 3, L["whirlwindinctext"], "Attention", true, "Alarm")
	elseif sync == syncName.whirlwindOver and self.db.profile.whirlwind then
		self:RemoveBar(L["whirlwindbartext"])
		self:Message(L["whirlwindoffwarn"], "Attention")
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Message(L["enragewarn"], "Attention")
	elseif sync == syncName.berserk and self.db.profile.berserk then
		self:Message(L["berserkwarn"], "Attention")
		self:RemoveBar(L["berserktext"])

		self:CancelDelayedMessage(L["warn1"])
		self:CancelDelayedMessage(L["warn2"])
		self:CancelDelayedMessage(L["warn3"])
		self:CancelDelayedMessage(L["warn4"])
		self:CancelDelayedMessage(L["warn5"])
		self:CancelDelayedMessage(L["warn6"])
	elseif sync == syncName.add then
		rest = tonumber(rest)
		if rest == guard + 1 then
			guard = guard + 1
			if self.db.profile.adds then
				self:Message(string.format(L["addmsg"], guard), "Positive")
			end
		end
	end
end
