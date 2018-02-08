------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.maexxna
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Maexxna",

	-- commands
	spray_cmd = "spray",
	spray_name = "蛛网喷射警报",
	spray_desc = "蛛网喷射的警报和蜘蛛",

	enrage_cmd = "enrage",
	enrage_name = "激怒警报",
	enrage_desc = "激怒的警报",

	cocoon_cmd = "cocoon",
	cocoon_name = "蛛网裹体警报",
	cocoon_desc = "当玩家蛛网裹体时警报",

	poison_cmd = "Poison",
	poison_name = "死灵之毒警报",
	poison_desc = "死灵之毒的警报",

	-- triggers
	trigger_cocoon = "(.*)(.*)蛛网裹体效果的影响。",
	trigger_webSpray = "受到了蛛网喷射效果的影响",
	trigger_poison = "受到了死灵之毒效果的影响。",
	trigger_enrage = "获得了激怒的效果",
	
	-- messages
	msg_cocoon = "%s 蛛网裹体!",
	msg_poison = "死灵之毒!",

	msg_webSpray = "蛛网喷射! 40 秒后下一个!",

	msg_enrage = "激怒 - 挤压挤压挤压!",
	msg_enrageSoon = "马上激怒!!",
	
	-- bars
	bar_webSpray = "蛛网喷射",
	bar_cocoon = "墙茧",
	bar_spider = "小蜘蛛出现",
	bar_poison = "死灵之毒",
	
	-- misc
	misc_you = "你",
	misc_are = "受到了",
	
} end )
