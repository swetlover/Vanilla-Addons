--[[
    Created by Vnm-Kronos - https://github.com/Vnm-Kronos
    modified by Dorann
--]]

------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.livingmonstrosity
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Monstrosity",
	
	-- commands
	lightningtotem_cmd = "lightningtotem",
	lightningtotem_name = "闪电图腾警报",
	lightningtotem_desc = "召唤闪电图腾时警报",
	
	-- triggers
	trigger_lightningtotemCast = "畸形妖开始施放闪电图腾",
	trigger_lightningtotemSummon = "畸形妖施放了闪电图腾。",
	
	-- messages
	message_lightningtotem = "闪电图腾!快打断!",
	
	-- bars
	bar_lightningtotem = "召唤闪电图腾",
	
	-- misc
	misc_lightningTotem = "闪电图腾",
	
} end )
