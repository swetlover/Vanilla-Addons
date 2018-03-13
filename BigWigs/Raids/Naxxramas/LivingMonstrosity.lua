----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Living Monstrosity", "Naxxramas")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Monstrosity",
	
	lightningtotem_cmd = "lightningtotem",
	lightningtotem_name = "闪电图腾警报",
	lightningtotem_desc = "闪电图腾召唤警报",
	
	lightningtotem_trigger = "畸形妖开始施放闪电图腾",
	lightningtotem_trigger2 = "畸形妖施放了闪电图腾。",
	lightningtotem_bar = "召唤闪电图腾",
	lightningtotem_message = "闪电图腾施放",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20001 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = { "lightningtotem" }
module.trashMod = true

-- locals
local timer = {
	lightningTotem = {0.5, 2} --we want to use intervalbar so ppl don't miss such a fast cast
}

local icon = {
	lightningTotem = "Spell_Nature_Lightning"
}

local syncName = {
}

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE") --lightningtotem_trigger
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF") --lightningtotem_trigger2
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
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

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if string.find(msg, L["lightningtotem_trigger"]) and self.db.profile.lightningtotem then
		self:Message(L["lightningtotem_message"], "Urgent")
		self:IntervalBar(L["lightningtotem_bar"], timer.lightningTotem[1], timer.lightningTotem[2], icon.lightningTotem)
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if string.find(msg, L["lightningtotem_trigger2"]) and self.db.profile.lightningtotem then
		self:Message(L["lightningtotem_message"], "Urgent")
		self:WarningSign(icon.lightningTotem, 5)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)
	if (msg == string.format(UNITDIESOTHER, "闪电图腾")) then
		self:RemoveWarningSign(icon.lightningTotem)
	end
end