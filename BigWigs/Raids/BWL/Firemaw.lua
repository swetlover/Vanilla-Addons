
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Firemaw", "Blackwing Lair")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	wingbuffet_trigger = "费尔默开始施放龙翼打击。",
	shadowflame_trigger = "费尔默开始施放暗影烈焰。",
	flamebuffetafflicted_trigger = "受到了烈焰打击",
	flamebuffetresisted_trigger = "费尔默烈焰打击被抵抗了。",
	flamebuffetimmune_trigger = "费尔默的烈焰打击施放失败。(.+)对此免疫。",
	flamebuffetabsorb1_trigger = "你吸收了费尔默的烈焰打击。",
	flamebuffetabsorb2_trigger = "费尔默的烈焰打击被(.+)吸收了。",

	wingbuffet_message = "龙翼打击! 下次30秒后施放!",
	wingbuffet_warning = "现在嘲讽! 龙翼打击马上!",
	shadowflame_warning = "暗影烈焰来临!",

	wingbuffetcast_bar = "龙翼打击(锥形击退)",
	wingbuffet_bar = "下次龙翼打击(锥形击退)",
	wingbuffet1_bar = "龙翼打击来临",
	shadowflame_bar = "暗影烈焰(锥形火伤)",
	shadowflame_Nextbar = "下次暗影烈焰(锥形火伤)",
	flamebuffet_bar = "烈焰打击(叠得越高受伤越高)",

	cmd = "Firemaw",

	flamebuffet_cmd = "flamebuffet",
	flamebuffet_name = "烈焰打击警报",
	flamebuffet_desc = "烈焰打击警报.",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "龙翼打击警报",
	wingbuffet_desc = "龙翼打击警报.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "暗影烈焰警报",
	shadowflame_desc = "暗影烈焰警报.",
} end)

L:RegisterTranslations("deDE", function() return {
	wingbuffet_trigger = "Ebonroc beginnt Fl\195\188gelsto\195\159 zu wirken.",
	shadowflame_trigger = "Ebonroc beginnt Schattenflamme zu wirken.",
	flamebuffetafflicted_trigger = "von Flammenpuffer betroffen",
	flamebuffetresisted_trigger = "Flammenpuffer(.+) widerstanden",
	flamebuffetimmune_trigger = "Flammenpuffer(.+) immun",
	flamebuffetabsorb1_trigger = "Ihr absorbiert Firemaws Flammenpuffer",
	flamebuffetabsorb2_trigger = "Flammenpuffer von Firemaw wird absorbiert von",

	wingbuffet_message = "Fl\195\188gelsto\195\159! N\195\164chster in 30 Sekunden!",
	wingbuffet_warning = "Jetzt TAUNT! Fl\195\188gelsto\195\159 bald!",
	shadowflame_warning = "Schattenflamme bald!",

	wingbuffetcast_bar = "Fl\195\188gelsto\195\159",
	wingbuffet_bar = "N\195\164chster Fl\195\188gelsto\195\159",
	wingbuffet1_bar = "Erster Fl\195\188gelsto\195\159",
	shadowflame_bar = "Schattenflamme",
	shadowflame_Nextbar = "Nächste Schattenflamme",
	flamebuffet_bar = "Flammenpuffer",

	cmd = "Firemaw",

	flamebuffet_cmd = "flamebuffet",
	flamebuffet_name = "Alarm f\195\188r Flammenpuffer",
	flamebuffet_desc = "Warnung f\195\188r Flammenpuffer.",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Alarm f\195\188r Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Warnung, wenn Ebonroc Fl\195\188gelsto\195\159 wirkt.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "Alarm f\195\188r Schattenflamme",
	shadowflame_desc = "Warnung, wenn Ebonroc Schattenflamme wirkt.",
} end)


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"wingbuffet", "shadowflame", "flamebuffet", "bosskill"}


-- locals
local timer = {
	firstWingbuffet = 30,
	wingbuffet = 30,
	wingbuffetCast = 1,
	earliestShadowflame = 16,
 	latestShadowflame = 16,
	shadowflameCast = 2,
	firstFlameBuffet = 2,
	flameBuffet = 3,
}
local icon = {
	wingbuffet = "INV_Misc_MonsterScales_14",
	shadowflame = "Spell_Fire_Incinerate",
	flameBuffet = "Spell_Fire_Fireball"
}
local syncName = {
	wingbuffet = "FiremawWingBuffet"..module.revision,
	shadowflame = "FiremawShadowflame"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")

	self:ThrottleSync(10, syncName.wingbuffet)
	self:ThrottleSync(10, syncName.shadowflame)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.wingbuffet then
		self:DelayedMessage(timer.firstWingbuffet - 5, L["wingbuffet_warning"], "Attention", nil, nil, true)
		self:Bar(L["wingbuffet1_bar"], timer.firstWingbuffet, icon.wingbuffet)
	end
	if self.db.profile.shadowflame then
		self:IntervalBar(L["shadowflame_Nextbar"], timer.earliestShadowflame, timer.latestShadowflame, icon.shadowflame)
	end
	if self.db.profile.flamebuffet then
		self:Bar(L["flamebuffet_bar"], timer.firstFlameBuffet, icon.flameBuffet, true, "White")
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end

------------------------------
--      Event Handlers      --
------------------------------

function module:Event(msg)
	if msg == L["wingbuffet_trigger"] then
		self:Sync(syncName.wingbuffet)
	elseif msg == L["shadowflame_trigger"] then
		self:Sync(syncName.shadowflame)
		-- flamebuffet triggers too often on nefarian and therefor this warning doesn't make any sense
	elseif (string.find(msg, L["flamebuffetafflicted_trigger"]) or string.find(msg, L["flamebuffetresisted_trigger"]) or string.find(msg, L["flamebuffetimmune_trigger"]) or string.find(msg, L["flamebuffetabsorb1_trigger"]) or string.find(msg, L["flamebuffetabsorb2_trigger"])) and self.db.profile.flamebuffet then
		self:Bar(L["flamebuffet_bar"], timer.flameBuffet, icon.flameBuffet, true, "White")
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.wingbuffet and self.db.profile.wingbuffet then
		self:Message(L["wingbuffet_message"], "Important")
		self:RemoveBar(L["wingbuffet_bar"]) -- remove timer bar
		self:Bar(L["wingbuffetcast_bar"], timer.wingbuffetCast, icon.wingbuffet, true, "Black") -- show cast bar
		self:DelayedBar(timer.wingbuffetCast, L["wingbuffet_bar"], timer.wingbuffet, icon.wingbuffet) -- delayed timer bar
		self:DelayedMessage(timer.wingbuffet - 5, L["wingbuffet_warning"], "Attention", nil, nil, true)
	elseif sync == syncName.shadowflame and self.db.profile.shadowflame then
		self:Message(L["shadowflame_warning"], "Important", true, "Alarm")
		self:RemoveBar(L["shadowflame_Nextbar"]) -- remove timer bar
		self:Bar(L["shadowflame_bar"], timer.shadowflameCast, icon.shadowflame, true, "Orange") -- show cast bar
		self:DelayedIntervalBar(timer.shadowflameCast, L["shadowflame_Nextbar"], timer.earliestShadowflame-timer.shadowflameCast, timer.latestShadowflame-timer.shadowflameCast, icon.shadowflame, true, "Yellow") -- delayed timer bar
	end
end
