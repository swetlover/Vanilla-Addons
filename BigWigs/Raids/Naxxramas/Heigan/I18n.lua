------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.heigan
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Heigan",

	-- commands
	teleport_cmd = "teleport",
	teleport_name = "传送警报",
	teleport_desc = "传送的警报.",

	engage_cmd = "engage",
	engage_name = "开怪警报",
	engage_desc = "当与肮脏者海根开始战斗时警报.",

	disease_cmd = "disease",
	disease_name = "衰弱瘟疫警报",
	disease_desc = "衰弱瘟疫的警报",

    erruption_cmd = "erruption",
	erruption_name = "瘟疫爆发警报",
	erruption_desc = "瘟疫爆发的警报",
          
	-- triggers
	trigger_engage1 = "You are mine now!",
	trigger_engage2 = "You...are next!",
	trigger_engage3 = "I see you!",
	trigger_toPlatform = "teleports and begins to channel a spell!",
    trigger_toFloor = "rushes to attack once more!",
	trigger_bossDeath = "takes his last breath.",
	trigger_decrepitFever = "受到了衰弱瘟疫效果的影响。",

	-- messages
	msg_decrepitFever = "衰弱瘟疫",

	msg_onPlatform = "传送! 跳舞 %d 秒!",

	msg_onFloor = "回到地面! 90秒后下一次传送!",

	-- bars
	bar_toPlatform = "传送!",
	bar_toFloor = "回到地面!",
	bar_decrepitFever = "衰弱瘟疫",
    bar_erruption = "瘟疫爆发",
    bar_dancingShoes = "穿上你的舞鞋!你在跳舞~",

	-- misc
	["Eye Stalk"] = "眼柄",
	["Rotting Maggot"] = "腐烂的蛆虫",
	
} end )