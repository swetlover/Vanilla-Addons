
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Anubisath Defender", "Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Defender",

	plagueyou_cmd = "plagueyou",
	plagueyou_name = "玩家瘟疫警报",
	plagueyou_desc = "你中了瘟疫时发出警报",

	plagueother_cmd = "plagueother",
	plagueother_name = "队友瘟疫警报",
	plagueother_desc = "队友中了瘟疫时发出警报",

	thunderclap_cmd = "thunderclap",
	thunderclap_name = "雷霆一击警报",
	thunderclap_desc = "阿努比萨斯防御者发动雷霆一击时发出警报",

	explode_cmd = "explode",
	explode_name = "爆炸警报",
	explode_desc = "阿努比萨斯防御者即将爆炸时发出警报",

	enrage_cmd = "enrage",
	enrage_name = "狂怒警报",
	enrage_desc = "阿努比萨斯防御者进入狂怒状态时发出警报",

	summon_cmd = "summon",
	summon_name = "召唤警报",
	summon_desc = "阿努比萨斯防御者召唤增援时发出警报",

	icon_cmd = "icon",
	icon_name = "头像图标",
	icon_desc = "设置团队标记，标记中瘟疫的玩家 (需要助理或更高权限)",

	explodetrigger = "阿努比萨斯防御者获得了爆炸的效果。",
	explodewarn = "即将爆炸！近战躲开！",
	enragetrigger = "阿努比萨斯防御者获得了狂怒的效果。",
	enragewarn = "进入狂怒状态！",
	summonguardtrigger = "阿努比萨斯防御者施放了召唤阿努比萨斯虫群卫士。",
	summonguardwarn = "虫群卫士已被召唤出来",
	summonwarriortrigger = "阿努比萨斯防御者施放了召唤阿努比萨斯战士。",
	summonwarriorwarn = "阿努比萨斯战士已被召唤出来",
	plaguetrigger = "^([^%s]+)([^%s]+)瘟疫效果的影响",
	plaguewarn = " 瘟疫的影响！快躲开！",
	plagueyouwarn = "你受到瘟疫的影响！快跑开！",
	plagueyou = "你",
	plagueare = "受到了",
	plague_onme = "对(+.)施放了瘟疫",
	thunderclaptrigger = "^阿努比萨斯防御者的雷霆一击击中([^%s]+)造成",
	thunderclapwarn = "雷霆一击!",
} end )

L:RegisterTranslations("deDE", function() return {
	plagueyou_name = "Du hast die Seuche",
	plagueyou_desc = "Warnung, wenn Du die Seuche hast.",

	plagueother_name = "X hat die Seuche",
	plagueother_desc = "Warnung, wenn andere Spieler die Seuche haben.",

	thunderclap_name = "Donnerknall",
	thunderclap_desc = "Warnung vor Donnerknall.",

	explode_name = "Explosion",
	explode_desc = "Warnung vor Explosion.",

	enrage_name = "Wutanfall",
	enrage_desc = "Warnung vor Wutanfall.",

	summon_name = "Beschw\195\182rung",
	summon_desc = "Warnung, wenn Verteidiger des Anubisath Schwarmwachen oder Krieger beschw\195\182rt.",

	icon_name = "Symbol",
	icon_desc = "Platziert ein Symbol \195\188ber dem Spieler, der die Seuche hat. (Ben\195\182tigt Anf\195\188hrer oder Bef\195\182rdert Status.)",

	explodetrigger = "Verteidiger des Anubisath bekommt 'Explodieren'.",
	explodewarn = "Explosion!",
	enragetrigger = "Verteidiger des Anubisath bekommt 'Wutanfall'.",
	enragewarn = "Wutanfall!",

	summonguardtrigger = "Verteidiger des Anubisath wirkt Schwarmwache des Anubisath beschw\195\182ren.",
	summonguardwarn = "Schwarmwache beschworen!",
	summonwarriortrigger = "Verteidiger des Anubisath wirkt Krieger des Anubisath beschw\195\182ren.",
	summonwarriorwarn = "Krieger beschworen!",

	plaguetrigger = "^([^%s]+) ([^%s]+) von Seuche betroffen%.$",
	plaguewarn = " hat die Seuche!",
	plagueyouwarn = "Du hast die Seuche!",
	plagueyou = "Ihr",
	plagueare = "seid",

	thunderclaptrigger = "^Verteidiger des Anubisath's Donnerknall trifft ([^%s]+) f\195\188r %d+%.",
	thunderclapwarn = "Donnerknall!",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20006 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"plagueyou", "plagueother", "icon", -1, "thunderclap", "explode", "enrage"--[[, "bosskill"]]}
module.trashMod = true

module.defaultDB = {
	enrage = false,
	bosskill = nil,
}

-- locals
local timer = {
	explode = 6,
}
local icon = {
	explode = "",
	plague = "Spell_Shadow_CurseOfTounges",
}
local syncName = {
	enrage = "DefenderEnrage"..module.revision,
	explode = "DefenderExplode"..module.revision,
	thunderclap = "DefenderThunderclap"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Thunderclap")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Thunderclap")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Thunderclap")

	self:ThrottleSync(10, syncName.enrage)
	self:ThrottleSync(10, syncName.explode)
	self:ThrottleSync(6, syncName.thunderclap)
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
--      Event Handlers      --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.explode and self.db.profile.explode then
		self:Message(L["explodewarn"], "Important", nil, "Beware")
		self:Bar(L["explodewarn"], timer.explode, icon.explode)
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Message(L["enragewarn"], "Important")
	elseif sync == syncName.thunderclap and self.db.profile.thunderclap then
		self:Message(L["thunderclapwarn"], "Important")
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["explodetrigger"] then
		self:Sync(syncName.explode)
	elseif msg == L["enragetrigger"] then
		self:Sync(syncName.enrage)
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if not self.db.profile.summon then return end
	if msg == L["summonguardtrigger"] then
		self:Message(L["summonguardwarn"], "Attention")
	elseif msg == L["summonwarriortrigger"] then
		self:Message(L["summonwarriorwarn"], "Attention")
	end
end

function module:CheckPlague(msg)
	local _,_, pplayer, ptype = string.find(msg, L["plaguetrigger"])
	if pplayer then
		if self.db.profile.plagueyou and pplayer == L["plagueyou"] then
			self:SendSay(L["plague_onme"] .. UnitName("player") .. "!")
			self:Message(L["plagueyouwarn"], "Personal", true, "RunAway")
			self:Message(UnitName("player") .. L["plaguewarn"], "Attention", nil, nil, true)
			self:WarningSign(icon.plague, 5)
		elseif self.db.profile.plagueother then
			self:Message(pplayer .. L["plaguewarn"], "Attention")
			self:TriggerEvent("BigWigs_SendTell", pplayer, L["plagueyouwarn"]) -- can cause whisper bug on nefarian
		end

		if self.db.profile.icon then
			self:Icon(pplayer)
		end
	end
end

function module:Thunderclap(msg)
	if string.find(msg, L["thunderclaptrigger"]) then
		self:Sync(syncName.thunderclap)
	end
end
