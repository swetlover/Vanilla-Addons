------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.anubrekhan
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Anubrekhan",

	-- commands
	locust_cmd = "locust",
	locust_name = "虫群警报",
	locust_desc = "虫群风暴的警报",

	enrage_cmd = "enrage",
	enrage_name = "地穴卫士狂怒警报",
	enrage_desc = "激怒警报",
		
	-- triggers
	trigger_engage1 = "Just a little taste...",
	trigger_engage2 = "Yes, run! It makes the blood pump faster!",
	trigger_engage3 = "There is no way out.",
	
	trigger_enrage = "获得了狂怒的效果。",
	trigger_locustSwarm = "阿努布雷坎获得了虫群风暴的效果。",
	trigger_locustSwarmCast = "阿努布雷坎开始施放虫群风暴。",
	
	-- messages
	msg_enrage = "地穴卫士狂怒 - 眩晕 + 宁神!",
	msg_locustSwarmGone = "虫群风暴结束!",
	msg_locustSwarmNext = "下一个虫群风暴在大约 90 秒",
	msg_locustSwarmSoon = "大约 10秒后虫群风暴",
	msg_locustSwarmNow = "虫群风暴来临!",
	
	-- bars
	bar_locustSwarmNext = "可能虫群风暴",
	bar_locustSwarmDuration = "虫群风暴",
	bar_locustSwarmCast = "虫群风暴来临!",
	
	-- misc

} end )