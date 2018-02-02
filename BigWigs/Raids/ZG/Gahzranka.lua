
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Gahz'ranka", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Gahzranka",

	frostbreath_trigger = "加兹兰卡开始施展冰息术。",
	frostbreath_bar = "冰息术",
	massivegeyser_trigger = "加兹兰卡开始施放巨型喷泉。",
	massivegeyser_bar = "巨型喷泉",

	frostbreath_cmd = "frostbreath",
	frostbreath_name = "冰息术警报",
	frostbreath_desc = "冰息术警报.",

	massivegeyser_cmd = "massivegeyser",
	massivegeyser_name = "巨型喷泉警报",
	massivegeyser_desc = "巨型喷泉警报.",
} end )

L:RegisterTranslations("deDE", function() return {
	--cmd = "Gahzranka",

	frostbreath_trigger = "Gahz\'ranka beginnt Frostatem auszuf\195\188hren\.",
	frostbreath_bar = "Frostatem",
	massivegeyser_trigger = "Gahz\'ranka beginnt Massiver Geysir zu wirken\.",
	massivegeyser_bar = "Massiver Geysir",

	--frostbreath_cmd = "frostbreath",
	frostbreath_name = "Alarm f\195\188r Frostatem",
	frostbreath_desc = "Warnen wenn Gahz'ranka beginnt Frostatem zu wirken.",

	--massivegeyser_cmd = "massivegeyser",
	massivegeyser_name = "Alarm f\195\188r Massiver Geysir",
	massivegeyser_desc = "Warnen wenn Gahz'ranka beginnt Massiver Geysir zu wirken.",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"frostbreath", "massivegeyser", "bosskill"}

-- locals
local timer = {
	breath = 2,
	geyser = 1.5,
}
local icon = {
	breath = "Spell_Frost_FrostNova",
	geyser = "Spell_Frost_SummonWaterElemental",
}

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["frostbreath_trigger"] and self.db.profile.frostbreath then
		self:Bar(L["frostbreath_bar"], timer.breath, icon.breath)
	elseif msg == L["massivegeyser_trigger"] and self.db.profile.massivegeyser then
		self:Bar(L["massivegeyser_bar"], timer.geyser, icon.geyser, true, "White")
	end
end
