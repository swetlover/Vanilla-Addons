
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Noth the Plaguebringer", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Noth",

	blink_cmd = "blink",
	blink_name = "闪现术警报",
	blink_desc = "闪现术的警报",

	teleport_cmd = "teleport",
	teleport_name = "传送警报",
	teleport_desc = "传送的警报",

	curse_cmd = "curse",
	curse_name = "诅咒警报",
	curse_desc = "诅咒的警报",

	wave_cmd = "wave",
	wave_name = "每一波战斗警报",
	wave_desc = "每一波战斗的警报",

	starttrigger1 = "Die, trespasser!",
	starttrigger2 = "Glory to the master!",
	starttrigger3 = "Your life is forfeit!",
	startwarn = "瘟疫者诺斯来势汹汹! 90秒后传送!",

	addtrigger = "Rise, my soldiers! Rise and fight once more!",

	blinktrigger = "瘟疫者诺斯获得了闪现术的效果。",
	blinkwarn = "闪现术!",
	blinkwarn5 = "闪现术大约 5 秒!",
	blinkwarn10 = "闪现术大约 10 秒!",
	blinkbar = "可能闪现术(清空仇恨)",

	teleportToBalconyTrigger = "Noth the Plaguebringer teleports to the balcony above!",
	teleportToRoomTrigger = "Noth the Plaguebringer teleports back into the battle!",
	teleportwarn = "传送! 他在阳台上!",
	teleportwarn10 = "传送 10 秒!",
	teleportwarn30 = "传送 30 秒!",

	teleportbar = "传送!",
	backbar = "回到房间!",

	backwarn = "他在 %d 秒后回到房间!",
	backwarn10 = "10 秒，直到他回到房间!",
	backwarn30 = "30 秒，直到他回到房间!",

	cursetrigger = "受到了瘟疫使者的诅咒效果的影响",
	cursewarn = "诅咒! 下一个大约 28 秒",
	curse10secwarn = "诅咒大约 10 秒",

	cursebar = "下一次诅咒(1000暗伤DOT)",

	wave1bar = "第 1 波",
	wave2bar = "第 2 波",
	wave2_message = "第二波10秒后",
	wave2s_message = "第二波刷新!",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20011 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"blink", "teleport", "curse", "wave", "bosskill"}


-- locals
local timer = {
	firstBlink = {30,40},
	regularBlink = {30,40},

	blinkAfterTeleport = {2,10},

	firstRoom = 90,
	secondRoom = 110,
	thirdRoom = 180,
	room = 0, -- will be changed during the encounter

	firstBalcony = 70,
	secondBalcony = 95,
	thirdBalcony = 120, -- ??
	balcony = 0, -- will be changed during the encounter

	firstCurse = {8,12},
	curseAfterTeleport = {2,10},
	curse = {50,60},

	wave1 = {5,7},
	wave2_1 = {30,37},
	wave2_2 = {49,56},
	wave2_3 = {62,69},
	wave2 = 0,
}
local icon = {
	balcony = "Spell_Magic_LesserInvisibilty",
	blink = "Spell_Arcane_Blink",
	wave = "Spell_ChargePositive",
	curse = "Spell_Shadow_AnimateDead",
}
local syncName = {
	blink = "NothBlink"..module.revision,
	curse = "NothCurse"..module.revision,
	teleportToBalcony = "NothTeleportToBalcony"..module.revision,
	teleportToRoom = "NothTeleportToRoom"..module.revision,
}

local berserkannounced = nil

------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger1"])
module:RegisterYellEngage(L["starttrigger2"])
module:RegisterYellEngage(L["starttrigger3"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "CheckForBlink")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckForCurse")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckForCurse")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckForCurse")

	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Teleport")

	self:ThrottleSync(5, syncName.blink)
	self:ThrottleSync(5, syncName.curse)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	timer.room = timer.firstRoom
	timer.balcony = timer.firstBalcony
	timer.wave2 = timer.wave2_1
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.teleport then
		self:Message(L["startwarn"], "Important")
		self:Bar(L["teleportbar"], timer.room, icon.balcony)
		--self:DelayedMessage(timer.room - 30, L["teleportwarn30"], "Urgent")
		--self:DelayedMessage(timer.room - 10, L["teleportwarn10"], "Urgent")
	end
	if self.db.profile.blink then
		self:IntervalBar(L["blinkbar"], timer.firstBlink[1], timer.firstBlink[2], icon.blink)
		--self:DelayedMessage(timer.firstBlink[1] - 10, L["blinkwarn10"], "Attention")
		--self:DelayedMessage(timer.firstBlink[1] - 5, L["blinkwarn5"], "Attention")
	end
	if self.db.profile.curse then
		self:IntervalBar(L["cursebar"], timer.firstCurse[1], timer.firstCurse[2], icon.curse)
	end

	self:ScheduleEvent("bwnothtobalcony", self.TeleportToBalcony, timer.room, self)
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end

------------------------------
--      Initialization      --
------------------------------

function module:CheckForCurse(msg)
	if string.find(msg, L["cursetrigger"]) then
		self:Sync(syncName.curse)
	end
end

function module:CheckForBlink(msg)
	if msg == L["blinktrigger"] then
		self:Sync(syncName.blink)
	end
end

function module:Teleport(msg)
	if msg == L["teleportToBalconyTrigger"] then
		self:Sync(syncName.teleportToBalcony)
	elseif msg == L["teleportToRoomTrigger"] then
		self:Sync(syncName.teleportToRoom)
	end
end

function module:TeleportToBalcony()
	self:CancelScheduledEvent("bwnothtobalcony")
	if timer.room == timer.firstRoom then
		timer.room = timer.secondRoom
	elseif timer.room == timer.secondRoom then
		timer.room = timer.thirdRoom
	end

	--self:CancelDelayedMessage(L["teleportwarn10"])
	--self:CancelDelayedMessage(L["teleportwarn30"])
	--self:CancelDelayedMessage(L["curse10secwarn"])

	self:RemoveBar(L["blinkbar"])
	self:RemoveBar(L["cursebar"])

	if self.db.profile.teleport then
		self:Message(L["teleportwarn"], "Important")
		self:Bar(L["backbar"], timer.balcony, icon.balcony)
		--self:DelayedMessage(timer.balcony - 30, L["backwarn30"], "Urgent")
		--self:DelayedMessage(timer.balcony - 10, L["backwarn10"], "Urgent")
	end
	if self.db.profile.wave then
		self:IntervalBar(L["wave1bar"], timer.wave1[1], timer.wave1[2], icon.wave)
		self:IntervalBar(L["wave2bar"], timer.wave2[1], timer.wave2[2], icon.wave)
		--self:DelayedMessage(timer.wave2 - 10, L["wave2_message"], "Urgent")
		--self:DelayedMessage(timer.wave2, L["wave2s_message"], "Urgent")
	end
	self:ScheduleEvent("bwnothtoroom", self.TeleportToRoom, timer.balcony, self)
end

function module:TeleportToRoom()
	self:CancelScheduledEvent("bwnothtoroom")
	if timer.balcony == timer.firstBalcony then
		timer.balcony = timer.secondBalcony
		timer.wave2 = timer.wave2_2
	elseif timer.balcony == timer.secondBalcony then
		timer.balcony = timer.thirdBalcony
		timer.wave2 = timer.wave2_3
	end

	if self.db.profile.teleport then
		self:Message(string.format(L["backwarn"], timer.room), "Important")
		self:IntervalBar(L["blinkbar"], timer.blinkAfterTeleport[1], timer.blinkAfterTeleport[2], icon.blink)
		--self:DelayedMessage(timer.blinkAfterTeleport[1] - 10, L["blinkwarn10"], "Attention") -- praeda
		--self:DelayedMessage(timer.blinkAfterTeleport[1] - 5, L["blinkwarn5"], "Attention") -- praeda

		self:Bar(L["teleportbar"], timer.room, icon.balcony)
		--self:DelayedMessage(timer.room - 30, L["teleportwarn30"], "Urgent")
		--self:DelayedMessage(timer.room - 10, L["teleportwarn10"], "Urgent")
	end
	if self.db.profile.curse then
		self:IntervalBar(L["cursebar"], timer.curseAfterTeleport[1], timer.curseAfterTeleport[2], icon.curse)
	end

	self:ScheduleEvent("bwnothtobalcony", self.TeleportToBalcony, timer.room, self)

	self:KTM_Reset()
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.curse then
		self:Curse()
	elseif sync == syncName.blink then
		self:Blink()
	elseif sync == syncName.teleportToBalcony then
		self:TeleportToBalcony()
	elseif sync == syncName.teleportToRoom then
		self:TeleportToRoom()
	end
end

------------------------------
--      Utility	Functions   --
------------------------------

function module:Curse()
	if self.db.profile.curse then
		self:Message(L["cursewarn"], "Important", nil, "Alarm")
		--self:DelayedMessage(timer.curse - 10, L["curse10secwarn"], "Urgent")
		self:IntervalBar(L["cursebar"], timer.curse[1], timer.curse[2], icon.curse)
	end
end

function module:Blink()
	if self.db.profile.blink then
		self:Message(L["blinkwarn"], "Important")
		--self:DelayedMessage(timer.regularBlink - 10, L["blinkwarn10"], "Attention")
		--self:DelayedMessage(timer.regularBlink - 5, L["blinkwarn5"], "Attention")
		self:IntervalBar(L["blinkbar"], timer.regularBlink[1], timer.regularBlink[2], icon.blink)
	end

	-- aggro reset?
	self:KTM_Reset()
end