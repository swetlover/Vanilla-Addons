------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq40.sartura
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Sartura",

	-- commands
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

	-- triggers
	trigger_start = "defiling these sacred grounds",
	trigger_enrageEmote = "becomes enraged",
	trigger_enrage2 = "沙尔图拉获得了激怒的效果。",
	trigger_enrage = "沙尔图拉获得了狂暴的效果。",
	trigger_whirlwindGain = "沙尔图拉获得了旋风斩的效果。",
	trigger_whirlwindGone = "旋风斩效果从沙尔图拉身上消失。",
	trigger_addDeath = "沙尔图拉皇家卫士死亡了。",

	-- messages
	msg_enrage = "狂怒!",
	msg_berserk = "狂暴!",
	msg_whirlwindGain = "旋风斩!",
	msg_whirlwindGone = "旋风斩结束!",
	msg_addDeath = "%d/3 沙尔图拉皇家卫士死亡!",
	msg_berserk5m = "狂暴 5 分钟!",
	msg_berserk3m = "狂暴 3 分钟!",
	msg_berserk90 = "狂暴 90 秒!",
	msg_berserk60 = "狂暴 60 秒!",
	msg_berserk30 = "狂暴 30 秒!",
	msg_berserk10 = "狂暴 10 秒!",

	-- bars
	bar_whirlwind = "旋风斩",
	bar_possibleWhirlwind = "可能旋风斩",
	bar_firstWhirlwind = "第一次旋风斩",
	bar_berserk = "狂暴",

	-- misc
	misc_addName = "沙尔图拉皇家卫士",
}
end)

L:RegisterTranslations("deDE", function() return {
	cmd = "Sartura",

	-- commands
	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Sarturas Königswache Tod.",
	enrage_name = "Wutanfall",
	enrage_desc = "Meldet den Wutanfall, wenn der Boss bei 20% HP ist.",
	berserk_name = "Berserker",
	berserk_desc = "Warnt vor dem Berserkermodus, in den der Boss nach 10 Minuten geht.",
	whirlwind_name = "Wirbelwind",
	whirlwind_desc = "Timer und Balken für Wirbelwinde.",

	-- triggers
	trigger_start = "defiling these sacred grounds", -- translation missing
	trigger_enrageEmote = "becomes enraged", -- translation missing
	trigger_enrage2 = "Schlachtwache Sartura bekommt 'Wutanfall'.",
	trigger_enrage = "Schlachtwache Sartura bekommt 'Berserker'.",
	trigger_whirlwindGain = "Schlachtwache Sartura bekommt 'Wirbelwind'.",
	trigger_whirlwindGone = "Wirbelwind schwindet von Schlachtwache Sartura.",
	trigger_addDeath = "Sarturas Königswache stirbt.",

	-- messages
	msg_enrage = "Wutanfall!",
	msg_berserk = "Berserker!",
	msg_whirlwindGain = "Wirbelwind!",
	msg_whirlwindGone = "Wirbelwind ist zu Ende!",
	msg_addDeath = "%d/3 Sarturas Königswache tot!",
	msg_berserk5m = "Berserker in 5 Minuten!",
	msg_berserk3m = "Berserker in 3 Minuten!",
	msg_berserk90 = "Berserker in 90 Sekunden!",
	msg_berserk60 = "Berserker in 60 Sekunden!",
	msg_berserk30 = "Berserker in 30 Sekunden!",
	msg_berserk10 = "Berserker in 10 Sekunden!",

	-- bars
	bar_whirlwind = "Wirbelwind",
	bar_possibleWhirlwind = "Möglicher Wirbelwind",
	bar_firstWhirlwind = "Erster Wirbelwind",
	bar_berserk = "Berserker",

	-- misc
	misc_addName = "Sarturas Königswache",
}
end)
