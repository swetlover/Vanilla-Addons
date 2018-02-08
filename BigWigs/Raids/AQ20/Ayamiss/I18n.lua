------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq20.ayamiss
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("enUS", function() return {
	cmd = "Ayamiss",
	
	-- commands
	sacrifice_cmd = "sacrifice",
	sacrifice_name = "Sacrifice Alert",
	sacrifice_desc = "Warn for Sacrifice",
	
	-- triggers
	trigger_sacrifice = "^([^%s]+) ([^%s]+) afflicted by Paralyze",
	
	-- messages
	msg_sacrifice = " is being Sacrificed!",
	
	-- bars
	
	-- misc
	misc_you = "You",
	misc_are = "are",	
		
} end )

L:RegisterTranslations("zhCN", function() return {
	-- commands
	sacrifice_name = "祭品警报",
	sacrifice_desc = "被作为祭品时发出警报",
	
	-- triggers
	trigger_sacrifice = "^([^%s]+)([^%s]+)麻痹效果的影响。",
	
	-- messages
	msg_sacrifice = " 成为祭品了！",
	
	-- bars
	
	-- misc
	misc_you = "你",
	misc_are = "受到了",	
	
} end )
