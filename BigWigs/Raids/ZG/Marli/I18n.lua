------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.marli
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Marli",
	
	-- commands
	spider_cmd = "spider",
	spider_name = "蜘蛛警报",
	spider_desc = "蜘蛛刷新警报",

	volley_cmd = "volley",
	volley_name = "毒箭之雨警报",
	volley_desc = "毒箭之雨警报\n",

	drain_cmd = "drain",
	drain_name = "吸取生命警报",
	drain_desc = "吸取生命警报",
	
	phase_cmd = "phase",
	phase_name = "阶段通知",
	phase_desc = "阶段通知",
	
	-- triggers
	trigger_spiders = "Aid me my brood!",
	trigger_drainLifeYouGain = "你受到了吸取生命效果的影响。",
	trigger_drainLifeOtherGain = "(.+)受到了吸取生命效果的影响。",
	trigger_drainLifeYouGone = "吸取生命效果从你身上消失了。",
	trigger_drainLifeOtherGone = "吸取生命效果从(.+)身上消失。",
	trigger_poisonHit1 = "受到了毒箭之雨效果的影响",
	trigger_poisonHit2 = "High Priestess Mar'li的毒箭之雨击中",
	trigger_poisonResist = "High Priestess Mar'li的毒箭之雨被(.+)抵抗了。",
	trigger_poisonImmune = "High Priestess Mar'li的毒箭之雨施放失败。(.+)对此免疫。",
	trigger_drainLife = "吸取生命",
	trigger_phaseTroll = "The brood shall not fall",
	trigger_spiderTroll1 = "Draw me to your web mistress Shadra",
	trigger_spiderTroll2 = "Shadra, make of me your avatar",
	
	-- messages
	msg_spiders = "蜘蛛刷新!",
	msg_drainLife = "吸取生命! 打断他!",
	msg_phaseTroll = "巨魔阶段",
	msg_phaseSpider = "蜘蛛阶段",
	
	-- bars
	bar_poison = "可能毒箭之雨",
	bar_drainLife = "吸取生命",
	
	-- misc
	misc_spawnName = "玛尔里的爪牙",
	misc_you = "你",
	
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	spider_name = "Alarm f\195\188r Spinnen",
	spider_desc = "Warnung wenn Spinnen erscheinen",

	volley_name = "Alarm f\195\188r Giftblitzsalve",
	volley_desc = "Warnen vor Giftblitzsalve\n\n(Dementi: Dieser Balken hat eine \194\1772 Sekunden Fehler)",

	drain_name = "Alarm f\195\188r Blutsauger",
	drain_desc = "Warnen vor Blutsauger",
	
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses",
	
	-- triggers
	trigger_spiders = "Aid me my brood!",
	trigger_drainLifeYouGain = "Ihr seid von Blutsauger betroffen\.",
	trigger_drainLifeOtherGain = "(.+) ist von Blutsauger betroffen\.",
	trigger_drainLifeYouGone = "\'Blutsauger\' schwindet von Euch\.",
	trigger_drainLifeOtherGone = "Blutsauger schwindet von (.+)\.",
	trigger_poisonHit1 = "von Giftblitzsalve betroffen",
	trigger_poisonHit2 = "Giftblitzsalve(.+) Naturschaden\.",
	trigger_poisonResist = "Giftblitzsalve(.+) widerstanden",
	trigger_poisonImmune = "Giftblitzsalve(.+) immun",
	trigger_drainLife = "Blutsauger",
	trigger_phaseTroll = "The brood shall not fall",
	trigger_spiderTroll1 = "Draw me to your web mistress Shadra",
	trigger_spiderTroll2 = "Shadra, make of me your avatar",
	
	-- messages
	msg_spiders = "Spinnen erscheinen!",
	msg_drainLife = "Blutsauger! Unterbreche sie/entferne magie!",
	msg_phaseTroll = "Troll-Phase",
	msg_phaseSpider = "Spinnen-Phase",
	
	-- bars
	bar_poison = "Giftblitzsalve",
	
	-- misc
	misc_spawnName = "Spawn of Mar'li",
	misc_you = "Euch",

} end )
