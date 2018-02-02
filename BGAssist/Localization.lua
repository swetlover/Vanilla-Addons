BINDING_NAME_BGASSIST_TOGGLE = "Toggle BGAssist Window";

BGAssist_ItemTrack = {
	[17422] = "INV_Shoulder_19",		-- "Armor Scraps"
	-- Horde
	[17306] = "INV_Potion_50",		-- "Stormpike Soldier's Blood"
	[17642] = "INV_Misc_Pelt_Bear_02",	-- "Alterac Ram Hide"
	[18142] = "INV_Misc_Head_Elf_02",	-- "Severed Night Elf Head"
	[18143] = "INV_Misc_MonsterTail_02",	-- "Tuft of Gnome Hair"
	[18206] = "INV_Misc_Bone_03",		-- "Dwarf Spine"
	[18144] = "INV_Misc_Bone_07",		-- "Human Bone Chip"
	[17326] = "INV_Misc_Food_52",		-- "Stormpike Soldier's Flesh",
	[17327] = "INV_Misc_Food_72",		-- "Stormpike Lieutenant's Flesh"
	[17328] = "INV_Misc_Food_69",		-- "Stormpike Commander's Flesh",
	-- Alliance
	[17423] = "INV_Misc_Gem_Pearl_06",	-- "Storm Crystal"
	[17643] = "INV_Misc_Pelt_Bear_02",	-- "Frostwolf Hide"
	[18145] = "INV_Misc_Foot_Centaur",	-- "Tauren Hoof"
	[18146] = "INV_Potion_82",		-- "Darkspear Troll Mojo"
	[18207] = "INV_Misc_Bone_08",		-- "Orc Tooth"
	[18147] = "INV_Misc_Organ_01",		-- "Forsaken Heart"
	[17502] = "INV_Jewelry_Talisman_06", 	-- "Frostwolf Soldier's Medal"
	[17503] = "INV_Jewelry_Talisman_04",	-- "Frostwolf Lieutenant's Medal"
	[17504] = "INV_Jewelry_Talisman_12",	-- "Frostwolf Commander's Medal"
};
BGAssist_Alterac_Quests = {
	["深铁矿洞的补给"] = true,
	["冷齿矿洞的补给"] = true,
	["雷尔松的全视之眼"] = true,
	["补充坐骑"] = true,	-- Wolf/Ram turnin
	-- Horde
	["取之于敌"] 			= { item = 17422, min=20 },
	["冰雪之王洛克霍拉"] 		= { item = 17306, max=4 },
	["联盟之血"] 			= { item = 17306, min=5 },
	["羊皮坐具"] 			= { item = 17642 },
	["暗矛的防御"] 			= { item = 18142 },
	["踏平侏儒"] 			= { item = 18143 },
	["通缉：更多矮人！"] 		= { item = 18206 },
	["更多的骨头"]= { item = 18144 },
	["天空的召唤 - 古斯的部队"]		= { item = 17326 },
	["天空的召唤 - 杰斯托的部队"]	= { item = 17327 },
	["天空的召唤 - 穆维里克的部队"]	= { item = 17328 },
	-- Alliance
	["护甲碎片"] 			= { item = 17422, min=20 },
	["森林之王伊弗斯"] 		= { item = 17423, max=4 },
	["水晶簇"] 			= { item = 17423, min=5 },
	["山羊坐具"] 		= { item = 17643 },
	["牛头人的蹄子"] 			= { item = 18145 },
	["鹿盔的魔精悬赏"] 		= { item = 18146 },
	["通缉：更多兽人！"] 			= { item = 18207 },
	["光明的关爱"] 			= { item = 18147 },
	["天空的召唤 - 斯里多尔的空军"]	= { item = 17502 },
	["天空的召唤 - 维波里的空军"]	= { item = 17503 },
	["天空的召唤 - 艾克曼的空军"]	= { item = 17504 },
};
BGAssist_FlagRegexp = {
	["RESET"] = {	["regexp"] = "旗帜现在在他们的基地." },
	["PICKED"] = {	["one"] = "FACTION", ["two"] = "PLAYER",
			["regexp"] = "([^ ]*) 拾取了旗帜 ([^!]*)!" },
	["DROPPED"] = {	["one"] = "FACTION", ["two"] = "PLAYER",
			["regexp"] = "([^ ]*) 放下了旗帜 ([^!]*)!" },
	["RETURNED"] ={	["one"] = "FACTION", ["two"] = "PLAYER",
			["regexp"] = "The ([^ ]*) 旗帜被送回基地 ([^!]*)!" },
	["CAPTURED"] ={	["one"] = "PLAYER", ["two"] = "FACTION",
			["regexp"] = "([^ ]*) 夺得 ([^ ]*) 旗帜!" },
};
ALTERACVALLEY 	= "奥特兰克山谷";
WARSONGGULCH 	= "战歌峡谷";
ARATHIBASIN 	= "阿拉希盆地";

DISPLAY_MENU_LOCKWINDOW 		= "锁定窗口位置";
DISPLAY_MENU_AUTOSHOW 		= "进入战场时自动显示窗口";
DISPLAY_MENU_AUTOBGMINIMAP 		= "进入战场时自动显示迷你地图";
DISPLAY_MENU_AUTORELEASE 		= "战场里自动释放";
DISPLAY_MENU_AUTOQUEST 		= "自动确认任务";
DISPLAY_MENU_AUTOENTER 		= "自动进入战场";
DISPLAY_MENU_AUTOSIGNUP 		= "自动排队战场";
DISPLAY_MENU_TIMERSHOW 		= "显示占领时间";
DISPLAY_MENU_ABTIMELEFTSHOW 	= "显示时间直到结束";
DISPLAY_MENU_ITEMSHOW 		= "显示战场物品计数";
DISPLAY_MENU_GYCOUNTDOWN 		= "显示墓地复活时间";
DISPLAY_MENU_FLAGTRACKING 	= "跟踪旗帜";
DISPLAY_MENU_TARGETTINGASSISTANCE = "使用目标助手窗口";

DISPLAY_MENU_NOPREEXISTING 	= "没有预先存在的情况下";
DISPLAY_MENU_SHOWCAPTUREDFLAGS 	= "显示旗帜取得";
DISPLAY_TITLEDISPLAY_CAPTURE 	= "夺得";
DISPLAY_TITLEDISPLAY_ITEMS   	= "物品";
DISPLAY_TITLEDISPLAY_TARGETS 	= "目标";
DISPLAY_TEXT_PREEXISTING 		= "Offered BG instance is pre-existing";
DISPLAY_TEXT_ENTERINGBATTLEGROUNDS = "进入战场";
DISPLAY_TEXT_LEFTBATTLEGROUNDS 	= "离开战场";
DISPLAY_TEXT_TIMEUNTILREZ 	= "直到复活";
DISPLAY_TEXT_TIMELEFT 		= "剩下的时间";
DISPLAY_TEXT_SECONDS 		= "秒";
DISPLAY_TEXT_MINUTES 		= "分";
DISPLAY_TEXT_NOTENTERINGAFK 	= "无法进入战场因为你AFK";
DISPLAY_TEXT_FLAGHOLDERNOTCLOSEENOUGH = "旗帜持有人不够接近目标.";
BATTLEGROUND_GOSSIP_TEXT 	= "我想去战场.";
MATCHING_MARKED_AFK 	= "你现在是AFK";
MATCHING_CLEARED_AFK 	= "你不再是AFK.";
FACTION_ALLIANCE 	= "联盟";
FACTION_HORDE 	= "部落";
CLASS_WARRIOR 	= "战士";
CLASS_MAGE 	= "法师";
CLASS_ROGUE 	= "盗贼";
CLASS_DRUID 	= "德鲁伊";
CLASS_HUNTER 	= "猎人";
CLASS_SHAMAN 	= "萨满祭司";
CLASS_PRIEST 	= "牧师";
CLASS_WARLOCK 	= "术士";
CLASS_PALADIN 	= "圣骑士";

-- ABTimeLeft
INFINITY		= "不限";
END_OF_GAME		= "游戏结束";
BASES			= "基地"
RESOURCES		= "资源";
REPUTATION		= "声望"
RESOURCE_DISPLAY	= BASES .. ": (%d+)  " .. RESOURCES .. ": (%d+)/2000";