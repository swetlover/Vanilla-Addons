------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.mc.golemagg
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Golemagg",
	
	-- commands	
	enraged_cmd = "enraged",
	enraged_name = "通告Boss狂怒",
	enraged_desc = "让你知道boss狂怒了",
	
	earthquake_cmd = "earthquake",
	earthquake_name = "地震通告",
	earthquake_desc = "宣布近战后退时间",
	
	-- triggers
	trigger_enrage = "焚化者古雷曼格获得了狂怒",
	
	-- messages
	msg_earthquakeSoon = "马上地震!",
	msg_enrage = "Boss狂怒!",
	
	-- bars
	
	-- misc
	misc_addName = "熔火怒犬",
	
} end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	enraged_name = "Verkündet Boss' Raserei",
	enraged_desc = "Lässt dich wissen, wenn Boss härter zuschlägt",
	
	earthquake_name = "Verkündet erdbeben",
	earthquake_desc = "Sagt an, wenn es für die Melees zeit ist, weg zu gehen",
	
	-- triggers
	trigger_enrage = "Golemagg der Verbrenner bekommt \'Wutanfall",
	
	-- messages
	msg_earthquakeSoon = "Erdbeben bald",
	msg_enrage = "Boss ist in Raserei!",
	
	-- bars
	
	-- misc
	misc_addName = "Kernwüterich",

} end)
