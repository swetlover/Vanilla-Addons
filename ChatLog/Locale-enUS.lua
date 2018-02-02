local L = AceLibrary("AceLocale-2.2"):new("ChatLog")

--[[
<item>help : used for slashcommand help
<item>popup : used for popup dialogs
<item>tooltip : used for tooltips
<item>confirm : used to confirm action in chat frame
]]

L:RegisterTranslations("enUS", function() return {
	["resetloc"] = "Resets ChatLog main window position.",
	["resetbutton"] = "Resets ChatLog button position.",
	["maxlog"] = "Max log: ",
	["maxloglines"] = " lines.",
	["nblines"] = "Lines: ",
	["logstartedon"] = "Logging started on ",
	["logstartedat"] = " at ",
	["logstopped"] = "Logging stopped.",
	["clearall"] = "Clear all",
	["clearallhelp"] = "Clears all the logs",
	["clearallpopup"] = {
		[1] = "This will clear all logs.",
		[2] = "Ok",
		[3] = "Cancel",
	},
	["clearallconfirm"] = "All chats cleared.",
	["reset"] = "Reset",
	["resethelp"] = "Resets all settings and chats.",
	["resetpopup"] = {
		[1] = "This will reset all settings and chats.",
		[2] = "Ok",
		[3] = "Cancel",
	},
	["resetconfirm"] = "Reseted all settings and chats.",
	["delete"] = "Delete",
	["deleteconfirm"] = "Chat deleted: ",
	["enable"] = "Enable",
	["disable"] = "Disable",
	["enabled"] = "Enabled",
	["disabled"] = "Disabled",
	["empty"] = "Empty",
	["emptypopup"] = {
		[1] = "This will clear the current log.",
		[2] = "Ok",
		[3] = "Cancel",
	},
	["emptyconfirm"] = "Chat cleared: ",
	["copy"] = "Copy",
	["copywindow"] = "Copy window",
	["close"] = "Close",
	["enableddefault"] = "Log new channels",
	["enableddefaulttooltip"] = {
		[1] = "Log new channels",
		[2] = "Automaticaly starts logging",
		[3] = "when you join a new channel.",
	},
	["chatlog"] = "Log the chat to a file",
	["chatlogtooltip"] = {
		[1] = "Log the chat to a file",
		[2] = "Logs the chat (not the combat log)",
		[3] = "to Logs\\WoWChatLog.txt",
	},
	["chatlogdisabled"] = "This function is disabled.",
	["combatlog"] = "Log the combat chat to a file",
	["combatlogtooltip"] = {
		[1] = "Log the combat chat to a file",
		[2] = "Logs the combat chat",
		[3] = "to Logs\\WoWCombatLog.txt",
	},
	["combatlogdisabled"] = "This function is disabled.",
	["toggle"] = "Toggles ChatLog.",
	["toggletooltip"] = {
		[1] = "ChatLog",
		[2] = "Left-Click to toggle Chatlog.",
		[3] = "Right-Click to drag this button.",
		[4] = "Middle-Click to reset position.",
	},
	["chatnames"] = {
		["whisper"] = "Whisper",
		["raid"] = "Raid",
		["party"] = "Party",
		["say"] = "Say",
		["yell"] = "Yell",
		["officer"] = "Officer",
		["guild"] = "Guild",
		["general"] = "General chats",
		["custom"] = "Custom chats",
	},
	["generalchats"] = {
		["general"] = {
			["name"] = "General",
			["string"] = "general",
		},
		["trade"] = {
			["name"] = "Trade",
			["string"] = "trade",
		},
		["localdefense"] = {
			["name"] = "Local defense",
			["string"] = "localdefense",
		},
		["worlddefense"] = {
			["name"] = "World defense",
			["string"] = "worlddefense",
		},
		["lookingforgroup"] = {
			["name"] = "Looking for group",
			["string"] = "lookingforgroup",
		},
		["guildrecruitment"] = {
			["name"] = "Guild recruitment",
			["string"] = "guildrecruitment",
		},
	},
	["customchat"] = {
		["join"] = "You joined channel.",
		["leave"] = "You left channel.",
	},
	["whisperfrom"] = " whispers",
	["whisperto"] = "To ",
	["scroll"] = {
		["linedown"] = {
			[1] = "Scroll one line down",
		},
		["lineup"] = {
			[1] = "Scroll one line up",
		},
		["pagedown"] = {
			[1] = "Scroll one page down",
		},
		["pageup"] = {
			[1] = "Scroll one page up",
		},
		["bottom"] = {
			[1] = "Scroll to bottom",
		},
		["top"] = {
			[1] = "Scroll to top",
		},
	},
} end)