
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Sapphiron", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Sapphiron",

	deepbreath_cmd = "deepbreath",
	deepbreath_name = "深呼吸警报",
	deepbreath_desc = "当萨菲隆开始施放深呼吸时警报.",

	lifedrain_cmd = "lifedrain",
	lifedrain_name = "生命吸取",
	lifedrain_desc = "生命吸取的警报.",

	berserk_cmd = "berserk",
	berserk_name = "狂暴",
	berserk_desc = "狂暴警报.",

	icebolt_cmd = "icebolt",
	icebolt_name = "冰块通报",
	icebolt_desc = "当你成为一个冰块时警报.",
	
	blizzard_cmd = "blizzard",
	blizzard_name = "暴风雪图标",
	blizzard_desc = "当你在冰块中站着时显示一个图标.",

	berserk_bar = "狂暴",

    lifedrain_message = "吸取生命! 24秒后下一个!",
    lifedrain_bar = "吸取生命",

	lifedrain_trigger = "生命吸取效果的影响",
	lifedrain_trigger2 = "生命吸取被(.*)抵抗了",
	icebolt_trigger = "你受到了寒冰箭效果的影响。",
	icebolt_trigger2 = "寒冰箭",

	deepbreath_incoming_bar = "即将深呼吸",
	deepbreath_trigger = "开始施放冰霜吐息",
	deepbreath_warning = "深呼吸发动，注意躲避！",
	deepbreath_bar = "冰弹登陆!",
	flight_message = "上天阶段! 冰弹32秒后!",

	icebolt_yell = "我变成了冰块!快躲到我后面!",
	icebolt_bar = "冰箭 %d",
	
	flight_emote = "%s lifts off into the air!",
	resume_emote = "%s resumes his attacks!",
	
	blizzardGained = "你受到了冰冻效果的影响。",
	blizzardLost = "冰冻效果从你身上消失了。",
	
	proximity_cmd = "proximity",
	proximity_name = "附近警报",
	proximity_desc = "显示附近警报框架",

} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"berserk", "proximity", "lifedrain", "deepbreath", "icebolt", "blizzard", "bosskill"}

-- Proximity Plugin
module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
module.proximitySilent = true


-- locals
local timer = {
	berserk = 900,
	deepbreathAfterLift = 23,
	deepbreath = 6,
	firstLifedrain = 7,
	lifedrainAfterFlight = 6,
	lifedrain = 24,
	iceboltAfterFlight = 9,
	iceboltInterval = 4,
}
local icon = {
	deepbreath = "Spell_Frost_FrostShock",
	deepbreathInc = "Spell_Arcane_PortalIronForge",
	lifedrain = "Spell_Shadow_LifeDrain02",
	berserk = "INV_Shield_01",
	icebolt = "Spell_Frost_FrostBolt02",
	blizzard = "Spell_Frost_IceStorm",
}
local syncName = {
	lifedrain = "SapphironLifeDrain"..module.revision,
}

local timeLifeDrain = nil

------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "CheckForDeepBreath")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckForLifeDrain")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckForLifeDrain")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckForLifeDrain")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")

	self:ThrottleSync(4, syncName.lifedrain)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	timeLifeDrain = nil
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.berserk then
		self:Bar(L["berserk_bar"], timer.berserk, icon.berserk)
	end
	if self.db.profile.lifedrain then
		self:Bar(L["lifedrain_bar"], timer.firstLifedrain, icon.lifedrain)
	end
	if self.db.profile.proximity then
		self:Proximity()
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
	self:RemoveProximity()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, L["blizzardLost"]) and self.db.profile.blizzard then
		self:RemoveWarningSign(icon.blizzard)
	end
end


function module:CheckForLifeDrain(msg)
	if string.find(msg, L["lifedrain_trigger"]) or string.find(msg, L["lifedrain_trigger2"]) then
		if not timeLifeDrain or (timeLifeDrain + 2) < GetTime() then
			self:Sync(syncName.lifedrain)
			timeLifeDrain = GetTime()
		end
	elseif string.find(msg, L["icebolt_trigger"]) and self.db.profile.icebolt then
		SendChatMessage(L["icebolt_yell"], "YELL")
	elseif string.find(msg, L["blizzardGained"]) and self.db.profile.blizzard then
		self:WarningSign(icon.blizzard, 6)
	end
end

function module:CheckForDeepBreath(msg)
	if msg == L["deepbreath_trigger"] then
		if self.db.profile.deepbreath then
			self:Message(L["deepbreath_warning"], "Important")
			self:Bar(L["deepbreath_bar"], timer.deepbreath, icon.deepbreath)
		end
	elseif msg == L["flight_emote"] then
		self:Flight()
	elseif msg == L["resume_emote"] then
		self:Ground()
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.lifedrain then
		self:LifeDrain()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:LifeDrain()
	if self.db.profile.lifedrain then
		self:Message(L["lifedrain_message"], "Urgent")
		self:Bar(L["lifedrain_bar"], timer.lifedrain, icon.lifedrain)
	end
end

------------------------------
--      	Utility		    --
------------------------------

function module:Flight()
	self:RemoveBar(L["lifedrain_bar"])
	if self.db.profile.deepbreath then
		self:Message(L["flight_message"], "Urgent")
		self:Bar(L["deepbreath_incoming_bar"], timer.deepbreathAfterLift, icon.deepbreathInc)
	end
	if self.db.profile.icebolt then
		self:Bar(string.format(L["icebolt_bar"], 1), timer.iceboltAfterFlight, icon.icebolt)
		self:DelayedBar(timer.iceboltAfterFlight, string.format(L["icebolt_bar"], 2), timer.iceboltInterval, icon.icebolt)
		self:DelayedBar(timer.iceboltAfterFlight + timer.iceboltInterval, string.format(L["icebolt_bar"], 3), timer.iceboltInterval, icon.icebolt)
		self:DelayedBar(timer.iceboltAfterFlight + 2 * timer.iceboltInterval, string.format(L["icebolt_bar"], 4), timer.iceboltInterval, icon.icebolt)
		self:DelayedBar(timer.iceboltAfterFlight + 3 * timer.iceboltInterval, string.format(L["icebolt_bar"], 5), timer.iceboltInterval, icon.icebolt)
	end
end

function module:Ground()
	if self.db.profile.lifedrain then
		self:Bar(L["lifedrain_bar"], timer.lifedrainAfterFlight, icon.lifedrain)
	end
end