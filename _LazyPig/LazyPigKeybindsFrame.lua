local FontstringTables = {
	["无需设置的功能"] = {
		[0] = "LazyPigNCE",
		[1] = { "LazyPig_kbfs000", "自动出售垃圾/修复装备:", "NPC交易窗口按住Shift实现自动卖垃圾/自动修理" },
		[2] = { "LazyPig_kbfs001", "可重复任务自动完成:", "按住Shift键并完成任务一次." },
		[3] = { "LazyPig_kbfs002", "任务自动接受/自动完成:", "按住Alt键自动接受/自动完成任务." },
	},

	["特殊快捷按键"] = {
		[0] = "LazyPigSKCB",
		[1] = { "LazyPig_kbfs010", "跟随:", "CTRL-SHIFT" },
		[2] = { "LazyPig_kbfs011", "查看玩家/竞拍物品:", "ALT-SHIFT" },
		[3] = { "LazyPig_kbfs012", "发送邮件/创建拍卖:", "CTRL-ALT" },
		[4] = { "LazyPig_kbfs013", "弹出窗口确认/一口价购买AH:", "CTRL-ALT" },
		[5] = { "LazyPig_kbfs014", "交易/交易窗口确认:", "CTRL-ALT" },
	},

	["配置按键绑定"] = {
		[0] = "LazyPigCKB",
		[1] = { "LazyPig_kbfs020", "小退:", "" },
		[2] = { "LazyPig_kbfs021", "自动跑路", "" },
		[3] = { "LazyPig_kbfs022", "重置UI:", "" },
		[4] = { "LazyPig_kbfs023", "目标战歌敌方旗手/决斗请求取消", "" },
		[5] = { "LazyPig_kbfs024", "战歌快速放旗/消除缓落术buff", "" },
	},
}


local function FontstringGroup(hParent, offsetX, offsetY, sTitle, tCheck, tCol1, tCol2, bKB)
	local frame = CreateFrame("Frame", tCheck[0], hParent)
	frame:SetPoint("TOPLEFT", hParent, "TOPLEFT", offsetX, offsetY)
	frame:SetWidth(11)
	frame:SetHeight(11)

	local fs_title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	fs_title:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
	fs_title:SetTextColor(1, 1, 1, 1)
	fs_title:SetText(sTitle)

	frame.fs_title = fs_title

	frame.fst = {}
	frame.fsc = {}
	
	local max_width = { 0, nil }

	for k,v in ipairs(tCheck) do
		local fst = frame:CreateFontString(v[1], "ARTWORK", "GameFontNormalSmall")
		fst:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 8, -(4+(k-1)*10))
		fst:SetText(v[2])
		fst:SetTextColor(tCol1[1], tCol1[2], tCol1[3], tCol1[4])
		local temp = fst:GetStringWidth()
		if temp > max_width[1] then 
			max_width[1] = temp
			max_width[2] = fst
		end

		frame.fst[k] = fst
	end
	for k,v in ipairs(tCheck) do
		local fsname
		if not bKB then
			fsname = v[1].."Content"
		else
			fsname = "LP_KB" .. tostring(k)
		end
		local fsc = frame:CreateFontString(fsname, "ARTWORK", "GameFontNormalSmall")
		fsc:SetPoint("LEFT", getglobal(v[1]), "LEFT", 10+max_width[1], 0)
		fsc:SetText(v[3])
		fsc:SetTextColor(tCol2[1], tCol2[2], tCol2[3], tCol2[4])

		frame.fsc[k] = fsc
	end
end

function LazyPig_CreateKeybindsFrame()
	local LPF = getglobal("LazyPigOptionsFrame")
	local LPF_Bottom = LPF:GetBottom()
	-- Keybinds Frame
	local frame = CreateFrame("Frame", "LazyPigKeybindsFrame")
	tinsert(UISpecialFrames,"LazyPigKeybindsFrame")
	frame:SetScale(.81)

	frame:SetWidth(570)
	frame:SetHeight(175)
	
	--frame:SetPoint("TOP", nil, "CENTER", 0, LPF_Bottom)
	frame:SetPoint("TOP", LPF, "BOTTOM", 0, -10)

	--frame:SetPoint("TOP", nil, "CENTER", 0, -135)
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
	frame:SetScript("OnShow", function()
		LazyPig_ShowBindings("LOGOUT", "LP_KB1", "CTRL+ALT+SHIFT");
		LazyPig_ShowBindings("UNSTUCK", "LP_KB2");
		LazyPig_ShowBindings("RELOAD", "LP_KB3");
		LazyPig_ShowBindings("DUEL", "LP_KB4");
		LazyPig_ShowBindings("WSGDROP", "LP_KB5");	
	end)
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
	local texture_title = frame:CreateTexture("LazyPigKeybindsFrameTitle")
	texture_title:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header", true);
	texture_title:SetWidth(266)
	texture_title:SetHeight(58)
	texture_title:SetPoint("CENTER", LazyPigKeybindsFrame, "TOP", 0, -20)

	frame.texture_title = texture_title

	-- MenuTitle FontString
	local fs_title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	fs_title:SetPoint("CENTER", frame.texture_title, "CENTER", 0, 12)
	fs_title:SetText("_懒猪 快捷键")

	frame.fs_title = fs_title

	local st = "无需设置的功能"
	frame.fsgroup_NCE = FontstringGroup(frame, 20, -25, st, FontstringTables[st], {1, .81, 0}, {1, 1, 1})

	local st = "特殊快捷按键"
	frame.fsgroup_SKCB = FontstringGroup(frame, 20, -85, st, FontstringTables[st], {1, .81, 0}, {.8, .1, .1})

	local st = "配置按键绑定"
	frame.fsgroup_CKB = FontstringGroup(frame, 255, -85, st, FontstringTables[st], {1, .81, 0}, {.8, .1, .1}, true)

	return frame
end