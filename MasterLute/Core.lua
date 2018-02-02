local _G = getfenv()
local MasterLute = _G.MasterLute

MasterLute.hooks = {}
MasterLute.LootCloseError = 0

local Event = CreateFrame('Frame')

Event:SetScript('OnEvent', function()
	this[event](this)
end)

MasterLute.hooks.LootFrameItem_OnClick = _G.LootFrameItem_OnClick
MasterLute.hooks.LootFrame_Update = _G.LootFrame_Update
MasterLute.hooks.LootFrame_OnHide = _G.LootFrame_OnHide
MasterLute.hooks.LootFrame_OnShow = _G.LootFrame_OnShow
MasterLute.hooks.CloseLoot = _G.CloseLoot

function LootFrame_OnHide()
	MasterLute.hooks.LootFrame_OnHide()
	if MasterLute.enabled then
		MasterLute:OnClose()
	end
end

function LootFrame_OnShow()
	MasterLute.hooks.LootFrame_OnShow()
	if MasterLute.enabled then
		MasterLute:OnShow()
	end
end

function LootFrame_Update()
	MasterLute.hooks.LootFrame_Update()
	MasterLute:ClearItem()
end

function CloseLoot(reason)
	MasterLute.LootCloseError = reason
	MasterLute.hooks.CloseLoot(reason)
	if MasterLute.enabled then
		MasterLute:OnClose()
	end
end

function LootFrameItem_OnClick(button)
	MasterLute.hooks.LootFrameItem_OnClick(button)
	
	if ( not ChatFrameEditBox:IsVisible() and IsShiftKeyDown() and MasterLute.main_frame:IsVisible() ) then
		local _, _, item_id, enchant_id, suffix_id, unique_id, name = strfind(GetLootSlotLink(this.slot), '^|c%x%x%x%x%x%x%x%x|Hitem:(%d+):(%d+):(%d+):(%d+)|h%[(.+)%]|h|r$')
		if item_id then
			item_id = tonumber(item_id)
			MasterLute.main_frame.item.hasItem = true
			MasterLute.main_frame.item.texture = GetLootSlotInfo(this.slot)
			MasterLute.main_frame.item.itemString = GetLootSlotLink(this.slot)
			MasterLute.main_frame.item.itemLink = format('item:%d:%d%d:%d', item_id, enchant_id, suffix_id, unique_id)
			MasterLute.main_frame.item.itemID = item_id
			MasterLute.main_frame.item.icon:SetTexture(MasterLute.main_frame.item.texture)
			MasterLute.main_frame.price:SetText('0')
			
			if MasterLute_Data.prices[item_id] then
				MasterLute.main_frame.price:SetText(MasterLute_Data.prices[item_id])
			end
			
			MasterLute:print(MasterLute.main_frame.item.itemString, 1)
		end
	end
end

MasterLute.Event = Event