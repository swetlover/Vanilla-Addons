------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.hazzarah
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Hazzarah",
	
	-- commands
	nightmaresummon_cmd = "spawns",
	nightmaresummon_name = "刷新警报",
	nightmaresummon_desc = "显示警告当boss召唤梦魇幻象",
	
	-- triggers
	trigger_nightmareSummon = "哈札拉尔施放了召唤梦魇幻象。",
	
	-- messages
	msg_nightmareSummon = "杀死小怪!",
	
	-- bars
	
	-- misc	
	
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Hazzarah",

	-- commands
	nightmaresummon_name = "Alarm für die Adds",
	nightmaresummon_desc = "Zeigt eine Warnung wenn der Boss Alptraumillusionen beschwört.",
	
	-- triggers
	trigger_nightmareSummon = "Hazza\'rah wirkt Alptraumillusionen beschwören\.",
	
	-- messages
	msg_nightmareSummon = "Tötet die Adds!",
	
	-- bars
	
	-- misc	
	
} end )