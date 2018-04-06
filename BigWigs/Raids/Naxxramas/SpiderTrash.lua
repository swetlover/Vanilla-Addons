----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Venom Stalker", "Naxxramas")
local venomstalker = AceLibrary("Babble-Boss-2.2")["Venom Stalker"]
local necrostalker = AceLibrary("Babble-Boss-2.2")["Necro Stalker"]

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "SpiderTrash",
	
	charge_cmd = "charge",
	charge_name = "毒性充能",
	charge_desc = "显示一个毒性充能的冷却计时.",
	
	charge_trigger = "受到了毒性充能效果的影响。",
	chargeself_trigger = "你受到了毒性充能效果的影响。",
	chargegone_self = "毒性充能效果从你身上消失了",
	charge_bar = "毒性充能(冲锋) CD",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

--module variables
module.revision = 20001
module.enabletrigger = {necrostalker, venomstalker}
module.toggleoptions = {"charge"}
module.trashMod = true

--locals
local timer = {
	charge = {10, 15},
}

local icon = {
	charge = "spell_nature_corrosivebreath",
}

local deathCount = 0
local chargeNumber = 1
local lastCharge = 0
local poisonsOnSelf = 0
------------------------------
--      Initialization      --
------------------------------

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
end

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	deathCount = 0
	chargeNumber = 1
	lastCharge = 0
	poisonsOnSelf = 0
end

function module:OnEngage()
end

------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, L["chargegone_self"]) then
		poisonsOnSelf = poisonsOnSelf - 1
		if poisonsOnSelf == 0 then
			self:RemoveWarningSign(icon.charge)
		end
	end
end
		
function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, venomstalker) or
	msg == string.format(UNITDIESOTHER, necrostalker) then
		deathCount = deathCount + 1
		if deathCount == 2 then
			self:SendBossDeathSync()
		end
	end
end

function module:Event(msg)
	if self.db.profile.charge and string.find(msg, L["charge_trigger"]) then
		if GetTime() > lastCharge + 1 then
			lastCharge = GetTime()
			local registered, time, elapsed, running = self:BarStatus(L["charge_bar"]..chargeNumber)
			if running and elapsed > 9.5 then
				self:IntervalBar(L["charge_bar"]..chargeNumber, timer.charge[1], timer.charge[2], icon.charge)
			elseif running and elapsed < 10 then
				if chargeNumber == 1 then
					chargeNumber = 2
				else
					chargeNumber = 1
				end
				self:IntervalBar(L["charge_bar"]..chargeNumber, timer.charge[1], timer.charge[2], icon.charge)
			else
				self:IntervalBar(L["charge_bar"]..chargeNumber, timer.charge[1], timer.charge[2], icon.charge)
			end
		end
	elseif self.db.profile.charge and string.find(msg, L["chargeself_trigger"]) then
		poisonsOnSelf = poisonsOnSelf + 1
		self:WarningSign(icon.charge, 6)
	end
end