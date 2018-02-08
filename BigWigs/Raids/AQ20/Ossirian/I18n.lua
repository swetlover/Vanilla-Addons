------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq20.ossirian
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Ossirian",

	-- commands
	supreme_cmd = "supreme",
	supreme_name = "无敌警报",
	supreme_desc = "无敌模式警报",

	debuff_cmd = "debuff",
	debuff_name = "虚弱警报",
	debuff_desc = "奥斯里安受到虚弱效果影响时发出警报",

	-- triggers
	trigger_supreme = "无疤者奥斯里安获得了奥斯里安之力的效果。",
	trigger_debuff = "无疤者奥斯里安受到了(.+)虚弱效果的影响。",
	trigger_crystal = "奥斯里安水晶死亡了。",
	trigger_expose = "虚弱",

	-- messages
	msg_supreme = "无疤者奥斯里安无敌模式!",
	msg_supremeSoon = "无敌模式 %d 秒!",
	msg_debuff = "奥斯里安现在弱点 %s!",
	
	-- bars
	bar_supreme = "无敌",
	
	-- misc
	["Shadow"] = "暗影",
	["Fire"] = "火焰",
	["Frost"] = "冰霜",
	["Nature"] = "自然",
	["Arcane"] = "奥术",
	
	["ShadowIcon"] = "Spell_Shadow_ChillTouch",
	["FireIcon"] = "Spell_Fire_Fire",
	["FrostIcon"] = "Spell_Frost_ChillingBlast",
	["NatureIcon"] = "Spell_Nature_Acid_01",
	["ArcaneIcon"] = "Spell_Arcane_PortalOrgrimmar",
	
} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	supreme_name = "Stärke des Ossirian",
	supreme_desc = "Warnung vor Stärke des Ossirian.",

	debuff_name = "Debuff",
	debuff_desc = "Warnung vor Debuff.",

	-- triggers
	trigger_supreme = "Ossirian der Narbenlose bekommt 'Stärke des Ossirian'.",
	trigger_debuff = "Ossirian der Narbenlose ist von (.*)schwäche betroffen.",
	trigger_crystal = "Ossirian Crystal Trigger dies.", -- translation missing
	trigger_expose = "Schwäche",

	-- messages
	msg_supreme = "Stärke des Ossirian!",
	msg_supremeSoon = "Stärke des Ossirian in %d Sekunden!",
	msg_debuff = "Ossirian für 45 Sekunden anfällig gegen: %s",
	
	-- bars
	bar_supreme = "Stärke des Ossirian",
	
	-- misc	
	["Shadow"] = "Schatten",
	["Fire"] = "Feuer",
	["Frost"] = "Frost",
	["Nature"] = "Natur",
	["Arcane"] = "Arkan",
	
	["ShadowIcon"] = "Spell_Shadow_ChillTouch",
	["FireIcon"] = "Spell_Fire_Fire",
	["FrostIcon"] = "Spell_Frost_ChillingBlast",
	["NatureIcon"] = "Spell_Nature_Acid_01",
	["ArcaneIcon"] = "Spell_Arcane_PortalOrgrimmar",
	
} end )
