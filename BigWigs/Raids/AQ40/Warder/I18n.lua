------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq40.warder
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Warder",

	-- commands
	fear_cmd = "fear",
	fear_name = "恐惧时间",
	fear_desc = "显示恐惧CD",

	silence_cmd = "silence",
	silence_name = "沉默时间",
	silence_desc = "显示沉默CD",

	roots_cmd = "roots",
	roots_name = "定身时间",
	roots_desc = "显示定身CD",

	dust_cmd = "dust",
	dust_name = "尘雾之云时间",
	dust_desc = "显示尘雾之云CD",

	warnings_cmd = "warnings",
	warnings_name = "警告消息",
	warnings_desc = "警报当前小怪显示当前的2个能力",

	-- trigger
	trigger_fear = "阿努比萨斯守望者开始施放恐惧术。",
	trigger_silence = "阿努比萨斯守望者开始施放沉默。",
	trigger_roots = "阿努比萨斯守望者开始施放纠缠根须。",
	trigger_dust = "阿努比萨斯守望者开始施展尘雾之云。",
	
	-- bars
	bar_fear = "恐惧!",
	bar_possibleFear = "可能恐惧",
	bar_silence = "沉默!",
	bar_possibleSilence = "可能沉默",
	bar_roots = "定身!",
	bar_possibleRoots = "可能定身",
	bar_dust = "尘雾之云!",
	bar_possibleDust = "可能尘雾之云",
	
	-- messages
	msg_dust = "尘雾之云",
	msg_rootsFear = "(定身或恐惧)",
	msg_fear = "恐惧",
	msg_silenceDust = "(沉默或尘雾之云)",
	msg_Roots = "定身",
	msg_silenceDust2 = "(沉默或尘雾之云)",
	msg_silence = "沉默",
	msg_rootsFear2 = "(定身或恐惧)",
	
	-- misc
	
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	--fear_cmd = "fear",
	fear_name = "Furcht",
	fear_desc = "Zeige Furchttimer",

	--silence_cmd = "silence",
	silence_name = "Stille",
	silence_desc = "Zeige Stilletimer",

	--roots_cmd = "roots",
	roots_name = "Wurzeln",
	roots_desc = "Zeige Wurzelntimer",

	--dust_cmd = "dust",
	dust_name = "Dust Cloud timer",
	dust_desc = "Shows Dust Cloud cd",

	--warnings_cmd = "warnings",
	warnings_name = "Warnungen",
	warnings_desc = "Warnt vor den zwei Fähigkeiten die der Gegner hat.",

	-- trigger
	trigger_fear = "Anubisath Warder begins to cast Fear.",
	trigger_silence = "Anubisath Warder begins to cast Silence.",
	trigger_roots = "Anubisath Warder begins to cast Entangling Roots.",
	trigger_dust = "Anubisath Warder begins to perform Dust Cloud.",
	
	-- bars
	bar_fear = "Furcht!",
	bar_possibleFear = "Mögliche Furcht",
	bar_silence = "Stille!",
	bar_possibleSilence = "Mögliche Stille",
	bar_roots = "Wurzeln!",
	bar_possibleRoots = "Mögliches Wurzeln",
	bar_dust = "Dust Cloud!",
	bar_possibleDust = "Possible Dust Cloud",
	
	-- messages
	msg_dust = "Dust Cloud",
	msg_rootsFear = "(Wurnzeln oder Furcht)",
	msg_fear = "Furcht",
	msg_silenceDust = "(Stille oder Dust Cloud)",
	msg_Roots = "Wurzeln",
	msg_silenceDust2 = "(Stille oder Dust Cloud)",
	msg_silence = "Stille",
	msg_rootsFear2 = "(Wurzeln oder Furcht)",
	
	-- misc
	
} end )

