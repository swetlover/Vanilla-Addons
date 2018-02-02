local _G = getfenv()
local MasterLute = _G.MasterLute
local enUS = MasterLute.Locale:new()
local L = enUS.Strings

MasterLute.Locales = MasterLute.Locales or MasterLute.LocaleTable:new(enUS)
MasterLute.Locales["enUS"] = enUS

-- zone names (unused)
L["Naxxramas"] 			= "Naxxramas"
L["Ahn'Qiraj"] 			= "Ahn'Qiraj"
L["Blackwing Lair"] 	= "Blackwing Lair"
L["Molten Core"] 		= "Molten Core"
L["Ruins of Ahn'Qiraj"] = "Ruins of Ahn'Qiraj"
L["Zul'Gurub"] 			= "Zul'Gurub"
L["Onyxia's Lair"] 		= "Onyxia's Lair"

-- slash commands and arguments
L["/masterlute"] = "/masterlute"
L["/lute"] = "/lute"
L["enable"] = "enable"
L["disable"] = "disable"
L["price"] = "price"
L["set"] = "set"
L["get"] = "get"
L["list"] = "list"

-- output messages
L["[autoLoad] enabled for [%s]"] = "[autoLoad] enabled for [%s]"
L["[autoLoad] Enabled"] = "[autoLoad] Enabled"
L["Enabled"] = "Enabled"
L["Disabled"] = "Disabled"
L["Page %d / %d"] = "Page %d / %d"
L["Dababase fixed"] = "Dababase fixed"
L["New price %s [ID:%d] - %d"] = "New price %s [ID:%d] - %d"
L["%s [ID:%s] - price %d"] = "%s [ID:%s] - price %d"
L["%s [ID:%s] - unknown price"] = "%s [ID:%s] - unknown price"
L["[%d] %s[ID:%d] - price %d"] = "[%d] %s[ID:%d] - price %d"

-- help
L["/masterlute enable (enables addon)"] = "/masterlute enable (enables addon)"
L["/masterlute disable (disables addon)"] = "/masterlute disable (disables addon)"
L["/masterlute autoload (enables or disables autoload in current zone)"] = "/masterlute autoload (enables or disables autoload in current zone)"
L["/masterlute price set <itemLink | itemID> <number> (sets the default price for item)"] = "/masterlute price set <itemLink | itemID> <number> (sets the default price for item)"
L["/masterlute price get <itemLink | itemID> (returns item price, if any)"] = "/masterlute price get <itemLink | itemID> (returns item price, if any)"
L["/masterlute price list [, page] (lists items and prices)"] = "/masterlute price list [, page] (lists items and prices)"