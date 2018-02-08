------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.mc.ragnaros
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Ragnaros",

	-- commands
	emerge_cmd = "emerge",
	emerge_name = "出现警报",
	emerge_desc = "大螺丝出现警报",

	adds_cmd = "adds",
	adds_name = "烈焰之子",
	adds_desc = "烈焰之子死亡警报",

	submerge_cmd = "submerge",
	submerge_name = "下潜警报",
	submerge_desc = "大螺丝下潜警报",

	aoeknock_cmd = "aoeknock",
	aoeknock_name = "击退警报",
	aoeknock_desc = "大螺丝近战击退警报",
	
	-- triggers
	trigger_knockback = "^TASTE",
	trigger_submerge = "^COME FORTH,",
	trigger_engage = "^NOW FOR YOU",
    trigger_engageSoon = "TOO SOON! YOU HAVE AWAKENED ME TOO SOON",
    trigger_hammer = "^BY FIRE BE PURGED!",

	-- messages
	msg_knockbackNow = "击退!",
	msg_knockbackSoon = "5 秒后击退!",
	msg_submerge = "拉格纳罗斯下潜. 烈焰之子出现!",
	msg_emergeSoon = "15秒后拉格纳罗斯出现!",
	msg_emergeNow = "拉格纳罗斯出现, 3分钟后下潜!",
	msg_submerge60 = "60秒下潜!",
	msg_submerge30 = "30秒下潜!",
	msg_submerge10 = "10秒下潜!",
	msg_submerge5 = "5秒下潜!",
	msg_sonDeath = "%d/8 烈焰之子死亡!",
    msg_combat = "战斗",
	
	-- bars
	bar_knockback = "AoE 击退",
	bar_emerge = "大螺丝出现",
	bar_submerge = "大螺丝下潜",
	bar_hammer = "拉格纳罗斯之锤",

	-- misc
	misc_addName = "烈焰之子",
	
} end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	emerge_name = "Alarm für Abtauchen",
	emerge_desc = "Warnen, wenn Ragnaros auftaucht",

	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Sohn der Flamme Tod",

	submerge_name = "Alarm für Untertauchen",
	submerge_desc = "Warnen, wenn Ragnaros untertaucht",

	aoeknock_name = "Alarm für Rückstoss",
	aoeknock_desc = "Warnen, wenn Zorn des Ragnaros zurückstösst",
	
	-- triggers
	trigger_knockback = "DIE FLAMMEN VON SULFURON",
	trigger_submerge = "^Kommt herbei, meine Diener!",
	trigger_engage = "^NUN ZU EUCH,",
    trigger_engageSoon = "ZU FRÜH!",
    trigger_hammer = "^DAS FEUER WIRD EUCH!",
	
	-- messages
	msg_knockbackNow = "Rückstoss!",
	msg_knockbackSoon = "5 Sekunden bis Rückstoss!",
	msg_submerge = "Ragnaros ist untergetaucht! Söhne der Flamme kommen!",
	msg_emergeSoon = "15 Sekunden bis Ragnaros auftaucht",
	msg_emergeNow = "Ragnaros ist aufgetaucht, Untertauchen in 3 Minuten!",
	msg_submerge60 = "Auftauchen in 60 Sekunden!",
	msg_submerge30 = "Auftauchen in 30 Sekunden!",
	msg_submerge10 = "Auftauchen in 10 Sekunden!",
	msg_submerge5 = "Auftauchen in 5 Sekunden!",
	msg_sonDeath = "%d/8 Sohn der Flamme tot!",
    msg_combat = "Kampf beginnt",

	-- bars
	bar_knockback = "AoE Rückstoss",
	bar_emerge = "Ragnaros taucht auf",
	bar_submerge = "Ragnaros taucht unter",

	-- misc
	misc_addName = "Sohn der Flamme",

} end)
