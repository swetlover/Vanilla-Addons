----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Lord Kazzak", "Blasted Lands")

module.revision = 20008 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"markofkazzak", "puticon", "twistedreflection", "voidbolt", "corruptsoul", "supreme", "bosskill"}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	supreme = 180,
	mark = 10,
	twisted = 45,
	voidbolt = 1.5,
}
local icon = {
	mark = "Interface\\Icons\\Spell_Shadow_Antishadow",
	twisted = "Interface\\Icons\\Spell_Arcane_PortalDarnassus",
	voidbolt = "Interface\\Icons\\Spell_Shadow_Haunting",
}
local syncName = {
	markStart = "LordKazzakMarkStart"..module.revision,
	markStop = "LordKazzakMarkStop"..module.revision,
	reflectionStart = "LordKazzakReflectionStart"..module.revision,
	reflectionStop = "LordKazzakReflectionStop"..module.revision,
	voidboltStart = "LordKazzakVoidBoltStart"..module.revision,
	voidboltStop = "LordKazzakVoidBoltStop"..module.revision,
	supreme = "LordKazzakSupreme"..module.revision,
	dead = "LordKazzakDead"..module.revision,
	randomDeath = "LordKazzakRandomDeath"..module.revision,

}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Kazzak",

	starttrigger1 = "All mortals will perish!",
	starttrigger2 = "The Legion will conquer all!",
	markofkazzakyou_trigger = "你受到了卡扎克的印记效果的影响。",
	markofkazzakother_trigger = "(.*)受到了卡扎克的印记效果的影响。",
	markofkazzakyouend_trigger = "卡扎克的印记效果从你身上消失了。",
	markofkazzakotherend_trigger = "卡扎克的印记效果从(.*)身上消失。",
	twistedreflectionyou_trigger = "你受到了扭曲反射效果的影响。",
	twistedreflectionother_trigger = "(.*)受到了扭曲反射效果的影响。",
	twistedreflectionyouend_trigger = "扭曲反射效果从你身上消失了。",
	twistedreflectionotherend_trigger = "扭曲反射效果从(.*)身上消失。",
	deathyou_trigger = "你死了。",
	deathother_trigger = "(.*)死亡了。",
	voidbolt_trigger = "卡扎克开始施放虚空箭。",
	attack_trigger1 = "卡扎克发起攻击",
	attack_trigger2 = "卡扎克没有击中",
	attack_trigger3 = "卡扎克击中",
	attack_trigger4 = "卡扎克的致命一击",
	enrage_trigger = "卡扎克获得了狂暴的效果。",
	enrageyell_trigger = "Kazzak is supreme!",
	bosskill_trigger = "The Legion... will never... fall.",

	engagewarn = "卡扎克激怒! 3分钟后无敌!",
	enrage_warm = "卡扎克无敌!",
	makrofkazzak_warn = "%s 中了印记! 驱散!",
	twistedreflection_warn = "%s 是扭曲反射! 驱散!",
	mark_message_you = "你有印记! 不要浪费法力值!",
	reflection_message_you = "你有扭曲反射!",
	corruptsoul_warn = "%s 治疗了卡扎克!",
	corruptsoul_warn_you = "你治疗了卡扎克!",

	supreme1min = "无敌模式 1 分钟!",
	supreme30sec = "无敌模式 30 秒!",
	supreme10sec = "无敌模式 10 秒!",

	enrage_bar = "无敌模式",
	voidbolt_bar = "虚空箭",
	mark_bar = "%s: 卡扎克印记(吸蓝,爆炸)",
	twisted_bar = "%s: 扭曲反射(Boss回血技)",

	supreme_cmd = "supreme",
	supreme_name = "无敌警报",
	supreme_desc = "无敌模式警报.",

	voidbolt_cmd = "voidbolt",
	voidbolt_name = "虚空箭",
	voidbolt_desc = "显示虚空箭的施法.",

	corruptsoul_cmd = "corruptsoul",
	corruptsoul_name = "灵魂腐蚀",
	corruptsoul_desc = "当boss从随机死亡中恢复时警告.",

	markofkazzak_cmd = "markofkazzak",
	markofkazzak_name = "卡扎克印记",
	markofkazzak_desc = "警报中了印记的人.",

	twistedreflection_cmd = "twistedreflection",
	twistedreflection_name = "扭曲反射",
	twistedreflection_desc = "当boss从随机死亡中恢复时警告.恢复25000血量",

	puticon_cmd = "puticon",
	puticon_name = "团队图标印记玩家",
	puticon_desc = "给中了印记的玩家团队图标.\n\n(Requires assistant or higher)",
} end )
------------------------------
--      Initialization      --
------------------------------

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "EventSelf")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "EventSelf")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")

	self:ThrottleSync(2, syncName.markStart)
	self:ThrottleSync(2, syncName.markStop)
	self:ThrottleSync(2, syncName.reflectionStart)
	self:ThrottleSync(2, syncName.reflectionStop)
	self:ThrottleSync(5, syncName.voidboltStart)
	self:ThrottleSync(5, syncName.voidboltStop)
	self:ThrottleSync(5, syncName.supreme)
	self:ThrottleSync(5, syncName.dead)

end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH")
	voidbolttime = 0
	castingvoidbolt = false
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

function module:CHAT_MSG_COMBAT_FRIENDLY_DEATH(msg)
	BigWigs:CheckForWipe(self)
	local _,_,otherdeath,_ = string.find(msg, L["deathother_trigger"])
	if string.find(msg, L["deathyou_trigger"]) then
		if self.db.profile.markofkazzak then
			self:RemoveBar(string.format(L["mark_bar"], UnitName("player")))
		end
		if self.db.profile.puticon then
			self:RemoveIcon()
		end
		if self.db.profile.twistedreflection then
			self:RemoveBar(string.format(L["twisted_bar"], UnitName("player")))
		end
		if self.db.profile.corruptsoul then
			self:Message(L["corruptsoul_warn_you"], "Attention")
		end
		self:Sync(syncName.randomDeath.." "..UnitName("player"))
	elseif otherdeath then
		self:Sync(syncName.randomDeath.." "..otherdeath)
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if self.db.profile.supreme and string.find(msg, L["starttrigger1"]) or  string.find(msg, L["starttrigger2"]) then
		self:Message(L["engagewarn"], "Important")
		self:DelayedMessage(timer.supreme - 60, L["supreme1min"], "Attention")
		self:DelayedMessage(timer.supreme - 30, L["supreme30sec"], "Urgent")
		self:DelayedMessage(timer.supreme - 10, L["supreme10sec"], "Important")
		self:Bar(L["enrage_bar"], timer.supreme, "Interface\\Icons\\Spell_Shadow_ShadowWordPain", "Green", "Yellow", "Orange", "Red")
	elseif self.db.profile.supreme and string.find(msg, L["enrageyell_trigger"]) then
		self:Message(L["enrage_warm"], "Important")
	elseif string.find(msg, L["bosskill_trigger"]) then
		self:Sync(syncName.dead)
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if string.find(msg, L["voidbolt_trigger"]) then
		self:Sync(syncName.voidboltStart)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["enrage_trigger"]) then
		self:Sync(syncName.supreme)
	end
end

function module:EventSelf(msg)
	if string.find(msg, L["markofkazzakyou_trigger"]) then
		if self.db.profile.markofkazzak then
			self:Message(L["mark_message_you"], "Attention", true, "Alert")
			self:Bar(string.format(L["mark_bar"], UnitName("player")), timer.mark, icon.mark, true, "white")
		end
		if self.db.profile.puticon then
			self:Icon(UnitName("player"))
		end
		self:Sync(syncName.markStart.." "..UnitName("player"))
	elseif string.find(msg, L["markofkazzakyouend_trigger"]) then
		if self.db.profile.markofkazzak then
			self:RemoveBar(string.format(L["mark_bar"], UnitName("player")))
		end
		if self.db.profile.puticon then
			self:RemoveIcon()
		end
		self:Sync(syncName.markStop.." "..UnitName("player"))
	elseif string.find(msg, L["twistedreflectionyou_trigger"]) then
		if self.db.profile.twistedreflection then
			self:Message(L["reflection_message_you"], "Attention")
			self:Bar(string.format(L["twisted_bar"], UnitName("player")), timer.twisted, icon.twisted, true, "magenta")
		end
		self:Sync(syncName.reflectionStart.." "..UnitName("player"))
	elseif string.find(msg, L["twistedreflectionyouend_trigger"]) then
		if self.db.profile.twistedreflection then
			self:RemoveBar(string.format(L["twisted_bar"], UnitName("player")))
		end
		self:Sync(syncName.reflectionStop.." "..UnitName("player"))
	end
end

function module:Event(msg)
	local _,_,markofkazzakother,_ = string.find(msg, L["markofkazzakother_trigger"])
	local _,_,markofkazzakotherend,_ = string.find(msg, L["markofkazzakotherend_trigger"])
	local _,_,twistedreflectionother,_ = string.find(msg, L["twistedreflectionother_trigger"])
	local _,_,twistedreflectionotherend,_ = string.find(msg, L["twistedreflectionotherend_trigger"])
	if markofkazzakother then
		self:Sync(syncName.markStart.." "..markofkazzakother)
	elseif markofkazzakotherend then
		self:Sync(syncName.markStop.." "..markofkazzakotherend)
	elseif twistedreflectionother then
		self:Sync(syncName.reflectionStart.." "..twistedreflectionother)
	elseif twistedreflectionotherend then
		self:Sync(syncName.reflectionStop.." "..twistedreflectionotherend)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.markStart and rest ~= UnitName("player") then
		if self.db.profile.markofkazzak then
			self:Message(string.format(L["makrofkazzak_warn"], rest), "Important")
			self:TriggerEvent("BigWigs_SendTell", rest, L["mark_message_you"])
			self:Bar(string.format(L["mark_bar"], rest), timer.mark, icon.mark, true, "white")
		end
		if self.db.profile.puticon then
			self:Icon(rest)
		end
	elseif sync == syncName.markStop and rest ~= UnitName("player") then
		if self.db.profile.markofkazzak then
			self:RemoveBar(string.format(L["mark_bar"], rest))
		end
		if self.db.profile.puticon then
			self:RemoveIcon()
		end
	elseif sync == syncName.reflectionStart and rest ~= UnitName("player") then
		if self.db.profile.twistedreflection then
			self:Message(string.format(L["twistedreflection_warn"], rest), "Important")
			self:Bar(string.format(L["twisted_bar"], rest), timer.twisted, icon.twisted, true, "magenta")
		end
	elseif sync == syncName.reflectionStop and rest ~= UnitName("player") then
		if self.db.profile.twistedreflection then
			self:RemoveBar(string.format(L["twisted_bar"], rest))
		end
	elseif sync == syncName.randomDeath and rest ~= UnitName("player") then
		if self.db.profile.markofkazzak then
			self:RemoveBar(string.format(L["mark_bar"], rest))
		end
		if self.db.profile.puticon then
			self:RemoveIcon()
		end
		if self.db.profile.twistedreflection then
			self:RemoveBar(string.format(L["twisted_bar"], rest))
		end
		if self.db.profile.corruptsoul then
			self:Message(string.format(L["corruptsoul_warn"], rest), "Important")
		end
	elseif sync == syncName.voidboltStart then
		voidbolttime = GetTime()
		castingvoidbolt = true
		if self.db.profile.voidbolt then
			self:Bar(L["voidbolt_bar"], timer.voidbolt, icon.voidbolt, true, "purple")
		end
	elseif sync == syncName.voidboltStop then
		castingvoidbolt = false
		if self.db.profile.voidbolt then
			self:RemoveBar(L["voidbolt_bar"])
		end
	elseif sync == syncName.supreme and self.db.profile.supreme then
		self:Message(L["voidbolt_bar"], "Important")
	elseif sync == syncName.dead then
		if self.db.profile.bosskill then
			self:Message(string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], self.translatedName), "Bosskill", nil, "Victory")
		end
		self:RemoveIcon()
		self.core:ToggleModuleActive(self, false)
	end
end

function module:Melee(msg)
	if string.find(msg, L["attack_trigger1"]) or string.find(msg, L["attack_trigger2"]) or string.find(msg, L["attack_trigger3"]) or string.find(msg, L["attack_trigger4"]) then
		if castingvoidbolt then
			if (GetTime() - voidbolttime) < 1.5 then
				self:Sync(syncName.voidboltStop)
			elseif (GetTime() - voidbolttime) >= 1.5 then
				castingvoidbolt = false
			end
		end
	end
end
