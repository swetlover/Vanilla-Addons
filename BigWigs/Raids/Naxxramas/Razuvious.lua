
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Instructor Razuvious", "Naxxramas")
local understudy = AceLibrary("Babble-Boss-2.2")["Deathknight Understudy"]


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Razuvious",

	shout_cmd = "shout",
	shout_name = "瓦解怒吼警报",
	shout_desc = "瓦解怒吼的警报",

	unbalance_cmd = "unbalancing",
	unbalance_name = "重压打击警报",
	unbalance_desc = "重压打击的警报",

	shieldwall_cmd = "shieldwall",
	shieldwall_name = "盾墙计时",
	shieldwall_desc = "显示盾墙的计时",

	startwarn = "教官拉苏维奥斯来势汹汹! 15秒后瓦解怒吼, 30秒重压打击!",

	starttrigger1 = "Stand and fight!",
	starttrigger2 = "Show me what you've got!",
	starttrigger3 = "Hah hah, I'm just getting warmed up!",
	--starttrigger4 = "Stand and fight!",

	--shouttrigger = "Disrupting Shout",
	shouttrigger = "lets loose a triumphant shout.",
	shouttrigger2 = "教官拉苏维奥斯的瓦解怒吼",
	shout7secwarn = "7 秒后瓦解怒吼",
	shout3secwarn = "3 秒后瓦解怒吼!",
	shoutwarn = "瓦解怒吼! 下一个 25秒",
	noshoutwarn = "没有怒吼! 下一个 20秒",
	shoutbar = "瓦解怒吼(远程注意躲避)",

	unbalance_trigger = "重压打击效果的影响",
	unbalancesoonwarn = "重压打击马上来临!",
	unbalancewarn = "重压打击! 下一个大约 30秒",
	unbalancebar = "重压打击",

	shieldwalltrigger   = "死亡骑士实习者获得了盾墙的效果。",
	shieldwallbar       = "小怪的盾墙",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.wipemobs = {understudy} -- adds which will be considered in CheckForEngage
module.toggleoptions = {"shout", "unbalance", "shieldwall", "bosskill"}


-- locals
local timer = {
	firstShout = 15,
	shout = 25,
	--noShoutDelay = 5,
	unbalance = 30,
	shieldwall = 20,
}
local icon = {
	shout = "Ability_Warrior_WarCry",
	unbalance = "Ability_Warrior_DecisiveStrike",
	shieldwall = "Ability_Warrior_ShieldWall",
}
local syncName = {
	shout = "RazuviousShout"..module.revision,
	shieldwall = "RazuviousShieldwall"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger1"])
module:RegisterYellEngage(L["starttrigger2"])
module:RegisterYellEngage(L["starttrigger3"])

-- called after module is enabled
function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CheckForShout")
	--self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CheckForShout")
	--self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "CheckForShout")

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "CheckForShout")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "CheckForShout")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckForUnbalance")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckForUnbalance")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckForUnbalance")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE", "CheckForUnbalance")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS", "CheckForShieldwall")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS", "CheckForShieldwall")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS", "CheckForShieldwall")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "CheckForShieldwall")

	self:ThrottleSync(5, syncName.shout)
	self:ThrottleSync(5, syncName.shieldwall)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.shout then
		self:Message(L["startwarn"], "Attention", nil, "Urgent")
		self:DelayedMessage(timer.firstShout - 7, L["shout7secwarn"], "Urgent")
		self:DelayedMessage(timer.firstShout - 3, L["shout3secwarn"], "Urgent")
		self:Bar(L["shoutbar"], timer.firstShout, icon.shout)
	end
	--self:ScheduleEvent("bwrazuviousnoshout", self.NoShout, timer.shout + timer.noShoutDelay, self) -- praeda first no shout fix
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Initialization      --
------------------------------

function module:CheckForShieldwall(msg)
	if string.find(msg, L["shieldwalltrigger"]) then
		self:Sync(syncName.shieldwall)
	end
end

function module:CheckForShout(msg)
	if string.find(msg, L["shouttrigger"]) then
		self:Sync(syncName.shout)
	end
end

-- 5s after expected shout
--[[
function module:NoShout()
self:CancelScheduledEvent("bwrazuviousnoshout")
self:ScheduleEvent("bwrazuviousnoshout", self.NoShout, timer.shout + timer.noShoutDelay, self)
if self.db.profile.shout then
self:Message(L["noshoutwarn"], "Attention") -- is this message useful?
self:Bar(L["shoutbar"], timer.shout - timer.noShoutDelay, icon.shout)
self:DelayedMessage(timer.shout - timer.noShoutDelay - 7, L["shout7secwarn"], "Urgent")
self:DelayedMessage(timer.shout - timer.noShoutDelay - 3, L["shout3secwarn"], "Urgent")
end
end
]]
function module:CheckForUnbalance(msg)
	if string.find(msg, L["unbalance_trigger"]) then
		self:Message(L["unbalancewarn"], "Urgent")
		self:DelayedMessage(timer.unbalance - 5, L["unbalancesoonwarn"], "Urgent")
		self:Bar(L["unbalancebar"], timer.unbalance, icon.unbalance)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.shout then
		self:Shout()
	elseif sync == syncName.shieldwall then
		self:Shieldwall()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Shout()
	--self:CancelScheduledEvent("bwrazuviousnoshout")
	--self:ScheduleEvent("bwrazuviousnoshout", self.NoShout, timer.shout + timer.noShoutDelay, self)

	if self.db.profile.shout then
		self:Message(L["shoutwarn"], "Attention", nil, "Alarm")
		self:DelayedMessage(timer.shout - 7, L["shout7secwarn"], "Urgent")
		self:DelayedMessage(timer.shout - 3, L["shout3secwarn"], "Urgent")
		self:Bar(L["shoutbar"], timer.shout, icon.shout)
	end
end

function module:Shieldwall()
	if self.db.profile.shieldwall then
		self:Bar(L["shieldwallbar"], timer.shieldwall, icon.shieldwall)
	end
end