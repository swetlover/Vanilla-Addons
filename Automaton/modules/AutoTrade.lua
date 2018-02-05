local L = AceLibrary("AceLocale-2.2"):new("Automaton_Trade")

L:RegisterTranslations("enUS", function() return {
	["Conjured Crystal Water"] = true,
	["Conjured Sparkling Water"] = true,
	["Conjured Mineral Water"] = true,
	["Conjured Spring Water"] = true,
	["Conjured Sweet Roll"] = true,
	["Conjured Sourdough"] = true,
	["Conjured Pumpernickel"] = true,
	["Major Healthstone"] = true,
	["Greater Healthstone"] = true,
	["Healthstone"] = true,
	["Wild Thornroot"] = true,
	["Arcane Powder"] = true,
	["Holy Candle"] = true,
	["Sacred Candle"] = true,
	["Ankh"] = true,
	["Rune of Portals"] = true,
	["Symbol of Divinity"] = true,
	["Symbol of Kings"] = true,
	["Ironwood Seed"] = true,
    
    ["Trade"] = true,
    ["Accept conjured items in trade window automatically"] = true,
    ["Oops. I don't have the space in my inventory for this."] = true,    
} end )

L:RegisterTranslations("deDE", function() return {
	["Conjured Crystal Water"] = "Herbeigezaubertes Kristallwasser",
	["Conjured Sparkling Water"] = "Herbeigezaubertes Sprudelwasser",
	["Conjured Mineral Water"] = "Herbeigezaubertes Mineralwasser",
	["Conjured Spring Water"] = "Herbeigezaubertes Quellwasser",
	["Conjured Sweet Roll"] = "Herbeigezaubertes Milchbrötchen",
	["Conjured Sourdough"] = "Herbeigezauberter Sauerteig",
	["Conjured Pumpernickel"] = "Herbeigezauberter Pumpernickel",
	["Major Healthstone"] = "Erheblicher Gesundheitsstein",
	["Greater Healthstone"] = "Großer Gesundheitsstein",
	["Healthstone"] = "Gesundheitsstein",
	["Wild Thornroot"] = "Wilder Dornwurz",
	["Arcane Powder"] = "Arkanes Pulver",
	["Holy Candle"] = "Heilige Kerze",
	["Sacred Candle"] = "Hochheilige Kerze",
	["Ankh"] = "Ankh",
	["Rune of Portals"] = "Rune der Portale",
	["Symbol of Divinity"] = "Symbol der Offenbarung",
	["Symbol of Kings"] = "Symbol der Könige",
	["Ironwood Seed"] = "Eisenholzsamenkorn",
    
  ["Trade"] = "Handel",
  ["Accept conjured items in trade window automatically"] = "Automatisch herbeigezauberte Items im Handelsfenster akzeptieren",
  ["Oops. I don't have the space in my inventory for this."] = "Ups. Ich habe daf\195\188r keinen Platz mehr in meinen Taschen.",    
} end )

L:RegisterTranslations("frFR", function() return {
	["Conjured Crystal Water"] = "Eau cristalline invoquée",
	["Conjured Sparkling Water"] = "Eau pétillante invoquée",
	["Conjured Mineral Water"] = "Eau minérale invoquée",
	["Conjured Spring Water"] = "Eau de source invoquée",
	["Conjured Sweet Roll"] = "Pain au lait invoqué",
	["Conjured Sourdough"] = "Pain de route invoqué",
	["Conjured Pumpernickel"] = "Pain noir invoqué",
	["Major Healthstone"] = "Pierre de soins majeure",
	["Greater Healthstone"] = "Pierre de soins supérieure",
	["Healthstone"] = "Pierre de soins",
	["Wild Thornroot"] = "Ronceterre sauvage",
	["Arcane Powder"] = "Poudre des arcanes",
	["Holy Candle"] = "Bougie sanctifiée",
	["Sacred Candle"] = "Bougie sacrée",
	["Ankh"] = "Ankh",
	["Rune of Portals"] = "Rune des portails",
	["Symbol of Divinity"] = "Symbole de divinité",
	["Symbol of Kings"] = "Symbole des rois",
	["Ironwood Seed"] = "Graine de bois de fer",
    
        ["Trade"] = "Echange",
        ["Accept conjured items in trade window automatically"] = "Accepter les ojets conjurés automatiquement",
        ["Oops. I don't have the space in my inventory for this."] = "Oups! Pardon je n'ai plus de place.",    
} end )

L:RegisterTranslations("zhCN", function() return {
	["Conjured Crystal Water"] = "魔法晶水",
	["Conjured Sparkling Water"] = "魔法苏打水",
	["Conjured Mineral Water"] = "魔法矿泉水",
	["Conjured Spring Water"] = "魔法泉水",
	["Conjured Sweet Roll"] = "魔法甜面包",
	["Conjured Sourdough"] = "魔法酵母",
	["Conjured Pumpernickel"] = "魔法粗面包",
	["Major Healthstone"] = "特效治疗石",
	["Greater Healthstone"] = "强效治疗石",
	["Healthstone"] = "治疗石",
	["Wild Thornroot"] = "野生棘根草",
	["Arcane Powder"] = "魔粉",
	["Holy Candle"] = "圣洁蜡烛",
	["Sacred Candle"] = "神圣蜡烛",
	["Ankh"] = "十字章",
	["Rune of Portals"] = "传送门符文",
	["Symbol of Divinity"] = "神圣符印",
	["Symbol of Kings"] = "王者印记",
	["Ironwood Seed"] = "铁木种子",
    
    ["Trade"] = "物品交易",
    ["Accept conjured items in trade window automatically"] = "自动接受吃喝和及施法材料交易.",
    ["Oops. I don't have the space in my inventory for this."] = "目前，没有足够的空间来接收你的包里的物品。请检查.",    
} end )

local autoTradeItems = {
	["Accept"] = {
		L["Conjured Crystal Water"],
		L["Conjured Sparkling Water"],
		L["Conjured Mineral Water"],
		L["Conjured Spring Water"],
		L["Conjured Sweet Roll"],
		L["Conjured Sourdough"],
		L["Conjured Pumpernickel"],
		L["Major Healthstone"],
		L["Greater Healthstone"],
		L["Healthstone"],
		L["Wild Thornroot"],
		L["Arcane Powder"],
		L["Holy Candle"],
		L["Sacred Candle"],
		L["Ankh"],
		L["Rune of Portals"],
		L["Symbol of Divinity"],
		L["Symbol of Kings"],
		L["Ironwood Seed"],
	},
}

-- This will die with WoW v2.0
Automaton_Trade = Automaton:NewModule("Trade", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")
Automaton.options.args.trade = {
	type = 'toggle',
	name = L["Trade"],
	desc = L["Accept conjured items in trade window automatically"],
	get = function() return Automaton:IsModuleActive("Trade") end,
	set = function(v) Automaton:ToggleModuleActive("Trade", v) end,
}

function Automaton_Trade:OnEnable()
	self:RegisterEvent("TRADE_TARGET_ITEM_CHANGED")
end

function Automaton_Trade:TRADE_TARGET_ITEM_CHANGED()
	if self:IsEventScheduled("Automaton_autotrade") then
		self:CancelScheduledEvent("Automaton_autotrade")
	end

	if GetPlayerTradeMoney() > 0 or GetTargetTradeMoney() > 0 then
		self:Debug("Oops. You or the target to trade with have money in the window.")
		return
	end
	local items = 0
	for i=1,7 do
		local name = GetTradeTargetItemInfo(i)
		if name and not foreachi(autoTradeItems["Accept"],function(i,v) if v==name then return true end end) then
			self:Debug("Oops. I'm not allowed to take one of those items.")
			return
		elseif name then
			items = items + 1
		end
		name = GetTradePlayerItemInfo(i)
		if name then
			self:Debug("Oops. Item in my trade window, no dice.")
			return
		end
	end
	if items == 0 then return end

	local slots = 0
	for i=0,4 do
		for j=1,GetContainerNumSlots(i) do
			if not GetContainerItemInfo(i,j) then
				slots = slots + 1
			end
		end
	end

	if slots < items then
		self:Print(L["Oops. I don't have the space in my inventory for this."])
		return
	end

	self:Debug("AutoTrading...")
	self:ScheduleEvent("Automaton_autotrade", function() AcceptTrade() end, 1, self)
end