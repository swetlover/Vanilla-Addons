------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.other.emeriss
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Emeriss",

	-- commands
	noxious_cmd = "noxious",
	noxious_name = "毒性吐息提醒",
	noxious_desc = "毒性吐息提醒",

	volatileyou_cmd = "volatileyou",
	volatileyou_name = "你的快速传染提醒",
	volatileyou_desc = "警报对你的快速传染的提醒",

	volatileother_cmd = "volatileother",
	volatileother_name = "对其他人的快速传染提醒",
	volatileother_desc = "对其他人的快速传染提醒",

	-- triggers
	trigger_volatileInfection = "^([^%s]+)([^%s]+)了快速传染效果的影响",
	trigger_noxiousBreath = "受到了毒性吐息效果的影响",
	trigger_engage = "Hope is a DISEASE of the soul! This land shall wither and die!",
	trigger_corruption = "Taste your world's corruption!",

	-- messages
	msg_volatileInfectionYou = "你受到了快速传染效果的影响!",
	msg_volatileInfectionOther = "%s 受到了快速传染效果的影响!",
	msg_noxiousBreathSoon = "5秒毒性吐息!",
	msg_noxiousBreathNow = "毒性吐息! 18 秒后下次!",
	msg_engage = "艾莫莉丝遭遇! 8秒后毒性吐息!",
	msg_corruption = "快速传染! 块治疗!",

	-- bars
	bar_noxiousBreath = "毒性吐息",
	bar_corruption = "大地的堕落",
	
	-- misc
	misc_you = "你",
	misc_are = "受到",

} end )
