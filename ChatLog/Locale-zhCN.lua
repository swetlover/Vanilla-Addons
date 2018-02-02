--zhCN Local
--Translator: <CWDG>月色狼影
--10 28 2006

local L = AceLibrary("AceLocale-2.2"):new("ChatLog")

--[[
<item>help : used for slashcommand help
<item>popup : used for popup dialogs
<item>tooltip : used for tooltips
<item>confirm : used to confirm action in chat frame
]]

L:RegisterTranslations("zhCN", function() return {
	["resetloc"] = "重置所有窗口位置。",
	["resetbutton"] = "重置ChatLog按钮位置。",
	["maxlog"] = "最大记录： ",
	["maxloglines"] = " 行。",
	["nblines"] = "行： ",
	["logstartedon"] = "记录开始于 ",
	["logstartedat"] = " 的 ",
	["logstopped"] = "记录停止。",
	["clearall"] = "清除所有记录",
	["clearallhelp"] = "清除所有记录",
	["clearallpopup"] = {
		[1] = "是否要清除所有记录？",
		[2] = "确定",
		[3] = "取消",
	},
	["clearallconfirm"] = "所有聊天清除。",
	["reset"] = "重置",
	["resethelp"] = "重置所有设置及聊天频道。",
	["resetpopup"] = {
		[1] = "是否要重置所有设置及聊天频道？",
		[2] = "确定",
		[3] = "取消",
	},
	["resetconfirm"] = "所有设置及聊天频道被重置。",
	["delete"] = "删除",
	["deleteconfirm"] = "聊天被删除： ",
	["enable"] = "启用",
	["disable"] = "禁用",
	["enabled"] = "已启用",
	["disabled"] = "被禁用",
	["empty"] = "清空",
	["emptypopup"] = {
		[1] = "是否清楚当前聊天记录？",
		[2] = "确定",
		[3] = "取消",
	},
	["emptyconfirm"] = "聊天被清除： ",
	["copy"] = "复制",
	["copywindow"] = "复制窗口",
	["close"] = "关闭",
	["enableddefault"] = "记录新频道",
	["enableddefaulttooltip"] = {
		[1] = "记录新频道",
		[2] = "自动开始记录",
		[3] = "当你加入新频道.",
	},
	["chatlog"] = "将聊天记录保存为文件",
	["chatlogtooltip"] = {
		[1] = "将聊天记录保存为文件",
		[2] = "聊天记录 (没有战斗记录)",
		[3] = "到 Logs\\WoWChatLog.txt",
	},
	["chatlogdisabled"] = "聊天记录被禁用",
	["combatlog"] = "将战斗记录保存为文件",
	["combatlogtooltip"] = {
		[1] = "将战斗记录保存为文件",
		[2] = "战斗记录",
		[3] = "到 Logs\\WoWCombatLog.txt",
	},
	["combatlogdisabled"] = "战斗记录被禁用",
	["toggle"] = "显示ChatLog.",
	["toggletooltip"] = {
		[1] = "ChatLog",
		[2] = "左键点击显示Chatlog.",
		[3] = "右键点击移动此按钮",
		[4] = "中间键点击重置位置",
	},
	["chatnames"] = {
		["whisper"] = "密语",
		["raid"] = "团队",
		["party"] = "队伍",
		["say"] = "说",
		["yell"] = "喊话",
		["officer"] = "官员",
		["guild"] = "公会",
		["general"] = "综合",
		["custom"] = "战斗记录",
	},
	["generalchats"] = {
		["general"] = {
			["name"] = "综合",
			["string"] = "综合",
		},
		["trade"] = {
			["name"] = "交易",
			["string"] = "交易",
		},
		["localdefense"] = {
			["name"] = "本地防务",
			["string"] = "本地防务",
		},
		["worlddefense"] = {
			["name"] = "世界防务",
			["string"] = "世界防务",
		},
		["lookingforgroup"] = {
			["name"] = "寻求组队",
			["string"] = "寻求组队",
		},
		["guildrecruitment"] = {
			["name"] = "公会招寡",
			["string"] = "公会招寡",
		},
	},
	["customchat"] = {
		["join"] = "你加入了频道。",
		["leave"] = "你离开了频道。",
	},
	["whisperfrom"] = " 密语",
	["whisperto"] = "发送给 ",
	["scroll"] = {
		["linedown"] = {
			[1] = "下翻一行",
		},
		["lineup"] = {
			[1] = "上翻一行",
		},
		["pagedown"] = {
			[1] = "下翻一页",
		},
		["pageup"] = {
			[1] = "上翻一页",
		},
		["bottom"] = {
			[1] = "下翻到最后一页",
		},
		["top"] = {
			[1] = "上翻到第一页",
		},
	},
} end)