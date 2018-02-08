------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.mc.coreHound
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Corehound",

	-- commands
	bars_cmd = "bars",
	bars_name = "切换条",
	bars_desc = "切换为工具栏的计时器.",
	
	-- triggers
	trigger_hit = "受到了%s效果的影响",
	trigger_immune = "施放失败。(.+)对此免疫。",
	trigger_resist = "%s被抵抗了。",
	
	-- bars
	bar_unknown = "未知",
	
	-- messages
	
	-- misc
	misc_dread = "上古恐慌",
	misc_dispair = "上古绝望",
	misc_stomp = "大地践踏",
	misc_flames = "灼烧之焰",
	misc_heat = "枯萎热浪",
	misc_hysteria = "上古狂乱",

} end )

L:RegisterTranslations("deDE", function() return {
	-- commands
	--bars_cmd = "bars",
	bars_name = "Timer",
	bars_desc = "Zeige Fähigkeitentimer",
	
	-- triggers
	trigger_hit = "afflicted by %s",
	trigger_immune = "%s fail(.+) immune.",
	trigger_resist = "%s was resisted",
	
	-- bars
	bar_unknown = "Unbekannt",
	
	-- messages
	
	-- misc
	misc_dread = "Ancient Dread",
	misc_dispair = "Ancient Despair",
	misc_stomp = "Ground Stomp",
	misc_flames = "Cauterizing Flames",
	misc_heat = "Withering Heat",
	misc_hysteria = "Ancient Hysteria",

} end )

