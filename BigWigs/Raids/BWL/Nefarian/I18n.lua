------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.bwl.nefarian
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Nefarian",
	
	-- commands
	shadowflame_cmd = "shadowflame",
	shadowflame_name = "暗影烈焰警报",
	shadowflame_desc = "暗影烈焰警报",

	fear_cmd = "fear",
	fear_name = "恐惧警报",
	fear_desc = "奈法AOE恐惧警报",

	classcall_cmd = "classcall",
	classcall_name = "职业点名警报",
	classcall_desc = "职业点名警报",

	otherwarn_cmd = "otherwarn",
	otherwarn_name = "其他警报",
	otherwarn_desc = "奈法着陆和骷髅来袭警报",
	
	mc_cmd = "mc",
	mc_name = "精神控制的警报",
	mc_desc = "精神控制的警报",
	
	-- triggers
	trigger_engage = "Let the games begin!",
	trigger_landing = "Enough! Now you",
    trigger_landingNow = "courage begins to wane",
	trigger_zerg = "Impossible! Rise my",
	trigger_fear = "奈法利安开始施放低沉咆哮。",
	trigger_fearGone = "Bellowing Roar",
	trigger_shadowFlame = "奈法利安开始施放暗影烈焰。",
	
	
	trigger_shamans	= "Shamans, show me",
	trigger_druid	= "Druids and your silly",
	trigger_warlock	= "Warlocks, you shouldn't be playing",
	trigger_priest	= "Priests! If you're going to keep",
	trigger_hunter	= "Hunters and your annoying",
	trigger_warrior	= "Warriors, I know you can hit harder",
	trigger_rogue	= "Rogues%? Stop hiding",
	trigger_paladin	= "Paladins",
	trigger_mage		= "Mages too%?",
	
	trigger_mindControl = "^([^%s]+)([^%s]+)暗影命令效果的影响。",
    trigger_nefCounter = "^([%w ]+)死亡了。",
	
	-- messages
	msg_fear = "现在恐惧！",
	msg_landing = "奈法利安降落!",
	msg_landingSoon = "奈法利安马上降落",
	msg_zerg = "骷髅来袭!",
	msg_fearCast = "2秒恐惧!",
	msg_fearSoon = "可能恐惧大约5秒",
	msg_shadowFlame = "暗影烈焰来临!",

	msg_classCall = "职业点名来临!",

	msg_shaman	= "萨满祭司 - 图腾涌现！",
	msg_druid	= "德鲁伊 - 强制猫形态，无法治疗和解诅咒！",
	msg_warlock	= "术士 - 地狱火出现，DPS职业尽快将其消灭！",
	msg_priest	= "牧师 - 停止治疗，静等25秒！",
	msg_hunter	= "猎人 - 远程武器损坏！",
	msg_warrior	= "战士 - 强制狂暴姿态，加大对MT的治疗量！",
	msg_rogue	= "盗贼 - 被传送和麻痹！",
	msg_paladin	= "圣骑士 - BOSS受到保护祝福，物理攻击无效！",
	msg_mage	= "法师 - 变形术发动！",

	msg_mindControlPlayer = "%s 是精神控制!",
	
	-- bars
	bar_mobSpawn = "小怪刷新",
	bar_shadowFlame = "暗影烈焰",
	bar_classCall = "职业点名",
	bar_fear = "可能恐惧",
	bar_mindControl = "%s 被精神控制",
	
	-- misc
	misc_you = "你",
	misc_are = "受到了",
	misc_drakonidsDead = "总计龙兽",
	
	["NefCounter_RED"] = "红色龙兽",
	["NefCounter_GREEN"] = "绿色龙兽",
	["NefCounter_BLUE"] = "蓝色龙兽",
	["NefCounter_BRONZE"] = "青铜龙兽",
	["NefCounter_BLACK"] = "黑色龙兽",
	["NefCounter_CHROMATIC"] = "多彩龙兽",
	
} end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	shadowflame_name = "Schattenflamme Warnung",
	shadowflame_desc = "Warnt vor Schattenflamme",

	fear_name = "Furcht Warnung",
	fear_desc = "Warnt wenn Nefarian die AoE Furcht zaubert",

	classcall_name = "Klassenruf Warnung",
	classcall_desc = "Warn for Class Calls",

	otherwarn_name = "Other alerts",
	otherwarn_desc = "Landing and Zerg warnings",
            
	mc_name = "Mind Control Alert",
	mc_desc = "Warn for Mind Control",
	
	-- triggers
	trigger_engage = "Lasst die Spiele beginnen!",
	trigger_landing = "GENUG! Nun sollt ihr Ungeziefer",
    trigger_landingNow = "Der Mut der Sterblichen scheint zu schwinden",
	trigger_zerg = "Unmöglich! Erhebt Euch, meine Diener!",
	trigger_fear = "Nefarian beginnt Dröhnendes Gebrüll zu wirken.",
	trigger_fearGone = "Dröhnendes Gebrüll",
	trigger_shadowFlame = "Nefarian beginnt Schattenflamme zu wirken.",

	trigger_shamans	= "Schamane",
	trigger_druid	= "Druiden",
	trigger_warlock	= "Hexenmeister",
	trigger_priest	= "Priester",
	trigger_hunter	= "Jäger",
	trigger_warrior	= "Krieger",
	trigger_rogue	= "Schurken",
	trigger_paladin	= "Paladine",
	trigger_mage		= "Magier",
	
	trigger_mindControl = "^([^%s]+) ([^%s]+) von Schattenbefehl betroffen.",
    trigger_nefCounter = "^([%w ]+) stirbt.",
	
	-- messages
	msg_fear = "Furcht JETZT!",
	msg_landing = "Nefarian landet!",
	msg_landingSoon = "Nefarian landet bald",
	msg_zerg = "Zerg kommt!",
	msg_fearCast = "Furcht in 2s!",
	msg_fearSoon = "Mögliche Furcht in 5s",
	msg_shadowFlame = "Schattenflamme!",
	bar_shadowFlame = "Schattenflamme",
	msg_classCall = "Classcall",
	
	msg_shaman	= "Schamanen - Totems spawned!",
	msg_druid	= "Druiden - stecken in Katzenform!",
	msg_warlock	= "Hexenmeister - Infernals!",
	msg_priest	= "Priester - Heilung schmerzt!",
	msg_hunter	= "Jäger - Bogen/Gewehr kaputt!",
	msg_warrior	= "Krieger - stecken in Berserkerhaltung!",
	msg_rogue	= "Schurken - teleportiert und gewurzelt!",
	msg_paladin	= "Paladine - Segen des Schutzes!",
	msg_mage	= "Magier - polymorphs!",
	
	msg_mindControlPlayer = "%s ist gedankenkontrolliert.",
	
	-- bars
	bar_mobSpawn = "Mob Spawn",
	bar_classCall = "Classcall",
	bar_fear = "Mögliche Furcht",
	bar_mindControl = "%s ist gedankenkontrolliert",
	
	-- misc
	misc_you = "Ihr",
	misc_are = "seid",
	misc_drakonidsDead = "Drakonide total",
	
	["NefCounter_RED"] = "Roter Drakonid",
	["NefCounter_GREEN"] = "Grüner Drakonid",
	["NefCounter_BLUE"] = "Blauer Drakonid",
	["NefCounter_BRONZE"] = "Bronzener Drakonid",
	["NefCounter_BLACK"] = "Schwarzer Drakonid",
	["NefCounter_CHROMATIC"] = "Chromatischer Drakonid",
} end)
