------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.bwl.broodlord
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Broodlord",

	-- commands
	ms_cmd = "ms",
	ms_name = "致死打击",
	ms_desc = "警告当有致死打击.",
	bw_cmd = "bw",
	bw_name = "冲击波",
	bw_desc = "显示一个可能冲击波冷却的条.\n\n(免责声明: 这种情况从8秒到15秒不等. 安全选择最短区间.)",

	-- triggers
	trigger_engage = "None of your kind should be here",
	trigger_mortalStrike = "^(.+)(.+)了致死打击效果的影响",
	trigger_blastWave = "^(.+)(.+)了冲击波效果的影响",
	trigger_deathYou = "你死了。",
	trigger_deathOther = "(.+)死亡了。",

	-- messages
	msg_mortalStrikeYou = "你中了致死打击!",
	msg_mortalStrikeOther = "致死打击 %s!",
	msg_blastWave = "马上冲击波!",

	-- bars
	bar_mortalStrike = "致死打击: %s",
	bar_blastWave = "冲击波",

	-- misc
	misc_you = "你",
	misc_are = "受到",
}
end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	ms_name = "T\195\182dlicher Sto\195\159",
	ms_desc = "Warnung wenn ein Spieler von Tödlicher Sto\195\159 betroffen ist und startet einen anklickbaren Balken für eine einfache Auswahl.",
	bw_name = "Druckwelle",
	bw_desc = "Zeigt einen Balken mit der möglichen Druckwellenabklingzeit.\n\n(Hinweis: Diese variiert von 8 bis 15 Sekunden. Zur Sicherheit wurde der kürzeste Intervall gewählt.)",

	-- triggers
	trigger_engage = "Euresgleichen sollte nicht hier sein!",
	trigger_mortalStrike = "^(.+) (.+) von T\195\182dlicher Sto\195\159 betroffen",
	trigger_blastWave = "^(.+) (.+) von Druckwelle betroffen",
	trigger_deathYou = "Ihr sterbt.",
	trigger_deathOther = "(.+) stirbt.",

	-- messages
	msg_mortalStrikeYou = "T\195\182dlicher Sto\195\159 auf Dir!",
	msg_mortalStrikeOther = "T\195\182dlicher Sto\195\159 auf %s!",
	msg_blastWave = "Druckwelle bald!",

	-- bars
	bar_mortalStrike = "T\195\182dlicher Sto\195\159: %s",
	bar_blastWave = "Druckwelle",

	-- misc
	misc_you = "Ihr",
	misc_are = "seid",
}
end)
