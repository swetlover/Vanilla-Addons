------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.gahzranka
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Gahzranka",

	-- commands
	frostbreath_cmd = "frostbreath",
	frostbreath_name = "冰息术警报",
	frostbreath_desc = "冰息术警报.",

	massivegeyser_cmd = "massivegeyser",
	massivegeyser_name = "巨型喷泉警报",
	massivegeyser_desc = "巨型喷泉警报.",
	
	-- triggers
	trigger_frostBreath = "加兹兰卡开始施展冰息术。",
	trigger_massiveGeyser = "加兹兰卡开始施放巨型喷泉。",
	
	-- messages
	
	-- bars
	bar_frostBreath = "冰息术",
	bar_massiveGeyser = "巨型喷泉",
	
	-- misc	

} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	frostbreath_name = "Alarm für Frostatem",
	frostbreath_desc = "Warnen wenn Gahz'ranka beginnt Frostatem zu wirken.",
	
	massivegeyser_name = "Alarm für Massiver Geysir",
	massivegeyser_desc = "Warnen wenn Gahz'ranka beginnt Massiver Geysir zu wirken.",
	
	-- triggers
	trigger_frostBreath = "Gahz\'ranka beginnt Frostatem auszuführen\.",
	trigger_massiveGeyser = "Gahz\'ranka beginnt Massiver Geysir zu wirken\.",
	
	-- messages
	
	-- bars
	bar_frostBreath = "Frostatem",
	bar_massiveGeyser = "Massiver Geysir",
	
	-- misc

} end )