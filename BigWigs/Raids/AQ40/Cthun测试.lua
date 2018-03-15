----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("C'Thun", "Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Cthun",

	startwarn	= "克苏恩相遇! - 45秒后秒后黑暗闪耀发动，巨眼出现。",
	barStartRandomBeams = "开始随机眼棱!",

	eye_beam_trigger = "巨眼触须开始施放眼棱。",
	eye_beam_trigger_cthun = "克苏恩之眼开始施放眼棱。",
	eyebeam		= "眼棱对 %s",
	Unknown = "未知", -- Eye Beam on Unknown

	tentacle_cmd = "tentacle",
	tentacle_name = "触须警报",
	tentacle_desc = "一些触须的警报",
	rape_cmd = "rape",
	rape_name = "黄色笑话很有趣",
	rape_desc = "有些人喜欢变态笑话.",
	tentacle	= "触须轮奸队伍 - 5秒",
	norape		= "5秒后触手!",
	barTentacle	= "触手轮奸队伍!",
	barNoRape	= "触须攻击队伍!",

	glare_cmd = "glare",
	glare_name = "黑暗闪耀警报",
	glare_desc = "黑暗闪耀的警报",
	glare		= "黑暗闪耀!",
	msgGlareEnds	= "黑暗闪耀5秒后结束!",
	barGlare	= "下个黑暗闪耀!",
	barGlareEnds = "黑暗闪耀结束",
	barGlareCasting = "黑暗闪耀施放中",

	group_cmd = "group",
	group_name = "黑暗闪耀队伍警报",
	group_desc = "警报黑暗闪耀队伍 X",

	phase2starting	= "克苏恩之眼死了！第二阶段进入！",

	playersInStomach = "玩家在腹部里",

	giant_cmd = "giant",
	giant_name = "巨眼警报",
	giant_desc = "巨眼触须警报",
	barGiant	= "巨眼触须!",
	barGiantC	= "巨型利爪触须!",
	GiantEye = "5秒后巨眼触须!",
	gedownwarn	= "巨眼出现!",

	weakened_cmd = "weakened",
	weakened_name = "虚弱警报",
	weakened_desc = "虚弱状态警报",
	weakenedtrigger = "is weakened!",
	weakened	= "克苏恩虚弱45秒",
	invulnerable2	= "削弱状态还有5秒结束",
	invulnerable1	= "削弱状态结束 - 停止攻击克苏恩！",
	barWeakened	= "克苏恩削弱!",

	sound_cmd = "sound",
	sound_name = "声音",
	sound_desc = "附近模块上播放声音.",

	acid_cmd = "acid",
	acid_name = "消化酸液警报",
	acid_desc = "显示一个警报指示，当你有5层消化酸液时",
	digestiveAcidTrigger = "你受到了消化酸液效果的影响。（([%d]*）",
	msgDigestiveAcid = "5层酸液",

	["Second TentacleHP"] = "第二触须 %d%%",
	["First Tentacle dead"] = "第一触须死亡",
	["First Tentacle"] = "内场第一触须",
	["Second Tentacle"] = "内场第二触须",

	--[[GNPPtrigger	= "Nature Protection",
	GSPPtrigger	= "Shadow Protection",
	Sundertrigger	= "Sunder Armor",
	CoEtrigger	= "Curse of the Elements",
	CoStrigger	= "Curse of Shadow",
	CoRtrigger	= "Curse of Recklessness",]]


	proximity_cmd = "proximity",
	proximity_name = "附近玩家警报",
	proximity_desc = "显示附近玩家警报框架",

	stomach_cmd = "stomach",
	stomach_name = "玩家在腹部里",
	stomach_desc = "显示玩家在内场里的框架",

} end )


L:RegisterTranslations("deDE", function() return {
	--cmd = "Cthun",

	startwarn	= "C'Thun angegriffen! - 45 sec bis Dunkles Starren und Augen", --"C'Thun engaged! - 45 sec until Dark Layr and Eyes",
	barStartRandomBeams = "Beginn zufälliger Strahlen!",

	eye_beam_trigger = "Riesiges Augententakel beginnt Augenstrahl zu wirken", --"Giant Eye Tentacle begins to cast Eye Beam.", -- Riesiges Augententakel beginnt Augenstrahl zu wirken
	eye_beam_trigger_cthun = "Auge von C'Thun beginnt Augenstrahl zu wirken", --"Eye of C'Thun begins to cast Eye Beam.", --
	eyebeam		= "Augenstrahl auf %s", --"Eye Beam on %s",
	Unknown = "Unbekannt", -- Eye Beam on Unknown

	--tentacle_cmd = "tentacle",
	tentacle_name = "Tentakel Alarm",
	tentacle_desc = "Warnung vor Tentakeln", --"Warn for Tentacles",
	--rape_cmd = "rape",
	rape_name = "Rape jokes are funny",
	rape_desc = "Some people like hentai jokes.",
	tentacle	= "Tentakel Rape Party - 5 sec", --"Tentacle Rape Party - 5 sec",
	norape		=  "Tentakel in 5sec!", --"Tentacles in 5sec!",
	barTentacle	= "Tentakel Rape Party!", -- "Tentacle rape party!",
	barNoRape	= "Tentakel Party", --"Tentacle party!",

	--glare_cmd = "glare",
	glare_name = "Dunkles Starren Alarm", --"Dark Layr Alert", -- Dunkles Starren
	glare_desc = "Warnung for Dunklem Starren", --"Warn for Dark Layr",
	glare		= "Dunkles Starren!", -- "Dark Layr!",
	msgGlareEnds	= "Dunkles Starren endet in 5 sec", -- "Dark Layr ends in 5 sec",
	barGlare	= "Nächstes Dunkles Starren!", -- "Next Dark Layr!",
	barGlareEnds = "Dunkles Starren endet", -- Dark Layr ends",
	barGlareCasting = "Zaubert Dunkles Starren", -- "Casting Dark Layr",

	--group_cmd = "group",
	group_name = "Dunkles Starren Gruppenwarnung", -- "Dark Layr Group Warning",
	group_desc = "Warnt vor Dunkles Starren auf Gruppe X", -- "Warn for Dark Layr on Group X",

	phase2starting	= "Das Auge ist tot! Phase 2 beginnt.", -- "The Eye is dead! Body incoming!",

	--giant_cmd = "giant",
	giant_name = "Riesiges Augententakel Alarm", --Giant Eye Alert",
	giant_desc = "Warnung vor Riesigem Augententakel", -- "Warn for Giant Eyes",
	barGiant	= "Riesiges Augententakel!",
	barGiantC	= "Riesiges Klauententakel!",
	GiantEye = "Riesiges Augententakel Tentacle in 5 sec!",
	gedownwarn	= "Riesiges Augententakel tot!",

	--weakened_cmd = "weakened",
	weakened_name = "Schwäche Alarm", --"Weakened Alert",
	weakened_desc = "Warnung für Schwäche Phase", -- "Warn for Weakened State",
	weakenedtrigger = "ist geschwächt", -- "is weakened!",
	weakened	= "C'Thun ist für 45 sec geschwächt", --"C'Thun is weakened for 45 sec",
	invulnerable2	= "Party endet in 5 sec", --"Party ends in 5 seconds",
	invulnerable1	= "Party vorbei - C'Thun unverwundbar", -- "Party over - C'Thun invulnerable",
	barWeakened	= "C'Thun ist geschwächt", --"C'Thun is weakened!",

	acid_cmd = "acid",
	acid_name = "Magensäure Alarm",
	acid_desc = "Zeigt ein Warnzeichen wenn du mehr als 5 Stapel der Magensäure hast.",
	digestiveAcidTrigger = "Ihr seid von Magensäure [%s%(]*([%d]*)", -- "You are afflicted by Digestive Acid (5).",
	msgDigestiveAcid = "5 Säure Stacks",

	--[[GNPPtrigger	= "Nature Protection",
	GSPPtrigger	= "Shadow Protection",
	Sundertrigger	= "Sunder Armor",
	CoEtrigger	= "Curse of the Elements",
	CoStrigger	= "Curse of Shadow",
	CoRtrigger	= "Curse of Recklessness",]]

	proximity_cmd = "proximity",
	proximity_name = "Nähe Warnungsfenster",
	proximity_desc = "Zeit das Nähe Warnungsfenster",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20011 -- To be overridden by the module!
local eyeofcthun = AceLibrary("Babble-Boss-2.2")["Eye of C'Thun"]
local cthun = AceLibrary("Babble-Boss-2.2")["C'Thun"]
module.enabletrigger = {eyeofcthun, cthun} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"rape", -1, "tentacle", "glare", "group", -1, "giant", "acid", "weakened", -1, "proximity", "stomach", "bosskill"}

-- Proximity Plugin
module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
module.proximitySilent = false


-- locals
local timer = {
	p1RandomEyeBeams = 6, -- how long does eye of c'thun target the same player at the beginning
	p1Tentacle = 45,      -- tentacle timers for phase 1
	p1TentacleStart = 45, -- delay for first tentacles from engage onwards
	p1GlareStart = 45,    -- delay for first dark glare from engage onwards
	p1Glare = 87,         -- interval for dark glare
	p1GlareCasting = 3,   -- time it takes from casting dark glare until the spell starts
	p1GlareDuration = 39, -- duration of dark glare

	p2Tentacle = 30,      -- tentacle timers for phase 2
	p2ETentacle = 60,     -- Eye tentacle timers for phase 2
	p2GiantClaw = 60,     -- Giant Claw timer for phase 2
	p2FirstGiantClaw = 12, -- first giant claw after eye of c'thun dies
	p2FirstGiantEye = 42, -- first giant eye after eye of c'thun dies
	p2FirstEyeTentacles = 42, -- first eye tentacles after eye of c'thun dies
	p2FirstGiantClawAfterWeaken = 8,
	p2FirstGiantEyeAfterWeaken = 38,
	p2FirstEyeAfterWeaken = 38,


	reschedule = 50,      -- delay from the moment of weakening for timers to restart
	target = 1,           -- delay for target change checking on Eye of C'Thun and Giant Eye Tentacle
	CheckTentacleHP = 0.5, -- delay for updating flesh tentacle hp
	weakened = 45,        -- duration of a weaken

	eyeBeam = 2,         -- Eye Beam Cast time
}
local icon = {
	giantEye = "inv_misc_eye_01", --"Interface\\Icons\\Ability_EyeOfTheOwl"
	giantClaw = "Spell_Nature_Earthquake",
	eyeTentacles = "spell_shadow_siphonmana", --"Interface\\Icons\\Spell_Nature_CallStorm"
	darkGlare = "Inv_misc_ahnqirajtrinket_04",
	weaken = "INV_ValentinesCandy",
	eyeBeamSelf = "Ability_creature_poison_05",
	digestiveAcid = "ability_creature_disease_02",
}
local syncName = {
	p2Start = "CThunP2Start"..module.revision,
	weaken = "CThunWeakened"..module.revision,
	weakenOver = "CThunWeakenedOver"..module.revision,
	tentacleSpawn = "TentacleSpawn"..module.revision,
	giantEyeDown = "CThunGEdown"..module.revision,
	giantClawSpawn = "GiantClawSpawn"..module.revision,
	giantEyeSpawn = "GiantEyeSpawn"..module.revision,
	eyeBeam = "CThunEyeBeam"..module.revision,
	fleshtentacledead = "CThunFleshTentacleDead"..module.revision,
}

local gianteye = "巨型利爪触须"
local fleshtentacle = "血肉触须"

local cthunstarted = nil
local phase2started = nil
local fleshtentacledead = false
local firstGlare = nil
local firstWarning = nil
--local target = nil
local tentacletime = timer.p1Tentacle
local isWeakened = nil

local doCheckForWipe = false

local eyeTarget = nil


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Emote")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Emote")

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CheckEyeBeam")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckDigestiveAcid")

	self:ThrottleSync(20, syncName.p2Start)
	self:ThrottleSync(50, syncName.weaken)
	self:ThrottleSync(3, syncName.giantEyeDown)
	self:ThrottleSync(600, syncName.weakenOver)
	self:ThrottleSync(30, syncName.fleshtentacledead)
	self:ThrottleSync(25, syncName.giantClawSpawn)
	self:ThrottleSync(25, syncName.giantEyeSpawn)
	self:ThrottleSync(25, syncName.tentacleSpawn)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	self.started = nil
	self.tentacleHP = 100
	self.warning = 100
	fleshtentacledead = false
	eyeTarget = nil
	cthunstarted = nil
	firstGlare = nil
	firstWarning = nil
	phase2started = nil
	doCheckForWipe = false

	tentacletime = timer.p1Tentacle

	self:RemoveProximity()
	self:TriggerEvent("BigWigs_StopDebuffTrack")
end

-- called after boss is engaged
function module:OnEngage()
	self:CThunStart()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
	self:RemoveProximity()
	self:TriggerEvent("BigWigs_StopDebuffTrack")
end


----------------------
--  Event Handlers  --
----------------------

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if (msg == string.format(UNITDIESOTHER, eyeofcthun)) then
		self:Sync(syncName.p2Start)
	elseif (msg == string.format(UNITDIESOTHER, gianteye)) then
		self:Sync(syncName.giantEyeDown)
	elseif (msg == string.format(UNITDIESOTHER, fleshtentacle)) and not fleshtentacledead then
		self:Sync(syncName.fleshtentacledead)
	end
end

function module:CheckForWipe(event)
	if doCheckForWipe then
		BigWigs:DebugMessage("doCheckForWipe")
		BigWigs:CheckForWipe(self)
	end
end

function module:Emote( msg )
	if string.find(msg, L["weakenedtrigger"]) then
		self:Sync(syncName.weaken)
	end
end

function module:CheckEyeBeam(msg)
	if string.find(msg, L["eye_beam_trigger"]) then
		self:DebugMessage("Eye Beam trigger")
		self:Sync(syncName.eyeBeam)
	elseif string.find(msg, L["eye_beam_trigger_cthun"]) then
		self:DebugMessage("C'Thun Eye Beam trigger")
		self:Sync(syncName.eyeBeam)
		if not cthunstarted then
			self:SendEngageSync()
		end
	end
end

function module:CheckDigestiveAcid(msg)
	local _, _, stacks = string.find(msg, L["digestiveAcidTrigger"])

	if stacks then
		self:DebugMessage("Digestive Acid Stacks: " .. stacks)
		if tonumber(stacks) == 5 then
			self:DigestiveAcid()
		end
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.p2Start then
		self:CThunP2Start()
	elseif sync == syncName.weaken then
		self:CThunWeakened()
	elseif sync == syncName.weakenOver then
		self:CThunWeakenedOver()
	elseif sync == syncName.giantEyeDown then
		self:Message(L["gedownwarn"], "Positive")
	elseif sync == syncName.eyeBeam then
		self:EyeBeam()
	elseif sync == syncName.giantClawSpawn then
		self:GCTentacleRape()
	elseif sync == syncName.giantEyeSpawn then
		self:GTentacleRape()
	elseif sync == syncName.tentacleSpawn then
		self:TentacleRape()
	elseif sync == syncName.fleshtentacledead then
		fleshtentacledead = true
		self.tentacleHP = 100
		self:Message(L["First Tentacle dead"], "Important" )
		self:TriggerEvent("BigWigs_StopHPBar", self, L["First Tentacle"])
		self:TriggerEvent("BigWigs_StartHPBar", self, L["Second Tentacle"], 100)
		self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 0)
	end
end

-----------------------
--   Sync Handlers   --
-----------------------

function module:CThunStart()
	self:DebugMessage("CThunStart: ")
	if not cthunstarted then
		cthunstarted = true
		doCheckForWipe = true

		self:Message(L["startwarn"], "Attention", false, false)
		self:Sound("Shakira")
		self:Bar(L["barStartRandomBeams"], timer.p1RandomEyeBeams, icon.giantEye)

		if self.db.profile.tentacle then
			self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timer.p1TentacleStart, icon.eyeTentacles)
			self:DelayedMessage(timer.p1TentacleStart - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, "Alert")
		end

		firstGlare = true
		self:DarkGlare()

		firstWarning = true

		self:DelayedSync(timer.p1TentacleStart, syncName.tentacleSpawn)
		self:ScheduleRepeatingEvent("bwcthuntarget", self.CheckTarget, timer.target, self)

		self:Proximity()
	end
end

function module:CThunP2Start()
	if not phase2started then
		phase2started = true
		doCheckForWipe = false -- disable wipe check since we get out of combat, enable it later again
		tentacletime = timer.p2Tentacle

		self:TriggerEvent("BigWigs_StartHPBar", self, L["First Tentacle"], 100)
		self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 0)
		self:ScheduleRepeatingEvent("bwcthunCheckTentacleHP", self.CheckTentacleHP, timer.CheckTentacleHP, self )

		self:Message(L["phase2starting"], "Bosskill")

		-- cancel dark glare
		self:RemoveBar(L["barGlare"] )
		self:RemoveBar(L["barGlareCasting"] )
		self:RemoveBar(L["barGlareEnds"] )
		self:CancelScheduledEvent("bwcthundarkglare") -- ok
		self:CancelDelayedBar(L["barGlareEnds"])
		self:CancelDelayedBar(L["barGlare"])
		self:RemoveWarningSign(icon.darkGlare)

		-- cancel eye tentacles

		self:RemoveBar(L["barTentacle"] )
		self:RemoveBar(L["barNoRape"] )
		self:CancelDelayedMessage(self.db.profile.rape and L["tentacle"] or L["norape"])
		self:CancelDelayedSync(syncName.tentacleSpawn)

		-- cancel dark glare group warning
		self:CancelScheduledEvent("bwcthuntarget") -- ok

		self:RemoveBar(L["barStartRandomBeams"] )

		-- start P2 events
		if self.db.profile.tentacle then
			-- first eye tentacles
			self:DelayedMessage(timer.p2FirstEyeTentacles - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, nil, true)
			self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timer.p2FirstEyeTentacles, icon.eyeTentacles)
		end

		if self.db.profile.giant then
			self:Bar(L["barGiant"], timer.p2FirstGiantEye, icon.giantEye)
			self:DelayedMessage(timer.p2FirstGiantEye - 5, L["GiantEye"], "Urgent", false, nil, true)

			self:Bar(L["barGiantC"], timer.p2FirstGiantClaw, icon.giantClaw)
		end

		self:DelayedSync(timer.p2FirstEyeTentacles, syncName.tentacleSpawn)
		self:DelayedSync(timer.p2FirstGiantEye, syncName.giantEyeSpawn)
		self:DelayedSync(timer.p2FirstGiantClaw, syncName.giantClawSpawn)
		self:ScheduleRepeatingEvent("bwcthuntargetp2", self.CheckTarget, timer.target, self )

	end
	if self.db.profile.stomach then
		self:TriggerEvent("BigWigs_StartDebuffTrack", self:ToString(), "Interface\\Icons\\Ability_Creature_Disease_02", L["playersInStomach"])
	end
end

function module:CThunWeakened()
	isWeakened = true
	fleshtentacledead = false
	self.tentacleHP = 100
	self.warning = 100
	self:TriggerEvent("BigWigs_StopHPBar", self, L["Second Tentacle"])
	self:ThrottleSync(0.1, syncName.weakenOver)

	if self.db.profile.weakened then
		self:Message(L["weakened"], "Positive" )
		self:Sound("Murloc")
		self:Bar(L["barWeakened"], timer.weakened, icon.weaken)
		self:Message(timer.weakened - 5, L["invulnerable2"], "Urgent")
	end

	-- cancel tentacle timers
	self:CancelDelayedMessage(self.db.profile.rape and L["tentacle"] or L["norape"])
	self:CancelDelayedMessage(L["GiantEye"])
	self:CancelDelayedSync(syncName.giantEyeSpawn)
	self:CancelDelayedSync(syncName.giantClawSpawn)
	self:CancelDelayedSync(syncName.tentacleSpawn)


	self:RemoveBar(L["barTentacle"])
	self:RemoveBar(L["barNoRape"])
	self:RemoveBar(L["barGiant"])
	self:RemoveBar(L["barGiantC"])

	self:DelayedSync(timer.weakened, syncName.weakenOver)
end

function module:CThunWeakenedOver()
	isWeakened = nil
	self:ThrottleSync(600, syncName.weakenOver)
	self.tentacleHP = 100
	self:TriggerEvent("BigWigs_StartHPBar", self, L["First Tentacle"], 100)
	self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 0)
	self:CancelDelayedSync(syncName.weakenOver) -- ok

	if self.db.profile.weakened then
		self:RemoveBar(L["barWeakened"])
		self:CancelDelayedMessage(L["invulnerable2"])

		self:Message(L["invulnerable1"], "Important")
	end

	-- next giant claw 10s after weaken
	self:Bar(L["barGiantC"], timer.p2FirstGiantClawAfterWeaken, icon.giantClaw)
	self:DelayedSync(timer.p2FirstGiantClawAfterWeaken, syncName.giantClawSpawn)

	-- next giant eye 40s after weaken
	self:Bar(L["barGiant"], timer.p2FirstGiantEyeAfterWeaken, icon.giantEye)
	self:DelayedSync(timer.p2FirstGiantEyeAfterWeaken, syncName.giantEyeSpawn)
	self:DelayedMessage(timer.p2FirstGiantEyeAfterWeaken - 5, L["GiantEye"], "Urgent", false, nil, true)

	--next rape party
	self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timer.p2FirstEyeAfterWeaken, icon.eyeTentacles)
	self:DelayedSync(timer.p2FirstEyeAfterWeaken, syncName.tentacleSpawn)
	self:DelayedMessage(timer.p2FirstEyeAfterWeaken - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, nil, true)
end

function module:DelayedEyeBeamCheck()
	local name = L["Unknown"]
	self:CheckTarget()
	if eyeTarget then
		name = eyeTarget
		self:Icon(name)
		if name == UnitName("player") then
			self:WarningSign(icon.eyeBeamSelf, 2 - 0.1)
		end
	end
	self:Bar(string.format(L["eyebeam"], name), timer.eyeBeam - 0.1, icon.giantEye, true, "green")
end
function module:EyeBeam()
	self:ScheduleEvent("CThunDelayedEyeBeamCheck", self.DelayedEyeBeamCheck, 0.1, self) -- has to be done delayed since the target change is delayed
end

function module:DigestiveAcid()
	if self.db.profile.acid then
		self:Message(L["msgDigestiveAcid"], "Red", true, "RunAway")
		self:WarningSign(icon.digestiveAcid, 5) --ability_creature_disease_02
	end
end

-----------------------
-- Utility Functions --
-----------------------
function module:CheckTentacleHP()
	local health
	if UnitName("playertarget") == fleshtentacle then
		health = UnitHealth("playertarget")
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == fleshtentacle then
				health = UnitHealth("Raid"..i.."target")
				break;
			end
		end
	end

	if health and health ~= self.tentacleHP and health < self.tentacleHP then
		self.tentacleHP = health
		if fleshtentacledead then
			self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.tentacleHP)
			if self.tentacleHP < 10 and self.warning > 10 then
				self.warning = 10
				self:Message(string.format(L["Second TentacleHP"], self.warning), "Important" )
			elseif self.tentacleHP < 20 and self.warning > 20 then
				self.warning = 20
				self:Message(string.format(L["Second TentacleHP"], self.warning), "Important" )
			elseif self.tentacleHP < 30 and self.warning > 30 then
				self.warning = 30
				self:Message(string.format(L["Second TentacleHP"], self.warning), "Important" )
			elseif self.tentacleHP < 40 and self.warning > 40 then
				self.warning = 40
				self:Message(string.format(L["Second TentacleHP"], self.warning), "Important" )
			end
		else
			self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.tentacleHP)
		end
	end
end

function module:CheckTarget()
	local i
	local newtarget = nil
	local enemy = eyeofcthun

	if phase2started then
		enemy = gianteye
	end
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
		eyeTarget = newtarget
	end
end

-- P1
function module:DarkGlare()
	if self.db.profile.glare then
		if firstGlare then
			self:ScheduleEvent("bwcthundarkglare", self.DarkGlare, timer.p1GlareStart, self )

			self:Bar(L["barGlare"], timer.p1GlareStart, icon.darkGlare)
			firstGlare = nil
		else
			self:ScheduleEvent("bwcthundarkglare", self.DarkGlare, timer.p1Glare, self )

			self:WarningSign(icon.darkGlare, timer.p1GlareCasting)
			self:Message(L["glare"], "Urgent", true, false)
			self:Bar(L["barGlareCasting"], timer.p1GlareCasting, icon.darkGlare)

			self:DelayedBar(timer.p1GlareCasting, L["barGlareEnds"], timer.p1GlareDuration, icon.darkGlare)
			self:DelayedMessage(timer.p1GlareCasting + timer.p1GlareDuration - 5, L["msgGlareEnds"], "Urgent", false, nil, true)
			self:DelayedBar(timer.p1GlareCasting + timer.p1GlareDuration, L["barGlare"], timer.p1Glare - timer.p1GlareCasting - timer.p1GlareDuration, icon.darkGlare)
		end
	end
end

-- P2
function module:GTentacleRape()
	self:DelayedSync(timer.p2ETentacle, syncName.giantEyeSpawn)
	if self.db.profile.giant then
		self:Bar(L["barGiant"], timer.p2ETentacle, icon.giantEye)
		self:DelayedMessage(timer.p2ETentacle - 5, L["GiantEye"], "Urgent", false, nil, true)
	end
end

function module:GCTentacleRape()
	doCheckForWipe = true
	self:DelayedSync(timer.p2GiantClaw, syncName.giantClawSpawn)
	self:KTM_Reset()
	self:KTM_SetTarget("巨型利爪触须")
	if self.db.profile.giant then
		self:Bar(L["barGiantC"], timer.p2GiantClaw, icon.giantClaw)
	end
end

function module:TentacleRape()
	self:DelayedSync(tentacletime, syncName.tentacleSpawn)
	if self.db.profile.tentacle then
		self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], tentacletime, icon.eyeTentacles)
		self:DelayedMessage(tentacletime - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, nil, true)
	end
end