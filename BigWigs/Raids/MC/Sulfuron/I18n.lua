------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.mc.sulfuron
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Sulfuron",
	
	-- commands	
	knockback_cmd = "knockback",
	knockback_name = "拉格纳罗斯之手通告",
	knockback_desc = "显示击退时间",
	
	heal_cmd = "heal",
	heal_name = "小怪的治疗",
	heal_desc = "黑暗治疗时通告增加治疗",
	
	adds_cmd = "adds",
	adds_name = "小怪死亡",
	adds_desc = "烈焰行者死亡通告",
	
	-- triggers
	trigger_addDeath = "烈焰行者祭司死亡了",
	trigger_heal = "开始施放黑暗治疗",
    trigger_spear = "开始施展烈焰之矛",
	trigger_knockbackHit1 = "拉格纳罗斯之手击中",
	trigger_knockbackHit2 = "拉格纳罗斯之手命中",
	trigger_knockbackResist = "拉格纳罗斯之手被抵抗了",
	trigger_knockbackAbsorb1 = "吸收了(.+)的拉格纳罗斯之手",
	trigger_knockbackAbsorb2 = "拉格纳罗斯之手被吸收了",
	trigger_knockbackImmune = "(.+)对拉格纳罗斯之手免疫",
	
	-- messages
	msg_knockbackSoon = "3 秒后击退!",
	msg_heal = "治疗!",
	msg_adds = "%d/4 烈焰行者祭司死亡!",
	
	-- bars
	bar_heal = "黑暗治疗",
	bar_knockback = "可能击退",
	bar_flameSpear = "烈焰之矛",
	
	-- misc
	misc_addName = "烈焰行者祭司",

} end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	knockback_name = "Verkündet Hand von Ragnaros",
	knockback_desc = "Zeige Timer für Rückstö\195\159e",
	
	heal_name = "Heilung der Adds",
	heal_desc = "Verkündet Heilung der Flamewaker Priest",
	
	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Flamewaker Priests Tod",
	
	-- triggers
	trigger_addDeath = "Flamewaker Priest stirbt",
	trigger_heal = "beginnt Dunkle Besserung",
    trigger_spear = "beginnt Flammenspeer zu wirken",
	trigger_knockbackHit1 = "trifft(.+)Hand von Ragnaros",
	trigger_knockbackHit2 = "Hand von Ragnaros(.+)trifft",
	trigger_knockbackResist = "Hand von Ragnaros(.+)widerstanden",
	trigger_knockbackAbsorb1 = "absorbiert (.+) Hand von Ragnaros",
	trigger_knockbackAbsorb2 = "Hand von Ragnaros (.+) absorbiert",
	trigger_knockbackImmune = "Hand von Ragnaros(.+) immun",
	
	-- messages
	msg_knockbackSoon = "3 Sekunden bis Rückstoss!",
	msg_heal = "Heilung!",
	msg_adds = "%d/4 Flamewaker Priest tot!",
	
	-- bars
	bar_heal = "Dunkle Besserung",
	bar_knockback = "Möglicher Rückstoss",
	bar_flameSpear = "Flammenspeer",
	
	-- misc
	misc_addName = "Flamewaker Priest",

} end)
