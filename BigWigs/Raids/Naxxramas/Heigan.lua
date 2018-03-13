
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Heigan the Unclean", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Heigan",

	teleport_cmd = "teleport",
	teleport_name = "传送警报",
	teleport_desc = "传送的警报.",

	engage_cmd = "engage",
	engage_name = "开怪警报",
	engage_desc = "当与肮脏者海根开始战斗时警报.",

	disease_cmd = "disease",
	disease_name = "衰弱瘟疫警报",
	disease_desc = "衰弱瘟疫的警报",

	erruption_cmd = "erruption",
	erruption_name = "瘟疫爆发警报",
	erruption_desc = "瘟疫爆发的警报",
	
 	manaburn_cmd = "manaburn",
 	manaburn_name = "法力燃烧警报",
 	manaburn_desc = "法力燃烧警报",

	-- [[ Triggers ]]--
	starttrigger = "You are mine now!",
	starttrigger2 = "You...are next!",
	starttrigger3 = "I see you!",
	toPlatform_trigger1 = "teleports and begins to channel a spell!",
	toPlatform_trigger2 = "The end is upon you.",
	toFloor_trigger = "rushes to attack once more!",
	die_trigger = "takes his last breath.",
	dtrigger = "受到了衰弱瘟疫效果的影响。",
	manaburn_trigger = "肮脏者海根的法力燃烧",

	-- [[ Warnings ]]--
	engage_message = "肮脏者海根开始战斗!",

	dwarn = "衰弱瘟疫",

	on_platform_message = "传送! 跳舞 %d 秒!",

	to_floor_30sec_message = "30秒后回来",
	to_floor_10sec_message = "10秒后回来!",
	on_floor_message = "回到地面! 90秒后下一次传送!",

	-- [[ Bars ]]--
	toPlatform_bar = "传送!",
	toFloor_bar = "回到地面!",
	dbar = "衰弱瘟疫",
	erruptionbar = "爆发",
	dancingshoes = "穿上你的舞鞋!你在跳舞~",
	manaburn_bar = "法力燃烧",

	-- [[ Dream Room Mobs ]] --
	["Eye Stalk"] = "眼柄",
	["Rotting Maggot"] = "腐烂的蛆虫",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20012 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["Eye Stalk"], L["Rotting Maggot"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"engage", "teleport", "disease", "erruption", "manaburn", "bosskill"}


-- locals
local timer = {
	firstDisease = 30,
	firstDiseaseAfterDance = 5,
	disease = 25,
	toFloor = 45,
	toPlatform = 90, --dance
	firstErruption = 15,
	firstErruptionAfterDance = 11,
 	firstDanceErruption = 4,
	erruption = 0, -- will be changed during the encounter
	erruptionSlow = 10,
	erruptionFast = 3,
	firstManaburn = 15,
 	firstManaburnAfterDance = 5,
 	manaburnInterval = 10,
}
local icon = {
	disease = "Ability_Creature_Disease_03",
	toFloor = "Spell_Magic_LesserInvisibilty",
	toPlatform = "Spell_Arcane_Blink",
	erruption = "spell_fire_selfdestruct",
	dancing = "INV_Gizmo_RocketBoot_01",
	manaburn = "Spell_Frost_ManaBurn",
}
local syncName = {
	toPlatform = "HeiganToPlatform"..module.revision,
	toFloor = "HeiganToFloor"..module.revision,
	disease = "HeiganDisease"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger"])
module:RegisterYellEngage(L["starttrigger2"])
module:RegisterYellEngage(L["starttrigger3"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Teleport")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL", "Teleport")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckForDisease")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckForDisease")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckForDisease")

	self:ThrottleSync(10, syncName.toPlatform)
	self:ThrottleSync(10, syncName.toFloor)
	self:ThrottleSync(5, syncName.disease)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.teleport then
		self:Bar(L["toPlatform_bar"], timer.toPlatform, icon.toPlatform)
	end
	if self.db.profile.disease then
		self:Bar(L["dbar"], timer.firstDisease, icon.disease)
	end
	if self.db.profile.manaburn then
		self:Bar(L["manaburn_bar"], timer.firstManaburn, icon.manaburn, true, "Blue")
		self:ScheduleEvent("heiganmanaburn", self.Manaburn, timer.firstManaburn, self)
	end
	if self.db.profile.erruption then
		timer.erruption = timer.erruptionSlow
		self:Bar(L["erruptionbar"], timer.firstErruption, icon.erruption)
		self:ScheduleEvent("HeiganErruption", self.Erruption, timer.firstErruption, self)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_MONSTER_EMOTE( msg )
	if string.find(msg, L["die_trigger"]) then
		self:SendBossDeathSync()
	end
end

function module:Teleport(msg)
	if string.find(msg, L["toPlatform_trigger1"]) or string.find(msg, L["toPlatform_trigger2"]) then
		self:Sync(syncName.toPlatform)
	elseif string.find(msg, L["toFloor_trigger"]) then
		self:Sync(syncName.toFloor)
	end
end

function module:CheckForDisease( msg )
	if string.find(msg, L["dtrigger"]) then
		if self.db.profile.disease then
			self:Sync(syncName.disease)
		end
	end
end

function module:Erruption()
	if self.db.profile.erruption then
		-- don't show bar before teleport
		local registered, time, elapsed = self:BarStatus(L["toPlatform_bar"])
		if registered and timer and elapsed then
			local remaining = time - elapsed
			if timer.erruption <= remaining then
				self:Bar(L["erruptionbar"], timer.erruption, icon.erruption)
				self:ScheduleEvent("HeiganErruption", self.Erruption, timer.erruption, self)
			else
				self:Sound("Beware")
				self:Bar(L["dancingshoes"], remaining, icon.dancing)
			end
		else
			self:Bar(L["erruptionbar"], timer.erruption, icon.erruption)
			self:ScheduleEvent("HeiganErruption", self.Erruption, timer.erruption, self)
		end

	end
end

function module:Manaburn()
	self:Bar(L["manaburn_bar"], timer.manaburnInterval, icon.manaburn, true, "Blue")
	self:ScheduleEvent("heiganmanaburn", self.Manaburn, timer.manaburnInterval, self)
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.disease then
		self:Disease()
	elseif sync == syncName.toPlatform then
		self:ToPlatform()
	elseif sync == syncName.toFloor then
		self:ToFloor()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Disease()
	if self.db.profile.disease then
		self:Message(L["dwarn"], "Important")

		-- don't show bar before teleport
		local registered, time, elapsed = self:BarStatus(L["toPlatform_bar"])
		if time and elapsed then
			local remaining = time - elapsed
			if timer.disease <= remaining then
				self:Bar(L["dbar"], timer.disease, icon.disease)
			end
		end
	end
end

function module:ToPlatform()
	self:CancelScheduledEvent("heiganmanaburn")
	if self.db.profile.teleport then
		self:Message(string.format(L["on_platform_message"], timer.toFloor), "Attention")
		self:Bar(L["toFloor_bar"], timer.toFloor, icon.toFloor)
	end
	if self.db.profile.erruption then
		self:CancelScheduledEvent("HeiganErruption")

		timer.erruption = timer.erruptionFast
		self:Bar(L["erruptionbar"], timer.firstDanceErruption, icon.erruption)
		self:ScheduleEvent("HeiganErruption", self.Erruption, timer.firstDanceErruption, self)
	end
	self:ScheduleEvent("bwHeiganToFloor",  self.ToFloor, timer.toFloor, self )
end

function module:ToFloor()
	self:CancelScheduledEvent("bwHeiganToFloor")
	if self.db.profile.teleport then
		self:Message(L["on_floor_message"], "Attention")
		self:Bar(L["toPlatform_bar"], timer.toPlatform, icon.toPlatform)
	end
	if self.db.profile.disease then
		self:Bar(L["dbar"], timer.firstDiseaseAfterDance, icon.disease)
	end
	if self.db.profile.manaburn then
		self:Bar(L["manaburn_bar"], timer.firstManaburnAfterDance, icon.manaburn, true, "Blue")
		self:ScheduleEvent("heiganmanaburn", self.Manaburn, timer.firstManaburnAfterDance, self)
	end
	if self.db.profile.erruption then
		self:CancelScheduledEvent("HeiganErruption")

		timer.erruption = timer.erruptionSlow
		self:Bar(L["erruptionbar"], timer.firstErruptionAfterDance, icon.erruption)
		self:ScheduleEvent("HeiganErruption", self.Erruption, timer.firstErruptionAfterDance, self)
	end
end