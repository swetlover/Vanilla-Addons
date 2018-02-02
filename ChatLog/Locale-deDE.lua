local L = AceLibrary("AceLocale-2.2"):new("ChatLog")

--[[
<item>help : used for slashcommand help
<item>popup : used for popup dialogs
<item>tooltip : used for tooltips
<item>confirm : used to confirm action in chat frame
]]

--[[
Umlautersetzung: Unicode for Gemrman Umlauts
ä->\195\164; ö->\195\182; ü->\195\188; ß->\195\159
]]

L:RegisterTranslations("deDE", function() return {
	["resetloc"] = "Positionen der Fenster zur\195\188cksetzen.",
	["resetbutton"] = "Resets ChatLog button position.",
	["maxlog"] = "Maximal ",
	["maxloglines"] = " Zeilen.",
	["nblines"] = "Lines: ",
	["logstartedon"] = "Log gestartet am ",
	["logstartedat"] = " um ",
	["logstopped"] = "Log gestoppt.",
	["clearall"] = "Alle Leeren",
	["clearallhelp"] = "Clears all the logs",
	["clearallpopup"] = {
		[1] = "This will clear all logs.",
		[2] = "Ok",
		[3] = "Cancel",
	},
	["clearallconfirm"] = "Logs geleert.",
	["reset"] = "Reset",
	["resethelp"] = "Resets all settings and chats.",
	["resetpopup"] = {
		[1] = "This will reset all settings and chats.",
		[2] = "Ok",
		[3] = "Cancel",
	},
	["resetconfirm"] = "Reseted all settings and chats.",
	["delete"] = "L\195\182schen",
	["deleteconfirm"] = "Chat deleted: ",
	["enable"] = "Einschalten",
	["disable"] = "Ausschalten",
	["enabled"] = "Enabled",
	["disabled"] = "Disabled",
	["empty"] = "Leeren",
	["emptypopup"] = {
		[1] = "This will clear the current log.",
		[2] = "Ok",
		[3] = "Cancel",
	},
	["emptyconfirm"] = "Log geleert: ",
	["copy"] = "Kopieren",
	["copywindow"] = "Chat Kopieren",
	["close"] = "Schlie\195\159en",
	["enableddefault"] = "Logge neue Channels.",
	["enableddefaulttooltip"] = {
		[1] = "Logge neue Channels",
		[2] = "Startet automatsich das Loggen, wenn",
		[3] = "ein neuer Channel betreten wird.",
	},
	["chatlog"] = "Chat in Datei speichern",
	["chatlogtooltip"] = {
		[1] = "Speichert den Chat in einer Datei.",
		[2] = "Speichert den Chat (nicht das Kampflog)",
		[3] = "in Logs\\WoWChatLog.txt",
	},
	["chatlogdisabled"] = "This function is disabled.",
	["combatlog"] = "Kampflog in Datei speichern",
	["combatlogtooltip"] = {
		[1] = "Speichert das Kampflog in einer Datei.",
		[2] = "Speichert das Kampflog",
		[3] = "in Logs\\WoWCombatLog.txt",
	},
	["combatlogdisabled"] = "This function is disabled.",
	["toggle"] = "Toggles ChatLog.",
	["toggletooltip"] = {
		[1] = "ChatLog",
		[2] = "Linksklick, um ChatLog anzuzeigen/zu verstecken.",
		[3] = "Rechts-Klick zum Verschieben des Buttons.",
		[4] = "Middle-Click to reset position.",
	},
	["chatnames"] = {
		["whisper"] = "Fl\195\188stern",
		["raid"] = "Raid",
		["party"] = "Gruppe",
		["say"] = "Sagen",
		["yell"] = "Schreien",
		["officer"] = "Offizier",
		["guild"] = "Gilde",
		["general"] = "General chats",
		["custom"] = "Custom chats",
	},
	["generalchats"] = {
		["general"] = {
			["name"] = "Allgemein",
			["string"] = "allgemein",
		},
		["trade"] = {
			["name"] = "Handel",
			["string"] = "handel",
		},
		["localdefense"] = {
			["name"] = "LokaleVerteidigung",
			["string"] = "lokaleverteidigung",
		},
		["worlddefense"] = {
			["name"] = "WeltVerteidigung",
			["string"] = "weltverteidigung",
		},
		["lookingforgroup"] = {
			["name"] = "SucheNachGruppe",
			["string"] = "suchenachgruppe",
		},
		["guildrecruitment"] = {
			["name"] = "Gildenrekrutierung",
			["string"] = "gildenrekrutierung",
		},
	},
	["customchat"] = {
		["join"] = "You joined channel.",
		["leave"] = "You left channel.",
	},
	["whisperfrom"] = " fl\195\188stert",
	["whisperto"] = "Zu ",
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