--[[
--
-- BigWigs Strategy Module for Thaddius in Naxxramas.
--
-- Adds graphical, textual and sound warnings for what direction
-- you should move in when you get a polarity debuff in phase 2.
--
-- See readme.txt for more info
-- Many thanks to rabbit for all the help.
--
-- TODO
--  - Fix strategy broadcasting across multiple locales.
--
--]]

------------------------------
--      Are you local?      --
------------------------------

local myname = "塔迪乌斯策略"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..myname)
local BZ = AceLibrary("Babble-Zone-2.2")
local boss = AceLibrary("Babble-Boss-2.2")["Thaddius"]
local TL = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local feugen = AceLibrary("Babble-Boss-2.2")["Feugen"]
local stalagg = AceLibrary("Babble-Boss-2.2")["Stalagg"]

-- Known strategies, values are the index in the L["strat_validate"] table.
-- Make sure to update the error checks in OnEnable if adding/removing
-- strategies.
local stratCircularLR, stratCircularRL, stratThrough, fourStates

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "ThaddiusArrows",

	graphic_cmd = "garrows",
	graphic_name = "Graphical Arrows",
	graphic_desc = "Display Graphical Arrows",

	text_cmd = "tarrows",
	text_name = "Text Arrows",
	text_desc = "Display Text Arrows",

	sound_cmd = "sarrows",
	sound_name = "Sound Effects",
	sound_desc = "Play Direction Sound Effects",

	strat_cmd = "strat",
	strat_name = "Strategy",
	strat_desc = "Pick the strategy to use for moving",
	strat_validate = { "Circular, L/R", "Circular, R/L", "Run Through", "Four States" },

	setstrategy_cmd = "bwtabc",
	setstrategy_name = "Broadcast strategy",
	setstrategy_desc = "Broadcasts your current strategy to the raid",

	["Thaddius strategy is set to "] = true,
	["Make sure everyone in the raid has the same strategy set!"] = true,
	["Invalid Thaddius strategy, resetting to default."] = true,
	["You can run the command /bwtabc to broadcast your strategy and force your raid to use it."] = true,
	["You can't broadcast the strategy if you are not the leader or promoted in the raid group."] = true,
	["Broadcasting strategy ..."] = true,
	["Strategy broadcast detected from %s. Strategy set to %s."] = true,
	["Invalid Thaddius strategy received from %s."] = true,

	soundleft = "Interface\\AddOns\\BigWigs\\Sounds\\GoLeftUS.wav",
	soundright = "Interface\\AddOns\\BigWigs\\Sounds\\GoRightUS.wav",
	soundacross = "Interface\\AddOns\\BigWigs\\Sounds\\SwitchSidesUS.wav",

	warnleft = "<----  GO LEFT  <---- GO LEFT <----",
	warnright = "---->  GO RIGHT  ----> GO RIGHT ---->",
	warnacross = "^^^^ SWITCH SIDES ^^^^ SWITCH SIDES ^^^^",
	
} end )

L:RegisterTranslations("zhCN", function() return {
	graphic_name = "图形箭头",
	graphic_desc = "显示图形箭头",

	text_name = "箭头文本",
	text_desc = "显示箭头文本",

	sound_name = "音效",
	sound_desc = "播放方向音效",

	strat_name = "策略",
	strat_desc = "选择用于移动的策略",
	strat_validate = { "圆环循环, 左/右", "圆环循环, 右/左", "跑穿Boss" , "四象跑法" },

	setstrategy_name = "广播策略",
	setstrategy_desc = "广播你的当前的策略到团队聊天",

	["Thaddius strategy is set to "] = "塔迪乌斯策略设置到 ",
	["Make sure everyone in the raid has the same strategy set!"] = "确保RAID中的每个人都有相同的策略设置!",
	["Invalid Thaddius strategy, resetting to default."] = "无效的塔迪乌斯的策略, 重新设置为默认.",
	["You can run the command /bwtabc to broadcast your strategy and force your raid to use it."] = "你可以输入命令 /bwtabc 广播你的策略并强迫你的RAID使用它.",
	["You can't broadcast the strategy if you are not the leader or promoted in the raid group."] = "如果你不是RAID团队的领导者或有A者，你就不能广播这个策略。",
	["Broadcasting strategy ..."] = "广播策略中 ...",
	["Strategy broadcast detected from %s. Strategy set to %s."] = "从 %s 检测到策略广播. 策略设置到 %s.",
	["Invalid Thaddius strategy received from %s."] = "收到了 %s 无效的塔迪乌斯的策略",

    soundleft = "Interface\\AddOns\\BigWigs\\Sounds\\GoLeftUS.wav",
	soundright = "Interface\\AddOns\\BigWigs\\Sounds\\GoRightUS.wav",
	soundacross = "Interface\\AddOns\\BigWigs\\Sounds\\SwitchSidesUS.wav",

	warnleft = "<----  左跑  <---- 往左跑 <----",
	warnright = "---->  右跑  ----> 往右跑 ---->",
	warnacross = "^^^^ 换边 ^^^^ 两边对换 ^^^^",
	
} end )

L:RegisterTranslations("deDE", function() return {
	graphic_name = "Grafiksymbole",
	graphic_desc = "Anzeigen der Grafiksymbole",

	text_name = "Textausgabe",
	text_desc = "Anzeige der Textausgabe",

	sound_name = "Soundausgabe",
	sound_desc = "Abspielen einer Soundausgabe",

	strat_name = "Strategie",
	strat_desc = "W\195\164hle die Laufstrategie aus",
	strat_validate = { "Kreisf\195\182rmig , L/R", "Kreisf\195\182rmig , R/L", "Durch laufen", "Vier Punkte" },

	setstrategy_name = "Strategie verteilen",
	setstrategy_desc = "Jetzige Strategie auf die Schlachtgruppe verteilen",

	["Thaddius strategy is set to "] = "Thaddius Strategie wurde ge\195\164ndert auf ",
	["Make sure everyone in the raid has the same strategy set!"] = "Stellt sicher das jeder in der Schlachtgruppe die selbe Strategie eingestellt hat!",
	["Invalid Thaddius strategy, resetting to default."] = "Ung\195\188ltige Thaddius Strategie, Strategie wurde auf Standard gesetzt.",
	["You can run the command /bwtabc to broadcast your strategy and force your raid to use it."] = "Du kannst /bwtabc benutzen um deine Strategie auf die Schlachtgruppe zu verteilen",
	["You can't broadcast the strategy if you are not the leader or promoted in the raid group."] = "Du kannst keine Strategie verteilen solange du nicht Schlachtgruppenleiter oder dazu berechtigt bist.",
	["Broadcasting strategy ..."] = "Strategie wird verteilt ...",
	["Strategy broadcast detected from %s. Strategy set to %s."] = "Strategieverteilung von %s erkannt. Strategie wurde auf [%s] gesetzt",
	["Invalid Thaddius strategy received from %s."] = "Ung\195\188ltige Thaddius Strategie von %s erhalten.",

	soundleft = "Interface\\AddOns\\BigWigs\\Sounds\\GoLeftDE.wav",
	soundright = "Interface\\AddOns\\BigWigs\\Sounds\\GoRightDE.wav",
	soundacross = "Interface\\AddOns\\BigWigs\\Sounds\\sounds\\SwitchSidesDE.wav",

	warnleft   = "<----  Geh Links  <---- Geh Links <----",
	warnright  = "---->  Geh Rechts  ----> Geh Rechts ---->",
	warnacross = "^^^^ Seitenwechseln ^^^^ Seitenwechseln ^^^^",

} end )


----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsThaddiusArrows = BigWigs:NewModule(myname, "AceConsole-2.0")
BigWigsThaddiusArrows.synctoken = myname
BigWigsThaddiusArrows.zonename = BZ["Naxxramas"]
BigWigsThaddiusArrows.enabletrigger = { boss, feugen, stalagg }
BigWigsThaddiusArrows.toggleoptions = { "strat", -1, "graphic", "text", "sound" }
BigWigsThaddiusArrows.revision = tonumber(string.sub("$Revision: 23229 $", 12, -3))
BigWigsThaddiusArrows.external = true

BigWigsThaddiusArrows.strat_four_states =
{
	[1] = {
		change = { direction = "Right", state = 3 },
		nochange = { direction = "Left", state = 2 },
	},
	[2] = {
		change = { direction = "Left", state = 4 },
		nochange = { direction = "Right", state = 1 },
	},
	[3] = {
		change = { direction = "Left", state = 1 },
		nochange = { direction = "Right", state = 4 },
	},
	[4] = {
		change = { direction = "Right", state = 2 },
		nochange = { direction = "Left", state = 3 },
	},
}

------------------------------
--      Initialization      --
------------------------------

function BigWigsThaddiusArrows:OnRegister()
	self.frameArrow = CreateFrame("Frame", nil, UIParent)
	self.texArrow = self.frameArrow:CreateTexture(nil, "BACKGROUND")
	-- Create the frame we will be using for the Arrow
	self.frameArrow:SetFrameStrata("MEDIUM")
	self.frameArrow:SetWidth(200)  -- Set These to whatever height/width is needed 
	self.frameArrow:SetHeight(200) -- for your Texture
	-- Apply Texture
	self.texArrow:SetTexture("Interface\\AddOns\\BigWigs\\Textures\\arrow")	
	self.texArrow:SetAllPoints(self.frameArrow)
	self.frameArrow:SetAlpha(0.6)
	self.frameArrow:Hide()

	self.framestraightArrow = CreateFrame("Frame", nil, UIParent)
	self.texstraightArrow = self.framestraightArrow:CreateTexture(nil, "BACKGROUND")
	-- Create the frame we will be using for the Arrow
	self.framestraightArrow:SetFrameStrata("MEDIUM")
	self.framestraightArrow:SetWidth(200)  -- Set These to whatever height/width is needed 
	self.framestraightArrow:SetHeight(200) -- for your Texture
	-- Apply Texture
	self.texstraightArrow:SetTexture("Interface\\AddOns\\BigWigs\\Textures\\straightArrow")	
	self.texstraightArrow:SetAllPoints(self.framestraightArrow)
	self.framestraightArrow:SetAlpha(0.6)
	self.framestraightArrow:Hide()

	self:RegisterChatCommand({ "/"..L["setstrategy_cmd"] }, {
		type = "execute",
		name = L["setstrategy_name"],
		desc = L["setstrategy_desc"],
		func = function() self:BroadCastStrategy() end,
	})
end

function BigWigsThaddiusArrows:OnEnable()
	self.previousCharge = nil
	self.strat_four_current = 1

	local strategies = L["strat_validate"]
	if not strategies or not type(strategies) == "table" then
		error("Strategy table is not a table in BigWigs_ThaddiusArrows.")
		return
	end
	local count = 0
	for k in pairs(strategies) do
		count = count + 1
	end
	if count ~= 4 then
		error("Strategy table is invalid in BigWigs_ThaddiusArrows.")
		return
	end

	stratCircularLR = strategies[1]
	stratCircularRL = strategies[2]
	stratThrough = strategies[3]
	fourStates = strategies[4]

	local found = false
	for k, v in pairs(strategies) do
		if v == self.db.profile.strat then
			found = true
			break
		end
	end
	if not found or not self.db.profile.strat or type(self.db.profile.strat) ~= "string" then
		self:Print(L["Invalid Thaddius strategy, resetting to default."])
		self.db.profile.strat = stratCircularLR
	end

	self:Print(L["Thaddius strategy is set to "]..self.db.profile.strat)
	self:Print(L["Make sure everyone in the raid has the same strategy set!"])
	if IsRaidLeader() or IsRaidOfficer() then
		self:Print(L["You can run the command /bwtabc to broadcast your strategy and force your raid to use it."])
	end

	-- Events
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("BigWigs_Message")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "ThaddiusArrowsStrategy", 2)
end

function BigWigsThaddiusArrows:OnDisable()
	if self.frameArrow then self.frameArrow:Hide() end
	if self.framestraightArrow then self.framestraightArrow:Hide() end
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsThaddiusArrows:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, boss) then
		self.core:ToggleModuleActive(self, false)
	end
end

function BigWigsThaddiusArrows:BroadCastStrategy()
	if not IsRaidLeader() and not IsRaidOfficer() then
		self:Print(L["You can't broadcast the strategy if you are not the leader or promoted in the raid group."])
		return
	end

	-- Find our strategy
	local found = nil
	for i, v in ipairs(L["strat_validate"]) do
		if v == self.db.profile.strat then
			found = i
			break
		end
	end
	if found == nil then return end

	self:Print(L["Broadcasting strategy ..."])
	self:TriggerEvent("BigWigs_SendSync", "ThaddiusArrowsStrategy "..found)
end

function BigWigsThaddiusArrows:BigWigs_RecvSync( sync, rest, nick )
	if sync ~= "ThaddiusArrowsStrategy" or not rest or not nick then return end
	if self.db.profile.strat == rest then return end

	-- Old style broadcast with name of strategy.
	if tonumber(rest) == nil then
		local found = nil
		for i, v in ipairs(L["strat_validate"]) do
			if v == rest then
				found = true
				break
			end
		end
		if found then
			self.db.profile.strat = rest
			self:Print(string.format(L["Strategy broadcast detected from %s. Strategy set to %s."], nick, rest))
			return
		else
			self:Print(string.format(L["Invalid Thaddius strategy received from %s."], nick))
			return
		end
	else
		rest = tonumber(rest)
		local count = 0
		for i, v in ipairs(L["strat_validate"]) do
			count = count + 1
		end
		if rest > count or rest < 1 then
			self:Print(string.format(L["Invalid Thaddius strategy received from %s."], nick))
			return
		else
			self.db.profile.strat = L["strat_validate"][rest]
			self:Print(string.format(L["Strategy broadcast detected from %s. Strategy set to %s."], nick, L["strat_validate"][rest]))
			return
		end
	end
end

function BigWigsThaddiusArrows:PLAYER_REGEN_ENABLED()
	local go = BigWigsThaddius:Scan()
	local running = self:IsEventScheduled("ThaddiusArrows_CheckWipe")
	if not go then
		self:TriggerEvent("BigWigs_RebootModule", self)
	elseif not running then
		self:ScheduleRepeatingEvent("ThaddiusArrows_CheckWipe", self.PLAYER_REGEN_ENABLED, 2, self)
	end
end

function BigWigsThaddiusArrows:Direction( direction )
	if direction == "Left" then -- Left Arrow
		if self.db.profile.graphic then
			self.frameArrow.texture = self.texArrow
			self.texArrow:SetTexCoord(0, 1, 0, 1)
			self.frameArrow:SetPoint("CENTER", -250, 100)
			self.frameArrow:Show()
			self:ScheduleEvent(function() self.frameArrow:Hide() end, 4)
		end
		if self.db.profile.sound then
			PlaySoundFile(L["soundleft"])
		end
		if self.db.profile.text then
			self:TriggerEvent("BigWigs_Message", L["warnleft"], "Red", true)
		end
	elseif direction == "Right" then -- Right Arrow
		if self.db.profile.graphic then
			self.frameArrow.texture = self.texArrow
			self.texArrow:SetTexCoord(1, 0, 0, 1)
			self.frameArrow:SetPoint("CENTER", 250, 100)
			self.frameArrow:Show()
			self:ScheduleEvent(function() self.frameArrow:Hide() end, 4)
		end
		if self.db.profile.sound then
			PlaySoundFile(L["soundright"])
		end
		if self.db.profile.text then
			self:TriggerEvent("BigWigs_Message", L["warnright"], "Red", true)
		end
	elseif direction == "Across" then -- Switch Sides
		if self.db.profile.graphic then
			self.framestraightArrow.texture = self.texstraightArrow
			self.texstraightArrow:SetTexCoord(0, 1, 0, 1)
			self.framestraightArrow:SetPoint("CENTER", 0, 200)
			self.framestraightArrow:Show()
			self:ScheduleEvent(function() self.framestraightArrow:Hide() end, 4)
		end
		if self.db.profile.sound then
			PlaySoundFile(L["soundacross"])
		end
		if self.db.profile.text then
			self:TriggerEvent("BigWigs_Message", L["warnacross"], "Red", true)
		end
	end
end

function BigWigsThaddiusArrows:BigWigs_Message( msg )
	local strat = self.db.profile.strat
	if msg == TL["nochange"] then
		if strat == stratCircularLR then
			self:Direction("Left")
		elseif strat == stratCircularRL then
			self:Direction("Right")
		elseif strat == fourStates then
			self:Direction(self.strat_four_states[self.strat_four_current].nochange.direction)
			self.strat_four_current = self.strat_four_states[self.strat_four_current].nochange.state
		end
		self.previousCharge = msg
	elseif msg == TL["poswarn"] or msg == TL["negwarn"] then
		if self.previousCharge then
			if strat == stratCircularLR then
				self:Direction("Right")
			elseif strat == stratThrough then
				self:Direction("Across")
			elseif strat == stratCircularRL then
				self:Direction("Left")
			elseif strat == fourStates then
				self:Direction(self.strat_four_states[self.strat_four_current].change.direction)
				self.strat_four_current = self.strat_four_states[self.strat_four_current].change.state
			end
		else
			-- First charge
			if msg == TL["poswarn"] then
				if strat == stratCircularLR then
					self:Direction("Left")
				elseif strat == stratCircularRL then
					self:Direction("Right")
				elseif strat == fourStates then
					self:Direction("Right")
					self.strat_four_current = 3
				end
			elseif msg == TL["negwarn"] then
				if strat == stratCircularLR then
					self:Direction("Right")
				elseif strat == stratCircularRL then
					self:Direction("Left")
				elseif strat == stratThrough then
					self:Direction("Across")
				elseif strat == fourStates then
					self:Direction("Left")
					self.strat_four_current = 2
				end
			end
		end
		self.previousCharge = msg
	end
end

