------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.thaddius
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Thaddius",

	-- commands
	enrage_cmd = "enrage",
	enrage_name = "激怒警报",
	enrage_desc = "激怒 警报",

	phase_cmd = "phase",
	phase_name = "阶段警报",
	phase_desc = "阶段转换警报",

	polarity_cmd = "polarity",
	polarity_name = "极性转化警报",
	polarity_desc = "极性转化的警报",

	power_cmd = "power",
	power_name = "能量涌动警报",
	power_desc = "斯塔拉格的能量涌动警报",

	adddeath_cmd = "adddeath",
	adddeath_name = "小怪死亡警报",
	adddeath_desc = "当小怪死亡时警报.",

	charge_cmd = "charge",
	charge_name = "能量电荷改变警报",
	charge_desc = "当你的正能量电荷/负能量电荷改变时警报.",

	throw_cmd = "throw",
	throw_name = "平台投掷互换警报",
	throw_desc = "警报当坦克的平台互换时.",

	-- triggers
	trigger_enrage = "%s goes into a berserker rage!",
	trigger_engage1 = "Stalagg crush you!",
	trigger_engage2 = "Feed you to master!",
	trigger_phase2_1 = "EAT YOUR BONES",
	trigger_phase2_2 = "BREAK YOU!",
	trigger_phase2_3 = "KILL!",
	trigger_addDeath1 = "No... more... Feugen...",
	trigger_addDeath2 = "Master save me...",
	trigger_polarityShift = "Now YOU feel pain!",
	trigger_polarityShiftCast = "泰迪斯开始施放极性转化",
	--trigger_charge = "You are afflicted by (%w+) Charge.",
	trigger_stalagg = "斯塔拉格获得了能量涌动的效果。",

	-- messages
	msg_enrage = "激怒!",
	msg_phase1 = "泰迪斯阶段 1",
	msg_phase2 = "泰迪斯阶段 2, 激怒 5 分钟后!",
	msg_bossActive = "泰迪斯来临 10-20秒!",
	msg_polarityShiftNow = "泰迪斯开始施放极性转化! - 检查你的Debuff!",
	msg_polarityShift3 = "3 秒后极性转化!",
	msg_positiveCharge = "你是正电荷！",
	msg_negativeCharge = "你是负电荷！",
	msg_noChange = "你的电荷没有改变！",
	msg_enrage3m = "激怒 3 分钟",
	msg_enrage90 = "激怒 90 秒",
	msg_enrage60 = "激怒 60 秒",
	msg_enrage30 = "激怒 30 秒",
	msg_enrage10 = "激怒 10 秒",
	msg_stalagg = "斯塔拉格能量涌动!",
	msg_throw = "投掷大约 ~5 秒!",
	
	-- bars
	bar_polarityTick = "极性记号",
	bar_enrage = "激怒",
	bar_powerSurge = "能量涌动",
	bar_throw = "投掷",
	bar_polarityShift = "极性转化",
	
	-- misc
	misc_positiveCharge = "Spell_ChargePositive",
	misc_negativeCharge = "Spell_ChargeNegative",

} end )