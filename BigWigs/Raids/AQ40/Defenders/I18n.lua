------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq40.defenders
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Defender",

	-- commands
	plagueyou_cmd = "plagueyou",
	plagueyou_name = "玩家瘟疫警报",
	plagueyou_desc = "你中了瘟疫时发出警报",
	plagueother_cmd = "plagueother",
	plagueother_name = "队友瘟疫警报",
	plagueother_desc = "队友中了瘟疫时发出警报",
	thunderclap_cmd = "thunderclap",
	thunderclap_name = "雷霆一击警报",
	thunderclap_desc = "阿努比萨斯防御者发动雷霆一击时发出警报",
	explode_cmd = "explode",
	explode_name = "爆炸警报",
	explode_desc = "阿努比萨斯防御者即将爆炸时发出警报",
	enrage_cmd = "enrage",
	enrage_name = "狂怒警报",
	enrage_desc = "阿努比萨斯防御者进入狂怒状态时发出警报",
	summon_cmd = "summon",
	summon_name = "召唤警报",
	summon_desc = "阿努比萨斯防御者召唤增援时发出警报",
	icon_cmd = "icon",
	icon_name = "头像图标",
	icon_desc = "设置团队标记，标记中瘟疫的玩家 (需要助理或更高权限)",

	-- triggers
	trigger_explode = "阿努比萨斯防御者获得了爆炸的效果。",
	trigger_enrage = "阿努比萨斯防御者获得了狂怒的效果。",
	trigger_summonGuard = "阿努比萨斯防御者施放了召唤阿努比萨斯虫群卫士。",
	trigger_summonWarrior = "阿努比萨斯防御者施放了召唤阿努比萨斯战士。",
	trigger_plauge = "^([^%s]+)([^%s]+)瘟疫效果的影响。",
	trigger_thunderclap = "^阿努比萨斯防御者的雷霆一击击中([^%s]+)造成%d+",

	-- messages
	msg_explode = "即将爆炸！近战躲开！",
	msg_enrage = "进入狂怒状态！",
	msg_summonGuard = "虫群卫士已被召唤出来",
	msg_summonWarrior = "阿努比萨斯战士已被召唤出来",
	msg_plague = "%s 受到瘟疫的影响！快躲开！",
	msg_plagueYou = "你受到瘟疫的影响！快跑开！",
	msg_thunderclap = "雷霆一击!",

	-- bars

	-- misc
	misc_you = "你",
	misc_are = "受到了",
}
end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	plagueyou_name = "Du hast die Seuche",
	plagueyou_desc = "Warnung, wenn Du die Seuche hast.",
	plagueother_name = "X hat die Seuche",
	plagueother_desc = "Warnung, wenn andere Spieler die Seuche haben.",
	thunderclap_name = "Donnerknall",
	thunderclap_desc = "Warnung vor Donnerknall.",
	explode_name = "Explosion",
	explode_desc = "Warnung vor Explosion.",
	enrage_name = "Wutanfall",
	enrage_desc = "Warnung vor Wutanfall.",
	summon_name = "Beschw\195\182rung",
	summon_desc = "Warnung, wenn Verteidiger des Anubisath Schwarmwachen oder Krieger beschw\195\182rt.",
	icon_name = "Symbol",
	icon_desc = "Platziert ein Symbol \195\188ber dem Spieler, der die Seuche hat. (Ben\195\182tigt Anf\195\188hrer oder Bef\195\182rdert Status.)",

	-- triggers
	trigger_explode = "Verteidiger des Anubisath bekommt 'Explodieren'.",
	trigger_enrage = "Verteidiger des Anubisath bekommt 'Wutanfall'.",
	trigger_summonGuard = "Verteidiger des Anubisath wirkt Schwarmwache des Anubisath beschw\195\182ren.",
	trigger_summonWarrior = "Verteidiger des Anubisath wirkt Krieger des Anubisath beschw\195\182ren.",
	trigger_plauge = "^([^%s]+) ([^%s]+) von Seuche betroffen%.$",
	trigger_thunderclap = "^Verteidiger des Anubisath's Donnerknall trifft ([^%s]+) f\195\188r %d+%.",

	-- messages
	msg_explode = "Explosion!",
	msg_enrage = "Wutanfall!",
	msg_summonGuard = "Schwarmwache beschworen!",
	msg_summonWarrior = "Krieger beschworen!",
	msg_plague = "%s hat die Seuche!",
	msg_plagueYou = "Du hast die Seuche!",
	msg_thunderclap = "Donnerknall!",

	-- bars

	-- misc
	misc_you = "Ihr",
	misc_are = "seid",
}
end)
