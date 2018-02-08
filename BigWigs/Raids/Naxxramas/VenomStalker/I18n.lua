--[[
    Created by Vnm-Kronos - https://github.com/Vnm-Kronos
    modified by Dorann
--]]

------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.venomstalker
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "SpiderTrash",
	
	-- commands
	charge_cmd = "charge",
	charge_name = "毒性充能",
	charge_desc = "显示一个毒性充能的冷却计时.",
	
	-- triggers
	trigger_charge = "(.+)(.+)毒性充能效果的影响",
	--trigger_chargeGone = "Poison Charge fades from (.+)",
	
	-- messages
	
	-- bars
	bar_charge = "毒性充能冷却 %s",
	
	-- misc
	misc_You = "你",
	misc_you = "你",
	misc_are = "受到了",
	misc_is = "受到了",
} end )