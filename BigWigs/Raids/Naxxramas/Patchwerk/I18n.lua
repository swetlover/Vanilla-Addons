------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.patchwerk
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Patchwerk",

	-- commands
	enrage_cmd = "enrage",
	enrage_name = "激怒警报",
	enrage_desc = "激怒的警报",

	-- triggers
	trigger_enrage = "%s goes into a berserker rage!",
	trigger_engage1 = "Patchwerk want to play!",
	trigger_engage2 = "Kel'Thuzad make Patchwerk his Avatar of War!",

	-- messages
	msg_enrage = "狂暴！",
	msg_engage = "帕奇维克来陪你玩儿! 7分钟后狂暴!",
	msg_enrage5m = "狂暴 5 分钟",
	msg_enrage3m = "狂暴 3 分钟",
	msg_enrage90 = "狂暴 90 秒",
	msg_enrage60 = "狂暴 60 秒",
	msg_enrage30 = "狂暴 30 秒",
	msg_enrage10 = "狂暴 10 秒",
	
	-- bars
	bar_enrage = "狂暴",
	
	-- misc
	
} end )
