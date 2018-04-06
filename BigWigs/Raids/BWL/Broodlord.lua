
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Broodlord Lashlayer", "Blackwing Lair")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Broodlord",

	engage_trigger = "None of your kind should be here",
	ms_trigger = "^(.+)(.+)致死打击效果的影响",
	ms_trigger2 = "勒西雷尔的致死打击",
	bw_trigger = "^(.+)(.+)冲击波效果的影响",
	deathyou_trigger = "你死了。",
	deathother_trigger = "(.+)死亡了。",
	ms_warn_you = "你中了致死打击!",
	ms_warn_other = "致死打击 %s!",
	bw_warn = "冲击波马上!",
	ms_bar = "致死打击: %s",
	msnext_bar = "下个致死打击",
	bw_bar = "可能冲击波(近战AOE击退)",
	knock_bar = "击退 (坦克)",
	knock_trigger = "勒西雷尔的击退",

	you = "你",
	are = "受到了",

	ms_cmd = "ms",
	ms_name = "致死打击(有误差)",
	ms_desc = "警告当有致死打击.",
	
	knock_cmd = "knock",
	knock_name = "击退",
	knock_desc = "计时条显示击退可能的冷却.",

	bw_cmd = "bw",
	bw_name = "冲击波",
	bw_desc = "显示一个条与可能的冲击波冷却时间.\n\n(免责声明: 这从8到15秒不等. 安全选择最短区间.)",
} end )

L:RegisterTranslations("deDE", function() return {
	--cmd = "Broodlord",

	engage_trigger = "Euresgleichen sollte nicht hier sein!",
	ms_trigger = "^(.+) (.+) von T\195\182dlicher Sto\195\159 betroffen",
	bw_trigger = "^(.+) (.+) von Druckwelle betroffen",
	deathyou_trigger = "Ihr sterbt.",
	deathother_trigger = "(.+) stirbt.",
	ms_warn_you = "T\195\182dlicher Sto\195\159 auf Dir!",
	ms_warn_other = "T\195\182dlicher Sto\195\159 auf %s!",
	bw_warn = "Druckwelle bald!",
	ms_bar = "T\195\182dlicher Sto\195\159: %s",
	bw_bar = "Druckwelle",

	you = "Ihr",
	are = "seid",

	--ms_cmd = "ms",
	ms_name = "T\195\182dlicher Sto\195\159",
	ms_desc = "Warnung wenn ein Spieler von Tödlicher Sto\195\159 betroffen ist und startet einen anklickbaren Balken für eine einfache Auswahl.",

	--bw_cmd = "bw",
	bw_name = "Druckwelle",
	bw_desc = "Zeigt einen Balken mit der möglichen Druckwellenabklingzeit.\n\n(Hinweis: Diese variiert von 8 bis 15 Sekunden. Zur Sicherheit wurde der kürzeste Intervall gewählt.)",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20006 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"ms", "bw", "knock", "bosskill"}


-- locals
local timer = {
	firstBlastWave = 20,
	earliestBlastWave = 22,
	latestBlastWave = 35,
	mortalStrike = 5,
	firstMortal = 25,
	earliestMortalStrike = 27,
 	latestMortalStrike = 34,
 	firstKnockAway = 12,
 	knockAwayInterval = 13,
}
local icon = {
	blastWave = "Spell_Holy_Excorcism_02",
	mortalStrike = "Ability_Warrior_SavageBlow",
	knockAway = "INV_Gauntlets_05"
}
local syncName = {}

local lastBlastWave = 0
local lastMS = 0
local MS = ""
local lastKnock = 0


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["engage_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CheckForKnockaway")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "CheckForKnockaway")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CheckForKnockaway")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	--self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	lastBlastWave = 0
	lastMS = 0
	lastKnock = 0
	MS = ""
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.bw then
		self:Bar(L["bw_bar"], timer.firstBlastWave, icon.blastWave, true, "Red")
	end
	if self.db.profile.ms then
		self:Bar("第一次致死打击", timer.firstMortal, icon.mortalStrike, true, "Black")
	end
	if self.db.profile.knock then
		self:Bar(L["knock_bar"], timer.firstKnockAway, icon.knockAway)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:Event(msg)
	local _, _, name, detect = string.find(msg, L["ms_trigger"])
	if name and detect and self.db.profile.ms then
		MS = name
		lastMS = GetTime()
		self:IntervalBar(L["msnext_bar"], timer.earliestMortalStrike, timer.latestMortalStrike, icon.mortalStrike)
		if detect == L["are"] then
			self:Message(L["ms_warn_you"], "Core", true, "Beware")
			self:Bar(string.format(L["ms_bar"], UnitName("player")), timer.mortalStrike, icon.mortalStrike, true, "Black")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["ms_bar"], UnitName("player")), function(name, button, extra) TargetByName(extra, true) end, UnitName("player"))
			self:WarningSign(icon.mortalStrike, timer.mortalStrike)
		else
			self:Message(string.format(L["ms_warn_other"], name), "Core", true, "Alarm")
			self:Bar(string.format(L["ms_bar"], name), timer.mortalStrike, icon.mortalStrike, true, "Black")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["ms_bar"], name), function(name, button, extra) TargetByName(extra, true) end, name)
		end
	elseif string.find(msg, L["bw_trigger"]) and self.db.profile.bw then
		if GetTime() - lastBlastWave > 5 then
			self:IntervalBar(L["bw_bar"], timer.earliestBlastWave, timer.latestBlastWave, icon.blastWave, true, "Red")
			--self:ScheduleEvent("BigWigs_Message", 24, L["bw_warn"], "Urgent", true, "Alert")
		end
		lastBlastWave = GetTime()
	end
end

function module:CheckForKnockaway(msg)
	if string.find(msg, L["knock_trigger"]) and self.db.profile.knock then
 		if GetTime() - lastKnock > 5 then
 			self:Bar(L["knock_bar"], timer.knockAwayInterval, icon.knockAway, true, "White")
 		end
 		lastKnock = GetTime()
	elseif string.find(msg, L["ms_trigger2"]) and self.db.profile.ms then
		self:IntervalBar(L["msnext_bar"], timer.earliestMortalStrike, timer.latestMortalStrike, icon.mortalStrike)
	end
end

--[[function module:CHAT_MSG_COMBAT_FRIENDLY_DEATH(msg)
if not self.db.profile.bw then return end
local _, _, deathother = string.find(msg, L["deathother_trigger"])
if msg == L["deathyou_trigger"] then
self:RemoveBar(string.format(L["ms_bar"], UnitName("player")))
elseif deathother then
self:RemoveBar(string.format(L["ms_bar"], deathother))
end
end]]

function module:PLAYER_TARGET_CHANGED()
	if (lastMS + 5) > GetTime() and UnitName("target") == MS then
		if self.db.profile.ms then
			self:WarningSign(icon.mortalStrike, (lastMS + 5) - GetTime())
		end
	else
		self:RemoveWarningSign(icon.mortalStrike)
	end
end
