local _G = getfenv()
local MasterLute = _G.MasterLute
local debug_level = 0 -- 0 release, 1 some messages, 3 all messages
local addon = MasterLute.Event
local L = MasterLute.Locales[_G.GetLocale()].Strings

local gmatch = string.gfind

setmetatable(MasterLute, {
	__index = addon
});

addon:RegisterEvent('ADDON_LOADED')
addon:RegisterEvent('PLAYER_LOGIN')
addon:RegisterEvent('PLAYER_ENTERING_WORLD')

function MasterLute:print(message, level, headless)
	if not message then return end
	if level then
		if level <= debug_level then
			if headless then
				DEFAULT_CHAT_FRAME:AddMessage(message, 0.53, 0.69, 0.19)
			else
				DEFAULT_CHAT_FRAME:AddMessage('[MasterLute]: ' .. message, 0.53, 0.69, 0.19)
			end
		end
	else
		if headless then
			DEFAULT_CHAT_FRAME:AddMessage(message)
		else
			DEFAULT_CHAT_FRAME:AddMessage('[MasterLute]: ' .. message)
		end
	end
end

function MasterLute:ClearItem()
	MasterLute.main_frame.item.hasItem = nil
	MasterLute.main_frame.item.itemLink = nil
	MasterLute.main_frame.item.itemString = nil
	MasterLute.main_frame.item.texture = nil
	MasterLute.main_frame.item.itemID = nil
	MasterLute.main_frame.price:SetText('0')
	
	MasterLute.main_frame.item.icon:SetTexture([[Interface\PaperDoll\UI-PaperDoll-Slot-Bag]])
end

function MasterLute:OnShow()
	if self.LootCloseError and self.LootCloseError > 0 then
		self.LootCloseError = 0
		return
	end
	
	MasterLute:ClearItem()
	MasterLute.main_frame:Show()
end

function MasterLute:OnClose()
	MasterLute:ClearItem()
	MasterLute.main_frame:Hide()
end

function MasterLute:GetItemLink(itemID)
	local itemName, itemString, itemRarity = GetItemInfo(itemID)
	if not itemName then
		itemName = 'UNSAFE LINK'
		itemRarity = -1
		itemString = 'item:'..itemID..':0:0:0'
		local itemLink = ITEM_QUALITY_COLORS[itemRarity].hex..'|H'..itemString..'|h['..itemName..']|h|r'
		GameTooltip:SetHyperlink(itemString)
	end
	return ITEM_QUALITY_COLORS[itemRarity].hex..'|H'..itemString..'|h['..itemName..']|h|r'
end

function addon:ADDON_LOADED()
	if arg1 ~= 'MasterLute' then
		return
	end
	
	if not MasterLute_Data then
		MasterLute_Data = {}
	end
	
	if not MasterLute_Data.prices then
		MasterLute_Data.prices = {}
	end
	
	if not MasterLute_Data.Settings then
		MasterLute_Data.Settings = {}
	end
	
	if not MasterLute_Data.Settings.AutoLoad then
		MasterLute_Data.Settings.AutoLoad = {}
	end
	
	if not MasterLute_Data.messageFormat then
		MasterLute_Data.messageFormat = '$item DKP出分.底价 $price.开始!'
	end
	
	MasterLute.enabled = MasterLute_Data.Settings.enabled
	
	self:RegisterEvent('LOOT_OPENED')
	self:RegisterEvent('LOOT_CLOSED')
	
	MasterLute.main_frame:Hide()
	MasterLute.main_frame.messageFormat:SetText(MasterLute_Data.messageFormat)
end

function addon:LOOT_OPENED()
	if MasterLute.enabled then
		MasterLute:OnShow()
	end
end

function addon:LOOT_CLOSED()
	if MasterLute.enabled then
		MasterLute:OnClose()
	end
end

function addon:PLAYER_LOGIN()
	MasterLute.version = GetAddOnMetadata('MasterLute', 'Version')

end

function addon:PLAYER_ENTERING_WORLD()
	local zone = _G.GetRealZoneText()
	
	if MasterLute_Data.Settings.AutoLoad[zone] then
		MasterLute:print(L["[autoLoad] Enabled"])
		MasterLute.enabled = true
	end
end