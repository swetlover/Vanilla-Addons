
assert( BigWigs, "BigWigs not found!")


------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsCombatLog")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	["CombatLog"] = "战斗日志",
	["combatlog"] = "combatlog",
    ["Plugin options"] = "插件选项",
	["Options for the combatlog plugin."] = "战斗日志插件的选项。",
	["Activate Plugin"] = "启用插件",
	["Activates the plugin to log events."] = "激活插件的日志事件",
	["Status"] = "状态",
	["Show the status of this plugin."] = "显示这插件的状态.",
	["Save"] = "保存",
	["Save the logs."] = "保存日志",
	["Clear"] = "清除",
	["Clear the logs."] = "清除日志",
} end)

L:RegisterTranslations("deDE", function() return {

} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsCombatLog = BigWigs:NewModule(L["CombatLog"])
BigWigsCombatLog.revision = 20010
BigWigsCombatLog.defaultDB = {
	log = {},
	filterLog = {},
	active = false,
}
BigWigsCombatLog.consoleCmd = L["combatlog"]

BigWigsCombatLog.consoleOptions = {
	type = "group",
	name = L["CombatLog"],
	desc = L["Plugin options"],
	args   = {
		anchor = {
			type = "toggle",
			name = L["Activate Plugin"],
			desc = L["Activates the plugin to log events."],
            order = 1,
			get = function() return BigWigsCombatLog.db.profile.active end,
			set = function(v)
					if v then
						BigWigsCombatLog:Start()
					else 
						BigWigsCombatLog:Stop()
					end
				end,
		},
		status = {
			type = "execute",
			name = L["Status"],
			desc = L["Show the status of this plugin."],
			order = 2,
			func = function() BigWigsCombatLog:Status() end,
		},
		save = {
			type = "execute",
			name = L["Save"],
			desc = L["Save the logs."],
			order = 3,
			func = function() BigWigsCombatLog:Save() end,
		},
		clear = {
			type = "execute",
			name = L["Clear"],
			desc = L["Clear the logs."],
			order = 4,
			func = function() BigWigsCombatLog:Clear() end,
		},
	},
}

local Events = {
	"CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS",
	"CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES",
	"CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS",
	"CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES",
	"CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS",
	"CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES",
	"CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS",
	"CHAT_MSG_COMBAT_FRIENDLYPLAYER_MISSES",
	"CHAT_MSG_COMBAT_HONOR_GAIN",
	"CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS",
	"CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES",
	"CHAT_MSG_COMBAT_LOG_ERROR",
	"CHAT_MSG_COMBAT_LOG_MISC_INFO",
	"CHAT_MSG_COMBAT_MISC_INFO",
	"CHAT_MSG_COMBAT_PARTY_HITS",
	"CHAT_MSG_COMBAT_PARTY_MISSES",
	"CHAT_MSG_COMBAT_PET_HITS",
	"CHAT_MSG_COMBAT_PET_MISSES",
	"CHAT_MSG_COMBAT_SELF_HITS",
	"CHAT_MSG_COMBAT_SELF_MISSES",
	"CHAT_MSG_COMBAT_FRIENDLY_DEATH",
	"CHAT_MSG_COMBAT_HOSTILE_DEATH",
	"CHAT_MSG_SPELL_AURA_GONE_OTHER",
	"CHAT_MSG_SPELL_AURA_GONE_PARTY",
	"CHAT_MSG_SPELL_AURA_GONE_SELF",
	"CHAT_MSG_SPELL_BREAK_AURA",
	"CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF",
	"CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE",
	"CHAT_MSG_SPELL_CREATURE_VS_PARTY_BUFF",
	"CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE",
	"CHAT_MSG_SPELL_CREATURE_VS_SELF_BUFF",
	"CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE",
	"CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS",
	"CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF",
	"CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF",
	"CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE",
	"CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF",
	"CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
	"CHAT_MSG_SPELL_PARTY_BUFF",
	"CHAT_MSG_SPELL_PARTY_DAMAGE",
	"CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS",
	"CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE",
	"CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS",
	"CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE",
	"CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS",
	"CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE",
	"CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS",
	"CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE",
	"CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS",
	"CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",
	"CHAT_MSG_SPELL_PET_BUFF",
	"CHAT_MSG_SPELL_PET_DAMAGE",
	"CHAT_MSG_SPELL_SELF_BUFF",
	"CHAT_MSG_SPELL_SELF_DAMAGE",
	
	"LOOT_OPENED",
	"MINIMAP_ZONE_CHANGED",
	"PLAYER_AURAS_CHANGED",
    
    "SPELLCAST_START",
	"SPELLCAST_CHANNEL_START",
	"SPELLCAST_STOP",
	"SPELLCAST_FAILED",
	"SPELLCAST_INTERRUPTED",

	"SPELLS_CHANGED", 

	--"UNIT_AURA",
	"UNIT_AURASTATE",
	"UNIT_SPELLMISS",
	
	"CHAT_MSG_RAID_BOSS_EMOTE",
	"CHAT_MSG_MONSTER_EMOTE",
	"CHAT_MSG_MONSTER_YELL",
}

local startTime = GetTime()
local combatLog = {}
local filterCombatLog = {}
local nFights = 0
local nEntries = 0
local nFilterEntries = 0
local filter = {}

------------------------------
--      Initialization      --
------------------------------

function BigWigsCombatLog:OnEnable()
    self:RegisterEvent("BigWigs_RecvSync")
    
    if self.db and self.db.profile.active then
        self:ScheduleEvent("BigWigsCombatLogEnable", self.Start, 5, self)
    else
        self:ScheduleEvent("BigWigsCombatLogEnable", self.DelayedEnable, 5, self)
    end
end

function BigWigsCombatLog:DelayedEnable()
    if self.db and self.db.profile.active then
        --self:ScheduleEvent("BigWigsCombatLogEnable", self.Start, 5, self)
        self.Start()
    end
end


------------------------------
--      Event Handlers      --
------------------------------

function BigWigsCombatLog:Start()
	for k, event in pairs(Events) do 
        self:RegisterEvent(event, "EventHandler")
    end
    self:RegisterEvent("PLAYER_REGEN_DISABLED", "Save")
    self:RegisterEvent("PLAYER_REGEN_ENABLED", "Save")
	
	self.db.profile.active = true
	
    BigWigs:Print("BigWigsCombatLog started")
end

function BigWigsCombatLog:Stop()
    for k, event in pairs(Events) do 
        self:UnregisterEvent(event)
    end
	
	self.db.profile.active = false
	
    --self:UnregisterAllEvents()    
    --self:RegisterEvent("PLAYER_REGEN_DISABLED", "Save")
    BigWigs:Print("BigWigsCombatLog stopped")
end

function BigWigsCombatLog:Status()
	local status
	if self.db.profile.active then
		status = "active"
	else 
		status = "not active"
	end
	BigWigs:Print("BigWigsCombatLog 状态: " .. status)
end

function BigWigsCombatLog:EventHandler()
    if event then
        if not arg1 then
            arg1 = "no msg"
        end
        
		local eventTime = (GetTime() - startTime)
		
		-- add to log
		entry = {
            ["time"] = eventTime,
            ["event"] = event,
            ["msg"] = arg1
        }
        nEntries = nEntries + 1
        table.insert(combatLog, nEntries, entry)
		
        -- Filter
        for key, value in pairs(filter) do 
            --BigWigs:Print("key: " .. key .. ", value: " .. value)
            if string.find(arg1, value) then
                BigWigs:Print(eventTime .. " [" .. event .. "]: " .. arg1) 
				table.insert(filterCombatLog, nEntries, entry)
            end
        end        
	end
end
function BigWigsCombatLog:Save()
    startTime = GetTime()
    nFights = nFights + 1
	
	-- save
    table.insert(self.db.profile.log, nFights, combatLog)
	table.insert(self.db.profile.filterLog, nFights, filterCombatLog)
    
	BigWigs:Print("BigWigsCombatLog saved")
    
	-- reset
	combatLog = {}
	filterCombatLog = {}
end
function BigWigsCombatLog:Clear()
    self.db.profile.log = {}
end

function BigWigsCombatLog:SendLog(name)
    self:Sync("BigWigsCombatLogSendLog " .. "mylog")
end

function BigWigsCombatLog:AddFilter(msg)
    if msg then
        table.insert(filter, table.getn(filter) + 1, msg) 
    end
end
function BigWigsCombatLog:RemoveFilter(msg)
	local key = filter[msg]
	if key then
		table.remove(key)
	end
end
function BigWigsCombatLog:PrintFilters()
    for key, value in pairs(filter) do 
        BigWigs:Print("key: " .. key .. ", value: " .. value) 
    end
end

------------------------------
--      Synchronisation     --
------------------------------

function BigWigsCombatLog:SyncStart(name)
    if name then
        self:Sync("BigWigsCombatLogStart " .. name)
    end
end
function BigWigsCombatLog:SyncStop(name)
    if name then
        self:Sync("BigWigsCombatLogStop " .. name)
    end
end
function BigWigsCombatLog:SyncClear(name)
    if name then
        self:Sync("BigWigsCombatLogClear " .. name)
    end
end
function BigWigsCombatLog:GetLog(name)
    self:Sync("BigWigsCombatLogGetLog " .. name)
end
function BigWigsCombatLog:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BigWigsCombatLogStart" then
        if rest and rest == UnitName("player") then
            self:Start() 
        end
    elseif sync == "BigWigsCombatLogStop" then
        if rest and rest == UnitName("player") then
            self:Stop() 
        end
    elseif sync == "BigWigsCombatLogClear" then
        if rest and rest == UnitName("player") then
            self:Clear() 
        end
    elseif sync == "BigWigsCombatLogGetLog" then
        if rest and rest == UnitName("player") then
            self:SendLog() 
        end
    elseif sync == "BigWigsCombatLogSendLog" and rest then
        BigWigs:DebugMessage("BigWigsCombatLogSendLog: " .. rest)
	end
end
