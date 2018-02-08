------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.horsemen
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Horsemen",

	-- commands
	mark_cmd = "mark",
	mark_name = "印记警报",
	mark_desc = "印记的警报",

	shieldwall_cmd  = "shieldwall",
	shieldwall_name = "盾墙警报",
	shieldwall_desc = "盾墙的警报",

	void_cmd = "void",
	void_name = "虚空领域警报",
	void_desc = "当女公爵布劳缪克丝施放虚空领域时警报.",

	meteor_cmd = "meteor",
	meteor_name = "流星警报",
	meteor_desc = "当库尔塔兹领主施放流星时警报.",

	wrath_cmd = "wrath",
	wrath_name = "神圣之怒警报",
	wrath_desc = "当瑟里耶克爵士施放神圣之怒时警报.",

	-- triggers
	trigger_mark = "受到了(.*)印记效果的影响",
	trigger_void = "女公爵布洛莫斯施放了虚空地区。",
	trigger_meteor = "库尔塔兹领主的流星击中",
	trigger_wrath = "札里克爵士的神圣之怒击中",
	trigger_shieldWall = "(.*)获得了盾墙的效果。",
	
	-- messages
	msg_markNow = "标记 %d!",
	msg_markSoon = "标记 %d 5秒",
	msg_voidZone = "虚空地区来临",
	msg_meteor = "流星!",
	msg_wrath = "神圣之怒!",
	msg_engage = "4DK相遇! 标记大约 ~17 秒",
	msg_shieldWallGain = "%s - 盾墙 20 秒",
	msg_shieldWallGone = "%s - 盾墙结束!",
	
	-- bars
	bar_mark = "标记 %d",
	bar_void = "虚空地区",
	bar_meteor = "流星",
	bar_wrath = "神圣之怒",
	bar_shieldWall = "%s - 盾墙",
	
	-- misc

} end )
