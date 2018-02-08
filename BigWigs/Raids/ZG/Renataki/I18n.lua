------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.renataki
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Renataki",

	-- commands
	vanish_cmd = "vanish",
	vanish_name = "消失通告",
	vanish_desc = "显示boss消失通告.",
	
	enraged_cmd = "enraged",
	enraged_name = "通报boss狂怒",
	enraged_desc = "通报boss狂怒.",
	
	-- triggers
	trigger_enrage = "雷纳塔基获得了狂怒的效果。",
	
	-- messages
	msg_enrageSoon = "马上狂怒! 准备!",
	msg_enrageNow = "狂怒!",
	msg_vanishSoon = "马上消失!",
	msg_vanishNow = "Boss 消失了!",
	msg_unvanish = "Boss 出现!",
	
	-- bars
	bar_vanish = "消失",
	
	-- misc

} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Renataki",

	-- commands
	vanish_cmd = "vanish",
	vanish_name = "Verschwinden anzeigen",
	vanish_desc = "Verk\195\188ndet Boss' Verschwinden.",
	
	enraged_cmd = "enraged",
	enraged_name = "Verk\195\188ndet Boss' Raserei",
	enraged_desc = "L\195\164sst dich wissen, wenn Boss h\195\164rter zuschl\195\164gt.",
	
	-- triggers
	trigger_enrage = "Renataki bekommt \'Wutanfall\'\.",
	
	-- messages
	msg_enrageSoon = "Raserei bald! Mach dich bereit!",
	msg_enrageNow = "Boss ist in Raserei!",
	msg_vanishSoon = "Verschwinden bald!",
	msg_vanishNow = "Boss ist verschwunden!",
	msg_unvanish = "Boss wird aufgedeckt!",
	
	-- bars
	bar_vanish = "Verschwinden",
	
	-- misc

} end )
