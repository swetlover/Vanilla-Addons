
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Anubisath Guardian", "Ruins of Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Guardian",

	summon_cmd = "summon",
	summon_name = "召唤警报",
	summon_desc = "召唤警报",

	plagueyou_cmd = "plagueyou",
	plagueyou_name = "你被瘟疫警报",
	plagueyou_desc = "瘟疫警报",

	plagueother_cmd = "plagueother",
	plagueother_name = "其他人被瘟疫警报",
	plagueother_desc = "其他人被瘟疫警报",

	icon_cmd = "icon",
	icon_name = "头像图标",
	icon_desc = "头像图标放在瘟疫的人头上 (需要L或者A)",

	explode_cmd = "explode",
	explode_name = "爆炸警报",
	explode_desc = "爆炸警报",

	enrage_cmd = "enrage",
	enrage_name = "狂怒警报",
	enrage_desc = "狂怒警报",

	explodetrigger = "阿努比萨斯守卫者获得了爆炸的效果。",
	explodewarn = "即将爆炸！近战躲开！",
	enragetrigger = "阿努比萨斯守卫者获得了狂怒的效果。",
	enragewarn = "进入狂怒状态！",
	summonguardtrigger = "阿努比萨斯守卫者施放了召唤阿努比萨斯虫群卫士。",
	summonguardwarn = "虫群卫士已被召唤出来",
	summonwarriortrigger = "阿努比萨斯守卫者施放了召唤阿努比萨斯战士。",
	summonwarriorwarn = "阿努比萨斯战士已被召唤出来",
	plaguetrigger = "^([^%s]+)([^%s]+)瘟疫效果的影响。",
	plaguewarn = " 受到瘟疫的影响！快躲开！",
	plaguewarnyou = "你受到瘟疫的影响！快跑开!",
	plagueyou = "你",
	plagueare = "受到了",	
} end )

L:RegisterTranslations("deDE", function() return {
	summon_name = "Beschw\195\182rung",
	summon_desc = "Warnung, wenn Besch\195\188tzer des Anubisath Schwarmwachen oder Krieger beschw\195\182rt.",

	plagueyou_name = "Du hast die Seuche",
	plagueyou_desc = "Warnung, wenn Du die Seuche hast.",

	plagueother_name = "X hat die Seuche",
	plagueother_desc = "Warnung, wenn andere Spieler die Seuche haben.",

	icon_name = "Symbol",
	icon_desc = "Platziert ein Symbol \195\188ber dem Spieler, der die Seuche hat. (Ben\195\182tigt Anf\195\188hrer oder Bef\195\182rdert Status.)",

	explode_name = "Explosion",
	explode_desc = "Warnung vor Explosion.",

	enrage_name = "Wutanfall",
	enrage_desc = "Warnung vor Wutanfall.",

	explodetrigger = "Besch\195\188tzer des Anubisath bekommt 'Explodieren'.",
	explodewarn = "Explosion!",
	enragetrigger = "Besch\195\188tzer des Anubisath bekommt 'Wutanfall'.",
	enragewarn = "Wutanfall!",
	summonguardtrigger = "Besch\195\188tzer des Anubisath wirkt Schwarmwache des Anubisath beschw\195\182ren.",
	summonguardwarn = "Schwarmwache beschworen!",
	summonwarriortrigger = "Besch\195\188tzer des Anubisath wirkt Krieger des Anubisath beschw\195\182ren.",
	summonwarriorwarn = "Krieger beschworen!",
	plaguetrigger = "^([^%s]+) ([^%s]+) von Seuche betroffen%.$",
	plaguewarn = " hat die Seuche!",
	plaguewarnyou = "Du hast die Seuche!",
	plagueyou = "Ihr",
	plagueare = "seid",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20006 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"summon", "explode", "enrage", -1, "plagueyou", "plagueother", "icon"--[[, "bosskill"]]}

module.defaultDB = {
	bosskill = false,
}

-- locals
local timer = {}
local icon = {}
local syncName = {}


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckPlague")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = false
	berserkannounced = false
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

-- override to suppress victory message and sound
function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, boss) then
		self.core:ToggleModuleActive(self, false)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS( msg )
	if self.db.profile.explode and msg == L["explodetrigger"] then
		self:Message(L["explodewarn"], "Important")
	elseif self.db.profile.enrage and msg == L["enragetrigger"] then
		self:Message(L["enragewarn"], "Important")
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF( msg )
	if self.db.profile.summon and msg == L["summonguardtrigger"] then
		self:Message(L["summonguardwarn"], "Attention")
	elseif self.db.profile.summon and msg == L["summonwarriortrigger"] then
		self:Message(L["summonwarriorwarn"], "Attention")
	end
end

function module:CheckPlague( msg )
	local _,_, player, type = string.find(msg, L["plaguetrigger"])
	if player and type then
		if self.db.profile.plagueyou and player == L["plagueyou"] and type == L["plagueare"] then
			self:Message(L["plaguewarnyou"], "Personal", true)
			self:Message(UnitName("player") .. L["plaguewarn"], "Attention", nil, nil, true )
		elseif self.db.profile.plagueother then
			self:Message(player .. L["plaguewarn"], "Attention")
			self:TriggerEvent("BigWigs_SendTell", player, L["plaguewarnyou"])
		end

		if self.db.profile.icon then
			self:Icon(player)
		end
	end
end
