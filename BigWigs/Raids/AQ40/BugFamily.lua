
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("The Bug Family", "Ahn'Qiraj")

local kri = AceLibrary("Babble-Boss-2.2")["Lord Kri"]
local yauj = AceLibrary("Babble-Boss-2.2")["Princess Yauj"]
local vem = AceLibrary("Babble-Boss-2.2")["Vem"]

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "BugFamily",
	
	healtrigger = "亚尔基公主开始施放强效治疗术。",
	healbar = "强效治疗术!打断它!",
	healwarn = "施放强效治疗术!快打断!",
	attack_trigger1 = "亚尔基公主发起攻击",
	attack_trigger2 = "亚尔基公主没有击中",
	attack_trigger3 = "亚尔基公主击中",
	attack_trigger4 = "亚尔基公主的致命一击",
	panic_bar = "群体恐慌(注意反恐)",
	first_panic_bar = "可能恐慌(注意反恐)",
	panic_message = "恐惧 3 秒!",
	toxicvolleyhit_trigger = "毒性箭雨击中",
	toxicvolleyafflicted_trigger = "受到了毒性箭雨效果的影响。",
	toxicvolleyresist_trigger = "毒性箭雨被抵抗了",
	toxicvolleyimmune_trigger = "毒性箭雨施放失败。(.+)对此免疫。",
	toxicvolley_bar = "毒性箭雨(群体自然伤+DOT)",
	toxicvolley_message = "毒性箭雨 3 秒!",

	panic_trigger = "受到了恐慌效果的影响。",
	panicresist_trigger = "亚尔基公主的恐慌被抵抗了。",
	panicimmune_trigger = "亚尔基公主的恐慌施放失败。(.+)对此免疫。",
	
    toxicvaporsyou_trigger = "你受到了毒性箭雨效果的影响。",
	toxicvaporsother_trigger = "(.+)受到了毒性箭雨效果的影响。",
	
	toxicvaporsyou_trigger2 = "你受到(%d+)点(.+)（毒性云雾的毒性蒸汽）。",
	toxicvaporsother_trigger2 = "毒性云雾的毒性蒸汽使(.+)受到了(%d+)点(.+)。",
	
	toxicvapors_message = "远离毒云!",
	enrage_bar = "狂怒(攻速+攻击增强)",
	warn5minutes = "狂怒 5 分钟!",
	warn3minutes = "狂怒 3 分钟!",
	warn90seconds = "狂怒 90 秒!",
	warn60seconds = "狂怒 60 秒!",
	warn30seconds = "狂怒 30 秒!",
	warn10seconds = "狂怒 10 秒!",
	kridead_message = "克里勋爵死亡! 毒性箭雨刷新!",
	yaujdead_message = "亚尔基公主死亡! 杀死小怪!",
	vemdead_message = "维姆死亡!",
	vemdeadcontkri_message = "维姆死亡! 克里勋爵狂怒!",
	vemdeadcontyauj_message = "维姆死亡! 亚尔基公主狂怒!",
	vemdeadcontboth_message = "维姆死亡! 克里勋爵和亚尔基公主怒昂怒!",
	enrage_trigger = "%s goes into a berserker rage!",
	enrage_warning = "狂怒!",
	
	panic_cmd = "panic",
	panic_name = "恐慌",
	panic_desc = "亚尔基公主的恐慌.",

	toxicvolley_cmd = "toxicvolley",
	toxicvolley_name = "毒性箭雨",
	toxicvolley_desc = "克里勋爵的毒性箭雨.",

	heal_cmd = "heal",
	heal_name = "强效治疗术",
	heal_desc = "亚尔基公主的强效治疗术.",

	announce_cmd = "announce",
	announce_name = "毒云",
	announce_desc = "密语中毒云的玩家.\n\n(需要A或L)",
	
	deathspecials_cmd = "deathspecials",
	deathspecials_name = "boss特技",
	deathspecials_desc = "让人们知道哪个boss被杀了，他们有什么特别的能力.",
	
	enrage_cmd = "enrage",
	enrage_name = "狂怒",
	enrage_desc = "激怒计时.",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "BugFamily",

	healtrigger = "Prinzessin Yauj beginnt Großes Heilen zu wirken.",
	healbar = "Gro\195\159e Heilung",
	healwarn = "Wirkt Heilung!",
	attack_trigger1 = "Prinzessin Yauj greift an",
	attack_trigger2 = "Prinzessin Yauj verfehlt",
	attack_trigger3 = "Prinzessin Yauj trifft",
	attack_trigger4 = "Prinzessin Yauj trifft (.+) kritisch",
	panic_bar = "Furcht",
	first_panic_bar = "Mögliche Furcht (+/- 3s)",
	panic_message = "Furcht in 3 Sekunden!",
	toxicvolleyhit_trigger = "Toxische Salve trifft",
	toxicvolleyafflicted_trigger = "von Toxische Salve betroffen",
	toxicvolleyresist_trigger = "Toxische Salve(.+) widerstanden",
	toxicvolleyimmune_trigger = "Toxische Salve(.+) Ein Fehlschlag(.+) immun",
	toxicvolley_bar = "Toxische Salve",
	toxicvolley_message = "Toxische Salve in 3 Sekunden!",
	panic_trigger = "von Furcht betroffen",
	panicresist_trigger = "Furcht(.+) widerstanden",
	panicimmune_trigger = "Furcht(.+) immun",
	toxicvaporsyou_trigger = "Ihr seid von Toxische Dämpfe betroffen.",
	toxicvaporsother_trigger = "(.+) ist von Toxische Dämpfe betroffen.",
	toxicvapors_message = "Beweg dich aus der Giftwolke raus!",
	enrage_bar = "Raserei",
	warn5minutes = "Raserei in 5 Minuten!",
	warn3minutes = "Raserei in 3 Minuten!",
	warn90seconds = "Raserei in 90 Sekunden!",
	warn60seconds = "Raserei in 60 Sekunden!",
	warn30seconds = "Raserei in 30 Sekunden!",
	warn10seconds = "Raserei in 10 Sekunden!",
	kridead_message = "Lord Kri ist tot! Giftwolke hat sich gebildet!",
	yaujdead_message = "Prinzessin Yauj ist tot! T\195\182te die kleinen K\195\164fer!",
	vemdead_message = "Vem ist tot!",
	vemdeadcontkri_message = "Vem ist tot! Lord Kri verf\195\164llt in Raserei!",
	vemdeadcontyauj_message = "Vem ist tot! Prinzessin Yauj verf\195\164llt in Raserei!",
	vemdeadcontboth_message = "Vem ist tot! Lord Kri & Prinzessin Yauj verfallen in Raserei!",
	enrage_trigger = "%s goes into a berserker rage!",
	enrage_warning = "Raserei!",

	panic_cmd = "panic",
	panic_name = "Furcht",
	panic_desc = "Warnung f\195\188r Prinzessin Yaujs Furcht.",

	toxicvolley_cmd = "toxicvolley",
	toxicvolley_name = "Toxische Salve",
	toxicvolley_desc = "Warnung f\195\188r Lord Kris Toxische Salve.",

	heal_cmd = "heal",
	heal_name = "Gro\195\159e Heilung",
	heal_desc = "Verk\195\188ndet Prinzessin Yaujs Heilungen.",

	announce_cmd = "announce",
	announce_name = "Giftwolke",
	announce_desc = "Fl\195\188stert Spielern, dass sie in der Giftwolke stehen.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",

	deathspecials_cmd = "deathspecials",
	deathspecials_name = "Spezielle Todeseffekte",
	deathspecials_desc = "Informiert Spieler, welcher Boss bereits get\195\182tet wurde und welche Spezialf\195\164higkeiten sie haben.",

	enrage_cmd = "enrage",
	enrage_name = "Raserei",
	enrage_desc = "Zeit, bis der Boss in Raserei verf\195\164llt.",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20009 -- To be overridden by the module!
module.enabletrigger = {kri, yauj, vem} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"panic", "toxicvolley", "heal", "announce", "deathspecials", "enrage", "bosskill"}


-- locals
local timer = {
    firstPanic = 20,
	panic = 20,
	firstVolley = 10,
 	volley = 14,
	enrage = 900,
	heal = 2,
}
-- first panic seems to be random (15-20s)
local icon = {
	panic = "Spell_Shadow_DeathScream",
	volley = "Spell_Nature_Corrosivebreath",
	enrage = "Spell_Shadow_UnholyFrenzy",
	heal = "Spell_Holy_Heal",
}
local syncName = {
	volley = "BugTrioKriVolley"..module.revision,
	heal = "BugTrioYaujHealStart"..module.revision,
	healStop = "BugTrioYaujHealStop"..module.revision,
	panic = "BugTrioYaujPanic"..module.revision,
	enrage = "BugTrioEnraged"..module.revision,
	kriDead = "BugTrioKriDead"..module.revision,
	yaujDead = "BugTrioYaujDead"..module.revision,
	vemDead = "BugTrioVemDead"..module.revision,
	allDead = "BugTrioAllDead"..module.revision,
}

local kridead = nil
local vemdead = nil
local yaujdead = nil
local healtime = 0
local castingheal = false

--[[
16:56 pull
17:11 fear 15
]]

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Melee")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Melee")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Spells")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Spells")

	self:ThrottleSync(5, syncName.volley)
	self:ThrottleSync(5, syncName.heal)
	self:ThrottleSync(5, syncName.healStop)
	self:ThrottleSync(5, syncName.panic)
	self:ThrottleSync(5, syncName.enrage)
	self:ThrottleSync(5, syncName.kriDead)
	self:ThrottleSync(5, syncName.yaujDead)
	self:ThrottleSync(5, syncName.vemDead)
	self:ThrottleSync(5, syncName.allDead)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	kridead = nil
	vemdead = nil
	yaujdead = nil
	healtime = 0
	castingheal = false

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.panic then
		self:Bar(L["first_panic_bar"], timer.firstPanic, icon.panic, true, "white")
		--self:DelayedMessage(timer.firstPanic - 3, L["panic_message"], "Urgent", true, "Alarm")
	end
	if self.db.profile.toxicvolley then
		self:Bar(L["toxicvolley_bar"], timer.volley, icon.volley, true, "green")
		--self:DelayedMessage(timer.earliestFirstVolley - 3, L["toxicvolley_message"], "Urgent")
	end
	if self.db.profile.enrage then
		self:Bar(L["enrage_bar"], timer.enrage, icon.enrage, true, "red")
		self:DelayedMessage(timer.enrage - 5 * 60, L["warn5minutes"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 3 * 60, L["warn3minutes"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 90, L["warn90seconds"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 60, L["warn60seconds"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 30, L["warn30seconds"], "Attention", nil, nil, true)
		self:DelayedMessage(timer.enrage - 10, L["warn10seconds"], "Attention", nil, nil, true)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L["enrage_trigger"] then
		self:Sync(syncName.enrage)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if msg == string.format(UNITDIESOTHER, kri) then
		self:Sync(syncName.kriDead)
	elseif msg == string.format(UNITDIESOTHER, yauj) then
		self:Sync(syncName.yaujDead)
	elseif msg == string.format(UNITDIESOTHER, vem) then
		self:Sync(syncName.vemDead)
	end
end

function module:Melee(msg)
	if string.find(msg, L["attack_trigger1"]) or string.find(msg, L["attack_trigger2"]) or string.find(msg, L["attack_trigger3"]) or string.find(msg, L["attack_trigger4"]) then
		if castingheal then
			if (GetTime() - healtime) < timer.heal then
				self:Sync(syncName.healStop)
			elseif (GetTime() - healtime) >= timer.heal then
				castingheal = false
			end
		end
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if msg == L["healtrigger"] then
		self:Sync(syncName.heal)
	end
end

function module:Spells(msg)
	local _,_,toxicvaporsother,_ = string.find(msg, L["toxicvaporsother_trigger"])
	local _,_,toxicvaporsother2,_ = string.find(msg, L["toxicvaporsother_trigger2"])
	if string.find(msg, L["panic_trigger"]) or string.find(msg, L["panicresist_trigger"]) or string.find(msg, L["panicimmune_trigger"]) then
		self:Sync(syncName.panic)
	elseif string.find(msg, L["toxicvolleyhit_trigger"]) or string.find(msg, L["toxicvolleyafflicted_trigger"]) or string.find(msg, L["toxicvolleyresist_trigger"]) or string.find(msg, L["toxicvolleyimmune_trigger"]) then
		self:Sync(syncName.volley)
	elseif ( msg == L["toxicvaporsyou_trigger"] or string.find(msg, L["toxicvaporsyou_trigger2"]) ) and self.db.profile.announce then
		self:Message(L["toxicvapors_message"], "Attention", "Alarm")
	elseif toxicvaporsother and self.db.profile.announce then
		self:TriggerEvent("BigWigs_SendTell", toxicvaporsother, L["toxicvapors_message"])
	elseif toxicvaporsother2 and self.db.profile.announce then
		self:TriggerEvent("BigWigs_SendTell", toxicvaporsother2, L["toxicvapors_message"])
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.volley then
		self:Volley()
	elseif sync == syncName.heal then
		self:Heal()
	elseif sync == syncName.healStop then
		self:HealStop()
	elseif sync == syncName.panic then
		self:Panic()
	elseif sync == syncName.enrage then
		self:Enrage()
	elseif sync == syncName.kriDead then
		self:KriDead()
	elseif sync == syncName.yaujDead then
		self:YaujDead()
	elseif sync == syncName.vemDead then
		self:VemDead()
	elseif sync == syncName.allDead then
		self:SendBossDeathSync()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Volley()
	if self.db.profile.toxicvolley then
		self:Bar(L["toxicvolley_bar"], timer.volley, icon.volley, true, "green")
		--self:DelayedMessage(timer.firstVolley - 3, L["toxicvolley_message"], "Urgent")
	end
end

function module:Heal()
	healtime = GetTime()
	castingheal = true
	if self.db.profile.heal then
		self:Bar(L["healbar"], timer.heal, icon.heal, true, "yellow")
		self:Message(L["healwarn"], "Attention", true, "Alert")
	end
end

function module:HealStop()
	castingheal = false
	if self.db.profile.heal then
		self:RemoveBar(L["healbar"])
	end
end

function module:Panic()
	if self.db.profile.panic then
		self:RemoveBar(L["first_panic_bar"])
		self:Bar(L["panic_bar"], timer.panic, icon.panic, true, "white")
		self:Message(L["panic_message"], "Urgent", true, "Alarm")
	end
end

function module:Enrage()
	if self.db.profile.enrage then
		self:Message(L["enrage_warning"], "Important")
	end
end

function module:KriDead()
	kridead = true
	if self.db.profile.toxicvolley then
		self:RemoveBar(L["toxicvolley_bar"])
		self:CancelDelayedMessage(L["toxicvolley_message"])
	end
	if self.db.profile.deathspecials then
		self:Message(L["kridead_message"], "Positive")
	end
	if vemdead and yaujdead then
		self:Sync(syncName.allDead)
	end
end

function module:YaujDead()
	yaujdead = true
	if self.db.profile.heal then
		self:RemoveBar(L["healbar"])
	end
	if self.db.profile.panic then
		self:RemoveBar(L["panic_bar"])
		self:CancelDelayedMessage(L["panic_message"])
	end
	if self.db.profile.deathspecials then
		self:Message(L["yaujdead_message"], "Positive")
	end
	if vemdead and kridead then
		self:Sync(syncName.allDead)
	end
end

function module:VemDead()
	vemdead = true
	if yaujdead and kridead then
		if self.db.profile.deathspecials then
			self:Message(L["vemdead_message"], "Positive")
		end
		self:Sync(syncName.allDead)
	elseif yaujdead then
		if self.db.profile.deathspecials then
			self:Message(L["vemdeadcontkri_message"], "Positive")
		end
	elseif kridead then
		if self.db.profile.deathspecials then
			self:Message(L["vemdeadcontyauj_message"], "Positive")
		end
	elseif not kridead and not yaujdead then
		if self.db.profile.deathspecials then
			self:Message(L["vemdeadcontboth_message"], "Positive")
		end
	end
end
