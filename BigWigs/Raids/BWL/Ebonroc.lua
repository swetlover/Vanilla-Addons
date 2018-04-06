
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Ebonroc", "Blackwing Lair")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	wingbuffet_trigger = "埃博诺克开始施放龙翼打击。",
	shadowflame_trigger = "埃博诺克开始施放暗影烈焰。",
	shadowcurseyou_trigger = "你受到了埃博诺克之影效果的影响。",
	shadowcurseother_trigger = "(.+)受到了埃博诺克之影效果的影响。",
	wingbuffet_message = "龙翼打击! 30秒后下一次施放!",
	wingbuffet_warning = "现在嘲讽! 龙翼打击马上!",
	shadowflame_warning = "暗影烈焰来临!",
	shadowfcurse_message_you = "你中了埃博诺克之影!",
	shadowfcurse_message_taunt = "%s有埃博诺克之影! 嘲讽!",

	wingbuffetcast_bar = "龙翼打击(锥形击退)",
	wingbuffet_bar = "下个龙翼打击(锥形击退)",
	wingbuffet1_bar = "龙翼打击来临",
	shadowflame_bar = "暗影烈焰(锥形火伤)",
	shadowflame_Nextbar = "下个暗影烈焰(锥形火伤)",
	shadowcurse_bar = "%s - 埃博诺克之影(Boss回血技)",
    shadowcurse_Firstbar = "埃博诺克之影来临",

	cmd = "Ebonroc",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "龙翼打击警报",
	wingbuffet_desc = "龙翼打击警报.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "暗影烈焰警报",
	shadowflame_desc = "暗影烈焰.",

	curse_cmd = "curse",
	curse_name = "埃博诺克之影警报",
	curse_desc = "谁中了埃博诺克之影警报.",
} end)

L:RegisterTranslations("deDE", function() return {
	wingbuffet_trigger = "Schattenschwinge beginnt Fl\195\188gelsto\195\159 zu wirken.",
	shadowflame_trigger = "Schattenschwinge beginnt Schattenflamme zu wirken.",
	shadowcurseyou_trigger = "Ihr seid von Schattenschwinges Schatten betroffen.",
	shadowcurseother_trigger = "(.+) ist von Schattenschwinges Schatten betroffen.",
	wingbuffet_message = "Fl\195\188gelsto\195\159! N\195\164chster in 30 Sekunden!",
	wingbuffet_warning = "SPOTT jetzt! Fl\195\188gelsto\195\159 bald!",
	shadowflame_warning = "Schattenflamme bald!",
	shadowfcurse_message_you = "Du hast Schattenschwinges Schatten!",
	shadowfcurse_message_taunt = "%s hat Schattenschwinges Schatten! SPOTT!",

	wingbuffetcast_bar = "Fl\195\188gelsto\195\159",
	wingbuffet_bar = "N\195\164chster Fl\195\188gelsto\195\159",
	wingbuffet1_bar = "Erster Fl\195\188gelsto\195\159",
	shadowflame_bar = "Schattenflamme",
	shadowflame_Nextbar = "Nächste Schattenflamme",
	shadowcurse_bar = "%s - Schattenschwinges Schatten",
	shadowcurse_Firstbar = "Erster Schattenschwinges Schatten",

	cmd = "Ebonroc",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Alarm f\195\188r Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Warnung, wenn Ebonroc Fl\195\188gelsto\195\159 wirkt.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "Alarm f\195\188r Schattenflamme",
	shadowflame_desc = "Warnung, wenn Ebonroc Schattenflamme wirkt.",

	curse_cmd = "curse",
	curse_name = "Schattenschwinges Schatten Warnungen",
	curse_desc = "Zeigt eine Zeitleiste und k\195\188ndigt an wer Schattenschwinges Schatten bekommt.",
} end)


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"curse", "wingbuffet", "shadowflame", "bosskill"}


-- locals
local timer = {
	wingbuffet = 30,
	wingbuffetCast = 1,
	curse = 8,
	earliestShadowflame = 16,
 	latestShadowflame = 16,
	shadowflameCast = 2,
}
local icon = {
	wingbuffet = "INV_Misc_MonsterScales_14",
	curse = "Spell_Shadow_GatherShadows",
	shadowflame = "Spell_Fire_Incinerate",
}
local syncName = {
	wingbuffet = "EbonrocWingBuffet"..module.revision,
	shadowflame = "EbonrocShadowflame"..module.revision,
	curse = "EbonrocShadow"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")

	self:ThrottleSync(10, syncName.wingbuffet)
	self:ThrottleSync(5, syncName.shadowflame)
	self:ThrottleSync(5, syncName.curse)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.wingbuffet then
		self:Bar(L["wingbuffet1_bar"], timer.wingbuffet, icon.wingbuffet)
		self:DelayedMessage(timer.wingbuffet - 5, L["wingbuffet_warning"], "Attention", nil, nil, true)
	end
	if self.db.profile.curse then
		self:Bar(L["shadowcurse_Firstbar"], timer.curse, icon.curse, true, "white")
	end
	if self.db.profile.shadowflame then
		self:IntervalBar(L["shadowflame_Nextbar"], timer.earliestShadowflame, timer.latestShadowflame, icon.shadowflame)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["shadowflame_trigger"] then
		self:Sync(syncName.shadowflame)
	elseif msg == L["wingbuffet_trigger"] then
		self:Sync(syncName.wingbuffet)
	end
end

function module:Event(msg)
	local _,_,shadowcurseother,_ = string.find(msg, L["shadowcurseother_trigger"])
	if string.find(msg, L["shadowcurseyou_trigger"]) then
		self:Sync(syncName.curse .. " " .. UnitName("player"))
		if self.db.profile.curse then
			self:Message(L["shadowfcurse_message_you"], "Attention")
			self:WarningSign(icon.curse, timer.curse)
		end
	elseif shadowcurseother then
		self:Sync(syncName.curse .. " " .. shadowcurseother)
		if self.db.profile.curse then
			self:Message(string.format(L["shadowfcurse_message_taunt"], shadowcurseother), "Attention")
		end
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.wingbuffet then
		self:WingBuffet()
	elseif sync == syncName.shadowflame then
		self:ShadowFlame()
	elseif sync == syncName.curse and self.db.profile.curse then
		self:Bar(string.format(L["shadowcurse_bar"], rest), timer.curse, icon.curse, true, "Purple")
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:WingBuffet()
	if self.db.profile.wingbuffet then
		self:Message(L["wingbuffet_message"], "Important")
		self:RemoveBar(L["wingbuffet_bar"]) -- remove timer bar
		self:Bar(L["wingbuffetcast_bar"], timer.wingbuffetCast, icon.wingbuffet, true, "black") -- show cast bar
		self:DelayedBar(timer.wingbuffetCast, L["wingbuffet_bar"], timer.wingbuffet, icon.wingbuffet) -- delayed timer bar
		self:DelayedMessage(timer.wingbuffet - 5, L["wingbuffet_warning"], "Attention", nil, nil, true)
	end
end

function module:ShadowFlame()
	if self.db.profile.shadowflame then
		self:Message(L["shadowflame_warning"], "Important", true, "Alarm")
		self:RemoveBar(L["shadowflame_Nextbar"]) -- remove timer bar
		self:Bar(L["shadowflame_bar"], timer.shadowflameCast, icon.shadowflame, true, "Orange") -- show cast bar
		self:DelayedIntervalBar(timer.shadowflameCast, L["shadowflame_Nextbar"], timer.earliestShadowflame-timer.shadowflameCast, timer.latestShadowflame-timer.shadowflameCast, icon.shadowflame, true, "Yellow") -- delayed timer bar
	end
end
