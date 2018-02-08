------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.bwl.vaelastrasz
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Vaelastrasz",

	-- commands
	start_cmd = "start",
	start_name = "开始",
	start_desc = "开始一个条，估计战斗的开始.",
	flamebreath_cmd = "flamebreath",
	flamebreath_name = "火息术",
	flamebreath_desc = "警报正在施放火息术.",
	adrenaline_cmd = "adrenaline",
	adrenaline_name = "燃烧刺激",
	adrenaline_desc = "通告中了燃烧刺激的玩家.",
	whisper_cmd = "whisper",
	whisper_name = "密语",
	whisper_desc = "密语玩家，燃烧刺激，告诉他们走开.",
	tankburn_cmd = "tankburn",
	tankburn_name = "坦克燃烧",
	tankburn_desc = "显示一个条，将适用于boss的目标.",
	icon_cmd = "icon",
	icon_name = "团队图标",
	icon_desc = "标记玩家燃烧刺激更容易.\n\n(需要L或A)",

	-- triggers
	trigger_adrenaline = "^(.+)(.+)了燃烧刺激效果的影响。",
	trigger_flamebreath = "堕落的瓦拉斯塔兹开始施放火息术。",
	trigger_yell1 = "Too late, friends",
	trigger_yell2 = "I beg you, mortals",
	trigger_yell3 = "FLAME! DEATH! DESTRUCTION!",
	trigger_deathYou = "你死了。",
	trigger_deathOther = "(.+)死亡了。",

	-- messages
	msg_breath = "施放火息术!",
	msg_tankBurnSoon = "坦克马上燃烧刺激 5 秒!",
	msg_adrenaline = "%s 中了燃烧刺激!",
	msg_adrenalineYou = "你中了燃烧刺激! 快跑!",

	-- bars
	bar_engage = "开始",
	bar_tankburn = "坦克燃烧",
	bar_adrenaline = "燃烧刺激: %s",
	bar_breath = "火息术",

	-- misc
	misc_are = "受到",
}
end)

L:RegisterTranslations("deDE", function() return {
	cmd = "Vaelastrasz",
	trigger_adrenaline = "^(.+) (.+) von Brennendes Adrenalin betroffen\.",
	trigger_flamebreath = "Vaelastrasz the Corrupt beginnt Flammenatem zu wirken\.",
	trigger_yell1 = "Too late, friends",
	trigger_yell2 = "I beg you, mortals",
	trigger_yell3 = "FLAME! DEATH! DESTRUCTION!",
	bar_engage = "Start",
	bar_tankburn = "Tank brennen",
	bar_adrenaline = "Brennendes Adrenalin: %s",
	bar_breath = "Flammenatem",
	msg_breath = "Wirkt Flammenatem!",
	msg_tankBurnSoon = "Brennendes Adrenalin am Tank in 5 Sekunden!",
	msg_adrenaline = "%s hat Brennendes Adrenalin!",
	msg_adrenalineYou = "Sie haben Brennendes Adrenalin! Geh weg!",
	trigger_deathYou = "Du stirbst\.",
	trigger_deathOther = "(.+) stirbt\.",
	misc_are = "seid",
	start_cmd = "start",
	start_name = "Start",
	start_desc = "Startet eine Balken f\195\188r die Sch\195\164tzung der Beginn des Kampfes.",
	flamebreath_cmd = "flamebreath",
	flamebreath_name = "Flammenatem",
	flamebreath_desc = "Warnt, wenn Boss wirft Flammenatem.",
	adrenaline_cmd = "adrenaline",
	adrenaline_name = "Brennendes Adrenalin",
	adrenaline_desc = "Gibt bekannt, die Brennendes Adrenalin empfangen und startet einen anklickbaren Balken f\195\188r eine einfachere Auswahl.",
	whisper_cmd = "whisper",
	whisper_name = "Fl\195\188stern",
	whisper_desc = "Fl\195\188stern die Spieler mit Brennendes Adrenalin, ihnen zu sagen, sich zu entfernen.",
	tankburn_cmd = "tankburn",
	tankburn_name = "Tank brennen",
	tankburn_desc = "Zeigt eine Balken f\195\188r die Brennendes Adrenalin, die auf Bosses Ziel angewendet wird.",
	icon_cmd = "icon",
	icon_name = "Schlachtzugsymbol",
	icon_desc = "Markiert den Spieler mit Brennendes Adrenalin zur leichteren Lokalisierung.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
}
end)
