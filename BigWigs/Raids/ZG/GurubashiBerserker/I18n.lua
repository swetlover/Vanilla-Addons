------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.gurubashiBerserker
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Berserker",
	
	-- commands
	fear_cmd = "fear",
	fear_name = "恐惧",
	fear_desc = "恐惧计时条",
	
	knockback_cmd = "knockback",
	knockback_name = "击退",
	knockback_desc = "击退计时条",
	
	-- trigger
	trigger_fearHit = "受到了破胆咆哮效果的影响",
	trigger_fearImmune = "破胆咆哮施放失败。(.+)对此免疫。",
	trigger_fearResist = "破胆咆哮被抵抗了",
	
	trigger_knockback = "Gurubashi Berserker's Knock Away",
	
	-- bars
	bar_knockback = "击退",
	bar_fear = "恐惧",
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	--fear_cmd = "fear",
	fear_name = "Furch",
	fear_desc = "Zeige Timer für Furcht",
	
	--knockback_cmd = "knockback",
	knockback_name = "Rückstoss",
	knockback_desc = "Zeige Timer für Rückstoss",
	
	-- triggers
	trigger_fearHit = "afflicted by Intimidating Roar",
	trigger_fearImmune = "Intimidating Roar fail(.+) immune.",
	trigger_fearResist = "Intimidating Roar was resisted",
	
	trigger_knockback = "Gurubashi Berserker's Knock Away",
	
	-- bars
	bar_knockback = "Rückstoss",
	bar_fear = "Furcht",
} end )
