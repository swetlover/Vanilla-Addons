
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Onyxia", "Onyxia's Lair")

module.revision = 20006 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"flamebreath", "deepbreath", "wingbuffet", "fireball", "phase", "onyfear", "bosskill"}


---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	firstFear = 28,
 	fear = 25,
	fearCast = 1.5,
	wingbuffet = 1,
}
local icon = {
	wingbuffet = "INV_Misc_MonsterScales_14",
	fear = "Spell_Shadow_Possession",
	deepbreath = "Spell_Fire_SelfDestruct",
	deepbreath_sign = "Spell_Fire_Lavaspawn",
	fireball = "Spell_Fire_FlameBolt",
}
local syncName = {
	deepbreath = "OnyDeepBreath"..module.revision,
	phase2 = "OnyPhaseTwo"..module.revision,
	phase3 = "OnyPhaseThree"..module.revision,
	flamebreath = "OnyFlameBreath"..module.revision,
	fireball = "OnyFireball"..module.revision,
	fear = "OnyBellowingRoar"..module.revision,
	firstfear = "OnyFirstFear"..module.revision,
}

local transitioned = false
local phase = 0

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Onyxia",
    engage_trigger = "must leave my lair to feed",

	deepbreath_cmd = "deepbreath",
	deepbreath_name = "深呼吸",
	deepbreath_desc = "警告当奥妮克希亚开始施放吐息.",

	flamebreath_cmd = "flamebreath",
	flamebreath_name = "火息术",
	flamebreath_desc = "施放火息术警报.",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "龙翼打击",
	wingbuffet_desc = "龙翼打击警报.",

	fireball_cmd = "fireball",
	fireball_name = "火球术",
	fireball_desc = "火球术警报.",

	phase_cmd = "phase",
	phase_name = "阶段",
	phase_desc = "阶段警报.",

	onyfear_cmd = "onyfear",
	onyfear_name = "恐惧",
	onyfear_desc = "提醒阶段 3 恐惧",

	deepbreath_trigger = "takes in a deep breath",
	flamebreath_trigger = "奥妮克希亚开始施放火息术。",
	wingbuffet_trigger = "奥妮克希亚开始施放龙翼打击。",
	fireball_trigger = "奥妮克希亚开始施放火球术。",
	phase2_trigger = "from above",
	phase3_trigger = "It seems you'll need another lesson",
	fear_trigger = "奥妮克希亚开始施放低沉咆哮。",
	fear_over_trigger = "低沉咆哮",
	firstfear_trigger = "受到了低沉咆哮效果的影响",

	warn1 = "深呼吸来临!",
	phase1text = "阶段 1",
	phase2text = "阶段 2",
	phase3text = "阶段 3",
	feartext = "马上恐惧!",
	fear_cast = "恐惧(AOE群恐)",
    fear_next = "下次恐惧(AOE群恐)",
	deepbreath_cast = "深呼吸(注意跑位)",
	flamebreath_cast = "火息术(锥形火伤)",
	wingbuffet_cast = "龙翼打击(锥形击退)",
	fireball_cast = "火球术对 %s",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Onyxia",
	engage_trigger = "must leave my lair to feed",

	deepbreath_cmd = "deepbreath",
	deepbreath_name = "Tiefer Atem",
	deepbreath_desc = "Warnen, wenn Onyxia beginnt Tiefer Atem zu casten.",

	flamebreath_cmd = "flamebreath",
	flamebreath_name = "Flammenatem",
	flamebreath_desc = "Warnen, wenn Onyxia beginnt Flammenatem zu casten.",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Alarm f\195\188r Fl\195\188gelsto\195\159.",

	fireball_cmd = "fireball",
	fireball_name = "Feuerball",
	fireball_desc = "Alarm f\195\188r Feuerball.",

	phase_cmd = "phase",
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses.",

	onyfear_cmd = "onyfear",
	onyfear_name = "Furcht",
	onyfear_desc = "Warne vor Dr\195\182hnendes Gebr\195\188ll in Phase 3.",

	deepbreath_trigger = "holt tief Luft",
	flamebreath_trigger = "Onyxia beginnt Flammenatem zu wirken\.",
	wingbuffet_trigger = "Onyxia beginnt Fl\195\188gelsto\195\159 zu wirken\.",
	fireball_trigger = "Onyxia beginnt Feuerball zu wirken\.",
	fear_trigger = "Onyxia beginnt Dr\195\182hnendes Gebr\195\188ll zu wirken\.",
	fear_over_trigger = "Dr\195\182hnendes Gebr\195\188ll",
	phase2_trigger = "from above",
	phase3_trigger = "Es scheint, als wenn Ihr eine weitere Lektion braucht",

	warn1 = "Tiefer Atem kommen!",
	phase1text = "Phase 1",
	phase2text = "Phase 2",
	phase3text = "Phase 3",
	feartext = "Furcht bald!",
	fear_cast = "Furcht",
	fear_next = "Nächste Furcht",
	deepbreath_cast = "Tiefer Atem",
	flamebreath_cast = "Flammenatem",
	wingbuffet_cast = "Fl\195\188gelsto\195\159",
	fireball_cast = "Feuerball on %s",
} end )

local fireballTarget = nil
local iconNumber = 8
local firstfear = false

------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["engage_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	--self:RegisterEvent("UNIT_HEALTH")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
 	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
 	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")

	self:ThrottleSync(10, syncName.deepbreath)
	self:ThrottleSync(10, syncName.phase2)
	self:ThrottleSync(10, syncName.phase3)
	self:ThrottleSync(5, syncName.flamebreath)
	self:ThrottleSync(2, syncName.fireball)
	self:ThrottleSync(5, syncName.fear)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	transitioned = false
	self.started = false
	phase = 0
	fireballTarget = nil
	iconNumber = 8
	firstfear = false
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.phase and not self.started then
		self:Message(L["phase1text"], "Attention")
	end
	phase = 1
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end

------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_RAID_BOSS_EMOTE(msg)
	if string.find(msg, L["deepbreath_trigger"]) then
		self:Sync(syncName.deepbreath)
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if (string.find(msg, L["phase2_trigger"])) then
		self:Sync(syncName.phase2)
	elseif (string.find(msg, L["phase3_trigger"])) then
		self:Sync(syncName.phase3)
	end
end

function module:Event(msg)
 	if string.find(msg, L["firstfear_trigger"]) then
		self:Sync(syncName.firstfear)
 	end
end

--[[function module:UNIT_HEALTH(arg1) --temporary workaround until Phase2 yell gets fixed
	if UnitName(arg1) == module.translatedName then
		local health = UnitHealth(arg1)
		if health > 60 and health <= 65 and not transitioned then
			self:Sync(syncName.phase2)
		elseif health > 65 then
			transitioned = false
		end
    end
end
--]]

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["fear_trigger"] then
		self:Sync(syncName.fear)
	elseif msg == L["flamebreath_trigger"] then
		self:Sync(syncName.flamebreath)
	elseif msg == L["wingbuffet_trigger"] and self.db.profile.wingbuffet then -- made local because 1s cast, with sync it would not be very accurate
		self:Bar(L["wingbuffet_cast"], timer.wingbuffet, icon.wingbuffet, true, "yellow")
	elseif msg == L["fireball_trigger"] then
		self:Sync(syncName.fireball)
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, L["fear_over_trigger"]) then
		self:RemoveWarningSign(icon.fear)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.phase2 then
		self:Phase2()
	elseif sync == syncName.phase3 then
		self:Phase3()
	elseif sync == syncName.deepbreath then
		self:DeepBreath()
	elseif sync == syncName.flamebreath  then
		self:FlameBreath()
	elseif sync == syncName.fireball  then
		self:Fireball()
	elseif sync == syncName.fear  then
		self:Fear()
	elseif sync == syncName.firstfear and not firstfear then
 		firstfear = true
 		self:FirstFear()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Phase2()
	if phase < 2 then
		transitioned = true --to stop sending new syncs
		phase = 2
		if self.db.profile.phase then
			self:Message(L["phase2text"], "Important", false, "Alarm")
		end
	end
end

function module:Phase3()
	if self.db.profile.phase and phase < 3 then
		self:Message(L["phase3text"], "Important", true, "Beware")
		phase = 3
		self:KTM_Reset()
	end
end

function module:DeepBreath()
	if self.db.profile.deepbreath then
		self:Message(L["warn1"], "Important", true, "RunAway")
		self:Bar(L["deepbreath_cast"], 5, icon.deepbreath, true, "black")
		self:WarningSign(icon.deepbreath_sign, 5)
	end
end

function module:FlameBreath()
	if self.db.profile.flamebreath then
		self:Bar(L["flamebreath_cast"], 2, "Spell_Fire_Fire")
	end
end

function module:DelayedFireballCheck()
	local name = "Unknown"
	self:CheckTarget()
	if fireballTarget then
		name = fireballTarget
		self:Icon(name, iconNumber)
		iconNumber = iconNumber - 1
		if iconNumber < 7 then
			iconNumber = 8
		end
		if name == UnitName("player") then
			self:WarningSign(icon.fireball, 3)
		end
	end
	if self.db.profile.fireball then
		self:Bar(string.format(L["fireball_cast"], name), 3 - 0.1, icon.fireball, true, "red")
	end
end

function module:Fireball()
	self:ScheduleEvent("OnyxiaDelayedFireballCheck", self.DelayedFireballCheck, 0.1, self)
end

function module:Fear()
	if self.db.profile.onyfear then
		self:RemoveBar(L["fear_next"]) -- remove timer bar

		self:Message(L["feartext"], "Important", true, "Alarm")
		self:Bar(L["fear_cast"], timer.fearCast, icon.fear, true, "white") -- add cast bar
		self:DelayedBar(timer.fearCast, L["fear_next"], timer.fear-timer.fearCast, icon.fear) -- delayed timer bar
		self:WarningSign(icon.fear, 5)
	end
end

function module:FirstFear()
 	if self.db.profile.onyfear then
 		self:Bar(L["fear_next"], timer.firstFear, icon.fear)
 		self:WarningSign(icon.fear, 5)
	end
end
-----------------------
-- Utility Functions --
-----------------------

function module:CheckTarget()
	local i
	local newtarget = nil
	local enemy = self:ToString()

	if UnitName("playertarget") == enemy then
		newtarget = UnitName("playertargettarget")
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == enemy then
				newtarget = UnitName("Raid"..i.."targettarget")
				break
			end
		end
	end
	if newtarget then
		fireballTarget = newtarget
	end
end
