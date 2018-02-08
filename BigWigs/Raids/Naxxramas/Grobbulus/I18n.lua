------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.grobbulus
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Grobbulus",

	-- commands
	enrage_cmd = "enrage",
	enrage_name = "激怒警报",
	enrage_desc = "激怒的警报",

	youinjected_cmd = "youinjected",
	youinjected_name = "玩家变异注射警报",
	youinjected_desc = "警报当你中变异注射时",

	otherinjected_cmd = "otherinjected",
	otherinjected_name = "队友是变异注射警报",
	otherinjected_desc = "警报当队友中变异注射时",

	icon_cmd = "icon",
	icon_name = "放置团队标志",
	icon_desc = "中变异注射的人标记骷髅图标. (需要权限)",

	cloud_cmd = "cloud",
	cloud_name = "毒性云雾",
	cloud_desc = "毒性云雾警报",

	-- triggers
	trigger_inject = "^([^%s]+)([^%s]+)变异注射效果的影响",
	trigger_cloud = "葛罗巴斯施放了毒性云雾。",
	
	-- messages
	msg_engage = "葛罗巴斯相遇, 12分钟后激怒!",
	msg_enrage10m = "激怒 10分钟",
	msg_enrage5m = "激怒 5分钟",
	msg_enrage1m = "激怒 1分钟",
	msg_enrage30 = "激怒 30秒",
	msg_enrage10 = "激怒 10秒",
	msg_bombYou = "你受到了注射!",
	msg_bombOther = "%s 被注射了!",
	msg_cloud = "下个毒性云雾可能 ~15 秒!",
	
	-- bars
	bar_enrage = "激怒",
	bar_bomb = "%s 注射",
	bar_cloud = "毒性云雾",
	
	-- misc
	misc_you = "你",
	misc_are = "受到了",

} end )
