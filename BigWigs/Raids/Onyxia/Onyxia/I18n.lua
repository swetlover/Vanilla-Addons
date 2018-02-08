------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.onyxia.onyxia
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("enUS", function() return {
	cmd = "Onyxia",

	-- commands
	deepbreath_cmd = "deepbreath",
	deepbreath_name = "Deep Breath",
	deepbreath_desc = "Warn when Onyxia begins to cast Deep Breath.",
	flamebreath_cmd = "flamebreath",
	flamebreath_name = "Flame Breath",
	flamebreath_desc = "Warn when Onyxia begins to cast Flame Breath.",
	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Wing Buffet",
	wingbuffet_desc = "Warn for Wing Buffet.",
	fireball_cmd = "fireball",
	fireball_name = "Fireball",
	fireball_desc = "Warn for Fireball.",
	phase_cmd = "phase",
	phase_name = "Phase",
	phase_desc = "Warn for Phase Change.",
	onyfear_cmd = "onyfear",
	onyfear_name = "Fear",
	onyfear_desc = "Warn for Bellowing Roar in phase 3.",

	-- triggers
	trigger_engage = "must leave my lair to feed",
	trigger_deepBreath = "takes in a deep breath",
	trigger_flameBreath = "Onyxia begins to cast Flame Breath\.",
	trigger_wingBuffet = "Onyxia begins to cast Wing Buffet\.",
	trigger_fireball = "Onyxia begins to cast Fireball.",
	trigger_phase2 = "from above",
	trigger_phase3 = "It seems you'll need another lesson",
	trigger_fear = "Onyxia begins to cast Bellowing Roar\.",
	trigger_fearGone = "Bellowing Roar",

	-- messages
	msg_deepBreath = "Deep Breath incoming!",
	msg_phase1 = "Phase 1",
	msg_phase2 = "Phase 2",
	msg_phase3 = "Phase 3",
	msg_fear = "Fear soon!",

	-- bars
	bar_fearCast = "Fear",
	bar_fearNext = "Next Fear",
	bar_deepBreath = "Deep Breath",
	bar_flameBreath = "Flame Breath",
	bar_wingBuffet = "Wing Buffet",
	bar_fireball = "Fireball",

	-- misc
}
end)

L:RegisterTranslations("zhCN", function() return {
	-- commands
	deepbreath_cmd = "deepbreath",
	deepbreath_name = "深呼吸",
	deepbreath_desc = "警告当奥妮克希亚开始施放吐息.",
	flamebreath_cmd = "flamebreath",
	flamebreath_name = "火息术",
	flamebreath_desc = "施放火息术警报.",
	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "龙翼打击",
	wingbuffet_desc = "龙翼打击警报.",
	fireball_cmd = "fireball",
	fireball_name = "火球术",
	fireball_desc = "火球术警报.",
	phase_cmd = "phase",
	phase_name = "阶段",
	phase_desc = "阶段警报.",
	onyfear_cmd = "onyfear",
	onyfear_name = "恐惧",
	onyfear_desc = "提醒阶段 3 恐惧",

	-- triggers
	trigger_engage = "must leave my lair to feed",
	trigger_deepBreath = "takes in a deep breath",
	trigger_flameBreath = "奥妮克希亚开始施放火息术。",
	trigger_wingBuffet = "奥妮克希亚开始施放龙翼打击。",
	trigger_fireball = "奥妮克希亚开始施放火球术。",
	trigger_phase2 = "from above",
	trigger_phase3 = "It seems you'll need another lesson",
	trigger_fear = "奥妮克希亚开始施放低沉咆哮。",
	trigger_fearGone = "低沉咆哮",

	-- messages
	msg_deepBreath = "深呼吸来临!注意躲避!",
	msg_phase1 = "阶段 1",
	msg_phase2 = "阶段 2",
	msg_phase3 = "阶段 3",
	msg_fear = "马上恐惧!",

	-- bars
	bar_fearCast = "恐惧",
	bar_fearNext = "下次恐惧",
	bar_deepBreath = "深呼吸",
	bar_flameBreath = "火息术",
	bar_wingBuffet = "龙翼打击",
	bar_fireball = "火球术",

	-- misc
}
end)

