assert( BigWigs, "BigWigs not found!")

----------------------------------
--      Module Declaration      --
----------------------------------

local myname = "洛欧塞布治疗助手"
local bossName = "Loatheb"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..myname)
local module = BigWigs:NewModule(myname, "AceConsole-2.0")
local boss = AceLibrary("Babble-Boss-2.2")[bossName]
module.bossSync = myname
module.synctoken = myname
module.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
module.translatedName = boss
module.external = true
module.trashMod = true

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "LoathebHealers",
	
	bar_cmd = "bar",
	bar_name = "堕落心灵条",
	bar_desc = "显示一个你自己的堕落心灵Debuff条.",
	
	healnotify_cmd = "notify",
	healnotify_name = "不通知治疗职业.",
	healnotify_desc = "切换发送信息到治疗频道.关于谁治疗，谁是下一个治疗",
	
	localhealnotify_cmd = "localnotify",
	localhealnotify_name = "通知.当轮到你治疗的时候",
	localhealnotify_desc = "当你需要治疗时，会显示提示你的本地信息.",
	
	notwhisper_cmd = "notwhisper",
	notwhisper_name = "不私聊治疗的循环",
	notwhisper_desc = "切换私聊下一个和他后面的一个去治疗和准备.",
	
	bar_text = "堕落心灵",
	debuffLost = "堕落心灵效果从你身上消失了。",
	
	slash_cmd = "/bwlh",
	slash_desc = "洛欧塞布治疗助手设置.",
	
	tabletshow_cmd = "show",
	tabletshow_desc = "显示治疗者列表.",
	
	tablethide_cmd = "hide",
	tablethide_desc = "隐藏治疗者列表.",
	
	setchannel_cmd = "channel",
	setchannel_desc = "设置治疗频道.",
	
	healerrotation_cmd = "healerrotation",
	healerrotation_desc = "设置特定的治疗者循环.",
	["<name1, name2, name3>"] = "<名字1, 名字2, 名字3>",
	
	["Loatheb Healers"] = "洛欧塞布治疗助手",
	["Big Wigs Loatheb Healers"] = "Big Wigs 洛欧塞布治疗助手",
	["Healer"] = "治疗者",
	["Timer"] = "计时器",
	["Ready"] = "准备好了",
	["Corrupted Mind"] = "堕落心灵",
	["The leader will automatically whisper the next one in line when to heal."] = "领导者在治疗时会自动私聊下一个。",
	["Get ready!"] = "准备好！",
	["Heal now!"] = "现在治疗！",
	["[BWLH] You are the first healer, heal when ready."] = "你是第一个治疗者, 准备好后就治疗!",
	["[BWLH] You are the second healer, heal when you get the message."] = "你是第二个治疗者, 当你收到提示时就开始治疗!",
	["%s healed - %s is next!"] = "%s 治疗结束 - %s 是下一个治疗!",
	["<channelname>"] = "<频道名字>",
	["You are NOT in a healer channel. Please set one using /bwlh setchannel <channelname>."] = "你不在一个治疗者频道. 请设置一个,输入 /bwlh setchannel <频道名字>",
	["Your announce channel is set to %s."] = "你的通告频道设置到 %s",
	["The channel %s was not found, please set a healer channel with /bwlh setchannel <channelname>."] = "频道 %s 未发现,请设置一个治疗者频道,输入/bwlh setchannel <频道名字>",
	["Offline"] = "离线",
	["Dead"] = "死亡",
	["Healer list not populated yet, please click here to do so now."] = "治疗者名单尚未填充, 现在请点击这里.",
	["Commands"] = "命令",
	["Print rotation to raidchat"] = "发送循环到团队聊天",
	["Re-scan healers"] = "重新扫描治疗者",
	["Ignore target"] = "忽略目标",
	["Healer list refreshed."] = "治疗者列表刷新",
	["%s will be blocked from healing rotation."] = "%s 将被阻止治疗循环",
	["%s can be in healing rotation."] = "%s 可以治疗循环.",
	["[BWLH] Healing rotation: %s."] = "治疗循环: %s.",
	["%[BWLH%] Healing rotation: (.*)."] = "%[BWLH%] 治疗循环: (.*).",
	["Healing rotation broadcasted by %s."] = "治疗循环由 %s 广播",
	["Healing rotation not populated yet."] = "治疗循环尚未填充",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.enabletrigger = { boss }
module.toggleoptions = { "healnotify", "notwhisper", -1, "localhealnotify", "bar" }
module.revision = 20001

-- locals
local COLOR_GREEN = "00ff00"
local COLOR_WHITE = "ffffff"
local COLOR_RED = "ff0000"
local COLOR_GREY = "aaaaaa"

local tablet = AceLibrary("Tablet-2.0")
local roster = nil
local healerChannel = nil
local healerList = nil

local syncName = {
	debuffGained = "BWLHDebuffGained"..module.revision,
	rotation = "BWLHRotation"..module.revision,
}

local icon = {
	debuff = "Spell_Shadow_AuraOfDarkness",
}

------------------------------
--      Initialization      --
------------------------------

function module:OnRegister()
	self:RegisterChatCommand({ L["slash_cmd"] }, {
		type = "group",
		args = {
			show = {
				type = "execute", name = L["tabletshow_cmd"],
				desc = L["tabletshow_desc"],
				func = function() self:ShowTablet() end,
			},
			hide = {
				type = "execute", name = L["tablethide_cmd"],
				desc = L["tablethide_desc"],
				func = function() self:HideTablet() end,
			},
			setchannel = {
				type = "text", name = L["setchannel_cmd"],
				desc = L["setchannel_desc"],
				set = function(v) self:SetChannel(v) end,
				get = false,
				usage = L["<channelname>"],
			},
			rotation = {
				type = "text", name = L["healerrotation_cmd"],
				desc = L["healerrotation_desc"],
				set = function(v)
				if IsRaidOfficer() or IsRaidLeader() then
					self:Sync(syncName.rotation.." "..v)
					SendChatMessage(string.format(L["[BWLH] Healing rotation: %s."], v), "RAID", nil, nil)
				end
				end,
				get = false,
				usage = L["<name1, name2, name3>"],
			},
		},
	})
end

-- called after module is enabled
function module:OnEnable()
	if not healerChannel then healerChannel = self.db.profile.healerChannel end
	if not healerChannel then
		self:Print(L["You are NOT in a healer channel. Please set one using /bwlh setchannel <channelname>."])
	else
		self:Print(string.format(L["Your announce channel is set to %s."], healerChannel))
	end
	healerList = {}
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	if not roster then roster = AceLibrary("RosterLib-2.0") end
	if table.getn(healerList) > 0 then
		for k, v in pairs(healerList) do
			v.healbotDebuffTimer = nil
		end
	end
	self:ShowTablet()
end

-- called after boss is engaged
function module:OnEngage()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("PLAYER_AURAS_CHANGED")
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisgengage()
	roster = nil
end

function module:OnDisable()
	self:HideTablet()
end

------------------------------
--      Event Handlers	    --
------------------------------

function module:PLAYER_AURAS_CHANGED(msg)
	local found = false
	local debuffnumber = 1
	while UnitDebuff("player", debuffnumber) do
		local arg1 = UnitDebuff("player", debuffnumber)
		if arg1 == "Interface\\Icons\\Spell_Shadow_AuraOfDarkness" then
			found = true
		end
		debuffnumber = debuffnumber + 1
	end
	if not found then return end
	self:UnregisterEvent("PLAYER_AURAS_CHANGED")
	self:Sync(syncName.debuffGained..UnitName("player").." "..UnitName("player"))
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
end

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, L["debuffLost"]) then
		self:RegisterEvent("PLAYER_AURAS_CHANGED")
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, boss) then
		self.core:ToggleModuleActive(self, false)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if string.find(sync, syncName.debuffGained) and rest then
		self:UpdateList(rest)
	elseif sync == syncName.rotation and rest then
		local healers = self:strsplit(",%s*", rest)
		self:CreateHealerList(healers)
		self:Print(string.format(L["Healing rotation broadcasted by %s."], nick))
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:UpdateList(name)
	local unit = nil
	for n, u in pairs(healerList) do
		if u.name == name then
		unit = u
		end
	end
	if unit == nil then return end
	if unit.name == UnitName("player") then
		self:Bar(L["bar_text"], 60, icon.debuff, true, "Red")
	end
	unit.healbotDebuffTimer = 60
	self:ScheduleRepeatingEvent("bwlhunitdebuff"..unit.name, self.DecrementCounter, 1, self, unit)
	if IsRaidLeader() or IsRaidOfficer() then
		self:SendMessages(unit)
	end
end

------------------------------
--      Tablet              --
------------------------------

function module:OnTooltipUpdate()
	if not tablet:IsRegistered("BigWigsLoathebHealers") then return end
	
	local cat = tablet:AddCategory(
		"columns", 3,
		"text", "#",
		"text2", L["Healer"],
		"text3", L["Timer"],
		"child_justify1", "LEFT",
		"child_justify2", "LEFT",
		"child_justify3", "RIGHT"
	)
	
	for number, healer in pairs(healerList) do
		local unitName = healer.name
		local statusLine = nil
		if unitName == UnitName("player") then unitName = "|cff"..COLOR_RED.."<<<"..unitName..">>>|r" end
		if UnitIsDeadOrGhost(healer.unitid) then
			statusLine = "|cff"..COLOR_GREY..L["Dead"].."|r"
		elseif not UnitIsConnected(healer.unitid) then
			statusLine = "|cff"..COLOR_GREY..L["Offline"].."|r"
		elseif healer.healbotDebuffTimer then
			statusLine = "|cff"..COLOR_RED..healer.healbotDebuffTimer.."|r"
		else
			statusLine = "|cff"..COLOR_GREEN..L["Ready"].."|r"
		end
		cat:AddLine("text", "|cff"..COLOR_WHITE..tostring(number).."|r",
					"text2", unitName,
					"text2R", RAID_CLASS_COLORS[healer.class].r,
					"text2G", RAID_CLASS_COLORS[healer.class].g,
					"text2B", RAID_CLASS_COLORS[healer.class].b,
					"text3", statusLine)
	end
	if IsRaidOfficer() or IsRaidLeader() then
		if table.getn(healerList) ~= 0 then
			local cat2 = tablet:AddCategory("columns", 1, "text", L["Commands"], "child_justify1", "CENTER")
			cat2:AddLine(
				"text", L["Print rotation to raidchat"],
				"func", function() self:PrintRotation() end)
		end
	end
	if table.getn(healerList) == 0 then
		local cat = tablet:AddCategory("columns", 1)
		cat:AddLine("text", L["Healing rotation not populated yet."])
	end
end

function module:ShowTablet()
	if not tablet:IsRegistered("BigWigsLoathebHealers") then
		tablet:Register("BigWigsLoathebHealers",
			"children",
				function()
					tablet:SetTitle(L["Loatheb Healers"])
					self:OnTooltipUpdate()
				end,
			"clickable", true,
			"showTitleWhenDetached", true,
			"showHintWhenDetached", true,
			"cantAttach", true
		)
	end
	
	if not self:IsEventScheduled("bwlhupdate") then
		self:ScheduleRepeatingEvent("bwlhupdate", function() tablet:Refresh("BigWigsLoathebHealers") end, 1)
	end
	
	if tablet:IsAttached("BigWigsLoathebHealers") then
		tablet:Detach("BigWigsLoathebHealers")
	end
end

function module:HideTablet()
	if not tablet:IsRegistered("BigWigsLoathebHealers") then return end
	self:CancelScheduledEvent("bwlhupdate")
	tablet:Attach("BigWigsLoathebHealers")
end

------------------------------
--      Roster              --
------------------------------

function module:CreateHealerList(table)
	healerList = {}
	for n, u in pairs(table) do
		if type(u) == "string" then u = roster:GetUnitObjectFromName(u) end
		if u and u.name and u.class ~= "PET" then
			tinsert(healerList, u)
			if not u.healbotDebuffTimer then
				u.healbotDebuffTimer = nil
			end
		end
	end
	if tablet:IsRegistered("BigWigsLoathebHealers") then
		tablet:Refresh("BigWigsLoathebHealers")
	end
	self:Print(L["Healer list refreshed."])
end

------------------------------
--      Messages            --
------------------------------

function module:PrintRotation()
	if table.getn(healerList) == 0 then return end
	local healers = ""
	for n, u in pairs(healerList) do
		healers = healers..", "..u.name
	end
	self:Sync(syncName.rotation.." "..healers)
	SendChatMessage(string.format(L["[BWLH] Healing rotation: %s."], healers), "RAID", nil, nil)
end

function module:SetChannel(channelName)
	self.db.profile.healerChannel = channelName
	healerChannel = channelName
end

------------------------------
--      Utility	Functions   --
------------------------------

-- Ninjaed from lua-users.org
function module:strsplit(delimiter, text)
	local list = {}
	local pos = 1
	if strfind("", delimiter, 1) then -- this would result in endless loops
		self.error("delimiter matches empty string!")
	end
	while 1 do
		local first, last = strfind(text, delimiter, pos)
		if first then -- found?
			tinsert(list, strsub(text, pos, first-1))
			pos = last+1
		else
			tinsert(list, strsub(text, pos))
			break
		end
	end
	return list
end

function module:DecrementCounter(unit)
	if unit.healbotDebuffTimer == nil or tonumber(unit.healbotDebuffTimer) == nil then return end
	unit.healbotDebuffTimer = unit.healbotDebuffTimer - 1
	if unit.healbotDebuffTimer <= 0 then
		unit.healbotDebuffTimer = nil
		self:CancelScheduledEvent("bwhaunitdebuff"..unit.name)
	end
end

function module:SendMessages(unit)
	local position = nil
	local nextHealer = nil
	local nextNextHealer = nil
	for k, v in pairs(healerList) do
		if v == unit then
			position = k
		end
	end
	if table.getn(healerList) < 3 then return end
	if position < table.getn(healerList) then
		nextHealer = healerList[position+1]
		if position + 1 < table.getn(healerList) then
			nextNextHealer = healerList[position+2]
		else
			nextNextHealer = healerList[1]
		end
	else
		nextHealer = healerList[1]
		nextNextHealer = healerList[2]
	end
	
	if not self.db.profile.notwhisper then
		self:TriggerEvent("BigWigs_SendTell", nextHealer.name, L["Heal now!"])
		self:TriggerEvent("BigWigs_SendTell", nextNextHealer.name, L["Get ready!"])
	end
	
	if not self.db.profile.healnotify and healerChannel then
		local id, name = GetChannelName(healerChannel)
		if name then
			SendChatMessage(string.format(L["%s healed - %s is next!"], unit.name, nextHealer.name), "CHANNEL", nil, id)
		else
			self:Print(string.format(L["The channel %s was not found, please set a healer channel with /bwlh setchannel <channelname>."], healerChannel))
		end
	end
end