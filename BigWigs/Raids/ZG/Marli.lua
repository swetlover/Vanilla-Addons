
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("High Priestess Mar'li", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	spawn_name = "玛尔里的爪牙",
	
	cmd = "Marli",

	spiders_trigger = "Aid me my brood!",
	drainlifeyoustart_trigger = "你受到了吸取生命效果的影响。",
	drainlifeotherstart_trigger = "(.+)受到了吸取生命效果的影响。",
	drainlifeyouend_trigger = "吸取生命效果从你身上消失了。",
	drainlifeotherend_trigger = "吸取生命效果从(.+)身上消失。",
	pbv = "毒箭之雨",
	pbvafflicts_trigger = "受到了毒箭之雨效果",
	pbvhits_trigger = "High Priestess Mar'li的毒箭之雨击中",
	pbvresist_trigger = "High Priestess Mar'li的毒箭之雨被(.+)抵抗了。",
	pbvimmune_trigger = "High Priestess Mar'li的毒箭之雨施放失败。(.+)对此免疫。",
	you = "你",
	
 	spiderphase_bar = "下个蜘蛛阶段",
 	trollphase_bar = "下个巨魔阶段",
 	charge_bar = "冲锋 CD",
 	charge_trigger = "High Priestess Mar'li的冲锋",
 
	drainlife = "吸取生命",
	spiders_message = "蜘蛛刷新!",
	drainlife_message = "吸取生命! 打断/驱散它!",
	trollphase = "巨魔阶段",
	trollphase_trigger = "The brood shall not fall",
	spiderphase = "蜘蛛阶段",
	spiderphase_trigger1 = "Draw me to your web mistress Shadra",
	spiderphase_trigger2 = "Shadra, make of me your avatar",

	spider_cmd = "spider",
	spider_name = "蜘蛛警报",
	spider_desc = "蜘蛛刷新警报",

	volley_cmd = "volley",
	volley_name = "毒箭之雨警报",
	volley_desc = "毒箭之雨警报\n",

	drain_cmd = "drain",
	drain_name = "吸取生命警报",
	drain_desc = "吸取生命警报",
	
	phase_cmd = "phase",
	phase_name = "阶段通知",
	phase_desc = "阶段通知",

	charge_cmd = "charge",
 	charge_name = "冲锋警报",
 	charge_desc = "冲锋警报",
} end )

L:RegisterTranslations("deDE", function() return {
	spawn_name = "Spawn of Mar'li",

	--cmd = "Marli",

	spiders_trigger = "Aid me my brood!",
	drainlifeyoustart_trigger = "Ihr seid von Blutsauger betroffen\.",
	drainlifeotherstart_trigger = "(.+) ist von Blutsauger betroffen\.",
	drainlifeyouend_trigger = "\'Blutsauger\' schwindet von Euch\.",
	drainlifeotherend_trigger = "Blutsauger schwindet von (.+)\.",
	pbv = "Giftblitzsalve",
	pbvafflicts_trigger = "von Giftblitzsalve betroffen",
	pbvhits_trigger = "Giftblitzsalve(.+) Naturschaden\.",
	pbvresist_trigger = "Giftblitzsalve(.+) widerstanden",
	pbvimmune_trigger = "Giftblitzsalve(.+) immun",
	you = "Euch",
	drainlife = "Blutsauger",
	spiders_message = "Spinnen erscheinen!",
	drainlife_message = "Blutsauger! Unterbreche sie/entferne magie!",
	trollphase = "Troll-Phase",
	trollphase_trigger = "The brood shall not fall",
	spiderphase = "Spinnen-Phase",
	spiderphase_trigger1 = "Draw me to your web mistress Shadra",
	spiderphase_trigger2 = "Shadra, make of me your avatar",

	--spider_cmd = "spider",
	spider_name = "Alarm f\195\188r Spinnen",
	spider_desc = "Warnung wenn Spinnen erscheinen",

	--volley_cmd = "volley",
	volley_name = "Alarm f\195\188r Giftblitzsalve",
	volley_desc = "Warnen vor Giftblitzsalve\n\n(Dementi: Dieser Balken hat eine \194\1772 Sekunden Fehler)",

	--drain_cmd = "drain",
	drain_name = "Alarm f\195\188r Blutsauger",
	drain_desc = "Warnen vor Blutsauger",

	--phase_cmd = "phase",
	phase_name = "Phasen-Benachrichtigung",
	phase_desc = "Verk\195\188ndet den Phasenwechsel des Bosses",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20005 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.wipemobs = { L["spawn_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"phase", "spider", "drain", "volley", "charge", -1, "bosskill"}


-- locals
local timer = {
	chargeInterval = 15,
 	nextTrollPhase = 45,
 	nextSpiderPhase = 40,
}
local icon = {
	trollPhase = "Spell_Nature_Web",
 	spiderPhase = "Inv_misc_head_troll_02",
 	charge = "Ability_Warrior_Charge",
}
local syncName = {
	drain = "MarliDrainStart"..module.revision,
	drainOver = "MarliDrainEnd"..module.revision,
	trollPhase = "MarliTrollPhase"..module.revision,
	spiderPhase = "MarliSpiderPhase"..module.revision,
	spiders = "MarliSpiders"..module.revision,
	volley = "MarliVolley"..module.revision,
	charge = "MarliCharge"..module.revision,
}

local chargecount = 0


------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")

	self:ThrottleSync(5, syncName.drain)
	self:ThrottleSync(5, syncName.drainOver)
	self:ThrottleSync(5, syncName.trollPhase)
	self:ThrottleSync(5, syncName.spiderPhase)
	self:ThrottleSync(5, syncName.spiders)
	self:ThrottleSync(11, syncName.volley)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	chargecount = 0
end

-- called after boss is engaged
function module:OnEngage()
	self:Sync(syncName.trollPhase)
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["spiders_trigger"]) then
		self:Sync(syncName.spiders)
	elseif string.find(msg, L["trollphase_trigger"]) then
		self:Sync(syncName.trollPhase)
	elseif string.find(msg, L["spiderphase_trigger1"]) or string.find(msg, L["spiderphase_trigger2"]) then
		self:Sync(syncName.spiderPhase)
	end
end

function module:Event(msg)
	local _,_,drainlifeotherstart,_ = string.find(msg, L["drainlifeotherstart_trigger"])
	local _,_,drainlifeotherend,_ = string.find(msg, L["drainlifeotherend_trigger"])
	if string.find(msg, L["pbvafflicts_trigger"]) or string.find(msg, L["pbvhits_trigger"]) or msg == L["pbvresist_trigger"] or msg == L["pbvimmune_trigger"] then
		self:Sync(syncName.volley)
	elseif string.find(msg, L["drainlife"]) then
		if msg == L["drainlifeyoustart_trigger"] then
			self:Sync(syncName.drain)
		elseif msg == L["drainlifeyouend_trigger"] then
			self:Sync(syncName.drainOver)
		elseif drainlifeotherstart and (UnitIsInRaidByName(drainlifeotherstart) or UnitIsPetByName(drainlifeotherstart)) then
			self:Sync(syncName.drain)
		elseif drainlifeotherend and drainlifeotherend ~= L["you"] and (UnitIsInRaidByName(drainlifeotherstart) or UnitIsPetByName(drainlifeotherstart)) then
			self:Sync(syncName.drainOver)
		end
	elseif string.find(msg, L["charge_trigger"]) then
 		self:Sync(syncName.charge)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.spiders and self.db.profile.spider then
		self:Message(L["spiders_message"], "Attention")
	elseif sync == syncName.trollPhase and self.db.profile.phase then
		self:Bar(L["spiderphase_bar"], timer.nextSpiderPhase, icon.spiderPhase)
		self:Message(L["trollphase"], "Attention")
		chargecount = 0
	elseif sync == syncName.spiderPhase then
		if self.db.profile.phase then
			self:Bar(L["trollphase_bar"], timer.nextTrollPhase, icon.trollPhase)
			self:Message(L["spiderphase"], "Attention")
		end
		if self.db.profile.drain then
			self:RemoveBar(L["drainlife"])
		end
		if self.db.profile.volley then
			self:RemoveBar(L["pbv"])
		end
	elseif sync == syncName.volley and self.db.profile.volley then
		self:IntervalBar(L["pbv"], 13, 19, "Spell_Nature_CorrosiveBreath")
	elseif sync == syncName.drain and self.db.profile.drain then
		self:Bar(L["drainlife"], 7, "Spell_Shadow_LifeDrain02")
		self:Message(L["drainlife_message"], "Attention")
	elseif sync == syncName.drainOver and self.db.profile.drain then
		self:RemoveBar(L["drainlife"])
	elseif sync == syncName.charge and self.db.profile.charge then
 		chargecount = chargecount + 1
 		if chargecount < 3 then
 			self:Bar(L["charge_bar"], timer.chargeInterval, icon.charge)
 		end
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

