local EZP = CreateFrame("Frame")
EZP.ConfigFrame = CreateFrame("Frame",nil,UIParent)
EZP.Parser = CreateFrame("GameTooltip", "EZPParser", nil, "GameTooltipTemplate")
EZP.ACE = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0")
EZP:RegisterEvent("ADDON_LOADED")
EZP:RegisterEvent("UNIT_INVENTORY_CHANGED")
EZP:RegisterEvent("BAG_UPDATE")

--fubar/mapicon
EZP.ACE.name = "EzPoison"
EZP.ACE.hasIcon = "Interface\\Icons\\Ability_Rogue_DualWeild"
EZP.ACE.defaultMinimapPosition = 200
EZP.ACE.cannotDetachTooltip = true

function EZP.ACE:OnClick()
	if (arg1 == "LeftButton") then
		if EZP.ConfigFrame:IsVisible() then EZP.ConfigFrame:Hide()
		else EZP:UpdateTexture(); EZP.ConfigFrame:Show() end
	end
end


-- pre-allocate work variables
EZP.Work = 	{
	slotInfo = {},
	ToolTipBuff = "",
	ID = {},
	Time = 0,
	iSCasting = nil,
	
	Poison = {
		[1] = "速效药膏",
		[2] = "致命药膏",
		[3] = "减速药膏",
		[4] = "减速药膏 II",
		[5] = "致密磨刀石",
		[6] = "元素磨刀石",
	},
	PoisonID = {
		[1] = {6947,6949,6950,8926,8927,8928},
		[2] = {2892,2893,8984,8985,20844},
		[3] = 3775,
		[4] = 3776,
		[5] = {12404,9186,},
		[6] = 18262,
	},
	PoisonIcon = {
		[1] = "Interface\\Icons\\Ability_Poisons",
		[2] = "Interface\\Icons\\Ability_Rogue_DualWeild",
		[3] = "Interface\\Icons\\Ability_PoisonSting",
		[4] = "Interface\\Icons\\INV_Potion_19",
		[5] = "Interface\\Icons\\inv_stone_sharpeningstone_05",
		[6] = "Interface\\Icons\\inv_stone_02",
	}
}

-- local functions
EZP.GetWeaponEnchantInfo = GetWeaponEnchantInfo

function EZP:OnEvent()
	if event == "BAG_UPDATE" then
		if arg1 == 0 or arg1 == 1 or arg1 == 2 or arg1 == 3 or arg1 == 4 then
			EZP:UpdatePoisonCount()
		end
		
	elseif event == "ADDON_LOADED" and arg1 == "EzPoison" then
		if not EZPcfg then
			EZPcfg = {
				Profile ={
					[1] = {MainHand = 0, OffHand = 0, Name = "方案 1"},
					[2] = {MainHand = 0, OffHand = 0, Name = "方案 2"},
					[3] = {MainHand = 0, OffHand = 0, Name = "方案 3"},
					[4] = {MainHand = 0, OffHand = 0, Name = "方案 4"},
					[5] = {MainHand = 0, OffHand = 0, Name = "方案 5"},
					[6] = {MainHand = 0, OffHand = 0, Name = "方案 6"},
					[7] = {MainHand = 0, OffHand = 0, Name = "方案 7"},
				},
				CurrentProfile = 1,
				PosX = 200,
				PosY = -200,
				Scale = 1,
			}
		end

		EZP.ConfigFrame:ConfigureUI()
		EZP:SetProfile()
		EZP:ConfigFubar()
		EZP.ConfigFrame:SetScript("OnUpdate",EZP.AddonStart)
	
	elseif event == "SPELLCAST_START" then
		EZP.Work.iSCasting = 1
	
	elseif event == "SPELLCAST_STOP" or event ==  "SPELLCAST_INTERRUPTED" or event == "SPELLCAST_FAILED" then
		EZP:UnregisterEvent("SPELLCAST_STOP")
		EZP:UnregisterEvent("SPELLCAST_START")
		EZP:UnregisterEvent("SPELLCAST_INTERRUPTED")
		EZP:UnregisterEvent("SPELLCAST_FAILED")
		EZP.Work.iSCasting = nil
		EZP:UpdateTexture()
		
	elseif event == "UNIT_INVENTORY_CHANGED" then
		EZP:UpdateTexture()
	end
end

EZP:SetScript("OnEvent", EZP.OnEvent)

function EZP.ConfigFrame:ConfigureUI()
	-- moving frames function
	function EZP.ConfigFrame:StartMove()
		this:StartMoving()
	end
	
	function EZP.ConfigFrame:StopMove()
		this:StopMovingOrSizing()
		_, _, _, EZPcfg.PosX, EZPcfg.PosY = EZP.ConfigFrame:GetPoint()
	end
	
	self:SetScale(EZPcfg.Scale)
	local backdrop = {bgFile = "Interface\\TutorialFrame\\TutorialFrameBackground", edgeFile="Interface\\Tooltips\\UI-Tooltip-Border", tile=true,tileSize = 16, edgeSize = 16, insets = { left = 3, right = 5, top = 3, bottom = 5 }}  -- path to the background texture
	self:SetBackdrop(backdrop)
	self:SetBackdropColor(0,0,0,0.8)
	self:SetWidth(82)
	self:SetHeight(48)
	self:SetPoint("TOPLEFT",EZPcfg.PosX,EZPcfg.PosY)
	self:SetMovable(1)
	self:EnableMouse(1)
	self:RegisterForDrag("LeftButton")
	self:SetScript("OnDragStart", EZP.ConfigFrame.StartMove)
	self:SetScript("OnDragStop", EZP.ConfigFrame.StopMove)
	
	self.ProfileButton = CreateFrame("Button",nil,self)
	self.ProfileButton:SetWidth(82)
	self.ProfileButton:SetHeight(12)
	self.ProfileButton:SetPoint("BOTTOM",self,"TOP",0,0)
	self.ProfileButton:SetScript("OnEnter", function() for j=1,7 do self.ProfileButton[j]:Show() end end)
	self.ProfileButton:SetScript("OnLeave", function() for j=1,7 do self.ProfileButton[j]:Hide() end end)
	
	for i=1,7 do
		if i == 1 then self.ProfileButton[i] = CreateFrame("Button", nil, self.ProfileButton); self.ProfileButton[i]:SetPoint("BOTTOM",self,"TOPLEFT", 11 , 0)
		else self.ProfileButton[i] = CreateFrame("Button", nil, self.ProfileButton[i-1]); self.ProfileButton[i]:SetPoint("LEFT",self.ProfileButton[i-1],"RIGHT", 3, 0) end
		self.ProfileButton[i]:SetID(i)
		self.ProfileButton[i]:SetWidth(7)
		self.ProfileButton[i]:SetHeight(7)
		self.ProfileButton[i]:SetScript("OnClick", function () 
			EZP:SetProfile(this:GetID())
		end)
		self.ProfileButton[i]:SetNormalTexture("Interface\\AddOns\\EzPoison\\Media\\buttonD")
		self.ProfileButton[i]:SetScript("OnEnter", function() for j=1,7 do self.ProfileButton[j]:Show() end end)
		self.ProfileButton[i]:SetScript("OnLeave", function() for j=1,7 do self.ProfileButton[j]:Hide() end end)
		self.ProfileButton[i]:Hide()
	end
	
	-- Mainhand
	local function MainHandDropDownFun()
		local info = {}
		info.text = "主手"
		info.isTitle = 1
		UIDropDownMenu_AddButton(info)
		info = {}
		for i=1,6 do
			info.text = EZP.Work.Poison[i]
			info.icon = EZP.Work.PoisonIcon[i]
			info.checked = false
			info.textR = 0.4; info.textG = 0.8; info.textB = 0.4
			info.isTitle = nil
			info.func = function()
				UIDropDownMenu_SetSelectedID(getglobal("EZPMainHandDD"), this:GetID(), 0)
				EZP:UpdateSelection()
				EZP:SaveProfiles()
			end
			UIDropDownMenu_AddButton(info)
		end
		info = {}
		info.text = "None"
		info.checked = false
		info.textR = 1; info.textG = 1; info.textB = 1
		info.isTitle = nil
		info.func = function()
			UIDropDownMenu_SetSelectedID(getglobal("EZPMainHandDD"), this:GetID(), 0)
			EZP:UpdateSelection()
			EZP:SaveProfiles()
		end
		UIDropDownMenu_AddButton(info)
	end
		
	self.MainHand = CreateFrame("Button", "EZPMHButton", self)
	self.MainHand.BorderDropdown = CreateFrame("Frame","EZPMainHandDD", self, "UIDropDownMenuTemplate")
	UIDropDownMenu_Initialize(getglobal("EZPMainHandDD"), MainHandDropDownFun,"MENU")
	
	self.MainHand:SetWidth(32)
	self.MainHand:SetHeight(32)
	self.MainHand:SetPoint("LEFT",7,0)
	self.MainHand:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	self.MainHand:SetScript("OnClick", function () 
		if arg1 == "LeftButton" then EZP:ApplyPoisen("MH") end
		if arg1 == "RightButton" then ToggleDropDownMenu(1, nil, self.MainHand.BorderDropdown, self.OffHand, 0, 0) end
	end)
	self.MainHand:SetScript("OnEnter", function ()
		self.MainHand.Background:SetVertexColor(1, 1, 1, 1)
		local id = EZP:GetInventoryID("MH")
		if id then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")	
			GameTooltip:SetHyperlink("item:"..id[4])
			GameTooltip:Show()
		end
	end)
	self.MainHand:SetScript("OnLeave", function ()
		self.MainHand.Background:SetVertexColor(1, 1, 1, 0)
		GameTooltip:Hide()
	end)
	self.MainHand:SetNormalTexture("Interface\\Buttons\\UI-Quickslot-Depress")
	
	self.MainHand.Background = self:CreateTexture(self,"BACKGROUND")
	self.MainHand.Background:SetPoint("CENTER",self.MainHand,"CENTER",0,0)
	self.MainHand.Background:SetWidth(36)
	self.MainHand.Background:SetHeight(36)
	self.MainHand.Background:SetTexture("Interface\\Buttons\\CheckButtonHilight")
	self.MainHand.Background:SetVertexColor(1, 1, 1, 0)
	self.MainHand.Background:SetBlendMode("ADD")
	
	self.MainHand.Font = self.MainHand:CreateFontString(nil, "OVERLAY")
    self.MainHand.Font:SetPoint("BOTTOMRIGHT", -3, 3)
    self.MainHand.Font:SetFont("Fonts\\ARIALN.TTF", 10, "OUTLINE")
	self.MainHand.Font:SetTextColor(0.8,0.8,0.8)
    --self.MainHand.Font:SetText("999")

	-- OffHand
	local function OffHandDropDownFun()
		local info = {}
		info.text = "副手"
		info.isTitle = 1
		UIDropDownMenu_AddButton(info)
		info = {}
		for i=1,6 do
			info.text = EZP.Work.Poison[i]
			info.checked = false
			info.icon = EZP.Work.PoisonIcon[i]
			info.textR = 0.4; info.textG = 0.8; info.textB = 0.4
			info.isTitle = nil
			info.func = function()
				UIDropDownMenu_SetSelectedID(getglobal("EZPOffHandDD"), this:GetID(), 0)
				EZP:UpdateSelection()
				EZP:SaveProfiles()
			end
			UIDropDownMenu_AddButton(info)
		end
		info = {}
		info.text = "None"
		info.checked = false
		info.textR = 1; info.textG = 1; info.textB = 1
		info.isTitle = nil
		info.func = function()
			UIDropDownMenu_SetSelectedID(getglobal("EZPOffHandDD"), this:GetID(), 0)
			EZP:UpdateSelection()
			EZP:SaveProfiles()
		end
		UIDropDownMenu_AddButton(info)
	end
	
	self.OffHand = CreateFrame("Button", nil, self)
	self.OffHand.BorderDropdown = CreateFrame("Frame","EZPOffHandDD", self, "UIDropDownMenuTemplate")
	UIDropDownMenu_Initialize(getglobal("EZPOffHandDD"), OffHandDropDownFun,"MENU")
	
	self.OffHand:SetWidth(32)
	self.OffHand:SetHeight(32)
	self.OffHand:SetPoint("RIGHT",-7,0)
	self.OffHand:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	self.OffHand:SetScript("OnClick", function () 
		if arg1 == "LeftButton" then EZP:ApplyPoisen("OH") end
		if arg1 == "RightButton" then ToggleDropDownMenu(1, nil, self.OffHand.BorderDropdown, self.OffHand, 0, 0) end
		
	end)
	self.OffHand:SetScript("OnEnter", function ()
		self.OffHand.Background:SetVertexColor(1, 1, 1, 1)
		local id = EZP:GetInventoryID("OH")
		if id then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:SetHyperlink("item:"..id[4])
			GameTooltip:Show()
		end
	end)
	self.OffHand:SetScript("OnLeave", function ()
		self.OffHand.Background:SetVertexColor(1, 1, 1, 0)
		GameTooltip:Hide()
	end)
	self.OffHand:SetNormalTexture("Interface\\Buttons\\UI-Quickslot-Depress")
	
	self.OffHand.Background = self:CreateTexture(self,"BACKGROUND")
	self.OffHand.Background:SetPoint("CENTER",self.OffHand,"CENTER",0,0)
	self.OffHand.Background:SetWidth(36)
	self.OffHand.Background:SetHeight(36)
	self.OffHand.Background:SetTexture("Interface\\Buttons\\CheckButtonHilight")
	self.OffHand.Background:SetVertexColor(1, 1, 1, 0)
	self.OffHand.Background:SetBlendMode("ADD")
	
	self.OffHand.Font = self.OffHand:CreateFontString(nil, "OVERLAY")
    self.OffHand.Font:SetPoint("BOTTOMRIGHT", -3, 3)
    self.OffHand.Font:SetFont("Fonts\\ARIALN.TTF", 10, "OUTLINE")
	self.OffHand.Font:SetTextColor(0.8,0.8,0.8)
    --self.OffHand.Font:SetText("999")
	
	self:SetScript("OnShow",function() EZPcfg.isVisible = 1 end)
	self:SetScript("OnHide",function() EZPcfg.isVisible = nil end)
	
	if not EZPcfg.isVisible then EZP.ConfigFrame:Hide() end
end

-- workarround for the fact that temp. enchants are not loaded at the addon start
function EZP:AddonStart()
	EZP.Work.Time = EZP.Work.Time + arg1
	if EZP.Work.Time >= 2 then
		EZP.Work.Time = 0
		EZP.ConfigFrame:SetScript("OnUpdate",nil)
		EZP:UpdateTexture()
	end
end

function EZP:ConfigFubar()
	local options = {
		handler = EZP.ACE,
		type = "group",
		args = {
			Profile1 = {
				name = EZPcfg.Profile[1].Name,
				type = "group",
				desc = "Profile 1 modification.",
				order = 1,
				args = {
					Profiletoggle = {
					type = 'toggle',
					name = "启用",
					desc = "Enable this profile.",
					get = function () end,
					set = function () EZP:SetProfile(1) end,
					order = 1,
					},
					Profileuse = {
						type = 'text',
						name = "重命名",
						desc = "Rename this Profile",
						get = function () end,
						set = function (value)
							if not value or value == "" then value = "Profile 1" end
							EZPcfg.Profile[1].Name = value
							DEFAULT_CHAT_FRAME:AddMessage("EzPoison: ".."|cFFFFFFFF".."Profile 1 renamed to: ".."|cFFCC9900"..EZPcfg.Profile[1].Name.."|r".."|cFFFFFFFF"..".".."|r",0.4,0.8,0.4)
						end,
						usage = "Renaming",
						order = 2,
					},
				},
			},
			Profile2 = {
				name = EZPcfg.Profile[2].Name,
				type = "group",
				desc = "Profile 2 modification.",
				order = 2,
				args = {
					Profiletoggle = {
					type = 'toggle',
					name = "启用",
					desc = "Enable this profile.",
					get = function () end,
					set = function () EZP:SetProfile(2) end,
					order = 1,
					},
					Profileuse = {
						type = 'text',
						name = "重命名",
						desc = "Rename this Profile",
						get = function () end,
						set = function (value)
							if not value or value == "" then value = "Profile 2" end
							EZPcfg.Profile[2].Name = value
							DEFAULT_CHAT_FRAME:AddMessage("EzPoison: ".."|cFFFFFFFF".."Profile 2 renamed to: ".."|cFFCC9900"..EZPcfg.Profile[2].Name.."|r".."|cFFFFFFFF"..".".."|r",0.4,0.8,0.4)
						end,
						usage = "Renaming",
						order = 2,
					},
				},
			},
			Profile3 = {
				name = EZPcfg.Profile[3].Name,
				type = "group",
				desc = "Profile 3 modification.",
				order = 3,
				args = {
					Profiletoggle = {
					type = 'toggle',
					name = "启用",
					desc = "Enable this profile.",
					get = function () end,
					set = function () EZP:SetProfile(3) end,
					order = 1,
					},
					Profileuse = {
						type = 'text',
						name = "重命名",
						desc = "Rename this Profile",
						get = function () end,
						set = function (value)
							if not value or value == "" then value = "Profile 3" end
							EZPcfg.Profile[3].Name = value
							DEFAULT_CHAT_FRAME:AddMessage("EzPoison: ".."|cFFFFFFFF".."Profile 3 renamed to: ".."|cFFCC9900"..EZPcfg.Profile[3].Name.."|r".."|cFFFFFFFF"..".".."|r",0.4,0.8,0.4)
						end,
						usage = "Renaming",
						order = 2,
					},
				},
			},
			Profile4 = {
				name = EZPcfg.Profile[4].Name,
				type = "group",
				desc = "Profile 4 modification.",
				order = 4,
				args = {
					Profiletoggle = {
					type = 'toggle',
					name = "启用",
					desc = "Enable this profile.",
					get = function () end,
					set = function () EZP:SetProfile(4) end,
					order = 1,
					},
					Profileuse = {
						type = 'text',
						name = "重命名",
						desc = "Rename this Profile",
						get = function () end,
						set = function (value)
							if not value or value == "" then value = "Profile 4" end
							EZPcfg.Profile[4].Name = value
							DEFAULT_CHAT_FRAME:AddMessage("EzPoison: ".."|cFFFFFFFF".."Profile 4 renamed to: ".."|cFFCC9900"..EZPcfg.Profile[4].Name.."|r".."|cFFFFFFFF"..".".."|r",0.4,0.8,0.4)
						end,
						usage = "Renaming",
						order = 2,
					},
				},
			},
			Profile5 = {
				name = EZPcfg.Profile[5].Name,
				type = "group",
				desc = "Profile 5 modification.",
				order = 5,
				args = {
					Profiletoggle = {
					type = 'toggle',
					name = "启用",
					desc = "Enable this profile.",
					get = function () end,
					set = function () EZP:SetProfile(5) end,
					order = 1,
					},
					Profileuse = {
						type = 'text',
						name = "重命名",
						desc = "Rename this Profile",
						get = function () end,
						set = function (value)
							if not value or value == "" then value = "Profile 5" end
							EZPcfg.Profile[5].Name = value
							DEFAULT_CHAT_FRAME:AddMessage("EzPoison: ".."|cFFFFFFFF".."Profile 5 renamed to: ".."|cFFCC9900"..EZPcfg.Profile[5].Name.."|r".."|cFFFFFFFF"..".".."|r",0.4,0.8,0.4)
						end,
						usage = "Renaming",
						order = 2,
					},
				},
			},
			Profile6 = {
				name = EZPcfg.Profile[6].Name,
				type = "group",
				desc = "Profile 6 modification.",
				order = 6,
				args = {
					Profiletoggle = {
					type = 'toggle',
					name = "启用",
					desc = "Enable this profile.",
					get = function () end,
					set = function () EZP:SetProfile(6) end,
					order = 1,
					},
					Profileuse = {
						type = 'text',
						name = "重命名",
						desc = "Rename this Profile",
						get = function () end,
						set = function (value)
							if not value or value == "" then value = "Profile 6" end
							EZPcfg.Profile[6].Name = value
							DEFAULT_CHAT_FRAME:AddMessage("EzPoison: ".."|cFFFFFFFF".."Profile 6 renamed to: ".."|cFFCC9900"..EZPcfg.Profile[6].Name.."|r".."|cFFFFFFFF"..".".."|r",0.4,0.8,0.4)
						end,
						usage = "Renaming",
						order = 2,
					},
				},
			},
			Profile7 = {
				name = EZPcfg.Profile[7].Name,
				type = "group",
				desc = "Profile 7 modification.",
				order = 7,
				args = {
					Profiletoggle = {
					type = 'toggle',
					name = "启用",
					desc = "Enable this profile.",
					get = function () end,
					set = function () EZP:SetProfile(7) end,
					order = 1,
					},
					Profileuse = {
						type = 'text',
						name = "重命名",
						desc = "Rename this Profile",
						get = function () end,
						set = function (value)
							if not value or value == "" then value = "Profile 7" end
							EZPcfg.Profile[7].Name = value
							DEFAULT_CHAT_FRAME:AddMessage("EzPoison: ".."|cFFFFFFFF".."Profile 7 renamed to: ".."|cFFCC9900"..EZPcfg.Profile[7].Name.."|r".."|cFFFFFFFF"..".".."|r",0.4,0.8,0.4)
						end,
						usage = "Renaming",
						order = 2,
					},
				},
			},
			scaling = {
				type = "range",
				name = "Window Scale",
				desc = "Window Scale of the UI.",
				min = 0.5,
				max = 2,
				step = 0.1,
				get = function()
					return EZPcfg.Scale
				end,
				set = function(value)
					EZPcfg.Scale  = value
				end,
				order = 8,
			},
			apply = {
				type = 'toggle',
				name = "重置",
				desc = "Apply the chosen window scale.",
				get = function () end,
				set = function () 
					EZP.ConfigFrame:SetScale(EZPcfg.Scale)
					EZPcfg.PosX = 200
					EZPcfg.PosY = -200
					EZP.ConfigFrame:SetPoint("TOPLEFT",EZPcfg.PosX,EZPcfg.PosY) 
				end,
				order = 9,
			},
		},
	}
	EZP.ACE.OnMenuRequest = options
end

function EZP:UpdateTexture()
	EZP.Work.slotInfo[1],EZP.Work.slotInfo[2],EZP.Work.slotInfo[3],EZP.Work.slotInfo[4],EZP.Work.slotInfo[5],EZP.Work.slotInfo[6] = EZP.GetWeaponEnchantInfo()
	
	if EZP.Work.slotInfo[1] then
		EZP.Work.ID = UIDropDownMenu_GetSelectedID(EZP.ConfigFrame.MainHand.BorderDropdown)-1
		for i=1,20 do
			EZP.Parser:SetOwner(UIParent, "ANCHOR_NONE")
			EZP.Work.ToolTipBuff = EZP.Parser:SetInventoryItem("player", 16)
			if not EZP.Work.ToolTipBuff or not getglobal(EZP.Parser:GetName().."TextLeft"..i):GetText() or EZP.Work.ID > 6 or EZP.Work.ID < 1 then EZP.Parser:Hide(); EZP.ConfigFrame.MainHand:SetAlpha(0.2) break end
			if string.find(gsub(string.lower(getglobal(EZP.Parser:GetName().."TextLeft"..i):GetText()),"-",""),gsub(string.lower(EZP.Work.Poison[EZP.Work.ID]),"-","")) then
				EZP.ConfigFrame.MainHand:SetAlpha(1)
				break
			end
		end
	else
		EZP.ConfigFrame.MainHand:SetAlpha(0.2)
	end
	
	if EZP.Work.slotInfo[4] then
		EZP.Work.ID = UIDropDownMenu_GetSelectedID(EZP.ConfigFrame.OffHand.BorderDropdown)-1
		for i=1,20 do
			EZP.Parser:SetOwner(UIParent, "ANCHOR_NONE")
			EZP.Work.ToolTipBuff = EZP.Parser:SetInventoryItem("player", 17)
			if not EZP.Work.ToolTipBuff or not getglobal(EZP.Parser:GetName().."TextLeft"..i):GetText() or EZP.Work.ID > 6 or EZP.Work.ID < 1 then EZP.Parser:Hide(); EZP.ConfigFrame.OffHand:SetAlpha(0.2) break end
			if string.find(gsub(string.lower(getglobal(EZP.Parser:GetName().."TextLeft"..i):GetText()),"-",""),gsub(string.lower(EZP.Work.Poison[EZP.Work.ID]),"-","")) then
				EZP.ConfigFrame.OffHand:SetAlpha(1)
				break
			end
		end
	else
		EZP.ConfigFrame.OffHand:SetAlpha(0.2)
	end
	
	EZP:UpdatePoisonCount()
end

function EZP:UpdatePoisonCount()
	-- MainHand
	local countPoison = 0
	local count = 0
	local id = EZP:GetInventoryID("MH")
	if id then
		local poisonName = gsub(string.lower(EZP.Work.Poison[id[5]]..id[3]),"-","")
		for i=0,4 do 
			for j=1,18 do
				if GetContainerItemInfo(i, j) then
					--if string.find(poisonName,gsub(string.lower(gsub(GetContainerItemLink(i,j),"^.*%[(.*)%].*$","%1")),"-","")) then
					if poisonName == gsub(string.lower(gsub(GetContainerItemLink(i,j),"^.*%[(.*)%].*$","%1")),"-","") then
						_, count = GetContainerItemInfo(i, j)
						countPoison = countPoison + count
					end
				end
			end
		end
	end
	EZP.ConfigFrame.MainHand.Font:SetText(countPoison)
	
	-- OffHand
	countPoison = 0
	count = 0
	id = EZP:GetInventoryID("OH")
	if id then
		poisonName = gsub(string.lower(EZP.Work.Poison[id[5]]..id[3]),"-","")
		for i=0,4 do 
			for j=1,18 do
				if GetContainerItemInfo(i, j) then
					--if string.find(poisonName,gsub(string.lower(gsub(GetContainerItemLink(i,j),"^.*%[(.*)%].*$","%1")),"-","")) then
					if poisonName == gsub(string.lower(gsub(GetContainerItemLink(i,j),"^.*%[(.*)%].*$","%1")),"-","") then
						_, count = GetContainerItemInfo(i, j)
						countPoison = countPoison + count
					end
				end
			end
		end
	end
	EZP.ConfigFrame.OffHand.Font:SetText(countPoison)
end

function EZP:GetInventoryID(hand)
	if hand then
		local H = 0
		if hand == "MH" then H = UIDropDownMenu_GetSelectedID(EZP.ConfigFrame.MainHand.BorderDropdown)
		elseif hand  == "OH" then H = UIDropDownMenu_GetSelectedID(EZP.ConfigFrame.OffHand.BorderDropdown) end
		
		-- if crippling poison 1
		if H == 4 then
			for i=0,4 do -- i = bagsnr.
				for j=1,18 do -- j = slotnr.
					if GetContainerItemInfo(i, j) and H <= 7 and H >= 2 then
						if gsub(GetContainerItemLink(i,j),"^.*%[(.*)%].*$","%1") == EZP.Work.Poison[3] then return {i,j,"",EZP.Work.PoisonID[3],H-1} end
					end
				end
			end
		end
		
		-- if cripling poison 2
		if H == 5 then
			for i=0,4 do -- i = bagsnr.
				for j=1,18 do -- j = slotnr.
					if GetContainerItemInfo(i, j) and H <= 7 and H >= 2 then
						if gsub(GetContainerItemLink(i,j),"^.*%[(.*)%].*$","%1") == EZP.Work.Poison[3].." II" then return {i,j,"",EZP.Work.PoisonID[4],H-1} end
					end
				end
			end
		end
		
		-- rank 6
		for i=0,4 do -- i = bagsnr.
			for j=1,18 do -- j = slotnr.
				if GetContainerItemInfo(i, j) and H <= 7 and H >= 2 then
					if gsub(GetContainerItemLink(i,j),"^.*%[(.*)%].*$","%1") == EZP.Work.Poison[H-1].." VI" then return {i,j," VI",EZP.Work.PoisonID[H-1][6],H-1} end
				end
			end
		end
		
		-- rank 5
		for i=0,4 do -- i = bagsnr.
			for j=1,18 do -- j = slotnr.
				if GetContainerItemInfo(i, j) and H <= 7 and H >= 2 then
					if gsub(GetContainerItemLink(i,j),"^.*%[(.*)%].*$","%1") == EZP.Work.Poison[H-1].." V" then return {i,j," V",EZP.Work.PoisonID[H-1][5],H-1} end
				end
			end
		end
		
		-- rank 4
		for i=0,4 do -- i = bagsnr.
			for j=1,18 do -- j = slotnr.
				if GetContainerItemInfo(i, j) and H <= 7 and H >= 2 then
					if gsub(GetContainerItemLink(i,j),"^.*%[(.*)%].*$","%1") == EZP.Work.Poison[H-1].." IV" then return {i,j," IV",EZP.Work.PoisonID[H-1][4],H-1} end
				end
			end
		end
		
		-- rank 3
		for i=0,4 do -- i = bagsnr.
			for j=1,18 do -- j = slotnr.
				if GetContainerItemInfo(i, j) and H <= 7 and H >= 2 then
					if gsub(GetContainerItemLink(i,j),"^.*%[(.*)%].*$","%1") == EZP.Work.Poison[H-1].." III" then return {i,j," III",EZP.Work.PoisonID[H-1][3],H-1} end
				end
			end
		end
		
		-- rank 2
		for i=0,4 do -- i = bagsnr.
			for j=1,18 do -- j = slotnr.
				if GetContainerItemInfo(i, j) and H <= 7 and H >= 2 then
					if gsub(GetContainerItemLink(i,j),"^.*%[(.*)%].*$","%1") == EZP.Work.Poison[H-1].." II" then return {i,j," II",EZP.Work.PoisonID[H-1][2],H-1} end
				end
			end
		end
		
		-- rank 1
		for i=0,4 do -- i = bagsnr.
			for j=1,18 do -- j = slotnr.
				if GetContainerItemInfo(i, j) and H <= 7 and H >= 2 then
					if gsub(GetContainerItemLink(i,j),"^.*%[(.*)%].*$","%1") == EZP.Work.Poison[H-1] then return {i,j,"",EZP.Work.PoisonID[H-1][1],H-1} end
				end
			end
		end
		
		return nil
	end
end

function EZP:ApplyPoisen(hand)
	EZP:UpdateTexture()
	if hand and not EZP.Work.iSCasting then
		local id = EZP:GetInventoryID(hand)
		if id then
			EZP:RegisterEvent("SPELLCAST_START")
			EZP:RegisterEvent("SPELLCAST_STOP")
			EZP:RegisterEvent("SPELLCAST_INTERRUPTED")
			EZP:RegisterEvent("SPELLCAST_FAILED")
			UseContainerItem(id[1], id[2])
			if hand == "MH" then PickupInventoryItem(16)
			elseif hand == "OH" then PickupInventoryItem(17) end
			ReplaceEnchant()
			ClearCursor()
		else
			if hand == "MH" and UIDropDownMenu_GetSelectedID(EZP.ConfigFrame.MainHand.BorderDropdown) ~= 1 and UIDropDownMenu_GetSelectedID(EZP.ConfigFrame.MainHand.BorderDropdown) ~= 7 then
				 DEFAULT_CHAT_FRAME:AddMessage("EzPoison: ".."|cFFCC9900".."MainHand ".."|r".."|cFFFFFFFF".."Poison not found.".."|r",0.4,0.8,0.4)
			elseif hand == "OH" and UIDropDownMenu_GetSelectedID(EZP.ConfigFrame.OffHand.BorderDropdown) ~= 1 and UIDropDownMenu_GetSelectedID(EZP.ConfigFrame.OffHand.BorderDropdown) ~= 7 then
				DEFAULT_CHAT_FRAME:AddMessage("EzPoison: ".."|cFFCC9900".."OffHand ".."|r".."|cFFFFFFFF".."Poison not found.".."|r",0.4,0.8,0.4) 
			end
		end
	end
end

function EZP:AutoApplyPoison()
	EZP:UpdateTexture()
	if EZP.ConfigFrame.MainHand:GetAlpha() < 1 then
		EZP:ApplyPoisen("MH")
	elseif EZP.ConfigFrame.OffHand:GetAlpha() < 1 then
		EZP:ApplyPoisen("OH")
	end
end

function EZP:SaveProfiles()
	local MH = UIDropDownMenu_GetSelectedID(EZP.ConfigFrame.MainHand.BorderDropdown)
	local OH = UIDropDownMenu_GetSelectedID(EZP.ConfigFrame.OffHand.BorderDropdown)
	
	if MH and MH <= 7 and MH >= 2 then
		EZPcfg.Profile[EZPcfg.CurrentProfile].MainHand = MH-1
	else
		EZPcfg.Profile[EZPcfg.CurrentProfile].MainHand = 0
	end
	
	if OH and OH <= 7 and OH >= 2 then
		EZPcfg.Profile[EZPcfg.CurrentProfile].OffHand = OH-1
	else
		EZPcfg.Profile[EZPcfg.CurrentProfile].OffHand = 0
	end
end

function EZP:SetProfile(profileNum)
	if profileNum then EZPcfg.CurrentProfile = profileNum end
	
	for i=1,7 do EZP.ConfigFrame.ProfileButton[i]:SetNormalTexture("Interface\\AddOns\\EzPoison\\Media\\buttonD") end
	EZP.ConfigFrame.ProfileButton[EZPcfg.CurrentProfile]:SetNormalTexture("Interface\\AddOns\\EzPoison\\Media\\buttonDselected")
	
	UIDropDownMenu_SetSelectedID(getglobal("EZPMainHandDD"), EZPcfg.Profile[EZPcfg.CurrentProfile].MainHand+1)
	UIDropDownMenu_SetSelectedID(getglobal("EZPOffHandDD"), EZPcfg.Profile[EZPcfg.CurrentProfile].OffHand+1)
	--DEFAULT_CHAT_FRAME:AddMessage("EzPoison: ".."|cFFFFFFFF".."Profile: ".."|cFFCC9900"..EZPcfg.Profile[EZPcfg.CurrentProfile].Name.."|r".."|cFFFFFFFF".." set.".."|r",0.4,0.8,0.4)
	
	EZP:UpdateSelection()
end

function EZP:UpdateSelection()
	local MH = UIDropDownMenu_GetSelectedID(EZP.ConfigFrame.MainHand.BorderDropdown)
	local OH = UIDropDownMenu_GetSelectedID(EZP.ConfigFrame.OffHand.BorderDropdown)
	
	if MH and MH <= 7 and MH >= 2 then
		EZP.ConfigFrame.MainHand:SetNormalTexture(EZP.Work.PoisonIcon[MH-1])
	else
		EZP.ConfigFrame.MainHand:SetNormalTexture("Interface\\Buttons\\UI-Quickslot-Depress")	
	end
	
	if OH and OH <= 7 and OH >= 2 then
		EZP.ConfigFrame.OffHand:SetNormalTexture(EZP.Work.PoisonIcon[OH-1])	
	else
		EZP.ConfigFrame.OffHand:SetNormalTexture("Interface\\Buttons\\UI-Quickslot-Depress")
	end
	
	EZP:UpdateTexture()
end

--additonal feature/ hooking temp-enchant OnUpdate function
function EZP:BuffFrame_Enchant_OnUpdate(elapsed)
	local hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges = GetWeaponEnchantInfo();
	
	-- No enchants, kick out early
	if ( not hasMainHandEnchant and not hasOffHandEnchant ) then
		TempEnchant1:Hide();
		TempEnchant1Duration:Hide();
		TempEnchant2:Hide();
		TempEnchant2Duration:Hide();
		BuffFrame:SetPoint("TOPRIGHT", "TemporaryEnchantFrame", "TOPRIGHT", 0, 0);
		return;
	end
	-- Has enchants
	local enchantButton;
	local textureName;
	local buffAlphaValue;
	local enchantIndex = 0;
	if ( hasOffHandEnchant ) then
		enchantIndex = enchantIndex + 1;
		textureName = GetInventoryItemTexture("player", 17);
		TempEnchant1:SetID(17);
		TempEnchant1Icon:SetTexture(textureName);
		TempEnchant1:Show();
		hasEnchant = 1;

		-- Show buff durations if necessary
		if ( offHandExpiration ) then
			offHandExpiration = offHandExpiration/1000;
		end
		if offHandCharges and offHandCharges > 0 then getglobal("TempEnchant1".."Count"):SetText(offHandCharges) end
		BuffFrame_UpdateDuration(TempEnchant1, offHandExpiration);

		-- Handle flashing
		if ( offHandExpiration and offHandExpiration < BUFF_WARNING_TIME ) then
			TempEnchant1:SetAlpha(BUFF_ALPHA_VALUE);
		else
			TempEnchant1:SetAlpha(1.0);
		end
		
	end
	if ( hasMainHandEnchant ) then
		enchantIndex = enchantIndex + 1;
		enchantButton = getglobal("TempEnchant"..enchantIndex);
		textureName = GetInventoryItemTexture("player", 16);
		enchantButton:SetID(16);
		getglobal(enchantButton:GetName().."Icon"):SetTexture(textureName);
		enchantButton:Show();
		hasEnchant = 1;

		-- Show buff durations if necessary
		if ( mainHandExpiration ) then
			mainHandExpiration = mainHandExpiration/1000;
		end
		if mainHandCharges and mainHandCharges > 0 then getglobal("TempEnchant2".."Count"):SetText(mainHandCharges) end
		BuffFrame_UpdateDuration(enchantButton, mainHandExpiration);

		-- Handle flashing
		if ( mainHandExpiration and mainHandExpiration < BUFF_WARNING_TIME ) then
			enchantButton:SetAlpha(BUFF_ALPHA_VALUE);
		else
			enchantButton:SetAlpha(1.0);
		end
	end
	--Hide unused enchants
	for i=enchantIndex+1, 2 do
		getglobal("TempEnchant"..i):Hide();
		getglobal("TempEnchant"..i.."Duration"):Hide();
	end

	-- Position buff frame
	TemporaryEnchantFrame:SetWidth(enchantIndex * 32);
	BuffFrame:SetPoint("TOPRIGHT", "TemporaryEnchantFrame", "TOPLEFT", -5, 0);
end

BuffFrame_Enchant_OnUpdate = EZP.BuffFrame_Enchant_OnUpdate

-- prompt
function EzPoisonPromt(arg1)
	if string.sub(arg1, 1, 5) == "scale" then
		local scale = tonumber(string.sub(arg1, 6, string.len(arg1)))
		if scale <=3 and scale >= 0.3 then EZPcfg.Scale = scale end
		EZP.ConfigFrame:SetScale(EZPcfg.Scale)
		EZPcfg.PosX = 200
		EZPcfg.PosY = -200
		EZP.ConfigFrame:SetPoint("TOPLEFT",EZPcfg.PosX,EZPcfg.PosY)
	
	elseif string.sub(arg1, 1, 5) == "apply" then
		EZP:AutoApplyPoison()
		
	elseif string.sub(arg1, 1, 7) == "profile" then
		local num = tonumber(string.sub(arg1, 8, string.len(arg1)))
		if num <=7 and num >= 1 then
			EZP:SetProfile(num)
		end
		
	elseif arg1 == nil or arg1 == "" then
		if EZP.ConfigFrame:IsVisible() then EZP.ConfigFrame:Hide()
		else EZP:UpdateTexture(); EZP.ConfigFrame:Show() end
	end
end
function EzPoisonProfile(num) EZP:SetProfile(num) end
function EzPoisonApply() EZP:AutoApplyPoison() end
function EzPoisonToggle()
	if EZP.ConfigFrame:IsVisible() then EZP.ConfigFrame:Hide()
	else EZP:UpdateTexture(); EZP.ConfigFrame:Show() end
end

-- binding list
BINDING_HEADER_HEAD = "EzPoison"

SlashCmdList['EZPOISON'] = EzPoisonPromt
SLASH_EZPOISON1 = '/ezpoison'
SLASH_EZPOISON2 = '/EzPoison'