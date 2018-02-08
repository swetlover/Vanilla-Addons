------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.mc.lucifron
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Lucifron",
	
	-- commands
	adds_cmd = "adds",
	adds_name = "小怪死亡",
	adds_desc = "宣布烈焰行者死亡",
	
	mc_cmd = "mc",
	mc_name = "统御意志",
	mc_desc = "当某人受到精神控制时发出警报.",
	
	curse_cmd = "curse",
	curse_name = "鲁西弗隆的诅咒警报",
	curse_desc = "鲁西弗隆的诅咒警报",
	
	doom_cmd = "doom",
	doom_name = "末日降临的警报",
	doom_desc = "末日降临的警报",
	
	-- triggers
	trigger_curseHit = "受到了鲁西弗隆的诅咒",
	trigger_doomHit = "受到了末日降临",
	trigger_curseResist = "鲁西弗隆的鲁西弗隆的诅咒被(.*)抵抗了。",
	trigger_doomResist = "鲁西弗隆的末日降临被(.*)抵抗了。",
	trigger_mindControlYou = "你受到了统御意志效果的影响。",
	trigger_mindControlOther = "(.*)受到了统御意志效果的影响。",
	trigger_mindControlYouGone = "统御意志效果从你身上消失了。",
	trigger_mindControlOtherGone = "统御意志效果从(.*)身上消失。",
	trigger_deathYou = "你死了。",
	trigger_deathOther = "(.*)死亡了。",
	trigger_deathAdd = "烈焰行者死亡",
	
	-- messages
	msg_curseSoon = "5秒后施放鲁西弗隆的诅咒!",
	--msg_curseNow = "Lucifron's Curse - 20 seconds until next!",
	msg_doomSoon = "5秒后施放末日降临!",
	--msg_doomNow = "Impending Doom - 15 seconds until next!",
	msg_mindControlOther = "%s 被控制了!",
	msg_mindControlYou = "你被控制!",
	msg_add = "%d/2 烈焰行者死亡!",
	
	-- bars
	bar_mindControl = "精神控制: %s",
	bar_curse = "鲁西弗隆的诅咒",
	bar_doom = "末日降临",
	
	-- misc
	misc_addName = "烈焰行者",
	
} end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Feuerschuppenbeschützer Tod",
	
	mc_name = "Gedankenkontrolle",
	mc_desc = "Warnen, wenn jemand übernommen ist",
	
	curse_name = "Alarm für Lucifrons Fluch",
	curse_desc = "Warnen vor Lucifrons Fluch",
	
	doom_name = "Alarm für Drohende Verdammnis",
	doom_desc = "Warnen vor Drohender Verdammnis",
	
	-- triggers
	trigger_curseHit = "von Lucifrons Fluch betroffen",
	trigger_doomHit = "von Drohende Verdammnis betroffen",
	trigger_curseResist = "Lucifrons Fluch wurde von(.+) widerstanden",
	trigger_doomResist = "Drohende Verdammnis wurde von(.+) widerstanden",
	trigger_mindControlYou = "Ihr seid von Gedanken beherrschen betroffen.",
	trigger_mindControlOther = "(.*) ist von Gedanken beherrschen betroffen.",
	trigger_mindControlYouGone = "Gedanken beherrschen\' schwindet von Euch.",
	trigger_mindControlOtherGone = "Gedanken beherrschen schwindet von (.*).",
	trigger_deathYou = "Ihr sterbt.",
	trigger_deathOther = "(.*) stirbt.",
	trigger_deathAdd = "Feuerschuppenbeschützer stirbt", --"Besch\195\188tzer der Flammensch\195\188rer stirbt.",
	
	-- messages
	msg_curseSoon = "5 Sekunden bis Lucifrons Fluch!",
	--msg_curseNow = "Lucifrons Fluch - 20 Sekunden bis zum nächsten!",
	msg_doomSoon = "5 Sekunden bis Drohende Verdammnis!",
	--msg_doomNow = "Drohende Verdammnis - 15 Sekunden bis zur nächsten!",
	msg_mindControlOther = "%s ist gedankenkontrolliert!",
	msg_mindControlYou = "Du bist gedankenkontrolliert!",
	msg_add = "%d/2 Feuerschuppenbeschützer tot!",
	
	-- bars
	bar_mindControl = "GK: %s",
	bar_curse = "Lucifrons Fluch",
	bar_doom = "Drohende Verdammnis",
	
	-- misc
	misc_addName = "Feuerschuppenbeschützer",

} end)
