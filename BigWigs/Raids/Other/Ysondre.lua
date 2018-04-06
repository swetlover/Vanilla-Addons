----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Ysondre", "Ashenvale")

module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"noxious", "bosskill"}
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
}
local icon = {
	breath = "Interface\\Icons\\Spell_Shadow_LifeDrain02",
}
local syncName = {
	}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Ysondre",

	noxious_cmd = "noxious",
	noxious_name = "毒性吐息警报",
	noxious_desc = "毒性吐息的警报",

	engage_trigger = "The strands of LIFE have been severed! The Dreamers must be avenged!",
	breath_trigger = "afflicted by Noxious Breath",
	druid_trigger = "Your wicked souls shall feed my power!",

	druid_warn = "德鲁伊刷新!",
	breathSoon_warn = "毒性吐息马上!",
	breath_warn = "毒性吐息!",


	breath_bar = "毒性吐息(自然伤DOT)",

} end )

------------------------------
--      Initialization      --
------------------------------

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
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

function module:Event( msg )
	if string.find(msg, L["breath_trigger"]) then
		if self.db.profile.noxious then
			self:CancelDelayedMessage(L["breathSoon_warn"])
			self:DelayedMessage(timer.breath-3, L["breathSoon_warn"], "Important", true, "Alert")
			self:RemoveBar(L["breath_bar"])
			self:Bar(L["breath_bar"], timer.breath, icon.breath)
		end
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if (msg == L["engage_trigger"]) then
		if self.db.profile.noxious then
			self:CancelDelayedMessage(L["breathSoon_warn"])
			self:DelayedMessage(timer.firstBreath-3, L["breathSoon_warn"], "Important", true, "Alert")
			self:RemoveBar(L["breath_bar"])
			self:Bar(L["breath_bar"], timer.firstBreath, icon.breath)
		end
	elseif (string.find(msg, L["druid_trigger"])) then
		self:Message(L["druid_warn"], "Important")
	end
end
