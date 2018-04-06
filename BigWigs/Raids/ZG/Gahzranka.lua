
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
	frostbreath_bar = "冰息术 CD (锥形冰伤)",
 	frostbreathcast_bar = "冰息术施放(锥形冰伤)",
	massivegeyser_trigger = "加兹兰卡开始施放巨型喷泉。",
	massivegeyser_bar = "巨型喷泉(击飞)",
	slam_trigger = "加兹兰卡的加兹兰卡猛击",
	slam_bar = "猛击CD",

	frostbreath_cmd = "frostbreath",
	frostbreath_name = "冰息术警报",
	frostbreath_desc = "冰息术警报.",

	massivegeyser_cmd = "massivegeyser",
	massivegeyser_name = "巨型喷泉警报",
	massivegeyser_desc = "巨型喷泉警报.",
	
 	slam_cmd = "slam",
 	slam_name = "加兹兰卡猛击警报",
 	slam_desc = "加兹兰卡猛击计时.",
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
module.revision = 20005 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"frostbreath", "massivegeyser", "bosskill"}

-- locals
local timer = {
	breathCast = 2,
 	firstBreath = 15,
 	breathInterval = 17,
 	
 	firstSlam = 3,
 	slamInterval = 10,
 
	geyser = 1.5,
}
local icon = {
	breath = "Spell_Frost_FrostNova",
	geyser = "Spell_Frost_SummonWaterElemental",
	slam = "Ability_Devour"

}

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
end

function module:OnEngage()
 	self:Bar(L["frostbreath_bar"], timer.firstBreath, icon.breath, true, "Cyan")
 	self:Bar(L["slam_bar"], timer.firstSlam, icon.slam)
end
 
function module:OnSetup()
end

function module:OnDisengage()
end

------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["frostbreath_trigger"] and self.db.profile.frostbreath then
		self:Bar(L["frostbreathcast_bar"], timer.breathCast, icon.breath, true, "Blue")
 		self:DelayedBar(timer.breathCast, L["frostbreath_bar"], timer.breathInterval-timer.breathCast, icon.breath, true, "Cyan")
	elseif msg == L["massivegeyser_trigger"] and self.db.profile.massivegeyser then
		self:Bar(L["massivegeyser_bar"], timer.geyser, icon.geyser, true, "White")
	elseif string.find(msg, L["slam_trigger"]) then
 		self:Bar(L["slam_bar"], timer.slamInterval, icon.slam)
	end
end
