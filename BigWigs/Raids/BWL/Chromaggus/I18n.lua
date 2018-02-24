------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.bwl.chromaggus
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Chromaggus",

	-- commands
	enrage_cmd = "enrage",
	enrage_name = "激怒",
	enrage_desc = "20%生命激怒前发出警报.",

	frenzy_cmd = "frenzy",
	frenzy_name = "狂暴",
	frenzy_desc = "狂暴警报.",

	breath_cmd = "breath",
	breath_name = "吐息",
	breath_desc = "提醒吐息",
    
    breathcd_cmd = "breathcd",
    breathcd_name = "吐息倒计时",
    breathcd_desc = "呼吸的语音警告.",
            
	vulnerability_cmd = "vulnerability",
	vulnerability_name = "弱点警报(无效)",
	vulnerability_desc = "克洛玛古斯弱点改变时发出警报.",
	
	-- triggers
	trigger_breath = "克洛玛古斯开始施放(.+)。",
	trigger_vulnerability_direct_crit = "[^%s]+的([^%s]+)致命一击对克洛玛古斯造成(%d+)点([^%s]+)伤害。[%(]([%d])", -- [Fashu's] [Firebolt] [hits] Battleguard Sartura for [44] [Fire] damage. ([14] resisted)
 	trigger_vulnerability_direct_hit = "[^%s]+的([^%s]+)击中克洛玛古斯造成(%d+)点([^%s]+)伤害。[%(]([%d])", -- [Fashu's] [Firebolt] [hits] Battleguard Sartura for [44] [Fire] damage. ([14] resisted)
	trigger_vulnerability_dot = "[^%s]+的([^%s]+)使克洛玛古斯受到了(%d+)点([^%s]+)伤害。[%(]([%d])",
	trigger_frenzy = "goes into a killing frenzy",
	trigger_frenzyGone = "疯狂效果从克洛玛古斯身上消失。",
	trigger_vulnerability = "flinches as its skin shimmers.",
	
	-- messages
	msg_breathUnknown = "5秒吐息!",
	msg_breathSoon = "%s 5秒!",
	msg_breath = "%s 正在施放!",
	msg_vulnerability = "弱点: %s!",
	msg_vulnerabilityChanged = "克洛玛古斯弱点改变了!",
	msg_frenzy = "狂暴! 立刻宁神!",
	msg_enrage = "马上激怒!",
	
	-- bars
	bar_breathCast = "施放 %s",
	bar_frenzy = "狂暴",
    bar_frenzyNext = "下一次狂暴",
	bar_breathFirst = "第一次吐息",
	bar_breathSecond = "第二次吐息",
    bar_vulnerability = "%s 弱点",
	
	-- misc
	hit = "击中",
	crit = "致命一击对",

	breath1 = "时间流逝",
	breath2 = "腐蚀酸液",
	breath3 = "点燃躯体",
	breath4 = "焚烧",
	breath5 = "冰霜灼烧",
	
	breathcolor1 = "black",
	breathcolor2 = "green",
	breathcolor3 = "orange",
	breathcolor4 = "red",
	breathcolor5 = "blue",

	icon1 = "Spell_Arcane_PortalOrgrimmar",
	icon2 = "Spell_Nature_Acid_01",
	icon3 = "Spell_Fire_Fire",
	icon4 = "Spell_Shadow_ChillTouch",
	icon5 = "Spell_Frost_ChillingBlast",

	fire = "火焰",
	frost = "冰霜",
	shadow = "暗影",
	nature = "自然",
	arcane = "奥术",
	
	curseofdoom = "厄运诅咒",
	ignite = "点燃",
	starfire = "星火术",
	thunderfury = "雷霆之怒",
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	enrage_name = "Wutanfall",
	enrage_desc = "Warnung, wenn Chromaggus w\195\188tend wird (ab 20%).",

	frenzy_name = "Raserei",
	frenzy_desc = "Warnung, wenn Chromaggus in Raserei ger\195\164t.",

	breath_name = "Atem",
	breath_desc = "Warnung, wenn Chromaggus seinen Atem wirkt.",

	vulnerability_name = "Zauber-Verwundbarkeiten",
	vulnerability_desc = "Warnung, wenn Chromagguss Zauber-Verwundbarkeit sich \195\164ndert.",
	
	-- triggers
	trigger_breath = "^Chromaggus beginnt (.+) zu wirken\.",
	trigger_vulnerability_direct_crit = "^[%w]+[%s's]* ([%w%s:]+) crits Chromaggus for ([%d]+) ([%w]+) damage%.[%s%(]*([%d]*)", -- [Fashu's] [Firebolt] [hits] Battleguard Sartura for [44] [Fire] damage. ([14] resisted)
 	trigger_vulnerability_direct_hit = "^[%w]+[%s's]* ([%w%s:]+) hits Chromaggus for ([%d]+) ([%w]+) damage%.[%s%(]*([%d]*)", -- [Fashu's] [Firebolt] [hits] Battleguard Sartura for [44] [Fire] damage. ([14] resisted)
	trigger_vulnerability_dot = "^Chromaggus erleidet ([%d]+) ([%w]+)schaden[%svon]*[%s%w]* %(durch ([%w%s:]+)%)%.[%s%(]*([%d]*)",
	trigger_frenzy = "Chromaggus wird mörderisch wahnsinnig!",
	trigger_frenzyGone = "Raserei schwindet von Chromaggus\.",
	trigger_vulnerability = "Chromaggus weicht zurück, als die Haut schimmert.",
	
	-- messages
	msg_breathUnknown = "Atem in 5 Sekunden!",
	msg_breathSoon = "%s in 5 Sekunden!",
	msg_breath = "Chromaggus wirkt: %s Atem!",
	msg_vulnerability = "Zauber-Verwundbarkeit: %s",
	msg_vulnerabilityChanged = "Zauber-Verwundbarkeit ge\195\164ndert!",
	msg_frenzy = "Raserei - Einlullender Schuss!",
	msg_enrage = "Wutanfall steht kurz bevor!",
	
	-- bars
	bar_breathCast = "Wirkt %s",
	bar_frenzy = "Raserei",
    bar_frenzyNext = "Nächste Raserei",
	bar_breathFirst = "Erster Atem",
	bar_breathSecond = "Zweite Atem",
    bar_vulnerability = "%s Verwundbarkeit",
	
	-- misc
	hit = "trifft",
	crit = "kritisch",

	breath1 = "Zeitraffer",
	breath2 = "\195\132tzende S\195\164ure",
	breath3 = "Fleisch entz\195\188nden",
	breath4 = "Verbrennen",
	breath5 = "Frostbeulen",

	breathcolor1 = "black",
	breathcolor2 = "green",
	breathcolor3 = "orange",
	breathcolor4 = "red",
	breathcolor5 = "blue",

	icon1 = "Spell_Arcane_PortalOrgrimmar",
	icon2 = "Spell_Nature_Acid_01",
	icon3 = "Spell_Fire_Fire",
	icon4 = "Spell_Shadow_ChillTouch",
	icon5 = "Spell_Frost_ChillingBlast",

	fire = "Feuer",
	frost = "Frost",
	shadow = "Schatten",
	nature = "Natur",
	arcane = "Arkan",
	
	curseofdoom = "Fluch der Verdammnis",
	ignite = "Entz\195\188nden",
	starfire = "Sternenfeuer",
	thunderfury = "Zorn der Winde",
} end )
