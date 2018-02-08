------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.other.azuregos
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Azuregos",

	-- commands
	teleport_cmd = "teleport",
	teleport_name = "传送警报",
	teleport_desc = "提醒，传送",

	shield_cmd = "shield",
	shield_name = "盾警报",
	shield_desc = "提醒盾",

	-- triggers
	trigger_teleport = "Come, little ones",
	shieldDown_trigger = "^反射效果从艾索雷葛斯身上消失",
	shieldUp_trigger = "^艾索雷葛斯获得了反射的效果",

	-- messages
	msg_teleport = "传送!",
	msg_shieldGain = "魔法护盾消失!",
	msg_shieldGone = "魔法护盾开启 - 不要施放法术！",
	msg_teleport10 = "传送 10 秒",
	msg_teleport5 = "传送 5 秒",

	-- bars
	bar_shield = "魔法护盾",
	bar_teleport = "传送",
	
	-- misc
	
} end )
