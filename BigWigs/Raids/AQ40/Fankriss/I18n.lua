------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq40.fankriss
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Fankriss",

	-- commands
	worm_cmd = "worm",
	worm_name = "虫子警报",
	worm_desc = "警报虫子来临",
	entangle_cmd = "entangle",
    entangle_name = "纠缠警报",
    entangle_desc = "警报纠缠和虫子来临",

	-- triggers
	trigger_entanglePlayer = "你受到了纠缠效果的影响。",
	trigger_entangleOther = "(.*)受到了纠缠效果的影响。",
	trigger_worm = "顽强的范克瑞斯施放了召唤虫子。",

	-- messages
	msg_entangle = "纠缠!",
	msg_worm = "虫子来临! (%d)",

	-- bars
	bar_wormEnrage = "沙虫激怒 (%d)",

	-- misc
}
end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	worm_name = "Wurm beschwören",
	worm_desc = "Warnung, wenn Fankriss einen Wurm beschwört.",
	entangle_name = "Umschlingen Warnung",
	entangle_desc = "Warnt vor Umschlingen und den Käfern",

	-- triggers
	trigger_worm = "Fankriss der Unnachgiebige wirkt Wurm beschwören.",
	trigger_entanglePlayer = "Ihr seid von Umschlingen betroffen.",
	trigger_entangleOther = "(.*) ist von Umschlingen betroffen.",

	-- messages
	msg_worm = "Wurm wurde beschworen! (%d)",
	msg_entangle = "Umschlingen!",

	-- bars
	bar_wormEnrage = "Wurm ist wütend (%d)",

	-- misc
}
end)
