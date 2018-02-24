------------------------------
-- Localization      		--
------------------------------

local bossName = BigWigs.bossmods.naxx.kelthuzad
local L = BigWigs.i18n[bossName]


L:RegisterTranslations("zhCN", function() return {
	cmd = "Kelthuzad",

	-- commands
	phase_cmd = "phase",
	phase_name = "每阶段警报",
	phase_desc = "阶段性警报.",

	mc_cmd = "mindcontrol",
	mc_name = "精神控制警报",
	mc_desc = "当玩家被精神控制时发出警报.",

	fissure_cmd = "fissure",
	fissure_name = "暗影裂隙",
	fissure_desc = "暗影裂隙即将来临时发出警报.",

	frostblast_cmd = "frostblast",
	frostblast_name = "冰霜冲击",
	frostblast_desc = "当玩家受到冰霜冲击时发出警报.",

	frostbolt_cmd = "frostbolt",
	frostbolt_name = "寒冰箭警报",
	frostbolt_desc = "警报当寒冰箭来临时",

	frostboltbar_cmd = "frostboltbar",
	frostboltbar_name = "寒冰箭的条",
	frostboltbar_desc = "显示一个寒冰箭的释放条",

	detonate_cmd = "detonate",
	detonate_name = "自爆法力警报",
	detonate_desc = "自爆法力即将发动时发出警报.",

	detonateicon_cmd = "detonateicon",
	detonateicon_name = "标记自爆法力",
	detonateicon_desc = "使用团队图标标记将自爆法力的玩家.",

	guardians_cmd = "guardians",
	guardians_name = "寒冰皇冠卫士刷新",
	guardians_desc = "第三阶段召唤寒冰皇冠卫士发出警报.",
	
	fbvolley_cmd = "fbvolley",
	fbvolley_name = "可能乱射",
	fbvolley_desc = "寒冰箭乱射/多重的计时条",
	
	addcount_cmd = "addcount",
	addcount_name = "P1 小怪计数",
	addcount_desc = "在P1增加计数小怪的死亡",
	
	ktmreset_cmd = "ktmreset",
	ktmreset_name = "在精神控制时不重置KTM",
	ktmreset_desc = "Resets KTM on MC when disabled, does nothing when enabled.",
	
	proximity_cmd = "proximity",
    proximity_name = "附近警报",
    proximity_desc = "显示附近警报框架",
	
	-- triggers
	trigger_mindControl1 = "Your soul, is bound to me now!",
	trigger_mindControl2 = "There will be no escape!",
	trigger_engage1 = "Minions, servants, soldiers of the cold dark, obey the call of Kel'Thuzad!",   
	trigger_engage2 = "Minions, servants, soldiers of the cold dark! Obey the call of Kel'Thuzad!",
	trigger_attack1 = "克尔苏加德发起攻击",
	trigger_attack2 = "克尔苏加德没有击中",
	trigger_attack3 = "克尔苏加德击中",
	trigger_attack4 = "克尔苏加德的致命一击",
	trigger_kick1 = "脚踢击中克尔苏加德",
	trigger_kick2 = "脚踢对克尔苏加德造成",
	trigger_kick3 = "脚踢被克尔苏加德格挡",
	trigger_pummel1 = "拳击击中克尔苏加德",
	trigger_pummel2 = "拳击对克尔苏加德造成",
	trigger_pummel3 = "拳击被克尔苏加德格挡",
	trigger_shieldBash1 = "盾击击中克尔苏加德",
	trigger_shieldBash2 = "盾击对克尔苏加德造成",
	trigger_shieldBash3 = "盾击被克尔苏加德格挡",
	trigger_earthShock1 = "地震术击中克尔苏加德",
	trigger_earthShock2 = "地震术对克尔苏加德造成",
	trigger_phase2_1 = "Pray for mercy!",
	trigger_phase2_2 = "Scream your dying breath!",
	trigger_phase2_3 = "The end is upon you!",
	trigger_phase3 = "Master, I require aid!",
	trigger_guardians = "Very well. Warriors of the frozen wastes, rise up! I command you to fight, kill and die for your master! Let none survive!",
	trigger_fissure = "施放了暗影裂隙。",
	trigger_frostbolt = "克尔苏加德开始施放寒冰箭。",
	trigger_frostboltVolley = "受到了寒冰箭效果的影响",
	trigger_addDeath = "(.*)死亡",
	trigger_frostBlast = "I will freeze the blood in your veins!", 
	trigger_detonate = "^([^%s]+)([^%s]+)自爆法力效果的影响",
	
	-- messages
	msg_mindControl = "精神控制!",
	msg_engage = "克尔苏加德相遇开始! ~5分钟后他会激活!",
	msg_phase2Soon = "阶段 1 20秒后结束!",
	msg_phase2Now = "阶段 2, 克尔苏加德降临!",
	msg_phase3Soon = "阶段 3 马上来了!",
	msg_phase3Now = "阶段 3, 守护者大约 ~15秒!",
	msg_guardians = "守护者来临大约 ~10秒!",
	msg_fissure = "暗影裂隙!",
	msg_frostbolt = "寒冰箭! 打断他!",
	msg_frostblast = "冰霜冲击!",
	msg_frostblastSoon = "可能冰霜冲击 ~5秒!",
	msg_mindControlAndfrostblastSoon = "可能冰霜冲击和精神控制 ~5秒!",
	msg_detonateSoon = "自爆法力 ~5秒!",
	msg_detonateNow = "%s 中了自爆法力!",
	
	-- bars
	bar_mindControl = "可能精神控制!",
	bar_phase1 = "阶段 1 计时",
	bar_phase2 = "克尔苏加德激活!",
	bar_guardians = "守护者来临!",
	bar_frostbolt = "寒冰箭",
	bar_frostboltVolley = "可能乱射",
	bar_add = "%d/14 %s",
	bar_frostBlast = "可能冰霜冲击",
	bar_mindControlAndFrostBlast = "第一次冰霜冲击和精神控制",
	bar_detonateNow = "自爆法力 - %s",
	bar_detonateNext = "自爆法力",
	
	-- misc
	misc_zone = "克尔苏加德的大厅",
	misc_you = "你",
	misc_are = "受到了",
	
} end )