------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq40.viscidus
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("enUS", function() return {
	cmd = "Viscidus",

	-- commangs
	volley_cmd = "volley",
	volley_name = "毒性之箭警报",
	volley_desc = "毒性之箭警报",
	toxinyou_cmd = "toxinyou",
	toxinyou_name = "玩家毒云警报",
	toxinyou_desc = "你站在毒云中时发出警报",
	toxinother_cmd = "toxinother",
	toxinother_name = "队友毒云警报",
	toxinother_desc = "队友站在毒云中时发出警报",
	freeze_cmd = "freeze",
	freeze_name = "冻结状态警报",
	freeze_desc = "警告不同的冻结状态",

	-- triggers
	trigger_slow = "Viscidus begins to slow.",
	trigger_freeze = "Viscidus is freezing up.",
	trigger_frozen = "Viscidus is frozen solid.",
	trigger_crack = "Viscidus begins to crack.",
	trigger_shatter = "Viscidus looks ready to shatter.",
	trigger_volley = "受到了毒箭之雨效果",
	trigger_toxin = "^([^%s]+)([^%s]+)剧毒效果的影响。",

	-- messages
	msg_freeze1 = "冻结第一阶段！",
	msg_freeze2 = "冻结第二阶段 - 做好准备",
	msg_frozen = "冻结第三阶段 - DPS全开！",
	msg_crack1 = "即将碎裂 - 加大火力！",
	msg_crack2 = "即将碎裂 - 几近成功！",
	msg_volley = "可能毒性之箭!",
	msg_volleySoon = "可能毒性之箭 ~3 秒!",
	msg_toxin = "%s 在毒云里!",
	msg_toxinSelf = "你在毒云里!",

	-- bars
	bar_volley = "可能毒箭之雨",

	-- misc
	misc_you = "你",
	misc_are = "受到了",
}
end)

L:RegisterTranslations("deDE", function() return {
	volley_name = "Giftblitzsalve Alarm", -- ?
	volley_desc = "Warnt vor Giftblitzsalve", -- ?

	toxinyou_name = "Toxin Wolke",
	toxinyou_desc = "Warnung, wenn Du in einer Toxin Wolke stehst.",
	toxinother_name = "Toxin Wolke auf Anderen",
	toxinother_desc = "Warnung, wenn andere Spieler in einer Toxin Wolke stehen.",
	freeze_name = "Freeze Phasen",
	freeze_desc = "Zeigt die verschiedenen Freeze Phasen an.",
	trigger_slow = "wird langsamer!",
	trigger_freeze = "friert ein!",
	trigger_frozen = "ist tiefgefroren!",
	trigger_crack = "geht die Puste aus!", --CHECK
	trigger_shatter = "ist kurz davor, zu zerspringen!",
	trigger_volley = "ist von Giftblitzsalve betroffen.",
	trigger_toxin = "^([^%s]+) ([^%s]+) von Toxin betroffen.$",
	misc_you = "Ihr",
	misc_are = "seid",
	msg_freeze1 = "Erste Freeze Phase!",
	msg_freeze2 = "Zweite Freeze Phase!",
	msg_frozen = "Dritte Freeze Phase!",
	msg_crack1 = "Zerspringen - etwas noch!",
	msg_crack2 = "Zerspringen - fast da!",
	msg_volley = "Giftblitzsalve!", -- ?
	msg_volleySoon = "Giftblitzsalve in ~3 Sekunden!", -- ?
	msg_toxin = "%s ist in einer Toxin Wolke!",
	msg_toxinSelf = "Du bist in einer Toxin Wolke!",
	bar_volley = "Mögliche Giftblitzsalve",
}
end)
