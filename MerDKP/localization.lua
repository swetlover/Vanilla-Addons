
---------------------------
--- xml localizations
---------------------------
MerDKP_XML_OPTION 	= "设置选项";
MerDKP_XML_HISTORY 	= "修改历史";
MerDKP_XML_IE 		= "导入导出";
MerDKP_XML_SHOWN 	= "分数显示";

MerDKP_XML_BATEDIT = "批量修改";
MerDKP_XML_TITLE = "标题";
MerDKP_XML_ZONE = "副本";
MerDKP_XML_PATTERN = "正则";
MerDKP_XML_REFRESH = "刷新";
MerDKP_XML_LOGS = "记录";
MerDKP_XML_TIME = "时间";
MerDKP_XML_ADD = "添加";
MerDKP_XML_EXPORT = "导出";
MerDKP_XML_SELECTALL = "全选";
MerDKP_XML_EMPTY = "清空";
MerDKP_XML_WHISPER = "群体密报";
MerDKP_XML_RAIDMEMBERS = "显示团队成员";

MerDKP_XML_MINIMAP = "迷你地图按钮位置";
MerDKP_XML_MAXOUTPUT = "最大输出人数设置";
MerDKP_XML_DKPFROM = "数据信息来源设置";
MerDKP_XML_NUMLOGS = "历史修改纪录数目";
---------------------------
--- lua localizations
---------------------------
MerDKP_LUA_SHOWNINFO = "当前显示成员";
MerDKP_LUA_WHISPERDKP = "密语通告";
MerDKP_LUA_EDITDKP = "修改分数";
MerDKP_LUA_WATCHWORD = "  查询指令：";
MerDKP_LUA_OR = " 或 ";
MerDKP_LUA_EDIT = "编辑";
MerDKP_LUA_ADD = "添加";
MerDKP_LUA_RESET = "重置";
--StaticPopupDialogs Text
MerDKP_LUA_CONFIRMSEND = "确定发送当前列表显示的成员分数？";
MerDKP_LUA_BATEDITDKP = "请输入批量修改的分数";
MerDKP_LUA_DELMEMBER = "确定删除 <%s>#%d ？";
MerDKP_LUA_DELLIST = "确定删除此类型的所有数据？";
MerDKP_LUA_SAVELIST = "导入这些数据到列表？";
MerDKP_LUA_GUILDROSTERDKP = "刷新后数据将全部重新读取？";

--tables
MerDKP_MinDkpTable = {
	{-5000,"所有"},	{0.01,"正分"},	{20,"20分"}, {30,"30分"}, {40,"40分"},
	{50,"50分"}, {60,"60分"}, {80,"80分"}, {100,"100分"}, {200,"200分"},
};
MerDKP_ChanTable 	= {	
	{"SAY","普通频道"},{"RAID","团队频道"},{"GUILD","公会频道"},{"PARTY","小队频道"},{"OFFICER","干部频道"},
};
MerDKP_OptionsTable = {
	{ "开启密语查询", "开启后，别人可以通过发送特定的密语命令来向你查询分数", "Enablewhisper" },
	{ "隐藏查询的记录", "隐藏查询的有关聊天记录，让你免受刷频的烦恼", "Hidewhisper" },	
	{ "仅查询当前团员", "只回复当前团队内人员的分数，非团队成员的分数将不回复", "Currentraid" },
	{ "不显示离线成员", "离线的团队成员将不显示在你的列表中", "Ignoreoffline" },
	{ "发送前提示确认", "发送前将弹出一个确认框", "Confirmsend" },
	{ "保存分数到本地", "保存DKP分数到本地缓存", "Savedkplist" },
	{ "同步到公会注释", "每次修改后将结果同步更新到公会注释，前提是你使用注释系统", "Autoupdatenote" },	
};
MerDKP_FromTable = {
	{"webhost","网站系统"}, {"localhost","本地缓存"}, {"publicnote","公共注释"}, {"officernote","官员注释"},
};
MerDKP_GuildRosterDkpTable = {
	{ title = "MC", key = "熔火之心", whisper= "mcdkp" },
	{ title = "BWL", key = "黑翼之巢", whisper= "bwldkp" },
	{ title = "TAQ", key = "安其拉", whisper= "taqdkp" },
	{ title = "NAXX", key = "纳克萨玛斯", whisper= "naxxdkp" },
};
MerDKP_Classes = {
	tbc = {
		{ text = MER_cloth,MER_priest,MER_mage,MER_warlock,MER_unknown},
		{ text = MER_leather,MER_rogue,MER_druid,MER_unknown},
		{ text = MER_mail,MER_hunter,MER_shaman,MER_unknown},
		{ text = MER_plate,MER_warrior,MER_paladin,MER_unknown},
		{ text = MER_classes,MER_paladin,MER_warrior,MER_priest,MER_mage,MER_warlock,MER_druid,MER_rogue,MER_hunter,MER_shaman,MER_unknown},
	},
};