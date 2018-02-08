------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.venoxis
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
    cmd                 = "Venoxis",
	
	-- commands
    adds_cmd            = "adds",
    adds_name           = "小怪死亡通告",
    adds_desc           = "小怪死亡通告",
	
    renew_cmd           = "renew",
    renew_name          = "恢复警报",
    renew_desc          = "恢复警报",

    holyfire_cmd        = "holyfire",
    holyfire_name       = "神圣之火警报",
    holyfire_desc       = "神圣之火警报",

    phase_cmd           = "phase",
    phase_name          = "阶段通报",
    phase_desc          = "阶段通报",

    announce_cmd        = "whispers",
    announce_name       = "密语中毒云的玩家",
    announce_desc       = "密语中毒云的玩家\n\n(需要A或L)\n",

    enrage_cmd          = "enrage",
    enrage_name         = "狂怒警报",
    enrage_desc         = "狂怒警报",
	
	-- triggers
    trigger_renew                   = "高阶祭司温诺希斯获得了恢复的效果。",
    trigger_renewGone               = "恢复效果从高阶祭司温诺希斯身上消失。",
    trigger_enrage                  = "高阶祭司温诺希斯获得了激怒的效果。",
    trigger_holyFire                = "高阶祭司温诺希斯开始施放神圣之火。",
    trigger_phase2                  = "Let the coils of hate unfurl!",
    trigger_attack1                 = "高阶祭司温诺希斯发起攻击",
    trigger_attack2                 = "高阶祭司温诺希斯没有击中",
    trigger_attack3                 = "高阶祭司温诺希斯击中",
    trigger_attack4                 = "高阶祭司温诺希斯的致命一击",
    trigger_poisonCloud             = "毒性云雾",
    trigger_poisonCloudYouHit      	= "你受到(.+)点自然伤害（高阶祭司温诺希斯的毒云）。",
    trigger_poisonCloudOtherHit    	= "高阶祭司温诺希斯的毒性云雾使(.+)受到了(.+)点自然伤害。",
    trigger_poisonCloudYou          = "你受到了毒性云雾效果的影响。",
    trigger_poisonCloudYouAbsorb    = "你吸收了高阶祭司温诺希斯的毒性云雾。",
    trigger_poisonCloudOtherAbsorb  = "高阶祭司温诺希斯的毒性云雾被(.+)吸收了。",
    trigger_poisonCloudYouResist    = "高阶祭司温诺希斯的毒性云雾被抵抗了。",
    trigger_poisonCloudOtherResist  = "高阶祭司温诺希斯的毒性云雾被(.+)抵抗了。",
    trigger_poisonCloudYouImmune    = "高阶祭司温诺希斯的毒性云雾施放失败。你对此免疫。",
    trigger_poisonCloudOtherImmune  = "高阶祭司温诺希斯的毒性云雾施放失败。(.+)对此免疫。",
    trigger_addDeath                = "拉扎什眼镜蛇死亡了",
    trigger_bossDeath               = "高阶祭司温诺希斯死亡了",
	
	-- messages
    msg_renew       	= "恢复! 驱散他!",
    msg_phase1      	= "巨魔阶段",
    msg_phase2      	= "眼镜蛇阶段",
    msg_enrage      	= "Boss 相遇!!",
    msg_poisonYou   	= "远离毒云!",
    msg_poisonWhisper   = "远离毒云!",
    msg_adds            = "%d/4 拉扎什眼镜蛇死亡!",
	
	-- bars
    bar_holyFire        = "神圣之火",
    bar_renew           = "恢复",
	
	-- misc
    misc_addName        = "拉扎什眼镜蛇",
    misc_you            = "你",
	
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Razzashi Cobras Tod",
	
	renew_name = "Alarm für Erneuerung",
	renew_desc = "Warnung, wenn Venoxis Erneuerung auf sich wirkt",

	holyfire_name = "Alarm für Heiliges Feuer",
	holyfire_desc = "Warnen, wenn Heiliges Feuer gewirkt wird",

	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verkündet den Phasenwechsel des Bosses",

	announce_name = "Brennenden Personen flüstern",
	announce_desc = "Flüster der Person, die im Giftwolken steht\n\n(Benötigt Schlachtzugleiter oder Assistent)\n\n(Warnung: um überflüssiges Flüstern zu vermeiden, wird es nur den Personen flüstern, die tatsächlichen Schaden von den Giftwolken bekommen.)",

	enrage_name = "Verkündet Boss' Raserei",
	enrage_desc = "Lässt dich wissen, wenn Boss härter zuschlägt",
	
	-- triggers
	trigger_renew = "High Priest Venoxis bekommt 'Erneuerung",
	trigger_renewGone = "Erneuerung schwindet von High Priest Venoxis\.",
	trigger_enrage = "High Priest Venoxis bekommt \'Wutanfall",
	trigger_holyFire = "High Priest Venoxis beginnt Heiliges Feuer zu wirken\.",
	trigger_phase2 = "Let the coils of hate unfurl!",
	trigger_attack1 = "High Priest Venoxis greift an",
	trigger_attack2 = "High Priest Venoxis verfehlt",
	trigger_attack3 = "High Priest Venoxis trifft",
	trigger_attack4 = "High Priest Venoxis trifft (.+) kritisch",
	trigger_poisonCloud = "Giftwolke",
	trigger_poisonCloudYouHit = "Ihr erleidet (.+) Naturschaden von High Priest Venoxis (durch Giftwolke)\.",
	trigger_poisonCloudOtherHit = "(.+) erleidet (.+) Naturschaden von High Priest Venoxis (durch Giftwolke)\.",
    trigger_poisonCloudYou              = "You are afflicted by Poison Cloud.",
	trigger_poisonCloudYouAbsorb = "Ihr absorbiert High Priest Venoxiss Giftwolke\.",
	trigger_poisonCloudOtherAbsorb = "Giftwolke von High Priest Venoxis wird absorbiert von\: (.+)\.",
	trigger_poisonCloudYouResist = "High Priest Venoxis versucht es mit Giftwolke\.\.\. widerstanden\.",
	trigger_poisonCloudOtherResist = "High Priest Venoxiss Giftwolke wurde von (.+) widerstanden\.",
	trigger_poisonCloudYouImmune = "High Priest Venoxis versucht es mit Giftwolke\.\.\. ein Fehlschlag. Ihr seid immun\.",
	trigger_poisonCloudOtherImmune = "High Priest Venoxis versucht es mit Giftwolke. Ein Fehlschlag, denn (.+) ist immun\.",
	trigger_addDeath = "Razzashi Cobra stirbt",
	trigger_bossDeath = "High Priest Venoxis stirbt",
	
	-- messages
	msg_renew = "Erneuerung! Entferne magie!",
	msg_phase1 = "Troll-Phase",
	msg_phase2 = "Schlange-Phase",
	msg_enrage = "Boss ist in Raserei! Spam Heilung!",
	msg_poisonYou = "Beweg\' dich aus dem Giftwolke!",
	msg_poisonWhisper = "Move away from poison cloud!",
	msg_adds = "%d/4 Razzashi Cobra tot!",
	
	-- bars
	bar_holyFire = "Heiliges Feuer",
	bar_renew = "Erneuerung",
	
	-- misc
	misc_addName = "Razzashi Cobra",
	misc_you = "Ihr",
	
} end )
