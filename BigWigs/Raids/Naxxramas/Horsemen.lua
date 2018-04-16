
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("The Four Horsemen", "Naxxramas")
local thane = AceLibrary("Babble-Boss-2.2")["Thane Korth'azz"]
local mograine = AceLibrary("Babble-Boss-2.2")["Highlord Mograine"]
local zeliek = AceLibrary("Babble-Boss-2.2")["Sir Zeliek"]
local blaumeux = AceLibrary("Babble-Boss-2.2")["Lady Blaumeux"]


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Horsemen",

	mark_cmd = "mark",
	mark_name = "印记警报",
	mark_desc = "印记的警报",

	shieldwall_cmd  = "shieldwall",
	shieldwall_name = "盾墙警报",
	shieldwall_desc = "盾墙的警报",

	void_cmd = "void",
	void_name = "虚空领域警报",
	void_desc = "当女公爵布劳缪克丝施放虚空领域时警报.",

	meteor_cmd = "meteor",
	meteor_name = "流星警报",
	meteor_desc = "当库尔塔兹领主施放流星时警报.",

	wrath_cmd = "wrath",
	wrath_name = "神圣之怒警报",
	wrath_desc = "当瑟里耶克爵士施放神圣之怒时警报.",

	markbar = "标记 %d",
	mark_warn = "标记 %d!",
	mark_warn_5 = "5秒后 —— 标记 %d",
	marktrigger1 = "受到了瑟里耶克印记效果的影响",
	marktrigger2 = "受到了库尔塔兹印记效果的影响",
	marktrigger3 = "受到了布劳缪克丝印记效果的影响",
    marktrigger4 = "受到了莫格莱尼印记效果的影响",

	voidtrigger = "Your life is mine!",
	voidwarn = "虚空领域即将来临！",
	voidbar = "虚空领域(黑水,注意脚下)",

	meteortrigger = "库尔塔兹领主的流星击中",
	meteorwarn = "流星 - 注意集中",
	meteorbar = "流星(集中分摊伤害)",

	wrathtrigger = "札里克爵士的神圣之怒击中",
	wrathwarn = "神圣之怒 - 注意加好战士的血",
	wrathbar = "神圣之怒(5码连锁反弹)",

	startwarn = "四骑士来势汹汹! 印记大约 20 秒施放",

	shieldwallbar = "%s - 盾墙",
	shieldwalltrigger = "(.*)获得了盾墙的效果。",
	shieldwall_warn = "%s - 盾墙 20 秒",
	shieldwall_warn_over = "%s - 盾墙消失!",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20005 -- To be overridden by the module!
module.enabletrigger = {thane, mograine, zeliek, blaumeux} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"mark", "shieldwall", -1, "meteor", "void", "wrath", "bosskill"}


-- locals
local timer = {
	firstMark = 20,
	mark = 12,
	firstMeteor = 30,
	meteor = {12,15},
	firstWrath = 12,
	wrath = {12,15},
	firstVoid = 12,
	void = {12,15},
	shieldwall = 20,
}
local icon = {
	mark = "Spell_Shadow_CurseOfAchimonde",
	meteor = "Spell_Fire_Fireball02",
	wrath = "Spell_Holy_Excorcism",
	void = "Spell_Frost_IceStorm",
	shieldwall = "Ability_Warrior_ShieldWall",
}
local syncName = {
	shieldwall = "HorsemenShieldWall"..module.revision,
	mark = "HorsemenMark"..module.revision,
	void = "HorsemenVoid"..module.revision,
	wrath = "HorsemenWrath"..module.revision,
	meteor = "HorsemenMeteor"..module.revision,
}

local times = nil


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_MONSTER_SAY")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "SkillEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "SkillEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "MarkEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "MarkEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "MarkEvent")

	self:ThrottleSync(3, syncName.shieldwall)
	self:ThrottleSync(8, syncName.mark)
	self:ThrottleSync(5, syncName.void)
	self:ThrottleSync(5, syncName.wrath)
	self:ThrottleSync(5, syncName.meteor)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	self.marks = 0
	self.deaths = 0

	times = {}
end

-- called after boss is engaged
function module:OnEngage()
	self.marks = 0
	if self.db.profile.mark then
		self:Message(L["startwarn"], "Attention")
		self:Bar(string.format( L["markbar"], self.marks + 1), timer.firstMark, icon.mark) -- 18,5 sec on feenix
		self:DelayedMessage(timer.firstMark - 5, string.format( L["mark_warn_5"], self.marks + 1), "Urgent")
	end
	if self.db.profile.meteor then
		self:Bar(L["meteorbar"], timer.firstMeteor, icon.meteor)
	end
	if self.db.profile.wrath then
		self:Bar(L["wrathbar"], timer.firstWrath, icon.wrath)
	end
	if self.db.profile.void then
		self:Bar(L["voidbar"], timer.firstVoid, icon.void)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:MarkEvent(msg)
	if string.find(msg, L["marktrigger1"]) or string.find(msg, L["marktrigger2"]) or string.find(msg, L["marktrigger3"]) or string.find(msg, L["marktrigger4"]) then
		self:Sync(syncName.mark)
	end
end

function module:SkillEvent(msg)
	if string.find(msg, L["meteortrigger"]) then
		self:Sync(syncName.meteor)
	elseif string.find(msg, L["wrathtrigger"]) then
		self:Sync(syncName.wrath)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS( msg )
	local _,_, mob = string.find(msg, L["shieldwalltrigger"])
	if mob then
		self:Sync(syncName.shieldwall .. " " .. mob)
	end
end

function module:CHAT_MSG_MONSTER_SAY(msg)
	if string.find(msg, L["voidtrigger"]) then
		self:Sync(syncName.void)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, thane) or
		msg == string.format(UNITDIESOTHER, zeliek) or
		msg == string.format(UNITDIESOTHER, mograine) or
		msg == string.format(UNITDIESOTHER, blaumeux) then

		self.deaths = self.deaths + 1
		if self.deaths == 4 then
			self:SendBossDeathSync()
		end
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	--Print("sync= "..sync.." rest= "..rest.." nick= "..nick)
	if sync == syncName.mark then
		self:Mark()
	elseif sync == syncName.meteor then
		self:Meteor()
	elseif sync == syncName.wrath then
		self:Wrath()
	elseif sync == syncName.void then
		self:Void()
	elseif sync == syncName.shieldwall and rest then
		self:Shieldwall(rest)
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Mark()
	self:RemoveBar(string.format(L["markbar"], self.marks))
	self.marks = self.marks + 1
	if self.db.profile.mark then
		self:Message(string.format(L["mark_warn"], self.marks), "Important")
		self:Bar(string.format(L["markbar"], self.marks + 1), timer.mark, icon.mark)
		self:DelayedMessage(timer.mark - 5, string.format( L["mark_warn_5"], self.marks + 1), "Urgent")
	end
end

function module:Meteor()
	if self.db.profile.meteor then
		self:Message(L["meteorwarn"], "Important")
		self:IntervalBar(L["meteorbar"], timer.meteor[1], timer.meteor[2], icon.meteor)
	end
end

function module:Wrath()
	if self.db.profile.wrath then
		self:Message(L["wrathwarn"], "Important")
		self:IntervalBar(L["wrathbar"], timer.wrath[1], timer.wrath[2], icon.wrath)
	end
end

function module:Void()
	if self.db.profile.void then
		self:Message(L["voidwarn"], "Important")
		self:IntervalBar(L["voidbar"], timer.void[1], timer.void[2], icon.void)
	end
end

function module:Shieldwall(mob)
	if mob and self.db.profile.shieldwall then
		self:Message(string.format(L["shieldwall_warn"], mob), "Attention")
		self:Bar(string.format(L["shieldwallbar"], mob), timer.shieldwall, icon.shieldwall)
		self:DelayedMessage(timer.shieldwall, string.format(L["shieldwall_warn_over"], mob), "Positive")
	end
end