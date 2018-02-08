------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.mc.majordomo
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Majordomo",
	
	-- commands
	adds_cmd = "adds",
	adds_name = "小怪死亡",
	adds_desc = "小怪死亡通告",
	
	magic_cmd = "magic",
	magic_name = "魔法反射",
	magic_desc = "魔法反射警报",
	
	dmg_cmd = "dmg",
	dmg_name = "伤害反射护盾",
	dmg_desc = "伤害反射护盾警报",
	
	-- triggers
	trigger_victory = "My flame! Please don",
    trigger_engage = "Reckless mortals, none may challenge the sons of the living flame!",
	trigger_magic = "获得了魔法反射的效果",
	trigger_dmg = "获得了伤害反射护盾的效果",
	trigger_magicGone = "伤害反射护盾效果从",
	trigger_dmgGone = "魔法反射效果从",
	trigger_healerDeath = "烈焰行者医师死亡",
	trigger_eliteDeath = "烈焰行者精英死亡",
	
	-- messages
	msg_magic = "魔法反射10秒!",
	msg_dmg = "伤害反射护盾10秒!",
	msg_shieldSoon = "3秒后施放新的光环!",
	msg_magicGone = "魔法反射!",
	msg_dmgGone = "伤害反射护盾!",
	msg_healerDeath = "%d/4 烈焰行者医师死亡!",
	msg_eliteDeath = "%d/4 烈焰行者精英死亡!",
	
	-- bars
	bar_magic = "魔法反射",
	bar_dmg = "伤害反射护盾",
	bar_nextShield = "新的护盾",
	
	-- misc	
	misc_eliteName = "烈焰行者精英",
	misc_healerName = "烈焰行者医师",

} end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Feuerschuppenheiler und Feuerschuppenelite Tod.",
	
	magic_name = "Magiereflexion",
	magic_desc = "Warnung, wenn Magiereflexion aktiv.",
	
	dmg_name = "Schadensschild",
	dmg_desc = "Warnung, wenn Schadensschild aktiv.",
	
	-- triggers
	trigger_victory = "Ich werde euch nun verlassen",
    trigger_engage = "Niemand fordert die Söhne der Lebenden Flamme heraus", --"Reckless mortals, none may challenge the sons of the living flame!",

	trigger_magic = "bekommt \'Magiereflexion'",
	trigger_dmg = "bekommt \'Schadensschild'",
	trigger_magicGone = "Magiereflexion schwindet von",
	trigger_dmgGone = "Schadensschild schwindet von",
	trigger_healerDeath = "Feuerschuppenheiler stirbt",
	trigger_eliteDeath = "Feuerschuppenelite stirbt",
	
	-- messages
	msg_magic = "Magiereflexion für 10 Sekunden!",
	msg_dmg = "Schadensschild für 10 Sekunden!",
	msg_shieldSoon = "Neue Schilder in 3 Sekunden!",
	msg_magicGone = "Magiereflexion beendet!",
	msg_dmgGone = "Schadensschild beendet!",
	msg_healerDeath = "%d/4 Heiler tot!",
	msg_eliteDeath = "%d/4 Elite tot!",
	
	-- bars
	bar_magic = "Magiereflexion",
	bar_dmg = "Schadensschild",
	bar_nextShield = "Nächstes Schild",
	
	-- misc
	misc_eliteName = "Feuerschuppenelite",
	misc_healerName = "Feuerschuppenheiler",

} end)
