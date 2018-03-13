----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Death Talon Wyrmguard", "Blackwing Lair")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Wyrmguard",
	
	warstomp_cmd = "warstomp",
	warstomp_name = "战争践踏警报",
	warstomp_desc = "战争践踏警报",
	
	warstomp_trigger = "死爪龙人护卫的战争践踏",
	warstomp_bar = "战争践踏 CD",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20001 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"warstomp"--[[, "bosskill"]]}
module.trashMod = true

-- locals
local timer = {
	warstomp = {9.5, 12.5}
}
local icon = {
	warstomp = "Ability_WarStomp"
}
local syncName = {
	warstomp = "WyrmguardWarstomp"..module.revision
}

local stompNumber = 1
local deathCount = 0

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --warstomp_trigger
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PLAYER_DAMAGE", "Event") --warstomp_trigger
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --warstomp_trigger
	self:ThrottleSync(0.5, syncName.warstomp)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	stompNumber = 1
	deathCount = 0
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

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, module.translatedName) then
		deathCount = deathCount + 1
		if deathCount >= 3 then
			BigWigs:CheckForBossDeath(msg, self)
		end
	end
end

function module:Event(msg)
	if string.find(msg, L["warstomp_trigger"]) then
		self:Sync(syncName.warstomp)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync( sync, rest, nick )
	if sync == syncName.warstomp and self.db.profile.warstomp then
		self:WarStomp(stompNumber)
		stompNumber = stompNumber + 1
		if stompNumber >= 4 then
			stompNumber = 1
		end
	end
end
			
------------------------------
--      Sync Handlers	    --
------------------------------
			
function module:WarStomp(number)
	self:IntervalBar(L["warstomp_bar"]..number, timer.warstomp[1], timer.warstomp[2], icon.warstomp)
end
