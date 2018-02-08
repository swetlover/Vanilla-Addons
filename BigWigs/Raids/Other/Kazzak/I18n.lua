------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.other.kazzak
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Kazzak",
	
	-- commands
	supreme_cmd = "supreme",
	supreme_name = "无敌警报",
	supreme_desc = "无敌模式警报.",

	voidbolt_cmd = "voidbolt",
	voidbolt_name = "虚空箭",
	voidbolt_desc = "显示虚空箭的施法.",

	corruptsoul_cmd = "corruptsoul",
	corruptsoul_name = "灵魂腐蚀",
	corruptsoul_desc = "当boss从随机死亡中恢复时警告.",

	markofkazzak_cmd = "markofkazzak",
	markofkazzak_name = "卡扎克印记",
	markofkazzak_desc = "警报中了印记的人.",
	
	twistedreflection_cmd = "twistedreflection",
	twistedreflection_name = "扭曲反射",
	twistedreflection_desc = "当boss从随机死亡中恢复时警告.恢复25000血量",

	puticon_cmd = "puticon",
	puticon_name = "团队图标印记玩家",
	puticon_desc = "给中了印记的玩家团队图标.\n\n(Requires assistant or higher)",
	
	-- triggers
	trigger_engage1 = "All mortals will perish!",
	trigger_engage2 = "The Legion will conquer all!",
	trigger_markYouGain = "你受到了卡扎克的印记效果的影响。",
	trigger_markOtherGain = "(.*)受到了卡扎克的印记效果的影响。",
	trigger_markYouGone = "卡扎克的印记效果从你身上消失了。",
	trigger_markOtherGone = "卡扎克的印记效果从(.*)身上消失。",
	trigger_reflectionYouGain = "你受到了扭曲反射效果的影响。",
	trigger_reflectionOtherGain = "(.*)受到了扭曲反射效果的影响。",
	trigger_reflectionYouGone = "扭曲反射效果从你身上消失了。",
	trigger_reflectionOtherGone = "扭曲反射效果从(.*)身上消失。",
	trigger_deathYou = "你死了。",
	trigger_deathOther = "(.*)死亡了。",
	trigger_voidbolt = "卡扎克开始施放虚空箭。",
	trigger_attack1 = "卡扎克发起攻击",
	trigger_attack2 = "卡扎克没有击中",
	trigger_attack3 = "卡扎克击中",
	trigger_attack4 = "卡扎克的致命一击",
	trigger_enrage = "Lord Kazzak gains Berserk.",
	trigger_supreme = "Kazzak is supreme!",
	trigger_bosskill = "The Legion... will never... fall.",
	
	-- messages
	msg_engage = "卡扎克激怒! 3分钟后无敌!",
	msg_enrage = "卡扎克无敌!",
	msg_mark = "%s 中了印记! 驱散!",
	msg_reflection = "%s 是扭曲反射! 驱散!",
	msg_markYou = "你有印记! 不要浪费法力值!",
	msg_reflectionYou = "你有扭曲反射!",
	msg_corruptSoulOther = "%s 治疗了卡扎克!",
	msg_corruptSoulYou = "你治疗了卡扎克!",

	msg_supreme1min = "无敌模式 1 分钟!",
	msg_supreme30 = "无敌模式 30 秒!",
	msg_supreme10 = "无敌模式 10 秒!",
	
	-- bars
	bar_enrage = "无敌模式",
	bar_voidbolt = "虚空箭",
	bar_mark = "%s: 卡扎克印记",
	bar_reflection = "%s: 扭曲反射",
	
	-- misc
	
} end )
