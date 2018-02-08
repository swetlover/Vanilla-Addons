------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.razuvious
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Razuvious",

	-- commands
	shout_cmd = "shout",
	shout_name = "瓦解怒吼警报",
	shout_desc = "瓦解怒吼的警报",

	unbalance_cmd = "unbalancing",
	unbalance_name = "重压打击警报",
	unbalance_desc = "重压打击的警报",

	shieldwall_cmd = "shieldwall",
	shieldwall_name = "盾墙计时",
	shieldwall_desc = "显示盾墙的计时",

	-- triggers
	trigger_engage1 = "Stand and fight!",
	trigger_engage2 = "Show me what you've got!",
	trigger_engage3 = "Hah hah, I'm just getting warmed up!",
	--trigger_engage4 = "Stand and fight!",
	trigger_shout = "瓦解怒吼",
    trigger_unbalance = "受到了重压打击效果的影响",
	trigger_shieldWall   = "死亡骑士实习者获得了盾墙的效果。",
	
	-- messages
	msg_engage = "教官拉苏维奥斯相遇! 20秒后瓦解, 30秒后重压打击!",
	msg_shout7 = "7 秒后瓦解怒吼",
	msg_shout3 = "3 秒后瓦解怒吼!",
	msg_shoutNow = "瓦解怒吼! 下一个 25 秒",
	msg_noShout = "没有怒吼! 下一个 20 秒",
	msg_unbalanceSoon = "重压打击马上来临!",
	msg_unbalanceNow = "重压打击! 下个大约 ~30 秒",
	
	-- bars
	bar_shout = "瓦解怒吼",
	bar_unbalance = "重压打击",
	bar_shieldWall       = "盾墙",
	
	-- misc
	
} end )
