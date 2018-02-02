local _G = getfenv()
local MasterLute = _G.MasterLute
local gsub = string.gsub
local format = string.format
local tonumber = tonumber
local strfind = string.find

local main_frame = CreateFrame('Frame', nil, UIParent)
MasterLute.main_frame = main_frame
main_frame:SetPoint('CENTER', 0, 0)
main_frame:SetWidth(256)
main_frame:SetHeight(96)
main_frame:SetBackdrop({
	bgFile=[[Interface\TutorialFrame\TutorialFrameBackground]],
	edgeFile=[[Interface\TutorialFrame\TutorialFrameBorder]],
	tile = false,
	tileSize = 16,
	edgeSize = 32,
	insets = { left = 5, right = 5, top = 24, bottom = 5 }
})
main_frame:SetMovable(true)
main_frame:SetClampedToScreen(true)
main_frame:SetToplevel(true)
main_frame:EnableMouse(true)
main_frame:RegisterForDrag('LeftButton')
main_frame:SetScript('OnDragStart', function()
	this:StartMoving()
end)
main_frame:SetScript('OnDragStop', function()
	this:StopMovingOrSizing()
end)

local label = main_frame:CreateFontString()
main_frame.label = label
label:SetFontObject(GameFontNormal)
label:SetPoint('TOP', -6, -6)
label:SetText(format('分配大师 v. %s', GetAddOnMetadata('MasterLute', 'Version')))

local closeButton = CreateFrame('Button', nil, MasterLute.main_frame, 'UIPanelCloseButton')
main_frame.closeButton = closeButton
closeButton:SetPoint('TOPRIGHT', 3, 4)

local messageFormat = CreateFrame('EditBox', nil, MasterLute.main_frame)
main_frame.messageFormat = messageFormat
messageFormat:SetPoint('TOP', 0, -26)
messageFormat:SetPoint('LEFT', 20, 0)
messageFormat:SetPoint('RIGHT', -20, 0)
messageFormat:SetAutoFocus(false)
messageFormat:SetTextInsets(0, 0, 3, 3)
messageFormat:SetMaxLetters(256)
messageFormat:SetHeight(20)
messageFormat:SetFontObject(ChatFontNormal)
messageFormat:SetTextColor(0.9, 0.9, 0.9)

do
	local Left, Right, Middle
	Left = messageFormat:CreateTexture()
	Middle = messageFormat:CreateTexture()
	Right = messageFormat:CreateTexture()
	
	messageFormat.Left = Left
	messageFormat.Middle = Middle
	messageFormat.Right = Right
	
	Left:SetTexture([[Interface\Common\Common-Input-Border]])
	Middle:SetTexture([[Interface\Common\Common-Input-Border]])
	Right:SetTexture([[Interface\Common\Common-Input-Border]])
	
	Left:SetTexCoord(0, 0.0625, 0, 0.625)
	Middle:SetTexCoord(0.0625, 0.9375, 0, 0.625)
	Right:SetTexCoord(0.9375, 1.0, 0, 0.625)
	
	Left:SetPoint('TOPLEFT', -8, 0)
	Middle:SetPoint('LEFT', Left, 'RIGHT', 0, 0)
	Right:SetPoint('LEFT', Middle, 'RIGHT', 0, 0)
	
	Left:SetWidth(8)
	Left:SetHeight(20)
	Middle:SetWidth(main_frame:GetWidth()-36)
	Middle:SetHeight(20)
	Right:SetWidth(8)
	Right:SetHeight(20)
end

messageFormat:SetScript('OnTextChanged', function()
	
end)
messageFormat:SetScript('OnEditFocusLost', function()
	this:HighlightText(0, 0)
end)
messageFormat:SetScript('OnEscapePressed', function()
	this:ClearFocus()
end)
messageFormat:SetScript('OnEnterPressed', function()
	this:ClearFocus()
	MasterLute_Data.messageFormat = this:GetText()
end)

local item = CreateFrame('Frame', nil, main_frame)
main_frame.item = item
item:SetWidth(37)
item:SetHeight(37)
item:SetPoint('TOPLEFT', 12, -48)
item:EnableMouse(true)

item.hasItem = nil
item.itemLink = nil
item.itemID = nil
item.itemString = nil
item.texture = nil

item:SetScript('OnEnter', function()
	if this.hasItem then
		GameTooltip:SetOwner(this, 'ANCHOR_BOTTOMRIGHT')
		GameTooltip:SetHyperlink(this.itemLink)
	end
end)

item:SetScript('OnLeave', function()
	GameTooltip:Hide()
end)

local icon = item:CreateTexture(nil, "OVERLAY")
main_frame.item.icon = icon
icon:SetAllPoints()

local price = CreateFrame('EditBox', nil, MasterLute.main_frame)
main_frame.price = price
price:SetPoint('TOPLEFT', 60, -48)
price:SetAutoFocus(false)
price:SetTextInsets(0, 0, 3, 3)
price:SetMaxLetters(4)
price:SetHeight(37)
price:SetWidth(37)
price:SetFontObject(NumberFontNormalLarge)
price:SetText('0')

do
	local Left, Right, Middle
	Left = price:CreateTexture()
	Middle = price:CreateTexture()
	Right = price:CreateTexture()
	
	price.Left = Left
	price.Middle = Middle
	price.Right = Right
	
	Left:SetTexture([[Interface\Common\Common-Input-Border]])
	Middle:SetTexture([[Interface\Common\Common-Input-Border]])
	Right:SetTexture([[Interface\Common\Common-Input-Border]])
	
	Left:SetTexCoord(0, 0.0625, 0, 0.625)
	Middle:SetTexCoord(0.0625, 0.9375, 0, 0.625)
	Right:SetTexCoord(0.9375, 1.0, 0, 0.625)
	
	Left:SetPoint('TOPLEFT', -8, 0)
	Middle:SetPoint('LEFT', Left, 'RIGHT', 0, 0)
	Right:SetPoint('LEFT', Middle, 'RIGHT', 0, 0)
	
	Left:SetWidth(8)
	Left:SetHeight(37)
	Middle:SetWidth(37)
	Middle:SetHeight(37)
	Right:SetWidth(8)
	Right:SetHeight(37)
end

price:SetScript('OnTextChanged', function()
	
end)
price:SetScript('OnEditFocusLost', function()
	this:HighlightText(0, 0)
end)
price:SetScript('OnEscapePressed', function()
	this:ClearFocus()
end)
price:SetScript('OnEnterPressed', function()
	this:ClearFocus()
end)

local send = CreateFrame('Button', nil, main_frame, 'UIPanelButtonTemplate')
main_frame.send = send
send:SetWidth(47)
send:SetHeight(37)
send:SetPoint('TOPRIGHT', -10, -48)
send:SetText('发送')

send:SetScript('OnClick', function()
	if not MasterLute.main_frame.item.itemLink then return end
	
	local str = MasterLute.main_frame.messageFormat:GetText()
	str = gsub(str, '$item', MasterLute.main_frame.item.itemString)
	str = gsub(str, '$price', MasterLute.main_frame.price:GetText())
	
	MasterLute_Data.prices[tonumber(MasterLute.main_frame.item.itemID)] = tonumber(MasterLute.main_frame.price:GetText())
	
	SendChatMessage(str, 'RAID')
end)
