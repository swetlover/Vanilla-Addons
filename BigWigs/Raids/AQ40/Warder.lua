
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Anubisath Warder", "Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Warder",

	fear_cmd = "fear",
	fear_name = "恐惧时间",
	fear_desc = "显示恐惧CD",

	silence_cmd = "silence",
	silence_name = "沉默时间",
	silence_desc = "显示沉默CD",

	roots_cmd = "roots",
	roots_name = "定身时间",
	roots_desc = "显示定身CD",

	dust_cmd = "dust",
	dust_name = "尘雾之云时间",
	dust_desc = "显示尘雾之云CD",

	warnings_cmd = "warnings",
	warnings_name = "警告消息",
	warnings_desc = "警报当前小怪显示当前的2个能力",

	fearTrigger = "阿努比萨斯守望者开始施放恐惧术。",
	fearBar = "恐惧!",
	fearBar_next = "可能恐惧",

	silenceTrigger = "阿努比萨斯守望者开始施放沉默。",
	silenceBar = "沉默!",
	silenceBar_next = "可能沉默",

	rootsTrigger = "阿努比萨斯守望者开始施放纠缠根须。",
	rootsBar = "定身!",
	rootsBar_next = "可能定身",

	dustTrigger = "阿努比萨斯守望者开始施展尘雾之云。",
	dustBar = "尘雾之云!",
	dustBar_next = "可能尘雾之云",

	dustWarn = "尘雾之云",
	dustWarn2 = "(定身或恐惧)",

	fearWarn = "恐惧",
	fearWarn2 = "(沉默或尘雾之云)",

	rootsWarn = "定身",
	rootsWarn2 = "(沉默或尘雾之云)",

	silenceWarn = "沉默",
	silenceWarn2 = "(定身或恐惧)",

} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20001 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"fear", "silence", "roots", "dust", "warnings"--[[, "bosskill"]]}

-- locals
local timer = {
	fear = 20,
	fearCast = 1.5,
	silence = 15,
	silenceCast = 1.5,
	roots = 15,
	rootsCast = 1.5,
	dust = 15,
	dustCast = 1.5,
}
local icon = {
	fear = "Spell_Shadow_Possession",
	silence = "Spell_Holy_Silence",
	roots = "Spell_Nature_StrangleVines",
	dust = "Ability_Hibernation",
}
local syncName = {
	fear = "WarderFear"..module.revision,
	silence = "WarderSilence"..module.revision,
	roots = "WarderRoots"..module.revision,
	dust = "WarderDust"..module.revision,
}

local pull = nil
------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")

	if not warnings then
		warnings = {
			["dust"] = {L["dustWarn"], L["dustWarn2"]},
			["roots"] = {L["rootsWarn"], L["rootsWarn2"]},
			["fear"] = {L["fearWarn"], L["fearWarn2"]},
			["silence"] = {L["silenceWarn"], L["silenceWarn2"]},
		}
	end

	self:ThrottleSync(10, syncName.fear)
	self:ThrottleSync(10, syncName.silence)
	self:ThrottleSync(10, syncName.roots)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
	self.ability1 = nil
	self.ability2 = nil
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:Event(msg)
	if string.find(msg, L["fearTrigger"]) then
		self:Sync(syncName.fear)
	elseif string.find(msg, L["silenceTrigger"]) then
		self:Sync(syncName.silence)
	elseif string.find(msg, L["rootsTrigger"]) then
		self:Sync(syncName.roots)
	elseif string.find(msg, L["dustTrigger"]) then
		self:Sync(syncName.dust)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync( sync, rest, nick )
	if sync == syncName.fear then
		if self.db.profile.fear then
			self:RemoveBar(L["fearBar_next"])
			self:Bar(L["fearBar"], timer.fearCast, icon.fear)
			self:DelayedBar(timer.fearCast, L["fearBar_next"], timer.fear-timer.fearCast, icon.fear)
		end
		self:AbilityWarn("fear")
	elseif sync == syncName.silence then
		if self.db.profile.silence then
			self:RemoveBar(L["silenceBar_next"])
			self:Bar(L["silenceBar"], timer.silenceCast, icon.silence)
			self:DelayedBar(timer.silenceCast, L["silenceBar_next"], timer.silence-timer.silenceCast, icon.silence)
		end
		self:AbilityWarn("silence")
	elseif sync == syncName.roots then
		if self.db.profile.roots then
			self:RemoveBar(L["rootsBar_next"])
			self:Bar(L["rootsBar"], timer.rootsCast, icon.roots)
			self:DelayedBar(timer.rootsCast, L["rootsBar_next"], timer.roots-timer.rootsCast, icon.roots)
		end
		self:AbilityWarn("roots")
	elseif sync == syncName.dust then
		if self.db.profile.dust then
			self:RemoveBar(L["dustBar_next"])
			self:Bar(L["dustBar"], timer.dustCast, icon.dust)
			self:DelayedBar(timer.dustCast, L["dustBar_next"], timer.dust-timer.dustCast, icon.dust)
		end
		self:AbilityWarn("dust")
	end
end

function module:AbilityWarn( ability )
	if self.db.profile.warnings then
		if not self.ability1 then
			self.ability1 = ability
			self:Message(string.format("%s + %s",warnings[self.ability1][1], warnings[self.ability1][2]), "Core", nil, "Long")
		elseif not self.ability2 and ability ~= self.ability1 then
			self.ability2 = ability
			self:Message(string.format("%s + %s",warnings[self.ability1][1], warnings[self.ability2][1]), "Core", nil, "Long")
		end
	end
end