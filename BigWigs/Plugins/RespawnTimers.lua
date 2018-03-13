----------------------------------
--      Locals                  --
----------------------------------

local name = "Respawn Timers"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..name)

-- packNumber is basically just a counter for the mob types, so that when one
-- mob of a type dies, its counter is increased by 1 so that we have some way of
-- telling mobs apart. It will never reset outside of a reload UI or relog.
local packNumber = nil

-- We throttle the deaths of each mob type by 60 seconds by default, so that if
-- 2 mobs of the same type die within 60 seconds of eachother, you'll only get 1
-- respawn timer for them, that starts at the kill of the first one. This was
-- added mostly for core hound packs in MC.
local deathThrottle = nil

----------------------------------
--      Localization            --
----------------------------------
L:RegisterTranslations("zhCN", function() return {
	["respawntimers"] = "respawntimers",
	["Respawn Timers"] = "怪物刷新时间",
	["Respawn timer bars and warnings for trash mobs."] = "重生的计时条和警告小怪.",
	["bars"] = "计时条",
	["Bars"] = "计时条",
	["Toggles showing bars for respawn times."] = "切换显示怪物刷新时间条.",
	["messages"] = "消息",
	["Messages"] = "发送消息",
	["Toggles showing messages for respawn times."] = "是否显示为重生消息.",

	["%s %d respawns in %d sec"] = "%s %d 刷新 %d 秒",
	["%s %d respawned!"] = "%s %d 刷新!",
	["Respawn: %s %d"] = "刷新: %s %d",

	-- Molten Core Triggers
	["Ancient Core Hound"] = "上古熔火恶犬",
	["Lava Annihilator"] = "熔岩歼灭者",
	["Lava Surger"] = "熔岩奔腾者",
	["Firelord"] = "火焰之王",
	["Firewalker"] = "火焰行者", -- Lava Pack
	["%s collapses and begins to smolder."] = "%s collapses and begins to smolder.", -- Hound Pack, emote.
	-- Molten Core Messages
	["Corehound"] = "\231\134\148\231\129\171\230\129\182\231\138\172",
	["Annihilator"] = "\230\173\188\231\129\173\232\128\133",
	["Surger"] = "\229\165\148\232\133\190\232\128\133",
	-- Firelord == Firelord.
	["Lavapack"] = "\231\134\148\229\178\169\231\190\164",
	["Houndpack"] = "\230\129\182\231\138\172\231\190\164",

	-- AQ Triggers
	["Obsidian Eradicator"] = "黑曜石清除者",
	["Anubisath Sentinel"] = "阿努比萨斯哨兵",
	-- AQ Messages
	["Eradicator"] = "黑曜石清除者",
	["Sentinel"] = "阿努比萨斯哨兵",

	-- BWL Triggers
	["Death Talon Hatcher"] = "死爪地卜师",
	["Blackwing Taskmaster"] = "黑翼工头",
	-- BWL Messages
	["Death Talon"] = "地卜师",
	["Taskmaster"] = "工头",

} end )

L:RegisterTranslations("deDE", function() return {
	["respawntimers"] = "respawntimers",
	["Respawn Timers"] = "Respawn Timer",
	["Respawn timer bars and warnings for trash mobs."] = "Respawn Timerbalken und Warnungen für Trashmobs",
	["bars"] = "bars",
	["Bars"] = "Balken",
	["Toggles showing bars for respawn times."] = "Zeige Balken",
	["messages"] = "messages",
	["Messages"] = "Warnungen",
	["Toggles showing messages for respawn times."] = "Sende Warnungen",

	["%s %d respawns in %d sec"] = "%s %d respawnt in %d Sekunden",
	["%s %d respawned!"] = "%s %s respawnt",
	["Respawn: %s %d"] = "Respawn: %s %d",

	-- Molten Core Triggers
	["Ancient Core Hound"] = "Uralter Kernhund",
	["Lava Annihilator"] = "Lavavernichter",
	["Lava Surger"] = "Lavawoger",
	["Firelord"] = "Feuerlord",
	["Firewalker"] = "Feuergänger", -- Lava Pack
	["%s collapses and begins to smolder."] = "%s bricht zusammen und beginnt zu glimmen.", -- Hound Pack, emote.
	-- Molten Core Messages
	["Corehound"] =  "Kernhund",
	["Annihilator"] = "Vernichter",
	["Surger"] = "Woger",
	-- Firelord == Firelord.
	["Lavapack"] = "Lavapack",
	["Houndpack"] = "Kernhundpack",

	-- AQ Triggers
	["Obsidian Eradicator"] = "Obsidianzerstörer",
	["Anubisath Sentinel"] = "Wächter des Anubisath",
	-- AQ Messages
	["Eradicator"] = "Zerstörer",
	["Sentinel"] = "Wächter",

	-- BWL Triggers
	["Death Talon Hatcher"] = "Brutwächter der Todeskrallen",
	["Blackwing Taskmaster"] = "Zuchtmeister der Pechschwingen",
	-- BWL Messages
	["Death Talon"] = "Brutwächter",
	["Taskmaster"] = "Zuchtmeister",
} end )

-- The death table and emote table are basically the meat of this addon. The
-- first string is what we search for in the responding chat event, the table
-- that is attached to it is: 1. respawn time in seconds, 2. the bar text and
-- message text for the respawn timer, 3. optional icon path for this timer.
local deathTable = {
	-- MC
	-- [L["Ancient Core Hound"]] = {1080, L["Corehound"], nil},
	-- [L["Lava Annihilator"]]   = {7200, L["Annihilator"], nil},
	-- [L["Lava Surger"]]        = {1620, L["Surger"], nil},
	-- [L["Firelord"]]           = {7200, L["Firelord"], nil},
	-- [L["Firewalker"]]         = {7200, L["Lavapack"], nil},
	-- AQ
	[L["Obsidian Eradicator"]] = {1800, L["Eradicator"], nil},
	[L["Anubisath Sentinel"]]  = {1800, L["Sentinel"], nil},
	-- BWL
	[L["Death Talon Hatcher"]]  = {720, L["Death Talon"], nil},
	[L["Blackwing Taskmaster"]] = {720, L["Taskmaster"], nil},
}
local emoteTable = {
	-- MC
	[L["%s collapses and begins to smolder."]] = {3600, L["Houndpack"], nil},
}

----------------------------------
--  Addon Declaration           --
----------------------------------

BigWigsRespawnTimers = BigWigs:NewModule(name)
BigWigsRespawnTimers.defaultDB = {
	bars = false,
	messages = false,
}

BigWigsRespawnTimers.consoleCmd = L["respawntimers"]
BigWigsRespawnTimers.consoleOptions = {
	type = "group",
	name = L["Respawn Timers"],
	desc = L["Respawn timer bars and warnings for trash mobs."],
	args   = {
		[L["bars"]] = {
			type = "toggle",
			name = L["Bars"],
			desc = L["Toggles showing bars for respawn times."],
			get = function() return BigWigsRespawnTimers.db.profile.bars end,
			set = function(v) BigWigsRespawnTimers.db.profile.bars = v end,
		},
		[L["messages"]] = {
			type = "toggle",
			name = L["Messages"],
			desc = L["Toggles showing messages for respawn times."],
			get = function() return BigWigsRespawnTimers.db.profile.messages end,
			set = function(v) BigWigsRespawnTimers.db.profile.messages = v end,
		},
	}
}
BigWigsRespawnTimers.revision = tonumber(string.sub("$Revision: 17260 $", 12, -3))
BigWigsRespawnTimers.external = true

----------------------------------
--      Initialization          --
----------------------------------

function BigWigsRespawnTimers:OnEnable()
	packNumber = {}
	deathThrottle = {}
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
end

----------------------------------
--      Events                  --
----------------------------------

-- Basically just loop the corresponding mob table and check if the event
-- arguments (death or emote) matches anything we've registered. If so, trigger
-- a respawn timer.

function BigWigsRespawnTimers:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	for key, table in pairs(deathTable) do
		if msg == string.format(UNITDIESOTHER, key) then
			self:StartRespawnTimer(table[2], table[1], table[3])
			break
		end
	end
end

function BigWigsRespawnTimers:CHAT_MSG_MONSTER_EMOTE(msg)
	for key, table in pairs(emoteTable) do
		if msg == key then
			self:StartRespawnTimer(table[2], table[1], table[3])
			break
		end
	end
end

----------------------------------
--    Utility                   --
----------------------------------

function BigWigsRespawnTimers:StartRespawnTimer(message, timer, icon, throttle)
	timer = tonumber(timer)
	if timer == nil then return end

	-- Throttle deaths by 60 seconds.
	if deathThrottle[message] and (deathThrottle[message] + 60) > GetTime() then return end
	deathThrottle[message] = GetTime()

	-- Increment the pack counter after all arguments are checked and we're sure
	-- to start a new respawn timer.
	if not packNumber[message] then packNumber[message] = 0 end
	local nextPack = packNumber[message] + 1
	packNumber[message] = nextPack

	-- Make sure the user wants respawn messages.
	if self.db.profile.messages then
		self:ScheduleEvent("bwrt"..nextPack.."10secwarn", "BigWigs_Message", timer - 10, string.format(L["%s %d respawns in %d sec"], message, nextPack, 10), "Yellow")
		self:ScheduleEvent("bwrt"..nextPack.."respawned", "BigWigs_Message", timer, string.format(L["%s %d respawned!"], message, nextPack), "Orange")
	end

	-- Make sure the user wants respawn timer bars.
	if self.db.profile.bars then
		-- Default icon.
		if not icon then icon = "Interface\\Icons\\INV_Misc_Head_Dragon_01" end
		local text = string.format(L["Respawn: %s %d"], message, nextPack)
		self:TriggerEvent("BigWigs_StartBar", self, text, timer, icon)
		self:SetCandyBarOnClick("BigWigsBar "..text, function()
			if IsControlKeyDown() then
				self:TriggerEvent("BigWigs_StopBar", self, text)
				self:CancelScheduledEvent("bwrt"..nextPack.."10secwarn")
				self:CancelScheduledEvent("bwrt"..nextPack.."respawned")
			end
		end)
	end
end
