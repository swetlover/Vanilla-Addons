------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq20.buru
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Buru",
	
	-- commands
	you_cmd = "you",
	you_name = "凝视警报",
	you_desc = "当你被凝视时发出警报",

	other_cmd = "other",
	other_name = "队友凝视警报",
	other_desc = "当队友被凝视时发出警报",

	icon_cmd = "icon",
	icon_name = "头像图标",
	icon_desc = "图标放在被监视头上 (需要L或A)",

	-- triggers
	trigger_watch = "sets eyes on (.+)!",
	
	-- messages
	msg_watchOther = "%s 被布鲁盯上了！",
	msg_watchYou = "你被布鲁盯上了！",
	
	-- bars
	
	-- misc
	misc_you = "你",
	
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	you_name = "Du wirst beobachtet",
	you_desc = "Warnung, wenn Du beobachtet wirst.",

	other_name = "X wird beobachtet",
	other_desc = "Warnung, wenn andere Spieler beobachtet werden.",

	icon_name = "Symbol",
	icon_desc = "Platziert ein Symbol \195\188ber dem Spieler, der beobachtet wird. (Ben\195\182tigt Anf\195\188hrer oder Bef\195\182rdert Status.)",

	-- triggers
	trigger_watch = "beh\195\164lt (.+) im Blickfeld!",
	
	-- messages
	msg_watchOther = " wird beobachtet!",
	msg_watchYou = "Du wirst beobachtet!",
	
	-- bars
	
	-- misc
	misc_you = "Euch",
	
} end )
