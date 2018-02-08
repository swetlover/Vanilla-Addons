------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.noth
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Noth",

	-- commands
	blink_cmd = "blink",
	blink_name = "闪现术警报",
	blink_desc = "闪现术的警报",

	teleport_cmd = "teleport",
	teleport_name = "传送警报",
	teleport_desc = "传送的警报",

	curse_cmd = "curse",
	curse_name = "诅咒警报",
	curse_desc = "诅咒的警报",

	wave_cmd = "wave",
	wave_name = "每一波战斗警报",
	wave_desc = "每一波战斗的警报",

	-- triggers
	trigger_engage1 = "Die, trespasser!",
	trigger_engage2 = "Glory to the master!",
	trigger_engage3 = "Your life is forfeit!",
	trigger_blink = "瘟疫者诺斯获得了闪现术的效果。",
    trigger_teleportToBalcony = "Noth the Plaguebringer teleports to the balcony above!",
    trigger_teleportToRoom = "Noth the Plaguebringer teleports back into the battle!",
	trigger_curse = "受到了瘟疫使者的诅咒效果的影响",
	
	-- messages
	msg_engage = "瘟疫者诺斯来势汹汹! 90秒后传送!",
	msg_blinkNow = "闪现!",
	msg_blink5 = "闪现 ~5 秒!",
	msg_blink10 = "闪现 ~10 秒!",
	msg_teleportNow = "传送! 他在阳台上!",
	msg_teleport10 = "传送 10 秒!",
	msg_teleport30 = "传送 30 秒!",
	msg_backNow = "他在 %d 秒后回到房间!",
	msg_back10 = "10 秒后回到房间!",
	msg_back30 = "30 秒后回到房间!",
	msg_curse = "诅咒! 下个大约 ~28 秒",
	msg_curse10 = "诅咒大约 ~10 秒",
	msg_wave2Soon = "第二波10秒后",
	msg_wave2Now = "第二波刷新!",
	
	-- bars
	bar_blink = "闪现",
	bar_teleport = "传送!",
	bar_back = "回到房间!",
	bar_wave1 = "第 1 波",
	bar_wave2 = "第 2 波",
	--bar_wave3 = "Wave 3",
	bar_curse = "下次诅咒",
	
	-- misc
	
} end )
