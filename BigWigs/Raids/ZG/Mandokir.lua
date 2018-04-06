
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Bloodlord Mandokir", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	ohgan = "奥根",
	cmd = "Mandokir",

    engage_trigger = "feed your souls to Hakkar himself",
	watch_trigger = "(.+)! I'm watching you!",
	gaze_trigger = "血领主曼多基尔开始施放威慑凝视。",
	gazeafflictyou = "你受到了威慑凝视效果的影响。",
	gazeafflictother = "(.+)受到了威慑凝视效果的影响。",
	gazeendyou = "威慑凝视效果从你身上消失了。",
	gazeendother = "威慑凝视效果从(.+)身上消失。",
    gazecast = "威慑凝视来临!(注意停手)",
	gazewatchedbar = "威慑凝视: %s (注意停手)",
	enragegain = "血领主曼多基尔获得了激怒的效果。",
	enragefade = "激怒效果从血领主曼多基尔身上消失。",
	enragebar = "激怒",
	wwgain = "血领主曼多基尔获得了旋风斩的效果。",
	wwloss = "旋风斩效果从血领主曼多基尔身上消失。",
	ww = "旋风斩",
	deathyou = "你死了。",
	deathother = "(.+)死亡了。",
	you = "你",

	watched_warning = "你被监视着！停止一切！",
	watched_warning_tell = "你被监视着！停止一切！",
	watched_warning_other = "%s 被盯上了!",
	enraged_message = "奥根死了! 血领主激怒!",	

	announce_cmd = "whispers",
	announce_name = "密语被盯玩家",
	announce_desc = "密语被盯玩家.\n\n(需要L或A)",

	puticon_cmd = "puticon",
	puticon_name = "Raid图标被盯玩家",
	puticon_desc = "Raid图标被盯玩家.\n\n(需要L或A)",
	
	gaze_cmd = "gaze",
	gaze_name = "威慑凝视警报",
	gaze_desc = "威慑凝视显示条",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "旋风斩警报",
	whirlwind_desc = "旋风斩警报显示",

	enraged_cmd = "enraged",
	enraged_name = "激怒警报",
	enraged_desc = "通告BOSS被激怒",
            
    ["Possible Gaze"] = "可能凝视",
	["Charge"] = "冲锋",
	["Next Whirlwind"] = "下个旋风斩",
} end )

L:RegisterTranslations("deDE", function() return {
	ohgan = "Ohgan",
	cmd = "Mandokir",

	engage_trigger = "feed your souls to Hakkar himself",
	watch_trigger = "(.+)! I'm watching you!",
	gaze_trigger = "Bloodlord Mandokir beginnt Bedrohlicher Blick zu wirken.",
	gazeafflictyou = "Ihr seid von Bedrohlicher Blick betroffen.",
	gazeafflictother = "(.+) ist von Bedrohlicher Blick betroffen.",
	gazeendyou = "'Bedrohlicher Blick' schwindet von Euch.",
	gazeendother = "Bedrohlicher Blick schwindet von (.+).",
	gazecast = "Bedrohlicher Blick kommt!",
	gazewatchedbar = "Bedrohlicher Blick: %s",
	enragegain = "Bloodlord Mandokir bekommt 'Wutanfall'.",
	enragefade = "Wutanfall schwindet von Bloodlord Mandokir.",
	enragebar = "Wutanfall",
	wwgain = "Bloodlord Mandokir bekommt 'Wirbelwind'.",
	wwloss = "Wirbelwind schwindet von Bloodlord Mandokir\.",
	ww = "Wirbelwind",
	deathyou = "Du stirbst.",
	deathother = "(.+) stirbt.",
	you = "Euch",

	watched_warning = "Du wirst beobachtet! Stoppen Sie alles!",
	watched_warning_tell = "You are being watched! Stop everything!",
	watched_warning_other = "%s wird beobachtet!",
	enraged_message = "Ohgan ist tot! Mandokir wütend!",

	announce_cmd = "whispers",
	announce_name = "Warnung, wenn Spieler beobachtet werden",
	announce_desc = "Warnen, wenn Bloodlord Mandokir wirft Bedrohlicher Blick\n\n(Benötigt Schlachtzugleiter oder Assistent)",

	puticon_cmd = "puticon",
	puticon_name = "Schlachtzugsymbol auf die beobachtet Spieler",
	puticon_desc = "Versetzt eine Schlachtzugsymbol auf der beobachteten Spieler.\n\n(Benötigt Schlachtzugleiter oder Assistent)",

	gaze_cmd = "gaze",
	gaze_name = "Alarm für Bedrohlicher Blick",
	gaze_desc = "Zeigt Balken für Bedrohlicher Blick",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Alarm für Wirbelwind",
	whirlwind_desc = "Zeigt Balken für Wirbelwind",

	enraged_cmd = "enraged",
	enraged_name = "Verkündet Boss' Raserei",
	enraged_desc = "Lässt dich wissen, wenn Boss härter zuschlägt",

	["Possible Gaze"] = "Mögliches Starren"
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20005 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.wipemobs = { L["ohgan"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"gaze", "announce", "puticon", "whirlwind", "enraged", "bosskill"}


-- locals
local timer = {
	firstCharge = 15,
	firstWhirlwind = 20,
	firstGaze = 33,

	gaze = 20,
}
local icon = {
	charge = "Ability_Warrior_Charge",
	whirlwind = "Ability_Whirlwind",
	gaze = "Spell_Shadow_Charm",
}
local syncName = {
	whirlwind = "MandokirWWStart"..module.revision,
	whirlwindOver = "MandokirWWStop"..module.revision,
	enrage = "MandokirEnrageStart"..module.revision,
	enrageOver = "MandokirEnrageEnd"..module.revision,
	gazeCast = "MandokirGazeCast"..module.revision,
	gazeAfflicted = "MandokirGazeAfflict"..module.revision,
	gazeOver = "MandokirGazeEnd"..module.revision,
}

--[[
9/16 22:28:16.440  Dorg's Shield Slam hits Bloodlord Mandokir for 264. -- engage
Line 19212: 9/16 22:28:32.884  Bloodlord Mandokir gains Whirlwind.	16.4
Line 20100: 9/16 22:28:56.912  Bloodlord Mandokir gains Whirlwind.	24.1
Line 21416: 9/16 22:29:38.798  Bloodlord Mandokir gains Whirlwind.	41.9
Line 22221: 9/16 22:30:02.966  Bloodlord Mandokir gains Whirlwind.	24.1
Line 19709: 9/16 22:28:45.869  Bloodlord Mandokir begins to cast Threatening Gaze. 	29.5
Line 20694: 9/16 22:29:13.993  Bloodlord Mandokir begins to cast Threatening Gaze.	28.1
Line 21512: 9/16 22:29:42.084  Bloodlord Mandokir begins to cast Threatening Gaze.	28.1
Line 22455: 9/16 22:30:10.189  Bloodlord Mandokir begins to cast Threatening Gaze.	28.1
]]


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["engage_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")

	self:ThrottleSync(5, syncName.whirlwind)
	self:ThrottleSync(5, syncName.whirlwindOver)
	self:ThrottleSync(5, syncName.enrage)
	self:ThrottleSync(5, syncName.enrageOver)
	self:ThrottleSync(5, syncName.gazeCast)
	self:ThrottleSync(5, syncName.gazeAfflicted)
	self:ThrottleSync(5, syncName.gazeOver)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
	self:Bar(L["Charge"], timer.firstCharge, icon.charge)
	-- todo check combat log regarding CHARGE to trigger the ones following the first
	self:Bar(L["Next Whirlwind"], timer.firstWhirlwind, icon.whirlwind)
	self:Bar(L["Possible Gaze"], timer.firstGaze, icon.gaze)
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CHAT_MSG_MONSTER_YELL(msg)
	local gazetime
	local _,_,watchedplayer,_ = string.find(msg, L["watch_trigger"])
	if watchedplayer then
		if self.db.profile.announce then
			if watchedplayer == UnitName("player") then
				self:Message(L["watched_warning"], "Personal", true, "Alarm")
			else
				self:Message(string.format(L["watched_warning_other"], watchedplayer), "Attention")
				self:TriggerEvent("BigWigs_SendTell", watchedplayer, L["watched_warning_tell"])
			end
		end
		if self.db.profile.puticon then
			self:Icon(watchedplayer)
		end
		if watchedplayer == UnitName("player") and self.db.profile.gaze then
			self:WarningSign(icon.gaze, 7)
		end
	end
end

function module:Event(msg)
	local _,_,gazedplayer,_ = string.find(msg, L["gazeafflictother"])
	local _,_,gazedplayerend,_ = string.find(msg, L["gazeendother"])
	--local _,_,gazeddeathend,_ = string.find(msg, L["deathother"])
	if msg == L["wwgain"] then
		self:Sync(syncName.whirlwind)
	elseif msg == L["wwloss"] then
		self:Sync(syncName.whirlwindOver)
	elseif msg == L["enragegain"] then
		self:Sync(syncName.enrage)
	elseif msg == L["enragefade"] then
		self:Sync(syncName.enrageOver)
	elseif msg == L["gaze_trigger"] then
		self:Sync(syncName.gazeCast)
	elseif msg == L["gazeafflictyou"] then
		gazetime = GetTime()
		self:Sync(syncName.gazeAfflicted .. " " .. UnitName("player"))
	elseif gazedplayer then
		gazetime = GetTime()
		self:Sync(syncName.gazeAfflicted .. " " .. gazedplayer)
	elseif msg == L["gazeendyou"] then
		self:Sync(syncName.gazeOver .. " " .. UnitName("player"))
	elseif gazedplayerend and gazedplayerend ~= L["you"] then
		self:Sync(syncName.gazeOver .. " " .. gazedplayerend)
		--elseif msg == L["deathyou"] then
		--	self:Sync("MandokirGazeEnd "..UnitName("player"))
		--elseif gazeddeathend then
		--	self:Sync("MandokirGazeEnd "..gazeddeathend)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.whirlwind and self.db.profile.whirlwind then
		self:Bar(L["ww"], 2, icon.whirlwind)
		--self:ScheduleEvent("BigWigs_StartBar", 2, self, "Next Whirlwind", 18, icon.whirlwind)
	elseif sync == syncName.whirlwindOver and self.db.profile.whirlwind then
		self:RemoveBar(L["ww"])
		self:Bar(L["Next Whirlwind"], 18, icon.whirlwind)
	elseif sync == syncName.enrage and self.db.profile.enraged then
		self:Message(L["enraged_message"], "Urgent")
		self:Bar(L["enragebar"], 90, "Spell_Shadow_UnholyFrenzy")
	elseif sync == syncName.enrageOver and self.db.profile.enraged then
		self:RemoveBar(L["enragebar"])
	elseif sync == syncName.gazeCast and self.db.profile.gaze then
		self:Bar(L["gazecast"], 2, icon.gaze)
		self:RemoveBar(L["Possible Gaze"])
	elseif sync == syncName.gazeAfflicted and self.db.profile.gaze then
		self:Bar(string.format(L["gazewatchedbar"], rest), 6, icon.gaze, true, "Black")
	elseif sync == syncName.gazeOver then
		if self.db.profile.gaze then
			self:RemoveBar(string.format(L["gazewatchedbar"], rest))
		end
		if self.db.profile.puticon then
			self:RemoveIcon(rest)
		end
		self:Bar(L["Possible Gaze"], timer.gaze-8, icon.gaze)
	end
end