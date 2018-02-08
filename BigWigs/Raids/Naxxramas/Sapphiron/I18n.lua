------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.sapphiron
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Sapphiron",

	-- commands
	deepbreath_cmd = "deepbreath",
	deepbreath_name = "深呼吸警报",
	deepbreath_desc = "当萨菲隆开始施放深呼吸时警报.",

	lifedrain_cmd = "lifedrain",
	lifedrain_name = "生命吸取",
	lifedrain_desc = "生命吸取的警报.",

	berserk_cmd = "berserk",
	berserk_name = "狂暴",
	berserk_desc = "狂暴警报.",

	icebolt_cmd = "icebolt",
	icebolt_name = "冰块通报",
	icebolt_desc = "当你成为一个冰块时警报.",

	-- triggers
	trigger_lifeDrain1 = "受到了生命吸取效果的影响",
	trigger_lifeDrain2 = "生命吸取被(.*)抵抗了",
	trigger_icebolt = "你受到了寒冰箭效果的影响",
	trigger_deepBreath = "%s takes in a deep breath...",
	
	-- messages
	msg_berserk10m = "10分钟后狂暴!",
	msg_berserk5m = "5分钟后狂暴!",
	msg_berserkSoon = "%s 秒后狂暴!",
	msg_engage = "萨菲隆相遇! 15分钟后狂暴!",
	msg_lifeDrainNow = "生命吸取! 下一个可能 ~24 秒!",
	msg_deepBreathSoon = "冰弹施放大约 ~23秒!",
	msg_deepBreathNow = "冰弹来临!",
	msg_IceBlockYell = "我变成了冰块!快躲到我后面!",
	
	-- bars
	bar_berserk = "狂暴",
	bar_lifeDrain = "生命吸取",
	bar_deepBreathCast = "冰弹施放",
	bar_deepBreath = "冰弹登陆!",
	
	-- misc
	
} end )
