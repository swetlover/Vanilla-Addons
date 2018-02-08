------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.gothik
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Gothik",

	-- command
	room_cmd = "room",
	room_name = "进入房间警告",
	room_desc = "警告来到戈提克的房间",

	add_cmd = "add",
	add_name = "增援警报",
	add_desc = "增援的警报",

	adddeath_cmd = "adddeath",
	adddeath_name = "小怪计时及死亡通告",
	adddeath_desc = "小怪计时及死亡通告.",

	-- triggers
	trigger_victory = "I... am... undone.",
	trigger_engage1 = "Brazenly you have disregarded powers beyond your understanding.",
	trigger_engage2 = "Teamanare shi rikk mannor rikk lok karkun",
	trigger_inRoom = "I have waited long enough! Now, you face the harvester of souls.",
	
	-- messages
	msg_engage = "戈提克的大波小怪来势汹汹! 4:35后进入房间.",
	msg_riderDeath = "鬼灵骑兵!",
	msg_deathKnightDeath = "鬼灵死亡骑士!",
	msg_inRoom3m = "3 分钟后戈提克进入房间",
	msg_inRoom90 = "90 秒后戈提克进入房间",
	msg_inRoom60 = "60 秒后戈提克进入房间",
	msg_inRoom30 = "30 秒后戈提克进入房间",
	msg_inRoom10 = "10 秒后戈提克进入房间",
	msg_wave = "%d/22: ", -- its only 22 waves not 26
	msg_trainee = "3秒后学徒出现",
	msg_deathKnight = "3秒后死亡骑士出现",
	msg_rider = "3秒后骑兵出现",
	msg_inRoom = "戈提克进入房间!",
	
	-- bars
	bar_trainee = "学徒 - %d",
	bar_deathKnight = "死亡骑士 - %d",
	bar_rider = "骑兵 - %d",
	bar_inRoom = "进入房间",
	
	-- misc
	misc_riderName = "无情的骑兵",
	misc_spectralRiderName = "鬼灵骑兵",
	misc_deathKnightName = "无情的死亡骑士",
	misc_spectralDeathKnightName = "鬼灵死亡骑士",
	misc_traineeName = "无情的训练师",
	misc_spectralTraineeName = "鬼灵训练师",

} end )