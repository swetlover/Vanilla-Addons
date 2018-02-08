------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq40.bugFamily
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "BugFamily",

	-- commands
	panic_cmd = "panic",
	panic_name = "恐慌",
	panic_desc = "亚尔基公主的恐惧.",

	toxicvolley_cmd = "toxicvolley",
	toxicvolley_name = "毒性箭雨",
	toxicvolley_desc = "克里勋爵的毒性箭雨.",

	heal_cmd = "heal",
	heal_name = "强效治疗术",
	heal_desc = "亚尔基公主的强效治疗术.",

	announce_cmd = "announce",
	announce_name = "毒云",
	announce_desc = "密语中毒云的玩家.\n\n(需要A或L)",

	deathspecials_cmd = "deathspecials",
	deathspecials_name = "boss特技",
	deathspecials_desc = "让人们知道哪个boss被杀了，他们有什么特别的能力.",

	enrage_cmd = "enrage",
	enrage_name = "狂怒",
	enrage_desc = "激怒计时.",

	-- triggers
	trigger_heal = "亚尔基公主开始施放强效治疗术。",
	trigger_attack1 = "亚尔基公主发起攻击",
	trigger_attack2 = "亚尔基公主没有击中",
	trigger_attack3 = "亚尔基公主击中",
	trigger_attack4 = "亚尔基公主的致命一击",
	trigger_toxicVolleyHit = "毒性箭雨击中",
	trigger_toxicVolleyAfflicted = "受到了毒性箭雨效果的影响。",
	trigger_toxicVolleyResist = "毒性箭雨被抵抗了",
	trigger_toxicVolleyImmune = "毒性箭雨施放失败。(.+)对此免疫。",
	trigger_panic = "受到了恐慌效果的影响。",
	trigger_panicResist = "亚尔基公主的恐慌效果抵抗了",
	trigger_panicImmune = "亚尔基公主的恐慌施放失败。(.+)对此免疫。",
	trigger_toxicVaporsYou = "你受到了毒性箭雨效果的影响。",
	trigger_toxicVaporsOther = "(.+)受到了毒性箭雨效果的影响。",
	trigger_enrage = "%s goes into a berserker rage!",

	-- messages
	msg_heal = "施放强效治疗术!",
	msg_panic = "恐惧 3 秒!",
	msg_toxicVolley = "毒性箭雨 3 秒!",
	msg_toxicVapors = "远离毒云!!",
	msg_enrage5m = "狂怒 5 分钟!",
	msg_enrage3m = "狂怒 3 分钟!",
	msg_enrage90 = "狂怒 90 秒!",
	msg_enrage90 = "狂怒 60 秒!",
	msg_enrage30 = "狂怒 30 秒!",
	msg_enrage10 = "狂怒 10 秒!",
	msg_kriDead = "克里勋爵死亡! 毒性箭雨刷新!",
	msg_yaujDead = "亚尔基公主死亡! 杀死小怪!",
	msg_vemDead = "维姆死亡!",
	msg_vemDeadKriEnrage = "维姆死亡! 克里勋爵狂怒!",
	msg_vemDeadYaujEnrage = "维姆死亡! 亚尔基公主狂怒!",
	msg_vemDeadBothEnrage = "维姆死亡! 克里勋爵和亚尔基公主狂怒!",
	msg_enrage = "狂怒!",

	-- bars
	bar_heal = "强效治疗术",
	bar_panic = "恐慌",
	bar_panicFirst = "可能恐慌",
	bar_toxicVolley = "毒性箭雨",
	bar_enrage = "狂怒",

	-- misc

} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	panic_cmd = "panic",
	panic_name = "Furcht",
	panic_desc = "Warnung f\195\188r Prinzessin Yaujs Furcht.",

	toxicvolley_cmd = "toxicvolley",
	toxicvolley_name = "Toxische Salve",
	toxicvolley_desc = "Warnung f\195\188r Lord Kris Toxische Salve.",

	heal_cmd = "heal",
	heal_name = "Gro\195\159e Heilung",
	heal_desc = "Verk\195\188ndet Prinzessin Yaujs Heilungen.",

	announce_cmd = "announce",
	announce_name = "Giftwolke",
	announce_desc = "Fl\195\188stert Spielern, dass sie in der Giftwolke stehen.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",

	deathspecials_cmd = "deathspecials",
	deathspecials_name = "Spezielle Todeseffekte",
	deathspecials_desc = "Informiert Spieler, welcher Boss bereits get\195\182tet wurde und welche Spezialf\195\164higkeiten sie haben.",

	enrage_cmd = "enrage",
	enrage_name = "Raserei",
	enrage_desc = "Zeit, bis der Boss in Raserei verf\195\164llt.",

	-- triggers
	trigger_heal = "Prinzessin Yauj beginnt Großes Heilen zu wirken.",
	trigger_attack1 = "Prinzessin Yauj greift an",
	trigger_attack2 = "Prinzessin Yauj verfehlt",
	trigger_attack3 = "Prinzessin Yauj trifft",
	trigger_attack4 = "Prinzessin Yauj trifft (.+) kritisch",
	trigger_toxicVolleyHit = "Toxische Salve trifft",
	trigger_toxicVolleyAfflicted = "von Toxische Salve betroffen",
	trigger_toxicVolleyResist = "Toxische Salve(.+) widerstanden",
	trigger_toxicVolleyImmune = "Toxische Salve(.+) Ein Fehlschlag(.+) immun",
	trigger_panic = "von Furcht betroffen",
	trigger_panicResist = "Furcht(.+) widerstanden",
	trigger_panicImmune = "Furcht(.+) immun",
	trigger_toxicVaporsYou = "Ihr seid von Toxische Dämpfe betroffen.",
	trigger_toxicVaporsOther = "(.+) ist von Toxische Dämpfe betroffen.",
	trigger_enrage = "%s goes into a berserker rage!",

	-- messages
	msg_heal = "Wirkt Heilung!",
	msg_panic = "Furcht in 3 Sekunden!",
	msg_toxicVolley = "Toxische Salve in 3 Sekunden!",
	msg_toxicVapors = "Beweg dich aus der Giftwolke raus!",
	msg_enrage5m = "Raserei in 5 Minuten!",
	msg_enrage3m = "Raserei in 3 Minuten!",
	msg_enrage90 = "Raserei in 90 Sekunden!",
	msg_enrage90 = "Raserei in 60 Sekunden!",
	msg_enrage30 = "Raserei in 30 Sekunden!",
	msg_enrage10 = "Raserei in 10 Sekunden!",
	msg_kriDead = "Lord Kri ist tot! Giftwolke hat sich gebildet!",
	msg_yaujDead = "Prinzessin Yauj ist tot! T\195\182te die kleinen K\195\164fer!",
	msg_vemDead = "Vem ist tot!",
	msg_vemDeadKriEnrage = "Vem ist tot! Lord Kri verf\195\164llt in Raserei!",
	msg_vemDeadYaujEnrage = "Vem ist tot! Prinzessin Yauj verf\195\164llt in Raserei!",
	msg_vemDeadBothEnrage = "Vem ist tot! Lord Kri & Prinzessin Yauj verfallen in Raserei!",
	msg_enrage = "Raserei!",

	-- bars
	bar_heal = "Gro\195\159e Heilung",
	bar_panic = "Furcht",
	bar_panicFirst = "Mögliche Furcht",
	bar_toxicVolley = "Toxische Salve",
	bar_enrage = "Raserei",

	-- misc

} end )

