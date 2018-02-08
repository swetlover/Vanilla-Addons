------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.aq40.cthun
local L = BigWigs.i18n[bossName]

L:RegisterTranslations("zhCN", function() return {
	cmd = "Cthun",

	-- commands
	tentacle_cmd = "tentacle",
	tentacle_name = "触须警报",
	tentacle_desc = "触须警报",
	glare_cmd = "glare",
	glare_name = "黑暗闪耀警报",
	glare_desc = "黑暗闪耀警报",
	group_cmd = "group",
	group_name = "黑暗闪耀队伍警报",
	group_desc = "黑暗闪耀的哪个队伍警报",
	giant_cmd = "giant",
	giant_name = "巨眼触须警报",
	giant_desc = "巨眼触须警报",
	weakened_cmd = "weakened",
	weakened_name = "虚弱警报",
	weakened_desc = "虚弱状态警报",
	acid_cmd = "acid",
    acid_name = "消化酸液警报",
    acid_desc = "显示一个警报有 5层消化酸",
	proximity_cmd = "proximity",
    proximity_name = "距离警报",
    proximity_desc = "显示距离警报框",
	fleshtentacle_cmd = "fleshtentacle",
	fleshtentacle_name = "血肉触须",
	fleshtentacle_desc = "2个血肉触须的血条",

	-- triggers
	trigger_eyeBeamGiantEye = "巨眼触须开始施放眼棱。",
	trigger_eyeBeamCthun = "克苏恩之眼开始施放眼棱。",
	trigger_giantClawSpawn = "巨钩触须的大地破裂",
	trigger_giantEyeSpawn = "巨眼触须的大地破裂",
	trigger_tentacleParty = "^眼球触须的大地破裂击中(.+)造成(.+)$", -- "Eye Tentacle's Ground Rupture hits Galo for 884.",
	trigger_weakened = "is weakened!",
	trigger_vulnerabilityDirectTest = "^[%w]+[%s's]* ([%w%s:]+) ([%w]+) C'Thun for ([%d]+) ([%w]+) damage%.[%s%(]*([%d]*)",
	trigger_vulnerabilityDotsTest = "^C'Thun suffers ([%d]+) ([%w]+) damage from [%w]+[%s's]* ([%w%s:]+)%.[%s%(]*([%d]*)",
	trigger_digestiveAcid = "You are afflicted by Digestive Acid [%s%(]*([%d]*).",

	-- messages
	msg_tentacle = "巨眼触须 5 秒!",
	msg_darkGlare = "黑暗闪耀!",
	msg_darkGlareEnds = "黑暗闪耀5秒结束",
	msg_darkGlareGroup = "黑暗闪耀队伍 %s (%s)",
	msg_giantEyeSoon = "巨眼触须 5 秒!",
	msg_giantEyeDown = "巨眼触须 down!",
	msg_weakened = "克苏恩的虚弱 45 渺",
	msg_weakenedOverSoon = "5秒队伍结束",
	msg_weakenedOverNow = "队伍结束 - 克苏恩无懈可击",
	msg_digestiveAcid = "5 层酸",
	msg_phase2 = "巨眼死亡! 进腹部!",

	-- bars
	bar_startRandomBeams = "随机光束开始!",
	bar_eyeBeam = "眼棱 %s",
	bar_tentacleParty = "队伍触手!",
	bar_darkGlareNext = "下一次黑暗闪耀!",
	bar_darkGlareEnd = "黑暗闪耀结束",
	bar_darkGlareCast = "黑暗闪耀施放中",
	bar_giantEye = "可能巨眼触须!",
	bar_giantClaw = "巨钩触须!",
	bar_weakened = "克苏恩虚弱了!",

	-- misc
	misc_unknown = "未知", -- Eye Beam on Unknown
	misc_gianteye = "巨眼触须",
	misc_fleshTentacle = "血肉触须",
	misc_fleshTentacleFirst = "第一血肉触须",
	misc_fleshTentacleSecond = "第二血肉触须",
}
end)

L:RegisterTranslations("deDE", function() return {
	-- commands
	tentacle_name = "Tentakel Alarm",
	tentacle_desc = "Warnung vor Tentakeln", --"Warn for Tentacles",
	glare_name = "Dunkles Starren Alarm", --"Dark Glare Alert", -- Dunkles Starren
	glare_desc = "Warnung for Dunklem Starren", --"Warn for Dark Glare",
	group_name = "Dunkles Starren Gruppenwarnung", -- "Dark Glare Group Warning",
	group_desc = "Warnt vor Dunkles Starren auf Gruppe X", -- "Warn for Dark Glare on Group X",
	giant_name = "Riesiges Augententakel Alarm", --Giant Eye Alert",
	giant_desc = "Warnung vor Riesigem Augententakel", -- "Warn for Giant Eyes",
	weakened_name = "Schwäche Alarm", --"Weakened Alert",
	weakened_desc = "Warnung für Schwäche Phase", -- "Warn for Weakened State",
	acid_name = "Magensäure Alarm",
	acid_desc = "Zeigt ein Warnzeichen wenn du mehr als 5 Stapel der Magensäure hast.",
	fleshtentacle_name = "Fleischtentakel",
	fleshtentacle_desc = "Lebensbalken der beiden Fleischtentakel",
	proximity_cmd = "proximity",
	proximity_name = "Nähe Warnungsfenster",
	proximity_desc = "Zeit das Nähe Warnungsfenster",

	-- triggers
	trigger_eyeBeamGiantEye = "Riesiges Augententakel beginnt Augenstrahl zu wirken", --"Giant Eye Tentacle begins to cast Eye Beam.", -- Riesiges Augententakel beginnt Augenstrahl zu wirken
	trigger_eyeBeamCthun = "Auge von C'Thun beginnt Augenstrahl zu wirken", --"Eye of C'Thun begins to cast Eye Beam.", --
	trigger_giantClawSpawn = "Riesiges Klauententakel(.+) Erdriss", -- "Giant Claw Tentacle 's Ground Rupture",
	trigger_giantEyeSpawn = "Riesiges Augententakel(.+) Erdriss", -- "Giant Eye Tentacle 's Ground Rupture",
	trigger_tentacleParty = "^Augententakel Erdriss (.+)$", -- "Eye Tentacle's Ground Rupture hits Galo for 884.",
	trigger_weakened = "ist geschwächt", -- "is weakened!",
	trigger_vulnerabilityDirectTest = "^[%w]+[%ss]* ([%w%s:]+) ([%w]+) C'Thun für ([%d]+) ([%w]+) damage%.[%s%(]*([%d]*)",
	trigger_vulnerabilityDotsTest = "^C'Thun suffers ([%d]+) ([%w]+) damage from [%w]+[%s's]* ([%w%s:]+)%.[%s%(]*([%d]*)",
	trigger_digestiveAcid = "Ihr seid von Magensäure [%s%(]*([%d]*)", -- "You are afflicted by Digestive Acid (5).",

	-- messages
	msg_tentacle = "Tentakel in 5sec!", --"Tentacles in 5sec!",
	msg_darkGlareEnds = "Dunkles Starren endet in 5 sec", -- "Dark Glare ends in 5 sec",
	msg_darkGlareGroup = "Dunkles Starren auf Gruppe %s (%s)", -- "Dark Glare on group %s (%s)",
	msg_phase2 = "Das Auge ist tot! Phase 2 beginnt.", -- "The Eye is dead! Body incoming!",
	msg_giantEyeSoon = "Riesiges Augententakel Tentacle in 5 sec!",
	msg_giantEyeDown = "Riesiges Augententakel tot!",
	msg_weakened = "C'Thun ist für 45 sec geschwächt", --"C'Thun is weakened for 45 sec",
	msg_weakenedOverSoon = "Party endet in 5 sec", --"Party ends in 5 seconds",
	msg_weakenedOverNow = "Party vorbei - C'Thun unverwundbar", -- "Party over - C'Thun invulnerable",
	msg_digestiveAcid = "5 Säure Stacks",
	msg_darkGlare = "Dunkles Starren!", -- "Dark Glare!",

	-- bars
	bar_startRandomBeams = "Beginn zufälliger Strahlen!",
	bar_eyeBeam = "Augenstrahl auf %s", --"Eye Beam on %s",
	bar_tentacleParty = "Tentakel Party", --"Tentacle party!",
	bar_darkGlareNext = "Nächstes Dunkles Starren!", -- "Next Dark Glare!",
	bar_darkGlareEnd = "Dunkles Starren endet", -- Dark Glare ends",
	bar_darkGlareCast = "Zaubert Dunkles Starren", -- "Casting Dark Glare",
	bar_giantEye = "Mögliches Riesiges Augententakel!",
	bar_giantClaw = "Riesiges Klauententakel!",
	bar_weakened = "C'Thun ist geschwächt", --"C'Thun is weakened!",

	-- misc
	misc_gianteye = "Riesiges Augententakel",
	misc_fleshTentacle = "Fleischtentakel",
	misc_fleshTentacleFirst = "1. Fleischtentakel",
	misc_fleshTentacleSecond = "2. Fleischtentakel",
	misc_unknown = "Unbekannt", -- Eye Beam on Unknown
}
end)
