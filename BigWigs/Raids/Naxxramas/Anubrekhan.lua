
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Anub'Rekhan", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Anubrekhan",

	locust_cmd = "locust",
	locust_name = "虫群警报",
	locust_desc = "虫群风暴的警报",

	enrage_cmd = "enrage",
	enrage_name = "地穴卫士激怒警报",
	enrage_desc = "激怒警报",

	starttrigger1 = "Just a little taste...",
	starttrigger2 = "Yes, run! It makes the blood pump faster!",
	starttrigger3 = "There is no way out.",

	etrigger = "获得了激怒的效果。",
	enragewarn = "地穴卫士激怒 - 眩晕 + 宁神!",

	gaintrigger = "阿努布雷坎获得了虫群风暴的效果。",
	gainendwarn = "虫群风暴结束!",
	gainnextwarn = "下一个虫群风暴在大约 90 秒",
	gainwarn10sec = "大约 10秒后虫群风暴",
	gainincbar = "可能虫群(自然DOT,不能攻击,施法)",
	gainbar = "虫群风暴(自然DOT,不能攻击,施法)",

	casttrigger = "阿努布雷坎开始施放虫群风暴。",
	castwarn = "虫群风暴来临!",

	impale_cmd = "impale",
	impale_name = "穿刺警报",
	impale_desc = "穿刺的警报",
	impaletrigger = "阿努布雷坎开始施放穿刺", -- todo
	impalebar = "下一个穿刺",
	impalesay = "我被穿刺",

} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20010 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"locust", "impale", "enrage", "bosskill"}


-- locals
local timer = {
	firstLocustSwarm = {80,120},
	locustSwarmInterval = {90,110},
	locustSwarmDuration = 20,
	locustSwarmCastTime = 3,
	impale = {12,18},
}
local icon = {
	locust = "Spell_Nature_InsectSwarm",
	impale = "ability_backstab",
}
local syncName = {
	locustCast = "AnubLocustInc"..module.revision,
	locustGain = "AnubLocustSwarm"..module.revision,
	impale = "AnubImpale"..module.revision,
}

------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger1"])
module:RegisterYellEngage(L["starttrigger2"])
module:RegisterYellEngage(L["starttrigger3"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "CheckForLocustCast")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CheckForLocustCast")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")

	self:ThrottleSync(10, syncName.locustCast)
	self:ThrottleSync(10, syncName.locustGain)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
end

-- called after boss is engaged
function module:OnEngage()
	--self:DelayedMessage(timer.firstLocustSwarm - 10, L["gainwarn10sec"], "Important")
	self:IntervalBar(L["gainincbar"], timer.firstLocustSwarm[1], timer.firstLocustSwarm[2], icon.locust)
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["gaintrigger"] then
		self:Sync(syncName.locustGain)
	elseif msg == L["etrigger"] then
		self:Message(L["enragewarn"], "Important", nil, "Alarm")
	end
end

function module:CheckForLocustCast(msg)
	if string.find(msg, L["casttrigger"]) then
		self:Sync(syncName.locustCast)
	end
end
--[[
function module:CheckForImpale(msg)
if string.find(msg, L["impaletrigger"]) then
name = "Test" -- todo
self:Sync(syncName.impale .. " " .. name)
end
end
]]

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.locustCast then
		self:LocustCast()
	elseif sync == syncName.locustGain then
		self:LocustGain()
		--elseif sync == syncName.impale and rest then
		--	self:Impale(rest)
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

-- called when anub'rekhan casts locust swarm
function module:LocustCast()
	self:RemoveBar(L["impalebar"])

	--self:ScheduleEvent("bwanublocustinc", self.TriggerEvent, timer.locustSwarmCastTime, self, "BigWigs_SendSync", syncName.locustGain)
	if self.db.profile.locust then
		-- remove old bar
		self:RemoveBar(L["gainincbar"])

		-- add cast bar
		self:Message(L["castwarn"], "Orange", nil, "Beware")
		self:WarningSign(icon.locust, timer.locustSwarmCastTime)
		self:Bar(L["castwarn"], timer.locustSwarmCastTime, icon.locust )
	end
	self:DelayedSync(timer.locustSwarmCastTime, syncName.locustGain)
end

-- called when casting locust swarm is over and anub'rekhan gained the buff/aura
function module:LocustGain()
	--self:CancelScheduledEvent("bwanublocustinc")
	if self.db.profile.locust then
		--self:WarningSign(icon.locust, 5)
		--self:DelayedMessage(timer.locustSwarmDuration, L["gainendwarn"], "Important")
		self:Bar(L["gainbar"], timer.locustSwarmDuration, icon.locust)
		self:Message(L["gainnextwarn"], "Urgent")
		--self:DelayedMessage(timer.locustSwarmInterval - 10, L["gainwarn10sec"], "Important")
		self:DelayedIntervalBar(timer.locustSwarmDuration, L["gainincbar"], timer.locustSwarmInterval[1]-timer.locustSwarmDuration, timer.locustSwarmInterval[2]-timer.locustSwarmDuration, icon.locust)
	end
end
--[[
function module:Impale(name)
if self.db.profile.impale then
self:IntervalBar(L["impalebar"], timer.impale[1], timer.impale[2], icon.impale)

-- set raid icon on impale target
self:Icon(name)

-- say warning for impale target
if name == UnitName("player") then
self:Say(L["impalesay"])
end
end
end
]]

----------------------------------
--      Module Test Function    --
----------------------------------

function module:Test(long)
	-- /run local m=BigWigs:GetModule("Anub'Rekhan");m:Test()

	local function testLocustSwarmCast()
		module:CheckForLocustCast(L["casttrigger"])
	end
	local function testLocustSwarmGain()
		module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(L["gaintrigger"])
	end
	local function testEnrage()
		module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(L["etrigger"])
	end
	local function testDisable()
		--module:SendWipeSync()
		BigWigs:TriggerEvent("BigWigs_RebootModule", self:ToString())
		BigWigs:DisableModule(module:ToString())
	end

	if long then
		local testTimer = 0
		-- long test
		self:SendEngageSync()

		-- first locust swarm cast
		testTimer = testTimer + timer.firstLocustSwarm
		self:ScheduleEvent(self:ToString() .. "testLocustSwarmCast1", testLocustSwarmCast, testTimer, self)
		BigWigs:Print("testLocustSwarmCast in " .. testTimer)

		-- first locust swarm gain
		testTimer = testTimer + timer.locustSwarmCastTime
		self:ScheduleEvent(self:ToString() .. "testLocustSwarmGain1", testLocustSwarmGain, testTimer, self)
		BigWigs:Print("testLocustSwarmGain in " .. testTimer)

		-- enrage
		self:ScheduleEvent(self:ToString() .. "testEnrage1", testEnrage, 90, self)
		BigWigs:Print("testEnrage in " .. 90)

		-- second locust swarm cast
		testTimer = testTimer + timer.locustSwarmInterval
		self:ScheduleEvent(self:ToString() .. "testLocustSwarmCast2", testLocustSwarmCast, testTimer, self)
		BigWigs:Print("testLocustSwarmCast in " .. testTimer)

		-- second locust swarm gain
		testTimer = testTimer + timer.locustSwarmCastTime
		self:ScheduleEvent(self:ToString() .. "testLocustSwarmGain2", testLocustSwarmGain, testTimer, self)
		BigWigs:Print("testLocustSwarmGain in " .. testTimer)

		-- wipe
		testTimer = testTimer + 10
		self:ScheduleEvent(self:ToString() .. "testDisable", testDisable, testTimer, self)
		BigWigs:Print("testDisable in " .. testTimer)
	else
		-- short test
		local testTimer = 0
		self:SendEngageSync()

		-- first locust swarm cast
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testLocustSwarmCast1", testLocustSwarmCast, testTimer, self)
		BigWigs:Print("testLocustSwarmCast in " .. testTimer)

		-- first locust swarm gain
		testTimer = testTimer + timer.locustSwarmCastTime
		self:ScheduleEvent(self:ToString() .. "testLocustSwarmGain1", testLocustSwarmGain, testTimer, self)
		BigWigs:Print("testLocustSwarmGain in " .. testTimer)

		-- enrage
		self:ScheduleEvent(self:ToString() .. "testEnrage1", testEnrage, 10, self)
		BigWigs:Print("testEnrage in " .. 10)

		-- second locust swarm cast
		testTimer = testTimer + 25
		self:ScheduleEvent(self:ToString() .. "testLocustSwarmCast2", testLocustSwarmCast, testTimer, self)
		BigWigs:Print("testLocustSwarmCast in " .. testTimer)

		-- second locust swarm gain
		testTimer = testTimer + timer.locustSwarmCastTime
		self:ScheduleEvent(self:ToString() .. "testLocustSwarmGain2", testLocustSwarmGain, testTimer, self)
		BigWigs:Print("testLocustSwarmGain in " .. testTimer)

		-- wipe
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testDisable", testDisable, testTimer, self)
		BigWigs:Print("testDisable in " .. testTimer)
	end
end
