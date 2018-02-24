------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.other.ysondre
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Ysondre",

	-- commands
	noxious_cmd = "noxious",
	noxious_name = "毒性吐息警报",
	noxious_desc = "毒性吐息的警报",

	-- triggers
	trigger_engage = "The strands of LIFE have been severed! The Dreamers must be avenged!",
	trigger_noxiousBreath = "受到了毒性吐息效果",
	trigger_druids = "Come forth, ye Dreamers - and claim your vengeance!",

	-- messages
	msg_druids = "德鲁伊刷新!",
	msg_engage = "伊索德雷相遇! 8秒后毒性吐息!",
	msg_noxiousBreathSoon = "5秒后毒性吐息!",
	msg_noxiousBreathNow = "毒性吐息! 18秒后下一个!",

	-- bars
	bar_noxiousBreath = "毒性吐息",
	
	-- misc
	
} end )