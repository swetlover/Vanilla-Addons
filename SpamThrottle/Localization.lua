-- English localization
-- English by Mopar

-- Localization Strings

SpamThrottleProp = {};
SpamThrottleProp.Version = GetAddOnMetadata("SpamThrottle", "Version");
SpamThrottleProp.Author = "60addons";
SpamThrottleProp.AppName = "SpamThrottle";
SpamThrottleProp.Label = SpamThrottleProp.AppName .. " 版本 " .. SpamThrottleProp.Version;
SpamThrottleProp.LongLabel = SpamThrottleProp.Label .. " by " .. SpamThrottleProp.Author;
SpamThrottleProp.CleanLabel = SpamThrottleProp.AppName .. " by " .. SpamThrottleProp.Author;
SpamThrottleProp.Description = "A spam-reducing addon to remove repeated and annoying chat messages";

SpamThrottleConfigMenuTitle = SpamThrottleProp.Label;
SpamThrottleGlobalOptions = "SpamThrottle 全局设置";
SpamThrottleStatus = "SpamThrottle 现状与缺口";
SpamThrottleKeywords = "过滤关键词";
SpamThrottlePlayerbans = "过滤玩家名字 (本地)";
SpamThrottleGeneralMask = "<<<----[%a%d][%a%d][%a%d][%a%d][%a%d][%a%d][%a%d][%a%d][%a%d][%a%d][%a%d][%a%d]";

SpamThrottleChatMsg = {
	WelcomeMsg = SpamThrottleProp.CleanLabel .. " 减少聊天垃圾 (命令: /spamthrottle 或 /st)";
	ObjectLoadFail = "错误! 加载对象失败:";
	ObjectSaveFail = "错误! 保存对象失败:";
	LoadDefault = "版本更新检测. 选项已重置为默认值.";
	LoadKeywordDefault = "关键字筛选列表已重置为默认值.";
	LoadPlayerbanDefault = "本地玩家禁令列表已清除.";
	EnterFilterKeyword = "输入新的过滤关键字:";
	EnterPlayername = "输入玩家名字:";
	BanAdded = "添加到您的本地spamthrottle禁令名单";
	BanRemoved = "从您的本地spamthrottle禁令名单中删除";
	Permanent = "无限时间";
	Timeout = "超时";
	WhisperBack = "消息发送失败：你的密语被我的插件阻拦.";
}

SpamThrottleStatusMsg = {
	StatusText1 = "个关键词关键字过滤列表";
	StatusText2 = "过滤列表中的玩家名称";
	StatusText4 = "禁令名单中的姓名";
	StatusText5 = "目前在数据库的独特的讯息";
	StatusText6 = "在此次游戏中过滤到的消息";
	StatusText7 = "白名单频道:";
	StatusText8 = "1: ";
	StatusText9 = "2: ";
	StatusText10 = "3: ";
}

SpamThrottleConfigObjectText ={
	STActive = "开启 SpamThrottle 过滤";
	STDupFilter = "删除重复的信息直到间隙超时";
	STColor = "彩色信息.非过滤";
	STFuzzy = "启用模糊消息筛选器";
	STGoldSeller = "金农广告积极过滤启用";
	STChinese = "中文汉字 & QQ 过滤功能启用";
	STCtrlMsgs = "在聊天频道控制消息";
	STYellMsgs = "/y (大喊) 频道消息过滤开启";
	STSayMsgs = "/s (说) 频道消息过滤开启";
	STWispMsgs = "/w (私聊) 频道消息过滤开启";
	STWispBack = "自动回复过滤";
	STMultiWisp = "过滤来自同一玩家的私聊";
	STWispMsgsOFF = "私聊完全关闭";
	STReverse = "只显示关键词匹配的白名单";
	STMinimapButton = "显示小地图按钮";
	STGap = "消息的间隙 (秒)";
	STBanPerm = "永久";
	STBanTimeout = "屏蔽超时 (秒)";
}

SpamThrottleConfigObjectTooltip ={
	STActive = "开启或禁用所有插件功能.";
	STDupFilter = "如果开启, 将过滤重复的消息, 不允许他们再次出现.直到指定的秒数已超过间隙";
	STColor = "如果开启, 过滤的消息通过着色而不是屏蔽来标识. 您可以看到消息，但可以直观地跳过它们.";
	STFuzzy = "启用模糊过滤，捕捉非常相似的重复消息，如由醉酒字符发送的消息.";
	STGoldSeller = "启用金农广告过滤去除金农广告.";
	STChinese = "过滤含有中文的消息, 韩文或日文字符.";
	STCtrlMsgs = "过滤频道控制消息，删除加入/退出频道 之类的垃圾信息.";
	STYellMsgs = "对附近玩家大喊的玩家信息进行过滤";
	STSayMsgs = "对附近玩家所说的玩家消息进行过滤.";
	STWispMsgs = "直接对你私聊的玩家信息 进行过滤.";
	STWispBack = "自动回应的礼貌性回复，告诉他们，他们的消息被封锁. 不支持WIM插件";
	STMultiWisp = "允许过滤多个玩家信息, 在最后几秒钟内同一玩家对你私聊.";
	STWispMsgsOFF = "完全过滤私聊 使用服务器命令 .wr 开启";
	STReverse = "将显示与关键字匹配的消息, 所有其他人都将被阻止.";
	STMinimapButton = "打开或关闭小地图按钮";
	STGap = "设置重复消息之间所需的最小间隔.";
	STBanPerm = "如果启用, 禁令玩家将待在原位，直到你清除它们为止. 否则玩家将在超时后自动删除.";
	STBanTimeout = "如果没有设置永久禁止，玩家将在这段时间后自动退出这个列表.";
}

SpamThrottleGSC1 = { "%d%s+[Gg]", "%d+%D?%D?%D?%D?%D?[Gg]" };
SpamThrottleGSC2 = { "%$", "USD", "C[O@]M", "W@W", "G4", ">>", ">>>", "[gG][^%$]*%$", "%$[^gG]*[gG]", "[gG]%D?%D?%D?%D?%d+", "[lL][vV][lL]?%D?%D?%D?%D?%D?%d+" };
SpamThrottleGSO1 = { "ACCOUNT", "CHEAP", "LEGIT", "LEVELING", "LEVELLING", "LEVLING", "LEVILING", "IEVEING","LVLING", "SAFE", "SERVICE", "NOST", "SELL", "POTION","POWER", "WOW"  };
SpamThrottleGSO2 = { "PRICE", "GOLD", "CURRENCY", "MONEY", "STARS", "SKYPE", "EPIC", "DOLLARS", "PROFESSIONAL", "RELIABLE", "PROMOTION", "DELIVER", "NAXX", "GAMES", "GREETINGS", "WEBSITE", "GOID", "CQM" , "MOK", "WEBMO", "MOGS"};
SpamThrottleGSUC5 = { "ITEM4" }
SpamThrottleSWLO = { "OKO", "GAMES", "NOST", "COM", "TANK", "WG" , "WMO"}
