------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.gluth
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Gluth",

	-- commands
	fear_cmd = "fear",
	fear_name = "群体恐惧警报",
	fear_desc = "群体恐惧术的警报",

	frenzy_cmd = "frenzy",
	frenzy_name = "狂暴警报",
	frenzy_desc = "狂暴的警报",

	enrage_cmd = "enrage",
	enrage_name = "狂暴计时",
	enrage_desc = "狂暴的警报",

	decimate_cmd = "decimate",
	decimate_name = "Decimate Alert",
	decimate_desc = "Warn for Decimate",

	zombies_cmd = "zombies",
	zombies_name = "僵尸刷新",
	zombies_desc = "显示僵尸刷新计时",
	
	-- triggers
	trigger_berserk = "获得了狂暴的效果",
	trigger_fear = "受到了恐惧怒吼效果的影响。",
	trigger_engage = "devours all nearby zombies!",
    trigger_frenzyGain1 = "古鲁斯获得了疯狂的效果。",
	trigger_frenzyGain2 = "Gluth goes into a frenzy!",
	trigger_frenzyGone = "疯狂效果从古鲁斯身上消失。",
	
	-- messages
	msg_fearSoon = "5 秒后 AoE恐惧!",
	msg_fearNow = "AoE 恐惧警报 - 20 秒后下一个!",
	msg_enrage = "狂暴!",
	msg_enrage90 = "狂暴 90 秒",
	msg_enrage30 = "狂暴 30 秒",
	msg_enrage10 = "狂暴 10 秒",

	msg_engage = "古鲁斯相遇! ~1:45 秒后残杀!",
	msg_decimateSoon = "马上残杀!",
    msg_frenzy = "疯狂! 马上凝神!",
	
	-- bars
	bar_decimate = "残杀僵尸",
	bar_zombie = "下一次僵尸 - %d",

	bar_fear = "AoE 恐惧",
	bar_frenzy = "疯狂",
    bar_frenzyNext = "下次疯狂",
	bar_enrage = "狂暴",
	
	-- misc
	
} end )
