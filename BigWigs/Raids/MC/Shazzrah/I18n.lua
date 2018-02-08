------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.mc.shazzrah
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Shazzrah",
	
	-- commands
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
	
	-- triggers
	trigger_blink = "施放了沙斯拉尔之门",
	trigger_deaden = "沙斯拉尔获得了衰减魔法的效果",
	trigger_curseHit = "效果从沙斯拉尔",
	trigger_counterspellCast = "沙斯拉尔施放了法术反制",
    trigger_counterspellResist = "沙斯拉尔的法术反制被(.+)抵抗了",
	trigger_curseResist = "沙斯拉尔的诅咒被(.+)抵抗了",
	trigger_deadenGone = "衰减魔法效果从沙斯拉尔身上消失",
	
	-- messages
	msg_blinkNow = "闪现术 - 45秒后施放!",
	msg_blinkSoon = "3秒后闪现术!",
	msg_deaden = "衰减魔法! 快驱散!",
	msg_curse = "沙斯拉尔的诅咒! 驱散!",
	
	-- bars
	bar_blink = "可能闪现",
	bar_deaden = "衰减魔法",
	bar_curse = "沙斯拉尔的诅咒",
	bar_counterspell = "可能法术反制",
	
	-- misc
	
} end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	counterspell_name = "Alarm für Gegenzauber",
	counterspell_desc = "Warnen vor Shazzrahs Gegenzauber",
	
	curse_name = "Alarm für Shazzrahs Fluch",
	curse_desc = "Warnen vor Shazzrahs Fluch",
	
	deaden_name = "Alarm für Magie dämpfen",
	deaden_desc = "Warnen wenn Shazzrah Magie dämpfen hat",
	
	blink_name = "Alarm für Blinzeln",
	blink_desc = "Warnen wenn Shazzrah blinzelt",
	
	-- triggers
	trigger_blink = "Shazzrah wirkt Portal von Shazzrah",
	trigger_deaden = "Shazzrah bekommt \'Magie dämpfen",
	trigger_curseHit = "von Shazzrahs Fluch betroffen",
	trigger_counterspellCast = "Shazzrah wirkt Gegenzauber",
    trigger_counterspellResist = "Shazzrahs Gegenzauber wurde von (.+) widerstanden",
	trigger_curseResist = "Shazzrahs Fluch(.)widerstanden",
	trigger_deadenGone = "Magie dämpfen schwindet von Shazzrah",
	
	-- messages
	msg_blinkNow = "Blinzeln! Nächstes in ~45 Sekunden!",
	msg_blinkSoon = "Blinzeln in ~5 Sekunden!",
	msg_deaden = "Magie dämpfen auf Shazzrah! Entferne magie!",
	msg_curse = "Shazzrahs Fluch! Entfluche JETZT!",
	
	-- bars
	bar_blink = "Mögliches Blinzeln",
	bar_deaden = "Magie dämpfen",
	bar_curse = "Nächster Fluch",
	bar_counterspell = "Möglicher Gegenzauber",
	
	-- misc
	
} end)
