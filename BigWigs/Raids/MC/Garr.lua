
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Garr", "Molten Core")

module.revision = 20006 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = nil
module.toggleoptions = {"adds", "bosskill"}

module.defaultDB = {
	adds = false,
}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {}
local icon = {}
local syncName = {
	}

local adds = 0

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	firesworn_name = "火誓者",
	triggeradddead8 = "加尔获得了激怒(.+)8",
	triggeradddead7 = "加尔获得了激怒(.+)7",
	triggeradddead6 = "加尔获得了激怒(.+)6",
	triggeradddead5 = "加尔获得了激怒(.+)5",
	triggeradddead4 = "加尔获得了激怒(.+)4",
	triggeradddead3 = "加尔获得了激怒(.+)3",
	triggeradddead2 = "加尔获得了激怒(.+)2",
    triggeradddead1 = "加尔获得了激怒的效果。",

    counterbarMsg = "火誓者死亡",
	addmsg1 = "1/8 火誓者死亡!",
	addmsg2 = "2/8 火誓者死亡!",
	addmsg3 = "3/8 火誓者死亡!",
	addmsg4 = "4/8 火誓者死亡!",
	addmsg5 = "5/8 火誓者死亡!",
	addmsg6 = "6/8 火誓者死亡!",
	addmsg7 = "7/8 火誓者死亡!",
	addmsg8 = "8/8 火誓者死亡!",

	cmd = "Garr",
	
	adds_cmd = "adds",
	adds_name = "小怪死亡",
	adds_desc = "通告火誓者死亡",
} end)

L:RegisterTranslations("deDE", function() return {
	firesworn_name = "Feueranbeter",
	triggeradddead1 = "Garr bekommt \'Wutanfall\'.",
	triggeradddead2 = "Garr bekommt \'Wutanfall(.+)2",
	triggeradddead3 = "Garr bekommt \'Wutanfall(.+)3",
	triggeradddead4 = "Garr bekommt \'Wutanfall(.+)4",
	triggeradddead5 = "Garr bekommt \'Wutanfall(.+)5",
	triggeradddead6 = "Garr bekommt \'Wutanfall(.+)6",
	triggeradddead7 = "Garr bekommt \'Wutanfall(.+)7",
	triggeradddead8 = "Garr bekommt \'Wutanfall(.+)8",

	counterbarMsg = "Feueranbeter tot",
	addmsg1 = "1/8 Feueranbeter tot!",
	addmsg2 = "2/8 Feueranbeter tot!",
	addmsg3 = "3/8 Feueranbeter tot!",
	addmsg4 = "4/8 Feueranbeter tot!",
	addmsg5 = "5/8 Feueranbeter tot!",
	addmsg6 = "6/8 Feueranbeter tot!",
	addmsg7 = "7/8 Feueranbeter tot!",
	addmsg8 = "8/8 Feueranbeter tot!",

	cmd = "Garr",

	adds_cmd = "adds",
	adds_name = "Z\195\164hler f\195\188r tote Adds",
	adds_desc = "Verk\195\188ndet Feueranbeter Tod",
} end)


------------------------------
--      Initialization      --
------------------------------

module.wipemobs = { L["firesworn_name"] }

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started    = nil
	adds       		= 0
end

-- called after boss is engaged
function module:OnEngage()
--self:TriggerEvent("BigWigs_StartCounterBar", self, L["counterbarMsg"], 8, "Interface\\Icons\\spell_nature_strengthofearthtotem02")
--self:TriggerEvent("BigWigs_SetCounterBar", self, L["counterbarMsg"], (8 - 0.1))
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if (string.find(msg, L["triggeradddead8"])) then
		self:Sync("GarrAddDead8")
	elseif (string.find(msg, L["triggeradddead7"])) then
		self:Sync("GarrAddDead7")
	elseif (string.find(msg, L["triggeradddead6"])) then
		self:Sync("GarrAddDead6")
	elseif (string.find(msg, L["triggeradddead5"])) then
		self:Sync("GarrAddDead5")
	elseif (string.find(msg, L["triggeradddead4"])) then
		self:Sync("GarrAddDead4")
	elseif (string.find(msg, L["triggeradddead3"])) then
		self:Sync("GarrAddDead3")
	elseif (string.find(msg, L["triggeradddead2"])) then
		self:Sync("GarrAddDead2")
	elseif (string.find(msg, L["triggeradddead1"])) then
		self:Sync("GarrAddDead1")
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if self.started and string.find(sync, "GarrAddDead%d") then
		local newCount = tonumber(string.sub(sync, 12))

		if self.adds < newCount then
			self.adds = newCount
			if self.db.profile.adds then
				self:Message(L["addmsg" .. newCount], "Positive")
				--self:TriggerEvent("BigWigs_SetCounterBar", self, L["counterbarMsg"], (8 - newCount))
			end
		end
	end
end
