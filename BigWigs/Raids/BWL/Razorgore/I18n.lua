------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.bwl.razorgore
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Razorgore",

	-- commands
	mc_cmd = "mindcontrol",
	mc_name = "精神控制",
	mc_desc = "宣布谁被精神控制和启动宝珠.",
	eggs_cmd = "eggs",
	eggs_name = "蛋数量",
	eggs_desc = "蛋销毁数量.",
	phase_cmd = "phase",
	phase_name = "阶段",
	phase_desc = "阶段变化警告.",
	mobs_cmd = "mobs",
	mobs_name = "第一波小怪",
	mobs_desc = "显示第一波小怪刷新.",
	orb_cmd = "orb",
	orb_name = "宝珠控制",
	orb_desc = "告诉你谁是控制boss开始.",
	ktm_cmd = "ktm",
	ktm_name = "第二阶段KTM重置",
	ktm_desc = "默认是不重置 KTM (避免垃圾信息太多). 取消则重置KTM.\n\n(需要A或更高)",
	fireballvolley_cmd = "fireballvolley",
	fireballvolley_name = "连珠火球",
	fireballvolley_desc = "连珠火球警报.",
	conflagration_cmd = "conflagration",
	conflagration_name = "燃烧",
	conflagration_desc = "燃烧持续时间.",
	polymorph_cmd = "polymorph",
	polymorph_name = "强效变形术",
	polymorph_desc = "告诉你谁有变形控制器开始.",
	icon_cmd = "icon",
	icon_name = "精神控制RAID图标",
	icon_desc = "将RAID图标在精神控制的玩家.\n\n(需要L或A)",

	-- triggers
	trigger_engage = "Intruders have breached",
	trigger_orbControlOther = "(.+)受到了心灵疲惫效果的影响。",
	trigger_orbControlYou = "你受到了心灵疲惫效果的影响。",
	trigger_mindControlOtherGain = "(.+)受到了统御意志效果的影响。",
	trigger_mindControlYouGain = "你受到了统御意志效果的影响。",
	trigger_mindControlYouGone = "统御意志效果从你身上消失了。",
	trigger_mindControlOtherGone = "统御意志效果从(.+)身上消失。",
	trigger_polymorphOtherGain = "(.+)受到了强效变形术效果的影响。",
	trigger_polymorphYouGain = "你受到了强效变形术效果的影响。",
	trigger_polymorphYouGone = "强效变形术效果从你身上消失了。",
	trigger_polymorphOtherGone = "强效变形术效果从(.+)身上消失。",
	trigger_deathYou = "你死了。",
	trigger_deathOther = "(.+)死亡了。",
	trigger_egg = "狂野的拉佐格尔开始施放摧毁蛋。",
	trigger_phase2 = "I'm free! That device shall never torment me again!", --"You'll pay for forcing me to do this.",
	trigger_volley = "狂野的拉佐格尔开始施放连珠火球。",
	trigger_conflagration = "受到了燃烧效果",
	trigger_destroyEgg1 = "You'll pay for forcing me to do this\.",
	trigger_destroyEgg2 = "Fools! These eggs are more precious than you know!",
	trigger_destoryEgg3 = "No - not another one! I'll have your heads for this atrocity!",

	-- messages
	msg_engage = "第一阶段",
	msg_mobsSoon = "第一波小怪5秒!",
	msg_mindControlOther = "%s 精神控制!",
	msg_mindControlYou = "你受到精神控制!",
	msg_polymorphOther = "%s 变形! 驱散!",
	msg_polymorphYou = "你收到变形!",
	msg_egg = "%d/30 蛋!",
	msg_phase2 = "第二阶段", -- there is no clear phase2 trigger
	msg_volley = "躲起来!",

	-- bars
	bar_mobs = "第一波小怪",
	bar_mindControl = "精神控制: %s",
	bar_polymorph = "变形: %s",
	bar_egg = "捣毁蛋",
	bar_volley = "连珠火球",
	bar_conflagration = "燃烧",
	bar_orb = "控制宝珠: %s",

	-- misc
}
end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	mc_cmd = "mindcontrol",
	mc_name = "Gedankenkontrolle",
	mc_desc = "Gibt bekannt, die unter Gedankenkontrolle bekommt und beginnt einen anklickbaren Balken f\195\188r einfache Auswahl.",
	eggs_cmd = "eggs",
	eggs_name = "Eier",
	eggs_desc = "Hat ein Z\195\164hler f\195\188r Schwarzes Dracheneier zerst\195\182rt.",
	phase_cmd = "phase",
	phase_name = "Phasen",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses.",
	mobs_cmd = "mobs",
	mobs_name = "Erste Welle",
	mobs_desc = "Zeigt Ihnen, wann die erste Welle spawnt.",
	orb_cmd = "orb",
	orb_name = "Orb Kontrolle",
	orb_desc = "Zeigt Ihnen, wer ist die Steuerung der Boss und beginnt einen anklickbaren Balken f\195\188r einfache Auswahl.",
	ktm_cmd = "ktm",
	ktm_name = "Phase 2 KTM zur\195\188ckgesetzt",
	ktm_desc = "Standardm\195\164\195\159ig wird KTM nicht zur\195\188ckgesetzt (um Spam von zu vielen Helfer zu vermeiden). Deaktivieren Sie, um KTM zur\195\188ckzusetzen.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
	fireballvolley_cmd = "fireballvolley",
	fireballvolley_name = "Feuerballsalve",
	fireballvolley_desc = "Gibt bekannt, wenn der Boss wirft Feuerballsalve.",
	conflagration_cmd = "conflagration",
	conflagration_name = "Gro\195\159brand",
	conflagration_desc = "Startet eine Balken mit der Dauer der Gro\195\159brand.",
	polymorph_cmd = "polymorph",
	polymorph_name = "Gro\195\159e Verwandlung",
	polymorph_desc = "Sagt Ihnen, wer von Grethok den Controller polymorphed habe und startet einen anklickbaren Balken f\195\188r einfache Auswahl.",
	icon_cmd = "icon",
	icon_name = "Schlachtzugsymbol auf die Gedankenkontrolle Spieler",
	icon_desc = "Versetzt eine Schlachtzugsymbol auf der Gedankenkontrolle Spieler.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",

	-- triggers
	trigger_engage = "Intruders have breached",
	trigger_orbControlOther = "(.+) ist von Gedankenersch\195\182pfung betroffen\.",
	trigger_orbControlYou = "Ihr seid von Gedankenersch\195\182pfung betroffen\.",
	trigger_mindControlOtherGain = "(.+) ist von Gedanken beherrschen betroffen\.",
	trigger_mindControlYouGain = "Ihr seid von Gedanken beherrschen betroffen\.",
	trigger_mindControlYouGone = "'Gedanken beherrschen' schwindet von Euch\.",
	trigger_mindControlOtherGone = "Gedanken beherrschen schwindet von (.+)\.",
	trigger_polymorphOtherGain = "(.+) ist von Gro\195\159e Verwandlung betroffen\.",
	trigger_polymorphYouGain = "Ihr seid von Gro\195\159e Verwandlung betroffen\.",
	trigger_polymorphYouGone = "'Gro\195\159e Verwandlung' schwindet von Euch\.",
	trigger_polymorphOtherGone = "Gro\195\159e Verwandlung schwindet von (.+)\.",
	trigger_deathYou = "Du stirbst\.",
	trigger_deathOther = "(.+) stirbt\.",
	trigger_egg = "Razorgore the Untamed beginnt Ei zerst\195\182ren zu wirken\.",
	trigger_phase2 = "I'm free! That device shall never torment me again!",
	trigger_volley = "Razorgore the Untamed beginnt Feuerballsalve zu wirken\.",
	trigger_conflagration = "von Gro\195\159brand betroffen",
	trigger_destroyEgg1 = "You'll pay for forcing me to do this\.",
	trigger_destroyEgg2 = "Fools! These eggs are more precious than you know!",
	trigger_destoryEgg3 = "No - not another one! I'll have your heads for this atrocity!",

	-- messages
	msg_engage = "Phase 1",
	msg_mobsSoon = "Erste Welle in 5sec!",
	msg_mindControlOther = "%s ist ferngesteuert!",
	msg_mindControlYou = "Du bist ferngesteuert!",
	msg_polymorphOther = "%s ist polymorphed! Entfernt es!",
	msg_polymorphYou = "Du bist polymorphed!",
	msg_egg = "%d/30 Eier zerst\195\182rt!",
	msg_phase2 = "Phase 2",
	msg_volley = "Verstecken!",

	-- bars
	bar_mobs = "Erste Welle",
	bar_mindControl = "Gedankenkontrolle: %s",
	bar_polymorph = "Polymorph: %s",
	bar_egg = "Ei zerst\195\182ren",
	bar_volley = "Feuerballsalve",
	bar_conflagration = "Gro\195\159brand",
	bar_orb = "Orb Kontrolle: %s",

	-- misc
}
end)