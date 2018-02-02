_G = getfenv(0)
local low, mediun, update = 300, 600, 10
local GameTooltip = GameTooltip
local GameTimeFrame = GameTimeFrame
local MainMenuBarPerformanceBarFrameButton = MainMenuBarPerformanceBarFrameButton

local select = select
local format = string.format
local date = date
local time = time
local UpdateAddOnMemoryUsage = UpdateAddOnMemoryUsage
local GetNumAddOns = GetNumAddOns
local GetAddOnMemoryUsage = GetAddOnMemoryUsage
local GetAddOnInfo = GetAddOnInfo
local GetNetStats = GetNetStats
local GetFramerate = GetFramerate

local tdPerformanceDB = {
	max = 30,	-- 最大条数
	typ = 2,	-- 1 - 3	1:插件时钟替代原时钟	2:延迟时	3:时钟
}

local frame = CreateFrame('Button', nil, Minimap)
local topAddOns = {}

local L = {
	text = "信息条（点击回收内存）",
	pingt = "延迟",
	fpst = "帧数",
	addons = "插件内存",
	other = "其它插件 |cffffffff(%d)|r",
	addon = "|cffffffff%s. |r%s",
	ping = "%d ms",
	fps = "%.0f fps",
	mb = "%.2f MB",
	kb = "%.1f KB",
}


local WindInfoDateWeek = {[0] = "日","一","二","三","四","五","六"};
local function GetDate()
	local year = date("%y", time()) + 2000;
	local mon = date("%m", time()) + 0;
	local day = date("%d", time()) + 0;
	return "|cFFFFFF00"..year.."|cFFFFFFFF".."年".."|cFFFFFF00"..mon.."|cFFFFFFFF".."月".."|cFFFFFF00"..day.."|cFFFFFFFF".."日".."|cFFFFFFFF星期".."|cFFFFFF00"..WindInfoDateWeek[tonumber(date("%w", time()))];
end


local function MenToString(mem)
	if mem > 1000 then
		return format(L.mb, mem / 1024);
	else
		return format(L.kb, mem);
	end
end

local function HookFrame(frame, script, func)
	if not frame or not script then return end
	if frame:GetScript(script) then
		frame:HookScript(script, func)
	else
		frame:SetScript(script, func)
	end
end

local function GetColor(value)
	value = 1 - value
	local r, g
	if value > 0.5 then
		r = (1 - value) * 2;
		g = 1;
	else
		r = 1;
		g = value * 2;
	end
	return r, g, 0;
end

------------本次登录收入,在线人数
    local money, lastmoney, xp, startxp, lastxp, gotxp, sessionxp = 0
	local function getFormattedMoney()
    local g = floor(money/(100*100))
    local s = floor((money - (g*100*100))/100)
    local c = mod(money, 100)
        return format('%d\|cfff3ac00金|r %d\|cffc6c6c6银|r %d\|cff954e2f铜|r', g, s, c)
    end

    local f = CreateFrame'Frame'
	f:RegisterEvent'PLAYER_MONEY'
    local getWhoOnline = function()
        SendWho''
        MODUI_FFqueued = true
        f:RegisterEvent'WHO_LIST_UPDATE'
        local  n, t = GetNumWhoResults()
        local text = format(GetText('WHO_FRAME_TOTAL_TEMPLATE', nil, t), t)
        text = gsub(text, '(.+) Found', '%1')
        return text
    end
	
	f:RegisterEvent'PLAYER_ENTERING_WORLD'
	f:RegisterEvent'PLAYER_MONEY'
    f:RegisterEvent'PLAYER_XP_UPDATE' f:RegisterEvent'PLAYER_LEVEL_UP'
    f:SetScript('OnEvent', function()
        if event == 'WHO_LIST_UPDATE' then
            HideUIPanel(FriendsFrame)
            f:UnregisterEvent'WHO_LIST_UPDATE'
            MODUI_FFqueued = false
        end
        if event == 'PLAYER_ENTERING_WORLD' then
            lastmoney = GetMoney()
            lastxp    = UnitXP'player'
            startxp   = GetTime()
            money     = 0
            sessionxp = 0
            gotxp     = 0
        elseif event == 'PLAYER_MONEY' then
    		local m = GetMoney()
    		if m > lastmoney then
    			local increase = (m - lastmoney)
    			money = money + increase
                lastmoney = m
            end
        elseif event == 'PLAYER_XP_UPDATE' then
            sessionxp = UnitXP'player' - lastxp + gotxp
        elseif event == 'PLAYER_LEVEL_UP' then
            gotxp = gotxp + UnitXPMax'player' - lastxp
            lastxp = 0
        end
    end)
	
	    function FriendsFrame_OnShow()
        FriendsFrame.showFriendsList = 1
        FriendsFrame_Update()
        UpdateMicroButtons()
        if not MODUI_FFqueued then PlaySound'igMainMenuOpen' end
        GuildFrame.selectedGuildMember = 0
        SetGuildRosterSelection(0)
        InGuildCheck()
    end

    function FriendsFrame_OnHide()
	   UpdateMicroButtons()
       if not MODUI_FFqueued then PlaySound'igMainMenuClose' end
       SetGuildRosterSelection(0)
       GuildFrame.selectedGuildMember = 0
       for _, v in pairs ({GuildControlPopupFrame, GuildMemberDetailFrame, GuildInfoFrame, RaidInfoFrame}) do
           v:Hide()
       end
       for _, v in FRIENDSFRAME_SUBFRAMES do _G[v]:Hide() end
   end
   
   ----------
    local getSession = function()
        local sessiontime = GetTime() - startxp
        local perhour     = sessionxp/sessiontime*3600
        local hourlyxp    = '|c00ffffff'..math.floor(perhour)..'|r xp'
        local time        = sessiontime > 0 and sessiontime or 0
        return hourlyxp, time
    end
	
local function OnEnter(self)
	self = self or this
	local i, j, k
	local mem, allmem, showmem, loaded = 0, 0, 0, 0
	
	local getLatency = function()
    local _, _, home = GetNetStats()
        return  '|c00ffffff'..home..'|r ms'
    end
	
    local hourlyxp, time = getSession()
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
	GameTooltip:SetText(L.text);
	GameTooltip:AddLine('Alt + 左键 移动 ', .3, 1, .6)	
	GameTooltip:AddLine(" ");
	GameTooltip:AddLine(GetDate());
	GameTooltip:AddDoubleLine('在线人数', getWhoOnline());
	GameTooltip:AddLine(" ");
	GameTooltip:AddDoubleLine('本次登录时长', SecondsToTimeAbbrev(math.floor(time)));	
	GameTooltip:AddDoubleLine('本次登录收入', getFormattedMoney());
	GameTooltip:AddDoubleLine('本次登录所获得的经验', '|cffffffff'..sessionxp..'|r xp');
	GameTooltip:AddDoubleLine('每小时经验值', hourlyxp);
	GameTooltip:AddLine(" ");
	GameTooltip:AddDoubleLine(L.pingt, getLatency());
	GameTooltip:AddDoubleLine(L.fpst, format(L.fps, GetFramerate()));

	for i = 1, tdPerformanceDB.max do
		if not topAddOns[i] then
			topAddOns[i] = { mem = 0, name = "" };
		end
		topAddOns[i].mem = 0;
	end

	--Updategcinfo()
	for i = 1, GetNumAddOns() do
		mem = gcinfo(i) or 0
		allmem = mem
		for j = 1, tdPerformanceDB.max do
			if mem > topAddOns[j].mem then
				for k = tdPerformanceDB.max, 1, -1 do
					if k == j then
						topAddOns[k].mem = mem;
						topAddOns[k].name = GetAddOnInfo(i);
						break;
					elseif k ~= 1 then
						topAddOns[k].mem = topAddOns[k-1].mem;
						topAddOns[k].name = topAddOns[k-1].name;
					end
				end
				break;
			end
		end
		if mem and mem > 0 then
			loaded = loaded + 1
		end
	end
	if allmem > 0 then
		GameTooltip:AddDoubleLine(L.addons, MenToString(allmem));
		GameTooltip:AddLine(" ");

		for i = 1, min(tdPerformanceDB.max, loaded) do
			if topAddOns[i].mem == 0 then
				break;
			end
			mem = topAddOns[i].mem;
			showmem = showmem + mem
			GameTooltip:AddLine(format(L.addon, i, topAddOns[i].name), 0, 1, 1, 1, 1, 1);
		end

		if loaded > tdPerformanceDB.max then
			GameTooltip:AddLine(format(L.other, loaded - tdPerformanceDB.max), 0, 1, 1, 1, 1, 1);
		end
	end
	GameTooltip:Show()
end


local function OnLeave() GameTooltip:Hide() end

local function OnClick()
	if arg1 == "LeftButton" then
		DEFAULT_CHAT_FRAME:AddMessage('|cff7fff7ftdPerformance|r:内存已回收')
		collectgarbage()
		OnEnter()
	end
end

local function OnUpdate(self)
	if (this.nextUpdate > 0) then
		this.nextUpdate = this.nextUpdate - arg1
	else
		this.nextUpdate = update
		local _, _, latency = GetNetStats();
		if latency > mediun then
			this.ClockText:SetVertexColor(1, 0, 0)
		else
			this.ClockText:SetVertexColor(GetColor(latency / mediun))
		end
		if (this.hover) then
			OnEnter(self)
		end
	end
	local hour, minute = GetGameTime();
	this.ClockText:SetText(format("%d:%s", hour, minute < 10 and ("0"..minute) or minute))
end

local function LoadLate()
	MainMenuBarPerformanceBarFrame_OnEnter = function() end
	MainMenuBarPerformanceBarFrameButton:SetScript("OnClick", OnClick)
	MainMenuBarPerformanceBarFrameButton:SetScript("OnEnter", OnEnter)
	MainMenuBarPerformanceBarFrameButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
end

local function LoadTime()
	GameTimeFrame.hover = nil
	GameTimeFrame.nextUpdate = 0
	GameTimeFrame.ClockText = GameTimeFrame:CreateFontString(nil, "ARTWORK", "NumberFontNormalHuge")
	GameTimeFrame.ClockText:SetPoint("CENTER",0,0)

	GameTimeFrame:SetScript("OnEnter", OnEnter)
	GameTimeFrame:SetScript("OnMouseUp", OnClick)
	HookFrame(GameTimeFrame, "OnUpdate", OnUpdate)
	GameTimeFrame.updateTooltip = nil
	GameTimeFrame_UpdateTooltip = function() end
end

local function LoadSelf()
	frame.hover = nil
	frame.nextUpdate = 0
	frame:SetBackdrop{
	  bgFile = 'Interface\TutorialFrame\TutorialFrameBackground',
	  edgeFile = 'Interface\Tooltips\UI-Tooltip-Border',
	  edgeSize = 18,
	  tile = true, tileSize = 16,
	  insets = {left = 5, right = 5, top = 5, bottom = 5}
	}
	frame:SetBackdropColor(0,0,0,0.8)
	frame:EnableMouse(true)
	frame:SetMovable(true)
	frame:SetScript('OnDragStart', function() if IsAltKeyDown() then this:StartMoving() end end)
    frame:SetScript('OnDragStop',  function() this:StopMovingOrSizing() end)
    frame:RegisterForDrag'LeftButton'
	frame:SetFrameStrata("HIGH")
	frame:SetToplevel(true)
	frame:SetWidth(50) frame:SetHeight(26)
	frame:SetPoint("CENTER", GameTimeFrame, "CENTER", -3, 5)
	frame.ClockText = frame:CreateFontString(nil, "ARTWORK", "NumberFontNormalHuge")
	frame.ClockText:SetPoint("CENTER",-2,1)
	frame:RegisterForClicks("LeftButtonUp", "RightButtonUp")

	frame:SetScript("OnUpdate", OnUpdate)
	frame:SetScript("OnEnter", OnEnter)
	frame:SetScript("OnLeave", OnLeave)
	frame:SetScript("OnClick", OnClick)

	GameTimeFrame:Hide()
	GameTimeFrame:SetScript("OnUpdate", nil)
	GameTimeFrame:SetScript("OnEnter", nil)
	GameTimeFrame:SetScript("OnLeave", nil)
	GameTimeFrame.updateTooltip = nil
	GameTimeFrame.Show = function() end
end

frame:SetScript("OnEvent", function(self)
	for i = 1, tdPerformanceDB.max do
		topAddOns[i] = { mem = 0, name = "" };
	end
	if tdPerformanceDB.typ == 1 then
		LoadSelf()
	elseif tdPerformanceDB.typ == 2 then
		LoadLate()
	elseif tdPerformanceDB.typ == 3 then
		LoadTime()
	end
	this:UnregisterEvent("VARIABLES_LOADED")
end)
frame:RegisterEvent("VARIABLES_LOADED")