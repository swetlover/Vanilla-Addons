------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq20.moam
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Moam",

	-- commands
	adds_cmd = "adds",
	adds_name = "召唤警报",
	adds_desc = "召唤元素恶魔出现时发出警报",

	paralyze_cmd = "paralyze",
	paralyze_name = "石化警报",
	paralyze_desc = "莫阿姆进入石化状态时发出警报",

	-- triggers
	trigger_adds = "drains your mana and turns to stone.",
	trigger_return1 = "Energize fades from Moam.",
    trigger_return2 = "bristles with energy",
	
	-- messages
	msg_engage = "莫阿姆已激活 - 90秒后召唤元素恶魔",
	msg_addsSoon = "元素恶魔将%s秒后被召唤！",
	msg_addsNow = "元素恶魔被召唤！术士放逐！莫阿姆石化90秒！",
	msg_returnSoon = "莫阿姆将在%s秒后解除石化！",
	msg_returnNow = "莫阿姆解除石化！90秒后重新召唤元素恶魔！",	
	
	-- bars
	bar_adds = "召唤",
	bar_paralyze = "石化",
	
	-- misc
	
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	adds_name = "Elementare",
	adds_desc = "Warnung, wenn Elementare erscheinen.",

	paralyze_name = "Steinform",
	paralyze_desc = "Warnung, wenn Moam in Steinform.",

	-- triggers
	trigger_adds = "entzieht Euch Euer Mana und versteinert Euch.",
	trigger_return1 = "Energiezufuhr schwindet von Moam.",
	
	-- messages
	msg_engage = "Moam angegriffen! Elementare in 90 Sekunden!",
	msg_addsSoon = "Elementare in %s Sekunden!",
	msg_addsNow = "Elementare! Moam in Steinform f\195\188r 90 Sekunden.",
	msg_returnSoon = "Moam erwacht in %s Sekunden!",
	msg_returnNow = "Moam erwacht! Elementare in 90 Sekunden!",
	
	-- bars
	bar_adds = "Elementare",
	bar_paralyze = "Steinform",
	
	-- misc	
	
} end )
