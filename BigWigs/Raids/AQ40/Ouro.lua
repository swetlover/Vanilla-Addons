
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Ouro", "Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------
L:RegisterTranslations("enUS", function() return {
	cmd = "Ouro",

	OUROCHAMBERLOCALIZEDLOLHAX = "Kel'Thuzad Chamber",

	sweep_cmd = "sweep",
	sweep_name = "Sweep Alert",
	sweep_desc = "Warn for Sweeps",

	sandblast_cmd = "sandblast",
	sandblast_name = "Sandblast Alert",
	sandblast_desc = "Warn for Sandblasts",

	emerge_cmd = "emerge",
	emerge_name = "Emerge Alert",
	emerge_desc = "Warn for Emerge",

	submerge_cmd = "submerge",
	submerge_name = "Submerge Alert",
	submerge_desc = "Warn for Submerge",

	berserk_cmd = "berserk",
	berserk_name = "Berserk",
	berserk_desc = "Warn for when Ouro goes berserk",

	sweeptrigger = "Ouro begins to cast Sweep",
	sweepannounce = "Sweep!",
	sweepwarn = "5 seconds until Sweep!",
	sweepbartext = "Sweep",

	sandblasttrigger = "Ouro begins to perform Sand Blast",
	sandblastannounce = "Incoming Sand Blast!",
	sandblastwarn = "5 seconds until Sand Blast!",
	sandblastbartext = "Sand Blast",

	engage_message = "Ouro engaged! Possible Submerge in 90sec!",
	possible_submerge_bar = "Possible submerge",

	--emergetrigger = "Dirt Mound casts Summon Ouro Scarabs.",
	emergetrigger = "Ground Rupture",
	emergeannounce = "Ouro has emerged!",
	emergewarn = "15 sec to possible submerge!",
	emergebartext = "Ouro submerge",

	--submergetrigger = "Ouro casts Summon Ouro Mounds.",
	submergetrigger = "submerge",
	submergeannounce = "Ouro has submerged!",
	submergewarn = "5 seconds until Ouro Emerges!",
	submergebartext = "Ouro Emerge",

	berserktrigger = "Ouro gains Berserk.",
	berserkannounce = "Berserk - Berserk!",
	berserksoonwarn = "Berserk Soon - Get Ready!",


} end )

L:RegisterTranslations("zhCN", function() return {
	sweep_name = "横扫",
	sweep_desc = "当奥罗横扫时警报.",

	sandblast_name = "沙尘爆裂",
	sandblast_desc = "当奥罗沙尘爆裂时警报.",

	emerge_name = "钻出",
	emerge_desc = "当奥罗从地底钻出时警报.",

	submerge_name = "钻地",
	submerge_desc = "当奥罗钻地时警报.",

	berserk_name = "狂暴",
	berserk_desc = "当奥罗狂暴时警报.",

	sweeptrigger = "奥罗开始施放横扫",
	sweepannounce = "横扫!近战躲!",
	sweepwarn = "5秒后横扫!",
	sweepbartext = "横扫(近战躲)",

	sandblasttrigger = "奥罗开始施展沙尘爆裂",
	sandblastannounce = "沙尘爆裂来临!",
	sandblastwarn = "5秒后沙尘爆裂!",
	sandblastbartext = "沙尘爆裂(180度半圆型吐息)",

	engage_message = "奥罗相遇! 59秒后可能钻地!",
	possible_submerge_bar = "可能钻地(准备跑)",

	--emergetrigger = "Dirt Mound casts Summon Ouro Scarabs.",
	emergetrigger = "大地破裂",
	emergeannounce = "奥罗现身了!",
	emergewarn = "15秒后可能钻地!",
	emergebartext = "奥罗钻地(远离土堆)",

	submergetrigger = "奥罗施放了召唤奥罗土堆。", -- ?
	submergeannounce = "奥罗潜入地下!",
	submergewarn = "5秒后奥罗现身!",
	submergebartext = "奥罗现身",

	berserktrigger = "奥罗获得了狂暴的效果。",
	berserkannounce = "狂暴!攻击速度增加150%,奥罗不会再钻地!",
	berserksoonwarn = "即将狂暴 - 做好准备！",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20010 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"sweep", "sandblast", -1, "emerge", "submerge", -1, "berserk", "bosskill"}


-- locals
local timer = {
	nextSubmerge = 59,
	sweep = 1.5,
	firstSweep = 30,
	sweepInterval = 15,
	sandblast = 2,
	firstSandblast = 30,
	sandblastInterval = 15,
	nextEmerge = 27,
}
local icon = {
	sweep = "Spell_Nature_Thorns",
	sandblast = "Spell_Nature_Cyclone",
	submerge = "Spell_Nature_Earthquake",
}
local syncName = {
	sweep = "OuroSweep"..module.revision,
	sandblast = "OuroSandblast"..module.revision,
	emerge = "OuroEmerge"..module.revision,
	submerge = "OuroSubmerge"..module.revision,
	berserk = "OuroBerserk"..module.revision,
}

local berserkannounced = nil


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE")

	self:RegisterEvent("UNIT_HEALTH")

	self:ThrottleSync(10, syncName.sweep)
	self:ThrottleSync(10, syncName.sandblast)
	self:ThrottleSync(10, syncName.emerge)
	self:ThrottleSync(10, syncName.submerge)
	self:ThrottleSync(10, syncName.berserk)

	self:ScheduleRepeatingEvent("bwouroengagecheck", self.EngageCheck, 0.5, self)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	berserkannounced = nil
	self.started = nil
	self.phase = nil
end

-- called after boss is engaged
function module:OnEngage()
	self.phase = "emerged"
	self:ScheduleEvent("bwourosubmergecheck", self.DoSubmergeCheck, 5, self)

	if self.db.profile.emerge then
		self:Message(L["engage_message"], "Attention")
		self:PossibleSubmerge()
	end
	if self.db.profile.sandblast then
		self:DelayedMessage(timer.firstSandblast - 5, L["sandblastwarn"], "Important", nil, nil, true)
		self:Bar(L["sandblastbartext"], timer.firstSandblast, icon.sandblast, true, "Gray")
	end
	if self.db.profile.sweep then
		self:DelayedMessage(timer.firstSweep - 5, L["sweepwarn"], "Important", nil, nil, true)
		self:Bar(L["sweepbartext"], timer.firstSweep, icon.sweep, true, "Orange")
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:UNIT_HEALTH( msg )
	if UnitName(msg) == boss then
		local health = UnitHealth(msg)
		if health > 20 and health <= 23 and not berserkannounced then
			if self.db.profile.berserk then
				self:Message(L["berserksoonwarn"], "Important")
			end
			berserkannounced = true
		elseif health > 30 and berserkannounced then
			berserkannounced = nil
		end
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["berserktrigger"] then
		self:Sync(syncName.berserk)
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE( msg )
	if string.find(msg, L["emergetrigger"]) then
		self:Sync(syncName.emerge)
		self:DebugMessage("OuroEmerge")
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE( msg )
	if string.find(msg, L["sweeptrigger"]) then
		self:DebugMessage("sweep dmg")
		self:Sync(syncName.sweep)
	elseif string.find(msg, L["sandblasttrigger"]) then
		self:Sync(syncName.sandblast)
	end
end

-- there is no emote ...
function module:CHAT_MSG_MONSTER_EMOTE( msg )
	if msg == L["berserktrigger"] then
		self:Sync(syncName.berserk)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.sweep then
		self:Sweep()
	elseif sync == syncName.sandblast then
		self:Sandblast()
	elseif sync == syncName.emerge then
		self:Emerge()
	elseif sync == syncName.submerge then
		self:Submerge()
	elseif sync == syncName.berserk then
		self:Berserk()
	end
end


------------------------------
--      Sync Handlers	    --
------------------------------

function module:Sweep()
	if self.db.profile.sweep then
		self:RemoveBar(L["sweepbartext"]) -- remove timer bar
		self:Bar(L["sweepannounce"], timer.sweep, icon.sweep, true, "Red") -- show cast bar
		self:Message(L["sweepannounce"], "Important", true, "Alarm")
		self:DelayedMessage(timer.sweepInterval - 5, L["sweepwarn"], "Important", nil, nil, true)
		self:DelayedBar(timer.sweep, L["sweepbartext"], timer.sweepInterval-timer.sweep, icon.sweep, true, "Orange") -- delayed timer bar
	end
end

function module:Sandblast()
	if self.db.profile.sandblast then
		self:RemoveBar(L["sandblastbartext"]) -- remove timer bar
		self:Bar(L["sandblastannounce"], timer.sandblast, icon.sandblast, true, "White") -- show cast bar
		self:Message(L["sandblastannounce"], "Important", true, "Alert")
		self:DelayedMessage(timer.sandblastInterval - 5, L["sandblastwarn"], "Important", nil, nil, true)
		self:DelayedBar(timer.sandblast, L["sandblastbartext"], timer.sandblastInterval-timer.sandblast, icon.sandblast, true, "Gray") -- delayed timer bar
	end
end

function module:DoSubmergeCheck()
	self:ScheduleRepeatingEvent("bwourosubmergecheck", self.SubmergeCheck, 0.5, self)
end
function module:Emerge()
	if self.phase ~= "berserk" then
		self.phase = "emerged"
		self:DebugMessage("emerged module")
		self:CancelScheduledEvent("bwourosubmergecheck")
		self:ScheduleEvent("bwourosubmergecheck", self.DoSubmergeCheck, 5, self)
		--self:ScheduleRepeatingEvent("bwourosubmergecheck", self.SubmergeCheck, 1, self)
		self:CancelScheduledEvent("bwsubmergewarn")
		self:RemoveBar(L["submergebartext"])

		if self.db.profile.emerge then
			self:Message(L["emergeannounce"], "Important", false, "Beware")
			self:PossibleSubmerge()
		end

		if self.db.profile.sweep then
			self:DelayedMessage(timer.sweepInterval - 5, L["sweepwarn"], "Important", nil, nil, true)
			self:Bar(L["sweepbartext"], timer.sweepInterval, icon.sweep, true, "Orange")
		end

		if self.db.profile.sandblast then
			self:DelayedMessage(timer.sandblastInterval - 5, L["sandblastwarn"], "Important", nil, nil, true)
			self:Bar(L["sandblastbartext"], timer.sandblastInterval, icon.sandblast, true, "Gray")
		end
	end
end

function module:Submerge()
	self:CancelDelayedMessage(L["sweepwarn"])
	self:CancelDelayedMessage(L["sandblastwarn"])
	self:CancelDelayedMessage(L["emergewarn"])

	self:RemoveBar(L["sweepbartext"])
	self:RemoveBar(L["sandblastbartext"])
	self:RemoveBar(L["emergebartext"])
	self:RemoveBar(L["possible_submerge_bar"])

	self.phase = "submerged"
	--self:KTM_Reset()

	if self.db.profile.submerge then
		self:Message(L["submergeannounce"], "Important")
		self:ScheduleEvent("bwsubmergewarn", "BigWigs_Message", timer.nextEmerge - 5, L["submergewarn"], "Important" )
		self:Bar(L["submergebartext"], timer.nextEmerge, icon.submerge)
	end
end

function module:Berserk()
	self.phase = "berserk"

	self:CancelDelayedMessage(L["emergewarn"])
	self:RemoveBar(L["emergebartext"])
	self:RemoveBar(L["possible_submerge_bar"])

	if self.db.profile.berserk then
		self:Message(L["berserkannounce"], "Important", true, "Beware")
	end
end


------------------------------
--      Utility	Functions   --
------------------------------

function module:PossibleSubmerge()
	if self.db.profile.emerge then
		self:DelayedMessage(timer.nextSubmerge -15, L["emergewarn"], "Important", nil, nil, true)
		self:Bar(L["possible_submerge_bar"], timer.nextSubmerge, icon.submerge)
	end
end

function module:SubmergeCheck()
	-- if the player is dead he can't see ouro: omit this check
	if self.phase == "emerged" then
		if not UnitIsDeadOrGhost("player") and not self:IsOuroVisible() then
			self:DebugMessage("OuroSubmerge")
			self:Sync(syncName.submerge)
		end
	end
end

function module:EngageCheck()
	if not self.engaged then
		--self:ScheduleRepeatingEvent("bwouroengagecheck", self.EngageCheck, 1, self)
		if self:IsOuroVisible() then
			module:CancelScheduledEvent("bwouroengagecheck")

			module:SendEngageSync()
		end
	else
		module:CancelScheduledEvent("bwouroengagecheck")
	end
end

function module:IsOuroVisible()
	if UnitName("playertarget") == self.translatedName then
		return true
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == self.translatedName then
				return true
			end
		end
	end

	return false
end