local _G = getfenv();
local MasterLute = _G.MasterLute;
local zhCN = MasterLute.Locale:new();
local L = zhCN.Strings;

MasterLute.Locales = MasterLute.Locales or MasterLute.LocaleTable:new(zhCN);
MasterLute.Locales["zhCN"] = zhCN;

L["Naxxramas"] 			= "纳克萨玛斯";
L["Ahn'Qiraj"] 			= "安其拉";
L["Blackwing Lair"] 	= "黑翼之巢";
L["Molten Core"] 		= "熔火之心";
L["Ruins of Ahn'Qiraj"] = "安其拉废墟";
L["Zul'Gurub"] 			= "祖尔格拉布";
L["Onyxia's Lair"] 		= "奥妮克希亚的巢穴";

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
L["[autoLoad] enabled for [%s]"] = "[自动加载] 启用.在 [%s]"
L["[autoLoad] Enabled"] = "[自动加载] 启用"
L["Enabled"] = "Enabled"
L["Disabled"] = "Disabled"
L["Page %d / %d"] = "%d / %d 页"
L["Dababase fixed"] = "数据库固定"
L["New price %s [ID:%d] - %d"] = "新价值 %s [ID:%d] - %d"
L["%s [ID:%s] - price %d"] = "%s [ID:%s] - 价值 %d"
L["%s [ID:%s] - unknown price"] = "%s [ID:%s] - 未知价值"
L["[%d] %s[ID:%d] - price %d"] = "[%d] %s[ID:%d] - 价值 %d"

-- help
L["/masterlute enable (enables addon)"] = "/masterlute enable (启用插件)"
L["/masterlute disable (disables addon)"] = "/masterlute disable (禁用插件)"
L["/masterlute autoload (enables or disables autoload in current zone)"] = "/masterlute autoload (自动在当前区域启动或禁用)"
L["/masterlute price set <itemLink | itemID> <number> (sets the default price for item)"] = "/masterlute price set <itemLink | itemID> <number> (设置物品的默认价格)"
L["/masterlute price get <itemLink | itemID> (returns item price, if any)"] = "/masterlute price get <itemLink | itemID> (返还物品价格)"
L["/masterlute price list [, page] (lists items and prices)"] = "/masterlute price list [, page] (物品价格列表)"