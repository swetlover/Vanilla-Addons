----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Taerar", "Ashenvale")

module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"noxious", "fear", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Outdoor Raid Bosses Zone"],
	AceLibrary("Babble-Zone-2.2")["Ashenvale"],
	AceLibrary("Babble-Zone-2.2")["Duskwood"],
	AceLibrary("Babble-Zone-2.2")["The Hinterlands"],
	AceLibrary("Babble-Zone-2.2")["Feralas"]
}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	firstBreath = 7,
	breath = 9,
	banish = 120,
	firstFear = 27,
	fear = 25,
}
local icon = {
	breath = "Interface\\Icons\\Spell_Shadow_LifeDrain02",
	fear = "Interface\\Icons\\Spell_Shadow_PsychicScream",
	banish = "Interface\\Icons\\Spell_Nature_Sleep",
}
local syncName = {
	}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Taerar",

	noxious_cmd = "noxious",
	noxious_name = "毒性吐息警报",
	noxious_desc = "毒性吐息的警报",

	fear_cmd = "fear",
	fear_name = "恐惧术",
	fear_desc = "低沉咆哮提醒",

	fear_trigger = "泰拉尔开始施放低沉咆哮。",
	breath_trigger = "afflicted by Noxious Breath",
	engage_trigger = "Peace is but a fleeting dream! Let the NIGHTMARE reign!",
	shades_trigger = "Children of Madness - I release you upon this world!",
	shadedies_trigger = "泰拉尔之影死亡了。",

	shades_warn = "泰拉尔放逐! 杀了小怪!",
	fearCast_warn = "恐惧 1.5秒!",
	breathSoon_warn = "毒性吐息马上!",
	breath_warn = "毒性吐息!",
	fear_warn = "AoE 恐惧马上!",

	breath_bar = "毒性吐息(自然伤DOT)",
	banish_bar = "放逐",
	fear_bar = "AoE 恐惧",

} end )

------------------------------
--      Initialization      --
------------------------------

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self.shades = 0
end

-- called after boss is engaged
function module:OnEngage()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end

------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)
	if msg == L["shadedies_trigger"] then
		self.shades = self.shades + 1
	end
	if self.shades == 3 then
		self:RemoveBar(L["banish_bar"])
		self.shades = 0
		local t1 = self.banish-self.lastbreath
		local t2 = self.banish-self.lastfear
		if self.db.profile.noxious then
			self:Bar(L["breath_bar"], timer.breath-t1, icon.breath)
		end
		if self.db.profile.fear then
			self:Bar(L["fear_bar"], timer.fear-t2, icon.fear)
		end
	end
end

function module:Event( msg )
	if string.find(msg, L["breath_trigger"]) then
		if self.db.profile.noxious then
			self.lastbreath = GetTime()
			self:Message(L["breath_warn"], "Important")
			self:CancelDelayedMessage(L["breathSoon_warn"])
			self:DelayedMessage(timer.breath-3, L["breathSoon_warn"], "Important", true, "Alert")
			self:RemoveBar(L["breath_bar"])
			self:Bar(L["breath_bar"], timer.breath, icon.breath)
		end
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if (msg == L["engage_trigger"]) then
		self.lastbreath = GetTime()
		self.lastfear = GetTime()
		if self.db.profile.noxious then
			self:CancelDelayedMessage(L["breathSoon_warn"])
			self:DelayedMessage(timer.firstBreath-3, L["breathSoon_warn"], "Important", true, "Alert")
			self:RemoveBar(L["breath_bar"])
			self:Bar(L["breath_bar"], timer.firstBreath, icon.breath)
		end
		if self.db.profile.fear then
			self:CancelDelayedMessage(L["fear_warn"])
			self:DelayedMessage(timer.firstFear-3, L["fear_warn"], "Important", true, "Alert")
			self:RemoveBar(L["fear_bar"])
			self:Bar(L["fear_bar"], timer.firstFear, icon.fear)
		end
	elseif msg == L["shades_trigger"] then
		self.banish = GetTime()
		self:Message(L["shades_warn"], "Important")
		self:RemoveBar(L["banish_bar"])
		self:Bar(L["banish_bar"], timer.banish, icon.banish)
		self:RemoveBar(L["breath_bar"])
		self:RemoveBar(L["fear_bar"])
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["fear_trigger"] and self.db.profile.fear then
		self.lastfear = GetTime()
		self:Message(L["fearCast_warn"], "Important", "Alert")
		self:CancelDelayedMessage(L["fear_warn"])
		self:DelayedMessage(timer.fear-3, L["fear_warn"], "Important", true, "Alert")
		self:RemoveBar(L["fear_bar"])
		self:Bar(L["fear_bar"], timer.fear, icon.fear)
	end
end
