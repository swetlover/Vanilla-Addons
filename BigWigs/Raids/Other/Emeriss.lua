----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Emeriss", "Ashenvale")

module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"noxious", "volatileyou", "volatileother", "bosskill"}
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
	corruption = 10,
}
local icon = {
	breath = "Interface\\Icons\\Spell_Shadow_LifeDrain02",
	corruption = "Interface\\Icons\\Ability_Creature_Cursed_03",
}
local syncName = {
	}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Emeriss",

	noxious_cmd = "noxious",
	noxious_name = "毒性吐息提醒",
	noxious_desc = "毒性吐息提醒",

	volatileyou_cmd = "volatileyou",
	volatileyou_name = "你的快速传染提醒",
	volatileyou_desc = "警报对你的快速传染的提醒",

	volatileother_cmd = "volatileother",
	volatileother_name = "对其他人的快速传染提醒",
	volatileother_desc = "对其他人的快速传染提醒",

	volatile_trigger = "^([^%s]+)([^%s]+)快速传染效果的影响",
	breath_trigger = "受到了毒性吐息效果的影响",
	engage_trigger = "Hope is a DISEASE of the soul! This land shall wither and die!",
	corruption_trigger = "Taste your world's corruption!",

	volatileYou_warn = "你受到了快速传染效果的影响!",
	volatileOther_warn = " 受到了快速传染效果的影响!",
	breathSoon_warn = "毒性吐息马上!",
	breath_warn = "毒性吐息!",
	corruption_warn = "大地的堕落!快治疗!",

	isyou = "你",
	isare = "受到了",

	breath_bar = "毒性吐息(自然伤DOT)",
	corruption_bar = "大地堕落(每2秒损失20%生命)",

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
	else
		local _,_, EPlayer, EType = string.find(msg, L["volatile_trigger"])
		if (EPlayer and EType) then
			if (EPlayer == L["isyou"] and EType == L["isare"]) then
				if self.db.profile.volatileyou then
					self:Message(L["volatileYou_warn"], "Important", true)
				end
			else
				if self.db.profile.volatileother then
					self:Message(EPlayer .. L["volatileOther_warn"], "Attention")
					self:TriggerEvent("BigWigs_SendTell", EPlayer, L["volatileYou_warn"])
				end
			end
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
	elseif (string.find(msg, L["corruption_trigger"])) then
		self:Message(L["corruption_warn"], "Important")
		self:RemoveBar(L["corruption_bar"])
		self:Bar(L["corruption_bar"], timer.corruption, icon.corruption)
	end
end
