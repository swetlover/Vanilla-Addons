------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.hakkar
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Hakkar",
	
	-- commands
	siphon_cmd = "siphon",
	siphon_name = "血液虹吸",
	siphon_desc = "显示条, 哈卡血液虹吸的报警.",

	enrage_cmd = "enrage",
	enrage_name = "激怒",
	enrage_desc = "让你知道10分钟后激怒!",

	mc_cmd = "mc",
	mc_name = "精神控制",
	mc_desc = "精神控制的警报.",
	
	aspectjeklik_cmd = "aspectjeklik",
	aspectjeklik_name = "耶克里克的守护",
	aspectjeklik_desc = "对于额外的能力哈卡收益警告 当女祭司jeklik还活着.",
	
	aspectvenoxis_cmd = "aspectvenoxis",
	aspectvenoxis_name = "温诺希斯的守护",
	aspectvenoxis_desc = "对于额外的能力哈卡收益警告.",
	
	aspectmarli_cmd = "aspectmarli",
	aspectmarli_name = "玛尔里的守护",
	aspectmarli_desc = "对于额外的能力哈卡收益警告.",
	
	aspectthekal_cmd = "aspectthekal",
	aspectthekal_name = "塞卡尔的守护",
	aspectthekal_desc = "对于额外的能力哈卡收益警告.",

	aspectarlokk_cmd = "aspectarlokk",
	aspectarlokk_name = "娅尔罗的守护",
	aspectarlokk_desc = "对于额外的能力哈卡收益警告.",
	
	puticon_cmd = "puticon",
	puticon_name = "精神控制团队图标",
	puticon_desc = "精神控制的团队图标.\n\n(需要A或L)",
	
	-- triggers
	trigger_engage = "FACE THE WRATH OF THE SOULFLAYER!",
	trigger_siphon = "哈卡获得了血液虹吸的效果。",
	trigger_poisonousBlood = "你受到了酸性血液效果的影响。",
	trigger_mindControlYou = "你受到了疯狂效果的影响。",
	trigger_mindControlOther = "(.+)受到了疯狂效果的影响。",
	trigger_flee = "Fleeing will do you no good, mortals!",
	trigger_aspectOfThekal = "哈卡获得了塞卡尔的守护的效果。",
	trigger_aspectOfThekalGone = "塞卡尔的守护效果从哈卡身上消失。",
	trigger_aspectOfMarliYou = "你受到了玛尔里的守护效果的影响。",
	trigger_aspectOfMarliYouImmune = "哈卡的玛尔里的守护施放失败。你对此免疫。",
	trigger_aspectOfMarliOther = "(.+)受到了玛尔里的守护效果的影响。",
	trigger_aspectOfMarliOtherImmune = "哈卡的玛尔里的守护施放失败。(.+)对此免疫。",
	trigger_aspectOfMarliGeneralAvoid = "哈卡的玛尔里的守护",
	trigger_aspectOfJeklikYou = "你受到了耶克里克的守护效果的影响。",
	trigger_aspectOfJeklikYouImmune = "哈卡的耶克里克的守护施放失败。你对此免疫。",
	trigger_aspectOfJeklikOther = "(.+)受到了耶克里克的守护效果的影响。",
	trigger_aspectOfJeklikOtherImmune = "哈卡的耶克里克的守护施放失败。(.+)对此免疫。",
	trigger_aspectOfJeklikGeneralAvoid = "哈卡的耶克里克的守护",
	trigger_aspectOfArlokkYou = "你受到了娅尔罗的守护效果的影响。",
	trigger_aspectOfArlokkYouImmune = "哈卡的娅尔罗的守护施放失败。你对此免疫。",
	trigger_aspectOfArlokkOther = "(.+)受到了娅尔罗的守护效果的影响。",
	trigger_aspectOfArlokkOtherImmune = "哈卡的娅尔罗的守护施放失败。(.+)对此免疫。",
	trigger_aspectOfArlokkGeneralAvoid = "哈卡的娅尔罗的守护",
	trigger_aspectOfVenoxisYou = "哈卡的温诺希斯的守护击中你造成",
	trigger_aspectOfVenoxisYouResist = "哈卡的温诺希斯的守护被抵抗了。",
	trigger_aspectOfVenoxisOther = "哈卡的温诺希斯的守护击中",
	trigger_aspectOfVenoxisOtherResist = "哈卡的温诺希斯的守护被(.+)抵抗了。",
	
	-- messages
	msg_siphonSoon = "血液虹吸 %d 秒!",
	msg_siphonNow = "血液虹吸 - 下个 90 秒!",
	msg_enrage5m = "激怒 5 分钟!",
	msg_enrage1m = "激怒 1 分钟!",
	msg_enrageSeconds = "激怒 %d 秒!",

	msg_mindControlOther = "%s 被精神控制!",
	msg_mindControlYou = "你被精神控制!",
	msg_aspectOfThekal = "疯狂! 立刻凝神!",
	
	-- bars
	bar_mindControl = "精神控制: %s",
	bar_firstMindControl = "第一次精神控制",
	bar_nextMindControl = "下次精神控制",
	bar_enrage = "激怒",
	bar_siphon = "血液虹吸",
	bar_aspectOfThekalNext = "下次疯狂",
	bar_aspectOfThekal = "疯狂 - 塞卡尔的守护",
	bar_aspectOfMarliNext = "下次眩晕",
	bar_aspectOfMarliDebuff = "眩晕: %s - 玛尔里的守护",
	bar_aspectOfJeklikNext = "下次沉默",
	bar_aspectOfJeklikDebuff = "沉默 - 耶克里克的守护",
	bar_aspectOfArlokkNext = "下次消失",
	bar_aspectOfArlokkDebuff = "消失: %s - 娅尔罗的守护",
	bar_aspectOfVenoxisNext = "下次中毒",
	bar_aspectOfVenoxisDebuff = "中毒 - 温诺希斯的守护",
	
	-- misc

} end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	siphon_name = "Blood Siphon",
	siphon_desc = "Shows bars, warnings and timers for Hakkar's Blood Siphon.",

	enrage_name = "Enrage",
	enrage_desc = "Lets you know when the 10 minutes are up!",

	mc_name = "Mind Control",
	mc_desc = "Alert when players have Cause Insanity.",
	
	aspectjeklik_name = "Aspect of Jeklik",
	aspectjeklik_desc = "Warnings for the extra ability Hakkar gains when High Priestess Jeklik is still alive.",
	
	aspectvenoxis_name = "Aspect of Venoxis",
	aspectvenoxis_desc = "Warnings for the extra ability Hakkar gains when High Priest Venoxis is still alive.",
	
	aspectmarli_name = "Aspect of Mar'li",
	aspectmarli_desc = "Warnings for the extra ability Hakkar gains when High Priestess Mar'li is still alive.",
	
	aspectthekal_name = "Aspect of Thekal",
	aspectthekal_desc = "Warnings for the extra ability Hakkar gains when High Priest Thekal is still alive.",

	aspectarlokk_name = "Aspect of Arlokk",
	aspectarlokk_desc = "Warnings for the extra ability Hakkar gains when High Priestess Arlokk is still alive.",
	
	puticon_name = "Raid icon on MCed players",
	puticon_desc = "Place a raid icon on the player with Cause Insanity.\n\n(Requires assistant or higher)",
	
	-- triggers
	trigger_engage = "FACE THE WRATH OF THE SOULFLAYER!",
	trigger_siphon = "Hakkar gains Blood Siphon.",
	trigger_poisonousBlood = "You are afflicted by Poisonous Blood.",
	trigger_mindControlYou = "You are afflicted by Cause Insanity.",
	trigger_mindControlOther = "(.+) is afflicted by Cause Insanity.",
	trigger_flee = "Fleeing will do you no good, mortals!",
	trigger_aspectOfThekal = "Hakkar gains Aspect of Thekal.",
	trigger_aspectOfThekalGone = "Aspect of Thekal fades from Hakkar.",
	trigger_aspectOfMarliYou = "You are afflicted by Aspect of Mar'li.",
	trigger_aspectOfMarliYouImmune = "Hakkar 's Aspect of Mar'li failed. You are immune.",
	trigger_aspectOfMarliOther = "(.+) is afflicted by Aspect of Mar'li.",
	trigger_aspectOfMarliOtherImmune = "Hakkar 's Aspect of Mar'li fails. (.+) is immune.",
	trigger_aspectOfMarliGeneralAvoid = "Hakkar 's Aspect of Mar'li",
	trigger_aspectOfJeklikYou = "You are afflicted by Aspect of Jeklik.",
	trigger_aspectOfJeklikYouImmune = "Hakkar 's Aspect of Jeklik failed. You are immune.",
	trigger_aspectOfJeklikOther = "(.+) is afflicted by Aspect of Jeklik.",
	trigger_aspectOfJeklikOtherImmune = "Hakkar 's Aspect of Jeklik fails. (.+) is immune.",
	trigger_aspectOfJeklikGeneralAvoid = "Hakkar 's Aspect of Jeklik",
	trigger_aspectOfArlokkYou = "You are afflicted by Aspect of Arlokk.",
	trigger_aspectOfArlokkYouImmune = "Hakkar 's Aspect of Arlokk failed. You are immune.",
	trigger_aspectOfArlokkOther = "(.+) is afflicted by Aspect of Arlokk.",
	trigger_aspectOfArlokkOtherImmune = "Hakkar 's Aspect of Arlokk fails. (.+) is immune.",
	trigger_aspectOfArlokkGeneralAvoid = "Hakkar 's Aspect of Arlokk",
	trigger_aspectOfVenoxisYou = "Hakkar 's Aspect of Venoxis hits you for",
	trigger_aspectOfVenoxisYouResist = "Hakkar 's Aspect of Venoxis was resisted.",
	trigger_aspectOfVenoxisOther = "Hakkar 's Aspect of Venoxis hits",
	trigger_aspectOfVenoxisOtherResist = "Hakkar 's Aspect of Venoxis was resisted by",
	
	-- messages
	msg_siphonSoon = "Blood Siphon in %d seconds!",
	msg_siphonNow = "Blood Siphon - next one in 90 seconds!",
	msg_enrage5m = "Enrage in 5 minutes!",
	msg_enrage1m = "Enrage in 1 minute!",
	msg_enrageSeconds = "Enrage in %d seconds!",

	msg_mindControlOther = "%s is mindcontrolled!",
	msg_mindControlYou = "You are mindcontrolled!",
	
	msg_aspectOfThekal = "Frenzy! Tranq now!",
	
	-- bars
	bar_mindControl = "MC: %s",
	bar_firstMindControl = "First MC",
	bar_nextMindControl = "Next MC",
	bar_enrage = "Enrage",
	bar_siphon = "Blood Siphon",
	bar_aspectOfThekalNext = "Next Frenzy",
	bar_aspectOfThekal = "Frenzy - Aspect of Thekal",
	bar_aspectOfMarliNext = "Next Stun",
	bar_aspectOfMarliDebuff = "Stun: %s - Aspect of Mar'li",
	bar_aspectOfJeklikNext = "Next Silence",
	bar_aspectOfJeklikDebuff = "Silence - Aspect of Jeklik",
	bar_aspectOfArlokkNext = "Next Vanish",
	bar_aspectOfArlokkDebuff = "Vanish: %s - Aspect of Arlokk",
	bar_aspectOfVenoxisNext = "Next Poison",
	bar_aspectOfVenoxisDebuff = "Poison - Aspect of Venoxis",
	
	-- misc

} end)
