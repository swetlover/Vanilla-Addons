-- May your brain not spontaneously explode from the reading of this disorganized mod.
local L = AceLibrary("AceLocale-2.2"):new("XLoot")

XLoot = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDB-2.0", "AceConsole-2.0", "AceHook-2.1", "AceModuleCore-2.0")-- Shhhhh

XLoot.revision  = tonumber((string.gsub("$Revision: 18178 $", "^%$Revision: (%d+) %$$", "%1")))

XLoot:SetModuleMixins("AceEvent-2.0", "AceConsole-2.0", "AceHook-2.1")
XLoot.dewdrop = AceLibrary("Dewdrop-2.0")

local lua51
local _G = getfenv(0)

XLoot.compat = string.find(GetBuildInfo(), "^2%.")

function XLoot:OnInitialize()
	if lua51 == nil then lua51 = loadstring("return function(...) return ... end") and true or false end
	self:RegisterDB("XLootDB")
	self.dbDefaults = {
		scale = 1.0,
		cursor = true,
		debug = false,
		smartsnap = true,
		snapoffset = 0,
		altoptions = true,
		collapse = true,
		linkallvis = "always",
		linkallthreshold = 2,
		linkallchannels = { },
		dragborder = true,
		lootexpand = true,
		swiftloot = false,
		qualityborder = false,
		qualityframe = false,
		texcolor = true,
		lootqualityborder = true,
		loothighlightframe = true,
		loothighlightthreshold = 1,
		qualitytext = false,
		infotext = true,
		lock = false,
		pos = { x = (UIParent:GetWidth()/2), y = (UIParent:GetHeight()/2) },
		bgcolor = { 0, 0, 0, .7 },
		bordercolor = { .7, .7, .7, 1 },
		lootbgcolor = { 0, 0, 0, .9 },
		lootbordercolor = { .5, .5, .5, 1 },
		infocolor = { 1, .8, 0 },
		forcecompat = false
	};
	self:RegisterDefaults("profile", self.dbDefaults)
	self:DoOptions()
	self.compat = self.db.profile.forcecompat == true and true or self.compat
	
	--Initial session variables
	self.numButtons = 0 -- Buttons currently created
	self.buttons = {} -- Easy reference array by ID
	self.frames = {}
	self.currentloot = {}
	self.visible = false
	self.setexpandedtext = false
	self.loothasbeenexpanded = false
	self.swiftlooting = false
	self.swifthooked = false
	self.classhexes = { }
	self.coinage = { { GOLD, 10000 }, { SILVER, 100 }, { COPPER, 1 } } 
	self:SetupFrames()

	self.dewdrop:Register(XLootFrame,
		'children', function()
				self.dewdrop:FeedAceOptionsTable(self.opts)
			end,
		'cursorX', true,
		'cursorY', true
	)

end

function XLoot:OpenMenu(frame)
	self.dewdrop:Open(frame,
		'children', function(level, value)
				self.dewdrop:FeedAceOptionsTable(self.opts)
			end,
		'cursorX', true,
		'cursorY', true
	)
end

--Hook builtin functions
function XLoot:OnEnable()
	self:Hook("CloseWindows", true)
	self:Hook("LootFrame_OnEvent", true)
	self:Hook("LootFrame_OnShow", true)
	self:Hook("LootFrame_OnHide", true)
	self:Hook("LootFrame_Update", true)
	if self.compat then
		self:Hook("LootButton_OnClick", "OnButtonClick", true)
		self:Hook("LootButton_OnModifiedClick", "OnModifiedButtonClick", true)
	else
		self:Hook("LootFrameItem_OnClick", "OnClick", true)
	end
	if self.db.profile.swiftloot then
		self:SwiftMouseEvents(true)
	end
	self:RegisterEvent("LOOT_OPENED", "OnOpen")
	self:RegisterEvent("LOOT_SLOT_CLEARED", "OnClear")
	self:RegisterEvent("LOOT_CLOSED", "OnClose")
end

function XLoot:OnDisable()
	self:UnregisterAllEvents()
end

function XLoot:Defaults()
	self:Print("Default values restored.")
	for k, v in pairs(self.dbDefaults) do
		self.db.profile[k] = v
	end
end

--local ItemInfo -- Is this code familiar? Hmm.... shhh
do
	if XLoot.compat then
		-- 2.0.0
		function XLoot:ItemInfo(num) -- itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, invTexture
			local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, invTexture = GetItemInfo(num)
			return itemName, itemLink, itemRarity, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, invTexture, itemLevel
		end
	else
		function XLoot:ItemInfo(num) -- itemName, itemString, itemQuality, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture
			return GetItemInfo(num)
		end
	end
end

local keytbl
local function IsSwift()
	if lua51 then
		if not keytbl then
			keytbl = {
				SHIFT = IsShiftKeyDown,
				ALT   = IsAltKeyDown,
				CTRL  = IsControlKeyDown,
			}
		end

		local autolootkey = getglobal('AUTO_LOOT_KEY')
		local modifdown = keytbl[autolootkey]() == 1
		local autoloot = getglobal('AUTO_LOOT_DEFAULT') == '1'

		-- If autoloot and the modifier isnt down, or if not autoloot
		-- and the modifier is down, then swift loot.
		return autoloot ~= modifdown
	else
		return IsShiftKeyDown()
	end
end

---------- Shift-Looting detection. Fear the monster 'if' hives -----------
---- Herbs/Containers ----
function XLoot:SPELLCAST_START(arg1, arg2)
	if IsSwift() and self.db.profile.swiftloot then
		for k, v in pairs({L["evHerbs"], L["evOpenNT"], L["evOpen"]}) do
			if arg1 == v then
				self.swiftlooting = true
				self:RegisterEvent("UI_ERROR_MESSAGE", "SwiftErrmsg")
				--self:Print("Container Caught & hooked")
			end
		end
	else self.swiftlooting = false end
end

function XLoot:SPELLCAST_FAILED()
	if self.swiftlooting then
		--self:Print("Spellcast_failed")
		self.swiftlooting = false
		self:UnregisterEvent("UI_ERROR_MESSAGE")
	end
end

function XLoot:SPELLCAST_INTERRUPTED()
	if self.swiftlooting then
	--self:Print("Spellcast_interrupted")
		self.swiftlooting = false
		self:UnregisterEvent("UI_ERROR_MESSAGE")
	end
end

---- Corpses ----
function XLoot:SwiftMouseHooks(state) 
	if state and not self:IsHooked(WorldFrame, "OnMouseUp") then
		self:HookScript(WorldFrame, "OnMouseUp", "SwiftMouseUpDeuce")
	elseif self:IsHooked(WorldFrame, "OnMouseUp") then
		self:Unhook(WorldFrame, "OnMouseUp")
	end
end

function XLoot:SwiftMouseDeuce(state) 
	--self:Print("SwiftMouseDeuce("..tostring(state)..")")
	if state and not self:IsHooked(WorldFrame, "OnMouseUp") then
		self:HookScript(WorldFrame, "OnMouseUp", "SwiftMouseUpDeuce")
	elseif self:IsHooked(WorldFrame, "OnMouseUp") then
		self:Unhook(WorldFrame, "OnMouseUp")
	end
end

function XLoot:SwiftMouseUpDeuce(button)
	--self:Print("SwiftMouseUpDeuce")
	if UnitIsDead("target")  then
		if UnitIsUnit("mouseover", "target") then
			if not UnitIsPlayer("target") then
				if CheckInteractDistance("target", 1) then
					self:SwiftMouseUp()
				end
			end
		end
	end
end

function XLoot:SwiftMouseEvents(state) 
	if state and not self:IsEventRegistered("UPDATE_MOUSEOVER_UNIT") then
		self:RegisterEvent("PLAYER_TARGET_CHANGED", "SwiftTargetChange")
		self:RegisterEvent("UPDATE_MOUSEOVER_UNIT", "SwiftMouseover")
		self:RegisterEvent("SPELLCAST_START")
		self:RegisterEvent("SPELLCAST_FAILED")
		self:RegisterEvent("SPELLCAST_INTERRUPTED")
	elseif not state and self:IsEventRegistered("UPDATE_MOUSEOVER_UNIT") then
		self:UnregisterEvent("PLAYER_TARGET_CHANGED")
		self:UnregisterEvent("UPDATE_MOUSEOVER_UNIT")
		self:UnregisterEvent("SPELLCAST_START")
		self:UnregisterEvent("SPELLCAST_FAILED")
		self:UnregisterEvent("SPELLCAST_INTERRUPTED")
	end
end

function XLoot:SwiftErrmsg(message)
	if message == ERR_INV_FULL then 
		self:SwiftHooks(false)
		self.swiftlooting = false
		self:Update()
	end		
end

function XLoot:SwiftMouseover()
	if not self.swiftlooting then
		if UnitIsDead("target")  then 
			if UnitIsUnit("mouseover", "target") then
				if not UnitIsPlayer("target") then
					if CheckInteractDistance("target", 1) then
						if not self.swifthooked then 
							self:SwiftHooks(true)
						end
					end
				end
			end
		end
	end
end

function XLoot:SwiftHooks(state)
	if state then
		--self:Print("Hooking for swiftloot...")
		self:RegisterEvent("UI_ERROR_MESSAGE", "SwiftErrmsg")
		self:HookScript(WorldFrame, "OnMouseUp", "SwiftMouseUp")
		self.swifthooked = true
	else
		--self:Print("Releasing swiftloot hooks...")
		self:UnregisterEvent("UI_ERROR_MESSAGE")
		if self:IsHooked(WorldFrame, "OnMouseUp") then
			self:Unhook(WorldFrame, "OnMouseUp")
		end
		self.swifthooked = false
	end
end

function XLoot:SwiftTargetChange(lastevent)
	if self.swifthooked then
		if not UnitIsUnit("mouseover", "target") then
			self:SwiftHooks(false)
			self.swiftlooting = false
		end
	end
	if not lastevent then
		if UnitIsDead("target") then
			if not UnitIsPlayer("target") then
				if CheckInteractDistance("target", 1) then
					self:SwiftMouseUp()
				end
			end
		end
	end
end

function XLoot:SwiftMouseUp()
	if IsSwift() then
		--self:Print("Swiftlooting...")
		if not self.swifthooked then
			self:RegisterEvent("UI_ERROR_MESSAGE", "SwiftErrmsg")
		end
		self.swiftlooting = true
	else
		self.swiftlooting = false
	end
end

---- Operational functions/hooks ----
function XLoot:CloseWindows(ignoreCenter) 
	local hookedresult = self.hooks.CloseWindows(ignoreCenter)
	if self.frame:IsShown() then 
		self:AutoClose(true)
		return true
	end
	return 	hookedresult
end

function XLoot:OnOpen()
end

function XLoot:OnClear()
	self.refreshing = true
	self:Clear()
	self:Update()
end

function XLoot:OnClose()
	self:Clear()
	self.swiftlooting = false
end

function XLoot:OnHide()
	if not self.refreshing then
		self:AutoClose(true)
	else 
		self.refreshing = false
	end
end

function XLoot:ClickCheck(button)
	if IsAltKeyDown() and button == "RightButton" and self.db.profile.altoptions and not IsShiftKeyDown() and not IsControlKeyDown() then
		self:OpenMenu(XLootFrame)
		return 1
	end
end

function XLoot:OnClick(button)
	if not self:ClickCheck(button) then
		self.hooks.LootFrameItem_OnClick(button)
	end
end

function XLoot:OnButtonClick(button)
	if not self:ClickCheck(button) then
		self.hooks.LootButton_OnClick(button)
	end
end

function XLoot:OnModifiedButtonClick(button)
	if not self:ClickCheck(button) then
		self.hooks.LootButton_OnModifiedClick(button)
	end
end

function XLoot:LootFrame_OnEvent(event)
	if event ~= "LOOT_SLOT_CLEARED" then
		self.hooks.LootFrame_OnEvent(event)
	end
	if event == "LOOT_OPENED" then
		HideUIPanel(LootFrame);
	end
end

-- Show our frame and hide the old one
function XLoot:LootFrame_OnShow()
	self:msg("LootFrame_OnShow()")
	--self.hooks.LootFrame_OnShow()
	if self:AutoClose() == nil then
		if not self.visible and IsFishingLoot() then
			PlaySound("FISHING REEL IN")
		end
		self:Clear()
		self:Update()
	end
end

-- Block closing loot
function XLoot:LootFrame_OnHide()
end

-- Update our lootframe
function XLoot:LootFrame_Update()
	--XLoot.hooks.LootFrame_Update()
	if not self:AutoClose() then
		self:Update()
	end
end

function XLoot:AutoClose(force) -- Thanks, FruityLoots.
	if (GetNumLootItems() == 0) or force then 
		self:Clear()
		HideUIPanel(LootFrame)
		CloseLoot()
		self:msg("AutoClosing ("..GetNumLootItems() ..")"..(force and " Forced!" or ""))
		self.swiftlooting = false
		return 1
	end
	self:msg("AutoClose check passed")
	return nil
end

---- Core ----
function XLoot:Update()
	if self.swiftlooting then 
		self:msg("Overriding update, swiftlooting")
		return
	end
	local db = self.db.profile
	self.currentloot = nilTable(self.currentloot)
	local numLoot = GetNumLootItems()
	--Build frames if we need more
	if (numLoot > self.numButtons) then
		for i = (self.numButtons + 1), numLoot do
			self:msg("Adding needed frame["..(i).."], numButtons = "..XLoot.numButtons.." & numLoot = "..numLoot)
			self:AddLootFrame(i)
		end
	end
	-- LootLoop
	local curslot, button, frame, texture, item, quantity, quality, color, qualitytext, textobj, infoobj, qualityobj
	local curshift, qualityTower, framewidth  = 0, 0, 0
	for slot = 1, numLoot do
		texture, item, quantity, quality = GetLootSlotInfo(slot)
		if (texture) then
			curshift = curshift +1
			-- If we're shifting loot, use position slots instead of item slots
			if db.collapse then
				button = self.buttons[curshift]
				frame = self.frames[curshift]
				curslot = curshift
			else
				button = self.buttons[slot]
				frame = self.frames[slot]
				curslot = slot
			end
			-- Update slot ID's for WoW's sanity
			if not self.compat then
				button:SetSlot(slot)
			end
			button:SetID(slot)
			button.slot = slot
			self:msg("Attaching loot["..slot.."] ["..item.."] to slot ["..curslot.."], bSlot = "..button.slot);
			color = ITEM_QUALITY_COLORS[quality]
			qualityTower = max(qualityTower, quality)
			SetItemButtonTexture(button, texture)
			textobj = _G["XLootButton"..curslot.."Text"]
			infoobj = _G["XLootButton"..curslot.."Description"]
			qualityobj = _G["XLootButton"..curslot.."Quality"]
			infoobj:SetText("")
			infoobj:SetVertexColor(unpack(db.infocolor))
			qualityobj:SetText("")
			if LootSlotIsCoin(slot) then -- Fix and performance fix thanks to Dead_LAN
				item = string.gsub(item, "\n", " ", 1, true);
			end
			
			table.insert(self.currentloot, { texture = texture, item = item, quantity = quantity, quality = quality, link = GetLootSlotLink(slot) })
			
			if db.lootexpand then
				textobj:SetWidth(700)
				infoobj:SetWidth(700)
			else
				textobj:SetWidth(155)
				infoobj:SetWidth(155)
			end
			textobj:SetVertexColor(color.r, color.g, color.b);
			textobj:SetText(item);
			
			if db.qualitytext and not LootSlotIsCoin(slot) then 
				qualityobj:SetText(_G["ITEM_QUALITY"..quality.."_DESC"])
				qualityobj:SetVertexColor(.8, .8, .8, 1);
				textobj:SetPoint("TOPLEFT", button, "TOPLEFT", 42, -12)
				infoobj:SetPoint("TOPLEFT", button, "TOPLEFT", 45, -22)
				textobj:SetHeight(10)
			elseif LootSlotIsCoin(slot) then
				textobj:SetPoint("TOPLEFT", button, "TOPLEFT", 42, 2)
				qualityobj:SetText("")
				textobj:SetHeight(XLootButton1:GetHeight()+1)
			else
				qualityobj:SetText("")
				if db.infotext then
					textobj:SetPoint("TOPLEFT", button, "TOPLEFT", 42, -8)
				else
					textobj:SetPoint("TOPLEFT", button, "TOPLEFT", 42, -12)
					infoobj:SetText("")
				end
				infoobj:SetPoint("TOPLEFT", button, "TOPLEFT", 45, -18)
				textobj:SetHeight(10)
			end
			
			if db.lootqualityborder then
				frame:SetBackdropBorderColor(color.r, color.g, color.b, 1)
				button.wrapper:SetBackdropBorderColor(color.r, color.g, color.b, 1)
			else
				frame:SetBackdropBorderColor(unpack(db.lootbordercolor))
				button.wrapper:SetBackdropBorderColor(unpack(db.lootbordercolor))
			end
			
			if LootSlotIsItem(slot) and quality >= db.loothighlightthreshold then
				local r, g, b, hex = GetItemQualityColor(quality)
				if db.texcolor then
					button.border:SetVertexColor(r, g, b)
					button.border:Show()
				else button.border:Hide() end
				if db.loothighlightframe then
					frame.border:SetVertexColor(r, g, b)
					frame.border:Show()
				else frame.border:Hide() end
			else
				button.border:Hide()
				frame.border:Hide()
			end
			
			if LootSlotIsItem(slot) and db.infotext then
				self:SetSlotInfo(slot, button)
			end
			
			if db.lootexpand then 
				framewidth = max(framewidth, textobj:GetStringWidth(), infoobj:GetStringWidth())
			end
			
			SetItemButtonCount(button, quantity)
			button.quality = quality
			button:Show()
			frame:Show()
			
		elseif not db.collapse then
			curshift = curshift + 1
			self.buttons[slot]:Hide()
			self:msg("Hiding slot "..slot..", curshift: "..curshift)
		end
	end
	
	if slot == curshift then --Collapse lower buttons
		curshift = curshift -1
		self:msg("Collapsing end slot "..slot..", curshift now "..curshift)
	end
	
	XLootFrame:SetScale(db.scale)
	local color = ITEM_QUALITY_COLORS[qualityTower]
	if db.qualityborder and not self.visible then 
		self:msg("Quality tower: "..qualityTower)
		self.frame:SetBackdropBorderColor(color.r, color.g, color.b, 1)
	else
		 self.frame:SetBackdropBorderColor(unpack(db.bordercolor))
	end
	if db.qualityframe and not self.visible then
		self.frame:SetBackdropColor(color.r, color.g, color.b, db.bgcolor[4])
	else
		self.frame:SetBackdropColor(unpack(db.bgcolor))
	end
		
	XLootFrame:SetHeight(20 + (curshift*(XLootButtonFrame1:GetHeight()+2)))
	
	if db.lootexpand then
		self.loothasbeenexpanded = true
		local fwidth, bwidth = (self.buttons[1]:GetWidth() + framewidth + 21), -(framewidth + 16)
		self:UpdateWidths(curshift, fwidth, bwidth, fwidth+24)
	else --if self.loothasbeenexpanded then
		self.loothasbeenexpanded = false
		self:UpdateWidths(table.getn(self.frames), 200, -163, 222)
	end
	
	
	if (db.collapse and db.cursor) or (not self.visible and db.cursor) then -- FruityLoot
		self:PositionAtCursor()
	end
	
	self.frame:Show()
	if db.linkallvis == "always" or (db.linkallvis == "raid" and GetNumRaidMembers() > 0) or (db.linkallvis == "party" and GetNumPartyMembers() > 0) then
		self.linkbutton:Show()
	else
		self.linkbutton:Hide()
	end
	self:msg("Displaying at position: "..XLootFrame:GetLeft().." "..XLootFrame:GetTop());
	self.visible = true
	
	--Hopefully avoid non-looting/empty bar
	if self:AutoClose() then
		self:msg("Possible hanger frame. Closing.. "..numLoot..", "..curshift)
	end
end

 function XLoot:UpdateWidths(framenum, fwidth, bwidth, ofwidth)
 	local expand = self.db.profile.lootexpand
	for i = 1, framenum do
		self.frames[i]:SetWidth(fwidth)
		self.buttons[i]:SetHitRectInsets(0, bwidth, 0, -1)
		self:QualityBorderResize(self.frames[i])
	end
	self.frame:SetWidth(ofwidth)
end 

function XLoot:SetSlotInfo(slot, button) -- Yay wowwiki demo
	local link =  GetLootSlotLink(slot)
	local itemName, itemLink, itemRarity, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc = self:ItemInfo(self:LinkToID(link))
	if itemType == "Weapon" then
		itemEquipLoc = "Weapon"
	else
		itemEquipLoc = _G[itemEquipLoc]
	end
	if itemSubType == "Junk" then 
		itemSubType = (itemRarity > 0) and L["qualityQuest"] or itemSubType
	end
	_G[button:GetName().."Description"]:SetText((itemEquipLoc and itemEquipLoc..", " or "") .. ((itemSubType == itemSubType) and itemSubType or itemSubType.." "..itemType))
end

function XLoot:PositionAtCursor() --Fruityloots mixup, only called if cursor snapping is enabled
	x, y = GetCursorPosition()
	local s = XLootFrame:GetEffectiveScale()
	x = (x / s) - 30
	y = (y / s) + 30
	local screenWidth = GetScreenWidth()
	if (UIParent:GetWidth() > screenWidth) then screenWidth = UIParent:GetWidth() end
	local screenHeight = GetScreenHeight()
	local windowWidth = XLootFrame:GetWidth()
	local windowHeight = XLootFrame:GetHeight()
	if (x + windowWidth) > screenWidth then x = screenWidth - windowWidth end
	if y > screenHeight then y = screenHeight end
	if x < 0 then x = 0 end
	if (y - windowHeight) < 0 then y = windowHeight end
	LootFrame:ClearAllPoints()
	if (self.db.profile.smartsnap and self.visible) then
		x = XLootFrame:GetLeft();
	else 
		x = x + self.db.profile.snapoffset
	end
	XLootFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y);
end

-- Add a single lootframe
function XLoot:AddLootFrame(id)
	local frame = CreateFrame("Frame", "XLootButtonFrame"..id, self.frame)
	local button = CreateFrame(LootButton1:GetObjectType(), "XLootButton"..id, frame, "LootButtonTemplate")
	-- Equivalent of XLootButtonTemplate
	local buttontext = _G["XLootButton"..id.."Text"]
	local buttondesc = button:CreateFontString("XLootButton"..id.."Description", "ARTWORK", "GameFontNormalSmall")
	local buttonquality = button:CreateFontString("XLootButton"..id.."Quality", "GameFontNormalSmall")
	local font = {buttontext:GetFont()}
	font[2] = 10
	buttontext:SetDrawLayer("OVERLAY")
	buttondesc:SetDrawLayer("OVERLAY")
	buttonquality:SetDrawLayer("OVERLAY")
	buttondesc:SetFont(unpack(font))
	buttonquality:SetFont(unpack(font))
	buttondesc:SetJustifyH("LEFT")
	buttonquality:SetJustifyH("LEFT")
	buttondesc:SetHeight(10)	
	buttonquality:SetWidth(155)
	buttonquality:SetHeight(10)
	buttontext:SetHeight(10)
	buttonquality:SetPoint("TOPLEFT", button, "TOPLEFT", 45, -3)
	button:SetHitRectInsets(0, -165, 0, -1)
	-- End template
	local border = self:QualityBorder(button)
	local fborder = self:QualityBorder(frame)
	button.wrapper = self:ItemButtonWrapper(button, 6, 6)
	fborder:SetHeight(fborder:GetHeight() -3)
	fborder:SetPoint("CENTER", frame, "CENTER", 4, .5)
	fborder:SetAlpha(0.3)
	frame:SetWidth(200)
	frame:SetHeight(button:GetHeight()+1)
	button:ClearAllPoints()
	frame:ClearAllPoints()
	if (id == 1) then 
		frame:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 10, -10)
	else
		frame:SetPoint("TOPLEFT", self.frames[id-1], "BOTTOMLEFT", 0, -2)
	end
	button:SetPoint("LEFT", frame, "LEFT")
	button:RegisterForDrag("LeftButton")
	button:SetScript("OnDragStart", function() self:DragStart() end)
	button:SetScript("OnDragStop", function() self:DragStop() end)
	button:SetScript("OnEnter", 	function() local slot = this:GetID(); if ( LootSlotIsItem(slot) ) then	 GameTooltip:SetOwner(this, "ANCHOR_RIGHT"); GameTooltip:SetLootItem(slot); CursorUpdate(); end end )
	self.buttons[id] = button
	self.buttons[id].border = border
	self.frames[id] = frame
	self.frames[id].border = fborder
	self:msg("Creation: self.buttons["..id.."] = ".. button:GetName())
	self.frame:SetHeight(self.frame:GetHeight() + frame:GetHeight())

	--Skin
	--self:Skin(button)
	self:Skin(frame)
	
	--frame:SetBackdropColor(unpack(self.db.profile.lootbgcolor))
	--frame:SetBackdropBorderColor(unpack(self.db.profile.lootbordercolor))
	button:DisableDrawLayer("ARTWORK")
	button:Hide()
	frame:Hide()
	self.numButtons = self.numButtons +1
end

function XLoot:DragStart() 
	if not self.db.profile.lock then 
		XLootFrame:StartMoving() 
	end
end

function XLoot:DragStop()
	if not self.db.profile.lock then 
		XLootFrame:StopMovingOrSizing()
		self.db.profile.pos.x = XLootFrame:GetLeft()
		self.db.profile.pos.y = XLootFrame:GetTop()
		XLoot:msg("Setting position: "..self.db.profile.pos.x.." "..self.db.profile.pos.y) 
	end
end 

-- Setup lootframes & close button
function XLoot:SetupFrames()
	-- Alright you XML nazis. Main frame
	self.frame = CreateFrame("Frame", "XLootFrame", UIParent)
	self.frame:SetFrameStrata("DIALOG")
	self.frame:SetFrameLevel(5)
	self.frame:SetWidth(222)
	self.frame:SetHeight(20)
	self.frame:SetMovable(1)
	if self.db.profile.dragborder then
		self.frame:EnableMouse(1)
	end
	self.frame:RegisterForDrag("LeftButton")
	self.frame:SetScript("OnDragStart", function() XLoot:DragStart() end)
	self.frame:SetScript("OnDragStop", function() XLoot:DragStop() end)
	self.frame:SetScript("OnHide", function() XLoot:OnHide() end)
	--self.frame:IsToplevel(1)
	self:BackdropFrame(self.frame, self.db.profile.bgcolor, self.db.profile.bordercolor)
   	self.frame:ClearAllPoints()
   	if not self.db.profile.cursor then
		self.frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", self.db.profile.pos.x, self.db.profile.pos.y)
	end

	--Skin
	self:Skin(XLootFrame)
   
   self.frame:SetScale(self.db.profile.scale)
    
   	-- Close button
	self.closebutton = CreateFrame("Button", "XLootCloseButton", XLootFrame)
	self.closebutton:SetScript("OnClick", function() XLoot:AutoClose(true); end)
	self.closebutton:SetFrameLevel(8)
	self.closebutton:SetWidth(32)
	self.closebutton:SetHeight(32)
	self.closebutton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
	self.closebutton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
	self.closebutton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	self.closebutton:ClearAllPoints()
	self.closebutton:SetPoint("TOPRIGHT", XLootFrame, "TOPRIGHT", 3, 3)
	self.closebutton:SetHitRectInsets(5, 5, 5, 5)
	self.closebutton:Show()
	
   	-- Link all button
	self.linkbutton = CreateFrame("Button", "XLootLinkButton", XLootFrame)
	self.linkbutton:SetScript("OnClick", function() self:ClickLinkLoot() end)
	self.linkbutton.text = self.linkbutton:CreateFontString("XLootLinkButtonText", "DIALOG", "GameFontNormalSmall")
	self.linkbutton.text:SetText("|c22AAAAAA"..L["linkallloot"])
	self.linkbutton.text:SetAllPoints(self.linkbutton)
	self.linkbutton:SetFrameLevel(8)
	self.linkbutton:SetWidth(75)
	self.linkbutton:SetHeight(24)
	self.linkbutton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	self.linkbutton:ClearAllPoints()
	self.linkbutton:SetPoint("BOTTOMRIGHT", XLootFrame, "BOTTOMRIGHT", -4, -3)
	self.linkbutton:SetHitRectInsets(5, 5, 5, 5)
	self.linkbutton.text:Show()
	self.linkbutton:Show()
	self.dewdrop:Register(XLootLinkButton,
		'children', function(level, value)
				self:BuildChannelMenu(level, value, function(arg1,arg2) self:LinkLoot(arg1,arg2) end)
			end,
		'cursorX', true,
		'cursorY', true
	)

	self:AddLootFrame(1)
	self.frame:Hide()
end	

function XLoot:msg( text )
	if self.db.profile.debug then 
		DEFAULT_CHAT_FRAME:AddMessage("|cff7fff7fXLoot|r: "..text);
	end
end

function XLoot:Clear()
	for slot, button in pairs(self.buttons) do
		SetItemButtonCount(button, 0)
		button:Hide()
		self.frames[slot]:Hide()
	end
	if GetNumLootItems() < 1 then
		self.visible = false
	end
	XLootFrame:Hide()
end

function XLoot:LinkToName(link)
	if not link then return nil end
	return string.gsub(link,"^.-%[(.*)%].*", "%1")
end

function XLoot:LinkToID(link)
	if not link then return nil end
	return string.gsub(link,".-\124H([^\124]*)\124h.*", "%1")
end

function XLoot:ClickLinkLoot()
	local channels = self.db.profile.linkallchannels
	local linked
	if channels then
		for k, v in pairs(channels) do 
			if v then
				linked = self:LinkLoot(k, v.extchannel)
			end
		end
	end
	if not linked then
		self.dewdrop:Open(XLootLinkButton,
			'children', function(level, value)
					self:BuildChannelMenu(level, value, function(arg1,arg2) self:LinkLoot(arg1,arg2) end)
				end,
			'cursorX', true,
			'cursorY', true
		)
	end
end

function XLoot:LinkLoot(channel, isExtraChannel)
	local output, key, buffer = { }, 1
	
	if UnitExists("target") then
		output[1] = UnitName("target")..":"
	end
	
	local linkthreshold, thresholdreached = self.db.profile.linkallthreshold, false
	for k, v in pairs(self.currentloot) do
		if v.quality >= linkthreshold then
			thresholdreached = true
			buffer = (output[key] and output[key].." " or "")..(v.quantity > 1 and v.quantity.."x" or "")..(v.quantity == 0 and v.item or v.link)
			if strlen(buffer) > 255 then 
				key = key + 1
				output[key] = (v.quantity > 1 and v.quantity.."x" or "")..v.link
			else
				output[key] = buffer
			end
		end
	end
	
	if not thresholdreached then
		return false
	end
	
	local chattype, channelout
	if isExtraChannel then 
		chattype = "CHANNEL"
		channelout = GetChannelName(channel)
	else
		chattype = channel
		channelout = nil
	end
	
	for k, v in pairs(output) do
		v  = string.gsub(v, "\n", " ", 1, true) -- DIE NEWLINES, DIE A HORRIBLE DEATH 
		SendChatMessage(v, chattype, nil, channelout)
	end
	
	return true
end

function XLoot:BuildChannelMenu(level, value, func)
	if level == 1 then
		self.dewdrop:AddLine(
			'text', "|cFF77BBFF"..CHANNELS,
			'isTitle', true)
			
		for k, v in pairs(ChannelMenuChatTypeGroups) do
			if v ~= "WHISPER" then
				self.dewdrop:AddLine(
					'text', _G["CHAT_MSG_"..v] or v,
					'arg1', v,
					'closeWhenClicked', true,
					'func', func)
				end
		end
		
		if GetNumRaidMembers() > 0 then
			self.dewdrop:AddLine(
				'text', CHAT_MSG_RAID,
				'arg1', 'RAID',
				'closeWhenClicked', true,
				'func', func)
			if IsRaidLeader() or IsRaidOfficer() then
				self.dewdrop:AddLine(
					'text', CHAT_MSG_RAID_WARNING,
					'arg1', 'RAID_WARNING',
					'closeWhenClicked', true,
					'func', func)
			end
		end
		
		self.dewdrop:AddLine()
		
		local channellist = {GetChannelList()}
		local number = nil
		for k, v in pairs(channellist) do
			if type(v) == "string" then
				local cnum, cname = GetChannelName(number)
				self.dewdrop:AddLine(
					'text', (cnum > 0 and cnum or number).." - "..cname,
					'arg1', cname,
					'arg2', true,
					'closeWhenClicked', true,
					'func', func)
			else
				number = v
			end
		end
		
		self.dewdrop:AddLine()
		self.dewdrop:FeedAceOptionsTable( {type = "group", args = { linkallthreshold = self.opts.args.behavior.args.linkallthreshold, linkallvis = self.opts.args.behavior.args.linkallvis, linkallchannels = self.opts.args.behavior.args.linkallchannels } } )
		self.dewdrop:AddLine(
			'text', "|cFFFF3311"..CLOSE,
			'icon', "Interface\\Glues\\Login\\Glues-CheckBox-Check",
			'closeWhenClicked', true)
	elseif level == 2 then
		if self.opts.args.behavior.args[value] then 
			self.dewdrop:FeedAceOptionsTable(self.opts.args.behavior.args[value], 1)
		end
	end
end

function XLoot:ClassHex(class, enclass)
	class = enclass or class
	if not self.classhexes[class] then
		local c = RAID_CLASS_COLORS[class]
		self.classhexes[class] = string.format("%2x%2x%2x", c.r*255, c.g*255, c.b*255)
	end
	return self.classhexes[class]
end

function XLoot:ParseCoinString(tstr)
	local tc
	local total = 0
	for k, v in pairs(self.coinage) do
		_, _, tc = string.find(tstr, "(%d+) "..v[1])
		if tc then
			total = total + (tc * v[2])
		end
	end
	return total
end

function XLoot:ParseMoney(total, short)
	local gold = floor(total / 10000)
	local silver = mod(floor(total / 100), 100)
	local copper = mod(total, 100)
	local coinage = {{GOLD, gold, "ffd700"}, {SILVER, silver, "c7c7cf"}, {COPPER, copper, "eda55f"}}
	local str, tstr = "", ""
	for k, v in pairs(coinage) do
		if v[2] and v[2] > 0 then
			if short then
				tstr = "|cFF"..v[3]..v[2] 
			else
				tstr = "|cFF"..v[3]..v[2].." "..v[1]
			end
			if str ~= "" then
				str = str..", "..tstr
			else
				str = tstr
			end
		end
	end
	nilTable(coinage)
	coinage = nil
	return str, gold, silver, copper
end
