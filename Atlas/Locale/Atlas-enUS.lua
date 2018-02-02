--[[
	
	Atlas, a World of Warcraft instance map browser
	Copyright 2005 - 2008 Dan Gilbert
	Email me at loglow@gmail.com
	
	This file is part of Atlas.
	
	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.
	
	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
	
--]]

-- Atlas English Localization
-- Compiled by Dan Gilbert
-- loglow@gmail.com
-- Many thanks to all contributors!

--************************************************
-- Global Atlas Strings
--************************************************
local AL = AceLibrary("AceLocale-2.2"):new("Atlas");

AtlasSortIgnore = {"the (.+)"};

BINDING_HEADER_ATLAS_TITLE = "Atlas 快捷键"
BINDING_NAME_ATLAS_TOGGLE = "切换 Atlas"
BINDING_NAME_ATLAS_OPTIONS = "切换 设置"
BINDING_NAME_ATLAS_AUTOSEL = "自动选择"

ATLAS_SUBTITLE = "副本地图浏览器"
ATLAS_DESC = "Atlas 是一个副本地图浏览器."

ATLAS_STRING_LOCATION = "位置"
ATLAS_STRING_LEVELRANGE = "等级范围"
ATLAS_STRING_PLAYERLIMIT = "玩家限制"
ATLAS_STRING_SELECT_CAT = "选择类别"
ATLAS_STRING_SELECT_MAP = "选择地图"
ATLAS_STRING_SEARCH = "搜索"
ATLAS_STRING_CLEAR = "清除"
ATLAS_STRING_MINLEVEL = "最低等级"

ATLAS_OPTIONS_BUTTON = "设置"
ATLAS_OPTIONS_SHOWBUT = "显示小地图按钮"
ATLAS_OPTIONS_AUTOSEL = "自动选择副本地图"
ATLAS_OPTIONS_BUTPOS = "按钮位置"
ATLAS_OPTIONS_TRANS = "透明度"
ATLAS_OPTIONS_DONE = "完成"
ATLAS_OPTIONS_RCLICK = "右键世界地图"
ATLAS_OPTIONS_SHOWMAPNAME = "显示地图名字"
ATLAS_OPTIONS_RESETPOS = "重置位置"
ATLAS_OPTIONS_ACRONYMS = "显示缩略词"
ATLAS_OPTIONS_SCALE = "大小"
ATLAS_OPTIONS_BUTRAD = "按钮半径"
ATLAS_OPTIONS_CLAMPED = "屏幕上锁住窗口"
ATLAS_OPTIONS_HELP = "左键+拖动窗口"

ATLAS_BUTTON_TOOLTIP_TITLE = "Atlas";
ATLAS_BUTTON_TOOLTIP_HINT = "左键打开 Atlas.\n中键单击 Atlas 设置.\n右键+拖动这个按钮."
ATLAS_TITAN_HINT = "左键打开 Atlas.\n中键单击 Atlas 设置.\n右键+拖动这个按钮."

ATLAS_OPTIONS_CATDD = "副本地图排序:"
ATLAS_DDL_CONTINENT = "大陆"
ATLAS_DDL_CONTINENT_EASTERN = "东部王国的副本"
ATLAS_DDL_CONTINENT_KALIMDOR = "卡利姆多的副本"
ATLAS_DDL_LEVEL = "等级";
ATLAS_DDL_PARTYSIZE = "队伍规模";
ATLAS_DDL_PARTYSIZE_5 = "副本 5 人"
ATLAS_DDL_PARTYSIZE_10 = "副本 10 人"
ATLAS_DDL_PARTYSIZE_20 = "副本 20 人"
ATLAS_DDL_PARTYSIZE_40 = "副本 40 人"
ATLAS_DDL_ALL = "所有"
ATLAS_DDL_ALL_MENU = "显示所有副本"
ATLAS_DDL_TYPE = "类型"
ATLAS_DDL_TYPE_DUNGEONS = "副本"
ATLAS_DDL_TYPE_RAIDS = "团本"
ATLAS_DDL_WORLDBOSSES = "世界 Boss"
ATLAS_DDL_TYPE_ENTRANCE = "入口"
ATLAS_DDL_BGS = "战场"
ATLAS_DDL_DUNGEON_LOCATIONS = "副本位置"
ATLAS_DDL_FLIGHT_PATHS = "飞行地图"
ATLAS_DDL_LEVELING_GUIDE = "升级指南"
ATLAS_DDL_LEVELING_GUIDE_ALLIANCE1 = "联盟升级指南 Part 1"
ATLAS_DDL_LEVELING_GUIDE_ALLIANCE2 = "联盟升级指南 Part 2"
ATLAS_DDL_LEVELING_GUIDE_HORDE1 = "部落升级指南 Part 1"
ATLAS_DDL_LEVELING_GUIDE_HORDE2 = "部落升级指南 Part 2"

ATLAS_INSTANCE_BUTTON = "副本"
ATLAS_ENTRANCE_BUTTON = "入口"
ATLAS_SEARCH_UNAVAIL = "搜索 不可用"

AtlasZoneSubstitutions = {
	["The Temple of Atal'Hakkar"] = "沉没的神庙"
};

AL:RegisterTranslations("zhCN", function() return {
	
	--************************************************
	-- Zone Names, Acronyms, and Common Strings
	--************************************************
	
	--Common strings
	["Atlas Options"] = "Atlas 设置",
	--Colors
	["Blue"] = "蓝色",
	["Purple"] = "紫色",
	["Red"] = "红色",
	["Orange"] = "橙色",
	["White"] = "白色",
	--Mobs types
	["Boss"] = "Boss",
	["Rare"] = "稀有",
	["Bat"] = "蝙蝠",
	["Snake"] = "蛇",
	["Raptor"] = "猛禽",
	["Spider"] = "蜘蛛",
	["Tiger"] = "老虎",
	["Panther"] = "猎豹",
	["Pet"] = "宠物",
	["Engineer"] = "工程",
	--Magic types
	["Fire"] = "火焰",
	["Nature"] = "自然",
	["Frost"] = "冰霜",
	["Shadow"] = "暗影",
	["Arcane"] = "奥术",
	--Events
	["Hallow's End"] = "万圣节",
	["Scourge Invasion"] = "天灾入侵",		
	["Lunar Festival"] = "农历节日",
	--Other
	["East"] = "东",
	["North"] = "北",
	["South"] = "南",
	["West"] = "西",		
	["Battlegrounds"] = "战场",		
	["Lower"] = "下层",	
	["Upper"] = "上层",		
	["Entrance"] = "入口",
	["Exit"] = "出口",		
	["Chase Begins"] = "追逐开始",
	["Chase Ends"] = "追逐结束",		
	["AKA"] = "另一个名称",	
	["Attunement Required"] = "需求",
	["Back"] = "回退",
	["Back1"] = "背部",
	["Blacksmithing Plans"] = "锻造图纸",	
	["Brazier of Invocation"] = "符咒火盆",
	["Connection"] = "连接点",
	["Connections"] = "连接点",
	["Damage: "] = "伤害: ",
	["Тier 0.5 Summon"] = "T0.5召唤boss",
	["Dungeon Locations"] = "副本的位置",
	["Elevator"] = "电梯",
	["Front"] = "前门",
	["Front1"] = "前门1",
	["Ghost"] = "幽灵",		
	["Heroic"] = "英雄模式",
	["Instances"] = "副本",
	["Key"] = "钥匙",
	["Meeting Stone"] = "集合石",
	["Moonwell"] = "月亮井",
	["Neutral"] = "中立", -- NPC reaction
	["Optional"] = "可跳过",
	["Outside"] = "室外",
	["Portal"] = "传送",
	["Random"] = "随机",
	["Reputation"] = "声望",
	["Rescued"] = "解救",
	["Side"] = "旁门",
	["Summon"] = "召唤",
	["Teleport"] = "传送",
	["through "] = "通道 ",
	["Trash Mobs"] = "小怪",
	["Unknown"] = "未知",
	["Varies"] = "多个位置",
	["Various"] = "多个",
	["Wanders"] = "游荡",
	
	--Instance names and acronyms
	["Armory"] = "军械库",
	["Cathedral"] = "大教堂",
	["Graveyard"] = "墓地",
	["Library"] = "图书馆",
	["Sunken Temple"] = "沉没的神庙",
	
	--Set names
	["Set: "] = "套装：",
	["Tier 0/0.5 Sets"] = "T0/0.5 套装",
	["Zul'Gurub Sets"] = "祖尔格拉布套装",
	["Zul'Gurub Ring Sets"] = "祖尔格拉布饰品套装",
	["Ruins of Ahn'Qiraj Sets"] = "安其拉废墟套装",
	["Temple of Ahn'Qiraj Sets"] = "安其拉神殿套装",
	["Tier 1 Sets"] = "T1 套装",
	["Tier 2 Sets"] = "T2 套装",
	["Tier 3 Sets"] = "T3 套装",
	
	--************************************************
	-- Kalimdor Instance Data
	--************************************************
	
	--Ragefire Chasm
	["Oggleflint"] = "奥格弗林特",
	
	--Wailing Caverns
	["Disciple of Naralex"] = "穆约",
	["Mysterious Wailing Caverns Chest"] = "神秘的哀嚎洞穴箱子",
	
	--Blackfathom Deeps
	["Lorgalis Manuscript"] = "洛迦里斯手稿",
	["Argent Guard Thaelrid"] = "斥候塞尔瑞德",
	["Shrine of Gelihast"] = "格里哈斯特神殿",
	["Fathom Stone"] = "深渊之石",
	["Morridune"] = "莫瑞杜恩",
	["Altar of the Deeps"] = "玛塞斯特拉祭坛",
	
	--Razorfen Kraul
	["Razorfen Spearhide"] = "剃刀沼泽刺鬃守卫",
	["Willix the Importer"] = "进口商威利克斯",
	["Heralath Fallowbrook"] = "赫尔拉斯·静水",
	
	--Razorfen Downs
	["Henry Stern"] = "亨利·斯特恩",
	["Belnistrasz"] = "奔尼斯特拉兹",
	["Sah'rhee"] = "萨哈斯",
	
	--Zul'Farrak
	["Mallet of Zul'Farrak"] = "祖尔法拉克之槌",
	["Theka the Martyr"] = "殉教者塞卡",
	["Zul'Farrak Dead Hero"] = "祖尔法拉克阵亡英雄",
	["Nekrum Gutchewer"] = "耐克鲁姆",
	["Dustwraith"] = "灰尘怨灵",
	["Sergeant Bly"] = "布莱中士",
	["Weegli Blastfuse"] = "维格利",
	["Murta Grimgut"] = "穆尔塔",
	["Raven"] = "拉文",
	["Oro Eyegouge"] = "欧罗·血眼",
	["Sandfury Executioner"] = "沙怒刽子手",
	["Hydromancer Velratha"] = "水占师维蕾萨",
	["Elder Wildmane"] = "蛮鬃长者",
	["Zerillis"] = "泽雷利斯",
	["Sandarr Dunereaver"] = "杉达尔·沙掠者",
	
	--Maraudon	
	["Scepter of Celebras"] = "塞雷布拉斯节杖",
	["Veng"] = "温格(第五可汗)",
	["Maraudos"] = "玛拉多斯(第四可汗)",
	["Elder Splitrock"] = "碎石长者",
	
	--Dire Maul (East)
	["Old Ironbark"] = "埃隆巴克",
	["A Dusty Tome"] = "布满灰尘的书籍",
	["Felvine Shard"] = "魔藤碎片",
	["Dire Maul Books"] = "厄运之槌职业书籍",
	
	--Dire Maul (North)
	["Crescent Key"] = "月牙钥匙",--omitted from Dire Maul (West)
	["Gordok Courtyard Key"] = "戈多克庭院钥匙",
	["Gordok Inner Door Key"] = "戈多克内门钥匙",
	--"Library" omitted from here and DM West because of SM: "Library" duplicate
	["Stomper Kreeg"] = "践踏者克雷格",
	["Knot Thimblejack"] = "诺特·希姆加克",
	["Tribute Run"] = "贡品",
	
	--Dire Maul (West)
	["J'eevee's Jar"] = "耶维尔的瓶子",
	["Pylons"] = "能量塔",
	["Shen'dralar Ancient"] = "辛德拉古灵",
	["Ancient Equine Spirit"] = "上古圣马之魂",
	["Ferra"] = "费拉",
	["Falrin Treeshaper"] = "法尔林·树影",
	["Lorekeeper Lydros"] = "博学者莱德罗斯",
	["Lorekeeper Javon"] = "博学者亚沃",
	["Lorekeeper Kildrath"] = "博学者基尔达斯",
	["Lorekeeper Mykos"] = "博学者麦库斯",
	["Shen'dralar Provisioner"] = "辛德拉圣职者",
	["Skeletal Remains of Kariel Winthalus"] = "卡里尔·温萨鲁斯的骸骨",
	["The Prince's Chest"] = "王子的箱子",
	
	--Onyxia's Lair
	["Drakefire Amulet"] = "龙火护符",
	["Onyxian Warders"] = "奥妮克希亚守卫",
	["Whelp Eggs"] = "幼龙的蛋",
	
	--Temple of Ahn'Qiraj
	["Bug Trio"] = "三人组",
	["Andorgos"] = "安多葛斯",
	["Vethsera"] = "温瑟拉",
	["Kandrostrasz"] = "坎多斯特拉兹",
	["Arygos"] = "阿瑞苟斯",
	["Caelestrasz"] = "凯雷斯特拉兹",
	["Merithra of the Dream"] = "梦境之龙麦琳瑟拉",
	["AQ Enchants"] = "TAQ附魔",
	["AQ Opening Quest Chain"] = "TAQ开放的任务链",
	
	--Ruins of Ahn'Qiraj
	["Four Kaldorei Elites"] = "卡多雷四精英",
	["Captain Qeez"] = "奎兹上尉",
	["Captain Tuubid"] = "图比德上尉",
	["Captain Drenn"] = "德雷恩上尉",
	["Captain Xurrem"] = "库雷姆上尉",
	["Major Yeggeth"] = "耶吉斯少校",
	["Major Pakkon"] = "帕库少校",
	["Colonel Zerran"] = "泽兰上校",
	["Safe Room"] = "安全房间",
	["Class Books"] = "职业书籍",
	
	--****************************
	-- Eastern Kingdoms Instances
	--****************************
	
	--Blackrock Depths
	["Shadowforge Key"] = "暗炉钥匙",
	["Prison Cell Key"] = "监狱牢房钥匙",
	["Jail Break!"] = "冲破牢笼",
	["Banner of Provocation"] = "挑衅之旗",
	["Kharan Mighthammer"] = "卡兰·巨锤",
	["Commander Gor'shak"] = "指挥官哥沙克 <卡加斯远征军>",
	["Marshal Windsor"] = "温德索尔元帅",
	["Ring of Law"] = "法律之环",
	["Theldren"] = "塞尔德林",
	["Lefty"] = "莱弗提",
	["Malgen Longspear"] = "玛尔根·长矛",
	["Gnashjaw"] = "碎腭 <玛尔根·长矛的宠物>",
	["Korv"] = "考尔夫",
	["Rezznik"] = "雷兹尼克",
	["Rotfang"] = "烂牙",
	["Snokh Blackspine"] = "斯诺恩·黑骨",
	["Va'jashni"] = "瓦亚辛",
	["Volida"] = "沃莉达",
	["Elder Morndeep"] = "黎明长者",
	["High Justice Grimstone"] = "裁决者格里斯通",
	["Monument of Franclorn Forgewright"] = "弗兰克罗恩·铸铁的雕像",
	["The Vault"] = "黑色宝库",
	["The Black Anvil"] = "黑铁砧",
	["Shadowforge Lock"] = "暗炉之锁",
	["Field Repair Bot 74A"] = "修理机器人74A型",
	["The Grim Guzzler"] = "黑铁酒吧",
	["Lokhtos Darkbargainer"] = "罗克图斯·暗契 <瑟银兄弟会>",
	["Mistress Nagmara"] = "娜玛拉小姐",
	["Plugger Spazzring"] = "普拉格",
	["Private Rocknot"] = "罗克诺特下士",
	["Summoner's Tomb"] = "召唤者之墓",
	["Chest of The Seven"] = "七贤箱子",
	["The Lyceum"] = "讲学厅",
	["High Priestess of Thaurissan"] = "索瑞森高阶女祭司",
	["The Black Forge"] = "黑熔炉",
	["Core Fragment"] = "熔火碎片",
	["Overmaster Pyron"] = "征服者派隆",
	
	--Blackrock Spire (Lower)
	["Vaelan"] = "维埃兰",
	["Warosh"] = "瓦罗什 <被诅咒者>",
	["Elder Stonefort"] = "石墙长者",
	["Roughshod Pike"] = "尖锐长矛",
	["Spirestone Butcher"] = "尖石屠夫",
	["Spirestone Battle Lord"] = "尖石统帅",
	["Spirestone Lord Magus"] = "尖石首席法师",
	["Fifth Mosh'aru Tablet"] = "第五块摩沙鲁石板",
	["Bijou"] = "比修",
	["Sixth Mosh'aru Tablet"] = "第六块摩沙鲁石板",
	["Bijou's Belongings"] = "比修的装置",
	["Human Remains"] = "人类遗骸",
	["Unfired Plate Gauntlets"] = "未淬火的板甲护手",
	["Urok's Tribute Pile"] = "乌洛克的贡品堆",
	["Burning Felguard"] = "燃烧地狱卫士",
	
	--Blackrock Spire (Upper)
	["Seal of Ascension"] = "晋升印章",
	["Father Flame"] = "烈焰之父",
	["Darkstone Tablet"] = "黑暗石板",
	["Doomrigger's Coffer"] = "末日扣环",
	["Awbee"] = "奥比",
	["Finkle Einhorn"] = "芬克·恩霍尔",
	["Drakkisath's Brand"] = "达基萨斯的烙印",
	
	--Blackwing Lair
	["Draconic for Dummies"] = "龙语傻瓜教程 (第七章)",
	["Master Elemental Shaper Krixix"] = "大元素师克里希克",
	["Alchemy Lab"] = "炼金实验室",
	
	--Gnomeregan
	["Workshop Key"] = "车间钥匙",
	["Blastmaster Emi Shortfuse"] = "爆破专家艾米·短线",
	["Clean Room"] = "清洗区",
	["Tink Sprocketwhistle"] = "丁克·铁哨 <工程学供应商>",
	["The Sparklematic 5200"] = "超级清洁器5200型",
	["Mail Box"] = "邮箱",
	["Kernobee"] = "克努比",
	["Alarm-a-bomb 2600"] = "警报炸弹2600型",
	["Matrix Punchograph 3005-B"] = "矩阵式打孔计算机 3005-B",
	["Matrix Punchograph 3005-C"] = "矩阵式打孔计算机 3005-C",
	["Matrix Punchograph 3005-D"] = "矩阵式打孔计算机 3005-D",
	
	--Molten Core
	["Aqual Quintessence"] = "水之精萃",
	["Eternal Quintessence"] = "永恒精萃",
	["Random Boss Loot"] = "随机BOSS战利品",
	
	--Naxxramas
	["Archmage Tarsis Kir-Moldir"] = "大法师塔希斯·基莫迪尔",
	["Mr. Bigglesworth"] = "比格沃斯",
	["Abomination Wing"] = "憎恶区",
	["Spider Wing"] = "蜘蛛区",
	["Deathknight Wing"] = "死亡骑士区",
	["Four Horsemen Chest"] = "四骑士之箱",
	["Plague Wing"] = "瘟疫区",
	["Frostwyrm Lair"] = "冰霜巨龙巢穴",
	
	--SM: Library
	["Doan's Strongbox"] = "杜安的保险箱",
	
	--SM: Armory
	["The Scarlet Key"] = "血色十字军钥匙",--omitted from SM: Cathedral
	
	--SM: Graveyard
	["Vorrel Sengutz"] = "沃瑞尔·森加斯",
	
	--Scholomance
	["Skeleton Key"] = "骷髅钥匙",
	["Viewing Room Key"] = "观察室钥匙",
	["Viewing Room"] = "观察室",
	["Blood of Innocents"] = "无辜者的血",
	["Divination Scryer"] = "预言水晶球",
	["Blood Steward of Kirtonos"] = "基尔图诺斯的卫士",
	["The Deed to Southshore"] = "南海镇地契",
	["Journal of Jandice Barov"] = "詹迪斯·巴罗夫的日记",
	["The Deed to Tarren Mill"] = "塔伦米尔地契",
	["The Deed to Brill"] = "布瑞尔地契",
	["The Deed to Caer Darrow"] = "凯尔达隆地契",
	["Torch Lever"] = "火炬",
	["Old Treasure Chest"] = "旧宝藏箱",
	
	--Shadowfang Keep
	["Sorcerer Ashcrombe"] = "巫师阿克鲁比",
	["Deathstalker Adamant"] = "亡灵哨兵阿达曼特",
	["Landen Stilwell"] = "兰登·斯蒂维尔",
	["Deathstalker Vincent"] = "亡灵哨兵文森特",
	["Fel Steed"] = "地狱战马",
	["Jordan's Hammer"] = "乔丹的铁锤",
	["Crate of Ingots"] = "铁锭箱",
	["Arugal's Voidwalker"] = "阿鲁高的虚空行者",
	["The Book of Ur"] = "乌尔之书",
	
	--Stratholme
	["Key to the City"] = "城市大门钥匙",
	["Various Postbox Keys"] = "邮箱钥匙",
	["Living Side"] = "血色区",
	["Undead Side"] = "亡灵区",
	["Stratholme Courier"] = "斯坦索姆信使",
	["Fras Siabi"] = "弗拉斯·希亚比",
	["Atiesh"] = "埃提耶什 <萨格拉斯之手>",
	["Elder Farwhisper"] = "远风长者",
	["Malor's Strongbox"] = "玛洛尔的保险箱",
	["Crimson Hammersmith"] = "红衣铸锤师",
	["Grand Crusader Dathrohan"] = "大十字军战士达索汉",
	["Aurius"] = "奥里克斯",
	["Black Guard Swordsmith"] = "黑衣守卫铸剑师",
	["Ysida Harmon"] = "伊思达·哈尔蒙",
	["Crusaders' Square Postbox"] = "十字军广场邮箱",
	["Market Row Postbox"] = "市场邮箱",
	["Festival Lane Postbox"] = "节日小道邮箱",
	["Elders' Square Postbox"] = "长者广场邮箱",
	["King's Square Postbox"] = "国王广场邮箱",
	["Fras Siabi's Postbox"] = "弗拉斯·希亚比的邮箱",
	["Third Postbox Opened"] = "三个打开的邮箱",
	
	--The Deadmines
	["Sneed's Shredder"] = "斯尼德的伐木机 <伐木工头>",
	["Defias Gunpowder"] = "迪菲亚火药",
	
	--The Sunken Temple
	["Yeh'kinya's Scroll"] = "叶基亚的卷轴",
	["Balcony Minibosses"] = "阳台小boss",
	["Altar of Hakkar"] = "哈卡祭坛",
	["Essence Font"] = "精华之泉",
	["Spawn of Hakkar"] = "哈卡的后代",
	["Elder Starsong"] = "星歌长者",
	["Statue Activation Order"] = "雕像激活顺序",
	["Malfurion Stormrage"] = "玛法里奥·怒风",
	
	--Uldaman
	["Staff of Prehistoria"] = "史前法杖",
	["Baelog's Chest"] = "巴尔洛戈的箱子",
	["Conspicuous Urn"] = "显眼的石罐",
	["Remains of a Paladin"] = "圣骑士的遗体",
	["Annora"] = "安诺拉 <大师级附魔师>",
	["Tablet of Will"] = "意志石板",
	["Shadowforge Cache"] = "暗影熔炉地窖",
	["The Discs of Norgannon"] = "诺甘农圆盘",
	["Ancient Treasure"] = "古代宝藏",
	
	--Zul'Gurub
	["Mudskunk Lure"] = "臭泥鱼诱饵",
	["Gurubashi Mojo Madness"] = "古拉巴什疯狂魔精",
	["Zanza the Restless"] = "无眠者赞扎",
	["Ohgan"] = "奥根",
	["Edge of Madness"] = "疯狂之源",
	["Zealot Zath"] = "狂热者扎斯",
	["Zealot Lor'Khan"] = "狂热者洛卡恩",
	["Muddy Churning Waters"] = "混浊的水",
	["Jinxed Hoodoo Pile"] = "厄运巫毒堆",
	["ZG Enchants"] = "ZG 附魔",		
	
	--************************************************
	-- Instance Entrance Maps
	--************************************************
	
	--Blackrock Mountain (Entrance)
	["Bodley"] = "伯德雷",
	["Overmaster Pyron"] = "征服者派隆";
	["Lothos Riftwaker"] = "洛索斯·天痕";
	["Franclorn Forgewright"] = "弗兰克罗恩·铸铁";
	["Orb of Command"] = "命令宝珠";
	["Scarshield Quartermaster"] = "裂盾军需官 <裂盾军团>";
	
	--Gnomeregan (Entrance)
	["Transpolyporter"] = "传送器",
	["Sprok"] = "斯普洛克 <客队>",
	["Matrix Punchograph 3005-A"] = "矩阵式打孔计算机3005-A",
	["Namdo Bizzfizzle"] = "纳姆杜 <工程学供应商>",
	["Techbot"] = "尖端机器人",
	
	--Maraudon (Entrance)
	["The Nameless Prophet"] = "无名预言者",
	["Kolk"] = "考尔克 <第一可汗>",
	["Gelk"] = "格尔克 <第二可汗>",
	["Magra"] = "玛格拉 <第三可汗>",
	["Cavindra"] = "凯雯德拉",
	["Cursed Centaur"] = "被诅咒的半人马",
	
	--The Deadmines (Entrance)
	["Marisa du'Paige"] = "玛里莎·杜派格";
	["Brainwashed Noble"] = "被洗脑的贵族";
	["Foreman Thistlenettle"] = "工头希斯耐特";
	
	--Sunken Temple (Entrance)
	["Jade"] = "玉龙";
	["Kazkaz the Unholy"] = "邪恶的卡萨卡兹";
	["Zekkis"] = "泽基斯";
	["Veyzhak the Cannibal"] = "食尸者维萨克";
	
	--Uldaman (Entrance)
	["Hammertoe Grez"] = "铁趾格雷兹";
	["Magregan Deepshadow"] = "马格雷甘·深影";
	["Tablet of Ryun'Eh"] = "雷乌纳石板";
	["Krom Stoutarm's Chest"] = "克罗姆·粗臂的箱子";
	["Garrett Family Chest"] = "加勒特的宝箱";
	["Digmaster Shovelphlange"] = "挖掘专家舒尔弗拉格";
	
	--Wailing Caverns (Entrance)
	["Mad Magglish"] = "疯狂的马格利什",
	["Trigore the Lasher"] = "鞭笞者特里高雷",
	["Boahn"] = "博艾恩 <尖牙德鲁伊>",
	["Above the Entrance:"] = "入口上方: ",
	["Ebru"] = "厄布鲁 <纳拉雷克斯的信徒>",
	["Nalpak"] = "纳尔帕克 <纳拉雷克斯的信徒>",
	["Kalldan Felmoon"] = "卡尔丹·暗月 <特殊制皮物资>",
	["Waldor"] = "瓦多尔 <制皮训练师>",
	
	--Dire Maul (Entrance)
	["Dire Pool"] = "厄运之池";
	["Dire Maul Arena"] = "厄运之槌竞技场";
	["Mushgog"] = "姆斯高格";
	["Skarr the Unbreakable"] = "无敌的斯卡尔";
	["The Razza"] = "拉扎尔";
	["Elder Mistwalker"] = "迷雾长者";
	["Griniblix the Spectator"] = "目击者格林比克斯",
	
	--World Bosses
	["Emerald Dragons"] = "翡翠雏龙",
	["Spirit of Azuregos"] = "艾索雷葛斯之魂",
	["Emerald Dragons Trash"] = "翡翠龙小怪",
	["Nethergarde Keep"] = "守望堡",
	
	--Battlegrounds
	
	--Places
	["Friendly Reputation Rewards"] = "友善声望奖励",
	["Honored Reputation Rewards"] = "尊敬声望奖励",
	["Revered Reputation Rewards"] = "崇敬声望奖励",
	["Exalted Reputation Rewards"] = "崇拜声望奖励",
	
	--Alterac Valley (North)
	["Stormpike Guard"] = "洛泰姆中尉",
	["Dun Baldar"] = "丹巴达尔",
	["Vanndar Stormpike"] = "范达尔·雷矛",
	["Dun Baldar North Marshal"] = "丹巴达尔北部统帅",
	["Dun Baldar South Marshal"] = "丹巴达尔南部统帅",
	["Icewing Marshal"] = "冰翼统帅",
	["Iceblood Marshal"] = "冰血统帅",
	["Stonehearth Marshal"] = "石炉统帅",
	["East Frostwolf Marshal"] = "霜狼东部统帅",
	["West Frostwolf Marshal"] = "霜狼西部统帅",
	["Tower Point Marshal"] = "哨塔高地统帅",
	["Prospector Stonehewer"] = "勘查员塔雷·石镐",
	["Irondeep Mine"] = "深铁矿洞",
	["Morloch"] = "莫洛克",
	["Umi Thorson"] = "乌米·索尔森",
	["Keetar"] = "基塔尔",
	["Arch Druid Renferal"] = "大德鲁伊雷弗拉尔",
	["Dun Baldar North Bunker"] = "丹巴达尔北部碉堡",
	["Wing Commander Mulverick"] = "空军指挥官穆维里克",--omitted from AVS
	["Murgot Deepforge"] = "莫高特·深炉",
	["Dirk Swindle"] = "德尔克",
	["Athramanis"] = "亚斯拉玛尼斯",
	["Lana Thunderbrew"] = "兰纳·雷酒",
	["Stormpike Aid Station"] = "雷矛急救站",
	["Stormpike Stable Master"] = "雷矛兽栏管理员",
	["Stormpike Ram Rider Commander"] = "雷矛山羊骑兵指挥官",
	["Svalbrad Farmountain"] = "斯瓦尔布莱德·远山",
	["Kurdrum Barleybeard"] = "库德拉姆·麦须",
	["Stormpike Quartermaster"] = "雷矛军需官",
	["Jonivera Farmountain"] = "约尼维拉·远山",
	["Brogus Thunderbrew"] = "布罗古斯·雷酒",
	["Wing Commander Ichman"] = "空军指挥官艾克曼",--omitted from AVS
	["Wing Commander Slidore"] = "空军指挥官斯里多尔",--omitted from AVS
	["Wing Commander Vipore"] = "空军指挥官维波里",--omitted from AVS
	["Dun Baldar South Bunker"] = "丹巴达尔南部碉堡",
	["Corporal Noreg Stormpike"] = "诺雷格·雷矛中尉",
	["Gaelden Hammersmith"] = "盖尔丁",
	["Stormpike Graveyard"] = "雷矛墓地",
	["Icewing Cavern"] = "冰翼洞穴",
	["Stormpike Banner"] = "雷矛军旗",
	["Stormpike Lumber Yard"] = "雷矛木材场",
	["Wing Commander Jeztor"] = "空军指挥官杰斯托",--omitted from AVS
	["Icewing Bunker"] = "冰翼碉堡",
	["Wing Commander Guse"] = "空军指挥官古斯",--omitted from AVS
	["Stonehearth Graveyard"] = "石炉墓地",
	["Stonehearth Outpost"] = "石炉哨站",
	["Captain Balinda Stonehearth"] = "巴琳达·斯通赫尔斯",
	["Snowfall Graveyard"] = "落雪墓地",
	["Korrak the Bloodrager"] = "血怒者科尔拉克",
	["Ichman's Beacon"] = "艾克曼的信号灯",
	["Mulverick's Beacon"] = "穆维里克的信号灯",
	["Stonehearth Bunker"] = "石炉碉堡",
	["Ivus the Forest Lord"] = "森林之王伊弗斯",
	["Western Crater"] = "西部火山口",
	["Vipore's Beacon"] = "维波里的信号灯",
	["Jeztor's Beacon"] = "杰斯托的信号灯",
	["Eastern Crater"] = "东部火山口",
	["Slidore's Beacon"] = "斯里多尔的信号灯",
	["Guse's Beacon"] = "古斯的信号灯",
	["Graveyards, Capturable Areas"] = "墓地,可占领",--omitted from AVS
	["Bunkers, Towers, Destroyable Areas"] = "碉堡,塔,摧毁地区",--omitted from AVS
	["Assault NPCs, Quest Areas"] = "攻击NPC,任务地区",--omitted from AVS
	["Steamsaw"] = "蒸汽锯",--omitted from AVS
	
	--Alterac Valley (South)
	["Frostwolf Clan"] = "霜狼氏族",
	["Frostwolf Keep"] = "霜狼要塞",
	["Drek'Thar"] = "德雷克塔尔",
	["Duros"] = "杜洛斯",
	["Drakan"] = "德拉卡",
	["West Frostwolf Warmaster"] = "西部霜狼将领",
	["East Frostwolf Warmaster"] = "东部霜狼将领",
	["Tower Point Warmaster"] = "哨塔高地将领",
	["Iceblood Warmaster"] = "冰血将领",
	["Icewing Warmaster"] = "冰翼将领",
	["Stonehearth Warmaster"] = "石炉将领",
	["Dun Baldar North Warmaster"] = "丹巴达尔北部将领",
	["Dun Baldar South Warmaster"] = "丹巴达尔南部将领",
	["Lokholar the Ice Lord"] = "冰雪之王洛克霍拉",
	["Iceblood Garrison"] = "冰血要塞",
	["Captain Galvangar"] = "加尔范上尉",
	["Iceblood Tower"] = "冰血塔",
	["Iceblood Graveyard"] = "冰血墓地",
	["Tower Point"] = "哨塔高地",
	["Coldtooth Mine"] = "冷齿矿洞",
	["Taskmaster Snivvle"] = "工头斯尼维尔",
	["Masha Swiftcut"] = "玛莎",
	["Aggi Rumblestomp"] = "埃其",
	["Frostwolf Graveyard"] = "霜狼墓地",
	["Jotek"] = "乔泰克",
	["Smith Regzar"] = "铁匠雷格萨",
	["Primalist Thurloga"] = "指挥官瑟鲁加",
	["Sergeant Yazra Bloodsnarl"] = "亚斯拉·血矛",
	["Frostwolf Stable Master"] = "霜狼兽栏管理员",
	["Frostwolf Wolf Rider Commander"] = "霜狼骑兵指挥官",
	["Frostwolf Quartermaster"] = "霜狼军需官",
	["West Frostwolf Tower"] = "西霜狼塔",
	["East Frostwolf Tower"] = "东霜狼塔",
	["Frostwolf Relief Hut"] = "霜狼急救站",
	["Wildpaw Cavern"] = "蛮爪洞穴",
	["Frostwolf Banner"] = "霜狼军旗",
	
	--Arathi Basin
	["The Defilers"] = "污染者",
	["The League of Arathor"] = "阿拉索联军",
	["Trollbane Hall"] = "托尔贝恩大厅",
	["Defiler's Den"] = "污染者之穴",
	["Stables"] = "兽栏",
	["Gold Mine"] = "矿洞",
	["Blacksmith"] = "铁匠铺",
	["Lumber Mill"] = "伐木场",
	["Farm"] = "农场",
	
	--Warsong Gulch
	["Warsong Outriders"] = "战歌氏族",
	["Silverwing Sentinels"] = "银翼要塞",
	["Silverwing Hold"] = "银翼要塞",
	["Warsong Lumber Mill"] = "战歌伐木场",
	
	--Flight points
	["Flight Path Maps"] = "飞行地图",
	["Druid-only"] = "只能德鲁伊",
	["Aerie Peak"] = "鹰巢山",
	["Astranaar"] = "阿斯特兰纳",
	["Auberdine"] = "奥伯丁",
	["Bloodvenom Post"] = "血毒岗哨",
	["Booty Bay"] = "藏宝海湾",
	["Brackenwall Village"] = "蕨墙村",
	["Camp Mojache"] = "莫沙彻营地",
	["Camp Taurajo"] = "陶拉祖营地",
	["Cenarion Hold"] = "塞纳里奥要塞",
	["Chillwind Point"] = "冰风岗",
	["Crossroads"] = "十字路口",
	["Darkshire"] = "夜色镇",
	["Everlook"] = "永望镇",
	["Feathermoon Stronghold"] = "羽月要塞",
	["Flame Crest"] = "烈焰峰",
	["Freewind Post"] = "乱风岗",
	["Gadgetzan"] = "加基森",
	["Grom'Gol Base Camp"] = "格罗姆高营地",
	["Hammerfall"] = "落锤镇",
	["Kargath"] = "卡加斯",
	["Lakeshire"] = "湖畔镇",
	["Light's Hope Chapel"] = "圣光之愿礼拜堂",
	["Marshal's Refuge"] = "马绍尔营地",
	["Menethil Harbor"] = "米奈希尔港",
	["Morgan's Vigil"] = "摩根的岗哨",
	["Nethergarde Keep"] = "守望堡",
	["Nighthaven"] = "永夜港",
	["Nijel's Point"] = "尼耶尔前哨站",
	["Ratchet"] = "棘齿城",
	["Refuge Pointe"] = "避难谷地",
	["Revantusk Village"] = "恶齿村",
	["Rut'Theran Village"] = "鲁瑟兰村",
	["Sentinel Hill"] = "哨兵岭",
	["Shadowprey Village"] = "葬影村",
	["Southshore"] = "南海镇",
	["Splintertree Post"] = "碎木岗哨",
	["Stonard"] = "斯通纳德",
	["Stonetalon Peak"] = "石爪峰",
	["Sun Rock Retreat"] = "烈日石居",
	["Talonbranch Glade"] = "刺枝林地",
	["Talrendis Point"] = "塔伦迪斯营地",
	["Tarren Mill"] = "塔伦米尔",
	["Thalanaar"] = "萨兰纳尔",
	["The Sepulcher"] = "瑟伯切尔",
	["The Shimmering Flats"] = "闪光平原",
	["Thelsamar"] = "塞尔萨玛",
	["Theramore Isle"] = "塞拉摩岛",
	["Thorium Point"] = "瑟银哨塔",
	["Valormok"] = "瓦罗莫克",
	["Zoram'gar Outpost"] = "佐拉姆加前哨站",
	["South of the path along Lake Elune'ara"] = "沿着湖的南边的路",
	["West of the path to Timbermaw Hold"] = "木喉要塞路的西向",
	["Tauren Leveling Guide"] = "牛头人指南",
	["Undead Leveling Guide"] = "亡灵指南",
	["Troll/Orc Leveling Guide"] = "巨魔/兽人指南", 
	["Horde Leveling Guide"] = "部落升级指南",
	["Human Leveling Guide"] = "人类升级指南",
	["Night Elf Leveling Guide"] = "暗夜精灵指南",
	["Gnome/Dwarf Leveling Guide"] = "侏儒/矮人指南", 
	["Alliance Leveling Guide"] = "联盟升级指南"
} end)