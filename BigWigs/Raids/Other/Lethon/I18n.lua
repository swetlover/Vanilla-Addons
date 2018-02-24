------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.other.lethon
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Lethon",

	-- commands
	noxious_cmd = "noxious",
	noxious_name = "毒性吐息警报",
	noxious_desc = "毒性吐息的警报",
	-- triggers
	trigger_engage = "I can sense the SHADOW on your hearts. There can be no rest for the wicked!",
	trigger_noxiousBreath = "受到了毒性吐息效果",
	trigger_shadows = "Your wicked souls shall feed my power!",
	
	-- messages
	msg_shadows = "阴影刷新!",
	msg_engage = "莱索恩相遇! 8 秒后毒性吐息!",
	msg_noxiousBreathSoon = "5 秒后毒性吐息!",
	msg_noxiousBreathNow = "毒性吐息! 18 秒后下一次!",

	-- bars
	bar_noxiousBreath = "毒性吐息",
	
	-- misc
	
} end )
