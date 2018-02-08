------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq40.huhuran
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Huhuran",

	-- commands
	wyvern_cmd = "wyvern",
	wyvern_name = "毒性之箭警报",
	wyvern_desc = "毒性之箭警报",
	frenzy_cmd = "frenzy",
	frenzy_name = "狂乱警报",
	frenzy_desc = "狂乱警报",
	berserk_cmd = "berserk",
	berserk_name = "极度狂暴警报",
	berserk_desc = "极度狂暴警报",

	-- triggers
	trigger_frenzyGain = "哈霍兰公主获得了狂乱的效果。",
	trigger_frenzyGone = "狂乱效果从哈霍兰公主身上消失。",
	trigger_berserk = "Princess Huhuran goes into a berserk rage!",
	trigger_sting = "受到了致命剧毒效果的影响。",

	-- messages
	msg_frenzy = "狂乱 - 立刻宁神!",
	msg_berserk = "极度狂暴 - 治疗注意！",
	msg_berserkSoon = "即将极度狂暴 - 做好准备！",
	msg_sting = "毒性之箭 - 注意只给MT驱散！",
	msg_berserk60 = "狂暴 1 分钟!",
	msg_berserk30 = "狂暴 30 秒!",
	msg_berserk5 = "狂暴 5 秒!",

	-- bars
	bar_frenzy = "狂乱",
	bar_berserk = "狂暴",
	bar_sting = "可能毒性之箭",

	-- misc
}
end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	wyvern_name = "Stich des Flügeldrachen",
	wyvern_desc = "Warnung, wenn Huhuran Stich des Flügeldrachen wirkt.",
	frenzy_name = "Raserei",
	frenzy_desc = "Warnung, wenn Huhuran in Raserei gerät.",
	berserk_name = "Berserkerwut",
	berserk_desc = "Warnung, wenn Huhuran in Berserkerwut verfällt.",

	-- triggers
	trigger_frenzyGain = "Prinzessin Huhuran gerät in Raserei!", -- translation missing
	trigger_frenzyGone = "Wutanfall schwindet von Prinzessin Huhuran.",
	trigger_berserk = "Prinzession Huhuran verfällt in Berserkerwut!", -- translation missing
	trigger_sting = "von Stich des Flügeldrachen betroffen",

	-- messages
	msg_frenzy = "Frenzy - Tranq Shot!",
	msg_berserk = "Berserkerwut!",
	msg_berserkSoon = "Berserkerwut in Kürze!",
	msg_sting = "Stich des Flügeldrachen!",
	msg_berserk60 = "Berserkerwut in 1 Minute!",
	msg_berserk30 = "Berserkerwut in 30 Sekunden!",
	msg_berserk5 = "Berserkerwut in 5 Sekunden!",

	-- bars
	bar_frenzy = "Frenzy",
	bar_sting = "Möglicher Stich",
	bar_berserk = "Berserkerwut",

	-- misc
}
end)
