------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.zg.jeklik
local L = BigWigs.i18n[bossName]


L:RegisterTranslations("zhCN", function() return {
	cmd = "Jeklik",

	-- commands
	phase_cmd = "phase",
	phase_name = "阶段通知",
	phase_desc = "阶段通知",

	heal_cmd = "heal",
	heal_name = "治疗警报",
	heal_desc = "治疗警报",

	flay_cmd = "flay",
	flay_name = "精神鞭笞警报",
	flay_desc = "精神鞭笞的警报",

	fear_cmd = "fear",
	fear_name = "恐惧警报",
	fear_desc = "恐惧警报\n\n(免责声明: 时间变化很大)",

	bomb_cmd = "bomb",
	bomb_name = "炸弹蝙蝠警报",
	bomb_desc = "炸弹蝙蝠警报",

	swarm_cmd = "swarm",
	swarm_name = "蝙蝠群警报",
	swarm_desc = "蝙蝠群警报",
    swarm_bartext = "蝙蝠群",

	announce_cmd = "whispers",
	announce_name = "向着火的人密语",
	announce_desc = "向着火的人密语让他远离火\n\n(需要L或A)\n",
	
	-- triggers
	trigger_engage = "grant me wings of v",
	trigger_swarm = "觅血蝙蝠获得了悬浮的效果。",
	trigger_bomb = "疯狂的觅血蝠获得了悬浮的效果。",
	trigger_fearHit = "受到了恐吓尖啸效果的影响",
	trigger_fearResist = "恐吓尖啸被抵抗了",
	trigger_fearImmune = "恐吓尖啸施放失败。(.+)对此免疫。",
	trigger_fearHit2 = "受到了心灵尖啸效果的影响",
	trigger_fearResist2 = "心灵尖啸被抵抗了",
	trigger_fearImmune2 = "心灵尖啸施放失败。(.+)对此免疫。",
	trigger_attack1 = "高阶祭司耶克里克发起了攻击",
	trigger_attack2 = "高阶祭司耶克里克没有击中",
	trigger_attack3 = "高阶祭司耶克里克击中",
	trigger_attack4 = "高阶祭司耶克里克的致命一击",
	trigger_liquidFire = "液态火焰",
	trigger_liquidFireYouHit = "投掷燃烧瓶击中你造成",
	trigger_liquidFireOtherHit = "液态火焰的烈焰击中(.+)造成",
	trigger_liquidFireYouAbsorb = "你吸收了液态火焰的烈焰。",
	trigger_liquidFireOtherAbsorb = "液态火焰的烈焰被(.+)吸收了。",
	trigger_liquidFireYouResist = "液态火焰的烈焰被抵抗了。",
	trigger_liquidFireOtherResist = "液态火焰的烈焰被(.+)抵抗了。",
	trigger_liquidFireYouImmune = "液态火焰的烈焰施放失败。你对此免疫。",
	trigger_liquidFireOtherImmune = "液态火焰的烈焰施放失败。(.+)对此免疫。",
	trigger_mindFlayYouGain = "你受到了精神鞭笞效果的影响。",
	trigger_mindFlayOtherGain = "(.+)受到了精神鞭笞效果的影响。",
	trigger_mindFlayYouGone = "精神鞭笞效果从你身上消失了。",
	trigger_mindFlayOtherGone = "精神鞭笞效果从(.+)身上消失。",
	trigger_phaseTwo = "悬浮效果从高阶祭司耶克里克身上消失。",
	trigger_heal = "高阶祭司耶克里克开始施放强效治疗术。",
	
	-- messages
	msg_swarm = "蝙蝠群来临! 杀光他们!",
	msg_bomb = "一个炸弹蝙蝠加入战斗! 注意你的跑位!",
	msg_heal = "治疗! 打断他!",
	msg_phaseOne = "蝙蝠阶段",
	msg_phaseTwo = "巨魔阶段",
	msg_fireWhisper = "远离火!",
	msg_fireYou = "远离火!",
	
	-- bars
	bar_fear = "可能恐惧",
	bar_mindFlay = "精神鞭笞",
	bar_heal = "治疗",
	
	-- misc
	misc_swarmBarName = "觅血蝙蝠",
	misc_bombBatName = "疯狂的觅血蝠",
	misc_you = "你",

} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verkündet den Phasenwechsel des Bosses",

	heal_name = "Alarm für Heilung",
	heal_desc = "Warnen, wenn Jeklik versucht sich zu heilen",

	flay_name = "Alarm für Gedankenschinden",
	flay_desc = "Warnen, wenn Gedankenschinden gewirkt wird",

	fear_name = "Alarm für Furcht",
	fear_desc = "Warnen, wenn Boss Furcht wirkt.\n\n(Warnung: Timers variieren sehr, normalerweise wird Furcht innerhalb 10 Sekunden passieren, nachdem der Furcht-Balken endet)",

	bomb_name = "Alarm für Bomber-Fledermäuse",
	bomb_desc = "Warnen vor Bomber-Fledermäuse.",

	swarm_name = "Alarm f\195\188r Fledermausschwärme",
	swarm_desc = "Warnen vor Fledermausschwärme.",
    swarm_bartext = "Fledermausschwarm",

	announce_name = "Brennenden Personen flüstern",
	announce_desc = "Flüster der Person, die im Feuer steht\n\n(Benötigt Schlachtzugleiter oder Assistent)\n\n(Warnung: to avoid spamming whispers, it will only whisper people that take damage from fire that is on the ground - aka not the Bat's throw itself)",
	
	-- triggers
    trigger_engage = "grant me wings of v",
	trigger_swarm = "Bloodseeker Bat bekommt \'Schweben\'\.",
	trigger_bomb = "Frenzied Bloodseeker Bat bekommt \'Schweben\'\.",
	trigger_fearHit = "von Schreckliches Kreischen betroffen",
	trigger_fearResist = "Schreckliches Kreischen(.+) widerstanden",
	trigger_fearImmune = "Schreckliches Kreischen(.+) immun",
	trigger_fearHit2 = "von Psychischer Schrei betroffen",
	trigger_fearResist2 = "Psychischer Schrei(.+) widerstanden",
	trigger_fearImmune2 = "Psychischer Schrei(.+) immun",
	trigger_attack1 = "High Priestess Jeklik greift an",
	trigger_attack2 = "High Priestess Jeklik verfehlt",
	trigger_attack3 = "High Priestess Jeklik trifft",
	trigger_attack4 = "High Priestess Jeklik trifft (.+) kritisch",
	trigger_liquidFire = "Liquid Fire",
	trigger_liquidFireYouHit = "Liquid Fire trifft Euch mit \'Feuermeer'",
	trigger_liquidFireOtherHit = "Liquid Fires Feuermeer trifft (.+) f",
	trigger_liquidFireYouAbsorb = "Ihr absorbiert Liquid Fires Feuermeer",
	trigger_liquidFireOtherAbsorb = "Feuermeer von Liquid Fire wird absorbiert von\: (.+)\.",
	trigger_liquidFireYouResist = "Liquid Fire versucht es mit Feuermeer\.\.\. widerstanden\.",
	trigger_liquidFireOtherResist = "Liquid Fires Feuermeer wurde von (.+) widerstanden\.",
	trigger_liquidFireYouImmune = "Liquid Fire versucht es mit Feuermeer\.\.\. ein Fehlschlag. Ihr seid immun\.",
	trigger_liquidFireOtherImmune = "Liquid Fire versucht es mit Feuermeer. Ein Fehlschlag, denn (.+) ist immun\.",
	trigger_mindFlayYouGain = "Ihr seid von Gedankenschinden betroffen.",
	trigger_mindFlayOtherGain = "(.+) ist von Gedankenschinden betroffen.",
	trigger_mindFlayYouGone = "\'Gedankenschinden\' schwindet von Euch\.",
	trigger_mindFlayOtherGone = "Gedankenschinden schwindet von (.+)\.",
	trigger_phaseTwo = "Schweben schwindet von High Priestess Jeklik\.",
	trigger_heal = "High Priestess Jeklik beginnt Gro\195\159e Heilung zu wirken\.",
	
	-- messages
	msg_swarm = "Fledermausschwarm jetzt! Töte sie!",
	msg_bomb = "Eine Bomber-Fledermaus erscheint zum Kampf! Pass auf, wo du stehst!",
	msg_heal = "Heilung! Unterbreche sie!",
	msg_phaseOne = "Fledermaus-Phase",
	msg_phaseTwo = "Troll-Phase",
	msg_fireWhisper = "Move from fire!",
	msg_fireYou = "Beweg\' dich aus dem Feuer!",
	
	-- bars
	bar_fear = "Mögliche Furcht",
	bar_mindFlay = "Gedankenschinden",
	bar_heal = "Heilung",
	
	-- misc
	misc_swarmBarName = "Bloodseeker Bat",
	misc_bombBatName = "Frenzied Bloodseeker Bat",
	misc_you = "Euch"
	
} end )