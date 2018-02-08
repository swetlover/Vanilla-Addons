------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.bwl.ebonroc
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Ebonroc",
	
	-- commands
	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "龙翼打击警报",
	wingbuffet_desc = "龙翼打击警报.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "暗影烈焰警报",
	shadowflame_desc = "暗影烈焰.",

	curse_cmd = "curse",
	curse_name = "埃博诺克之影警报",
	curse_desc = "谁中了埃博诺克之影警报.",
	
	-- triggers
	trigger_wingBuffet = "埃博诺克开始施放龙翼打击。",
	trigger_shadowFlame = "埃博诺克开始施放暗影烈焰。",
	trigger_shadowCurseYou = "你受到了埃博诺克之影效果的影响。",
	trigger_shadowCurseOther = "(.+)受到了埃博诺克之影效果的影响。",
	
	-- messages
	msg_wingBuffet = "龙翼打击! 下一次30秒后!",
	msg_wingBuffetSoon = "现在嘲讽! 马上龙翼打击!",
	msg_shadowFlame = "暗影烈焰来临!",
	msg_shadowCurseYou = "你中了埃博诺克之影!",
	msg_shadowCurseOther = "%s有埃博诺克之影! 嘲讽!",
	
	-- bars
	bar_wingBuffetCast = "龙翼打击",
	bar_wingBuffetNext = "下次龙翼打击",
	bar_wingBuffetFirst = "第一次龙翼打击",
	bar_shadowFlameCast = "可能暗影烈焰",
	bar_shadowFlameNext = "下次暗影烈焰",
	bar_shadowCurse = "%s - 博诺克之影",
    bar_shadowCurseFirst = "第一次博诺克之影",
	
	-- misc

} end)

L:RegisterTranslations("deDE", function() return {
	cmd = "Schattenschwinge",
	-- commands
	wingbuffet_name = "Alarm f\195\188r Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Warnung, wenn Ebonroc Fl\195\188gelsto\195\159 wirkt.",

	shadowflame_name = "Alarm f\195\188r Schattenflamme",
	shadowflame_desc = "Warnung, wenn Ebonroc Schattenflamme wirkt.",

	curse_name = "Schattenschwinges Schatten Warnungen",
	curse_desc = "Zeigt eine Zeitleiste und k\195\188ndigt an wer Schattenschwinges Schatten bekommt.",
	
	-- triggers
	trigger_wingBuffet = "Schattenschwinge beginnt Fl\195\188gelsto\195\159 zu wirken.",
	trigger_shadowFlame = "Schattenschwinge beginnt Schattenflamme zu wirken.",
	trigger_shadowCurseYou = "Ihr seid von Schattenschwinges Schatten betroffen.",
	trigger_shadowCurseOther = "(.+) ist von Schattenschwinges Schatten betroffen.",
	
	-- messages
	msg_wingBuffet = "Fl\195\188gelsto\195\159! N\195\164chster in 30 Sekunden!",
	msg_wingBuffetSoon = "SPOTT jetzt! Fl\195\188gelsto\195\159 bald!",
	msg_shadowFlame = "Schattenflamme bald!",
	msg_shadowCurseYou = "Du hast Schattenschwinges Schatten!",
	msg_shadowCurseOther = "%s hat Schattenschwinges Schatten! SPOTT!",
	
	-- bars
	bar_wingBuffetCast = "Fl\195\188gelsto\195\159",
	bar_wingBuffetNext = "N\195\164chster Fl\195\188gelsto\195\159",
	bar_wingBuffetFirst = "Erster Fl\195\188gelsto\195\159",
	bar_shadowFlameCast = "Mögliche Schattenflamme",
	bar_shadowFlameNext = "Nächste Schattenflamme",
	bar_shadowCurse = "%s - Schattenschwinges Schatten",
    bar_shadowCurseFirst = "Erster Schattenschwinges Schatten",
	
	-- misc
	
} end)
