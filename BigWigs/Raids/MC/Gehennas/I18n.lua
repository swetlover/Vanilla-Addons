------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.mc.gehennas
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Gehennas",
	
	-- commands	
	adds_cmd = "adds",
	adds_name = "小怪死亡",
	adds_desc = "通告小怪死亡",
	
	curse_cmd = "curse",
	curse_name = "基赫纳斯的诅咒警报",
	curse_desc = "基赫纳斯的诅咒警报",
            
    rain_cmd = "rain",
    rain_name = "火雨警报",
    rain_desc = "显示火雨的警报标志",
	
	-- triggers
	trigger_curseHit = "受到了基赫纳斯",
	trigger_rain = "你受到了火焰之雨效果的影响",
	trigger_rainRun = "你受到(%d+)点(.+)伤害（基赫纳斯的火焰之雨）。",
	trigger_curseResist = "基赫纳斯的诅咒被抵抗了。",
	trigger_addDeath = "烈焰行者死亡了。",
	
	-- messages
	msg_add = "%d/2 烈焰行者死亡!",
	msg_curseSoon = "5秒后诅咒!",
	msg_curseNow = "基赫纳斯的诅咒 - 快驱散!",
	msg_fire = "离开火雨!",
	
	-- bars
    bar_rain = "下次火焰之雨",
	bar_curse = "基赫纳斯的诅咒",
	
	-- misc
	misc_flamewakerName = "烈焰行者",
    ["Rain of Fire"] = "火焰之雨",

} end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Feuerschuppe Tod",
	
	curse_name = "Alarm für Gehennas' Fluch",
	curse_desc = "Warnen vor Gehennas' Fluch",
            
    rain_name = "Feuerregen",
    rain_desc = "Zeigt ein Warnzeichen bei Feuerregen",
	
	-- triggers
	trigger_curseHit = "von Gehennas(.+)Fluch betroffen",
	trigger_rain = "Ihr seid von Feuerregen betroffen",
	trigger_rainRun = "Ihr erleidet (%d+) (.+) von Gehennas Feuerregen.",	
	trigger_curseResist = "Gehennas\' Fluch(.+) widerstanden",
	trigger_addDeath = "Feuerschuppe stirbt",
	
	-- messages
	msg_add = "%d/2 Feuerschuppe tot!",
	msg_curseSoon = "5 Sekunden bis Gehennas' Fluch!",
	msg_curseNow = "Gehennas' Fluch - JETZT Entfluchen!",
	msg_fire = "Raus aus dem Feuer!",
	
	-- bars
    bar_rain = "Nächster Regen",
	bar_curse = "Gehennas' Fluch",
	
	-- misc
	misc_flamewakerName = "Feuerschuppe",
    ["Rain of Fire"] = "Feuerregen",
	
} end)
