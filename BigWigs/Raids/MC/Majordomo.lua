
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Majordomo Executus", "Molten Core")

module.revision = 20007 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"magic", "dmg", "adds", "bosskill"}

module.defaultDB = {
	adds = false,
}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	shieldDuration = 10,
	shieldInterval = 30,
	firstShield = 30,
}
local icon = {
	shield = "Spell_Shadow_DetectLesserInvisibility",
	magic = "Spell_Frost_FrostShock",
	dmg = "Spell_Shadow_AntiShadow",
}
local syncName = {
	dmg = "DomoAuraDamage"..module.revision,
	magic = "DomoAuraMagic"..module.revision,
	healerDead = "DomoHealerDead",
	eliteDead = "DomoEliteDead",
}



----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	disabletrigger = "My flame! Please don",
    engage_trigger = "Reckless mortals, none may challenge the sons of the living flame!",

	magic_trigger = "获得了魔法反射的效果",
	dmg_trigger = "获得了伤害反射护盾的效果",
	magic_over_trigger = "伤害反射护盾效果从",
	damage_over_trigger = "魔法反射效果从",
	healdead = "烈焰行者医师死亡",
	elitedead = "烈焰行者精英死亡",
	elitename = "烈焰行者精英",
	healername = "烈焰行者医师",

	magic_warn = "魔法反射10秒!",
	dmg_warn = "伤害反射护盾10秒!",
	shield_warn_soon = "3秒后施放光环!",
	magic_over_warn = "魔法反射!",
	dmg_over_warn = "伤害反射护盾!",
	hdeadmsg = "%d/4 烈焰行者医师死亡!",
	edeadmsg = "%d/4 烈焰行者精英死亡!",

	magic_bar = "法伤盾(反射法术)",
	dmg_bar = "物伤盾(近战100点奥伤)",
	shield_bar = "新的护盾",

	cmd = "Majordomo",
	
	adds_cmd = "adds",
	adds_name = "小怪死亡",
	adds_desc = "小怪死亡通告",
	
	magic_cmd = "magic",
	magic_name = "魔法反射",
	magic_desc = "魔法反射警报",
	
	dmg_cmd = "dmg",
	dmg_name = "伤害反射护盾",
	dmg_desc = "伤害反射护盾警报",
} end)

L:RegisterTranslations("deDE", function() return {
	disabletrigger = "Ich werde euch nun verlassen",
	engage_trigger = "Niemand fordert die Söhne der Lebenden Flamme heraus", --"Reckless mortals, none may challenge the sons of the living flame!",

	magic_trigger = "bekommt \'Magiereflexion'",
	dmg_trigger = "bekommt \'Schadensschild'",
	magic_over_trigger = "Magiereflexion schwindet von",
	damage_over_trigger = "Schadensschild schwindet von",
	healdead = "Feuerschuppenheiler stirbt",
	elitedead = "Feuerschuppenelite stirbt",
	elitename = "Feuerschuppenelite",
	healername = "Feuerschuppenheiler",

	magic_warn = "Magiereflexion für 10 Sekunden!",
	dmg_warn = "Schadensschild für 10 Sekunden!",
	shield_warn_soon = "Neue Schilder in 3 Sekunden!",
	magic_over_warn = "Magiereflexion beendet!",
	dmg_over_warn = "Schadensschild beendet!",
	hdeadmsg = "%d/4 Heiler tot!",
	edeadmsg = "%d/4 Elite tot!",

	--cmd = "Majordomo",

	magic_bar = "Magiereflexion",
	dmg_bar = "Schadensschild",
	shield_bar = "Nächstes Schild",

	--adds_cmd = "adds",
	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Feuerschuppenheiler und Feuerschuppenelite Tod.",

	--magic_cmd = "magic",
	magic_name = "Magiereflexion",
	magic_desc = "Warnung, wenn Magiereflexion aktiv.",

	--dmg_cmd = "dmg",
	dmg_name = "Schadensschild",
	dmg_desc = "Warnung, wenn Schadensschild aktiv.",
} end)


------------------------------
--      Initialization      --
------------------------------

module.wipemobs = { L["elitename"], L["healername"] }
module:RegisterYellEngage(L["engage_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:ThrottleSync(2, syncName.dmg)
	self:ThrottleSync(2, syncName.magic)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	self.started = nil
	self.hdead = 0
	self.edead = 0
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.magic or self.db.profile.dmg then
		self:Bar(L["shield_bar"], timer.firstShield, icon.shield)
		self:DelayedMessage(timer.firstShield - 5, L["shield_warn_soon"], "Urgent", nil, nil, true)
	end
	--self:TriggerEvent("BigWigs_StartCounterBar", self, "Priests dead", 4, "Interface\\Icons\\Spell_Holy_BlessedRecovery")
	--self:TriggerEvent("BigWigs_SetCounterBar", self, "Priests dead", (4 - 0.1))
	--self:TriggerEvent("BigWigs_StartCounterBar", self, "Elites dead", 4, "Interface\\Icons\\Ability_Hunter_Harass")
	--self:TriggerEvent("BigWigs_SetCounterBar", self, "Elites dead", (4 - 0.1))
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["disabletrigger"]) then
		self:SendBossDeathSync()
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["magic_trigger"]) then
		self:Sync(syncName.magic)
	elseif string.find(msg, L["dmg_trigger"]) then
		self:Sync(syncName.dmg)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if string.find(msg, L["healdead"]) then
		self:Sync(syncName.healerDead .. " " .. tostring(self.hdead + 1))
	elseif string.find(msg, L["elitedead"]) then
		self:Sync(syncName.eliteDead .. " " .. tostring(self.edead + 1))
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == "DomoHealerDead" and rest and rest ~= "" then
		rest = tonumber(rest)
		if rest <= 4 and self.hdead < rest then
			self.hdead = rest
			if self.db.profile.adds then
				self:TriggerEvent("BigWigs_Message", string.format(L["hdeadmsg"], self.hdead), "Positive")
				--self:TriggerEvent("BigWigs_SetCounterBar", self, "Priests dead", (4 - self.hdead))
			end
		end
	elseif sync == "DomoEliteDead" and rest and rest ~= "" then
		rest = tonumber(rest)
		if rest <= 4 and self.edead < rest then
			self.edead = rest
			if self.db.profile.adds then
				self:TriggerEvent("BigWigs_Message", string.format(L["edeadmsg"], self.edead), "Positive")
				--self:TriggerEvent("BigWigs_SetCounterBar", self, "Elites dead", (4 - self.edead))
			end
		end
	elseif sync == syncName.magic then
		self:MagicShield()
	elseif sync == syncName.dmg then
		self:DamageShield()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:MagicShield()
	if self.db.profile.magic then
		self:RemoveBar(L["shield_bar"])
		self:Message(L["magic_warn"], "Attention")
		self:Bar(L["magic_bar"], timer.shieldDuration, icon.magic)
	end
	if self.db.profile.magic or self.db.profile.dmg then
		self:DelayedBar(timer.shieldDuration, L["shield_bar"], timer.shieldInterval - timer.shieldDuration, icon.shield)
		self:DelayedMessage(timer.shieldInterval - 5, L["shield_warn_soon"], "Urgent", nil, nil, true)
	end
end

function module:DamageShield()
	if self.db.profile.dmg then
		self:RemoveBar(L["shield_bar"])
		self:Message(L["dmg_warn"], "Attention")
		self:Bar(L["dmg_bar"], timer.shieldDuration, icon.dmg)
	end
	if self.db.profile.magic or self.db.profile.dmg then
		self:DelayedBar(timer.shieldDuration, L["shield_bar"], timer.shieldInterval - timer.shieldDuration, icon.shield)
		self:DelayedMessage(timer.shieldInterval - 5, L["shield_warn_soon"], "Urgent", nil, nil, true)
	end
end
