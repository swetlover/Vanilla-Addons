
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Thaddius", "Naxxramas")
local feugen = AceLibrary("Babble-Boss-2.2")["Feugen"]
local stalagg = AceLibrary("Babble-Boss-2.2")["Stalagg"]

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Thaddius",

	enrage_cmd = "enrage",
	enrage_name = "激怒警报",
	enrage_desc = "激怒警报",

	phase_cmd = "phase",
	phase_name = "阶段警报",
	phase_desc = "阶段转换警报",

	polarity_cmd = "polarity",
	polarity_name = "极性转化警报",
	polarity_desc = "极性转化的警报",

	power_cmd = "power",
	power_name = "能量涌动警报",
	power_desc = "斯塔拉格的能量涌动警报",

	adddeath_cmd = "adddeath",
	adddeath_name = "小怪死亡警报",
	adddeath_desc = "当小怪死亡时警报.",

	charge_cmd = "charge",
	charge_name = "能量电荷改变警报",
	charge_desc = "当你的正能量电荷/负能量电荷改变时警报.",

	throw_cmd = "throw",
	throw_name = "平台投掷互换警报",
	throw_desc = "警报当坦克的平台互换时.",

	enragetrigger = "%s goes into a berserker rage!",
	starttrigger = "Stalagg crush you!",
	starttrigger1 = "Feed you to master!",
	trigger_phase2_1 = "EAT YOUR BONES",
	trigger_phase2_2 = "BREAK YOU!",
	trigger_phase2_3 = "KILL!",

	adddeath = "No... more... Feugen...",
	adddeath2 = "Master save me...",

	teslaoverload = "overloads!",

	pstrigger = "Now YOU feel pain!",
	trigger_polarity_cast = "泰迪斯开始施放极性转化",
	chargetrigger = "^(.+)受(.+)了(.+)电荷",
	positivetype = "Interface\\Icons\\Spell_ChargePositive",
	negativetype = "Interface\\Icons\\Spell_ChargeNegative",
	stalaggtrigger = "斯塔拉格获得了能量涌动的效果。",

	you = "你",
	are = "到",

	enragewarn = "激怒!",
	startwarn = "泰迪斯阶段 1",
	startwarn2 = "泰迪斯阶段 2, 激怒 5 分钟后!",
	addsdownwarn = "泰迪斯降临 14秒后!",
	pswarn1 = "泰迪斯开始施放极性转化! - 监视你的debuff!",
	pswarn2 = "30 秒后极性转化!",
	pswarn3 = "3 秒后极性转化!",
	poswarn = "你是正电荷！",
	negwarn = "你是负电荷！",
	nochange = "你的电荷没有改变！",
	polaritytickbar = "极性标记",
	enragebartext = "激怒",
	warn_enrage_3m = "激怒 3 分钟",
	warn_enrage_90 = "激怒 90 秒",
	warn_enrage_60 = "激怒 60 秒",
	warn_enrage_30 = "激怒 30 秒",
	warn_enrage_10 = "激怒 10 秒",
	stalaggwarn = "能量涌动 - 加大对坦克的治疗！",
	powersurgebar = "能量涌动(怪物攻速提高)",

	bar1text = "极性转化(监视你的debuff)",

	throwbar = "MT投掷",
	throwwarn = "大约5秒投掷！MT注意！",

	phasebar = "阶段 2",

	add1 = "伏晨",
	add2 = "斯塔拉格",

} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20003 -- To be overridden by the module!
module.enabletrigger = {module.translatedName, feugen, stalagg} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"enrage", "charge", "polarity", -1, "power", "throw", "phase", "bosskill"}


-- locals
local timer = {
	throw = 20.5,
	powerSurge = 10,
	enrage = 300,
	polarityTick = 6,
	firstPolarity = 10,
	polarityShift = 30,
	transition = 14,
	transition2 = 4,
}
local icon = {
	throw = "Ability_Druid_Maul",
	powerSurge = "Spell_Shadow_UnholyFrenzy",
	enrage = "Spell_Shadow_UnholyFrenzy",
	polarityShift = "Spell_Nature_Lightning",
	positive = "Spell_ChargePositive",
	negative = "Spell_ChargeNegative",
}
local syncName = {
	powerSurge = "StalaggPower"..module.revision,
	--phase2 = "ThaddiusPhaseTwo"..module.revision,
	addsdead = "ThaddiusAdsDead"..module.revision,
	polarity = "ThaddiusPolarity"..module.revision,
	enrage = "ThaddiusEnrage"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger"])
module:RegisterYellEngage(L["starttrigger1"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "CheckStalagg")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "PolarityCast")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "PolarityCast")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "CheckForEnrage")

	self:ThrottleSync(10, syncName.polarity)
	self:ThrottleSync(4, syncName.powerSurge)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	self.enrageStarted = nil
	self.addsdead = 0
	self.transition = nil
	self.teslawarn = nil
	self.stage1warn = nil
	self.previousCharge = ""
	self.add1HP = 100
	self.add2HP = 100
end

-- called after boss is engaged
function module:OnEngage()
	self.add1HP = 100
	self.add2HP = 100
	self:TriggerEvent("BigWigs_StartHPBar", self, L["add1"], 100)
	self:TriggerEvent("BigWigs_SetHPBar", self, L["add1"], 0)
	self:TriggerEvent("BigWigs_StartHPBar", self, L["add2"], 100)
	self:TriggerEvent("BigWigs_SetHPBar", self, L["add2"], 0)
	if self.db.profile.phase and not self.stage1warn then
		self:Message(L["startwarn"], "Important")
	end
	self.stage1warn = true
	self:Throw()
	self:ScheduleRepeatingEvent("bwthaddiusthrow", self.Throw, timer.throw, self)
	self:ScheduleRepeatingEvent("bwThaddiusAddCheck", self.CheckAddHP, 0.5, self )
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CheckStalagg(msg)
	if msg == L["stalaggtrigger"] then
		self:Sync(syncName.powerSurge)
	end
end

function module:CHAT_MSG_MONSTER_YELL( msg )
	if string.find(msg, L["pstrigger"]) then
		self:Sync(syncName.polarity)
	elseif msg == L["adddeath"] or msg == L["adddeath2"] then
		self.addsdead = self.addsdead + 1
		if self.addsdead == 2 then
			self:Sync(syncName.addsdead)
		end
		--elseif string.find(msg, L["trigger_phase2_1"]) or string.find(msg, L["trigger_phase2_2"]) or string.find(msg, L["trigger_phase2_3"]) then
		--	self:Sync(syncName.phase2)
	end
end

function module:CheckForEnrage(msg)
	if msg == L["enragetrigger"] then
		self:Sync(syncName.enrage)
	elseif string.find(msg, L["teslaoverload"]) then
		self:Transition(timer.transition2)
	end
end

function module:PolarityCast(msg)
	if self.db.profile.polarity and string.find(msg, L["trigger_polarity_cast"]) then
		self:Message(L["pswarn1"], "Important")
	end
end

function module:PLAYER_AURAS_CHANGED(msg)
	local chargetype = nil
	local iIterator = 1
	while UnitDebuff("player", iIterator) do
		local texture, applications = UnitDebuff("player", iIterator)
		if texture == L["positivetype"] or texture == L["negativetype"] then
			-- If we have a debuff with this texture that has more
			-- than one application, it means we still have the
			-- counter debuff, and thus nothing has changed yet.
			-- (we got a PW:S or Renew or whatever after he casted
			--  PS, but before we got the new debuff)
			if applications > 1 then
				return
			end
			chargetype = texture
			-- Note that we do not break out of the while loop when
			-- we found a debuff, since we still have to check for
			-- debuffs with more than 1 application.
		end
		iIterator = iIterator + 1
	end
	if not chargetype then return end

	self:UnregisterEvent("PLAYER_AURAS_CHANGED")

	self:NewPolarity(chargetype)
end

function module:NewPolarity(chargetype)
	if self.db.profile.charge then
		if self.previousCharge and self.previousCharge == chargetype then
			self:Message(L["nochange"], "Urgent", true, "Long")
		elseif chargetype == L["positivetype"] then
			self:Message(L["poswarn"], "Positive", true, "RunAway")
			self:Bar(L["polaritytickbar"], timer.polarityTick, icon.positive, "Important")
			self:WarningSign(icon.positive, 5)
		elseif chargetype == L["negativetype"] then
			self:Message(L["negwarn"], "Important", true, "RunAway")
			self:Bar(L["polaritytickbar"], timer.polarityTick, icon.negative, "Important")
			self:WarningSign(icon.negative, 5)
		end
	end
	self.previousCharge = chargetype
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.powerSurge then
		self:PowerSurge()
	elseif sync == syncName.addsdead then
		self:Transition(timer.transition)
		--elseif sync == syncName.phase2 then
		--	self:Phase2()
	elseif sync == syncName.polarity then
		self:PolarityShift()
	elseif sync == syncName.enrage then
		self:Enrage()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:PowerSurge()
	if self.db.profile.power then
		self:Message(L["stalaggwarn"], "Important")
		self:Bar(L["powersurgebar"], timer.powerSurge, icon.powerSurge)
	end
end

function module:Transition(transitionTime)
	self:RemoveBar(L["throwbar"])
	self:CancelDelayedMessage(L["throwwarn"])
	self:CancelScheduledEvent("bwthaddiusthrow")
	self:TriggerEvent("BigWigs_StopHPBar", self, L["add1"])
	self:TriggerEvent("BigWigs_StopHPBar", self, L["add2"])
	self:CancelScheduledEvent("bwThaddiusAddCheck")
	if not self.transition then
		if self.db.profile.phase then
			self:Message(L["addsdownwarn"], "Attention")
			self:Bar(L["phasebar"], transitionTime, icon.polarityShift)
		end
		self:ScheduleEvent("bwThaddiusP2", self.Phase2, transitionTime, self)
		self.transition = true
	end
end

function module:Phase2()
	self:KTM_Reset()
	if self.db.profile.phase then
		self:Message(L["startwarn2"], "Important")
	end
	if self.db.profile.enrage then
		self:Bar(L["enragebartext"], timer.enrage, icon.enrage)
		self:DelayedMessage(timer.enrage - 3 * 60, L["warn_enrage_3m"], "Attention")
		self:DelayedMessage(timer.enrage - 90, L["warn_enrage_90"], "Attention")
		self:DelayedMessage(timer.enrage - 60, L["warn_enrage_60"], "Urgent")
		self:DelayedMessage(timer.enrage - 30, L["warn_enrage_30"], "Important")
		self:DelayedMessage(timer.enrage - 10, L["warn_enrage_10"], "Important")
	end
	self:Bar(L["bar1text"], timer.firstPolarity, icon.polarityShift)
end

function module:PolarityShift()
	if self.db.profile.polarity then
		self:RegisterEvent("PLAYER_AURAS_CHANGED")
		self:DelayedMessage(timer.polarityShift - 3, L["pswarn3"], "Important", nil, "Beware")
		self:Bar(L["bar1text"], timer.polarityShift, icon.polarityShift)
	end
end

function module:Enrage()
	if self.db.profile.enrage then
		self:Message(L["enragewarn"], "Important")
	end

	self:RemoveBar(L["enragebartext"])

	self:CancelDelayedMessage(L["warn_enrage_3m"])
	self:CancelDelayedMessage(L["warn_enrage_90"])
	self:CancelDelayedMessage(L["warn_enrage_60"])
	self:CancelDelayedMessage(L["warn_enrage_30"])
	self:CancelDelayedMessage(L["warn_enrage_10"])
end

------------------------------
--      Utility	Functions   --
------------------------------

function module:Throw()
	if self.db.profile.throw then
		self:Bar(L["throwbar"], timer.throw, icon.throw)
		self:DelayedMessage(timer.throw - 5, L["throwwarn"], "Urgent")
	end
end

function module:CheckAddHP()
	local health1
	local health2
	if UnitName("playertarget") == L["add1"] then
		health1 = UnitHealth("playertarget")
	elseif UnitName("playertarget") == L["add2"] then
		health2 = UnitHealth("playertarget")
	end

	for i = 1, GetNumRaidMembers(), 1 do
		if UnitName("Raid"..i.."target") == L["add1"] then
			health1 = UnitHealth("Raid"..i.."target")
		elseif UnitName("Raid"..i.."target") == L["add2"] then
			health2 = UnitHealth("Raid"..i.."target")
		end
		if health1 and health2 then break; end
	end

	if health1 then
		self.add1HP = health1
		self:TriggerEvent("BigWigs_SetHPBar", self, L["add1"], 100-self.add1HP)
	end

	if health2 then
		self.add2HP = health2
		self:TriggerEvent("BigWigs_SetHPBar", self, L["add2"], 100-self.add2HP)
	end
end

------------------------------
--      Test                --
------------------------------

function module:Test(long)
	-- /run local m=BigWigs:GetModule("Thaddius");m:Test()

	local function testPhase2()
		module:CHAT_MSG_MONSTER_YELL(L["trigger_phase2_1"])
		BigWigs:Print("  testPhase2")
	end
	local function testPolarityShiftPositive()
		module:NewPolarity(L["positivetype"])
	end
	local function testPolarityShiftNegative()
		module:NewPolarity(L["negativetype"])
	end
	local function testDisable()
		--module:SendWipeSync()
		BigWigs:TriggerEvent("BigWigs_RebootModule", self:ToString())
		BigWigs:DisableModule(module:ToString())
		BigWigs:Print("  testDisable")
	end

	if long then
		local testTimer = 0
		self:SendEngageSync()

		-- phase2
		testTimer = testTimer + 10
		self:ScheduleEvent(self:ToString() .. "testPhase2", testPhase2, testTimer, self)
		BigWigs:Print(" testPhase2 in " .. testTimer)

		-- polarity shift 1
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testPolarityShiftPositive", testPolarityShiftPositive, testTimer, self)
		BigWigs:Print(" testPolarityShiftPositive1 in " .. testTimer)

		-- polarity shift 2
		testTimer = testTimer + 30
		self:ScheduleEvent(self:ToString() .. "testPolarityShiftPositive2", testPolarityShiftPositive, testTimer, self)
		BigWigs:Print(" testPolarityShiftPositive2 in " .. testTimer)

		-- polarity shift 3
		testTimer = testTimer + 30
		self:ScheduleEvent(self:ToString() .. "testPolarityShiftNegative", testPolarityShiftNegative, testTimer, self)
		BigWigs:Print(" testPolarityShiftNegative in " .. testTimer)

		-- disable
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testDisable", testDisable, testTimer, self)
		BigWigs:Print(" testDisable in " .. testTimer)
	else
		local testTimer = 0
		self:SendEngageSync()

		-- phase2
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testPhase2", testPhase2, testTimer, self)
		BigWigs:Print(" testPhase2 in " .. testTimer)

		-- polarity shift 1
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testPolarityShiftPositive", testPolarityShiftPositive, testTimer, self)
		BigWigs:Print(" testPolarityShiftPositive1 in " .. testTimer)

		-- polarity shift 2
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testPolarityShiftPositive2", testPolarityShiftPositive, testTimer, self)
		BigWigs:Print(" testPolarityShiftPositive2 in " .. testTimer)

		-- polarity shift 3
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testPolarityShiftNegative", testPolarityShiftNegative, testTimer, self)
		BigWigs:Print(" testPolarityShiftNegative in " .. testTimer)

		-- disable
		testTimer = testTimer + 5
		self:ScheduleEvent(self:ToString() .. "testDisable", testDisable, testTimer, self)
		BigWigs:Print(" testDisable in " .. testTimer)
	end
end