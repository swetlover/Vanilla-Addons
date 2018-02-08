------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.jindo
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Jindo",

	--commands
	brainwash_cmd = "brainwash",
	brainwash_name = "洗脑图腾警报",
	brainwash_desc = "洗脑图腾警报.",

	healingward_cmd = "healingward",
	healingward_name = "治疗图腾警报",
	healingward_desc = "治疗图腾警报.",

	curse_cmd = "curse",
	curse_name = "诅咒警报",
	curse_desc = "诅咒警报.",
	
	hex_cmd = "hex",
	hex_name = "妖术警报",
	hex_desc = "妖术警报.",

	puticon_cmd = "puticon",
	puticon_name = "Raid图标被诅咒玩家",
	puticon_desc = "Raid图标被诅咒玩家.\n\n(需要L或A)",
	
	-- triggers
    trigger_engage = "Welcome to da great show friends",
	trigger_brainWash = "妖术师金度施放了召唤洗脑图腾。",
	trigger_healing = "妖术师金度施放了强力治疗结界。",
	trigger_curseYou = "你受到了金度的欺骗效果的影响。",
	trigger_curseOther = "(.+)受到了金度的欺骗效果的影响。",
	trigger_hexYou = "你受到了妖术效果的影响。",
	trigger_hexOther = "(.+)受到了妖术效果的影响。",
	trigger_hexYouGone = "妖术效果从你身上消失了。",
	trigger_hexOtherGone = "妖术效果从(.+)身上消失。",
	trigger_bossDeath = "妖术师金度死亡了。",
	trigger_brainWashDeath = "洗脑图腾死亡了。",
	trigger_healingDeath = "强力治疗结界死亡了。",
	
	-- messages
	msg_brainWash = "洗脑图腾!",
	msg_healing = "强力治疗结界!",
	msg_curseWhisper = "你受到诅咒! 去杀影子!",
	msg_curseOther = "%s 被诅咒!",
	msg_hex = "%s 被妖术! 驱散他!",
	
	-- bars
	bar_brainWash = "洗脑图腾",
	bar_healing = "强力治疗结界",
    bar_brainWashNext = "下个洗脑图腾",
	bar_healingNext = "下个强力治疗结界",
	bar_hex = "妖术: %s",
	
	-- misc
	
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	brainwash_name = "Alarm f\195\188r Gehirnw\195\164schetotem",
	brainwash_desc = "Warnung, wenn Jin'do Gehirnw\195\164schetotem beschw\195\182rt.",

	healingward_name = "Alarm f\195\188r Heiltotem",
	healingward_desc = "Warnung, wenn Jin'do Heiltotem beschw\195\182rt.",

	curse_name = "Alarm f\195\188r Fluch",
	curse_desc = "Warnung, wenn Spieler Irrbilder von Jin'do bekommen.",
	
	hex_name = "Alarm f\195\188r Verhexung",
	hex_desc = "Warnung, wenn Spieler Verhexung bekommen.",

	puticon_name = "Schlachtzugsymbol auf die Spieler",
	puticon_desc = "Versetzt eine Schlachtzugsymbol auf der Spieler, der verflucht ist.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
	
	-- triggers
    trigger_engage      = "Welcome to da great show friends",
	trigger_brainWash = "von Gehirnw\195\164sche betroffen", -- Jin'do the Hexxer casts Summon Brain Wash Totem. stupid workaround
	trigger_healing = "Jin'do the Hexxer wirkt M\195\164chtiger Heilungszauberschutz.", -- NOTHING to detect this totem spawn in combatlog. Not even mana usage from the boss.
	trigger_curseYou = "Ihr seid von Irrbilder von Jin'do betroffen.",
	trigger_curseOther = "(.+) ist von Irrbilder von Jin'do betroffen.",
	trigger_hexYou = "Ihr seid von Verhexung betroffen.",
	trigger_hexOther = "(.+) ist von Verhexung betroffen.",
	trigger_hexYouGone = "'Verhexung' schwindet von Euch.",
	trigger_hexOtherGone = "Verhexung schwindet von (.+).",
	trigger_bossDeath = "Jin'do the Hexxer stirbt.",
	trigger_brainWashDeath = "Brain Wash Totem stirbt.",
	trigger_healingDeath = "Powerful Healing Ward stirbt.",
	
	-- messagesmsg_brainWash = "Gehirnw\195\164schetotem!",
	msg_healing = "M\195\164chtiger Heilungszauberschutz!",
	msg_curseWhisper = "Du bist verflucht! T\195\182te die Schemengestalten!",
	msg_curseOther = "%s ist verflucht!",
	msg_hex = "%s ist verhext! Entfernt es!",
	
	-- bars
	bar_brainWash = "Gehirnw\195\164schetotem",
	bar_healing = "M\195\164chtiger Heilungszauberschutz",
    bar_brainWashNext = "Nächstes Gehirnw\195\164schetotem",
	bar_healingNext = "Nächster M\195\164chtiger Heilungszauberschutz",
	bar_hex = "Verhexung: %s",
	
	-- misc
		
} end )
