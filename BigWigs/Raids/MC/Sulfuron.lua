
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Sulfuron Harbinger", "Molten Core")

module.revision = 20007 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"heal", "adds", "knockback", "bosskill"}

module.defaultDB = {
	adds = false,
}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	knockback = 12,
	firstKnockback = 6,
	heal = 2,
	flame_spear = 12,
}
local icon = {
	knockback = "Spell_Fire_Fireball",
	heal = "Spell_Shadow_ChillTouch",
	flame_spear = "Spell_Fire_FlameBlades",
}
local syncName = {
	knockback = "SulfuronKnockback"..module.revision,
	heal = "SulfuronAddHeal"..module.revision,
	flame_spear = "SulfuronSpear"..module.revision,
	add_dead = "SulfuronAddDead",
}

local deadpriests = 0

----------------------------
--      Localization      --
----------------------------


L:RegisterTranslations("zhCN", function() return {
	triggeradddead = "烈焰行者祭司死亡了。",
	triggercast = "开始施放黑暗治疗",
    spear_cast = "开始施展烈焰之矛",
	healbar = "黑暗治疗(治疗友方)",
	knockbacktimer = "近战AoE击退",
	knockbackannounce = "3 秒后击退!",
	healwarn = "加大治疗!",
	knockback1 = "拉格纳罗斯之手击中",
	knockback11 = "拉格纳罗斯之手击中",
	knockback2 = "拉格纳罗斯之手被抵抗了。",
	knockback3 = "吸收了(.+)的拉格纳罗斯之手",
	knockback33 = "拉格纳罗斯之手被吸收了。",
	knockback4 = "(.+)对拉格纳罗斯之手免疫。",
	flamewakerpriest_name = "烈焰行者祭司",

	addmsg = "%d/4 烈焰行者祭司死亡!",

    flame_spear_bar = "烈焰之矛(1000火伤)",
            
	cmd = "Sulfuron",
	
	knockback_cmd = "knockback",
	knockback_name = "拉格纳罗斯之手通告",
	knockback_desc = "显示击退时间",
	
	heal_cmd = "heal",
	heal_name = "增加治疗",
	heal_desc = "黑暗治疗时通告增加治疗",
	
	adds_cmd = "adds",
	adds_name = "小怪死亡",
	adds_desc = "烈焰行者死亡通告",
} end)

L:RegisterTranslations("deDE", function() return {
	triggeradddead = "Flamewaker Priest stirbt",
	triggercast = "beginnt Dunkle Besserung",
	spear_cast = "beginnt Flammenspeer zu wirken",
	healbar = "Dunkle Besserung",
	knockbacktimer = "~AoE Rücksto\195\159",
	knockbackannounce = "3 Sekunden bis Rücksto\195\159!",
	healwarn = "Heilung!",
	knockback1 = "trifft(.+)Hand von Ragnaros",
	knockback11 = "Hand von Ragnaros(.+)trifft",
	knockback2 = "Hand von Ragnaros(.+)widerstanden",
	knockback3 = "absorbiert (.+) Hand von Ragnaros",
	knockback33 = "Hand von Ragnaros (.+) absorbiert",
	knockback4 = "Hand von Ragnaros(.+) immun",
	flamewakerpriest_name = "Flamewaker Priest",

	addmsg = "%d/4 Flamewaker Priest tot!",

	flame_spear_bar = "Flammenspeer",

	cmd = "Sulfuron",

	knockback_cmd = "knockback",
	knockback_name = "Verkündet Hand von Ragnaros",
	knockback_desc = "Zeige Timer für Rückstö\195\159e",

	heal_cmd = "heal",
	heal_name = "Heilung der Adds",
	heal_desc = "Verkündet Heilung der Flamewaker Priest",

	adds_cmd = "adds",
	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Flamewaker Priests Tod",
} end)


------------------------------
--      Initialization      --
------------------------------

module.wipemobs = { L["flamewakerpriest_name"] }

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")

	self:ThrottleSync(1, syncName.heal)
	self:ThrottleSync(5, syncName.knockback)
	self:ThrottleSync(5, syncName.flame_spear)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	self.started = nil
	deadpriests = 0
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.knockback then
		self:Bar(L["knockbacktimer"], timer.firstKnockback, icon.knockback)
		self:DelayedMessage(timer.firstKnockback - 3, L["knockbackannounce"], "Urgent")
	end
	--self:TriggerEvent("BigWigs_StartCounterBar", self, "Priests dead", 4, "Interface\\Icons\\Spell_Holy_BlessedRecovery")
	--self:TriggerEvent("BigWigs_SetCounterBar", self, "Priests dead", (4 - 0.1))
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end

------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if string.find(msg, L["triggeradddead"]) then
		self:Sync(syncName.add_dead .. " " .. tostring(deadpriests + 1))
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if string.find(msg, L["triggercast"]) then
		self:Sync(syncName.heal)
	end
end

function module:Events(msg)
	if (string.find(msg, L["knockback1"]) or string.find(msg, L["knockback11"]) or string.find(msg, L["knockback2"]) or string.find(msg, L["knockback3"]) or string.find(msg, L["knockback33"]) or string.find(msg, L["knockback4"])) then
		self:Sync(syncName.knockback)
	elseif string.find(msg,"spear_cast") then
		self:Sync(syncName.flame_spear)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.add_dead and rest and rest ~= "" then
		rest = tonumber(rest)
		if rest <= 4 and deadpriests < rest then
			deadpriests = rest
			if self.db.profile.adds then
				self:Message(string.format(L["addmsg"], deadpriests), "Positive")
				--self:TriggerEvent("BigWigs_SetCounterBar", self, "Priests dead", (4 - deadpriests))
			end
		end
	elseif sync == syncName.heal and self.db.profile.heal then
		self:Message(L["healwarn"], "Attention", true, "Alarm")
		self:Bar(L["healbar"], timer.heal, icon.heal)
	elseif sync == syncName.knockback and self.db.profile.knockback then
		self:Bar(L["knockbacktimer"], timer.knockback, icon.knockback)
		self:DelayedMessage(timer.knockback - 3, L["knockbackannounce"], "Urgent")
	elseif sync == syncName.flame_spear then
		self:Bar(L["flame_spear_bar"], timer.flame_spear, icon.flame_spear)
	end
end
