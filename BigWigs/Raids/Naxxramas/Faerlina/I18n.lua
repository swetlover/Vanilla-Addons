------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.faerlina
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Faerlina",

	-- commands
	silence_cmd = "silence",
	silence_name = "沉默警报",
	silence_desc = "沉默的警报",

	enrage_cmd = "enrage",
	enrage_name = "激怒警报",
	enrage_desc = "激怒的警报",

	rain_cmd = "rain",
	rain_name = "火焰之雨警报",
	rain_desc = "当你受到火焰之雨时警报",
	
	-- triggers
	trigger_engage1 = "Kneel before me, worm!",
	trigger_engage2 = "Slay them in the master's name!",
	trigger_engage3 = "You cannot hide from me!",
	trigger_engage4 = "Run while you still can!",

	trigger_silence = "黑女巫法琳娜受到了黑女巫的拥抱效果的影响。", -- EDITED it affects her too.
	trigger_enrage = "黑女巫法琳娜获得了激怒的效果。",
	trigger_rainGain = "你受到了火焰之雨效果的影响",
	trigger_rainGone = "火焰之雨",
	trigger_rainDamage = "你受到(%d+)点(.+)伤害（黑女巫法琳娜的火焰之雨）。",
	
	-- messages
	msg_engage = "黑女巫法琳娜激怒结束, 60秒后再次激怒!",
	msg_enrage15 = "15秒后狂怒!",
	msg_enrageNow = "狂怒!",
	msg_enrageRemoved = "激怒消失! %d秒后下一次激怒!", -- added
	msg_silenceDelay = "沉默! 激怒推迟!",
	msg_silenceNoDelay = "沉默!",
	msg_silence5 = "沉默结束 5 秒",
	msg_rain = "远离火雨!",
	
	-- bars
	bar_enrage = "激怒",
	bar_silence = "沉默",
	
	-- misc
	
} end )
