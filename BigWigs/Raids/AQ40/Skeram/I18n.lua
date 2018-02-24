----------------------------
-- 		Localization      --
----------------------------

local bossName = BigWigs.bossmods.aq40.skeram
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Skeram",

	-- commands
	mc_cmd = "mc",
	mc_name = "精神控制警报",
	mc_desc = "精神控制警报",
	split_cmd = "split",
	split_name = "分裂警报",
	split_desc = "分裂警报",
	
	arcaneExplosion_cmd = "arcaneExplosion",
	arcaneExplosion_name = "魔爆术",
	arcaneExplosion_desc = "魔爆术警报",

	-- triggers
	trigger_mcGainPlayer = "你受到了充实效果的影响。",
	trigger_mcGainOther = "(.*)受到了充实效果的影响。",
	trigger_mcPlayerGone = "充实效果从你身上消失了。",
	trigger_mcOtherGone = "充实效果从(.*)身上消失。",
	trigger_deathPlayer = "你死了。",
	trigger_deathOther = "(.*)死亡了。",
	trigger_arcaneExplosion = "预言者斯克拉姆开始施放魔爆术。",
	["You have slain %s!"] = "你杀死了%s！",

	-- messages
	msg_mcPlayer = "你被精神控制!",
	msg_mcOther = "%s 被精神控制!",
	msg_splitSoon = "马上分裂! 准备!",
	msg_split = "分裂!",

	-- bars
	bar_mc = "精神控制: %s",
	bar_arcaneExplosion = "魔爆术",

	-- misc
}
end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	mc_name = "Gedankenkontrolle",
	mc_desc = "Warnen, wenn jemand übernommen ist",
	split_name = "Abbilder",
	split_desc = "Alarm vor der Aufteilung",

	-- triggers
	trigger_mcGainPlayer = "Ihr seid von Wahre Erfüllung betroffen.",
	trigger_mcGainOther = "(.*) ist von Wahre Erfüllung betroffen.",
	trigger_mcPlayerGone = "Wahre Erfüllung\' schwindet von Euch.",
	trigger_mcOtherGone = "Wahre Erfüllung schwindet von (.*).",
	trigger_deathPlayer = "Du stirbst.",
	trigger_deathOther = "(.*) stirbt.",
	["You have slain %s!"] = "Ihr habt %s getötet!",

	-- messages
	msg_mcPlayer = "Ihr seid von Wahre Erfüllung betroffen.",
	msg_mcOther = "%s steht unter Gedankenkontrolle!",
	msg_splitSoon = "Abbilder bald! Sei bereit!",
	msg_split = "Abbilder!",

	-- bars
	bar_mc = "GK: %s",

	-- misc
}
end)
