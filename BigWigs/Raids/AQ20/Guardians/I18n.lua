------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq20.guardians
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Guardian",

	-- commands
	summon_cmd = "summon",
	summon_name = "召唤警报",
	summon_desc = "召唤警报",

	plagueyou_cmd = "plagueyou",
	plagueyou_name = "你被瘟疫警报",
	plagueyou_desc = "瘟疫警报",

	plagueother_cmd = "plagueother",
	plagueother_name = "其他人被瘟疫警报",
	plagueother_desc = "其他人被瘟疫警报",

	icon_cmd = "icon",
	icon_name = "头像图标",
	icon_desc = "头像图标放在瘟疫的人头上 (需要L或者A)",

	explode_cmd = "explode",
	explode_name = "爆炸警报",
	explode_desc = "爆炸警报",

	enrage_cmd = "enrage",
	enrage_name = "狂怒警报",
	enrage_desc = "狂怒警报",

	-- trigger
	trigger_explode = "阿努比萨斯守卫者获得了爆炸的效果。",
	trigger_enrage = "阿努比萨斯守卫者获得了狂怒的效果。",
	trigger_summonGuardian = "阿努比萨斯守卫者施放了召唤阿努比萨斯虫群卫士。",
	trigger_summonWarrior = "阿努比萨斯守卫者施放了召唤阿努比萨斯战士。",
	trigger_plague = "^([^%s]+)([^%s]+)瘟疫效果的影响。",
	
	-- messages
	msg_explode = "即将爆炸！近战躲开！",
	msg_enrage = "进入狂怒状态！",
	msg_summonGuard = "虫群卫士已被召唤出来",
	msg_summonWarrior = "阿努比萨斯战士已被召唤出来",
	msg_plagueOther = " 受到瘟疫的影响！快躲开！",
	msg_plagueYou = "你受到瘟疫的影响！快跑开!",
	
	-- bars
	
	-- misc
	misc_you = "你",
	misc_are = "受到了",
	
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	summon_name = "Beschwörung",
	summon_desc = "Warnung, wenn Beschützer des Anubisath Schwarmwachen oder Krieger beschwört.",

	plagueyou_name = "Du hast die Seuche",
	plagueyou_desc = "Warnung, wenn Du die Seuche hast.",

	plagueother_name = "X hat die Seuche",
	plagueother_desc = "Warnung, wenn andere Spieler die Seuche haben.",

	icon_name = "Symbol",
	icon_desc = "Platziert ein Symbol über dem Spieler, der die Seuche hat. (Benötigt Anführer oder Befördert Status.)",

	explode_name = "Explosion",
	explode_desc = "Warnung vor Explosion.",

	enrage_name = "Wutanfall",
	enrage_desc = "Warnung vor Wutanfall.",

	-- triggers
	trigger_explode = "Beschützer des Anubisath bekommt 'Explodieren'.",
	trigger_enrage = "Beschützer des Anubisath bekommt 'Wutanfall'.",
	trigger_summonGuardian = "Beschützer des Anubisath wirkt Schwarmwache des Anubisath beschwören.",
	trigger_summonWarrior = "Beschützer des Anubisath wirkt Krieger des Anubisath beschwören.",
	trigger_plague = "^([^%s]+) ([^%s]+) von Seuche betroffen%.$",
	
	-- messages
	msg_explode = "Explosion!",
	msg_enrage = "Wutanfall!",
	msg_summonGuard = "Schwarmwache beschworen!",
	msg_summonWarrior = "Krieger beschworen!",
	msg_plagueOther = " hat die Seuche!",
	msg_plagueYou = "Du hast die Seuche!",
	
	-- bars
	
	-- misc
	misc_you = "Ihr",
	misc_are = "seid",
	
} end )
