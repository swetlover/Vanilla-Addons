------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.wushoolay
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Wushoolay",

	-- commands
	chainlightning_cmd = "chainlightning",
	chainlightning_name = "闪电链警报",
	chainlightning_desc = "闪电链警报.",
	
	lightningcloud_cmd = "lightningcloud",
	lightningcloud_name = "落雷之云警报",
	lightningcloud_desc = "落雷之云警报.",
	
	-- triggers
	trigger_chainLightning = "乌苏雷开始施放闪电链。",
	trigger_lightningcloud = "你受到了闪电链效果的影响。",
	
	-- messages
	msg_chainLightning = "闪电链! 打断他!",
	msg_lightningCloud = "走出闪电云!",
	
	-- bars
	bar_chainLightning = "闪电链",
	
	-- misc
	
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	chainlightning_cmd = "chainlightning",
	chainlightning_name = "Alarm f\195\188r Kettenblitzschlag",
	chainlightning_desc = "Warnen wenn Wushoolay beginnt Kettenblitzschlag zu wirken.", 
	
	lightningcloud_cmd = "lightningcloud",
	lightningcloud_name = "Alarm f\195\188r Blitzschlagwolke",
	lightningcloud_desc = "Warnt dich wenn du in Blitzschlagwolke stehst.",
	
	-- triggers
	trigger_chainLightning = "Wushoolay beginnt Kettenblitzschlag zu wirken\.",
	trigger_lightningcloud = "Ihr seid von Blitzschlagwolke betroffen\.",
	
	-- messages
	msg_chainLightning = "Kettenblitzschlag! Unterbreche sie!",
	msg_lightningCloud = "Beweg dich aus der Blitzschlagwolke!",
	
	-- bars
	bar_chainLightning = "Kettenblitzschlag",
	
	-- misc	

} end )
