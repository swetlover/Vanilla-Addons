
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Wushoolay", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Wushoolay",

	chainlightning_trigger = "乌苏雷开始施放闪电链。",
	chainlightning_bar = "闪电链(可打断)",
	chainlightning_message = "闪电链! 打断他!",
	lightningcloud_trigger = "你受到了落雷之云效果的影响。",
	lightningcloud_message = "走出落雷之云!",

	chainlightning_cmd = "chainlightning",
	chainlightning_name = "闪电链警报",
	chainlightning_desc = "闪电链警报.",
	
	lightningcloud_cmd = "lightningcloud",
	lightningcloud_name = "落雷之云警报",
	lightningcloud_desc = "落雷之云警报.",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Wushoolay",

	chainlightning_trigger = "Wushoolay beginnt Kettenblitzschlag zu wirken\.",
	chainlightning_bar = "Kettenblitzschlag",
	chainlightning_message = "Kettenblitzschlag! Unterbreche sie!",
	lightningcloud_trigger = "Ihr seid von Blitzschlagwolke betroffen\.",
	lightningcloud_message = "Beweg dich aus der Blitzschlagwolke!",

	chainlightning_cmd = "chainlightning",
	chainlightning_name = "Alarm f\195\188r Kettenblitzschlag",
	chainlightning_desc = "Warnen wenn Wushoolay beginnt Kettenblitzschlag zu wirken.",

	lightningcloud_cmd = "lightningcloud",
	lightningcloud_name = "Alarm f\195\188r Blitzschlagwolke",
	lightningcloud_desc = "Warnt dich wenn du in Blitzschlagwolke stehst.",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"chainlightning", "lightningcloud", "bosskill"}


-- locals
local timer = {
	chainlightning = 1.5,
}
local icon = {
	chainlightning = "Spell_Nature_ChainLightning",
}
local syncName = {
	chainlightning = "WushoolayChainLightning"..module.revision,
}

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")

	self:ThrottleSync(3, syncName.chainlightning)
end

------------------------------
--      Events              --
------------------------------

function module:Event(msg)
	if msg == L["lightningcloud_trigger"] and self.db.profile.lightningcloud then
		self:Message(L["lightningcloud_message"], "Attention", "Alarm")
	elseif msg == L["chainlightning_trigger"] then
		self:Sync(syncName.chainlightning)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.chainlightning and self.db.profile.chainlightning then
		self:Message(L["chainlightning_message"], "Important")
		self:Bar(L["chainlightning_bar"], timer.chainlightning, icon.chainlightning)
	end
end
