
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Baron Geddon", "Molten Core")

module.revision = 20007 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.wipemobs = nil
module.toggleoptions = {"inferno", "service", "bomb", "mana", "announce", "icon", "bosskill"}


---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	bomb = 8,
	inferno = 8,
	firstBomb = 15,
 	nextBomb = 15,
 	firstInferno = 18,
 	nextInferno = 24,
 	firstIgnite = 30,
 	nextIgnite = 30,
	service = 8,
}
local icon = {
	bomb = "Inv_Enchant_EssenceAstralSmall",
	inferno = "Spell_Fire_Incinerate",
	ignite = "Spell_Fire_Incinerate",
	service = "Spell_Fire_SelfDestruct",
}
local syncName = {
	bomb = "GeddonBomb"..module.revision,
	bombStop = "GeddonBombStop"..module.revision,
	inferno = "GeddonInferno"..module.revision,
	ignite = "GeddonManaIgnite"..module.revision,
	service = "GeddonService"..module.revision,
}

local firstinferno = true
local firstignite = true
local firstbomb = true

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	inferno_trigger = "迦顿男爵受到了地狱火效果的影响。",
	service_trigger = "performs one last service for Ragnaros",
	ignitemana_trigger = "受到了点燃法力效果的影响。",
	bombyou_trigger = "你受到了活化炸弹效果的影响。",
	bombother_trigger = "(.*)受到了活化炸弹效果的影响。",
	bombyouend_trigger = "活化炸弹效果从你身上消失了。",
	bombotherend_trigger = "活化炸弹效果从(.*)身上消失。",
	ignitemana_trigger1 = "受到了点燃法力效果的影响。",
	ignitemana_trigger2 = "点燃法力被抵抗了。",
	deathyou_trigger = "你死了。",
	deathother_trigger = "(.*)死亡了。",

	bomb_message_you = "你是炸弹人!",
	bomb_message_youscreen = "你是炸弹人!",
	bomb_message_other = "%s 是炸弹人!",
	bomb_onme = "对+.施放了活化炸弹",

	bomb_bar = "活化炸弹: %s",
	bomb_bar1 = "活化炸弹: %s",
	bombnext_bar = "下一个活化炸弹",
	inferno_bar = "下次地狱火",
	inferno_channel = "地狱火",
	nextinferno_message = "3 秒后地狱火!",
	service_bar = "最后服务",
	nextbomb_bar = "下次活化炸弹",
	ignite_bar = "可能点燃法力",

	service_message = "最后服务! 男爵在8秒后爆炸!",
	inferno_message = "地狱火8秒!",
	ignite_message = "现在驱散!",

	cmd = "Baron",

	service_cmd = "service",
	service_name = "最后服务计时条",
	service_desc = "迦顿的最后服务计时器.",

	inferno_cmd = "inferno",
	inferno_name = "地狱火警报",
	inferno_desc = "迦顿男爵的地狱火计时器.",

	bombtimer_cmd = "bombtimer",
	bombtimer_name = "活化炸弹时间",
	bombtimer_desc = "显示一个8秒的条，炸弹的目标.",

	bomb_cmd = "bomb",
	bomb_name = "活化炸弹警报",
	bomb_desc = "当玩家是炸弹时警告",
	
	mana_cmd = "manaignite",
	mana_name = "法力引燃警报",
	mana_desc = "显示点燃法力计时器并宣布驱散它",

	icon_cmd = "icon",
	icon_name = "团队炸弹图标",
	icon_desc = "把骷髅图标放在炸弹的人身上. (需要L或A)",

	announce_cmd = "whispers",
	announce_name = "密语炸弹人玩家",
	announce_desc = "发送一个密语的玩家被活体炸弹. (需要L或A)",
} end)

L:RegisterTranslations("deDE", function() return {
	inferno_trigger = "Baron Geddon bekommt \'Inferno",
	service_trigger = "performs one last service for Ragnaros",
	ignitemana_trigger = "von Mana entz\195\188nden betroffen",
	bombyou_trigger = "Ihr seid von Lebende Bombe betroffen.",
	bombother_trigger = "(.*) ist von Lebende Bombe betroffen.",
	bombyouend_trigger = "'Lebende Bombe\' schwindet von Euch.",
	bombotherend_trigger = "Lebende Bombe schwindet von (.*).",
	ignitemana_trigger1 = "von Mana entz\195\188nden betroffen",
	ignitemana_trigger2 = "Mana entz\195\188nden(.+)widerstanden",
	deathyou_trigger = "Ihr sterbt.",
	deathother_trigger = "(.*) stirbt",

	bomb_message_you = "Du bist die Bombe!",
	bomb_message_youscreen = "Du bist die Bombe!",
	bomb_message_other = "%s ist die Bombe!",

	bomb_bar = "Lebende Bombe: %s",
	bomb_bar1 = "Lebende Bombe: %s",
	inferno_bar = "N\195\164chstes Inferno",
	inferno_channel = "Inferno",
	nextinferno_message = "3 Sekunden bis Inferno!",
	service_bar = "Letzter Dienst.",
	nextbomb_bar = "N\195\164chste Lebende Bombe",
	ignite_bar = "Mögliches Mana entz\195\188nden",

	service_message = "Letzter Dienst! Baron Geddon explodiert in 8 Sekunden!",
	inferno_message = "Inferno 8 Sekunden lang!",
	ignite_message = "Entferne Magie JETZT!",

	cmd = "Baron",

	service_cmd = "service",
	service_name = "Alarm f\195\188r Letzten Dienst",
	service_desc = "Timer Balken f\195\188r Baron Geddons Letzten Dienst.",

	inferno_cmd = "inferno",
	inferno_name = "Alarm f\195\188r Inferno",
	inferno_desc = "Timer Balken f\195\188r Baron Geddons Inferno.",

	bombtimer_cmd = "bombtimer",
	bombtimer_name = "Timer f\195\188r Lebende Bombe",
	bombtimer_desc = "Zeigt einen 8 Sekunden Timer f\195\188r die Explosion der Lebenden Bombe an.",

	bomb_cmd = "bomb",
	bomb_name = "Alarm f\195\188r Lebende Bombe",
	bomb_desc = "Warnen, wenn andere Spieler die Bombe sind.",

	mana_cmd = "mana",
	mana_name = "Alarm f\195\188r Mana entz\195\188nden",
	mana_desc = "Zeige Timer f\195\188r Mana entz\195\188nden und verk\195\188nde Magie entfernen",

	icon_cmd = "icon",
	icon_name = "Schlachtzugssymbole auf die Bombe",
	icon_desc = "Markiert den Spieler, der die Bombe ist.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent).",

	announce_cmd = "whispers",
	announce_name = "Der Bombe fl\195\188stern",
	announce_desc = "Dem Spieler fl\195\188stern, wenn er die Bombe ist.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent).",
} end)


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	--self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH", "Event")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:ThrottleSync(5, syncName.bomb)
	self:ThrottleSync(3, syncName.bombStop)
	self:ThrottleSync(4, syncName.service)
	self:ThrottleSync(4, syncName.ignite)
	self:ThrottleSync(29, syncName.inferno)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	firstinferno = true
	firstignite = true
	firstbomb = true

	bombt = 0
end

-- called after boss is engaged
function module:OnEngage()
	self:Inferno()
	self:ManaIgnite()
	self:NextBomb()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end

------------------------------
--      Event Handlers      --
------------------------------

function module:Event(msg)
	local _,_, bombother, mcverb = string.find(msg, L["bombother_trigger"])
	local _,_, bombotherend, mcverb = string.find(msg, L["bombotherend_trigger"])
	--local _,_, bombotherdeath,mctype = string.find(msg, L["deathother_trigger"])
	if string.find(msg, L["bombyou_trigger"]) then
		self:Sync(syncName.bomb)
		if self.db.profile.bomb then
			self:Bar(string.format(L["bomb_bar1"], UnitName("player")), timer.bomb, icon.bomb)
			self:Message(L["bomb_message_youscreen"], "Attention", "RunAway")
			self:WarningSign("Spell_Shadow_MindBomb", timer.bomb)
			self:SendSay(L["bomb_onme"] .. UnitName("player") .. "!")
		end
		if self.db.profile.icon then
			self:Icon(UnitName("player"))
		end
	elseif string.find(msg, L["bombyouend_trigger"]) then
		self:RemoveBar(string.format(L["bomb_bar1"], UnitName("player")))
		self:Sync(syncName.bombStop)
	elseif string.find(msg, L["deathyou_trigger"]) then
		self:RemoveBar(string.format(L["bomb_bar1"], UnitName("player")))
	elseif bombother then
		bombt = bombother
		self:Sync(syncName.bomb)
		if self.db.profile.bomb then
			self:Bar(string.format(L["bomb_bar"], bombother), timer.bomb, icon.bomb)
			self:Message(string.format(L["bomb_message_other"], bombother), "Attention")
		end
		if self.db.profile.icon then
			self:Icon(bombother)
		end
		if self.db.profile.announce then
			self:TriggerEvent("BigWigs_SendTell", bombother, L["bomb_message_you"])
		end
	elseif bombotherend then
		self:RemoveBar(string.format(L["bomb_bar"], bombotherend))
		--elseif string.find(msg, L["deathother_trigger"]) then
		--	self:RemoveBar(string.format(L["bomb_bar"], bombotherdeath))
	elseif (string.find(msg, L["ignitemana_trigger1"]) or string.find(msg, L["ignitemana_trigger2"])) then
		self:Sync(syncName.ignite)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE(msg)
	if string.find(msg, L["inferno_trigger"]) then
		BigWigs:DebugMessage("inferno trigger")
		self:Sync(syncName.inferno)
	end
end

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(msg, L["service_trigger"]) and self.db.profile.service then
		self:Sync(syncName.service)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.bomb then
		self:NextBomb()
	elseif sync == syncName.inferno then
		self:Inferno()
	elseif sync == syncName.ignite then
		self:ManaIgnite()
	elseif sync == syncName.bombStop and self.db.profile.bomb then
		self:RemoveBar(string.format(L["bomb_bar"], bombt))
	elseif sync == syncName.service and self.db.profile.service then
		self:Bar(L["service_bar"], timer.service, icon.service)
		self:Message(L["service_message"], "Important")
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Inferno()
	--self:DelayedSync(timer.nextInferno, syncName.inferno)

	if self.db.profile.inferno then
		self:RemoveBar(L["inferno_bar"])
		if firstinferno then
			self:Bar(L["inferno_bar"], timer.firstInferno, icon.inferno)
			firstinferno = false
		else
			self:Message(L["inferno_message"], "Important")
			self:Bar(L["inferno_channel"], timer.inferno, icon.inferno)
			self:Bar(L["inferno_bar"], timer.nextInferno, icon.inferno)
		end

		self:DelayedMessage(timer.nextInferno - 5, L["nextinferno_message"], "Urgent", nil, nil, true)
	end

	firstinferno = false
end

function module:ManaIgnite()
	if self.db.profile.mana then
		if not firstignite then
			self:Message(L["ignite_message"], "Important")
			self:Bar(L["ignite_bar"], timer.firstIgnite, icon.ignite)
		else
			self:Bar(L["ignite_bar"], timer.nextIgnite, icon.ignite)
		end
		firstignite = false
	end
end

function module:NextBomb()
 	if self.db.profile.bomb then
 		if firtbomb then
 			self:Bar(L["nextbomb_bar"], timer.firstBomb, icon.bomb)
 			firstbomb = false
 		else
 			self:Bar(L["nextbomb_bar"], timer.nextBomb, icon.bomb)
 		end
 	end
end 
