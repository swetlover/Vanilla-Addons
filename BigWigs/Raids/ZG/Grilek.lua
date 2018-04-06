
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Gri'lek", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Grilek",

	avatar_trigger = "格里雷克获得了天神下凡效果。",
	preavatar_warn = "天神下凡马上! 近战退!",
	avatar_bar = "天神下凡(物理伤害,护甲提高50%)",
	avatar_message = "天神下凡! 远离BOss!",
	avatar_end = "天神下凡效果从格里雷克身上消失。",
	avatar_whisper_you = "格里雷克朝你来了! 跑!",
	avatar_whisper = "格里雷克朝你来你! 跑!",
	avatar_watch = "格里雷克朝 %s 去了!",

	avatar_cmd = "avatar",
	avatar_name = "天神下凡警报",
	avatar_desc = "天神下凡警报 (激怒阶段).",
	
	melee_cmd = "melee",
	melee_name = "近战警报",
	melee_desc = "在天神下凡被施放前发出警告，近战类可以及时离开BOSS.",

	announce_cmd = "announce",
	announce_name = "密语玩家",
	announce_desc = "让玩家知道他们正在被格里雷克追.",

	puticon_cmd = "puticon",
	puticon_name = "头像图标",
	puticon_desc = "一个RAID图标对目标玩家.\n\n(需要L或A)",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Grilek",

	avatar_trigger = "Gri\'lek bekommt \'Avatar\'\.",
	preavatar_warn = "Avatar bald! Nahk\195\164mpfer raus!",
	avatar_bar = "Avatar",
	avatar_message = "Avatar! Geh weg vom Boss!",
	avatar_end = "Avatar schwindet von Gri\'lek\.",
	avatar_whisper_you = "Gri'lek kommt auf dich zu! Lauf weg!",
	avatar_whisper = "Gri'lek kommt auf dich zu! Lauf weg!",
	avatar_watch = "Gri'lek verfolgt %s!",

	avatar_cmd = "avatar",
	avatar_name = "Alarm f\195\188r Avatar",
	avatar_desc = "Ank\195\188ndingen wenn der Boss Avatar ist (Raserei Phase).",

	melee_cmd = "melee",
	melee_name = "Warnunken f\195\188r die Nahk\195\164mpfer",
	melee_desc = "Warnt bevor Avatar gewirkt wird, sodass die Nahk\195\164mpfe Zeit haben um sich vom Boss zu entfernen.",

	announce_cmd = "announce",
	announce_name = "Benachrichtigt Spieler",
	announce_desc = "Informiert Spieler, dass Gri\'lek sie verfolgt, sodass sie rechtzeitig weglaufen k\195\182nnen.",

	puticon_cmd = "puticon",
	puticon_name = "Setzt Schlachtzugssymbole",
	puticon_desc = "Setzt ein Schlachtzugssymbol auf den verfolgten Spieler.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"avatar", "melee", "announce", "puticon", "bosskill"}

-- locals
local timer = {
	melee = 10,
	avatar = 15,
}
local icon = {
	avatar = "Ability_Creature_Cursed_05",
}
local syncName = {
	meleeIni = "GrilekMeleeIni"..module.revision,
	melee = "GrilekMelee"..module.revision,
	avatar = "GrilekAvatar"..module.revision,
	avatarOver = "GrilekAvatarStop"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")

	self:ThrottleSync(8, syncName.meleeIni)
	self:ThrottleSync(8, syncName.melee)
	self:ThrottleSync(10, syncName.avatar)
	self:ThrottleSync(10, syncName.avatarOver)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	firstwarn = 0
	nameoftarget = nil
	lasttarget = "randomshitthatwonthappen"
end

-- called after boss is engaged
function module:OnEngage()
	if firstwarn == 0 then
		self:Sync(syncName.meleeIni)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Events              --
------------------------------

function module:Event(msg)
	if msg == L["avatar_trigger"] then
		self:Sync(syncName.avatar)
	elseif msg == L["avatar_end"] then
		self:Sync(syncName.avatarOver)
		self:Sync(syncName.melee)
	end
end

function module:TargetChangedCheck()
	local num = GetNumRaidMembers()
	for i = 1, num do
		local raidUnit = string.format("raid%starget", i)
		if UnitExists(raidUnit) and UnitName(raidUnit) == "Gri'lek" and UnitExists(raidUnit.."target") then
			nameoftarget = UnitName(raidUnit.."target")
			if not lasttarget then
				lasttarget = nameoftarget
			end
		end
	end
	if nameoftarget ~= lasttarget then
		if self.db.profile.puticon then
			self:Icon(nameoftarget)
		end
		if self.db.profile.announce then
			if nameoftarget == UnitName("player") then
				self:Message(L["avatar_whisper_you"], "Attention", "Alarm")
			else
				self:Message(string.format(L["avatar_watch"], nameoftarget), "Personal")
				self:TriggerEvent("BigWigs_SendTell", nameoftarget, L["avatar_whisper"])
			end
		end
		lasttarget = nameoftarget
	end
end

function module:Avatar()
	self:ScheduleRepeatingEvent("grilektargetchangedcheck", self.TargetChangedCheck, 0.5, self)
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.meleeIni then
		firstwarn = 1
		if self.db.profile.melee then
			self:DelayedMessage(timer.melee, L["preavatar_warn"], "Attention", true, "Alarm")
		end
	elseif sync == syncName.melee then
		if self.db.profile.melee then
			self:DelayedMessage(timer.melee, L["preavatar_warn"], "Attention", true, "Alarm")
		end
	elseif sync == syncName.avatar then
		self:Avatar()
		if self.db.profile.avatar then
			self:Bar(L["avatar_bar"], timer.avatar, icon.avatar)
			self:Message(L["avatar_message"], "Urgent")
		end
	elseif sync == syncName.avatarOver then
		self:CancelScheduledEvent("grilektargetchangedcheck")
		nameoftarget = nil
		if self.db.profile.avatar then
			self:RemoveBar(L["avatar_bar"])
		end
		if self.db.profile.puticon then
			self:RemoveIcon(lasttarget)
		end
		lasttarget = "randomshitthatwonthappen"
	end
end
