
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Ayamiss the Hunter", "Ruins of Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Ayamiss",
	sacrifice_cmd = "sacrifice",
	sacrifice_name = "祭品警报",
	sacrifice_desc = "被作为祭品时发出警报",

	sacrificetrigger = "^([^%s]+)([^%s]+)麻痹效果的影响",
	sacrificewarn = " 成为祭品了！",
	you = "你",
	are = "受到了",	
} end )

L:RegisterTranslations("deDE", function() return {
	sacrifice_name = "Opferung",
	sacrifice_desc = "Warnung, wenn ein Spieler geopfert wird.",

	sacrificetrigger = "^([^%s]+) ([^%s]+) von Paralisieren betroffen.",
	sacrificewarn = " wird geopfert!",
	you = "Ihr",
	are = "seid",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"sacrifice", "bosskill"}

-- locals
local timer = {}
local icon = {}
local syncName = {}


------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckSacrifice")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckSacrifice")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckSacrifice")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CheckSacrifice( msg )
	local _, _, player, type = string.find(msg, L["sacrificetrigger"])
	if (player and type) then
		if (player == L["you"] and type == L["are"]) then
			player = UnitName("player")
		end

		if self.db.profile.sacrifice then
			self:Message(player .. L["sacrificewarn"], "Important")
		end
	end
end
