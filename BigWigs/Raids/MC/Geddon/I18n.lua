------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.mc.geddon
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Baron",
	
	-- commands
	service_cmd = "service",
	service_name = "最后服务计时条",
	service_desc = "迦顿的最后服务计时器.",

	inferno_cmd = "inferno",
	inferno_name = "地狱火警报",
	inferno_desc = "迦顿男爵的地狱火计时器.",

	bombtimer_cmd = "bombtimer",
	bombtimer_name = "活化炸弹时间",
	bombtimer_desc = "显示一个8秒的条，炸弹的目标.",

	bomb_cmd = "bomb",
	bomb_name = "活化炸弹警报",
	bomb_desc = "当玩家是炸弹时警告",
	
	mana_cmd = "manaignite",
	mana_name = "法力引燃警报",
	mana_desc = "显示点燃法力计时器并宣布驱散它",

	icon_cmd = "icon",
	icon_name = "团队炸弹图标",
	icon_desc = "把骷髅图标放在炸弹的人身上. (需要L或A)",

	announce_cmd = "whispers",
	announce_name = "密语炸弹人玩家",
	announce_desc = "发送一个密语的玩家被活体炸弹. (需要L或A)",
	
	-- triggers
	trigger_inferno = "获得了地狱火的效果。",
	trigger_service = "performs one last service for Ragnaros",
	trigger_bombYou = "你受到了活化炸弹效果的影响。",
	trigger_bombOther = "(.*)受到了活化炸弹效果的影响。",
	trigger_bombYouGone = "活化炸弹效果从你身上消失了。",
	trigger_bombOtherGone = "活化炸弹效果从(.*)身上消失。",
	trigger_igniteManaHit = "受到了点燃法力的影响",
	trigger_igniteManaResist = "点燃法力被抵抗了",
	trigger_deathYou = "你死了。",
	trigger_deathOther = "(.*)死亡了。",
	
	-- messages
	msg_bombWhisper = "你是炸弹人!",
	msg_bombYou = "你是炸弹人!",
	msg_bombOther = "%s 是炸弹人!",
	msg_infernoSoon = "3 秒后地狱火!",
	msg_service = "最后服务! 男爵在8秒后爆炸!",
	msg_infernoNow = "地狱火8秒!",
	msg_ignite = "现在驱散!",
	
	-- bars
	bar_bomb = "活化炸弹: %s",
	bar_infernoNext = "下次地狱火",
	bar_infernoChannel = "地狱火",
	bar_service = "最后服务",
	bar_ignite = "可能点燃法力",
	
	-- misc
	
} end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	service_name = "Alarm für Letzten Dienst",
	service_desc = "Timer Balken für Baron Geddons Letzten Dienst.",

	inferno_name = "Alarm für Inferno",
	inferno_desc = "Timer Balken für Baron Geddons Inferno.",

	bombtimer_name = "Timer für Lebende Bombe",
	bombtimer_desc = "Zeigt einen 8 Sekunden Timer für die Explosion der Lebenden Bombe an.",

	bomb_name = "Alarm für Lebende Bombe",
	bomb_desc = "Warnen, wenn andere Spieler die Bombe sind.",
	
	mana_name = "Alarm für Mana entzünden",
	mana_desc = "Zeige Timer für Mana entzünden und verkünde Magie entfernen",

	icon_name = "Schlachtzugssymbole auf die Bombe",
	icon_desc = "Markiert den Spieler, der die Bombe ist.\n\n(Benötigt Schlachtzugleiter oder Assistent).",

	announce_name = "Der Bombe flüstern",
	announce_desc = "Dem Spieler flüstern, wenn er die Bombe ist.\n\n(Benötigt Schlachtzugleiter oder Assistent).",
	
	-- triggers
	trigger_inferno = "ist von Inferno betroffen",
	trigger_service = "performs one last service for Ragnaros",
	trigger_bombYou = "Ihr seid von Lebende Bombe betroffen.",
	trigger_bombOther = "(.*) ist von Lebende Bombe betroffen.",
	trigger_bombYouGone = "'Lebende Bombe\' schwindet von Euch.",
	trigger_bombOtherGone = "Lebende Bombe schwindet von (.*).",
	trigger_igniteManaHit = "von Mana entzünden betroffen",
	trigger_igniteManaResist = "Mana entzünden(.+)widerstanden",
	trigger_deathYou = "Ihr sterbt.",
	trigger_deathOther = "(.*) stirbt",
	
	-- messages
	msg_bombWhisper = "Du bist die Bombe!",
	msg_bombYou = "Du bist die Bombe!",
	msg_bombOther = "%s ist die Bombe!",
	msg_infernoSoon = "3 Sekunden bis Inferno!",
	msg_service = "Letzter Dienst! Baron Geddon explodiert in 8 Sekunden!",
	msg_infernoNow = "Inferno 8 Sekunden lang!",
	msg_ignite = "Entferne Magie JETZT!",
	
	-- bars
	bar_bomb = "Lebende Bombe: %s",
	bar_infernoNext = "Nächstes Inferno",
	bar_infernoChannel = "Inferno",
	bar_service = "Letzter Dienst.",
	bar_ignite = "Mögliches Mana entzünden",
	
	-- misc
	
} end)
