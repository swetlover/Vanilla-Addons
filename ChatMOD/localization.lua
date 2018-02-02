SCCN_VER = "1.05b";
SCCN_LOCAL_CLASS = {};
SCCN_HELP = {};
SCCN_CMDSTATUS = {};
SCCN_STRIPCHAN = {};
SCCN_CUSTOM_INV = {};
SCCN_LOCAL_ZONE = {};
SCCN_TRANSLATE  = {};
SCCN_ILINK  = {};
-- key binding header
BINDING_HEADER_SCCNKEY			= "|cffaad372".."Chat".."|cfffff468".."MOD".."|cffffffff Key Bindings";
BINDING_NAME_SAYMESSAGE      	= "/say";
BINDING_NAME_YELLMESSAGE      	= "/yell";
BINDING_NAME_PARTYMESSAGE     	= "/party";
BINDING_NAME_GUILDMESSAGE     	= "/guild";
BINDING_NAME_RAIDMESSAGE      	= "/raid";
BINDING_NAME_OFFICERMESSAGE     = "/officer";
BINDING_NAME_CC1_MESSAGE		= "/1";
BINDING_NAME_CC2_MESSAGE		= "/2";
BINDING_NAME_CC3_MESSAGE		= "/3";
BINDING_NAME_CC4_MESSAGE		= "/4";
BINDING_NAME_CC5_MESSAGE		= "/5";
BINDING_NAME_CC6_MESSAGE		= "/6";
BINDING_NAME_CC7_MESSAGE		= "/7";
BINDING_NAME_CC8_MESSAGE		= "/8";
BINDING_NAME_CC9_MESSAGE		= "/9";
BINDING_NAME_CC10_MESSAGE		= "/10";
BINDING_NAME_WT_MESSAGE			= "/wt (whisper Target)";



-- General info, could be overwritten by translation:
SCCN_WELCOME = "|cff68ccefAddon:|cffCDCDCD ChatMOD by SkyHawk\n";
SCCN_WELCOME = SCCN_WELCOME.."|cff68ccefVersion:|cffCDCDCD "..SCCN_VER.."\n\n";	
SCCN_WELCOME = SCCN_WELCOME.."|cff68ccefAbout:|cffCDCDCD\nThank's for using ChatMOD. As far as you now nearly every WOW addon is coded in a privat persons sparetime so if you like it feel free to tell others about it, if you dislike something please poste me a short note on my webpage or on the curse Gaming ChatMOD Projekt page.\n\nYou can find the Curse projekt page by typing ChatMOD into the searchbox on www.curse-gaming.com or on my private webpage www.soalriz.de\n\nIf you find this Addon usefull please give me a vote @ curse !\n\nFor Information how to use this Addon, please type: |cffFF0000\n/chatmod\n\n\n";
SCCN_WELCOME = SCCN_WELCOME.."|cff68ccefAuthor:|cffCDCDCD Marco `sOLARiZ`Goetze\n";
SCCN_WELCOME = SCCN_WELCOME.."|cff68ccefAuthor's Webpage:|cffCDCDCD www.SOLARIZ.de\n";
SCCN_WELCOME = SCCN_WELCOME.."|cff68ccefAuthor's Realm:|cffCDCDCD EU-Aegwynn\n";
SCCN_WELCOME = SCCN_WELCOME.."|cff68ccefAuthor's Charname:|cffCDCDCD SkyHawk\n";
SCCN_WELCOME = SCCN_WELCOME.."|cff68ccefAuthor's Class:|cffCDCDCD Druid\n";
SCCN_WELCOME = SCCN_WELCOME.."|cff68ccefAuthor's Guild:|cffCDCDCD United, Alliance\n";
SCCN_LASTCHANGED = "|cff68ccefabout:\n";
-- NEW
SCCN_LASTCHANGED = SCCN_LASTCHANGED.."|cff10ff10";
SCCN_LASTCHANGED = SCCN_LASTCHANGED.."";
--SCCN_LASTCHANGED = SCCN_LASTCHANGED.."- new: InChatHighlight will highlight known names in chatmessages and make them clickable\n";
--SCCN_LASTCHANGED = SCCN_LASTCHANGED.."- new: AllSticky now toggle able\n";
--SCCN_LASTCHANGED = SCCN_LASTCHANGED.."- new: Added HTML Readme file.  README.html Please read !!!\n";
-- UPD
--SCCN_LASTCHANGED = SCCN_LASTCHANGED.."|cffbababa";
--SCCN_LASTCHANGED = SCCN_LASTCHANGED.."- fix: storing player names now in lower case\n";
--SCCN_LASTCHANGED = SCCN_LASTCHANGED.."- upd: Updated the colortable, class colors should be brighter now\n";
--SCCN_LASTCHANGED = SCCN_LASTCHANGED.."- upd: Fix for Bug #32 - Double lines in center of screen\n";
--SCCN_LASTCHANGED = SCCN_LASTCHANGED.."- upd: WHISPER is no Sticky Channel anymore\n";
--SCCN_LASTCHANGED = SCCN_LASTCHANGED.."- upd: Invites not clickable anymore if from person in raid or from self\n";
--SCCN_LASTCHANGED = SCCN_LASTCHANGED.."- upd: Request #31 included, Gossip skip more fluently\n";
--SCCN_LASTCHANGED = SCCN_LASTCHANGED.."- upd: Gossip skip now includes Vendors\nRemember: You can temporary disable Gossip skip by holding down <CTRL>\n";


if ( GetLocale() == "zhCN" ) then
	SCCN_INIT_CHANNEL_LOCAL			= "General";
	SCCN_GUI_HIGHLIGHT1				= "在这对话输入你要 SCCN 显示的词。 各行输入一个词";
	SCCN_LOCAL_CLASS["WARLOCK"] 	= "术士";
	SCCN_LOCAL_CLASS["HUNTER"] 	= "猎人";
	SCCN_LOCAL_CLASS["PRIEST"] 	= "牧师";
	SCCN_LOCAL_CLASS["PALADIN"] 	= "圣骑士";
	SCCN_LOCAL_CLASS["MAGE"] 	= "法师";
	SCCN_LOCAL_CLASS["ROGUE"] 	= "盗贼";
	SCCN_LOCAL_CLASS["DRUID"] 	= "德鲁伊";
	SCCN_LOCAL_CLASS["SHAMAN"] 	= "萨满祭司";
	SCCN_LOCAL_CLASS["WARRIOR"] 	= "战士";
	SCCN_LOCAL_ZONE["alterac"]	= "奥特兰克山谷";
	SCCN_LOCAL_ZONE["warsong"]	= "战歌峡谷";
	SCCN_LOCAL_ZONE["arathi"]	= "阿拉希盆地";
	SCCN_CONFAB			= "|cffff0000你有安装Confab。为了兼容性，SCCN的输入框相关功能取消！";
	SCCN_HELP[1]			= "Sol's Color chat Nicks - 指令说明:";
	SCCN_HELP[2]			= "|cff68ccef".."隐藏频道名称";
	SCCN_HELP[3]			= "|cff68ccef".."以职业颜色显示玩家名字";
	SCCN_HELP[4]			= "|cff68ccef".."整理SCCN数据库|cffa0a0a0(每次载入此ui时都会自动执行这个动作)";
	SCCN_HELP[5]			= "|cff68ccef".."完整地把SCCN数据库清除(无法复原)";
	SCCN_HELP[6]			= "|cff68ccef".." 使用鼠标滚轮滚动对话框|cffa0a0a0(SHIFT+滚轮=快翻，CTRL+滚轮=翻至尽头";
	SCCN_HELP[7]			= "|cff68ccef".."对话输入框显示在聊天窗口的上面。";	
	SCCN_HELP[8]			= "|cff68ccef".."显示时间戳在每条信息之前 输入|cffa0a0a0 /chatmod timestamp ?|cffffffff 显示更改格式说明。";
	SCCN_HELP[9]			= "|cff68ccef".."小地图上的团队成员以职业颜色标记。";	
	SCCN_HELP[10]			= "|cff68ccef".."让对话消息里的URL可被选择复制！";
	SCCN_HELP[11]			= "|cff68ccef".."在对话消息中把自己名字明显标示！";
	SCCN_HELP[12]			= "|cff68ccef".."让对话中的[邀请]能直接被点选以加入队伍";	
	SCCN_HELP[13] 			= "|cff68ccef".."不按住<ALT>键就能用方向键做编辑";
	SCCN_HELP[14] 			= "|cff68ccef".."简化密语字串。";
	SCCN_HELP[15] 			= "|cff68ccef".."包含自己名字的对话消息会另外显示在屏幕上方，须开启 /chatmod selfhighlight";	
	SCCN_HELP[16]			= "|cff68ccef".."隐藏聊天按钮";	
	SCCN_HELP[17]			= "|cff68ccef".."在聊天中高亮显示自定义词";	
	SCCN_HELP[18]			= "|cff68ccef".."战场迷你地图自动弹出";	
	SCCN_HELP[19]			= "|cff68ccef".."显示简略频道名.";	
	SCCN_HELP[20]			= "|cff68ccef".."自动跳过闲谈窗口|cffa0a0a0(按住 <CTRL> 则撤销跳过)";
	SCCN_HELP[21]			= "|cff68ccef".."与飞行点管理员对话时自动下马";	
	SCCN_HELP[22]					= "|cff68ccef".."高亮已知昵称";	
	SCCN_HELP[23]					= "|cff68ccef".."置顶聊天信息";	
	SCCN_HELP[24]					= "|cff68ccef".."设置指定的< channelname >默认聊天框启动";		
	SCCN_HELP[25]					= "|cff68ccef".."禁用聊天文本的渐隐";
	SCCN_HELP[99]			= "|cff68ccef".."显示目前设置。";
	SCCN_TS_HELP  			= "|cff68ccef".."FORMAT:\n$h = 小时 (0-24) \n$t = 小时 (0-12) \n$m = 分钟 \n$s = 秒 \n$p = 上午/下午 (am / pm)\n".."|cff909090Example: /chatmod timestamp [$t:$m:$s $p]";
	SCCN_CMDSTATUS[1]		= "隐藏频道名称:";
	SCCN_CMDSTATUS[2]		= "以职业颜色显示玩家名字:";
	SCCN_CMDSTATUS[3]		= "使用鼠标滚轮滚动对话框:";
	SCCN_CMDSTATUS[4]		= "对话输入框顶置:";
	SCCN_CMDSTATUS[5]		= "加入消息时间:";
	SCCN_CMDSTATUS[6]		= "小地图上的队伍成员以职业颜色标记:";
	SCCN_CMDSTATUS[7]		= "URL可点选复制:";
	SCCN_CMDSTATUS[8]		= "明显标示自己的名字:";
	SCCN_CMDSTATUS[9]		= "对话框中的邀请信息可以被点选:";
	SCCN_CMDSTATUS[10]		= "对话编辑不需按住<ALT>:";
	SCCN_CMDSTATUS[11]		= "自定密语消息:";
	SCCN_CMDSTATUS[12]		= "额外显示包含自己名字的消息:";
	SCCN_CMDSTATUS[13]		= "隐藏聊天按钮:";
	SCCN_CMDSTATUS[14] 		= "战场自动打开小地图:";
	SCCN_CMDSTATUS[15] 		= "自定义高亮:";
	SCCN_CMDSTATUS[16] 		= "简略频道名:";
	SCCN_CMDSTATUS[17]		= "闲谈自动跳过:";
	SCCN_CMDSTATUS[18]		= "自动下马:";	
	SCCN_CMDSTATUS[19]				= "In Chat Highlight:";	
	SCCN_CMDSTATUS[20]				= "Remeber last Chatroom (sticky):";	
	SCCN_CMDSTATUS[21]				= "Don't Fade chattext automaticaly:";
	-- cursom invite word in the local language
	SCCN_CUSTOM_INV[0]		= "邀请";
	SCCN_CUSTOM_INV[1] 		= "邀请";
	-- Whispers customized
	SCCN_CUSTOM_CHT_FROM		= "%s说：";
	SCCN_CUSTOM_CHT_TO		= "密%s：";	
	-- hide this channels aditional, feel free to add your own
	SCCN_STRIPCHAN[1]		= "工会";
	SCCN_STRIPCHAN[2]		= "团队";
	SCCN_STRIPCHAN[3]		= "小队";		
	SCCN_STRIPCHAN[4]		= "世界防务";
	SCCN_STRIPCHAN[5]		= "官员";
-- ItemLink Channels
    SCCN_ILINK[1]                   = "General -"
    SCCN_ILINK[2]                   = "Trade -"
    SCCN_ILINK[3]                   = "LookingForGroup -"
    SCCN_ILINK[4]                   = "LocalDefense -"
    SCCN_ILINK[5]                   = "WorldDefense"	
	-- some general channel name translation for the GUI
	SCCN_TRANSLATE[1]				= "工会";
	SCCN_TRANSLATE[2]				= "官员";
	SCCN_TRANSLATE[3]				= "小队";
	SCCN_TRANSLATE[4]				= "团队";
	SCCN_TRANSLATE[5]				= "密语";	
	SCCN_Highlighter				= "ChatMOD 高亮";
	SCCN_Config						= "ChatMOD 设置";
	SCCN_Changelog					= "插件命令";	
	-- General info, could be overwritten by translation:
SCCN_WELCOME = "|cff68ccefAddon:|cffCDCDCD ChatMOD\n";
SCCN_WELCOME = SCCN_WELCOME.."|cff68ccef版本:|cffCDCDCD 1.05b\n";	
SCCN_WELCOME = SCCN_WELCOME.."|cff68ccef命令:|cffCDCDCD/chatmod timestamp  打开或者关闭时间标签（默认关闭）\n/chatmod colornicks  以职业颜色显示玩家名字\n/chatmod hidechanname  隐藏频道名称\n/chatmod purge  整理SCCN数据库(每次载入此ui时都会自动执行这个动作)\n/chatmod killdb  完整地把SCCN数据库清除(无法复原)\n/chatmod mousescroll  使用鼠标滚轮滚动对话框，按住<SHIFT>-鼠标滚轮=快翻，按住<CTRL>-鼠标滚轮=翻至尽头\n/chatmod topeditbox  对话输入框显示在聊天窗口的上面\n/chatmod colormap  小地图上的团队成员以职业颜色标记\n/chatmod hyperlink  让对话消息里的URL可被选择复制\n/chatmod selfhighlight  在对话消息中把自己名字明显标示\n/chatmod clickinvite  让对话消息中的[邀请]能直接被点选以加入队伍\n/chatmod editboxkeys  在对话输入框里不需要按住<ALT>键就能用方向键做编辑 & 历史纪录缓冲区增加至256行\n/chatmod chatstring  简化密语字串\n/chatmod selfhighlightmsg  包含自己名字的对话消息会另外显示在屏幕上方，需要开启 /chatmod selfhighlight";

-- NEW
SCCN_LASTCHANGED = "|cff68ccef接上页\n";
SCCN_LASTCHANGED = SCCN_LASTCHANGED.."|cffCDCDCD/chatmod hidechatbuttons  隐藏聊天按钮\n/chatmod highlight  在聊天中高亮显示自定义词\n/chatmod AutoBGMap   战场迷你地图自动弹出\n/chatmod shortchanname  显示简略频道名\n/chatmod autogossipskip  自动跳过闲谈窗口(按住 <CTRL> 则撤销跳过，默认开启)\n/chatmod autodismount  与飞行点管理员对话时自动下马（默认开启）\n/chatmod inchathighlight  高亮已知昵称\n/chatmod sticky  置顶聊天信息\n/chatmod initchan   设置指定的默认聊天框启动\n/chatmod nofade  禁用聊天文本的渐隐\n/chatmod status  显示目前设置";

--==============
--=   ENGLISH  =
--==============
else
	SCCN_INIT_CHANNEL_LOCAL			= "General";
	SCCN_GUI_HIGHLIGHT1				= "In this Dialogue you can enter Words which ChatMOD should Highlight. Each Line is one Word.";
	SCCN_LOCAL_CLASS["WARLOCK"] 	= "Warlock";
	SCCN_LOCAL_CLASS["HUNTER"] 		= "Hunter";
	SCCN_LOCAL_CLASS["PRIEST"] 		= "Priest";
	SCCN_LOCAL_CLASS["PALADIN"] 	= "Paladin";
	SCCN_LOCAL_CLASS["MAGE"] 		= "Mage";
	SCCN_LOCAL_CLASS["ROGUE"] 		= "Rogue";
	SCCN_LOCAL_CLASS["DRUID"] 		= "Druid";
	SCCN_LOCAL_CLASS["SHAMAN"] 		= "Shaman";
	SCCN_LOCAL_CLASS["WARRIOR"] 	= "Warrior";
	-- Zones
	SCCN_LOCAL_ZONE["alterac"]	= "Alterac Valley";
	SCCN_LOCAL_ZONE["warsong"]	= "Warsong Gulch";
	SCCN_LOCAL_ZONE["arathi"]	= "Arathi Basin";
	SCCN_CONFAB						= "|cffff0000The Confab Addon was found. SCCN Editbox functions are disabled due to compatibility!";
	SCCN_HELP[1]					= "Sol's Color chat Nicks - Command Help:";
	SCCN_HELP[2]					= "|cff68ccef".."/chatmod hidechanname ".."|cffffffff".." Toggle chatname supression";
	SCCN_HELP[3]					= "|cff68ccef".."/chatmod colornicks ".."|cffffffff".." Toggle Chatname coloring in chatters class";
	SCCN_HELP[4]					= "|cff68ccef".."/chatmod purge".."|cffffffff".." Start a standard DB purge. |cffa0a0a0(done automaticaly each time the addon is loaded)";
	SCCN_HELP[5]					= "|cff68ccef".."/chatmod killdb".."|cffffffff".." Flushes the Database completly. (no undo)";
	SCCN_HELP[6]					= "|cff68ccef".."/chatmod mousescroll".."|cffffffff".." Toggle chat scrolling with mousewheel. |cffa0a0a0(<SHIFT>-MouseWheel  = Fast Scroll, <STRG>-MWheel = Top, Bottom)";
	SCCN_HELP[7]					= "|cff68ccef".."/chatmod topeditbox".."|cffffffff".." Move the chat editbox on top of the chatframe.";
	SCCN_HELP[8]					= "|cff68ccef".."/chatmod timestamp".."|cffffffff".." Show 24h Timestamp in Chatwindow.  HH:MM";
	SCCN_HELP[9]					= "|cff68ccef".."/chatmod colormap".."|cffffffff".." Color raidmembers on map in classcolor.";
	SCCN_HELP[10]					= "|cff68ccef".."/chatmod hyperlink".."|cffffffff".." Make Hyperlinks in Chat clickable.";
	SCCN_HELP[11]					= "|cff68ccef".."/chatmod selfhighlight".."|cffffffff".." Highlight own charname in chats.";
	SCCN_HELP[12]					= "|cff68ccef".."/chatmod clickinvite".."|cffffffff".." Make the word [invite] clickable in chats (invite on click).";
	SCCN_HELP[13] 					= "|cff68ccef".."/chatmod editboxkeys".."|cffffffff".." Use Chat Editbox keys without pressing <ALT> & increase History Buffer.";
	SCCN_HELP[14] 					= "|cff68ccef".."/chatmod chatstring".."|cffffffff".." Custom chat Strings.";
	SCCN_HELP[15] 					= "|cff68ccef".."/chatmod selfhighlightmsg".."|cffffffff".." Print OnScreen msg containing own nick on Screen.";	
	SCCN_HELP[16]					= "|cff68ccef".."/chatmod hidechatbuttons".."|cffffffff".." Hide Chat Buttons.";	
	SCCN_HELP[17]					= "|cff68ccef".."/chatmod highlight".."|cffffffff".." Custom filter dialogue for highlighting Words in Chat.";	
	SCCN_HELP[18]					= "|cff68ccef".."/chatmod AutoBGMap".."|cffffffff".." BGMinimap Autopupup.";	
	SCCN_HELP[19] = "|cff68ccef".."/chatmod shortchanname ".."|cffffffff".." Displays Short channelname.";	
	SCCN_HELP[20] = "|cff68ccef".."/chatmod autogossipskip ".."|cffffffff".." Skip the gossip Window automaticaly. |cffa0a0a0(Press <CTRL> to deactivate skip)";
	SCCN_HELP[21] = "|cff68ccef".."/chatmod autodismount ".."|cffffffff".." Auto Dismounts at taxi NPCs";	
	SCCN_HELP[22]					= "|cff68ccef".."/chatmod inchathighlight ".."|cffffffff".."Highlight Known Nicknames";	
	SCCN_HELP[22]					= "|cff68ccef".."/chatmod sticky ".."|cffffffff".."Sticky Chat behavior";	
	SCCN_HELP[23]					= "|cff68ccef".."/chatmod sticky ".."|cffffffff".."Sticky Chat behavior";	
	SCCN_HELP[24]					= "|cff68ccef".."/chatmod initchan <channelname>".."|cffffffff".."Set the specified <channelname> to default chatfram on startup.";	
	SCCN_HELP[25]					= "|cff68ccef".."/chatmod nofade".."|cffffffff".."Disable fading of Chattext";
	SCCN_HELP[99]					= "|cff68ccef".."/chatmod status".."|cffffffff".." Show current configuration.";	
	SCCN_TS_HELP  					= "|cff68ccef".."/chatmod timestamp |cffFF0000FORMAT|cffffffff\n".."FORMAT:\n$h = hour (0-24) \n$t = hour (0-12) \n$m = minute \n$s = second \n$p = periode (am / pm)\n".."|cff909090Example: /chatmod timestamp [$t:$m:$s $p]";
	SCCN_CMDSTATUS[1]				= "Supress Channelname:";
	SCCN_CMDSTATUS[2]				= "Chat nicknames in classcolor:";
	SCCN_CMDSTATUS[3]				= "Scroll Chat with Mousewheel:";
	SCCN_CMDSTATUS[4]				= "Chat Editbox onTop:";
	SCCN_CMDSTATUS[5]				= "Chat Timestamp:";
	SCCN_CMDSTATUS[6]				= "Class colored Map pins:";
	SCCN_CMDSTATUS[7]				= "Clickable Hyperlinks:";
	SCCN_CMDSTATUS[8]				= "Self Highlight:";
	SCCN_CMDSTATUS[9]				= "Click Invite:";
	SCCN_CMDSTATUS[10]  			= "Use Editbox Keys without <ALT>:";
	SCCN_CMDSTATUS[11] 				= "Custom chat strings:";
	SCCN_CMDSTATUS[12]				= "Self Highlight On Screen:";
	SCCN_CMDSTATUS[13]				= "Hide Chat Buttons:";
	SCCN_CMDSTATUS[14] 				= "BG Minimap Autopopup:";
	SCCN_CMDSTATUS[15] 				= "Custom Highlight:";
	SCCN_CMDSTATUS[16] 				= "Short Channelname:";
	SCCN_CMDSTATUS[17]				= "Auto Gossip Skip:";
	SCCN_CMDSTATUS[18]				= "Auto Dismount:";	
	SCCN_CMDSTATUS[19]				= "In Chat Highlight:";	
	SCCN_CMDSTATUS[20]				= "Remeber last Chatroom (sticky):";
	SCCN_CMDSTATUS[21]				= "Don't Fade chattext automaticaly:";	
	-- cursom invite word in the local language
	SCCN_CUSTOM_INV[0] 				= "1nv1t3"; --   :D
	SCCN_CUSTOM_INV[1] 				= "einladen"; --   :D
	-- Whispers customized
	SCCN_CUSTOM_CHT_FROM			= "From %s:";
	SCCN_CUSTOM_CHT_TO				= "To %s:";
	-- hide this channels aditional, feel free to add your own
	SCCN_STRIPCHAN[1]				= "Guild";
	SCCN_STRIPCHAN[2]				= "Raid";
	SCCN_STRIPCHAN[3]				= "Party";
	SCCN_STRIPCHAN[4]				= "LocalDefense";
	SCCN_STRIPCHAN[5]				= "WorldDefense";
	SCCN_STRIPCHAN[6]				= "LookingForGroup";	
	SCCN_STRIPCHAN[7]				= "Trade";
	SCCN_STRIPCHAN[8]				= "General";
	-- ItemLink Channels
    SCCN_ILINK[1]                   = "General -"
    SCCN_ILINK[2]                   = "Trade -"
    SCCN_ILINK[3]                   = "LookingForGroup -"
    SCCN_ILINK[4]                   = "LocalDefense -"
    SCCN_ILINK[5]                   = "WorldDefense"
	-- some general channel name translation for the GUI
	SCCN_TRANSLATE[1]				= "Guild";
	SCCN_TRANSLATE[2]				= "Officer";
	SCCN_TRANSLATE[3]				= "Group";
	SCCN_TRANSLATE[4]				= "Raid";
	SCCN_TRANSLATE[5]				= "Whisper";
	SCCN_Highlighter				= "ChatMOD Highlight";
	SCCN_Config						= "ChatMOD Config";
	SCCN_Changelog					= "ChatMOD Changelog";
	
end
