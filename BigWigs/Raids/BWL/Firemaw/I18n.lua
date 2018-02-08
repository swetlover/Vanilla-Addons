------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.bwl.firemaw
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Firemaw",
	
	-- commands
	flamebuffet_cmd = "flamebuffet",
	flamebuffet_name = "烈焰打击警报",
	flamebuffet_desc = "烈焰打击警报.",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "龙翼打击警报",
	wingbuffet_desc = "龙翼打击警报.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "暗影烈焰警报",
	shadowflame_desc = "暗影烈焰警报.",
	
	-- triggers
	trigger_wingBuffet = "费尔默开始施放龙翼打击。",
	trigger_shadowFlame = "费尔默开始施放暗影烈焰。",
	trigger_flameBuffetAfflicted = "受到了烈焰打击",
	trigger_flameBuffetResisted = "费尔默烈焰打击被抵抗了。",
	trigger_flameBuffetImmune = "费尔默的烈焰打击施放失败。(.+)对此免疫。",
	trigger_flameBuffetAbsorbYou = "你吸收了费尔默的烈焰打击。",
	trigger_flameBuffetAbsorbOther = "费尔默的烈焰打击被(.+)吸收了。",
	
	-- messages
	msg_wingBuffet = "龙翼打击! 下次30秒后施放!",
	msg_wingBuffetSoon = "现在嘲讽! 龙翼打击马上!",
	msg_shadowFlame = "暗影烈焰来临!",
	
	-- bars
	bar_wingBuffetCast = "龙翼打击",
	bar_wingBuffetNext = "下次龙翼打击",
	bar_wingBuffetFirst = "第一次龙翼打击",
	bar_shadowFlameCast = "暗影烈焰",
	bar_shadowFlameNext = "可能暗影烈焰",
	bar_flameBuffet = "烈焰打击",
	
	-- misc

} end)

L:RegisterTranslations("deDE", function() return {
	cmd = "Feuerschwinge",
	-- commands
	flamebuffet_name = "Alarm f\195\188r Flammenpuffer",
	flamebuffet_desc = "Warnung f\195\188r Flammenpuffer.",

	wingbuffet_name = "Alarm f\195\188r Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Warnung, wenn Ebonroc Fl\195\188gelsto\195\159 wirkt.",

	shadowflame_name = "Alarm f\195\188r Schattenflamme",
	shadowflame_desc = "Warnung, wenn Ebonroc Schattenflamme wirkt.",
	
	-- triggers
	trigger_wingBuffet = "Ebonroc beginnt Fl\195\188gelsto\195\159 zu wirken.",
	trigger_shadowFlame = "Ebonroc beginnt Schattenflamme zu wirken.",
	trigger_flameBuffetAfflicted = "von Flammenpuffer betroffen",
	trigger_flameBuffetResisted = "Flammenpuffer(.+) widerstanden",
	trigger_flameBuffetImmune = "Flammenpuffer(.+) immun",
	trigger_flameBuffetAbsorbYou = "Ihr absorbiert Firemaws Flammenpuffer",
	trigger_flameBuffetAbsorbOther = "Flammenpuffer von Firemaw wird absorbiert von",
	
	-- messages
	msg_wingBuffet = "Fl\195\188gelsto\195\159! N\195\164chster in 30 Sekunden!",
	msg_wingBuffetSoon = "Jetzt TAUNT! Fl\195\188gelsto\195\159 bald!",
	msg_shadowFlame = "Schattenflamme bald!",
	
	-- bars
	bar_wingBuffetCast = "Fl\195\188gelsto\195\159",
	bar_wingBuffetNext = "N\195\164chster Fl\195\188gelsto\195\159",
	bar_wingBuffetFirst = "Erster Fl\195\188gelsto\195\159",
	bar_shadowFlameCast = "Schattenflamme",
	bar_shadowFlameNext = "Mögliche Schattenflamme",
	bar_flameBuffet = "Flammenpuffer",
	
	-- misc

} end)
