------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.bwl.flamegor
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Flamegor",
	
	-- commands
	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "龙翼打击警报",
	wingbuffet_desc = "龙翼打击警报.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "暗影烈焰警报",
	shadowflame_desc = "暗影烈焰警报.",

	frenzy_cmd = "frenzy",
	frenzy_name = "狂暴警报",
	frenzy_desc = "狂暴警报.",
	
	-- triggers
	trigger_wingBuffet = "弗莱格尔开始施放龙翼打击。",
	trigger_shadowFlame = "弗莱格尔开始施放暗影烈焰。",
	trigger_frenzyGain1 = "%s获得了疯狂的效果。",
	trigger_frenzyGain2 = "%s goes into a frenzy!",
	trigger_frenzyGone = "效果从弗莱格尔身上消失。",
	
	-- messages
	msg_wingBuffet = "龙翼打击! 下次30秒后施放!",
	msg_wingBuffetSoon = "现在嘲讽! 马上龙翼打击!",
	msg_shadowFlame = "暗影烈焰来临!",
	msg_frenzy = "狂暴! 立刻宁神!",
	
	-- bars
	bar_frenzy = "狂暴",
    bar_frenzyNext = "下次狂暴",
	bar_wingBuffetCast = "龙翼打击",
	bar_wingBuffetNext = "下次龙翼打击",
	bar_wingBuffetFirst = "第一次龙翼打击",
	bar_shadowFlameCast = "暗影烈焰",
	bar_shadowFlameNext = "可能暗影烈焰",
	
	-- misc

} end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	wingbuffet_name = "Alarm f\195\188r Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Warnung, wenn Flamegor Fl\195\188gelsto\195\159 wirkt.",

	shadowflame_name = "Alarm f\195\188r Schattenflamme",
	shadowflame_desc = "Warnung, wenn Flamegor Schattenflamme wirkt.",

	frenzy_name = "Alarm f\195\188r Wutanfall",
	frenzy_desc = "Warnung, wenn Flamegor in Wutanfall ger\195\164t.",
	
	-- triggers
	trigger_wingBuffet = "Flamegor beginnt Fl\195\188gelsto\195\159 zu wirken.",
	trigger_shadowFlame = "Flamegor beginnt Schattenflamme zu wirken.",
	trigger_frenzyGain1 = "Flamegor bekommt \'Wutanfall\'.",
	trigger_frenzyGone = "Wutanfall schwindet von Flamegor.",
	
	-- messages
	msg_wingBuffet = "Fl\195\188gelsto\195\159! N\195\164chster in 30 Sekunden!",
	msg_wingBuffetSoon = "Jetzt TAUNT! Fl\195\188gelsto\195\159 bald!",
	msg_shadowFlame = "Schattenflamme bald!",
	msg_frenzy = "Wutanfall! Tranq jetzt!",
	
	-- bars
	bar_frenzy = "Wutanfall",
    bar_frenzyNext = "Nächster Wutanfall",
	bar_wingBuffetCast = "Fl\195\188gelsto\195\159",
	bar_wingBuffetNext = "N\195\164chster Fl\195\188gelsto\195\159",
	bar_wingBuffetFirst = "Erster Fl\195\188gelsto\195\159",
	bar_shadowFlameCast = "Schattenflamme",
	bar_shadowFlameNext = "Mögliche Schattenflamme",
	
	-- misc
	
} end)
