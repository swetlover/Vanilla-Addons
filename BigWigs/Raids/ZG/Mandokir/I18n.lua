------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.mandokir
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Mandokir",
	
	-- commands
	announce_cmd = "whispers",
	announce_name = "密语被盯玩家",
	announce_desc = "密语被盯玩家.\n\n(需要L或A)",

	puticon_cmd = "puticon",
	puticon_name = "Raid图标被盯玩家",
	puticon_desc = "Raid图标被盯玩家.\n\n(需要L或A)",
	
	gaze_cmd = "gaze",
	gaze_name = "威慑凝视警报",
	gaze_desc = "威慑凝视显示条",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "旋风斩警报",
	whirlwind_desc = "旋风斩警报显示",

	enraged_cmd = "enraged",
	enraged_name = "激怒警报",
	enraged_desc = "通告BOSS被激怒",
	
	-- triggers
	trigger_engage = "feed your souls to Hakkar himself",
	trigger_watch = "(.+)! I'm watching you!",
	trigger_gazeCast = "血领主曼多基尔开始施放威慑凝视。",
	trigger_gazeYouGain = "你受到了威慑凝视效果的影响。",
	trigger_gazeOtherGain = "(.+)受到了威慑凝视效果的影响。",
	trigger_gazeYouGone = "威慑凝视效果从你身上消失了。",
	trigger_gazeOtherGone = "威慑凝视效果从(.+)身上消失。",
	trigger_enrageGain = "血领主曼多基尔获得了激怒的效果。",
	trigger_enrageFade = "激怒效果从血领主曼多基尔身上消失。",
	trigger_whirlwindGain = "血领主曼多基尔获得了旋风斩的效果。",
	trigger_whirlwindGone = "旋风斩效果从血领主曼多基尔身上消失。",
	trigger_deathYou = "你死了。",
	trigger_deathOther = "(.+)死亡了。",
	
	-- messages
	msg_watchYou = "你被监视着！停止一切！",
	msg_watchWhisper = "你被监视着！停止一切！",
	msg_watchOther = "%s 被监视着!",
	msg_enrage = "奥根死了! 血领主激怒!",	
	
	-- bars
    bar_gazeCast = "威慑凝视来临!",
	bar_watch = "威慑凝视: %s",
	bar_enrage = "激怒",
	bar_whirlwind = "旋风斩",
	
	-- misc
	misc_ohgan = "奥根",
	misc_you = "你",
	
    ["Possible Gaze"] = "可能凝视",
	
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	announce_name = "Warnung, wenn Spieler beobachtet werden",
	announce_desc = "Warnen, wenn Bloodlord Mandokir wirft Bedrohlicher Blick\n\n(Benötigt Schlachtzugleiter oder Assistent)",

	puticon_name = "Schlachtzugsymbol auf die beobachtet Spieler",
	puticon_desc = "Versetzt eine Schlachtzugsymbol auf der beobachteten Spieler.\n\n(Benötigt Schlachtzugleiter oder Assistent)",
	
	gaze_name = "Alarm für Bedrohlicher Blick",
	gaze_desc = "Zeigt Balken für Bedrohlicher Blick",

	whirlwind_name = "Alarm für Wirbelwind",
	whirlwind_desc = "Zeigt Balken für Wirbelwind",

	enraged_name = "Verkündet Boss' Raserei",
	enraged_desc = "Lässt dich wissen, wenn Boss härter zuschlägt",
	
	-- triggers
    trigger_engage = "feed your souls to Hakkar himself",
	trigger_watch = "(.+)! I'm watching you!",
	trigger_gazeCast = "Bloodlord Mandokir beginnt Bedrohlicher Blick zu wirken.",
	trigger_gazeYouGain = "Ihr seid von Bedrohlicher Blick betroffen.",
	trigger_gazeOtherGain = "(.+) ist von Bedrohlicher Blick betroffen.",
	trigger_gazeYouGone = "'Bedrohlicher Blick' schwindet von Euch.",
	trigger_gazeOtherGone = "Bedrohlicher Blick schwindet von (.+).",
	trigger_enrageGain = "Bloodlord Mandokir bekommt 'Wutanfall'.",
	trigger_enrageFade = "Wutanfall schwindet von Bloodlord Mandokir.",
	trigger_whirlwindGain = "Bloodlord Mandokir bekommt 'Wirbelwind'.",
	trigger_whirlwindGone = "Wirbelwind schwindet von Bloodlord Mandokir\.",
	trigger_deathYou = "Du stirbst.",
	trigger_deathOther = "(.+) stirbt.",
	
	-- messages
	msg_watchYou = "Du wirst beobachtet! Stoppen Sie alles!",
	msg_watchWhisper = "You are being watched! Stop everything!",
	msg_watchOther = "%s wird beobachtet!",
	msg_enrage = "Ohgan ist tot! Mandokir wütend!",	
	
	-- bars
    bar_gazeCast = "Bedrohlicher Blick kommt!",
	bar_watch = "Bedrohlicher Blick: %s",
	bar_enrage = "Wutanfall",
	bar_whirlwind = "Wirbelwind",
	
	-- misc
	misc_ohgan = "Ohgan",
	misc_you = "Euch",
	
    ["Possible Gaze"] = "Mögliches Starren"
	
} end )
