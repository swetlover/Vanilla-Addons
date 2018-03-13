
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Golemagg the Incinerator", "Molten Core")

module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"earthquake", "enraged", "bosskill"}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {}
local icon = {}
local syncName = {
	earthquake = "GolemaggEarthquake",
	enrage = "GolemaggEnrage",
}

local earthquakeon = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	corerager_name = "熔火怒犬",
	earthquakesoonwarn = "小心地震",
	golemaggenrage = "焚化者古雷曼格获得了狂怒",
	enragewarn = "Boss狂怒!",

	cmd = "Golemagg",
	
	enraged_cmd = "enraged",
	enraged_name = "通告Boss狂怒",
	enraged_desc = "让你知道boss狂怒了",
	
	earthquake_cmd = "earthquake",
	earthquake_name = "地震通告",
	earthquake_desc = "宣布近战后退时间",
} end)

L:RegisterTranslations("deDE", function() return {
	corerager_name = "Kernw\195\188terich",
	earthquakesoonwarn = "Erdbeben bald",
	golemaggenrage = "Golemagg der Verbrenner bekommt \'Wutanfall",
	enragewarn = "Boss ist in Raserei!",

	--cmd = "Golemagg",

	--enraged_cmd = "enraged",
	enraged_name = "Verk\195\188ndet Boss' Raserei",
	enraged_desc = "L\195\164sst dich wissen, wenn Boss h\195\164rter zuschl\195\164gt",

	--earthquake_cmd = "earthquake",
	earthquake_name = "Verk\195\188ndet erdbeben",
	earthquake_desc = "Sagt an, wenn es f\195\188r die Melees zeit ist, weg zu gehen",
} end)


------------------------------
--      Initialization      --
------------------------------

module.wipemobs = { L["corerager_name"] }

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("UNIT_HEALTH")

	self:ThrottleSync(10, syncName.earthquake)
	self:ThrottleSync(10, syncName.enrage)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	earthquakeon = nil
end

-- called after boss is engaged
function module:OnEngage()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["golemaggenrage"]) then
		self:Sync(syncName.enrage)
	end
end

function module:UNIT_HEALTH(arg1)
	if UnitName(arg1) == module.translatedName then
		local health = UnitHealth(arg1)
		local maxHealth = UnitHealthMax(arg1)
		if math.ceil(100*health/maxHealth) > 13 and math.ceil(100*health/maxHealth) <= 20 and not earthquakeon then
			self:Sync(syncName.earthquake)
			earthquakeon = true
		elseif math.ceil(health) > 23 and earthquakeon then
			earthquakeon = nil
		end
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.earthquake and self.db.profile.earthquake then
		self:Message(L["earthquakesoonwarn"], "Attention", "Alarm")
	elseif sync == syncName.enrage and self.db.profile.enraged then
		self:Message(L["enragewarn"], "Attention", true, "Beware")
	end
end
