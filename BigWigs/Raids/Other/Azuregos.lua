----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Azuregos", "Azshara")

module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"teleport", "shield", "bosskill"}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	--firstTeleport = 20,
	teleport = 30,
	shield = 10,
}
local icon = {
	teleport = "Interface\\Icons\\Spell_Arcane_Blink",
	shield = "Interface\\Icons\\Spell_Frost_FrostShock",
}
local syncName = {
	}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Azuregos",

	teleport_cmd = "teleport",
	teleport_name = "传送警报",
	teleport_desc = "提醒，传送",

	shield_cmd = "shield",
	shield_name = "盾警报",
	shield_desc = "提醒盾",

	teleport_trigger = "Come, little ones",
	shieldDown_trigger = "^反射效果从艾索雷葛斯身上消失",
	shieldUp_trigger = "^艾索雷葛斯获得了反射的效果",

	teleport_warn = "传送!",
	shieldDown_warn = "魔法护盾消失!",
	shieldUp_warn = "魔法护盾开启 - 不要施放法术！",
	teleport_bar = "传送",
	teleportSoon_warn = "很快传送",

	shield_bar = "魔法护盾",
} end )

------------------------------
--      Initialization      --
------------------------------

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
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

function module:CHAT_MSG_MONSTER_YELL( msg )
	if self.db.profile.teleport and string.find(msg, L["teleport_trigger"]) then
		self:Message(L["teleport_warn"], "Important")
		self:Bar(L["teleport_bar"], timer.teleport, icon.teleport)
		self:DelayedMessage(timer.teleport-5, L["teleportSoon_warn"], "Important", true, "Alert")
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_OTHER( msg )
	if self.db.profile.shield and string.find(msg, L["shieldDown_trigger"]) then
		self:Message(L["shieldDown_warn"], "Attention")
		self:RemoveBar(L["shield_bar"])
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS( msg )
	if self.db.profile.shield and string.find(msg, L["shieldUp_trigger"]) then
		self:Message(L["shieldUp_warn"], "Important", true, "Alert")
		self:Bar(L["shield_bar"], timer.shield, icon.shield)
	end
end
