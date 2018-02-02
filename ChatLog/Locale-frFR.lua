local L = AceLibrary("AceLocale-2.2"):new("ChatLog")

--[[
<item>help : used for slashcommand help
<item>popup : used for popup dialogs
<item>tooltip : used for tooltips
<item>confirm : used to confirm action in chat frame
]]

L:RegisterTranslations("frFR", function() return {
	["resetloc"] = "Réinitialise la position de la fenêtre de ChatLog.",
	["resetbutton"] = "Réinitialise la position du bouton de ChatLog.",
	["maxlog"] = "Log max: ",
	["maxloglines"] = " lignes.",
	["nblines"] = "Lignes: ",
	["logstartedon"] = "Log commencé le ",
	["logstartedat"] = " à ",
	["logstopped"] = "Log arrêté.",
	["clearall"] = "Tout vider",
	["clearallhelp"] = "Vide tous les logs",
	["clearallpopup"] = {
		[1] = "Ceci va vider tous les logs.",
		[2] = "Ok",
		[3] = "Annuler",
	},
	["clearallconfirm"] = "Tous les logs ont été vidé",
	["reset"] = "Reset",
	["resethelp"] = "Réinitialise tous les paramêtres et chats.",
	["resetpopup"] = {
		[1] = "Ceci réinitialisera tous les paramêtres et chats.",
		[2] = "Ok",
		[3] = "Annuler",
	},
	["resetconfirm"] = "Paramêtres et chats réinitialisés",
	["delete"] = "Supprimer",
	["deleteconfirm"] = "Chat supprimé",
	["enable"] = "Activer",
	["disable"] = "Désactiver",
	["enabled"] = "Activé",
	["disabled"] = "Désactivé",
	["empty"] = "Vider",
	["emptypopup"] = {
		[1] = "Ceci videra le log en cours.",
		[2] = "Ok",
		[3] = "Annuler",
	},
	["emptyconfirm"] = "Chat vidé",
	["copy"] = "Copier",
	["copywindow"] = "Fenêtre de copie",
	["close"] = "Fermer",
	["enableddefault"] = "Logger nouv. chats",
	["enableddefaulttooltip"] = {
		[1] = "Logger les nouveaux chats",
		[2] = "Active automatiquement le log",
		[3] = "quand vous rejoignez un canal.",
	},
	["chatlog"] = "Enreg. le chat",
	["chatlogtooltip"] = {
		[1] = "Enregistrer le chat dans un fichier",
		[2] = "Enregistre le chat (pas le journal de combat)",
		[3] = "dans le fichier Logs\\WoWChatLog.txt",
	},
	["chatlogdisabled"] = "Cette fonction est désactivée",
	["combatlog"] = "Enreg. le journal de combat",
	["combatlogtooltip"] = {
		[1] = "Enregistrer le journal de combat dans un fichier",
		[2] = "Enregistre le journal de combat",
		[3] = "dans le fichier Logs\\WoWCombatLog.txt",
	},
	["combatlogdisabled"] = "Cette fonction est désactivée",
	["toggle"] = "Affiche/Cache ChatLog.",
	["toggletooltip"] = {
		[1] = "ChatLog",
		[2] = "Clic gauche pour afficher/cacher Chatlog.",
		[3] = "Clic droit pour déplacer.",
		[4] = "Bouton du milieu pour réinitialiser la position.",
	},
	["chatnames"] = {
		["whisper"] = "Chuchoter",
		["raid"] = "Raid",
		["party"] = "Groupe",
		["say"] = "Dire",
		["yell"] = "Crier",
		["officer"] = "Officier",
		["guild"] = "Guilde",
		["general"] = "Chats généraux",
		["custom"] = "Chats personnalisés",
	},
	["generalchats"] = {
		["general"] = {
			["name"] = "Général",
			["string"] = "général",
		},
		["trade"] = {
			["name"] = "Commerce",
			["string"] = "commerce",
		},
		["localdefense"] = {
			["name"] = "DéfenseLocale",
			["string"] = "défenselocale",
		},
		["worlddefense"] = {
			["name"] = "DéfenseUniverselle",
			["string"] = "défenseuniverselle",
		},
		["lookingforgroup"] = {
			["name"] = "RechercheGroupe",
			["string"] = "recherchegroupe",
		},
		["guildrecruitment"] = {
			["name"] = "RecrutementDeGuilde",
			["string"] = "recrutementdeguilde",
		},
	},
	["customchat"] = {
		["join"] = "Vous rejoignez un canal.",
		["leave"] = "Vous quittez un canal.",
	},
	["whisperfrom"] = " chuchote",
	["whisperto"] = "A ",
	["scroll"] = {
		["linedown"] = {
			[1] = "Descendre d'une ligne",
		},
		["lineup"] = {
			[1] = "Monter d'une ligne",
		},
		["pagedown"] = {
			[1] = "Descendre d'une page",
		},
		["pageup"] = {
			[1] = "Monter d'une page",
		},
		["bottom"] = {
			[1] = "Atteindre le bas",
		},
		["top"] = {
			[1] = "Atteindre le haut",
		},
	},
} end)