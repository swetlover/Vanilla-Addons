
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Viscidus", "Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Viscidus",
	volley_cmd = "volley",
	volley_name = "毒性之箭警报",
	volley_desc = "毒性之箭警报",

	toxinyou_cmd = "toxinyou",
	toxinyou_name = "玩家毒云警报",
	toxinyou_desc = "你站在毒云中时发出警报",

	toxinother_cmd = "toxinother",
	toxinother_name = "队友毒云警报",
	toxinother_desc = "队友站在毒云中时发出警报",

	freeze_cmd = "freeze",
	freeze_name = "冻结状态警报",
	freeze_desc = "警告不同的冻结状态",

	slow_trigger 	= "begins to slow",
	freeze_trigger 	= "is freezing up",
	frozen_trigger 	= "is frozen solid",
	crack_trigger 	= "begins to crack",
	shatter_trigger 	= "looks ready to shatter",
	volley_trigger	= "受到了毒箭之雨效果",
	toxin_trigger 	= "^([^%s]+)([^%s]+)剧毒效果的影响。",

	you 		= "你",
	are 		= "受到了",

	freeze1_warn 		= "冻结第一阶段！",
	freeze2_warn 		= "冻结第二阶段 - 做好准备",
	frozen_warn 		= "冻结第三阶段 - DPS全开！",
	crack1_warn 		= "即将碎裂 - 加大火力！",
	crack2_warn 		= "即将碎裂 - 几近成功！",
	volley_warn		= "可能毒性之箭!",
	volley_soon_warn		= "可能毒性之箭 ~3 秒!",
	toxin_warn		= " 在毒云里!快跑出毒云!",
	toxin_self_warn		= "你在毒云里!",

	volley_bar	= "可能毒箭之雨(群体自然AOE)",
} end )

L:RegisterTranslations("deDE", function() return {
	volley_name = "Giftblitzsalve Alarm", -- ?
	volley_desc = "Warnt vor Giftblitzsalve", -- ?

	toxinyou_name = "Toxin Wolke",
	toxinyou_desc = "Warnung, wenn Du in einer Toxin Wolke stehst.",

	toxinother_name = "Toxin Wolke auf Anderen",
	toxinother_desc = "Warnung, wenn andere Spieler in einer Toxin Wolke stehen.",

	freeze_name = "Freeze Phasen",
	freeze_desc = "Zeigt die verschiedenen Freeze Phasen an.",

	slow_trigger 	= "wird langsamer!",
	freeze_trigger 	= "friert ein!",
	frozen_trigger 	= "ist tiefgefroren!",
	crack_trigger 	= "geht die Puste aus!", --CHECK
	shatter_trigger 	= "ist kurz davor, zu zerspringen!",
	volley_trigger	= "ist von Giftblitzsalve betroffen.",
	toxin_trigger 	= "^([^%s]+) ([^%s]+) von Toxin betroffen.$",

	you 		= "Ihr",
	are 		= "seid",

	freeze1_warn 		= "Erste Freeze Phase!",
	freeze2_warn 		= "Zweite Freeze Phase!",
	frozen_warn 		= "Dritte Freeze Phase!",
	crack1_warn 		= "Zerspringen - etwas noch!",
	crack2_warn 		= "Zerspringen - fast da!",
	volley_warn		= "Giftblitzsalve!", -- ?
	volley_soon_warn		= "Giftblitzsalve in ~3 Sekunden!", -- ?
	toxin_warn		= " ist in einer Toxin Wolke!",
	toxin_self_warn		= "Du bist in einer Toxin Wolke!",

	volley_bar        = "Giftblitzsalve",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"freeze", "volley", "toxinyou", "toxinother", "bosskill"}


-- locals
local timer = {
	earliestVolley = 12,
	latestVolley = 15,
}
local icon = {
	volley = "Spell_Nature_CorrosiveBreath",
	toxin = "Spell_Nature_AbolishMagic",
}
local syncName = {}

local prior

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("BigWigs_Message")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Emote")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Emote")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckVis")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckVis")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckVis")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	prior = nil
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.volley then
		self:IntervalBar(L["volley_bar"], timer.earliestVolley, timer.latestVolley, icon.volley)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CheckVis(arg1)
	if not prior and self.db.profile.volley and string.find(arg1, L["volley_trigger"]) then
		self:Message(L["volley_warn"], "Urgent")
		self:DelayedMessage(timer.earliestVolley - 3, L["volley_soon_warn"], "Urgent", nil, nil, true)
		self:IntervalBar(L["volley_bar"], timer.earliestVolley, timer.latestVolley, icon.volley)
		prior = true
	elseif string.find(arg1, L["toxin_trigger"]) then
		local _,_, pl, ty = string.find(arg1, L["toxin_trigger"])
		if (pl and ty) then
			if self.db.profile.toxinyou and pl == L["you"] and ty == L["are"] then
				self:Message(L["toxin_self_warn"], "Personal", true, "RunAway")
				self:Message(UnitName("player") .. L["toxin_warn"], "Important", nil, nil, true)
				self:WarningSign("Spell_Nature_AbolishMagic", 5)
			elseif self.db.profile.toxinother then
				self:Message(pl .. L["toxin_warn"], "Important")
				--self:TriggerEvent("BigWigs_SendTell", pl, L["toxin_self_warn"]) -- can cause whisper bug on nefarian
			end
		end
	end
end

function module:Emote(arg1)
	BigWigs:Debug("Emote: "..arg1)
	if not self.db.profile.freeze then return end
	if string.find(arg1, L["slow_trigger"]) then
		self:Message(L["freeze1_warn"], "Atention")
	elseif string.find(arg1, L["freeze_trigger"]) then
		self:Message(L["freeze2_warn"], "Urgent")
	elseif string.find(arg1, L["frozen_trigger"]) then
		self:Message(L["frozen_warn"], "Important")
	elseif string.find(arg1, L["crack_trigger"]) then
		self:Message(L["crack1_warn"], "Urgent")
	elseif string.find(arg1, L["shatter_trigger"]) then
		self:Message(L["crack2_warn"], "Important")
	end
end

function module:BigWigs_Message(text)
	if text == L["volley_soon_warn"] then prior = nil end
end
