local CheckBoxTables = {
	["绿色装备掉落 自动 [Ctrl-Alt]"] = {
		[0] = "LazyPigCheckboxGroupGreedRoll",
		[1] = { "LazyPigCheckbox00", "需求" },
		[2] = { "LazyPigCheckbox01", "贪婪" },
		[3] = { "LazyPigCheckbox02", "放弃" }
	},

	["祖格宝石硬币 自动"] = {
		[0] = "LazyPigCheckboxGroupZGRoll",
		[1] = { "LazyPigCheckbox10", "需求" },
		[2] = { "LazyPigCheckbox11", "贪婪" },
		[3] = { "LazyPigCheckbox12", "放弃" }
	},

	["安其拉废墟自动"] = {
		[0] = "LazyPigCheckboxGroupAQRoll",
		[1] = { "LazyPigCheckbox80", "需求" },
		[2] = { "LazyPigCheckbox81", "贪婪" },
		[3] = { "LazyPigCheckbox82", "放弃" }
	},

	["World Chat Mute"] = {
		[0] = "LazyPigCheckboxGroupWorldChatMute",
		[1] = { "LazyPigCheckbox20", "在副本时" },
		[2] = { "LazyPigCheckbox21", "在团队副本时" },
		[3] = { "LazyPigCheckbox22", "在战场时" },
		[4] = { "LazyPigCheckbox23", "在任何情况下", "Mute the WorldChannel for good..."}
	},

	["战场自动助手"] = {
		[0] = "LazyPigCheckboxGroupBGAutomation",
		[1] = { "LazyPigCheckbox50", "自动进入战场", "排到战场时自动进场" },
		[2] = { "LazyPigCheckbox51", "自动离开战场", "战场结束时自动离开场"},
		[3] = { "LazyPigCheckbox52", "自动排队战场", "加入战场时只需要右键相应NPC" },
		[4] = { "LazyPigCheckbox53", "自动释放尸体", "在战场里自动释放尸体" },
		[5] = { "LazyPigCheckbox54", "队长/团长自动排队战场" },
		[6] = { "LazyPigCheckbox55", "自动拒绝战场任务共享" }
	},
	
	["拯救祝福自动取消"] = {
		[0] = "LazyPigCheckboxGroupSalvationRemover",
		[1] = { "LazyPigCheckbox60", "总是" },
		[2] = { "LazyPigCheckbox61", "防御战士/德鲁伊熊" },
	},
	
	["姓名板显示规则"] = {
		[0] = "LazyPigCheckboxGroupNameplates",
		[1] = { "LazyPigCheckbox40", "显示友方" },
		[2] = { "LazyPigCheckbox41", "显示敌方" },
		[3] = { "LazyPigCheckbox42", "隐藏未知目标" }
	},

	["自动接受组队"] = {
		[0] = "LazyPigCheckboxGroupGroupInvite",
		[1] = { "LazyPigCheckbox30", "公会成员" , "队长是公会成员则自动接受"},
		[2] = { "LazyPigCheckbox31", "好友", "队长是好友则自动接受" },
		[3] = { "LazyPigCheckbox32", "陌生人", "队长是陌生人则自动接受" },
		[4] = { "LazyPigCheckbox33", "在战场队列中并且空闲" }
	},

	["其他单项助手"] = {
		[0] = "LazyPigCheckboxGroupSingleChoice",
		[1] = { "LazyPigCheckbox90", "术士召唤自动接受", "如果被术士召唤则在召唤过期之前接受" },
		[2] = { "LazyPigCheckbox91", "拾取窗口自动调整位置", "将拾取窗口置于鼠标下方"},
		[3] = { "LazyPigCheckbox92", "改进右键", "单击右键可将物品放到邮件箱/交易栏/拍卖窗口，A/T+右键物品自动拍卖搜索" },
		[4] = { "LazyPigCheckbox93", "物品拆分/叠加 (Shift+Right_Click)", "???"},
		[5] = { "LazyPigCheckbox94", "扩大视野范围", "将视野范围延长到最大值" },
		[6] = { "LazyPigCheckbox95", "特殊快捷按键", "开启特殊按键组合，详细可在按键设置内查看" },
		[7] = { "LazyPigCheckbox96", "决斗自动拒绝 (Shift 拒绝)" },
		[8] = { "LazyPigCheckbox97", "脱战自动接受复活", "脱战自动接受复活" },
		[9] = { "LazyPigCheckbox98", "自动屏蔽撕逼", "开启此选项需安装 Innkeepers 和 FlyMasters插件" },
		[10] = { "LazyPigCheckbox99", "角色自动保存", "自动使用.save 什么时候需要？" },
		[11] = { "LazyPigCheckbox100", "自动下马", "在执行另一动作的时候自动下马" },
		--[12] = { "LazyPigCheckbox101", "Chat Spam Filter", "One minute ban for identical messages" },
		--[12] = { "LazyPigCheckbox102", "Block Battleground Quest Sharing", "Really? No more 'Stable' spam?" }
	},
	
		["聊天框过滤"] = {
		[0] = "LazyPigCheckboxChatFilter",
		[1] = { "LazyPigCheckbox70", "玩家垃圾信息" },
		[2] = { "LazyPigCheckbox71", "绿色装备ROLL点信息过滤" },
		[3] = { "LazyPigCheckbox72", "蓝色装备ROLL点信息过滤" },
		[4] = { "LazyPigCheckbox73", "灰色/白色/金币信息过滤" }
	},
}
--Grey-Common Loot

local function CheckBoxGroup(hParent, offsetX, offsetY, sTitle, tCheck)
	local frame = CreateFrame("Frame", tCheck[0], hParent)
	frame:SetPoint("TOPLEFT", hParent, "TOPLEFT", offsetX, offsetY)
	frame:SetWidth(11)
	frame:SetHeight(11)

	local fs_title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	fs_title:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
	fs_title:SetTextColor(1, 1, 1, 1)
	fs_title:SetText(sTitle)

	frame.fs_title = fs_title

	frame.cb = {}

	for k,v in ipairs(tCheck) do
		local cb = CreateFrame("CheckButton", v[1], frame, "UICheckButtonTemplate")
		cb:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 8, -(4+(k-1)*14))
		cb:SetWidth(16)
		cb:SetHeight(16)
		
		if v[2] then cb.tooltipTitle = v[2] end
		if v[3] then cb.tooltipText = v[3] end

		local num = tonumber(string.sub(v[1], string.find(v[1], "%d+")))

		cb:SetScript("OnShow", function()
			LazyPig_GetOption(num)
		end)
		cb:SetScript("OnClick", function()
			LazyPig_SetOption(num);
		end)
		cb:SetScript("OnEnter", function()
			if this.tooltipTitle then
				GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT")
				--GameTooltip:SetScale(.71)
				GameTooltip:SetBackdropColor(.01, .01, .01, .91)
				GameTooltip:SetText(this.tooltipTitle)
				if this.tooltipText then
					GameTooltip:AddLine(this.tooltipText, 1, 1, 1)
				end
				GameTooltip:Show()
			end
		end)
		cb:SetScript("OnLeave", function()
			GameTooltip:Hide();
		end)

		frame.cb[k] = cb
	end

	return frame
end

function LazyPig_CreateOptionsFrame()
	-- Option Frame
	local frame = CreateFrame("Frame", "LazyPigOptionsFrame")
	tinsert(UISpecialFrames,"LazyPigOptionsFrame")
	frame:SetScale(.81)

	frame:SetWidth(480)
	frame:SetHeight(490)
	
	frame:SetPoint("TOPLEFT", nil, "TOPLEFT", 250, -50)
	frame:SetBackdrop( {
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
			edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", 
			tile = true, 
			tileSize = 32, 
			edgeSize = 32, 
			insets = { left = 11, right = 12, top = 12, bottom = 11 }
		} );
	frame:SetBackdropColor(.01, .01, .01, .91)

	frame:SetMovable(true)
	frame:EnableMouse(true)
	frame:SetClampedToScreen(false)
	frame:RegisterForDrag("LeftButton")
	frame:Hide()
	frame:SetScript("OnMouseDown", function()
		if arg1 == "LeftButton" and not this.isMoving then
			this:StartMoving();
			this.isMoving = true;
		end
	end)
	frame:SetScript("OnMouseUp", function()
		if arg1 == "LeftButton" and this.isMoving then
			this:StopMovingOrSizing();
			this.isMoving = false;
		end
	end)
	frame:SetScript("OnHide", function()
		if this.isMoving then
			this:StopMovingOrSizing();
			this.isMoving = false;
		end
	end)

	-- MenuTitle Frame
	local texture_title = frame:CreateTexture("LazyPigOptionsFrameTitle")
	texture_title:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header", true);
	texture_title:SetWidth(266)
	texture_title:SetHeight(58)
	texture_title:SetPoint("CENTER", frame, "TOP", 0, -20)

	frame.texture_title = texture_title

	-- MenuTitle FontString
	local fs_title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	fs_title:SetPoint("CENTER", frame.texture_title, "CENTER", 0, 12)
	fs_title:SetText("_LazyPig Options")

	frame.fs_title = fs_title

	-- Close Setting Window Button
	local btn_close = CreateFrame("Button", "LazyPigOptionsFrameCloseButton", frame, "UIPanelCloseButton")
	btn_close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -12, -12)
	btn_close:SetWidth(32)
	btn_close:SetHeight(32)
	
	frame.btn_close = btn_close

	frame.btn_close:SetScript("OnClick", function()
		this:GetParent():Hide()
			LazyPigKeybindsFrame:Hide()
	end)

	-- Keybinds Window Button
	local btn_keybinds = CreateFrame("Button", "LazyPigOptionsFrameKeibindsButton", frame, "GameMenuButtonTemplate")
	btn_keybinds:SetPoint("TOPLEFT", frame, "TOPLEFT", 33, -18)
	btn_keybinds:SetWidth(120)
	btn_keybinds:SetHeight(20)
	btn_keybinds:SetFont("Fonts\\FRIZQT__.TTF", 8)
	btn_keybinds:SetText("显示快捷键")

	frame.btn_keybinds = btn_keybinds

	frame.btn_keybinds:SetScript("OnClick", function()
		if this:GetText() == "显示快捷键" then
			LazyPigKeybindsFrame:Show()
			this:SetText("隐藏快捷键")
		else
			LazyPigKeybindsFrame:Hide()
			this:SetText("显示快捷键")
		end
	end)

	local str = "绿色装备掉落 自动 [Ctrl-Alt]"
	frame.cbgroup_greedroll = CheckBoxGroup(frame, 20, -45, str, CheckBoxTables[str])
	
	local str = "祖格硬币硬币 自动"
	frame.cbgroup_zgroll = CheckBoxGroup(frame, 20, -107, str, CheckBoxTables[str])

	local str = "安其拉废墟自动"
	frame.cbgroup_aqroll = CheckBoxGroup(frame, 20, -168, str, CheckBoxTables[str])

	local str = "世界频道过滤"
	frame.cbgroup_worldchatmute = CheckBoxGroup(frame, 20, -229, str, CheckBoxTables[str])
	
	local str = "战场自动助手"
	frame.cbgroup_bgautomation = CheckBoxGroup(frame, 20, -305, str, CheckBoxTables[str])
	
	local str = "姓名板显示规则"
	frame.cbgroup_nameplates = CheckBoxGroup(frame, 20, -409, str, CheckBoxTables[str])
	
	local str = "拯救祝福自动取消"
	frame.cbgroup_salvationremover = CheckBoxGroup(frame, 250, -195, str, CheckBoxTables[str])
	
	local str = "聊天框过滤"
	frame.cbgroup_salvationremover = CheckBoxGroup(frame, 250, -120, str, CheckBoxTables[str])

	local str = "自动接受组队"
	frame.cbgroup_groupinvite = CheckBoxGroup(frame, 250, -45, str, CheckBoxTables[str])

	local str = "其他单项助手"
	frame.cbgroup_singlechoise = CheckBoxGroup(frame, 250, -242, str, CheckBoxTables[str])

	return frame

end
