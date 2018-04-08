
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Patchwerk", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Patchwerk",

	enrage_cmd = "enrage",
	enrage_name = "激怒警报",
	enrage_desc = "激怒的警报",
	
	hateful_cmd = "hateful",
	hateful_name = "仇恨打击条",
	hateful_desc = "显示一个仇恨打击计时条",

	hatefultrigger = "仇恨打击",
	hatefulbar = "仇恨打击(5500-8000伤害)",

	enragetrigger = "%s goes into a berserker rage!",

	enragewarn = "狂暴！",
	starttrigger1 = "Patchwerk want to play!",
	starttrigger2 = "Kel'Thuzad make Patchwerk his Avatar of War!",
	startwarn = "帕奇维克来陪你玩儿! 7分钟后狂暴!",
	enragebartext = "狂暴(秒杀任何人)",
	warn5m = "狂暴 5 分钟",
	warn3m = "狂暴 3 分钟",
	warn90 = "狂暴 90 秒",
	warn60 = "狂暴 60 秒",
	warn30 = "狂暴 30 秒",
	warn10 = "狂暴 10 秒",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20003 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"hateful", "enrage", "bosskill"}

-- locals
local timer = {
	hateful = 1.2,
	enrage = 420,
}
local icon = {
	hateful = "inv_sword_04",
	enrage = "Spell_Shadow_UnholyFrenzy",
}
local syncName = {
	enrage = "PatchwerkEnrage"..module.revision,
}

local berserkannounced = nil
local enrageannounced = false

------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger1"])
module:RegisterYellEngage(L["starttrigger2"])

-- called after module is enabled
function module:OnEnable()
	self:ThrottleSync(10, syncName.enrage)
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "HatefulStrike")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "HatefulStrike")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "HatefulStrike")
	--self:RegisterEvent("UNIT_HEALTH")
	--self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = false
	berserkannounced = false
	enrageannounced = false
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.enrage then
		self:Message(L["startwarn"], "Important")
		self:Bar(L["enragebartext"], timer.enrage, icon.enrage)
		self:DelayedMessage(timer.enrage - 5 * 60, L["warn5m"], "Attention")
		self:DelayedMessage(timer.enrage - 3 * 60, L["warn3m"], "Attention")
		self:DelayedMessage(timer.enrage - 90, L["warn90"], "Urgent")
		self:DelayedMessage(timer.enrage - 60, L["warn60"], "Urgent")
		self:DelayedMessage(timer.enrage - 30, L["warn30"], "Important")
		self:DelayedMessage(timer.enrage - 10, L["warn10"], "Important")
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------
--[[
function module:UNIT_HEALTH( msg )
	if UnitName(msg) == boss then
		local maxHealth = UnitHealthMax(msg)
		local health = UnitHealth(msg)
		if (math.ceil(100*health/maxHealth) > 3 and math.ceil(100*health/maxHealth) < 8 and not enrageannounced) then
			if self.db.profile.enrage then
				self:Message(L["enragewarn"], "Important")
				self:WarningSign(icon.enrage, 5)
			end
			enrageannounced = true
		elseif (math.ceil(100*health/maxHealth) > 11 and enrageannounced) then
			enrageannounced = false
		end
	end
end
function module:CHAT_MSG_MONSTER_EMOTE( msg )
	if msg == L["enragetrigger"] then
		self:Sync(syncName.enrage)
	end
end
--]]
function module:HatefulStrike(msg)
	if string.find(msg, L["hatefultrigger"]) then
		self:Bar(L["hatefulbar"], timer.hateful, icon.hateful, true, "Red")
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.enrage then
		self:Enrage()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Enrage()
	if self.db.profile.enrage then
		self:Message(L["enragewarn"], "Important", nil, "Beware")

		self:RemoveBar(L["enragebartext"])

		self:CancelDelayedMessage(L["warn5m"])
		self:CancelDelayedMessage(L["warn3m"])
		self:CancelDelayedMessage(L["warn90"])
		self:CancelDelayedMessage(L["warn60"])
		self:CancelDelayedMessage(L["warn30"])
		self:CancelDelayedMessage(L["warn10"])
	end
end