--[[

-- Atlas Localization Data (Chinese)
-- Initial translation by DiabloHu
-- Version : Chinese (by DiabloHu)
-- Last Update : 6/26/2008
-- http://www.dreamgen.cn

--]]

if ( GetLocale() == "zhCN" ) then


local BLUE = "|cff6666ff";
local GREY = "|cff999999";
local GREN = "|cff66cc33";
local _RED = "|cffcc6666";
local ORNG = "|cffcc9933";
local PURP = "|cff9900ff";
local WHIT = "|cffffffff";
local INDENT = "   ";

AtlasSortIgnore = {"the (.+)"};

ATLAS_TITLE = "Atlas 副本浏览器 by 60addons";
ATLAS_SUBTITLE = "副本地图浏览器";
ATLAS_DESC = "Atlas是一款地图浏览器.";

BINDING_HEADER_ATLAS_TITLE = "Atlas 快捷键";
BINDING_NAME_ATLAS_TOGGLE = "切换 Atlas";
BINDING_NAME_ATLAS_OPTIONS = "切换 设置";
BINDING_NAME_ATLAS_AUTOSEL = "自动选择";

ATLAS_SLASH = "/atlas";
ATLAS_SLASH_OPTIONS = "选项";

ATLAS_STRING_LOCATION = "位置";
ATLAS_STRING_LEVELRANGE = "等级范围";
ATLAS_STRING_PLAYERLIMIT = "玩家限制";
ATLAS_STRING_SELECT_CAT = "选择类别";
ATLAS_STRING_SELECT_MAP = "选择地图";
ATLAS_STRING_SEARCH = "搜索";
ATLAS_STRING_CLEAR = "清除";
ATLAS_STRING_MINLEVEL = "最低等级";

ATLAS_OPTIONS_BUTTON = "选项";
ATLAS_OPTIONS_TITLE = "Atlas 选项";
ATLAS_OPTIONS_SHOWBUT = "显示小地图按钮";
ATLAS_OPTIONS_AUTOSEL = "自动选择副本地图";
ATLAS_OPTIONS_BUTPOS = "按钮位置";
ATLAS_OPTIONS_TRANS = "透明度";
ATLAS_OPTIONS_DONE = "完成";
ATLAS_OPTIONS_REPMAP = "取代世界地图";
ATLAS_OPTIONS_RCLICK = "右键世界地图";
ATLAS_OPTIONS_SHOWMAPNAME = "显示地图名字";
ATLAS_OPTIONS_RESETPOS = "重置位置";
ATLAS_OPTIONS_ACRONYMS = "显示缩略词";
ATLAS_OPTIONS_SCALE = "大小";
ATLAS_OPTIONS_BUTRAD = "按钮半径";
ATLAS_OPTIONS_CLAMPED = "屏幕上锁住窗口";
ATLAS_OPTIONS_HELP = "左键拖动这个窗口.";
ATLAS_OPTIONS_CTRL = "按住CTRL为显示提示";
ATLAS_OPTIONS_COORDS = "在世界地图上显示坐标";

ATLAS_BUTTON_TOOLTIP_TITLE = "Atlas 副本浏览器";
ATLAS_BUTTON_TOOLTIP_HINT = "左键打开 Atlas.\n中键单击 Atlas 设置.\n右键+拖动这个按钮.";
ATLAS_TITAN_HINT = "左键打开 Atlas.\n中键单击 Atlas 设置.\n右键+拖动这个按钮.";

ATLAS_OPTIONS_CATDD = "副本地图排序:"
ATLAS_DDL_CONTINENT = "大陆"
ATLAS_DDL_CONTINENT_EASTERN = "东部王国的副本"
ATLAS_DDL_CONTINENT_KALIMDOR = "卡利姆多的副本"
ATLAS_DDL_LEVEL = "等级";
ATLAS_DDL_LEVEL_MENU = "副本按级别排序";
ATLAS_DDL_PARTYSIZE = "队伍规模";
ATLAS_DDL_PARTYSIZE_5 = "副本 5 人"
ATLAS_DDL_PARTYSIZE_10 = "副本 10 人"
ATLAS_DDL_PARTYSIZE_20 = "副本 20 人"
ATLAS_DDL_PARTYSIZE_40 = "副本 40 人"
ATLAS_DDL_ALL = "所有";
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
ATLAS_SEARCH_UNAVAIL = "搜索不可用"

AtlasZoneSubstitutions = {
	["The Temple of Atal'Hakkar"] = "沉没的神庙";
	["Ahn'Qiraj"] = "安其拉神殿";
};

AtlasLocale = {

--************************************************
-- Zone Names, Acronyms, and Common Strings
--************************************************

	--Common strings
	["Adult"] = "成年的";
	["AKA"] = "另一个名称";
	["Alliance"] = "联盟";
	["Arcane"] = "奥术";
	["Arcane Container"] = "神秘的容器";
	["Argent Dawn"] = "银色黎明";
	["Arms Warrior"] = "武器战士";
	["Attunement Required"] = "需求";
	["Back"] = "返回";
	["Basement"] = "地下室";
	["Bat"] = "蝙蝠";
	["Battleground Maps"] = "战场地图";
	["Battlegrounds"] = "战场";
	["Blacksmithing Plans"] = "锻造图纸";
	["Blue"] = "蓝色";
	["Boss"] = "Boss";
	["Brazier of Invocation"] = "符咒火盆";
	["Chase Begins"] = "追逐开始";
	["Chase Ends"] = "追逐结束";
	["Child"] = "儿童";
	["Connection"] = "连接点";
	["Connections"] = "连接点";
	["Damage: "] = "伤害: ";
	["D2 Summon"] = "T0.5 召唤";
	["Dungeon Locations"] = "副本的位置";
	["East"] = "东";
	["Elevator"] = "电梯";
	["End"] = "结束";
	["Entrance"] = "入口";
	["Event"] = "事件";
	["Exalted"] = "崇拜";
	["Exit"] = "出口";
	["Fire"] = "火焰";
	["Fourth Stop"] = "第四站";
	["Front"] = "前门";
	["Frost"] = "冰霜";
	["Ghost"] = "幽灵";
	["Hallow's End"] = "万圣节";
	["Heroic"] = "英雄模式";
	["Horde Leveling Guide"] = "部落升级指南";
	["Alliance Leveling Guide"] = "联盟升级指南";
	["Holy Paladin"] = "神圣骑士";
	["Holy Priest"] = "神圣牧师";
	["Horde"] = "部落";
	["Hunter"] = "猎人";
	["Imp"] = "小鬼";
	["Instances"] = "副本";
	["Key"] = "钥匙";
	["Lower"] = "下层";
	["Lunar"] = "农历";
	["Lunar Festival"] = "农历节日";
	["Mage"] = "法师";
	["Meeting Stone"] = "集合石";
	["Moonwell"] = "月亮井";
	["Nature"] = "自然";
	["Neutral"] = "中立";
	["North"] = "北";
	["Optional"] = "可跳过";
	["Orange"] = "橙色";
	["Outside"] = "室外";
	["Paladin"] = "圣骑士";
	["Panther"] = "猎豹";
	["Portal"] = "传送";
	["Priest"] = "牧师";
	["Protection Warrior"] = "防护战士";
	["Purple"] = "紫色";
	["Random"] = "随机";
	["Raptor"] = "猛禽";
	["Rare"] = "稀有";
	["Red"] = "红色";
	["Rep"] = "Rep";
	["Repair"] = "修理";
	["Rescued"] = "解救";
	["Retribution Paladin"] = "惩戒圣骑士";
	["Rewards"] = "奖励";
	["Rogue"] = "盗贼";
	["Scourge Invasion"] = "天灾入侵";
	["Second Stop"] = "第二站";
	["Shadow"] = "暗影";
	["Shadow Priest"] = "暗影牧师";
	["Shaman"] = "萨满祭司";
	["Side"] = "旁门";
	["Snake"] = "蛇";
	["South"] = "南";
	["Spawn Point"] = "刷新点";
	["Spider"] = "蜘蛛";
	["Start"] = "开始";
	["Summon"] = "召唤";
	["Teleport"] = "传送";
	["Third Stop"] = "第三站";
	["through "] = "通道 ";
	["Tiger"] = "老虎";
	["Top"] = "顶部";
	["Trash Mobs"] = "小怪";
	["Undead"] = "亡灵";
	["Underwater"] = "水下的";
	["Unknown"] = "未知";
	["Upper"] = "上层";
	["Varies"] = "多个位置";
	["Various"] = "多个";
	["Wanders"] = "游荡";
	["Warlock"] = "术士";
	["Warrior"] = "战士";
	["West"] = "西";
	["White"] = "白色";
	
	--Instance names and acronyms
	["Armory"] = "军械库";
	["Blackfathom Deeps"] = "黑暗深渊"; ["BFD"] = "BFD";
	["Blackrock Depths"] = "黑石深渊"; ["BRD"] = "BRD";
	["Blackrock Spire"] = "黑石塔"; ["LBRS"] = "LBRS"; ["UBRS"] = "UBRS";
	["Blackwing Lair"] = "黑翼之巢"; ["BWL"] = "BWL";
	["Cathedral"] = "大教堂"; ["Cath"] = "Cath";
	["Dire Maul"] = "厄运之槌"; ["DME"] = "DME"; ["DMN"] = "DMN"; ["DMW"] = "DMW";
	["Gnomeregan"] = "诺莫瑞根"; ["Gnome"] = "Gnome";
	["Graveyard"] = "墓地"; ["GY"] = "GY";
	["Library"] = "图书馆"; ["Lib"] = "Lib";
	["Lower Blackrock Spire"] = "黑石塔下层";
	["Maraudon"] = "玛拉顿"; ["Mara"] = "Mara";
	["Molten Core"] = "熔火之心"; ["MC"] = "MC";
	["Naxxramas"] = "纳克萨玛斯"; ["Nax"] = "Nax";
	["Onyxia's Lair"] = "奥妮克希亚的巢穴"; ["Ony"] = "Ony";
	["Ragefire Chasm"] = "怒焰裂谷"; ["RFC"] = "RFC";
	["Razorfen Downs"] = "剃刀沼泽"; ["RFD"] = "RFD";
	["Razorfen Kraul"] = "剃刀沼泽"; ["RFK"] = "RFK";
	["Ruins of Ahn'Qiraj"] = "安其拉废墟"; ["AQ20"] = "AQ20";
	["Scarlet Monastery"] = "血色修道院"; ["SM"] = "SM"; ["SM Lib"] = "SM Lib"; ["SM Arm"] = "SM Arm"; ["SM Cath"] = "SM Cath"; ["SM GY"] = "SM GY";
	["Scholomance"] = "通灵学院"; ["Scholo"] = "Scholo";
	["Shadowfang Keep"] = "影牙城堡"; ["SFK"] = "SFK";
	["Stratholme"] = "斯坦索姆"; ["Strat"] = "Strat";
	["Sunken Temple"] = "沉没的神庙"; ["ST"] = "ST";
	["Temple of Ahn'Qiraj"] = "安其拉神殿"; ["AQ40"] = "AQ40";
	["The Deadmines"] = "死亡矿井"; ["DM"] = "DM";
	["The Stockade"] = "监狱"; ["Stocks"] = "Stocks";
	["Uldaman"] = "奥达曼"; ["Uld"] = "Uld";
	["Upper Blackrock Spire"] = "黑石塔上层";
	["Wailing Caverns"] = "哀嚎洞穴"; ["WC"] = "WC";
	["Zul'Farrak"] = "祖尔法拉克"; ["ZF"] = "ZF";
	["Zul'Gurub"] = "祖尔格拉布"; ["ZG"] = "ZG";
	
	--Continents
	["Eastern Kingdoms"] = "东部王国";
	["Kalimdor"] = "卡利姆多";
	
	--Outdoor zones, Locations
	["Ashenvale"] = "灰谷";
	["Badlands"] = "荒芜之地";
	["Blackrock Mountain"] = "黑石山"; ["BRM"] = "BRM";
	["Burning Steppes"] = "燃烧平原";
	["Deadwind Pass"] = "逆风小径";
	["Desolace"] = "凄凉之地";
	["Dun Morogh"] = "丹莫罗";
	["Dustwallow Marsh"] = "尘泥沼泽";
	["Eastern Plaguelands"] = "东瘟疫之地";
	["Feralas"] = "菲拉斯";
	["Orgrimmar"] = "奥格瑞玛";
	["Searing Gorge"] = "灼热峡谷";
	["Silithus"] = "希利苏斯";
	["Silverpine Forest"] = "银松森林";
	["Stormwind City"] = "暴风城";
	["Stranglethorn Vale"] = "荆棘谷";
	["Swamp of Sorrows"] = "悲伤沼泽";
	["Tanaris"] = "塔纳利斯";
	["The Barrens"] = "贫瘠之地";
	["Tirisfal Glades"] = "提瑞斯法林地";
	["Western Plaguelands"] = "西瘟疫之地";
	["Westfall"] = "西部荒野";
	
	--Set names
	["Set: "] = "套装： ";
	["Embrace of the Viper"] = "毒蛇的拥抱";
	["Ironweave Battlesuit"] = "铁纹作战套装";
	["The Gladiator"] = "角斗士";
	["Spider's Kiss"] = "蜘蛛之吻";
	["Chain of the Scarlet Crusade"] = "血色十字军链甲";
	["Necropile Raiment"] = "骨堆";
	["Cadaverous Garb"] = "苍白";
	["Bloodmail Regalia"] = "血链";
	["Deathbone Guardian"] = "亡者之骨";
	["The Postmaster"] = "邮差";
	["Defias Leather"] = "迪菲亚皮甲";
	["Primal Blessing"] = "原始祝福";
	["The Twin Blades of Hakkari"] = "哈卡莱双刃";
	["D1/D2 Sets"] = "T0/T0.5套装";
	["ZG Sets"] = "祖阁套装";
	["ZG Ring Sets"] = "祖阁戒指套装";
	["AQ20 Sets"] = "AQ20套装";
	["AQ40 Sets"] = "AQ40套装";
	["T1 Sets"] = "T1套装";
	["T2 Sets"] = "T2套装";
	["T3 Sets"] = "T3套装";

--************************************************
-- Kalimdor Instance Data
--************************************************

	--Ragefire Chasm
	["Maur Grimtotem"] = "玛尔·恐怖图腾";
	["Oggleflint <Ragefire Chieftain>"] = "奥格弗林特<怒焰酋长>";
	["Taragaman the Hungerer"] = "饥饿者塔拉加曼";
	["Jergosh the Invoker"] = "祈求者耶戈什";
	["Zelemar the Wrathful"] = "Zelemar the Wrathful";
	["Bazzalan"] = "巴扎兰";
	
	--Wailing Caverns
	["Disciple of Naralex"] = "纳拉雷克斯的信徒";
	["Mysterious Wailing Caverns Chest"] = "神秘的哀嚎洞穴的箱子";
	["Lord Cobrahn <Fanglord>"] = "考布莱恩<毒牙之王>";
	["Lady Anacondra <Fanglord>"] = "安娜科德拉<毒牙之王>";
	["Kresh"] = "克雷什";
	["Lord Pythas <Fanglord>"] = "皮萨斯<毒牙之王>";
	["Skum"] = "斯卡姆";
	["Lord Serpentis <Fanglord>"] = "瑟芬迪斯<毒牙之王>";
	["Verdan the Everliving"] = "永生者沃尔丹";
	["Mutanus the Devourer"] = "吞噬者穆坦努斯";
	["Naralex"] = "纳拉雷克斯";
	["Deviate Faerie Dragon"] = "变异精灵龙";
	
	--Blackfathom Deeps
	["Ghamoo-ra"] = "加摩拉";
	["Lorgalis Manuscript"] = "洛迦里斯手稿";
	["Lady Sarevess"] = "萨利维丝";
	["Argent Guard Thaelrid <The Argent Dawn>"] = "斥候塞尔瑞德<银色黎明>";
	["Gelihast"] = "格里哈斯特";
	["Shrine of Gelihast"] = "格里哈斯特神殿";
	["Lorgus Jett"] = "洛古斯·杰特";
	["Fathom Stone"] = "深渊之石";
	["Baron Aquanis"] = "阿奎尼斯男爵";
	["Twilight Lord Kelris"] = "梦游者克尔里斯";
	["Old Serra'kis"] = "瑟拉吉斯";
	["Aku'mai"] = "阿库麦尔";
	["Morridune"] = "莫瑞杜恩";
	["Altar of the Deeps"] = "玛塞斯特拉祭坛";
	
	--Razorfen Kraul
	["Roogug"] = "鲁古格";
	["Aggem Thorncurse <Death's Head Prophet>"] = "阿格姆<亡首预言者>";
	["Death Speaker Jargba <Death's Head Captain>"] = "亡语者贾格巴<亡首预言者>";
	["Overlord Ramtusk"] = "主宰拉姆塔斯";
	["Razorfen Spearhide"] = "剃刀沼泽刺鬃守卫";
	["Agathelos the Raging"] = "暴怒的阿迦赛罗斯";
	["Blind Hunter"] = "盲眼猎手";
	["Charlga Razorflank <The Crone>"] = "卡尔加·刺肋<长者>";
	["Willix the Importer"] = "进口商威利克斯";
	["Heralath Fallowbrook"] = "赫尔拉斯·静水";
	["Earthcaller Halmgar"] = "唤地者哈穆加";

	--Razorfen Downs
	["Tuten'kash"] = "图特卡什";
	["Henry Stern"] = "亨利·斯特恩";
	["Belnistrasz"] = "奔尼斯特拉兹";
	["Sah'rhee"] = "萨哈斯";
	["Lady Falther'ess"] = "法瑟蕾丝夫人";
	["Mordresh Fire Eye"] = "火眼莫德雷斯";
	["Glutton"] = "暴食者";
	["Ragglesnout"] = "拉戈斯诺特";
	["Amnennar the Coldbringer"] = "寒冰之王亚门纳尔";
	["Plaguemaw the Rotting"] = "腐烂的普雷莫尔";
	
	--Zul'Farrak
	["Mallet of Zul'Farrak"] = "祖尔法拉克之槌";
	["Antu'sul <Overseer of Sul>"] = "安图苏尔<苏尔监督者>";
	["Theka the Martyr"] = "殉教者塞卡";
	["Witch Doctor Zum'rah"] = "巫医祖穆拉恩";
	["Zul'Farrak Dead Hero"] = "祖尔法拉克阵亡英雄";
	["Nekrum Gutchewer"] = "耐克鲁姆";
	["Shadowpriest Sezz'ziz"] = "暗影祭司塞瑟斯";
	["Dustwraith"] = "灰尘怨灵";
	["Sergeant Bly"] = "布莱中士";
	["Weegli Blastfuse"] = "维格利";
	["Murta Grimgut"] = "穆尔塔";
	["Raven"] = "拉文";
	["Oro Eyegouge"] = "欧罗·血眼";
	["Sandfury Executioner"] = "沙怒刽子手";
	["Hydromancer Velratha"] = "水占师维蕾萨";
	["Gahz'rilla"] = "加兹瑞拉";
	["Elder Wildmane"] = "蛮鬃长者";
	["Chief Ukorz Sandscalp"] = "乌克兹·沙顶";
	["Ruuzlu"] = "卢兹鲁";
	["Zerillis"] = "泽雷利斯";
	["Sandarr Dunereaver"] = "杉达尔·沙掠者";
	
	--Maraudon	
	["Scepter of Celebras"] = "塞雷布拉斯节杖";
	["Veng <The Fifth Khan>"] = "温格<第五可汗>";
	["Noxxion"] = "诺克赛恩";
	["Razorlash"] = "锐刺鞭笞者";
	["Maraudos <The Fourth Khan>"] = "玛拉多斯<第四可汗>";
	["Lord Vyletongue"] = "维利塔恩";
	["Meshlok the Harvester"] = "收割者麦什洛克";
	["Celebras the Cursed"] = "被诅咒的塞雷布拉斯";
	["Landslide"] = "兰斯利德";
	["Tinkerer Gizlock"] = "工匠吉兹洛克";
	["Rotgrip"] = "洛特格里普";
	["Princess Theradras"] = "瑟莱德丝公主";
	["Elder Splitrock"] = "碎石长者";
	
	--Dire Maul (East)
	["Pusillin"] = "普希林";
	["Zevrim Thornhoof"] = "瑟雷姆·刺蹄";
	["Hydrospawn"] = "海多斯博恩";
	["Lethtendris"] = "蕾瑟塔蒂丝";
	["Pimgib"] = "匹姆吉布";
	["Old Ironbark"] = "埃隆巴克";
	["Alzzin the Wildshaper"] = "奥兹恩";
	["Isalien"] = "依萨利恩";
	["A Dusty Tome"] = "布满灰尘的书籍";
	["Felvine Shard"] = "魔藤碎片";
	["Dire Maul Books"] = "厄运之槌的书";
	
	--Dire Maul (North)
	["Crescent Key"] = "月牙钥匙";--omitted from Dire Maul (West)
	["Gordok Courtyard Key"] = "戈多克庭院钥匙";
	["Gordok Inner Door Key"] = "戈多克内门钥匙";
	--"Library" omitted from here and DM West because of SM: "Library" duplicate
	["Guard Mol'dar"] = "卫兵摩尔达";
	["Stomper Kreeg <The Drunk>"] = "践踏者克雷格<醉鬼>";
	["Guard Fengus"] = "卫兵芬古斯";
	["Knot Thimblejack"] = "诺特·希姆加克";
	["Guard Slip'kik"] = "卫兵斯里基克";
	["Captain Kromcrush"] = "克罗卡斯";
	["King Gordok"] = "戈多克大王";
	["Cho'Rush the Observer"] = "观察者克鲁什";
	["Falrin Treeshaper"] = "法尔林·树影";
	["Lorekeeper Lydros"] = "博学者莱德罗斯";
	["Lorekeeper Javon"] = "博学者亚沃";
	["Lorekeeper Kildrath"] = "博学者基尔达斯";
	["Lorekeeper Mykos"] = "博学者麦库斯";
	["Shen'dralar Provisioner"] = "辛德拉圣职者";
	["Skeletal Remains of Kariel Winthalus"] = "卡里尔·温萨鲁斯的骸骨";
	["Tribute Run"] = "贡品";

	--Dire Maul (West)
	["J'eevee's Jar"] = "耶维尔的瓶子";
	["Pylons"] = "水晶塔";
	["Shen'dralar Ancient"] = "辛德拉古灵";
	["Tendris Warpwood"] = "特迪斯·扭木";
	["Ancient Equine Spirit"] = "上古圣马之魂";
	["Illyanna Ravenoak"] = "伊琳娜·暗木";
	["Ferra"] = "费拉";
	["Magister Kalendris"] = "卡雷迪斯镇长";
	["Tsu'zee"] = "苏斯";
	["Immol'thar"] = "伊莫塔尔";
	["Lord Hel'nurath"] = "赫尔努拉斯";
	["Prince Tortheldrin"] = "托塞德林王子";
	["Falrin Treeshaper"] = "法尔林·树影";
	["Lorekeeper Lydros"] = "博学者莱德罗斯";
	["Lorekeeper Javon"] = "博学者亚沃";
	["Lorekeeper Kildrath"] = "博学者基尔达斯";
	["Lorekeeper Mykos"] = "博学者麦库斯";
	["Shen'dralar Provisioner"] = "辛德拉圣职者";
	["Skeletal Remains of Kariel Winthalus"] = "卡里尔·温萨鲁斯的骸骨";
	["The Prince's Chest"] = "王子的箱子";
	["Revanchion"] = "雷瓦克安";
	
	--Onyxia's Lair
	["Drakefire Amulet"] = "龙火护符";
	["Onyxian Warders"] = "奥妮克希亚守卫";
	["Whelp Eggs"] = "幼龙的蛋";
	["Onyxia"] = "奥妮克希亚";

	--Temple of Ahn'Qiraj
	["Brood of Nozdormu"] = "诺兹多姆的子嗣";
	["The Prophet Skeram"] = "预言者斯克拉姆";
	["Bug Trio"] = "虫子一家";
	["Vem"] = "维姆";
	["Lord Kri"] = "克里勋爵";
	["Princess Yauj"] = "亚尔基公主";
	["Battleguard Sartura"] = "沙尔图拉";
	["Fankriss the Unyielding"] = "顽强的范克瑞斯";
	["Viscidus"] = "维希度斯";
	["Princess Huhuran"] = "哈霍兰公主";
	["Twin Emperors"] = "双子皇帝";
	["Emperor Vek'lor"] = "维克洛尔大帝";
	["Emperor Vek'nilash"] = "维克尼拉斯大帝";
	["Ouro"] = "奥罗";
	["C'Thun"] = "克苏恩";
	["Andorgos <Brood of Malygos>"] = "安多葛斯<玛里苟斯的后裔>";
	["Vethsera <Brood of Ysera>"] = "温瑟拉<伊瑟拉的后裔>";
	["Kandrostrasz <Brood of Alexstrasza>"] = "坎多斯特拉兹<雅立史卓莎的后裔>";
	["Arygos"] = "阿瑞苟斯";
	["Caelestrasz"] = "凯雷斯特拉兹";
	["Merithra of the Dream"] = "梦境之龙麦琳瑟拉";
	["AQ Enchants"] = "安其拉附魔";
	["AQ Opening Quest Chain"] = "安其拉任务链";
	
	--Ruins of Ahn'Qiraj
	["Cenarion Circle"] = "塞纳里奥议会";
	["Kurinnaxx"] = "库林纳克斯";
	["Lieutenant General Andorov"] = "安多洛夫中将";
	["Four Kaldorei Elites"] = "四卡多雷精英";
	["General Rajaxx"] = "拉贾克斯将军";
	["Captain Qeez"] = "奎兹上尉";
	["Captain Tuubid"] = "图比德上尉";
	["Captain Drenn"] = "德雷恩上尉";
	["Captain Xurrem"] = "库雷姆上尉";
	["Major Yeggeth"] = "耶吉斯少校";
	["Major Pakkon"] = "帕库少校";
	["Colonel Zerran"] = "泽兰上校";
	["Moam"] = "莫阿姆";
	["Buru the Gorger"] = "吞咽者布鲁";
	["Ayamiss the Hunter"] = "狩猎者阿亚米斯";
	["Ossirian the Unscarred"] = "无疤者奥斯里安";
	["Safe Room"] = "安全室";
	["Class Books"] = "职业书籍";
	["AQ20 Class Sets"] = "AQ20职业套装";
	
--****************************
-- Eastern Kingdoms Instances
--****************************
	
	--Blackrock Depths
	["Shadowforge Key"] = "暗炉钥匙";
	["Prison Cell Key"] = "监狱牢房钥匙";
	["Jail Break!"] = "冲破牢笼！";
	["Banner of Provocation"] = "挑战之旗";
	["Lord Roccor"] = "洛考尔";
	["Kharan Mighthammer"] = "卡兰·巨锤";
	["Commander Gor'shak <Kargath Expeditionary Force>"] = "指挥官哥沙克<卡加斯远征军>";
	["Marshal Windsor"] = "温德索尔元帅";
	["High Interrogator Gerstahn <Twilight's Hammer Interrogator>"] = "审讯官格斯塔恩<暮光之锤审问者>";
	["Ring of Law"] = "法律之环(竞技场)";
	["Anub'shiah"] = "阿努希尔";
	["Eviscerator"] = "剜眼者";
	["Gorosh the Dervish"] = "修行者高罗什";
	["Grizzle"] = "格里兹尔";
	["Hedrum the Creeper"] = "爬行者赫杜姆";
	["Ok'thor the Breaker"] = "破坏者奥科索尔";
	["Theldren"] = "塞尔德林";
	["Lefty"] = "莱弗提";
	["Malgen Longspear"] = "玛尔根·长矛";
	["Gnashjaw <Malgen Longspear's Pet>"] = "碎腭<玛尔根·长矛的宠物>";
	["Korv"] = "考尔夫";
	["Rezznik"] = "雷兹尼克";
	["Rotfang"] = "烂牙";
	["Snokh Blackspine"] = "斯诺恩·黑骨";
	["Va'jashni"] = "瓦亚辛";
	["Volida"] = "沃莉达";
	["Houndmaster Grebmar"] = "驯犬者格雷布玛尔";
	["Elder Morndeep"] = "黎明长者";
	["High Justice Grimstone"] = "裁决者格里斯通";
	["Monument of Franclorn Forgewright"] = "弗兰克罗恩·铸铁的雕像";
	["Pyromancer Loregrain"] = "控火师罗格雷恩";
	["The Vault"] = "宝库";
	["Warder Stilgiss"] = "典狱官斯迪尔基斯";
	["Verek"] = "维雷克";
	["Watchman Doomgrip"] = "卫兵杜格瑞普";
	["Fineous Darkvire <Chief Architect>"] = "弗诺斯·达克维尔<首席建筑师>";
	["The Black Anvil"] = "黑铁砧";
	["Lord Incendius"] = "伊森迪奥斯";
	["Bael'Gar"] = "贝尔加";
	["Shadowforge Lock"] = "暗炉之锁";
	["General Angerforge"] = "安格弗将军";
	["Golem Lord Argelmach"] = "傀儡统帅阿格曼奇";
	["Field Repair Bot 74A"] = "修理机器人74A型";
	["The Grim Guzzler"] = "可怕的醉鬼";
	["Hurley Blackbreath"] = "霍尔雷·黑须";
	["Lokhtos Darkbargainer <The Thorium Brotherhood>"] = "罗克图斯·暗契<瑟银兄弟会>";
	["Mistress Nagmara"] = "娜玛拉小姐";
	["Phalanx"] = "法拉克斯";
	["Plugger Spazzring"] = "普拉格";
	["Private Rocknot"] = "罗克诺特下士";
	["Ribbly Screwspigot"] = "雷布里·斯库比格特";
	["Ambassador Flamelash"] = "弗莱拉斯大使";
	["Panzor the Invincible"] = "无敌的潘佐尔";
	["Summoner's Tomb"] = "召唤者之墓";
	["Chest of The Seven"] = "七贤之箱";
	["The Lyceum"] = "讲学厅";
	["Magmus"] = "玛格姆斯";
	["Emperor Dagran Thaurissan"] = "达格兰·索瑞森大帝";
	["Princess Moira Bronzebeard <Princess of Ironforge>"] = "铁炉堡公主茉艾拉·铜须<铁炉堡公主>";
	["High Priestess of Thaurissan"] = "索瑞森高阶女祭司";
	["The Black Forge"] = "黑熔炉";
	["Core Fragment"] = "熔火碎片";
	["Overmaster Pyron"] = "征服者派隆";
	["BRDRogue"] = "|cfffff468盗贼";
	["BRDHunter"] = "|cffaad372猎人";
	["BRDMage"] = "|cff68ccef法师";
	["BRDPet"] = "|cffaad372宠物";
	["BRDPriest"] = "|cffffffff牧师";
	["BRDShaman"] = "|cff2773ff萨满祭司";
	["BRDEngineer"] = "|cffc69b6d工程学";

	--Blackrock Spire (Lower)
	["Vaelan"] = "阿克莱德";
	["Warosh <The Cursed>"] = "瓦罗什<被诅咒者>";
	["Elder Stonefort"] = "石墙长者";
	["Roughshod Pike"] = "尖锐长矛";
	["Spirestone Butcher"] = "尖石屠夫";
	["Highlord Omokk"] = "欧莫克大王";
	["Spirestone Battle Lord"] = "尖石统帅";
	["Spirestone Lord Magus"] = "尖石首席法师";
	["Shadow Hunter Vosh'gajin"] = "暗影猎手沃什加斯";
	["Fifth Mosh'aru Tablet"] = "第五块摩沙鲁石板";
	["Bijou"] = "比修";
	["War Master Voone"] = "指挥官沃恩";
	["Mor Grayhoof"] = "莫尔·灰蹄";
	["Sixth Mosh'aru Tablet"] = "第六块摩沙鲁石板";
	["Bijou's Belongings"] = "比修的装置";
	["Human Remains"] = "人类遗骸";
	["Unfired Plate Gauntlets"] = "未淬火的板甲护手";
	["Bannok Grimaxe <Firebrand Legion Champion>"] = "班诺克·巨斧<火印军团勇士>";
	["Mother Smolderweb"] = "烟网蛛后";
	["Crystal Fang"] = "水晶之牙";
	["Urok's Tribute Pile"] = "乌洛克的贡品堆";
	["Urok Doomhowl"] = "乌洛克";
	["Quartermaster Zigris <Bloodaxe Legion>"] = "军需官兹格雷斯<血斧军团>";
	["Halycon"] = "哈雷肯";
	["Gizrul the Slavener"] = "奴役者基兹鲁尔";
	["Ghok Bashguud <Bloodaxe Champion>"] = "霍克·巴什古德<血斧军团的勇士>";
	["Overlord Wyrmthalak"] = "维姆萨拉克";
	["Burning Felguard"] = "燃烧恶魔卫士";

	--Blackrock Spire (Upper)
	["Seal of Ascension"] = "原始晋升印章";
	["Pyroguard Emberseer"] = "烈焰卫士艾博希尔";
	["Solakar Flamewreath"] = "索拉卡·火冠";
	["Father Flame"] = "烈焰之父";
	["Darkstone Tablet"] = "黑暗石板";
	["Doomrigger's Coffer"] = "末日扣环之箱";
	["Jed Runewatcher <Blackhand Legion>"] = "杰德<黑手军团>";
	["Goraluk Anvilcrack <Blackhand Legion Armorsmith>"] = "古拉鲁克<黑手军团护甲锻造师>";
	["Warchief Rend Blackhand"] = "大酋长雷德·黑手";
	["Gyth <Rend Blackhand's Mount>"] = "盖斯<雷德·黑手的坐骑>";
	["Awbee"] = "奥比";
	["The Beast"] = "比斯巨兽";
	["Lord Valthalak"] = "瓦塔拉克公爵";
	["Finkle Einhorn"] = "芬克·恩霍尔";
	["General Drakkisath"] = "达基萨斯将军";
	["Drakkisath's Brand"] = "达基萨斯的烙印";
	
	--Blackwing Lair
	["Razorgore the Untamed"] = "狂野的拉佐格尔";
	["Vaelastrasz the Corrupt"] = "堕落的瓦拉斯塔兹";
	["Broodlord Lashlayer"] = "勒西雷尔";
	["Firemaw"] = "费尔默";
	["Draconic for Dummies"] = "龙语傻瓜教程";
	["Master Elemental Shaper Krixix"] = "大元素师克里希克";
	["Ebonroc"] = "埃博诺克";
	["Flamegor"] = "弗莱格尔";
	["Chromaggus"] = "克洛玛古斯";
	["Nefarian"] = "奈法利安";
	["Alchemy Lab"] = "炼金实验室";
	
	--Gnomeregan
	["Workshop Key"] = "车间钥匙";
	["Blastmaster Emi Shortfuse"] = "爆破专家艾米·短线";
	["Grubbis"] = "格鲁比斯";
	["Chomper"] = "咀嚼者";
	["Clean Room"] = "清洁室";
	["Tink Sprocketwhistle <Engineering Supplies>"] = "丁克·铁哨<工程学供应商>";
	["The Sparklematic 5200"] = "超级清洁器5200型";
	["Mail Box"] = "信箱";
	["Kernobee"] = "克努比";
	["Alarm-a-bomb 2600"] = "警报炸弹2600型";
	["Matrix Punchograph 3005-B"] = "矩阵式打孔计算机3005-B";
	["Viscous Fallout"] = "粘性辐射尘";
	["Electrocutioner 6000"] = "电刑器6000型";
	["Matrix Punchograph 3005-C"] = "矩阵式打孔计算机3005-C";
	["Crowd Pummeler 9-60"] = "群体打击者9-60";
	["Matrix Punchograph 3005-D"] = "矩阵式打孔计算机3005-D";
	["Dark Iron Ambassador"] = "黑铁大使";
	["Mekgineer Thermaplugg"] = "机械师瑟玛普拉格";
	
	--Molten Core
	["Hydraxian Waterlords"] = "海达希亚水元素";
	["Aqual Quintessence"] = "水之精萃";
	["Eternal Quintessence"] = "永恒精萃";
	["Lucifron"] = "鲁西弗隆";
	["Magmadar"] = "玛格曼达";
	["Gehennas"] = "基赫纳斯";
	["Garr"] = "加尔";
	["Shazzrah"] = "沙斯拉尔";
	["Baron Geddon"] = "迦顿男爵";
	["Golemagg the Incinerator"] = "焚化者古雷曼格";
	["Sulfuron Harbinger"] = "萨弗隆先驱者";
	["Majordomo Executus"] = "管理者埃克索图斯";
	["Ragnaros"] = "拉格纳罗斯";
	["Random Boss Loot"] = "随机Boss掉落";

	--SM: Library
	["Houndmaster Loksey"] = "驯犬者洛克希";
	["Arcanist Doan"] = "秘法师杜安";
	["Doan's Strongbox"] = "杜安的保险箱";

	--SM: Armory
	["The Scarlet Key"] = "血色十字军钥匙";--omitted from SM: Cathedral
	["Herod <The Scarlet Champion>"] = "赫洛德<血色勇士>";

	--SM: Cathedral
	["High Inquisitor Fairbanks"] = "大检察官法尔班克斯";
	["Scarlet Commander Mograine"] = "血色十字军指挥官莫格莱尼";
	["High Inquisitor Whitemane"] = "大检察官怀特迈恩";

	--SM: Graveyard
	["Interrogator Vishas"] = "审讯员韦沙斯";
	["Vorrel Sengutz"] = "沃瑞尔·森加斯";
	["Bloodmage Thalnos"] = "血法师萨尔诺斯";
	["Ironspine"] = "铁脊死灵";
	["Azshir the Sleepless"] = "永醒的艾希尔";
	["Fallen Champion"] = "亡灵勇士";
	["Scorn"] = "瑟克恩";
	
	--Scholomance
	["Skeleton Key"] = "骷髅钥匙";
	["Viewing Room Key"] = "观察室钥匙";
	["Viewing Room"] = "观察室";
	["Blood of Innocents"] = "无辜者的血";
	["Divination Scryer"] = "预言水晶球";
	["Blood Steward of Kirtonos"] = "基尔图诺斯的卫士";
	["The Deed to Southshore"] = "南海镇地契";
	["Kirtonos the Herald"] = "传令官基尔图诺斯";
	["Jandice Barov"] = "詹迪斯·巴罗夫";
	["Journal of Jandice Barov"] = "詹迪斯·巴罗夫的日记";
	["The Deed to Tarren Mill"] = "塔伦米尔地契";
	["Lord Blackwood"] = "布莱克伍德公爵";
	["Rattlegore"] = "血骨傀儡";
	["Death Knight Darkreaver"] = "死亡骑士达克雷尔";
	["Marduk Blackpool"] = "马杜克·布莱克波尔";
	["Vectus"] = "维克图斯";
	["Ras Frostwhisper"] = "莱斯·霜语";
	["The Deed to Brill"] = "布瑞尔地契";
	["Kormok"] = "库尔莫克";
	["Instructor Malicia"] = "讲师玛丽希亚";
	["Doctor Theolen Krastinov <The Butcher>"] = "瑟尔林·卡斯迪诺夫教授<屠夫>";
	["Lorekeeper Polkelt"] = "博学者普克尔特";
	["The Ravenian"] = "拉文尼亚";
	["Lord Alexei Barov"] = "阿雷克斯·巴罗夫领主";
	["The Deed to Caer Darrow"] = "凯尔达隆地契";
	["Lady Illucia Barov"] = "伊露希亚·巴罗夫";
	["Darkmaster Gandling"] = "黑暗院长加丁";
	["Torch Lever"] = "控制杆";
	["Secret Chest"] = "秘密的箱子";
	["Alchemy Lab"] = "炼金实验室";
	["Old Treasure Chest"] = "旧宝藏箱";
	
	--Shadowfang Keep
	["Deathsworn Captain"] = "死亡之誓";
	["Rethilgore <The Cell Keeper>"] = "雷希戈尔<牢房看守>";
	["Sorcerer Ashcrombe"] = "巫师阿克鲁比";
	["Deathstalker Adamant"] = "亡灵哨兵阿达曼特";
	["Landen Stilwell"] = "Landen Stilwell";
	["Deathstalker Vincent"] = "亡灵哨兵文森特";
	["Fel Steed"] = "地狱战马";
	["Jordan's Hammer"] = "乔丹的铁锤";
	["Crate of Ingots"] = "铁锭箱";
	["Razorclaw the Butcher"] = "屠夫拉佐克劳";
	["Baron Silverlaine"] = "席瓦莱恩男爵";
	["Commander Springvale"] = "指挥官斯普林瓦尔";
	["Odo the Blindwatcher"] = "盲眼守卫奥杜";
	["Fenrus the Devourer"] = "吞噬者芬鲁斯";
	["Arugal's Voidwalker"] = "阿鲁高的虚空行者";
	["The Book of Ur"] = "乌尔之书";
	["Wolf Master Nandos"] = "狼王南杜斯";
	["Archmage Arugal"] = "大法师阿鲁高";
	["Sever"] = "塞沃尔";

	--Stratholme
	["The Scarlet Key"] = "血色十字军钥匙";
	["Key to the City"] = "城市大门钥匙";
	["Various Postbox Keys"] = "各种邮箱的钥匙";
	["Living Side"] = "血色区";
	["Undead Side"] = "亡灵区";
	["Skul"] = "斯库尔";
	["Stratholme Courier"] = "斯坦索姆信使";
	["Fras Siabi"] = "弗拉斯·希亚比";
	["Atiesh <Hand of Sargeras>"] = "埃提耶什<萨格拉斯之手>";
	["Balzaphon"] = "巴尔萨冯";
	["Hearthsinger Forresten"] = "弗雷斯特恩";
	["The Unforgiven"] = "不可宽恕者";
	["Elder Farwhisper"] = "远风长者";
	["Timmy the Cruel"] = "悲惨的提米";
	["Malor the Zealous"] = "指挥官玛洛尔";
	["Malor's Strongbox"] = "玛洛尔的保险箱";
	["Crimson Hammersmith"] = "红衣铸锤师";
	["Cannon Master Willey"] = "炮手威利";
	["Archivist Galford"] = "档案管理员加尔福特";
	["Grand Crusader Dathrohan"] = "大十字军战士达索汉";
	["Balnazzar"] = "巴纳扎尔";
	["Sothos"] = "索托斯";
	["Jarien"] = "亚雷恩";
	["Magistrate Barthilas"] = "巴瑟拉斯镇长";
	["Aurius"] = "奥里克斯";
	["Stonespine"] = "石脊";
	["Baroness Anastari"] = "安娜丝塔丽男爵夫人";
	["Black Guard Swordsmith"] = "黑衣守卫铸剑师";
	["Nerub'enkan"] = "奈鲁布恩坎";
	["Maleki the Pallid"] = "苍白的玛勒基";
	["Ramstein the Gorger"] = "吞咽者拉姆斯登";
	["Baron Rivendare"] = "瑞文戴尔男爵";
	["Ysida Harmon"] = "伊思达·哈尔蒙";
	["Crusaders' Square Postbox"] = "十字军广场邮箱";
	["Market Row Postbox"] = "市场邮箱";
	["Festival Lane Postbox"] = "节日小道邮箱";
	["Elders' Square Postbox"] = "长者广场邮箱";
	["King's Square Postbox"] = "国王广场邮箱";
	["Fras Siabi's Postbox"] = "弗拉斯·希亚比的邮箱";
	["Third Postbox Opened"] = "打开第三邮箱";
	["Postmaster Malown"] = "邮差马龙";

	--The Deadmines
	["Rhahk'Zor <The Foreman>"] = "拉克佐<工头>";
	["Miner Johnson"] = "矿工约翰森";
	["Sneed <Lumbermaster>"] = "斯尼德<伐木工头>";
	["Sneed's Shredder <Lumbermaster>"] = "斯尼德的伐木机<伐木工头>";
	["Gilnid <The Smelter>"] = "基尔尼格<熔炼师>";
	["Defias Gunpowder"] = "迪菲亚火药";
	["Captain Greenskin"] = "绿皮队长";
	["Edwin VanCleef <Defias Kingpin>"] = "艾德温·范克里夫<迪菲亚兄弟会首脑>";
	["Mr. Smite <The Ship's First Mate>"] = "重拳先生<船上的大副>";
	["Cookie <The Ship's Cook>"] = "曲奇<船上的厨师>";
	
	--The Stockade
	["Targorr the Dread"] = "可怕的塔格尔";
	["Kam Deepfury"] = "卡姆·深怒";
	["Hamhock"] = "哈姆霍克";
	["Bazil Thredd"] = "巴基尔·斯瑞德";
	["Dextren Ward"] = "迪克斯特·瓦德";
	["Bruegal Ironknuckle"] = "布鲁高·铁拳";

	--The Sunken Temple
	["The Temple of Atal'Hakkar"] = "阿塔哈卡神庙";
	["Yeh'kinya's Scroll"] = "叶基亚的卷轴";
	["Balcony Minibosses"] = "阳台小Boss";
	["Gasher"] = "加什尔";
	["Loro"] = "洛若尔";
	["Hukku"] = "胡库";
	["Zolo"] = "祖罗";
	["Mijan"] = "米杉";
	["Zul'Lor"] = "祖罗尔";
	["Altar of Hakkar"] = "哈卡祭坛";
	["Atal'alarion <Guardian of the Idol>"] = "阿塔拉利恩<卫像者>";
	["Dreamscythe"] = "德姆塞卡尔";
	["Weaver"] = "德拉维沃尔";
	["Avatar of Hakkar"] = "哈卡的化身";
	["Jammal'an the Prophet"] = "预言者迦玛兰";
	["Ogom the Wretched"] = "可悲的奥戈姆";
	["Morphaz"] = "摩弗拉斯";
	["Hazzas"] = "哈扎斯";
	["Shade of Eranikus"] = "伊兰尼库斯的阴影";
	["Essence Font"] = "精华之泉";
	["Spawn of Hakkar"] = "哈卡的后代";
	["Elder Starsong"] = "星歌长者";
	["Statue Activation Order"] = "雕像的激活顺序";
	["Malfurion Stormrage"] = "玛法里奥·怒风";
	
	--Uldaman
	["Staff of Prehistoria"] = "史前法杖";
	["Baelog"] = "巴尔洛戈";
	["Eric \"The Swift\""] = "埃瑞克";
	["Olaf"] = "奥拉夫";
	["Baelog's Chest"] = "巴尔洛戈的箱子";
	["Conspicuous Urn"] = "显眼的石罐";
	["Remains of a Paladin"] = "圣骑士的遗体";
	["Revelosh"] = "鲁维罗什";
	["Ironaya"] = "Ironaya";
	["Obsidian Sentinel"] = "黑曜石哨兵";
	["Annora <Enchanting Trainer>"] = "安诺拉<附魔训练师>";
	["Ancient Stone Keeper"] = "远古巨石卫士";
	["Galgann Firehammer"] = "加加恩·火锤";
	["Tablet of Will"] = "意志石板";
	["Shadowforge Cache"] = "暗影熔炉地窖";
	["Grimlok <Stonevault Chieftain>"] = "格瑞姆洛克<石窟酋长>";
	["Archaedas <Ancient Stone Watcher>"] = "阿扎达斯<远古石之看守者>";
	["The Discs of Norgannon"] = "诺甘农圆盘";
	["Ancient Treasure"] = "古代宝藏";
	
	--Zul'Gurub
	["Zandalar Tribe"] = "赞达拉部族";
	["Mudskunk Lure"] = "臭泥鱼诱饵";
	["Gurubashi Mojo Madness"] = "古拉巴什疯狂魔精";
	["High Priestess Jeklik"] = "高阶祭司耶克里克";
	["High Priest Venoxis"] = "高阶祭司温诺希斯";
	["Zanza the Restless"] = "无眠者赞扎";
	["High Priestess Mar'li"] = "哈卡莱安魂者";
	["Bloodlord Mandokir"] = "血领主曼多基尔";
	["Ohgan"] = "奥根";
	["Edge of Madness"] = "疯狂之缘";
	["Gri'lek"] = "格里雷克";
	["Hazza'rah"] = "哈札拉尔";
	["Renataki"] = "雷纳塔基";
	["Wushoolay"] = "乌苏雷";
	["Gahz'ranka"] = "加兹兰卡";
	["High Priest Thekal"] = "古拉巴什食腐者";
	["Zealot Zath"] = "狂热者扎斯";
	["Zealot Lor'Khan"] = "狂热者洛卡恩";
	["High Priestess Arlokk"] = "哈卡莱先知";
	["Jin'do the Hexxer"] = "妖术师金度";
	["Hakkar"] = "哈卡";
	["Muddy Churning Waters"] = "混浊的水";
	["Jinxed Hoodoo Pile"] = "厄运巫毒堆";
	["ZG Enchants"] = "祖阁附魔";
	
	--Naxxramas
	["Archmage Tarsis Kir-Moldir"] = "大法师塔希斯·基莫迪尔";
	["Mr. Bigglesworth"] = "比格沃斯";
	["Abomination Wing"] = "憎恶区";
	["Patchwerk"] = "帕奇维克";
	["Grobbulus"] = "葛罗巴斯";
	["Gluth"] = "古鲁斯";
	["Thaddius"] = "泰迪斯";
	["Stalagg"] = "斯塔拉格";
	["Feugen"] = "伏晨";
	["Spider Wing"] = "蜘蛛区";
	["Anub'Rekhan"] = "阿努布雷坎";
	["Grand Widow Faerlina"] = "黑女巫法琳娜";
	["Maexxna"] = "梅克丝娜";
	["Deathknight Wing"] = "死骑区";
	["Instructor Razuvious"] = "教官拉苏维奥斯";
	["Gothik the Harvester"] = "收割者戈提克";
	["The Four Horsemen"] = "四骑士";
	["Thane Korth'azz"] = "库尔塔兹领主";
	["Lady Blaumeux"] = "女公爵布洛莫斯";
	["Highlord Mograine <The Ashbringer>"] = "大领主莫格莱尼<灰烬使者>";
	["Sir Zeliek"] = "札里克爵士";
	["Four Horsemen Chest"] = "四骑士的宝箱";
	["Plague Wing"] = "瘟疫区";
	["Noth the Plaguebringer"] = "瘟疫者诺斯";
	["Heigan the Unclean"] = "肮脏者海根";
	["Loatheb"] = "憎恨者";
	["Frostwyrm Lair"] = "冰霜巨龙巢穴";
	["Sapphiron"] = "萨菲隆";
	["Kel'Thuzad"] = "克尔苏加德";
	

--************************************************
-- Instance Entrance Maps
--************************************************

	--Blackrock Mountain (Entrance)
	["Bodley"] = "伯德雷";
	["Overmaster Pyron"] = "征服者派隆";
	["Lothos Riftwaker"] = "洛索斯·天痕";
	["Franclorn Forgewright"] = "弗兰克罗恩·铸铁";
	["Orb of Command"] = "命令宝珠";
	["Scarshield Quartermaster <Scarshield Legion>"] = "裂盾军需官<裂盾军团>";

	--Gnomeregan (Entrance)
	["Transpolyporter"] = "传送器";
	["Sprok <Away Team>"] = "斯普洛克<特遣小组>";
	["Matrix Punchograph 3005-A"] = "矩阵式打孔计算机3005-A";
	["Namdo Bizzfizzle <Engineering Supplies>"] = "纳姆杜<工程学供应商>";
	["Techbot"] = "尖端机器人";

	--Maraudon (Entrance)
	["The Nameless Prophet"] = "无名预言者";
	["Kolk <The First Kahn>"] = "考尔克<第一可汗>";
	["Gelk <The Second Kahn>"] = "吉尔克<第二可汗>";
	["Magra <The Third Kahn>"] = "玛格拉<第三可汗>";
	["Cavindra"] = "凯雯德拉";
	["Cursed Centaur"] = "被诅咒的半人马";

	--The Deadmines (Entrance)
	["Marisa du'Paige"] = "魔理莎·杜派格";
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
	["Boahn <Druid of the Fang>"] = "博艾恩<尖牙德鲁伊>";
	["Above the Entrance:"] = "入口上方:";
	["Ebru <Disciple of Naralex>"] = "厄布鲁<纳拉雷克斯的信徒>";
	["Nalpak <Disciple of Naralex>"] = "纳尔帕克<纳拉雷克斯的信徒>";
	["Kalldan Felmoon <Specialist Leatherworking Supplies>"] = "卡尔丹·暗月<特殊制皮物资>";
	["Waldor <Leatherworking Trainer>"] = "瓦多尔<制皮训练师>";

	--Dire Maul (Entrance)
	["Dire Pool"] = "厄运之池";
	["Dire Maul Arena"] = "厄运之槌竞技场";
	["Mushgog"] = "姆斯高格";
	["Skarr the Unbreakable"] = "无敌的斯卡尔";
	["The Razza"] = "拉扎尔";
	["Elder Mistwalker"] = "迷雾长者";
	["Griniblix the Spectator"] = "目击者格林比克斯",

	--World Bosses
	["Azshara"] = "艾萨拉";
	["Azuregos"] = "艾索雷葛斯";
	["Emerald Dragons"] = "翡翠雏龙";
	["Spirit of Azuregos"] = "艾索雷葛斯之魂";
	["Lethon"] = "雷索";
	["Emeriss"] = "艾莫莉丝";
	["Taerar"] = "泰拉尔";
	["Ysondre"] = "伊索德雷";
	["Duskwood"] = "暮色森林";
	["The Hinterlands"] = "辛特兰";
	["Feralas"] = "菲拉斯";
	["Ashenvale"] = "灰谷";
	["Emerald Dragons Trash"] = "翡翠龙的小怪";
	["Lord Kazzak"] = "卡扎克";
	["Nethergarde Keep"] = "守望堡";
	
	--Battlegrounds
	
	--Places
	["Alterac Mountains"] = "奥特兰克山脉";
	["Alterac Valley"] = "奥特兰克山谷"; ["AV"] = "AV";
	["Arathi Basin"] = "阿拉希盆地"; ["AB"] = "AB";
	["Arathi Highlands"] = "阿拉希高地";
	["Ashenvale"] = "灰谷";
	["Eastern Kingdoms"] = "东部王国";
	["Eye of the Storm"] = "风暴之眼"; ["EotS"] = "EotS";
	["Hillsbrad Foothills"] = "希尔斯布莱德丘陵";
	["Kalimdor"] = "卡利姆多";
	["Netherstorm"] = "虚空风暴";
	["Outland"] = "外域";
	["The Barrens"] = "贫瘠之地";
	["Warsong Gulch"] = "战歌峡谷"; ["WSG"] = "WSG";
	["Friendly Reputation Rewards"] = "友善声望奖励",
	["Honored Reputation Rewards"] = "尊敬声望奖励",
	["Revered Reputation Rewards"] = "崇敬声望奖励",
	["Exalted Reputation Rewards"] = "崇拜声望奖励",
	
	--Alterac Valley (North)
	["Stormpike Guard"] = "洛泰姆中尉",
	["Dun Baldar"] = "丹巴达尔",
	["Vanndar Stormpike <Stormpike General>"] = "范达尔·雷矛",
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
	["Dirk Swindle <Bounty Hunter>"] = "德尔克";
	["Athramanis <Bounty Hunter>"] = "亚斯拉玛尼斯";
	["Lana Thunderbrew <Blacksmithing Supplies>"] = "兰纳·雷酒";
	["Stormpike Aid Station"] = "雷矛急救站";
	["Stormpike Stable Master <Stable Master>"] = "雷矛兽栏管理员";
	["Stormpike Ram Rider Commander"] = "雷矛山羊骑兵指挥官";
	["Svalbrad Farmountain <Trade Goods>"] = "斯瓦尔布莱德·远山";
	["Kurdrum Barleybeard <Reagents & Poison Supplies>"] = "库德拉姆·麦须";
	["Stormpike Quartermaster"] = "雷矛军需官";
	["Jonivera Farmountain <General Goods>"] = "约尼维拉·远山";
	["Brogus Thunderbrew <Food & Drink>"] = "布罗古斯·雷酒";
	["Wing Commander Ichman"] = "空军指挥官艾克曼",--omitted from AVS
	["Wing Commander Slidore"] = "空军指挥官斯里多尔",--omitted from AVS
	["Wing Commander Vipore"] = "空军指挥官维波里",--omitted from AVS
	["Dun Baldar South Bunker"] = "丹巴达尔南部碉堡",
	["Corporal Noreg Stormpike"] = "诺雷格·雷矛中尉",
	["Gaelden Hammersmith <Stormpike Supply Officer>"] = "盖尔丁";
	["Stormpike Graveyard"] = "雷矛墓地",
	["Icewing Cavern"] = "冰翼洞穴",
	["Stormpike Banner"] = "雷矛军旗",
	["Stormpike Lumber Yard"] = "雷矛木材场",
	["Wing Commander Jeztor"] = "空军指挥官杰斯托",--omitted from AVS
	["Icewing Bunker"] = "冰翼碉堡",
	["Wing Commander Guse"] = "空军指挥官古斯",--omitted from AVS
	["Stonehearth Graveyard"] = "石炉墓地",
	["Stonehearth Outpost"] = "石炉哨站",
	["Captain Balinda Stonehearth <Stormpike Captain>"] = "巴琳达·斯通赫尔斯";
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
	["Drek'Thar <Frostwolf General>"] = "德雷克塔尔";
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
	["Iceblood Garrison"] = "冰血要塞";
	["Captain Galvangar <Frostwolf Captain>"] = "加尔范上尉";
	["Iceblood Tower"] = "冰血塔";
	["Iceblood Graveyard"] = "冰血墓地";
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
	["Frostwolf Stable Master <Stable Master>"] = "霜狼兽栏管理员>";
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
	
	--Dungeon Locations	

	--Places
	["Alterac Mountains"] = "奥特兰克山脉";
	["Alterac Valley"] = "奥特兰克山谷";
	["Arathi Basin"] = "阿拉希盆地";
	["Arathi Highlands"] = "阿拉希高地";
	["Ashenvale"] = "灰谷";
	["Badlands"] = "荒芜之地";
	["Blackfathom Deeps"] = "黑暗深渊";
	["Blackrock Depths"] = "黑石深渊";
	["Blackrock Mountain"] = "黑石山";
	["Blackrock Spire"] = "黑石塔";
	["Blackwing Lair"] = "黑翼之巢";
	["Deadwind Pass"] = "逆风小径";
	["Desolace"] = "凄凉之地";
	["Dire Maul"] = "厄运之槌";
	["Dun Morogh"] = "丹莫罗";
	["Dustwallow Marsh"] = "尘泥沼泽";
	["Eastern Kingdoms"] = "东部王国";
	["Eastern Plaguelands"] = "东瘟疫之地";
	["Feralas"] = "菲拉斯";
	["Gnomeregan"] = "诺莫瑞根";
	["Hillsbrad Foothills"] = "希尔斯布莱德丘陵";
	["Kalimdor"] = "卡利姆多";
	["Maraudon"] = "玛拉顿";
	["Molten Core"] = "熔火之心";
	["Naxxramas"] = "纳克萨玛斯";
	["Onyxia's Lair"] = "奥妮克希亚的巢穴";
	["Orgrimmar"] = "奥格瑞玛";
	["Ragefire Chasm"] = "怒焰裂谷";
	["Razorfen Downs"] = "剃刀高地";
	["Razorfen Kraul"] = "剃刀沼泽";
	["Ruins of Ahn'Qiraj"] = "安其拉废墟";
	["Scarlet Monastery"] = "血色修道院";
	["Scholomance"] = "通灵学院";
	["Shadowfang Keep"] = "影牙城堡";
	["Silithus"] = "希利苏斯";
	["Silverpine Forest"] = "银松森林";
	["Stormwind City"] = "暴风城";
	["Stranglethorn Vale"] = "荆棘谷";
	["Stratholme"] = "斯坦索姆";
	["Sunken Temple"] = "沉没的神庙";
	["Swamp of Sorrows"] = "悲伤沼泽";
	["Tanaris"] = "塔纳利斯";
	["Temple of Ahn'Qiraj"] = "安其拉神殿";
	["The Barrens"] = "贫瘠之地";
	["The Deadmines"] = "死亡矿井";
	["The Stockade"] = "监狱";
	["Tirisfal Glades"] = "提瑞斯法林地";
	["Uldaman"] = "奥达曼";
	["Wailing Caverns"] = "哀嚎洞穴";
	["Warsong Gulch"] = "战歌峡谷";
	["Western Plaguelands"] = "西瘟疫之地";
	["Westfall"] = "西部荒野";
	["Zul'Farrak"] = "祖尔法拉克";
	["Zul'Gurub"] = "祖尔格拉布";
	
	--Flight points
	["Aerie Peak"] = "鹰巢山";
	["Alliance"] = "联盟";
	["Arathi Highlands"] = "阿拉希高地";
	["Ashenvale"] = "灰谷";
	["Astranaar"] = "阿斯特兰纳";
	["Auberdine"] = "奥伯丁";
	["Azshara"] = "艾萨拉";
	["Badlands"] = "荒芜之地";
	["Blasted Lands"] = "诅咒之地";
	["Blood Watch"] = "秘血岗哨";
	["Bloodvenom Post"] = "血毒岗哨";
	["Booty Bay"] = "藏宝海湾";
	["Brackenwall Village"] = "蕨墙村";
	["Burning Steppes"] = "燃烧平原";
	["Camp Mojache"] = "莫沙彻营地";
	["Camp Taurajo"] = "陶拉祖营地";
	["Cenarion Hold"] = "塞纳里奥要塞";
	["Chillwind Point"] = "冰风岗";
	["Crossroads"] = "十字路口";
	["Darkshire"] = "夜色镇";
	["Darkshore"] = "黑海岸";
	["Desolace"] = "凄凉之地";
	["Druid-only"] = "只能德鲁伊";
	["Dun Morogh"] = "丹莫罗";
	["Durotar"] = "杜隆塔尔";
	["Duskwood"] = "暮色森林";
	["Dustwallow Marsh"] = "尘泥沼泽";
	["Eastern Kingdoms"] = "东部王国";
	["Eastern Plaguelands"] = "东瘟疫之地";
	["Elwynn Forest"] = "艾尔文森林";
	["Emerald Sanctuary"] = "翡翠圣地";
	["Everlook"] = "永望镇";
	["Eversong Woods"] = "永歌森林";
	["Feathermoon Stronghold"] = "羽月要塞";
	["Felwood"] = "费伍德森林";
	["Feralas"] = "菲拉斯";
	["Flame Crest"] = "烈焰峰";
	["Flight Path Maps"] = "飞行地图";
	["Freewind Post"] = "乱风岗";
	["Gadgetzan"] = "加基森";
	["Grom'Gol Base Camp"] = "格罗姆高营地";
	["Hammerfall"] = "落锤镇";
	["Hillsbrad Foothills"] = "希尔斯布莱德丘陵";
	["Horde"] = "部落";
	["Ironforge"] = "铁炉堡";
	["Kalimdor"] = "卡利姆多";
	["Kargath"] = "卡加斯";
	["Lakeshire"] = "湖畔镇";
	["Light's Hope Chapel"] = "圣光之愿礼拜堂";
	["Loch Modan"] = "洛克莫丹";
	["Marshal's Refuge"] = "马绍尔营地";
	["Menethil Harbor"] = "米奈希尔港";
	["Moonglade"] = "月光林地";
	["Morgan's Vigil"] = "摩根的岗哨";
	["Mulgore"] = "莫高雷";
	["Nethergarde Keep"] = "守望堡";
	["Nighthaven"] = "永夜港";
	["Nijel's Point"] = "尼耶尔前哨站";
	["Orgrimmar"] = "奥格瑞玛";
	["Ratchet"] = "棘齿城";
	["Redridge Mountains"] = "赤脊山";
	["Refuge Pointe"] = "避难谷地";
	["Revantusk Village"] = "恶齿村";
	["Rut'Theran Village"] = "鲁瑟兰村";
	["Searing Gorge"] = "灼热峡谷";
	["Sentinel Hill"] = "哨兵岭";
	["Shadowprey Village"] = "葬影村";
	["Silithus"] = "希利苏斯";
	["Silverpine Forest"] = "银松森林";
	["South of the path along Lake Elune'ara"] = "沿着湖的南边的路";
	["Southshore"] = "南海镇";
	["Splintertree Post"] = "碎木岗哨";
	["Stonard"] = "斯通纳德";
	["Stonetalon Mountains"] = "石爪山";
	["Stonetalon Peak"] = "石爪峰";
	["Stormwind City"] = "暴风城";
	["Stranglethorn Vale"] = "荆棘谷";
	["Sun Rock Retreat"] = "烈日石居";
	["Swamp of Sorrows"] = "悲伤沼泽";
	["Talonbranch Glade"] = "刺枝林地";
	["Talrendis Point"] = "塔伦迪斯营地";
	["Tanaris"] = "塔纳利斯";
	["Tarren Mill"] = "塔伦米尔";
	["Teldrassil"] = "泰达希尔";
	["Thalanaar"] = "萨兰纳尔";
	["The Barrens"] = "贫瘠之地";
	["The Hinterlands"] = "辛特兰";
	["The Sepulcher"] = "瑟伯切尔";
	["Thelsamar"] = "塞尔萨玛";
	["Theramore Isle"] = "塞拉摩岛";
	["Thorium Point"] = "瑟银哨塔";
	["Thousand Needles"] = "千针石林";
	["Thunder Bluff"] = "雷霆崖";
	["Tirisfal Glades"] = "提瑞斯法林地";
	["Un'Goro Crater"] = "安戈洛环形山";
	["Undercity"] = "幽暗城";
	["Valormok"] = "瓦罗莫克";
	["West of the path to Timbermaw Hold"] = "木喉要塞路的西向";
	["Western Plaguelands"] = "西瘟疫之地";
	["Westfall"] = "西部荒野";
	["Wetlands"] = "湿地";
	["Winterspring"] = "冬泉谷";
	["Zoram'gar Outpost"] = "佐拉姆加前哨站";
	["Tauren Leveling Guide"] = "牛头人升级指南",
	["Undead Leveling Guide"] = "亡灵升级指南",
	["Troll/Orc Leveling Guide"] = "巨魔/兽人升级指南", 
	["Horde Leveling Guide"] = "部落升级指南",
	["Human Leveling Guide"] = "人类升级指南",
	["Night Elf Leveling Guide"] = "暗夜精灵指南",
	["Gnome/Dwarf Leveling Guide"] = "侏儒/矮人指南", 
	["Alliance Leveling Guide"] = "联盟升级指南",
	["Icebellow Anvil"] = "冰怒铁砧";
	["Master Craftsman Omarion"] = "大工匠奥玛里恩";
	["The Behemoth"] = "贝哈默斯";
};

end
