-- Chinese translations
-- By Tobar at CN Realm
if (GetLocale() == "zhCN") then
    BINDING_HEADER_FLIGHTMAP = "FlightMap";       -- TODO translate
    BINDING_NAME_FLIGHTMAP   = "Show flight map"; -- TODO translate

    FLIGHTMAP_NAME          = "FlightMap";
    FLIGHTMAP_DESCRIPTION   = "在世界地图上显示飞行路线";
    FLIGHTMAP_ALLIANCE      = "联盟";
    FLIGHTMAP_HORDE         = "部落";
    FLIGHTMAP_CONTESTED     = "争夺中";

    -- Zone names
    FLIGHTMAP_MOONGLADE     = "月光林地";
    FLIGHTMAP_ELWYNN        = "艾尔文森林";
    FLIGHTMAP_DUNMOROGH     = "丹莫罗";
    FLIGHTMAP_TIRISFAL      = "提瑞斯法林地";
    FLIGHTMAP_LOCHMODAN     = "洛克莫丹";
    FLIGHTMAP_SILVERPINE    = "银松森林";
    FLIGHTMAP_WESTFALL      = "西部荒野";
    FLIGHTMAP_REDRIDGE      = "赤脊山";
    FLIGHTMAP_DUSKWOOD      = "暮色森林";
    FLIGHTMAP_HILLSBRAD     = "希尔斯布莱德丘陵";
    FLIGHTMAP_WETLANDS      = "湿地";
    FLIGHTMAP_ALTERAC       = "奥特兰克山脉";
    FLIGHTMAP_ARATHI        = "阿拉希高地";
    FLIGHTMAP_STRANGLETHORN = "荆棘谷";
    FLIGHTMAP_BADLANDS      = "荒芜之地";
    FLIGHTMAP_SORROWS       = "悲伤沼泽";
    FLIGHTMAP_HINTERLANDS   = "辛特兰";
    FLIGHTMAP_SEARINGGORGE  = "灼热峡谷";
    FLIGHTMAP_BLASTEDLANDS  = "诅咒之地";
    FLIGHTMAP_BURNINGSTEPPE = "燃烧平原";
    FLIGHTMAP_WESTERNPLAGUE = "西瘟疫之地";
    FLIGHTMAP_EASTERNPLAGUE = "东瘟疫之地";
    FLIGHTMAP_DUROTAR       = "杜隆塔尔";
    FLIGHTMAP_MULGORE       = "莫高雷";
    FLIGHTMAP_DARKSHORE     = "黑海岸";
    FLIGHTMAP_BARRENS       = "贫瘠之地";
    FLIGHTMAP_STONETALON    = "石爪山脉";
    FLIGHTMAP_ASHENVALE     = "灰谷";
    FLIGHTMAP_1KNEEDLES     = "千针石林";
    FLIGHTMAP_DESOLACE      = "凄凉之地";
    FLIGHTMAP_DUSTWALLOW    = "尘泥沼泽";
    FLIGHTMAP_FERALAS       = "菲拉斯";
    FLIGHTMAP_TANARIS       = "塔纳利斯";
    FLIGHTMAP_AZSHARA       = "艾萨拉";
    FLIGHTMAP_FELWOOD       = "费伍德森林";
    FLIGHTMAP_UNGOROCRATER  = "安戈洛环形山";
    FLIGHTMAP_SILITHUS      = "希利苏斯";
    FLIGHTMAP_WINTERSPRING  = "冬泉谷";
    FLIGHTMAP_TELDRASSIL    = "泰达希尔"; 
    FLIGHTMAP_DEADWINDPASS  = "逆风小径";
    FLIGHTMAP_ORGRIMMAR     = "奥格瑞玛";
    FLIGHTMAP_THUNDERBLUFF  = "雷霆崖";
    FLIGHTMAP_UNDERCITY     = "幽暗城";
    FLIGHTMAP_IRONFORGE     = "铁炉堡";
    FLIGHTMAP_STORMWIND     = "暴风城";
    FLIGHTMAP_DARNASSUS     = "达纳苏斯";

    -- General strings
FLIGHTMAP_TIMING        = "(计时中)";
FLIGHTMAP_LEVELS        = "等级 %d - %d";
FLIGHTMAP_NOFLIGHTS     = "没有已知的飞行点!";
FLIGHTMAP_NOT_KNOWN     = "(未开启)";
FLIGHTMAP_NO_COST       = "免费";
FLIGHTMAP_MONEY_GOLD    = "金";
FLIGHTMAP_MONEY_SILVER  = "银";
FLIGHTMAP_MONEY_COPPER  = "铜";
FLIGHTMAP_FLIGHTTIME    = "飞行时间: ";
FLIGHTMAP_QUICKEST      = "最快路线";
FLIGHTMAP_TOTAL_TIME    = "总计时间";
FLIGHTMAP_VIA           = "经由 ";
FLIGHTMAP_CONFIRM       = "你确定你要飞到 %s?%s";
FLIGHTMAP_CONFIRM_TIME  = " 这飞行将会费时 ";

-- Command strings
FLIGHTMAP_RESET         = "重设";
FLIGHTMAP_SHOWMAP       = "开启";
FLIGHTMAP_LOCKTIMES     = "锁住";
FLIGHTMAP_GETHELP       = "求助";

-- Help text
FLIGHTMAP_TIMER_HELP    =
    "按住 SHIFT 键并拖曳计时列来移动位置";
FLIGHTMAP_SUBCOMMANDS   = {
    [FLIGHTMAP_RESET]       = "重设计时列的位置",
    [FLIGHTMAP_SHOWMAP]     = "打开飞行地图视窗",
    [FLIGHTMAP_GETHELP]     = "显示这个内容",
};

-- Locked/unlocked status
FLIGHTMAP_TIMESLOCKED   = {
    [true] = "飞行时间将不再被记录.",
    [false] = "飞行时间现在起将会被记录.",
};

-- Option strings
FLIGHTMAP_OPTIONS_CLOSE = "关闭";
FLIGHTMAP_OPTIONS_TITLE = "飞行地图选项";
FLIGHTMAP_OPTIONS = {};
FLIGHTMAP_OPTIONS[1] = {   -- Option 1: flight path lines
    label = "飞行路线",
    option = "showPaths",
    tooltip = "在世界地图的飞行点之间显示飞行线路.",
};
FLIGHTMAP_OPTIONS[2] = {   -- Option 2: extra POI buttons
    label = "管理员POI",
    option = "showPOIs",
    tooltip = "为飞行管理员设置额外的POI按钮",
};
FLIGHTMAP_OPTIONS[3] = {   -- Option 3: Unknown masters
    label = "显示未知飞行点",
    option = "showAllInfo",
    tooltip = "显示全部信息，甚至包含未开启的飞行节点",
};
FLIGHTMAP_OPTIONS[4] = {   -- Option 4: Auto-Dismount
    label = "自动解散座骑",
    option = "autoDismount",
    tooltip = "当与飞行管理员对话时自动解散座骑",
};
FLIGHTMAP_OPTIONS[5] = {   -- Option 5: flight timers
    label = "飞行计时器显示",
    option = "useTimer",
    tooltip = "启动/取消飞行时显示时间计时",
 };

FLIGHTMAP_OPTIONS[6] = {   -- Option 6: Show flight destinations
    label = "显示目的地",
    option = "showDestinations",
    tooltip = "在提示讯息里显示飞行目的地",
    children = {7, 8, 9},
};
FLIGHTMAP_OPTIONS[7] = {   -- Option 7: Show multi-hop destinations
    label = "包含转运点",
    option = "showMultiHop",
    tooltip = "在提示讯息里显示中途的飞行点",
};
FLIGHTMAP_OPTIONS[8] = {   -- Option 8: Show flight times
    label = "显示飞行时间",
    option = "showTimes",
    tooltip = "在提示讯息中显示飞行所需时间",
};
FLIGHTMAP_OPTIONS[9] = {   -- Option 9: Show flight costs
    label = "显示飞行费用",
    option = "showCosts",
    tooltip = "在提示讯息中显示飞行所需花费",
};
FLIGHTMAP_OPTIONS[10] = {   -- Option 10: Taxi window extras
    label = "全飞行地图",
    option = "fullTaxiMap",
    tooltip = "在飞行路线地图上显示所有飞行网络",
};
FLIGHTMAP_OPTIONS[11] = {   -- Option 11: Confirm flight destinations
    label = "确认飞行路线",
    option = "confirmFlights",
    tooltip = "在起飞前再次提示确认",
};

-- These constants determine how "Town, Zone" strings look.
-- SEP_STRING is what separates Town from Zone.  SEP_POSTAMBLE
-- is anything that is after Zone.
FLIGHTMAP_SEP_STRING    = "，";
FLIGHTMAP_SEP_POSTAMBLE = "";
end
