-- King Gordok by Dekos --
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("King Gordok", "Dire Maul")

module.revision = 20002
module.enabletrigger = module.translatedName
module.toggleoptions = {"stomp", "ms", "charge", "bosskill"}

------------------------------
--      Locals 			    --
------------------------------

local timer = {
	firstWarStomp = {13, 24}, --13,
	warStomp = {17, 26}, --17.5, 22

	firstMortalStrike = {24, 30}, --24,
	mortalStrike = {17, 26}, --24, 25, 22, 17, 26

	charge = {6, 7},
}

local icon = {
	warStomp = "Ability_WarStomp",
	mortalStrike = "Ability_Warrior_SavageBlow",
	charge = "Ability_Warrior_Charge",
}
local lastStomp = 0
local lastMS = 0

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Gordok",
	
	ms_cmd = "ms",
	ms_name = "致死打击",
	ms_desc = "当别人受到致死打击时警报",

	stomp_cmd = "stomp",
	stomp_name = "战争践踏",
	stomp_desc = "当别人受到战争践踏时警报",

	charge_cmd = "charge",
	charge_name = "冲锋",
	charge_desc = "当别人受到冲锋时警报",

	ms_trigger = "戈多克大王的致死打击",
	warstomp_trigger = "戈多克大王的战争践踏",
	
	ms_bar = "致死打击 CD",
	warstomp_bar = "战争践踏 CD",
	charge_bar = "冲锋 CD",

} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Gordok",
	
	ms_cmd = "ms",
	ms_name = "Mortal Strike",
	ms_desc = "Warn when someone gets Mortal Strike",

	stomp_cmd = "stomp",
	stomp_name = "War Stomp",
	stomp_desc = "Warn when someone gets War Stomp",

	charge_cmd = "charge",
	charge_name = "Charge",
	charge_desc = "Warn when someone gets Charge",

	ms_trigger = "King Gordok's Mortal Strike",
	warstomp_trigger = "King Gordok's War Stomp",
	
	ms_bar = "Mortal Strike CD",
	warstomp_bar = "Warstomp CD",
	charge_bar = "Charge CD",

} end )

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	--self:ThrottleSync(2, syncName.debuff)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
	lastStomp = 0
	lastMS = 0
	if self.db.profile.stomp then
		self:IntervalBar(L["warstomp_bar"], timer.firstWarStomp[1], timer.firstWarStomp[2], icon.warStomp, true, "White")
	end
	if self.db.profile.ms then
		self:IntervalBar(L["ms_bar"], timer.firstMortalStrike[1], timer.firstMortalStrike[2], icon.mortalStrike, true, "Black")
	end
	if self.db.profile.charge then
		self:IntervalBar(L["charge_bar"], timer.charge[1], timer.charge[2], icon.charge, true, "Yellow")
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end

------------------------------
--      Event Handlers	    --
------------------------------

function module:Event(msg)
	if self.db.profile.stomp and string.find(msg, L["warstomp_trigger"]) then
		if GetTime() > lastStomp + 2 then
			lastStomp = GetTime()
			self:Warstomp()
		end
	elseif self.db.profile.ms and string.find(msg, L["ms_trigger"]) then
		if GetTime() > lastMS + 2 then
			lastMS = GetTime()
			self:MortalStrike()
		end
	end
end

function module:Warstomp()
	self:IntervalBar(L["warstomp_bar"], timer.warStomp[1], timer.warStomp[2], icon.warStomp, true, "White")
end

function module:MortalStrike()
	self:IntervalBar(L["ms_bar"], timer.mortalStrike[1], timer.mortalStrike[2], icon.mortalStrike, true, "Black")
end