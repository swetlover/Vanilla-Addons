------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.arlokk
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Arlokk",

	-- commands
	vanish_cmd = "vanish",
	vanish_name = "消失警报",
	vanish_desc = "消失的警报.",

	mark_cmd = "mark",
	mark_name = "娅尔罗的印记警报",
	mark_desc = "娅尔罗的印记警报.",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "旋风斩警报",
	whirlwind_desc = "旋风斩警报.",
	
	phase_cmd = "phase",
	phase_name = "阶段通知",
	phase_desc = "阶段通知.",
	
	puticon_cmd = "puticon",
	puticon_name = "raid标记玩家",
	puticon_desc = "中了印记的玩家可以被团队标记.\n\n(需要A或L)",
	
	-- triggers
    trigger_engage = "your priestess calls upon your might",
	trigger_mark = "Feast on (.+), my pretties!",
	trigger_whirlwind = "获得了旋风斩的效果。",
	
	-- messages
	msg_markYou = "你是标记!",
	msg_markOther = "%s 是标记!",
	msg_markGone = "娅尔罗的印记效果从(.+)身上消失。",
	msg_phaseTroll = "巨魔阶段",
	msg_phasePanther = "豹的阶段",
	msg_phaseVanish = "消失!",
	
	-- bars
	bar_whirlwind = "旋风斩",
	bar_vanishReturn = "预计出现",
	bar_vanishNext = "下次消失",
	
	-- misc
	
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	vanish_name = "Verschwinden anzeigen",
	vanish_desc = "Verk\195\188ndet Boss' Verschwinden.",

	mark_name = "Alarm f\195\188r Arlokks Mal",
	mark_desc = "Warnt wenn Spieler markiert sind.",

	whirlwind_name = "Alarm f\195\188r Wirbelwind",
	whirlwind_desc = "Zeigt Balken f\195\188r Wirbelwind.",
	
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses.",
	
	puticon_name = "Schlachtzugsymbol auf die markiert Spieler",
	puticon_desc = "Versetzt eine Schlachtzugsymbol auf der markiert Spieler.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
	
	-- triggers
    trigger_engage = "your priestess calls upon your might",
	trigger_mark = "Feast on (.+), my pretties!",
	trigger_whirlwind = "High Priestess Arlokk bekommt \'Wirbelwind\'\.",
	
	-- messages
	msg_markYou = "Du bist markiert!",
	msg_markOther = "%s ist markiert!",
	msg_markGone = "Arlokks Mal schwindet von (.+)\.",
	msg_phaseTroll = "Troll Phase",
	msg_phasePanther = "Panther Phase",
	msg_phaseVanish = "Verschwinden!",
	
	-- bars
	bar_whirlwind = "Wirbelwind",
	bar_vanishReturn = "Ungefähre Rückkehr",
	bar_vanishNext = "Nächstes Verschwinden",
	
	-- misc	

} end )
