------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.mc.garr
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Garr",
	
	-- commands	
	adds_cmd = "adds",
	adds_name = "小怪死亡",
	adds_desc = "通告火誓者死亡",
	
	-- triggers
	trigger_addDead8 = "加尔获得了激怒(.+)8",
	trigger_addDead7 = "加尔获得了激怒(.+)7",
	trigger_addDead6 = "加尔获得了激怒(.+)6",
	trigger_addDead5 = "加尔获得了激怒(.+)5",
	trigger_addDead4 = "加尔获得了激怒(.+)4",
	trigger_addDead3 = "加尔获得了激怒(.+)3",
	trigger_addDead2 = "加尔获得了激怒(.+)2",
	trigger_addDead1 = "加尔获得了激怒的效果。",
	
	-- messages
	msg_add1 = "1/8 火誓者死亡!",
	msg_add2 = "2/8 火誓者死亡!",
	msg_add3 = "3/8 火誓者死亡!",
	msg_add4 = "4/8 火誓者死亡!",
	msg_add5 = "5/8 火誓者死亡!",
	msg_add6 = "6/8 火誓者死亡!",
	msg_add7 = "7/8 火誓者死亡!",
	msg_add8 = "8/8 火誓者死亡!",
	
	-- bars
    bar_adds = "火誓者死亡",
	
	-- misc
	misc_fireswornName = "火誓者",

} end)

L:RegisterTranslations("deDE", function() return {
	-- commands	
	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Feueranbeter Tod",
	
	-- triggers
	trigger_addDead1 = "Garr bekommt \'Wutanfall\'.",
	trigger_addDead2 = "Garr bekommt \'Wutanfall(.+)2",
	trigger_addDead3 = "Garr bekommt \'Wutanfall(.+)3",
	trigger_addDead4 = "Garr bekommt \'Wutanfall(.+)4",
	trigger_addDead5 = "Garr bekommt \'Wutanfall(.+)5",
	trigger_addDead6 = "Garr bekommt \'Wutanfall(.+)6",
	trigger_addDead7 = "Garr bekommt \'Wutanfall(.+)7",
	trigger_addDead8 = "Garr bekommt \'Wutanfall(.+)8",
	
	-- messages
	msg_add1 = "1/8 Feueranbeter tot!",
	msg_add2 = "2/8 Feueranbeter tot!",
	msg_add3 = "3/8 Feueranbeter tot!",
	msg_add4 = "4/8 Feueranbeter tot!",
	msg_add5 = "5/8 Feueranbeter tot!",
	msg_add6 = "6/8 Feueranbeter tot!",
	msg_add7 = "7/8 Feueranbeter tot!",
	msg_add8 = "8/8 Feueranbeter tot!",
	
	-- bars
    bar_adds = "Feueranbeter tot",
	
	-- misc
	misc_fireswornName = "Feueranbeter",

} end)
