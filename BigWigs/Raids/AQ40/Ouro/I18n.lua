------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq40.ouro
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Ouro",

	-- commands
	sweep_cmd = "sweep",
	sweep_name = "横扫警报",
	sweep_desc = "横扫警报",
	sandblast_cmd = "sandblast",
	sandblast_name = "沙尘爆裂警报",
	sandblast_desc = "沙尘爆裂警报",
	emerge_cmd = "emerge",
	emerge_name = "钻出警报",
	emerge_desc = "钻出警报",
	submerge_cmd = "submerge",
	submerge_name = "钻地警报",
	submerge_desc = "钻地警报",
	berserk_cmd = "berserk",
	berserk_name = "狂暴警报",
	berserk_desc = "奥罗狂暴警报",

	-- triggers
	trigger_sweep = "奥罗开始施放横扫",
	trigger_sandBlast = "奥罗开始施展沙尘爆裂",
	trigger_emerge = "土堆死亡",
	--trigger_emerge = "Dirt Mound casts Summon Ouro Scarabs.",
	trigger_submerge = "奥罗施放了召唤奥罗土堆。",
	trigger_bersek = "奥罗获得了狂暴的效果。",

	-- messages
	msg_sweep = "横扫!",
	msg_sweepSoon = "5秒后横扫!",
	msg_sandBlastNow = "沙尘爆裂来临!",
	msg_sandBlastSoon = "5秒后沙尘爆裂!",
	msg_emerge = "奥罗潜入地下!",
	msg_submergeSoon = "15秒后奥罗将钻出地面!",
	msg_submerge = "奥罗钻出地面!",
	msg_emergeSoon = "5秒后奥罗将钻出地面!",
	msg_berserk = "狂暴 - 狂暴!",
	msg_berserkSoon = "即将狂暴 - 做好准备！",

	-- bars
	bar_sweepFirst = "可能横扫",
	bar_sweep = "横扫",
	bar_sandBlast = "可能沙尘爆裂",
	bar_submerge = "可能钻出地面",
	bar_emerge = "奥罗潜入地下",

	-- misc
}
end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	sweep_name = "Feger",
	sweep_desc = "Warnung, wenn Ouro Feger wirkt.",
	sandblast_name = "Sandsto\195\159",
	sandblast_desc = "Warnung, wenn Ouro Sandsto\195\159 wirkt.",
	emerge_name = "Auftauchen",
	emerge_desc = "Warnung, wenn Ouro auftaucht.",
	submerge_name = "Untertauchen",
	submerge_desc = "Warnung, wenn Ouro untertaucht.",
	berserk_name = "Berserk",
	berserk_desc = "Warnung, wenn Ouro Berserkerwut bekommt.",

	-- triggers
	trigger_sweep = "Ouro beginnt Feger zu wirken.", -- ?
	trigger_sandBlast = "Ouro beginnt Sandstoß auszuführen.", -- ?
	--trigger_emerge = "Dirt Mound casts Summon Ouro Scarabs.",
	trigger_emerge = "Erdhaufen stirbt.", -- ?
	trigger_submerge = "Ouro casts Summon Ouro Mounds.", -- ?
	trigger_bersek = "Ouro bekommt 'Berserker'.",

	-- messages
	msg_sweep = "Feger!",
	msg_sweepSoon = "5 Sekunden bis Feger!",
	msg_sandBlastNow = "Sandsto\195\159 in K\195\188rze!",
	msg_sandBlastSoon = "5 Sekunden bis Sandsto\195\159!",
	msg_emerge = "Ouro ist aufgetaucht!",
	msg_submergeSoon = "15 sek bis mögliches Untertauchen!",
	msg_submerge = "Ouro ist aufgetaucht!",
	msg_emergeSoon = "5 Sekunden bis Ouro auftaucht!",
	msg_berserk = "Berserk - Berserk!",
	msg_berserkSoon = "Berserkerwut in K\195\188rze - Bereit machen!",

	-- bars
	bar_sweep = "Feger",
	bar_sweepFirst = "Möglicher Feger",
	bar_sandBlast = "Möglicher Sandsto\195\159",
	bar_submerge = "Mögliches Untertauchen",
	bar_emerge = "Auftauchen",

	-- misc
}
end)
