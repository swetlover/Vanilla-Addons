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
	eyebeam		= "眼棱对 %s (远离10码别连人)",
	Unknown = "未知", -- Eye Beam on Unknown

	tentacle_cmd = "tentacle",
	tentacle_name = "触须警报",
	tentacle_desc = "一些触须的警报",
	rape_cmd = "rape",
	rape_name = "黄色笑话很有趣",
	rape_desc = "有些人喜欢变态笑话.",
	tentacle	= "触须轮奸队伍 - 5秒",
	norape		= "5秒后触手!",
	barTentacle	= "触手轮奸队伍!(打断+击杀)",
	barNoRape	= "触须攻击队伍!(打断+击杀)",

	glare_cmd = "glare",
	glare_name = "黑暗闪耀警报",
	glare_desc = "黑暗闪耀的警报",
	glare		= "黑暗闪耀!",
	msgGlareEnds	= "黑暗闪耀5秒后结束!",
	barGlare	= "下个黑暗闪耀!(红光)",
	barGlareEnds = "黑暗闪耀结束(红光)",
	barGlareCasting = "黑暗闪耀施放中(别中红光)",

	group_cmd = "group",
	group_name = "黑暗闪耀队伍警报",
	group_desc = "警报黑暗闪耀队伍 X",

	phase2starting	= "克苏恩之眼死了！进入第二阶段！",

	playersInStomach = "玩家在腹部里",

	giant_cmd = "giant",
	giant_name = "巨眼警报",
	giant_desc = "巨眼触须警报",
	barGiant	= "巨眼触须!(注意打断+眩晕)",
	barGiantC	= "巨爪触须!(高物理伤害)",
	GiantEye = "5秒后巨眼触须!",
	gedownwarn	= "巨眼出现!",

	weakened_cmd = "weakened",
	weakened_name = "虚弱警报",
	weakened_desc = "虚弱状态警报",
	weakenedtrigger = "is weakened!",
	weakened	= "克苏恩虚弱45秒",
	invulnerable2	= "削弱状态还有5秒结束",
	invulnerable1	= "削弱状态结束 - 停止攻击克苏恩！",
	barWeakened	= "克苏恩削弱!全体攻击本体!",

	sound_cmd = "sound",
	sound_name = "声音",
	sound_desc = "附近模块上播放声音.",

	acid_cmd = "acid",
	acid_name = "消化酸液警报",
	acid_desc = "显示一个警报指示，当你有5层消化酸液时",
	digestiveAcidTrigger = "你受到了消化酸液效果的影响。（([%d]*）",
	msgDigestiveAcid = "5层酸液",


	--[[GNPPtrigger	= "Nature Protection",
	GSPPtrigger	= "Shadow Protection",
	Sundertrigger	= "Sunder Armor",
	CoEtrigger	= "Curse of the Elements",
	CoStrigger	= "Curse of Shadow",
	CoRtrigger	= "Curse of Recklessness",]]

	sound_cmd = "sound",
	sound_name = "声音",
	sound_desc = "附近模块上播放声音.",
	
	tentacleName = "血肉触须",
	
	text_tooClose = "|cffcccccc-- 太近了(10码内) --",
	text_inStomach = "|cffcccccc-- 玩家在腹部里 --",
	text_stomachTentacles = "|cffcccccc-- 腹部触须血量 --",
	text_dead = "|cffff0000死亡",
	text_tentacle = "|cffcccccc触须",
	text_nobody ="|cff777777无人",
	text_weakened ="|cffff00ff削弱",
	
	["Big Wigs Cthun Assist"] = "BigWigs小克助手",

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

} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20014 -- To be overridden by the module!
local eyeofcthun = AceLibrary("Babble-Boss-2.2")["Eye of C'Thun"]
local cthun = AceLibrary("Babble-Boss-2.2")["C'Thun"]
module.enabletrigger = {eyeofcthun, cthun} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"rape", -1, "tentacle", "glare", "group", -1, "giant", "acid", "weakened", "sound", -1, "bosskill"}

-- Proximity Plugin
--[[module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
module.proximitySilent = false
--]]

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
	--tablet
	fleshTentacleDead = "FleshTentacleDead"..module.revision,
}

local gianteye = "巨型利爪触须"

local cthunstarted = nil
local phase2started = nil
local firstGlare = nil
local firstWarning = nil
--local target = nil
local tentacletime = timer.p1Tentacle
local isWeakened = nil
local doCheckForWipe = false
local eyeTarget = nil

--Tablet (Proximity, Stomach, FleshTentacleHP). Basically CThunAssist baked into this mod.
local tablet = AceLibrary("Tablet-2.0")
local paintchips = AceLibrary("PaintChips-2.0")
local roster = nil
local lastplayed = 0
local playername = nil
local tentacleDead = false
local tentacleHP = 0


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
	self:ThrottleSync(60, syncName.weakenOver)
	self:ThrottleSync(25, syncName.giantClawSpawn)
	self:ThrottleSync(25, syncName.giantEyeSpawn)
	self:ThrottleSync(25, syncName.tentacleSpawn)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	self.started = nil
	self.warning = 100
	eyeTarget = nil
	cthunstarted = nil
	firstGlare = nil
	firstWarning = nil
	phase2started = nil
	doCheckForWipe = false

	tentacletime = timer.p1Tentacle

	
	--tablet
	lastplayed = 0
	playername = UnitName("player")
	tentacleDead = false
	tentacleHP = "|cff777777??"

end

-- called after boss is engaged
function module:OnEngage()
	self:CThunStart()
	
	--tablet
	if not roster then roster = AceLibrary("RosterLib-2.0") end
	self:ShowTablet()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
	--tablet
	roster = nil
	self:HideTablet()
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
	--tablet
	elseif msg == string.format(UNITDIESOTHER, L["tentacleName"]) then
		self:Sync(syncName.fleshTentacleDead)
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
		--tablet
		self:ScheduleEvent("resetTentacles", function()
			tentacleDead = false
			tentacleHP = "|cff777777??"
		end, 45)
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
	--tablet
	elseif sync == syncName.fleshTentacleDead then
		tentacleDead = true
		tentacleHP = "|cff777777??"
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

	end
end

function module:CThunP2Start()
	if not phase2started then
		phase2started = true
		doCheckForWipe = false -- disable wipe check since we get out of combat, enable it later again
		tentacletime = timer.p2Tentacle

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
end

function module:CThunWeakened()
	isWeakened = true
	self.warning = 100
	self:ThrottleSync(0.1, syncName.weakenOver)

	if self.db.profile.weakened then
		self:Message(L["weakened"], "Positive" )
		self:Sound("Murloc")
		self:Bar(L["barWeakened"], timer.weakened, icon.weaken)
		self:DelayedMessage(timer.weakened - 5, L["invulnerable2"], "Urgent")
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
	self:ThrottleSync(60, syncName.weakenOver)
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

------------------------------
--      Tablet              --
------------------------------

function module:OnTooltipUpdate()
	if not tablet:IsRegistered("BigWigsCthunAssist") then return end
	
	-- build tablet
	local cat_proximity = tablet:AddCategory(
		'columns', 1,
		'text', L["text_tooClose"],
		'justify', "CENTER",
		'child_justify', "CENTER"
	)
	local cat_stomach
	local cat_tentacleHeader
	local cat_tentacle
	if phase2started then
		cat_stomach = tablet:AddCategory(
			'columns', 1,
			'text', L["text_inStomach"],
			'justify', "CENTER",
			'child_justify', "CENTER"
		)
		cat_tentacleHeader = tablet:AddCategory(
			'columns', 1,
			'text', L["text_stomachTentacles"],
			'justify', "CENTER",
			'showWithoutChildren', true
		)
		cat_tentacle = tablet:AddCategory(
			'columns', isWeakened and 1 or 2,
			'child_justify', "CENTER",
			'hideBlankLine', true
		)
	end
	
	-- iterate roster
	local tooclose = 0
	local added = false
	local tentacleTargeted = false
	
	for unit in roster:IterateRoster() do
		-- proximity
		if tooclose < 5 then
			if (not UnitIsDeadOrGhost(unit.unitid)) and (unit.name ~= playername) and CheckInteractDistance(unit.unitid, 2) then
				cat_proximity:AddLine('text', "|cff"..paintchips:GetHex(unit.class)..unit.name.."|r")
				tooclose = tooclose + 1
			end
		end
		
		if phase2started then
			-- stomach debuff
			for a=1,16 do
				local t = UnitDebuff(unit.unitid, a)
				if not t then break end
				if t == "Interface\\Icons\\Ability_Creature_Disease_02" then
					cat_stomach:AddLine('text', "|cff"..paintchips:GetHex(unit.class)..unit.name.."|r")
					added = true
					
					-- tentacle scan
					if not tentacleTargeted then
						local raidUnit = unit.unitid.."target"
						if UnitExists(raidUnit) and (UnitName(raidUnit) == L["tentacleName"]) and (not UnitIsDead(raidUnit)) then
							tentacleHP = math.ceil((UnitHealth(raidUnit) / UnitHealthMax(raidUnit)) * 100)
							tentacleTargeted = true
						end
					end
					
					break
				end
			end
		elseif tooclose >= 5 then
			break
		end
	end
	
	-- fill out tablet
	-- proximity
	if tooclose == 0 then
		cat_proximity:AddLine('text', L["text_nobody"])
	elseif self.db.profile.sound then
		local t = time()
		if t > lastplayed + 1 then
			lastplayed = t
			if UnitAffectingCombat("player") then
				self:TriggerEvent("BigWigs_Sound", "Beep")
			end
		end
	end
	
	if phase2started then
		-- Stomach
		if not added then
			cat_stomach:AddLine('text', L["text_nobody"])
		end
		
		-- Stomach Tentacles
		if isWeakened then
			cat_tentacle:AddLine('text', L["text_weakened"])
		else
			local hp = tentacleHP.."%"
			local other = "|cff777777??%"
			
			if tentacleTargeted then
				hp = "|cff00ff00"..hp
			else
				hp = "|cff777777"..hp
			end
			if tentacleDead then
				other = L["text_dead"]
			end
			
			cat_tentacle:AddLine(
				'text', L["text_tentacle"].."1血量:",
				'text2', (tentacleDead and other) or hp
			)
			cat_tentacle:AddLine(
				'text', L["text_tentacle"].."2血量:",
				'text2', (tentacleDead and hp) or other
			)
		end
	end
end

function module:ShowTablet()
	if not tablet:IsRegistered("BigWigsCthunAssist") then
		tablet:Register("BigWigsCthunAssist",
			"children",
				function()
					tablet:SetTitle(L["Big Wigs Cthun Assist"])
					self:OnTooltipUpdate()
				end,
			"clickable", true,
			"showTitleWhenDetached", true,
			"showHintWhenDetached", true,
			"cantAttach", true
		)
	end
	
	if not self:IsEventScheduled("bwcthunassistupdate") then
		self:ScheduleRepeatingEvent("bwcthunassistupdate", function() tablet:Refresh("BigWigsCthunAssist") end, .1)
	end
	
	if tablet:IsAttached("BigWigsCthunAssist") then
		tablet:Detach("BigWigsCthunAssist")
	end
end

function module:HideTablet()
	if not tablet:IsRegistered("BigWigsCthunAssist") then return end
	self:CancelScheduledEvent("bwcthunassistupdate")
	tablet:Attach("BigWigsCthunAssist")
end