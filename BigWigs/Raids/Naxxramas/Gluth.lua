
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Gluth", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Gluth",

	fear_cmd = "fear",
	fear_name = "群体恐惧警报",
	fear_desc = "群体恐惧术的警报",

	frenzy_cmd = "frenzy",
	frenzy_name = "疯狂警报(只有猎人可见)",
	frenzy_desc = "疯狂的警报",

	enrage_cmd = "enrage",
	enrage_name = "激怒计时",
	enrage_desc = "激怒的警报",

	decimate_cmd = "decimate",
	decimate_name = "残杀警报",
	decimate_desc = "残杀的警报",

	frenzy_trigger = "%s goes into a frenzy!",
	berserk_trigger = "获得了狂暴的效果",
	fear_trigger = "受到了恐惧怒吼效果的影响。",
	fear2_trigger = "恐惧怒吼施放失败",
	starttrigger = "devours all nearby zombies!",

	frenzy_warn = "疯狂警报 - 猎人立刻使用宁神射击！",
	fear_warn_5 = "5秒后 AoE恐惧!",
	fear_warn = "AoE恐惧警报 - 20秒后再次发动!",

	enragewarn = "激怒!",
	enragebartext = "激怒(伤害,攻速提高)",
	enrage_warn_90 = "激怒 90 秒",
	enrage_warn_30 = "激怒 30 秒",
	enrage_warn_10 = "激怒 10 秒",

	startwarn = "古鲁斯相遇! 大约1分45秒后实施残杀僵尸!",
	decimatesoonwarn = "马上残杀!",
	decimatebar = "残杀僵尸(集火僵尸)",

	zombies_cmd = "zombies",
	zombies_name = "僵尸刷新",
	zombies_desc = "显示僵尸的计时条",
	zombiebar = "下一次僵尸 - %d",

	bar1text = "AoE 恐惧",

	testtrigger = "testtrigger";

	frenzygain_trigger = "古鲁斯获得了疯狂的效果。",
	frenzygain_trigger2 = "古鲁斯 goes into a frenzy!",
	frenzyend_trigger = "疯狂效果从古鲁斯身上消失。",
	frenzy_message = "疯狂! 现在宁神!",
	frenzy_bar = "疯狂(立刻宁神)",
	frenzy_Nextbar = "下次疯狂(准备宁神)",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20007 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"frenzy", "fear", "decimate", "enrage", "bosskill", "zombies"}


-- locals
local timer = {
	decimateInterval = 105,
	zombie = 6,
	enrage = 330,
	fear = 20,
	frenzy = 10,
	firstFrenzy = 10,
}
local icon = {
	zombie = "Ability_Seal",
	enrage = "Spell_Shadow_UnholyFrenzy",
	fear = "Spell_Shadow_PsychicScream",
	decimate = "INV_Shield_01",
	tranquil = "Spell_Nature_Drowsy",
	frenzy = "Ability_Druid_ChallangingRoar",
}
local syncName = {
	frenzy = "GluthFrenzyStart"..module.revision,
	frenzyOver = "GluthFrenzyEnd"..module.revision,
}

local lastFrenzy = 0
local _, playerClass = UnitClass("player")

------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("BigWigs_Message")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Frenzy")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Frenzy")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Frenzy")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Enrage")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Fear")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Fear")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Fear")

	--self:ThrottleSync(10, syncName.berserk)
	self:ThrottleSync(5, syncName.frenzy)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	self.prior = nil
	self.zomnum = 1
	lastFrenzy = 0
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.decimate then
		self:Message(L["startwarn"], "Attention")
		self:Decimate()
		self:ScheduleRepeatingEvent( "bwgluthdecimate", self.Decimate, timer.decimateInterval, self )
	end
	if self.db.profile.zombies then
		self.zomnum = 1
		self:Bar(string.format(L["zombiebar"],self.zomnum), timer.zombie, icon.zombie)
		self.zomnum = self.zomnum + 1
		self:Zombie()
	end
	if self.db.profile.enrage then
		self:Bar(L["enragebartext"], timer.enrage, icon.enrage)
		self:DelayedMessage(timer.enrage - 90, L["enrage_warn_90"], "Attention")
		self:DelayedMessage(timer.enrage - 30, L["enrage_warn_30"], "Attention")
		self:DelayedMessage(timer.enrage - 10, L["enrage_warn_10"], "Urgent")
	end
	if self.db.profile.frenzy then
		self:Bar(L["frenzy_Nextbar"], timer.firstFrenzy, icon.frenzy, true, "white")
	end
	if self.db.profile.fear then
		self:Bar(L["bar1text"], timer.fear, icon.fear)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Initialization      --
------------------------------

function module:Zombies()
	self:Bar(string.format(L["zombiebar"],self.zomnum), timer.zombie, icon.zombie)

	if self.zomnum <= 10 then
		self.zomnum = self.zomnum + 1
	elseif self.zomnum > 10 then
		self:CancelScheduledEvent("bwgluthzbrepop")
		self:RemoveBar(string.format(L["zombiebar"], self.zomnum ))
		self.zomnum = 1
	end
end
function module:Zombie()
	self:ScheduleRepeatingEvent("bwgluthzbrepop", self.Zombies, timer.zombie, self)
end

function module:Frenzy( msg )
	if msg == L["frenzygain_trigger"] or msg == L["frenzygain_trigger2"] then
		self:Sync(syncName.frenzy)
	elseif msg == L["frenzyend_trigger"] then
		self:Sync(syncName.frenzyOver)
	end
end

function module:Fear( msg )
	if self.db.profile.fear and not self.prior and string.find(msg, L["fear_trigger"]) then
		self:Message(L["fear_warn"], "Important")
		self:Bar(L["bar1text"], timer.fear, icon.fear)
		self:DelayedMessage(timer.fear - 5, L["fear_warn_5"], "Urgent")
		self.prior = true
	end
end

function module:Decimate()
	if self.db.profile.decimate then
		self:Bar(L["decimatebar"], timer.decimateInterval, icon.decimate)
		self:DelayedMessage(timer.decimateInterval - 5, L["decimatesoonwarn"], "Urgent")
	end
	if self.db.profile.zombies then
		self.zomnum = 1
		self:Bar(string.format(L["zombiebar"],self.zomnum), timer.zombie, icon.zombie)
		self.zomnum = self.zomnum + 1
		self:Zombie()
	end
end

function module:Enrage( msg )
	if string.find(msg, L["berserk_trigger"]) then
		if self.db.profile.enrage then
			self:Message(L["enragewarn"], "Important")
		end
		--[[self:CancelScheduledEvent("bwgluthdecimate")
		self:CancelScheduledEvent("bwgluthdecimatewarn")
		self:CancelScheduledEvent("bwgluthfrenzy_warn")
		self:CancelScheduledEvent("bwgluthfear_warn_5")
		self:CancelScheduledEvent("bwgluthfear_warn")]]
	end
end

function module:BigWigs_Message(text)
	if text == L["fear_warn_5"] then self.prior = nil end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.frenzy and self.db.profile.frenzy then
		self:Message(L["frenzy_message"], "Important", nil, true, "Alert")
		self:Bar(L["frenzy_bar"], timer.frenzy, icon.frenzy, true, "red")
		if playerClass == "HUNTER" then
			self:WarningSign(icon.tranquil, timer.frenzy, true)
		end
		lastFrenzy = GetTime()
	elseif sync == syncName.frenzyOver and self.db.profile.frenzy then
		self:RemoveBar(L["frenzy_bar"])
		self:RemoveWarningSign(icon.tranquil, true)
		if lastFrenzy ~= 0 then
			local NextTime = (lastFrenzy + timer.frenzy) - GetTime()
			self:Bar(L["frenzy_Nextbar"], NextTime, icon.frenzy, true, "white")
		end
	end
end