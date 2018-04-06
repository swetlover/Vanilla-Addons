-- reset orb in p2

----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Razorgore the Untamed", "Blackwing Lair")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Razorgore",

	start_trigger = "Intruders have breached",
	start_message = "阶段 1",
	mobs_soon = "第一波 5秒!",
	mobs_bar = "小怪出现",
	orbcontrolother_trigger = "(.+)受到了心灵疲惫效果的影响。",
	orbcontrolyou_trigger = "你受到了心灵疲惫效果的影响。",
	mindcontrolother_trigger = "(.+)受到了统御意志效果的影响。",
	mindcontrolyou_trigger = "你受到了统御意志效果的影响。",
	mindcontrol_message = "%s 是精神控制!",
	mindcontrol_message_you = "精神控制!",
	mindcontrol_bar = "精神控制: %s",
	mindcontrolyouend_trigger = "统御意志效果从你身上消失了。",
	mindcontrolotherend_trigger = "统御意志效果从(.+)身上消失。",
	polymorphother_trigger = "(.+)受到了强效变形术效果的影响。",
	polymorphyou_trigger = "你受到了强效变形术效果的影响。",
	polymorph_message = "%s 变形! 驱散!",
	polymorph_message_you = "你被变形!",
	polymorph_bar = "变形: %s (驱散他)",
	polymorphyouend_trigger = "强效变形术效果从你身上消失了。",
	polymorphotherend_trigger = "强效变形术效果从(.+)身上消失。",
	deathyou_trigger = "你死了。",
	deathother_trigger = "(.+)死亡了。",
	egg_trigger = "狂野的拉佐格尔开始施放摧毁蛋。",
	egg_message = "%d/30 摧毁蛋",
	egg_bar = "摧毁蛋",
    -- there is no clear phase2 trigger
	phase2_trigger = "I'm free! That device shall never torment me again!", --"You'll pay for forcing me to do this.", 
	phase2_message = "阶段 2",
	volley_trigger = "狂野的拉佐格尔开始施放连珠火球。",
	volley_bar = "连珠火球(注意躲避)",
	volley_message = "躲起来!",
	conflagration_trigger = "受到了燃烧效果",
	conflagration_bar = "燃烧(点燃当前T)",
	warstomp_bar = "战争践踏(AOE)",
	orb_bar = "宝珠控制: %s",
	destroyegg_yell1 = "You'll pay for forcing me to do this!",
	destroyegg_yell2 = "Fools! These eggs are more precious than you know!",
	destroyegg_yell3 = "No! Not another one! I'll have your heads for this atrocity!",

	mc_cmd = "mindcontrol",
	mc_name = "精神控制",
	mc_desc = "宣布谁被精神控制和启动宝珠.",

	eggs_cmd = "eggs",
	eggs_name = "蛋数量",
	eggs_desc = "蛋销毁数量.",

	phase_cmd = "phase",
	phase_name = "阶段",
	phase_desc = "阶段变化警告.",

	mobs_cmd = "mobs",
	mobs_name = "第一波小怪",
	mobs_desc = "显示第一波小怪刷新.",

	orb_cmd = "orb",
	orb_name = "宝珠控制",
	orb_desc = "告诉你谁是控制boss开始.",

	fireballvolley_cmd = "fireballvolley",
	fireballvolley_name = "连珠火球",
	fireballvolley_desc = "连珠火球警报.",

	conflagration_cmd = "conflagration",
	conflagration_name = "燃烧",
	conflagration_desc = "燃烧持续时间.",

	polymorph_cmd = "polymorph",
	polymorph_name = "强效变形术",
	polymorph_desc = "告诉你谁有变形控制器开始.",
	
	icon_cmd = "icon",
	icon_name = "精神控制RAID图标",
	icon_desc = "将RAID图标在精神控制的玩家.\n\n(需要L或A)",
} end)

L:RegisterTranslations("deDE", function() return {
	cmd = "Razorgore",

	start_trigger = "Intruders have breached",
	start_message = "Phase 1",
	mobs_soon = "Erste Welle in 5sec!",
	mobs_bar = "Erste Welle",
	orbcontrolother_trigger = "(.+) ist von Gedankenersch\195\182pfung betroffen\.",
	orbcontrolyou_trigger = "Ihr seid von Gedankenersch\195\182pfung betroffen\.",
	mindcontrolother_trigger = "(.+) ist von Gedanken beherrschen betroffen\.",
	mindcontrolyou_trigger = "Ihr seid von Gedanken beherrschen betroffen\.",
	mindcontrol_message = "%s ist ferngesteuert!",
	mindcontrol_message_you = "Du bist ferngesteuert!",
	mindcontrol_bar = "Gedankenkontrolle: %s",
	mindcontrolyouend_trigger = "'Gedanken beherrschen' schwindet von Euch\.",
	mindcontrolotherend_trigger = "Gedanken beherrschen schwindet von (.+)\.",
	polymorphother_trigger = "(.+) ist von Gro\195\159e Verwandlung betroffen\.",
	polymorphyou_trigger = "Ihr seid von Gro\195\159e Verwandlung betroffen\.",
	polymorph_message = "%s ist polymorphed! Entfernt es!",
	polymorph_message_you = "Du bist polymorphed!",
	polymorph_bar = "Polymorph: %s",
	polymorphyouend_trigger = "'Gro\195\159e Verwandlung' schwindet von Euch\.",
	polymorphotherend_trigger = "Gro\195\159e Verwandlung schwindet von (.+)\.",
	deathyou_trigger = "Du stirbst\.",
	deathother_trigger = "(.+) stirbt\.",
	egg_trigger = "Razorgore the Untamed beginnt Ei zerst\195\182ren zu wirken\.",
	egg_message = "%d/30 Eier zerst\195\182rt!",
	egg_bar = "Ei zerst\195\182ren",
	phase2_trigger = "I'm free! That device shall never torment me again!",
	phase2_message = "Phase 2",
	volley_trigger = "Razorgore the Untamed beginnt Feuerballsalve zu wirken\.",
	volley_bar = "Feuerballsalve",
	volley_message = "Verstecken!",
	conflagration_trigger = "von Gro\195\159brand betroffen",
	conflagration_bar = "Gro\195\159brand",
	warstomp_bar = "War Stomp",
	orb_bar = "Orb Kontrolle: %s",
	destroyegg_yell1 = "You'll pay for forcing me to do this\.",
	destroyegg_yell2 = "Fools! These eggs are more precious than you know!",
	destroyegg_yell3 = "No - not another one! I'll have your heads for this atrocity!",

	mc_cmd = "mindcontrol",
	mc_name = "Gedankenkontrolle",
	mc_desc = "Gibt bekannt, die unter Gedankenkontrolle bekommt und beginnt einen anklickbaren Balken f\195\188r einfache Auswahl.",

	eggs_cmd = "eggs",
	eggs_name = "Eier",
	eggs_desc = "Hat ein Z\195\164hler f\195\188r Schwarzes Dracheneier zerst\195\182rt.",

	phase_cmd = "phase",
	phase_name = "Phasen",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses.",

	mobs_cmd = "mobs",
	mobs_name = "Erste Welle",
	mobs_desc = "Zeigt Ihnen, wann die erste Welle spawnt.",

	orb_cmd = "orb",
	orb_name = "Orb Kontrolle",
	orb_desc = "Zeigt Ihnen, wer ist die Steuerung der Boss und beginnt einen anklickbaren Balken f\195\188r einfache Auswahl.",

	fireballvolley_cmd = "fireballvolley",
	fireballvolley_name = "Feuerballsalve",
	fireballvolley_desc = "Gibt bekannt, wenn der Boss wirft Feuerballsalve.",

	conflagration_cmd = "conflagration",
	conflagration_name = "Gro\195\159brand",
	conflagration_desc = "Startet eine Balken mit der Dauer der Gro\195\159brand.",

	polymorph_cmd = "polymorph",
	polymorph_name = "Gro\195\159e Verwandlung",
	polymorph_desc = "Sagt Ihnen, wer von Grethok den Controller polymorphed habe und startet einen anklickbaren Balken f\195\188r einfache Auswahl.",

	icon_cmd = "icon",
	icon_name = "Schlachtzugsymbol auf die Gedankenkontrolle Spieler",
	icon_desc = "Versetzt eine Schlachtzugsymbol auf der Gedankenkontrolle Spieler.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
} end)


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
local controller = AceLibrary("Babble-Boss-2.2")["Grethok the Controller"]
module.revision = 20007 -- To be overridden by the module!
module.enabletrigger = {module.translatedName, controller} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"phase", "mobs", "eggs", "polymorph", "mc", "icon", "orb", "fireballvolley", "conflagration", "bosskill"}


-- locals
local timer = {
	mobspawn = 46,
	mc = 15,
	polymorph = 20,
	conflagrate = 14,
	firstConflagrate = 12,
	firstVolley = 6,
	firstWarStomp = 21,
	volley = 2,
	egg = 3,
	orb = 90,
}
local icon = {
	mobspawn = "Spell_Holy_PrayerOfHealing",
	egg = "INV_Misc_MonsterClaw_02",
	orb = "INV_Misc_Gem_Pearl_03",
	volley = "Spell_Fire_FlameBolt",
}
local syncName = {
	egg = "RazorgoreEgg"..module.revision,
	eggStart = "RazorgoreEggStart"..module.revision,
	orb = "RazorgoreOrbStart"..module.revision,
	orbOver = "RazorgoreOrbStop"..module.revision,
	volley = "RazorgoreVolleyCast"..module.revision,
	phase2 = "RazorgorePhaseTwo"..module.revision,
}

local doCheckForWipe = false


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Events")
	--self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH", "Events")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")


	self:ThrottleSync(5, syncName.egg)
	self:ThrottleSync(5, syncName.orb)
	self:ThrottleSync(5, syncName.orbOver)
	self:ThrottleSync(3, syncName.volley)
end


-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self.started        = nil
	self.phase          = 0
	self.previousorb    = nil
	self.eggs           = 0
	self.freetime		= 0
	self.orbOverTime 	= 0
	doCheckForWipe = false

end

-- called after boss is engaged
function module:OnEngage()
	doCheckForWipe = true
	self.orbOverTime = GetTime()
	self.freetime = 0
	if self.db.profile.phase then
		self:Message(L["start_message"], "Attention")
	end
	if self.db.profile.mobs then
		self:Bar(L["mobs_bar"], timer.mobspawn, icon.mobspawn)
		self:Message(timer.mobspawn - 5, L["mobs_soon"], "Important")
	end
	self:TriggerEvent("BigWigs_StartCounterBar", self, "捣毁蛋数量", 30, "Interface\\Icons\\inv_egg_01")
	self:TriggerEvent("BigWigs_SetCounterBar", self, "捣毁蛋数量", (30 - 0.1))
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------
function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
 	BigWigs:CheckForBossDeath(msg, self)
 	if (msg == string.format(UNITDIESOTHER, controller)) then
 		doCheckForwipe = false
 		self:ScheduleEvent("startRazorgoreWipeCheck", function()
			doCheckForWipe = true
 		end, 60)
 	end
end
 
function module:CheckForWipe(event)
 	if doCheckForWipe then
 		BigWigs:CheckForWipe(self)
 	end
end


function module:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["phase2_trigger"] then
		self:Sync(syncName.phase2)
	--elseif msg == L["destroyegg_yell1"] or msg == L["destroyegg_yell2"] or msg == L["destroyegg_yell3"] then
	--	self:Sync(syncName.egg .. " " .. tostring(self.eggs + 1))
	end
end

function module:CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF(msg)
	if string.find(msg, L["egg_trigger"]) then
		self:Sync(syncName.eggStart)
	end
end

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(msg, "casts Destroy Egg") then
		-- as of now, this does also fire on finished 'Destroy Egg' cast.
		-- but only after a successful one and the range is shitty of this emote.
		self:Sync(syncName.egg .. " " .. tostring(self.eggs + 1))
	elseif string.find(msg, "Nefarian's troops flee as the power") then
		-- there is a really funny emote text bug on the current version on Nostalris, I'll only use this in case they fix it
		self:Sync(syncName.phase2)
	end
end

function module:Events(msg)
	local _, _, mcother = string.find(msg, L["mindcontrolother_trigger"])
	local _, _, mcotherend = string.find(msg, L["mindcontrolotherend_trigger"])
	local _, _, polyother = string.find(msg, L["polymorphother_trigger"])
	local _, _, polyotherend = string.find(msg, L["polymorphotherend_trigger"])
	local _, _, orbother = string.find(msg, L["orbcontrolother_trigger"])
	--local _, _, deathother = string.find(msg, L["deathother_trigger"])

	if self.db.profile.icon then
		if mcother then
			self:Icon(mcother)
		elseif msg == L["mindcontrolyou_trigger"] then
			self:Icon(UnitName("player"))
		elseif mcotherend or msg == L["mindcontrolyouend_trigger"] or deathother or msg == L["deathyou_trigger"] then
			self:RemoveIcon()
		end
	end

	if self.db.profile.mc then
		if msg == L["mindcontrolyou_trigger"] then
			self:Message(L["mindcontrol_message_you"], "Important")
			self:Bar(string.format(L["mindcontrol_bar"], UnitName("player")), timer.mc, "Spell_Shadow_ShadowWordDominate", true, "black")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["mindcontrol_bar"], UnitName("player")), function(name, button, extra) TargetByName(extra, true) end, UnitName("player"))
		elseif mcother then
			self:Message(string.format(L["mindcontrol_message"], mcother), "Important")
			self:Bar(string.format(L["mindcontrol_bar"], mcother), timer.mc, "Spell_Shadow_ShadowWordDominate", true, "black")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["mindcontrol_bar"], mcother), function(name, button, extra) TargetByName(extra, true) end, mcother)
		elseif string.find(msg, L["mindcontrolyouend_trigger"]) then
			self:RemoveBar(string.format(L["mindcontrol_bar"], UnitName("player")))
		elseif mcotherend then
			self:RemoveBar(string.format(L["mindcontrol_bar"], mcotherend))
		end
	end

	if self.db.profile.polymorph then
		if msg == L["polymorphyou_trigger"] then
			self:Message(L["polymorph_message_you"], "Important")
			self:Bar(string.format(L["polymorph_bar"], UnitName("player")), timer.polymorph, "Spell_Nature_Brilliance", true, "cyan")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["polymorph_bar"], UnitName("player")), function(name, button, extra) TargetByName(extra, true) end, UnitName("player"))
		elseif polyother then
			self:Message(string.format(L["polymorph_message"], polyother), "Important")
			self:Bar(string.format(L["polymorph_bar"], polyother), timer.polymorph, "Spell_Nature_Brilliance", true, "cyan")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["polymorph_bar"], polyother), function(name, button, extra) TargetByName(extra, true) end, polyother)
		elseif msg == L["polymorphyouend_trigger"] then
			self:RemoveBar(string.format(L["polymorph_bar"], UnitName("player")))
		elseif polyotherend then
			self:RemoveBar(string.format(L["polymorph_bar"], polyotherend))
		end
	end

	if self.db.profile.orb then
		if orbother then
			self:Sync(syncName.orb .." ".. orbother)
		elseif msg == L["orbcontrolyou_trigger"] then
			self:Sync(syncName.orb .." ".. UnitName("player"))
		end
	end

	if self.db.profile.conflagration and string.find(msg, L["conflagration_trigger"]) then
		self:Bar(L["conflagration_bar"], timer.conflagrate, "Spell_Fire_Incinerate", true, "red")
	end

	--[[if deathother then
	if self.db.profile.mc then
	self:RemoveBar(string.format(L["mindcontrol_bar"], deathother))
	end
	if self.db.profile.polymorph then
	self:RemoveBar(string.format(L["polymorph_bar"], deathother))
	end
	if self.db.profile.orb then
	self:RemoveBar(string.format(L["orb_bar"], deathother))
	end
	elseif msg == L["deathyou_trigger"] then
	if self.db.profile.mc then
	self:RemoveBar(string.format(L["mindcontrol_bar"], UnitName("player")))
	end
	if self.db.profile.polymorph then
	self:RemoveBar(string.format(L["polymorph_bar"], UnitName("player")))
	end
	if self.db.profile.orb then
	self:RemoveBar(string.format(L["orb_bar"], UnitName("player")))
	end
	end]]
end

function module:CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE(msg)
	if self.db.profile.fireballvolley and msg == L["volley_trigger"] then
		self:Bar(L["volley_bar"], timer.volley, icon.volley, true, "blue")
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["volley_trigger"] then
		self:Sync(syncName.volley)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.egg then
		rest = tonumber(rest)
		if rest == (self.eggs + 1) and self.eggs <= 30 then
			self.eggs = self.eggs + 1
			if self.db.profile.eggs then
				self:Message(string.format(L["egg_message"], self.eggs), "Positive")
			end
			self:TriggerEvent("BigWigs_SetCounterBar", self, "捣毁蛋数量", (30 - self.eggs))
		elseif rest == (self.eggs + 1) and rest == 30 and self.phase ~= 2 then
			self:Sync(syncName.phase2)
		end
	elseif sync == syncName.eggStart then
		--self:CancelScheduledEvent("destroyegg_check")
		--self:ScheduleEvent("destroyegg_check", self.DestroyEggCheck, 3, self)
		if self.db.profile.eggs then
			self:Bar(L["egg_bar"], timer.egg, icon.egg, true, "purple")
		end
	--	self:Sync(syncName.egg .. " " .. tostring(self.eggs + 1))
	elseif sync == syncName.orb then
		if self.orbOverTime then
			self.freetime = self.freetime + GetTime() - self.orbOverTime
			self.orbOverTime = 0
		end
		self:CancelScheduledEvent("destroyegg_check")
		self:CancelScheduledEvent("orbcontrol_check")
		if self.db.profile.orb then
			if self.previousorb ~= nil then
				self:RemoveBar(string.format(L["orb_bar"], self.previousorb))
			end
			self:Bar(string.format(L["orb_bar"], rest), timer.orb, icon.orb, true, "white")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["orb_bar"], rest), function(name, button, extra) TargetByName(extra, true) end, rest)
		end
		self:ScheduleEvent("orbcontrol_check", self.OrbControlCheck, 0.5, self)
		self.previousorb = rest
	elseif sync == syncName.orbOver then
		self.orbOverTime = GetTime()
		self:CancelScheduledEvent("destroyegg_check")
		self:CancelScheduledEvent("orbcontrol_check")
		if self.db.profile.orb and self.previousorb then
			self:RemoveBar(string.format(L["orb_bar"], self.previousorb))
		end
		if self.db.profile.fireballvolley then
			self:RemoveBar(L["volley_bar"])
		end
		if self.db.profile.eggs then
			self:RemoveBar(L["egg_bar"])
		end
	elseif sync == syncName.volley and self.db.profile.fireballvolley then
		self:Bar(L["volley_bar"], timer.volley, icon.volley, true, "red")
		self:Message(L["volley_message"], "Urgent")
		self:WarningSign(icon.volley, 2)
	elseif sync == syncName.phase2 and self.phase < 2 then
		self.phase = 2
		self:CancelScheduledEvent("destroyegg_check")
		self:CancelScheduledEvent("orbcontrol_check")
		if self.previousorb ~= nil and self.db.profile.orb then
			self:RemoveBar(string.format(L["orb_bar"], self.previousorb))
		end
		if self.db.profile.eggs then
			self:RemoveBar(L["egg_bar"])
		end
		if self.db.profile.phase then
			self:Message(L["phase2_message"], "Attention")
		end
		self:TriggerEvent("BigWigs_StopCounterBar", self, "捣毁蛋数量")
		self:Bar(L["conflagration_bar"], timer.firstConflagrate-self.freetime, "Spell_Fire_Incinerate", true, "red")
		self:Bar(L["volley_bar"], timer.firstVolley-self.freetime, icon.volley, true, "blue")
		self:Bar(L["warstomp_bar"], timer.firstWarStomp-self.freetime, "Ability_BullRush")

		self:KTM_Reset()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:OrbControlCheck()
	local bosscontrol = false
	for i = 1, GetNumRaidMembers() do
		if UnitName("raidpet"..i) == self.translatedName then
			bosscontrol = true
			break
		end
	end
	if bosscontrol then
		self:ScheduleEvent("orbcontrol_check", self.OrbControlCheck, 0.5, self)
	elseif GetRealZoneText() == "黑翼之巢" then
		self:Sync(syncName.orbOver)
	end
end

function module:DestroyEggCheck()
	local bosscontrol = false
	for i = 1, GetNumRaidMembers() do
		if UnitName("raidpet" .. i) == self.translatedName then
			bosscontrol = true
			break
		end
	end
	if bosscontrol then
	--self:TriggerEvent("BigWigs_SendSync", "RazorgoreEgg "..tostring(self.eggs + 1))
	end
end