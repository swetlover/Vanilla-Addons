------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.thekal
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Thekal",

	-- commands
	heal_cmd = "heal",
	heal_name = "治疗警报",
	heal_desc = "狂热者扎斯治疗警报.",

	bloodlust_cmd = "bloodlust",
	bloodlust_name = "嗜血术警报",
	bloodlust_desc = "boss获得嗜血术警报, 驱散警报.",
	
	silence_cmd = "silence",
	silence_name = "沉默",
	silence_desc = "显示谁沉默了.",
	
	disarm_cmd = "disarm",
	disarm_name = "缴械",
	disarm_desc = "缴械警报.",
	
	cleave_cmd = "cleave",
	cleave_name = "致死顺劈通知",
	cleave_desc = "显示谁中了致死顺劈通知.",
	
	punch_cmd = "punch",
	punch_name = "重击警报",
	punch_desc = "跳!",
	
	tigers_cmd = "tigers",
	tigers_name = "老虎刷新",
	tigers_desc = "老虎刷新.",
	
	frenzy_cmd = "frenzy",
	frenzy_name = "疯狂通告",
	frenzy_desc = "疯狂通告.",
	
	enraged_cmd = "enraged",
	enraged_name = "激怒警报",
	enraged_desc = "激怒警报.",
	
	phase_cmd = "phase",
	phase_name = "阶段通知",
	phase_desc = "阶段通知.",
	
	-- triggers
    trigger_phase2 = "fill me with your RAGE!",
	trigger_tigers = "High Priest Thekal使用召唤祖利安守护者。",
	trigger_forcepunch = "High Priest Thekal开始施展重击。",
	trigger_heal = "狂热者洛卡恩开始施放强效治疗术。",
	trigger_enrage = "High Priest Thekal获得了激怒的效果。",
	trigger_disarmYou = "你受到了缴械效果的影响。",
	trigger_disarmOther = "(.+)受到了缴械效果的影响。",
	trigger_mortalCleaveYou = "你受到了致死顺劈效果的影响。",
	trigger_mortalCleaveOther = "(.+)受到了致死顺劈效果的影响。",
	trigger_silenceYou = "你受到了沉默效果的影响。",
	trigger_silenceOther = "(.+)受到了沉默效果的影响。",
	trigger_silenceYouGone = "沉默效果从你身上消失了。",
	trigger_silenceOtherGone = "沉默效果从(.+)身上消失。",
	trigger_bloodlustGain = "(.+)获得了嗜血术的效果。",
	trigger_bloodlustGone = "嗜血术效果从(.+)身上消失。",
	trigger_frenzyGain = "High Priest Thekal获得了狂乱效果。",
	trigger_frenzyGone = "狂乱效果从High Priest Thekal身上消失。",
	trigger_death = "死亡了。",
	trigger_zath = "狂热者札斯",
	trigger_lorkhan = "狂热者洛卡恩",
	trigger_thekal = "High Priest Thekal",
	trigger_resurrectionThekal = "High Priest Thekal开始施放复活术。",
	trigger_resurrectionZath = "狂热者札斯开始施放复活术。",
	trigger_resurrectionLorkhan = "狂热者洛卡恩开始施放复活术。",
	
	-- messages
	msg_phase1 = "巨魔阶段",
	msg_phase2 = "老虎阶段",
	msg_enrage = "Boss 相遇!!",
	msg_tigers = "老虎来临!",
	msg_heal = "狂热者洛卡恩在治疗! 打断他!",
	msg_silence = "沉默 %s! 驱散他!",
	msg_bloodlust = "消除嗜血术，从 %s!",
	msg_frenzy = "疯狂! 现在凝神!",
	
	-- bars
    bar_phase2 = "老虎阶段",
	bar_forcePunch = "重击",
	bar_heal = "强效治疗",
	bar_mortalCleave = "致死顺劈: %s",
	bar_silence = "沉默: %s",
	bar_disarm = "缴械: %s",
	bar_bloodlust = "嗜血术: %s",
	bar_frenzy = "疯狂",
	
	-- misc
	misc_rogueName = "狂热者札斯",
	misc_shamanName = "狂热者洛卡恩",
	
    ["You have slain %s!"] = "你杀死了%s！",
    ["Knockback"] = "击退",
    ["New Adds"] = "新怪物",
    ["Next Bloodlust"] = "下次嗜血术",
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	heal_name = "Heilungs Warnung",
	heal_desc = "Warnt vor Lor'Khan's Gro\195\159e Heilung.",

	bloodlust_name = "Kampfrausch",
	bloodlust_desc = "Kündigt an, wenn der Boss Kampfrausch hat, zum einfachen entfernen.",
	
	silence_name = "Stille",
	silence_desc = "Zeigt an wer Stille hat.",
	
	disarm_name = "Entwaffnen",
	disarm_desc = "Warnt vor Zealot Lor'Khan's entwaffnen.",
	
	cleave_name = "Benachrichtigung für Tödliches Spalten",
	cleave_desc = "Zeigt wer den Tödlichen Schlag Effekt auf sich hat.",
	
	punch_name = "Machthieb Warnung",
	punch_desc = "SPRING!",
	
	tigers_name = "Tiger spawns",
	tigers_desc = "Warnt vor ankommenden Tigern.",
	
	frenzy_name = "Alarm für Raserei",
	frenzy_desc = "Warnung, wenn High Priest Thekal in Raserei gerät.",
	
	enraged_name = "Verkündet Boss' Raserei",
	enraged_desc = "Lässt dich wissen, wenn Boss härter zuschlägt.",
	
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verkündet den Phasenwechsel des Bosses.",
	
	-- triggers
    trigger_phase2 = "fill me with your RAGE!",
	trigger_tigers = "High Priest Thekal führt Zulianische Wächter beschwören aus\.",
	trigger_forcepunch = "High Priest Thekal beginnt Machthieb auszuführen\.",
	trigger_heal = "Zealot Lor\'Khan beginnt Gro\195\159e Heilung\.",
	trigger_enrage = "High Priest Thekal bekommt \'Wutanfall\'\.",
	trigger_disarmYou = "Ihr seid von Entwaffnen betroffen\.",
	trigger_disarmOther = "(.+) ist von Entwaffnen betroffen\.",
	trigger_mortalCleaveYou = "Ihr seid von Tödliches Spalten betroffen\.",
	trigger_mortalCleaveOther = "(.+) ist von Tödliches Spalten betroffen\.",
	trigger_silenceYou = "Ihr seid von Stille betroffen\.",
	trigger_silenceOther = "(.+) ist von Stille betroffen\.",
	trigger_silenceYouGone = "\'Stille\' schwindet von Euch\.",
	trigger_silenceOtherGone = "Stille schwindet von (.+)\.",
	trigger_bloodlustGain = "(.+) bekommt \'Kampfrausch\'\.",
	trigger_bloodlustGone = "Kampfrausch schwindet von (.+)\.",
	trigger_frenzyGain = "High Priest Thekal bekommt \'Raserei\'\.",
	trigger_frenzyGone = "Raserei schwindet von High Priest Thekal\.",
	trigger_death = "dies\.",
	trigger_zath = "Zealot Zath",
	trigger_lorkhan = "Zealot Lor\'Khan",
	trigger_thekal = "High Priest Thekal",
	trigger_resurrectionThekal = "High Priest Thekal beginnt Auferstehung zu wirken\.",
	trigger_resurrectionZath = "Zealot Zath beginnt Auferstehung zu wirken\.",
	trigger_resurrectionLorkhan = "Zealot Lor\'Khan beginnt Auferstehung zu wirken\.",
	
	-- messages
	msg_phase1 = "Troll Phase",
	msg_phase2 = "Tiger Phase",
	msg_enrage = "Boss ist Wütend! Verwendet gro\195\159e Heilung!",
	msg_tigers = "Tiger kommen!",
	msg_heal = "Zealot Lor'Khan heilt! Unterbrecht es!",
	msg_silence = "Stille auf %s! Entfernt es!",
	msg_bloodlust = "Entfernt Kampfrausch von %s\!",
	msg_frenzy = "Raserei! Tranq jetzt!",
	
	-- bars
	bar_forcePunch = "Machthieb",
	bar_heal = "Gro\195\159e Heilung",
    bar_phase2 = "Tiger Phase",
	bar_mortalCleave = "Tödliches Spalten: %s",
	bar_silence = "Stille: %s",
	bar_disarm = "Entwaffnen: %s",
	bar_bloodlust = "Kampfrausch: %s",
	bar_frenzy = "Raserei",
	
	-- misc
	misc_rogueName = "Zealot Zath",
	misc_shamanName = "Zealot Lor\'Khan",
	
    ["You have slain %s!"] = "Ihr habt %s getötet!",
    ["Knockback"] = "Rückschlag",
    ["New Adds"] = "Neue Tiger",
    ["Next Bloodlust"] = "Nächster Blutrausch",
	
} end )
