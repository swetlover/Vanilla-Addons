------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.other.taerar
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Taerar",

	-- commands
	noxious_cmd = "noxious",
	noxious_name = "毒性吐息警报",
	noxious_desc = "毒性吐息的警报",

	fear_cmd = "fear",
	fear_name = "恐惧术",
	fear_desc = "低沉咆哮提醒",

	-- triggers
	trigger_fear = "泰拉尔开始施放低沉咆哮。",
	trigger_noxiousBreath = "afflicted by Noxious Breath",
	trigger_engage = "Peace is but a fleeting dream! Let the NIGHTMARE reign!",
	trigger_banish = "Children of Madness - I release you upon this world!",

	-- messages
	msg_banish = "泰拉尔放逐！杀阴影！",
	msg_fearNow = "恐惧 1.5秒!",
	msg_noxiousBreathSoon = "5 秒后毒性吐息!",
	msg_noxiousBreathNow = "毒性吐息! 18秒后下一个!",
	msg_engage = "泰拉尔相遇! 毒性吐息8秒后来临!",
	msg_fearSoon = "AoE 恐惧马上!",

	-- bars
	bar_noxiousBreath = "毒性吐息",
	bar_banish = "放逐",
	bar_fear = "AoE 恐惧",

	-- misc
	
} end )
