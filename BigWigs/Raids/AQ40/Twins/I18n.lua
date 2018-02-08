

----------------------------
--      Localization      --
----------------------------
local bossName = BigWigs.bossmods.aq40.twins
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Twins",

	-- commands
	bug_cmd = "bug",
	bug_name = "爆炸虫警报",
	bug_desc = "爆炸虫警报",

	teleport_cmd = "teleport",
	teleport_name = "传送警报",
	teleport_desc = "传送警报",

	enrage_cmd = "enrage",
	enrage_name = "激怒警报",
	enrage_desc = "激怒警报",

	heal_cmd = "heal",
	heal_name = "治疗警报",
	heal_desc = "双子皇帝互相治疗时发出警报",
            
    blizzard_cmd = "blizzard",
    blizzard_name = "暴风雪警报",
    blizzard_desc = "显示图标如果你中暴风雪警报",

	-- triggers
	trigger_teleport = "施放了双子传送。",
	trigger_heal1 = "的治疗兄弟为",
	trigger_heal2 = " 的治疗兄弟为",
	trigger_explosion = "获得了爆炸虫",
	trigger_enrage = "becomes enraged.",
	trigger_blizzardGain = "你受到了暴风雪效果的影响。",
	trigger_blizzardGone = "暴风雪效果从你身上",

	trigger_pull1 = "Ah, lambs to the slaughter.",
	trigger_pull2 = "Prepare to embrace oblivion!",
	trigger_pull3 = "Join me brother, there is blood to be shed.",
	trigger_pull4 = "To decorate our halls.",
	trigger_pull5 = "Let none survive!",
	trigger_pull6 = "It's too late to turn away.",
	trigger_pull7 = "Look brother, fresh blood.",
	trigger_pull8 = "Like a fly in a web.",
	trigger_pull9 = "Shall be your undoing!",
	trigger_pull10 = "Your brash arrogance",

	trigger_kill = "My brother...NO!",

	-- messages
	msg_teleport = "传送!",
	msg_teleport5 = "传送5秒!",
	msg_teleport10 = "传送10秒!",
	msg_explosion = "爆炸虫即将出现！",
	msg_enrage = "激怒",
	msg_heal = "施放治疗术!",
	msg_blizzard = "离开暴雪!",

	msg_enrage10m = "激怒 10 分钟",
	msg_enrage5m = "激怒 5 分钟",
	msg_enrage3m = "激怒 3 分钟",
	msg_enrage90 = "激怒 90 秒",
	msg_enrage60 = "激怒 60 秒",
	msg_enrage30 = "激怒 30 秒",
	msg_enrage10 = "激怒 10 秒",

	-- bars
	bar_teleport = "传送",
	bar_enrage = "激怒",

	-- misc
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	bug_name = "Explodierende Käfer",
	bug_desc = "Warnung vor explodierenden Käfern.",

	teleport_name = "Teleport",
	teleport_desc = "Warnung, wenn die Zwillings Imperatoren sich teleportieren.",

	enrage_name = "Wutanfall",
	enrage_desc = "Warnung, wenn die Zwillings Imperatoren wütend werden.",

	heal_name = "Heilung",
	heal_desc = "Warnung, wenn die Zwillings Imperatoren sich heilen.",

    blizzard_name = "Blizzard Warnung",
    blizzard_desc = "Zeigt ein Icon wenn du im Blizzard stehst",

	-- triggers
	trigger_teleport = "wirkt Zwillingsteleport.",
	trigger_enrage = "wird wütend.", -- ? "bekommt 'Wutanfall'"
	trigger_explosion = "bekommt 'Käfer explodieren lassen'",
	trigger_heal1 = "'s Bruder heilen heilt",
	trigger_heal2 = " Bruder heilen heilt",
	trigger_blizzardGain = "Ihr seid von Blizzard betroffen.",
	trigger_blizzardGone = "'Blizzard' schwindet von Euch.",

	trigger_pull1 = "Ihr seid nichts weiter als",
	trigger_pull2 = "Seid bereit in die",
	trigger_pull3 = "Komm Bruder",
	trigger_pull4 = "Um unsere Hallen",
	trigger_pull5 = "Niemand wird",
	trigger_pull6 = "Nun gibt es kein",
	trigger_pull7 = "Sieh Bruder",
	trigger_pull8 = "Wie eine Fliege",
	trigger_pull9 = "Wird euer Untergang",
	trigger_pull10 = "Eure unversch",

	trigger_kill = "Mein Bruder...",

	-- messages
	msg_teleport = "Teleport!",
	msg_teleport5 = "Teleport in ~5 Sekunden!",
	msg_teleport10 = "Teleport in ~10 Sekunden!",
	msg_explosion = "Käfer explodiert!",
	msg_enrage = "Zwillings Imperatoren sind wütend!",
	msg_heal = "Heilung gewirkt!",
	msg_enrage10m = "Wutanfall in 10 Minuten",
	msg_enrage5m = "Wutanfall in 5 Minuten",
	msg_enrage3m = "Wutanfall in 3 Minuten",
	msg_enrage90 = "Wutanfall in 90 Sekunden",
	msg_enrage60 = "Wutanfall in 60 Sekunden",
	msg_enrage30 = "Wutanfall in 30 Sekunden",
	msg_enrage10 = "Wutanfall in 10 Sekunden",

	msg_blizzard = "Lauf aus Blizzard!",

	-- bars
	bar_enrage = "Wutanfall",
	bar_teleport = "Teleport",

	-- misc
} end )
