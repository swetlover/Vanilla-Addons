------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.mc.magmadar
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Magmadar",
	
	-- commands
	panic_cmd = "panic",
	panic_name = "恐惧警报",
	panic_desc = "玛格曼达的恐惧警报",
	
	frenzy_cmd = "frenzy",
	frenzy_name = "狂暴警报",
	frenzy_desc = "玛格曼达的狂暴警报",
	
	-- triggers	
	trigger_frenzy = "goes into a killing frenzy!",
	trigger_panicHit = "受到了恐慌效果的影响。",
	trigger_panicImmune = "恐慌施放失败。(.+)对此免疫。",
	trigger_panicResist = "玛格曼达的恐慌被(.*)抵抗",
	trigger_frenzyGone = "狂乱效果从玛格曼达身上消失",
	
	-- messages
	msg_frenzy = "狂乱! 立刻宁神!",
	msg_panicSoon = "恐惧马上来袭!",
	msg_panicNow = "群体恐惧 - 30秒后再次发动!",
	
	-- bars
	bar_frenzy = "狂乱",
	bar_panic = "恐惧",
	
	-- misc
	
} end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	panic_name = "Alarm für Panik",
	panic_desc = "Warnung, wenn Magmadar AoE Furcht wirkt.",
	
	frenzy_name = "Alarm für Raserei",
	frenzy_desc = "Warnung, wenn Magmadar in Raserei gerät.",
	
	-- triggers
	trigger_frenzy = "wird mörderisch wahnsinnig!",
	trigger_panicHit = "von Panik betroffen",
	trigger_panicImmune = "Panik(.+)immun",
	trigger_panicResist = "Panik(.+)widerstanden",
	trigger_frenzyGone = "Wutanfall schwindet von Magmadar.",
	
	-- messages
	msg_frenzy = "Raserei! Tranq jetzt!",
	msg_panicSoon = "Panik in 5 Sekunden!",
	msg_panicNow = "AoE Furcht! Nächste in 30 Sekunden!",
	
	-- bars
	bar_frenzy = "Wutanfall",
	bar_panic = "Panik",
	
	-- misc

} end)