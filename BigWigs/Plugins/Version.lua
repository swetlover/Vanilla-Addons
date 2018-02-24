assert(BigWigs, "BigWigs not found!")

local BWL = nil
local BZ = AceLibrary("Babble-Zone-2.2")
local L = AceLibrary("AceLocale-2.2"):new("BigWigsVersionQuery")
local tablet = AceLibrary("Tablet-2.0")
local dewdrop = AceLibrary("Dewdrop-2.0")

local COLOR_GREEN = "00ff00"
local COLOR_RED = "ff0000"
local COLOR_WHITE = "ffffff"

local isInitialQuery = true

---------------------------------
--      Localization           --
---------------------------------

L:RegisterTranslations("enUS", function() return {
	["versionquery"] = true,
	["Version Query"] = true,
	["Commands for querying the raid for Big Wigs versions."] = true,
	["Query already running, please wait 5 seconds before trying again."] = true,
	["Querying versions for "] = true,
	["Big Wigs Version Query"] = true,
	["Close window"] = true, -- I know, it's really a Tablet.
	["Showing version for "] = true,
	["Green versions are newer than yours, red are older, and white are the same."] = true,
	["Player"] = true,
	["Version"] = true,
	["Current zone"] = true,
	["<zone>"] = true,
	["Version query done."] = true,
	["Runs a version query on your current zone."] = true,
	["Closes the version query window."] = true,
	["current"] = true,
	["Runs a version query on the given zone."] = true,
	["Zone"] = true,
	["zone"] = true,
	["N/A"] = true,
	["BigWigs"] = true,
	["Runs a version query on the BigWigs core."] = true,
	["Nr Replies"] = true,
	["Ancient"] = true,
            
    ["Your version of Big Wigs Classic-WoW is out of date!\nPlease visit https://github.com/xorann/BigWigs/releases to get the latest version."] = true,
    ["Close"] = true,
    ["Cancel"] = true,
	
	["Gathering Data, please wait..."] = true,
	["<BigWigs> Everyone has the current version of BigWigs Classic-WoW. I'm proud of you!"] = true,
	["<BigWigs> Players without BigWigs Classic-WoW:"] = true,
	["<BigWigs> no one"] = true,
	["<BigWigs> Players with an outdated version of BigWigs Classic-WoW:"] = true,
	["<BigWigs> Players using a version of BigWigs intended for a different server:"] = true,
	["<BigWigs> Please download the newest version of BigWigs Classic-WoW from https://github.com/xorann/BigWigs/releases"] = true,
    ["Notify old versions"] = true,
	["Lists players with an old version in raid chat."] = true,
	["notifyOldVersions"] = true,
} end )

L:RegisterTranslations("zhCN", function() return {
	["versionquery"] = "versionquery",
	["Version Query"] = "版本查询",
	["Commands for querying the raid for Big Wigs versions."] = "查询Big Wigs版本的RAID命令.",
	["Query already running, please wait 5 seconds before trying again."] = "查询已在运行，请稍候5秒钟再重试.",
	["Querying versions for "] = "查询版本 ",
	["Big Wigs Version Query"] = "Big Wigs 版本查询",
	["Close window"] = "关闭窗口", -- I know, it's really a Tablet.
	["Showing version for "] = "显示版本 ",
	["Green versions are newer than yours, red are older, and white are the same."] = "绿色版本比你的更新，红色比你老，白色一样.",
	["Player"] = "玩家",
	["Version"] = "版本",
	["Current zone"] = "当前区域",
	["<zone>"] = "<区域>",
	["Version query done."] = "版本检测已完成.",
	["Runs a version query on your current zone."] = "对当前区域进行版本检测.",
	["Closes the version query window."] = "关闭版本查询窗口.",
	["current"] = "当前",
	["Runs a version query on the given zone."] = "在给指定的区域进行版本查询",
	["Zone"] = "区域",
	["zone"] = "区域",
	["N/A"] = "N/A",
	["BigWigs"] = "BigWigs",
	["Runs a version query on the BigWigs core."] = "在BigWigs核心部分运行版本查询.",
	["Nr Replies"] = "回应人数",
	["Ancient"] = "旧版本",
            
    ["Your version of Big Wigs Classic-WoW is out of date!\nPlease visit https://github.com/xorann/BigWigs/releases to get the latest version."] = "你的Big Wigs Classic-WoW版本是过时的! \n请访问Q猫的插件站 http://60addons.com/ 下载最新版本.",
    ["Close"] = "关闭",
    ["Cancel"] = "取消",
	
	["Gathering Data, please wait..."] = "正在收集数据，请稍候…",
	["<BigWigs> Everyone has the current version of BigWigs Classic-WoW. I'm proud of you!"] = "<BigWigs> 每个人都有当前xorann版本的 BigWigs.",
	["<BigWigs> Players without BigWigs Classic-WoW:"] = "<BigWigs> xorann版本BigWigs:",
	["<BigWigs> no one"] = "<BigWigs> 没有人",
	["<BigWigs> Players with an outdated version of BigWigs Classic-WoW:"] = "<BigWigs> 玩家没有最新 BigWigs Classic-WoW版本:",
	["<BigWigs> Players using a version of BigWigs intended for a different server:"] = "<BigWigs> 玩家使用一个bigwigs版本针对不同的服务器:",
	["<BigWigs> Please download the newest version of BigWigs Classic-WoW from https://github.com/xorann/BigWigs/releases"] = "<BigWig> 请下载最新版本 http://60addons.com/",
	["Notify old versions"] = "老版本的通知",
	["Lists players with an old version in raid chat."] = "在RAID聊天中列出旧版本的玩家.",
	["notifyOldVersions"] = "老版本的通知",
} end )


---------------------------------
--      Addon Declaration      --
---------------------------------

BigWigsVersionQuery = BigWigs:NewModule("Version Query")

BigWigsVersionQuery.consoleCmd = L["versionquery"]
BigWigsVersionQuery.consoleOptions = {
	type = "group",
	name = L["Version Query"],
	desc = L["Commands for querying the raid for Big Wigs versions."],
	args = {
		[L["BigWigs"]] = {
			type = "execute",
			name = L["BigWigs"],
			desc = L["Runs a version query on the BigWigs core."],
			func = function() BigWigsVersionQuery:QueryVersion("BigWigs") end,
		},
		[L["current"]] = {
			type = "execute",
			name = L["Current zone"],
			desc = L["Runs a version query on your current zone."],
			func = function() BigWigsVersionQuery:QueryVersion() end,
		},
		[L["zone"]] = {
			type = "text",
			name = L["Zone"],
			desc = L["Runs a version query on the given zone."],
			usage = L["<zone>"],
			get = false,
			set = function(zone) BigWigsVersionQuery:QueryVersion(zone) end,
		},
		[L["notifyOldVersions"]] = {
			type = "execute",
			name = L["Notify old versions"],
			desc = L["Lists players with an old version in raid chat."],
			func = function() BigWigsVersionQuery:NotifyOldVersions() end,
		},
	}
}

------------------------------
--      Initialization      --
------------------------------

function BigWigsVersionQuery:Test()
    BigWigsVersionQuery:QueryVersion("BigWigs")
end

function BigWigsVersionQuery:OnEnable()
	self.queryRunning = nil
	self.responseTable = {}
	self.zoneRevisions = nil
	self.currentZone = ""
	self.OutOfDateShown = false
	isInitialQuery = true -- reset after /console reloadui

	BWL = AceLibrary("AceLocale-2.2"):new("BigWigs")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "BWVQ", 0)
	self:TriggerEvent("BigWigs_ThrottleSync", "BWVR", 0)
	
	--BigWigsVersionQuery:QueryVersion("BigWigs")
    self:ScheduleEvent("versionquerytest", BigWigsVersionQuery.Test, 1, self) -- check version in 1s
end

function BigWigsVersionQuery:PopulateRevisions()
	self.zoneRevisions = {}
	for name, module in self.core:IterateModules() do
		if module:IsBossModule() and module.zonename and type(module.zonename) == "string" then
			-- Make sure to get the enUS zone name.
			local zone = BZ:HasReverseTranslation(module.zonename) and BZ:GetReverseTranslation(module.zonename) or module.zonename
			-- Get the abbreviated name from BW Core.
			local zoneAbbr = BWL:HasTranslation(zone) and BWL:GetTranslation(zone) or nil
			if not self.zoneRevisions[zone] or module.revision > self.zoneRevisions[zone] then
				self.zoneRevisions[zone] = module.revision
			end
			if zoneAbbr and (not self.zoneRevisions[zoneAbbr] or module.revision > self.zoneRevisions[zoneAbbr]) then
				self.zoneRevisions[zoneAbbr] = module.revision
			end
		end
	end
	self.zoneRevisions["BigWigs"] = self.core.revision
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsVersionQuery:UpdateTablet()
    if not tablet:IsRegistered("BigWigs_VersionQuery") then
		tablet:Register("BigWigs_VersionQuery",
			"children", function() tablet:SetTitle(L["Big Wigs Version Query"])
				self:OnTooltipUpdate() end,
			"clickable", true,
			"showTitleWhenDetached", true,
			"showHintWhenDetached", true,
			"cantAttach", true,
			"menu", function()
					dewdrop:AddLine(
						"text", L["BigWigs"],
						"tooltipTitle", L["BigWigs"],
						"tooltipText", L["Runs a version query on the BigWigs core."],
						"func", function() self:QueryVersion("BigWigs") end)
					dewdrop:AddLine(
						"text", L["Current zone"],
						"tooltipTitle", L["Current zone"],
						"tooltipText", L["Runs a version query on your current zone."],
						"func", function() self:QueryVersion() end)
					dewdrop:AddLine(
						"text", L["Notify old versions"],
						"tooltipTitle", L["Notify old versions"],
						"tooltipText", L["Lists players with an old version in raid chat."],
						"func", function() self:NotifyOldVersions() end)
					dewdrop:AddLine(
						"text", L["Close window"],
						"tooltipTitle", L["Close window"],
						"tooltipText", L["Closes the version query window."],
						"func", function() tablet:Attach("BigWigs_VersionQuery"); dewdrop:Close() end)
				end
		)
	end
	if tablet:IsAttached("BigWigs_VersionQuery") then
		tablet:Detach("BigWigs_VersionQuery")
	else
		tablet:Refresh("BigWigs_VersionQuery")
	end
end
function BigWigsVersionQuery:UpdateVersions()
    -- only check if this version is outdated if it is the same fork
	for name, data in pairs(self.responseTable) do
		if not self.zoneRevisions then return end
		if data.forkName and data.forkName == self.core.forkName and self.zoneRevisions[self.currentZone] and data.rev > self.zoneRevisions[self.currentZone] then
			self:IsOutOfDate()
		end
	end
    
	if not isInitialQuery then
        self:UpdateTablet()
    end
end

function BigWigsVersionQuery:IsOutOfDate()
	if not self.OutOfDateShown then
		self.OutOfDateShown = true
		BigWigs:Print(L["Your version of Big Wigs Classic-WoW is out of date!\nPlease visit https://github.com/xorann/BigWigs/releases to get the latest version."])
        
        local dialog = nil
        StaticPopupDialogs["BigWigsOutOfDateDialog"] = {
            text = L["Your version of Big Wigs Classic-WoW is out of date!\nPlease visit https://github.com/xorann/BigWigs/releases to get the latest version."],
            button1 = L["Close"],
            button2 = L["Cancel"],
            OnAccept = function()
                StaticPopup_Hide ("BigWigsOutOfDateDialog")
            end,
            OnCancel = function()
                StaticPopup_Hide ("BigWigsOutOfDateDialog")
            end,
            OnShow = function (self, data)
                local editbox = getglobal(this:GetName().."WideEditBox")
                editbox:SetText("https://github.com/xorann/BigWigs/releases")
                editbox:SetWidth(250)
                editbox:ClearFocus()
                editbox:HighlightText() 
                --self.editBox:SetText("Some text goes here")
                getglobal(this:GetName().."Button2"):Hide()
            end,
            hasEditBox = true,
            hasWideEditBox = true,
            maxLetters = 42,
            --EditBox:setText("Text"),
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
        }
        local dialog = StaticPopup_Show ("BigWigsOutOfDateDialog")
        
	end
end


local function Blame()
	-- no BigWigs at all
	local noBigWigs = nil
	local outdated = nil
	local differentFork = nil
	
	if not BigWigsVersionQuery.responseTable then
		BigWigs:Print("that didn't work...")		
		return
	end

	for i = 1, GetNumRaidMembers(), 1 do
		local name = UnitName("Raid" .. i)
		local data = BigWigsVersionQuery.responseTable[name]

		
		if data and data.rev and (data.forkName and data.forkName == BigWigs.forkName or not data.forkName) then
			-- has bigwigs
			if BigWigs.revision and data.rev < BigWigs.revision then
				-- bigwigs is out of date
				if not outdated then
					outdated = name
				else
					outdated = outdated .. ", " .. name
				end
			end
		elseif data and data.forkName and data.forkName ~= BigWigs.forkName then
			-- different fork
			if not differentFork then
				differentFork = name
			else
				differentFork = differentFork .. ", " .. name
			end
		else
			-- does not have bigwigs
			if not noBigWigs then
				noBigWigs = name
			else
				noBigWigs = noBigWigs .. ", " .. name
			end
		end
	end
	
	-- inform raid
	if not noBigWigs and not outdated and not differentFork then
		SendChatMessage(L["<BigWigs> Everyone has the current version of BigWigs Classic-WoW. I'm proud of you!"], "RAID")
	else
		if noBigWigs then
			SendChatMessage(L["<BigWigs> Players without BigWigs Classic-WoW:"], "RAID")
			SendChatMessage("<BigWigs> " .. noBigWigs, "RAID")
		end
		
		if outdated then
			SendChatMessage(L["<BigWigs> Players with an outdated version of BigWigs Classic-WoW:"], "RAID")
			SendChatMessage("<BigWigs> " .. outdated, "RAID")
		end
		
		if differentFork then
			SendChatMessage(L["<BigWigs> Players using a version of BigWigs intended for a different server:"], "RAID")
			SendChatMessage("<BigWigs> " .. differentFork, "RAID")
		end
		
		SendChatMessage(L["<BigWigs> Please download the newest version of BigWigs Classic-WoW from https://github.com/xorann/BigWigs/releases"], "RAID")
	end
end

function BigWigsVersionQuery:NotifyOldVersions()
	self:QueryVersion("BigWigs")
	self:ScheduleEvent(Blame, 5)
	BigWigs:Print(L["Gathering Data, please wait..."])
end

function BigWigsVersionQuery:OnTooltipUpdate()
	local zoneCat = tablet:AddCategory(
		"columns", 1,
		"text", L["Zone"],
		"child_justify1", "LEFT"
	)
	zoneCat:AddLine("text", self.currentZone)
	local playerscat = tablet:AddCategory(
		"columns", 1,
		"text", L["Nr Replies"],
		"child_justify1", "LEFT"
	)
	playerscat:AddLine("text", self.responses)
	local cat = tablet:AddCategory(
		"columns", 2,
		"text", L["Player"],
		"text2", L["Version"],
		"child_justify1", "LEFT",
		"child_justify2", "RIGHT"
	)
	for name, data in pairs(self.responseTable) do
		if data.rev == -1 then -- bigwigs installed but module not found
			cat:AddLine("text", name, "text2", "|cff"..COLOR_RED..L["N/A"].."|r")
		elseif data.forkName and data.forkName ~= self.core.forkName then -- different fork
			cat:AddLine("text", name, "text2", "|cff" .. COLOR_WHITE .. data.rev .. " (" .. data.forkName .. ")|r")
		else -- out of date or different fork
			if not self.zoneRevisions then 
				self:PopulateRevisions() 
			end
			
			local color = COLOR_WHITE
			if self.zoneRevisions[self.currentZone] and data.rev > self.zoneRevisions[self.currentZone] then
				if data.forkName == self.core.forkName then
					color = COLOR_GREEN
					self:IsOutOfDate()
				end
			elseif self.zoneRevisions[self.currentZone] and data.rev < self.zoneRevisions[self.currentZone] then
				color = COLOR_RED
			end
			cat:AddLine("text", name, "text2", "|cff"..color..data.rev.."|r")
		end
	end

	tablet:SetHint(L["Green versions are newer than yours, red are older, and white are the same."])
end

function BigWigsVersionQuery:QueryVersionAndShowWindow(zone)
    self:QueryVersion(zone)
	self:UpdateVersions()
end
function BigWigsVersionQuery:QueryVersion(zone)
	if self.queryRunning then
		self.core:Print(L["Query already running, please wait 5 seconds before trying again."])
		return
	end
	if not zone or zone == "" or type(zone) ~= "string" then zone = GetRealZoneText() end
	-- If this is a shorthand zone, convert it to enUS full.
	-- Also, if this is a shorthand, we can't really know if the user is enUS or not.

	if not BWL then BWL = AceLibrary("AceLocale-2.2"):new("BigWigs") end
	if BWL ~= nil and zone ~= nil and type(zone) == "string" and BWL:HasReverseTranslation(zone) then
		zone = BWL:GetReverseTranslation(zone)
		-- If there is a translation for this to GetLocale(), get it, so we can
		-- print the zone name in the correct locale.
		if BZ:HasTranslation(zone) then
			zone = BZ:GetTranslation(zone)
		end
	end
    
	if not zone then
		error("The given zone is invalid.")
		return
	end

	-- ZZZ |zone| should be translated here.
	if not isInitialQuery then
        self.core:Print(L["Querying versions for "].."|cff"..COLOR_GREEN..zone.."|r.")
    end

	-- If this is a non-enUS zone, convert it to enUS.
	if BZ:HasReverseTranslation(zone) then zone = BZ:GetReverseTranslation(zone) end

	self.currentZone = zone

	self.queryRunning = true
	self:ScheduleEvent(	function()
            self.queryRunning = nil
            if not isInitialQuery then
                self.core:Print(L["Version query done."])
            end
            isInitialQuery = false
        end, 5)

	self.responseTable = {}

	if not self.zoneRevisions then self:PopulateRevisions() end
	if not self.zoneRevisions[zone] then
		self.responseTable[UnitName("player")] = { rev = -1, forkName = self.core.forkName }
	else
		self.responseTable[UnitName("player")] = { rev = self.zoneRevisions[zone], forkName = self.core.forkName }
	end
	self.responses = 1
	self:TriggerEvent("BigWigs_SendSync", "BWVQ " .. zone)
end

--[[ Parses the newest style reply, which is "<rev> <nick> <forkName>" ]]
function BigWigsVersionQuery:ParseReply3(reply)
	-- If there's no space, it's just a version number we got.
	local _, _, rev, nick, fork = string.find(reply, "(.+) (.+) (.+)")
	if not rev or not nick or not fork then 
		return reply, nil, nil
	end

	return tonumber(rev), nick, fork
end

--[[ Parses the new style reply, which is "1111 <nick>" ]]
function BigWigsVersionQuery:ParseReply2(reply)
	-- If there's no space, it's just a version number we got.
	local first, last = string.find(reply, " ")
	if not first or not last then return reply, nil end

	local rev = string.sub(reply, 1, first)
	local nick = string.sub(reply, last + 1, string.len(reply))

	-- We need to check if rev or nick contains ':' - if it does, this is an old
	-- style reply.
	if tonumber(rev) == nil or string.find(rev, ":") or string.find(nick, ":") then
		return self:ParseReply(reply), nil
	end
	return tonumber(rev), nick
end

--[[ Parses the old style reply, which was MC:REV BWL:REV, etc. ]]
function BigWigsVersionQuery:ParseReply(reply)
	if not string.find(reply, ":") then return -1 end
	local zone = BWL:HasTranslation(self.currentZone) and BWL:GetTranslation(self.currentZone) or self.currentZone

	local zoneIndex, zoneEnd = string.find(reply, zone)
	if not zoneIndex then return -1 end

	local revision = string.sub(reply, zoneEnd + 2, zoneEnd + 6)
	local convertedRev = tonumber(revision)
	if revision and convertedRev ~= nil then return convertedRev end

	return -1
end

--[[
-- Version reply syntax history:
--  Old Style:           MC:REV BWL:REV ZG:REV
--  First Working Style: REV
--  New Style:           REV QuereeNick
--]]

function BigWigsVersionQuery:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BWVR2" and self.queryRunning and nick and rest then
		-- reply received
		local revision, queryNick, fork = self:ParseReply3(rest)
		if queryNick == UnitName("player") then
			if not self.responseTable[nick] then
				self.responses = self.responses + 1
			end
			self.responseTable[nick] = { rev = tonumber(revision), forkName = fork }
			self:UpdateVersions()
		end
	elseif sync == "BWVQ" and nick ~= UnitName("player") and rest then
		-- query, send reply
		if not self.zoneRevisions then 
            self:PopulateRevisions() 
        end
		if not self.zoneRevisions[rest] then
			self:TriggerEvent("BigWigs_SendSync", "BWVR2 -1 ".. nick .. " " .. self.core.forkName)
			self:TriggerEvent("BigWigs_SendSync", "BWVR -1 ".. nick)
		else
			self:TriggerEvent("BigWigs_SendSync", "BWVR2 " .. self.zoneRevisions[rest] .. " " .. nick .. " " .. self.core.forkName)
			self:TriggerEvent("BigWigs_SendSync", "BWVR " .. self.zoneRevisions[rest] .. " " .. nick)
		end
	elseif sync == "BWVR" and self.queryRunning and nick and rest then
		-- reply received
		
		-- Means it's either a old style or new style reply.
		-- The "working style" is just the number, which was the second type of
		-- version reply we had.
		local revision, queryNick = nil, nil, nil
		if tonumber(rest) == nil then
			revision, queryNick = self:ParseReply2(rest)
		else
			revision = tonumber(rest)
		end
		if queryNick == nil or queryNick == UnitName("player") then
			if not self.responseTable[nick] then
				self.responseTable[nick] = { rev = tonumber(revision), forkName = nil }
				self.responses = self.responses + 1
			end
			self:UpdateVersions()
		end
	end
end
