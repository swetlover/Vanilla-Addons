
-- trigger for spore spawn missing

----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Loatheb", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Loatheb",

	doom_cmd = "doom",
	doom_name = "必然的厄运警报",
	doom_desc = "必然的厄运的警报",

	curse_cmd = "curse",
	curse_name = "诅咒驱散警报",
	curse_desc = "警报当洛欧塞布诅咒驱散时",

	spore_cmd = "spore",
	spore_name = "孢子警报",
	spore_desc = "孢子的警报",

    debuff_cmd = "debuff",
	debuff_name = "孢子 Debuff",
    debuff_desc = "显示图标党你的孢子Debuff快完了",

    groups_cmd = "groups",
	groups_name = "孢子队伍",
	groups_desc = "显示小队成员的孢子计时 (7组策略)",

	doombar = "必然厄运(10秒后2550暗伤) %d",
	doomwarn = "必然的厄运 %d! %d 秒下一个!",
	doomwarn5sec = "必然的厄运 %d 5秒后!",
	doomtrigger = "必然的厄运效果的影响。",

	cursewarn = "解除诅咒! 重新诅咒!",
	cursebar = "解除诅咒(SS重新诅咒)",
	cursetrigger  = "憎恨者的(.+)诅咒被移除了。",


	doomtimerbar = "每隔15秒发动必然的厄运",
	doomtimerwarn = "必然的厄运计时 %s 秒后改变！",
	doomtimerwarnnow = "必然的厄运现在每隔15秒发动一次！",

	cursetimerbar = "解除诅咒计时",
	cursetimerwarn = "解除诅咒, 下一个 %s 秒!",

	startwarn = "憎恨者相遇, 2分钟后施放必然的厄运!",

	sporebar = "下一次孢子 %d",
	sporebar_group = "下一次孢子 - 小队 %d",

	you = "你",
	are = "受到了",
	fungalBloom = "蘑菇花",

 	--LoathebTactical
	graphic_cmd = "graphic",
	graphic_name = "图形图标",
	graphic_desc = "当检测时显示图形图标",
	
	sound_cmd = "sound",
	sound_name = "音效效果",
	sound_desc = "当检测时播放音效效果",
	
	consumable_cmd = "consumable",
	consumable_name = "不要警告RAID使用消耗品 (A)",
	consumable_desc = "When check does NOT warn raid to use consambles over raidwarn. Requires Assistance (A)",
	
	shadowpot = "-- 喝暗影防护药水 ! --",
	bandage = "-- 使用你的绷带 ! --",
	wrtorhs = "-- 吃糖或者鞭根块茎 ! --",
	shadowpotandbandage = "-- 喝暗影防护药水和绷带 ! --",
	noconsumable = "-- 不喝任何药水 ! --",
	
	soundshadowpot = "Interface\\Addons\\BigWigs\\Sounds\\potion.wav",
	soundbandage = "Interface\\Addons\\BigWigs\\Sounds\\bandage.wav",
	soundwrtorhs = "Interface\\Addons\\BigWigs\\Sounds\\healthstone.wav",
	soundshadowpotandbandage = "Interface\\Addons\\BigWigs\\Sounds\\potionandbandage.wav",
	soundgoforbuff = "Interface\\Addons\\BigWigs\\Sounds\\goforbuff.wav",
	
} end )
	
local LoathebDebuff = CreateFrame( "GameTooltip", "LoathebDebuff", nil, "GameTooltipTemplate" );
LoathebDebuff:Hide()
LoathebDebuff:SetFrameStrata("TOOLTIP")
LoathebDebuff:SetOwner(WorldFrame, "ANCHOR_NONE")
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"doom", "curse", "spore", "groups", "debuff", -1, "consumable", "graphic", "sound", "bosskill"}


-- locals
local timer = {
	softEnrage = 300,
	firstDoom = 120,
	doomLong = 30,
	doomShort = 15,
	doom = 0, -- this variable will be changed during the encounter
	spore = 13,
	firstCurse = 5,
	curse = 30,
	getNextSpore = 20,
}
local icon = {
	softEnrage = "Spell_Shadow_UnholyFrenzy",
	doom = "Spell_Shadow_NightOfTheDead",
	spore = "Ability_TheBlackArrow",
	sieni = "Interface\\AddOns\\\BigWigs\\Textures\\sieni",
	curse = "Spell_Holy_RemoveCurse",
}
local syncName = {
	doom = "LoathebDoom"..module.revision,
	spore = "LoathebSporeSpawn"..module.revision,
	curse = "LoathebRemoveCurse"..module.revision,
}
local consumableslist = {L["shadowpot"],L["noconsumable"],L["bandage"],L["wrtorhs"],L["shadowpotandbandage"],L["noconsumable"],L["bandage"],L["noconsumable"],L["wrtorhs"]}
local numSpore = 0 -- how many spores have been spawned
local numDoom = 0 -- how many dooms have been casted


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_BREAK_AURA", "CurseEvent")

	-- 2: Doom and SporeSpawn versioned up because of the sync including the
	-- doom/spore count now, so we don't hold back the counter.
	self:ThrottleSync(10, syncName.doom)
	self:ThrottleSync(5, syncName.spore)
	self:ThrottleSync(5, syncName.curse)

	self.consumableseq = 0

	self.frameIcon = CreateFrame("Frame",nil,UIParent)

	self.frameIcon:SetFrameStrata("MEDIUM")
	self.frameIcon:SetWidth(100)
	self.frameIcon:SetHeight(100)
	self.frameIcon:SetAlpha(0.6)

	self.frameTexture = self.frameIcon:CreateTexture(nil,"BACKGROUND")

	self.frameTexture:SetTexture(nil)
	self.frameTexture:SetAllPoints(self.frameIcon)

	self.frameIcon:Hide()

	self.frameIcon2 = CreateFrame("Frame",nil,UIParent)

	self.frameIcon2:SetFrameStrata("MEDIUM")
	self.frameIcon2:SetWidth(100)
	self.frameIcon2:SetHeight(100)
	self.frameIcon2:SetAlpha(0.6)

	self.frameTexture2 = self.frameIcon2:CreateTexture(nil,"BACKGROUND")

	self.frameTexture2:SetTexture(nil)
	self.frameTexture2:SetAllPoints(self.frameIcon2)

	self.frameIcon2:Hide()

end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.consumableseq = 0
	numSpore = 0 -- how many spores have been spawned
	numDoom = 0 -- how many dooms have been casted
	timer.doom = timer.firstDoom

	self.frameIcon:Hide()
	self.frameIcon2:Hide()
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.doom then
		self:Bar(L["doomtimerbar"], timer.softEnrage, icon.softEnrage)
		self:DelayedMessage(timer.softEnrage - 60, string.format(L["doomtimerwarn"], 60), "Attention")
		self:DelayedMessage(timer.softEnrage - 30, string.format(L["doomtimerwarn"], 30), "Attention")
		self:DelayedMessage(timer.softEnrage - 10, string.format(L["doomtimerwarn"], 10), "Urgent")
		self:DelayedMessage(timer.softEnrage - 5, string.format(L["doomtimerwarn"], 5), "Important")
		self:DelayedMessage(timer.softEnrage, L["doomtimerwarnnow"], "Important")

		-- soft enrage after 5min: Doom every 15s instead of every 30s
		--self:ScheduleEvent("bwloathebdoomtimerreduce", function() module.doomTime = 15 end, 300)
		self:ScheduleEvent("bwloathebdoomtimerreduce", self.SoftEnrage, timer.softEnrage)
		--self:Message(L["startwarn"], "Red")
		self:Bar(string.format(L["doombar"], numDoom + 1), timer.doom, icon.doom)
		self:DelayedMessage(timer.doom - 5, string.format(L["doomwarn5sec"], numDoom + 1), "Urgent")
		timer.doom = timer.doomLong -- reduce doom timer from 120s to 30s
	end
	self:Bar(L["cursebar"], timer.firstCurse, icon.curse)

	self:Spore()
	self:ScheduleRepeatingEvent("bwloathebspore", self.Spore, timer.spore, self)
	self:ScheduleRepeatingEvent("bwLoathebCheckDebuff", self.CheckDebuff, 0.5, self)
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
	self.frameIcon:Hide()
	self.frameIcon2:Hide()
end


------------------------------
--      Initialization      --
------------------------------

function module:Event( msg )
	if string.find(msg, L["doomtrigger"]) then
		self:Sync(syncName.doom .. " " .. tostring(numDoom + 1))
	end
end

function module:CurseEvent( msg )
	if string.find(msg, L["cursetrigger"]) then
		self:Sync(syncName.curse)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.doom and rest then
		self:Doom(rest)
		rest = tonumber(rest)
		if rest == (self.consumableseq + 1) then
			self:ScheduleEvent("bwloathebconsumable "..tostring(self.consumableseq), self.ConsumableWarning, 11, self)
			self.consumableseq = self.consumableseq + 1
		end
		elseif sync == syncName.curse then
			self:Curse()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Doom(syncNumDoom)
	syncNumDoom = tonumber(syncNumDoom)
	if syncNumDoom then
		if syncNumDoom == (numDoom + 1) then
			numDoom = numDoom + 1
			if self.db.profile.doom then
				self:Message(string.format(L["doomwarn"], numDoom, timer.doom), "Important")
			end
			if self.db.profile.doom then
				self:Bar(string.format(L["doombar"], numDoom + 1), timer.doom, icon.doom)
				self:DelayedMessage(timer.doom - 5, string.format(L["doomwarn5sec"], numDoom + 1), "Urgent")
			end
		end
	end
end



function module:Curse()
	if self.db.profile.curse then
		self:Message(L["cursewarn"], "Important")
		self:Bar(L["cursebar"], timer.curse, icon.curse)
	end
end


------------------------------
--      Utility	Functions   --
------------------------------

function module:SoftEnrage()
	timer.doom = timer.doomShort -- reduce doom timer from 30s to 15s
end

function module:Spore()
	numSpore = numSpore + 1

	if self.db.profile.spore then
		--self:Message(string.format(L["sporewarn"], numSpore), "Important")
		if not self.db.profile.groups then
			self:Bar(string.format(L["sporebar_group"], numSpore), timer.spore, icon.spore)
			if numSpore == 7 then
				numSpore = 0
			end
		else
			self:Bar(string.format(L["sporebar"], numSpore), timer.spore, icon.spore)
		end
	end
end

function module:CheckDebuff()
	if self.db.profile.debuff then
		local debuff = strlower(L["fungalBloom"])
		local tooltip=LoathebDebuff;
		local textleft1=getglobal(tooltip:GetName().."TextLeft1");

		for i=0, 15 do
			local id = GetPlayerBuff(i,"HARMFUL")
			tooltip:SetOwner(UIParent, "ANCHOR_NONE");
			tooltip:SetPlayerBuff(id);
			buffName = textleft1:GetText();
			tooltip:Hide();
			if ( buffName and strfind(strlower(buffName), debuff )) then
				local timeleft = GetPlayerBuffTimeLeft(id)
				if timeleft < timer.getNextSpore then
					self:TriggerEvent("BigWigs_ShowWarningSign", icon.sieni, timer.getNextSpore)
				elseif timeleft > timer.getNextSpore then
					self:TriggerEvent("BigWigs_HideWarningSign", icon.sieni)
				end
			elseif ( buffName==nil ) then
				break;
			end
		end
	end
end

function module:ConsumableWarning()
	if consumableslist[self.consumableseq] then
		if not self.db.profile.consumable then
			SendChatMessage(consumableslist[self.consumableseq], "RAID_WARNING")
			SendChatMessage(consumableslist[self.consumableseq], "SAY")
		end
		if self.db.profile.graphic then
			if consumableslist[self.consumableseq] == L["shadowpot"] then
				self.frameTexture:SetTexture("Interface\\Icons\\INV_Potion_23") --greater shadow protection
				self.frameTexture2:SetTexture(nil)
			elseif consumableslist[self.consumableseq] == L["bandage"] then
				self.frameTexture:SetTexture("Interface\\Icons\\INV_Misc_Bandage_12") -- heavy runecloth
				self.frameTexture2:SetTexture(nil)
			elseif consumableslist[self.consumableseq] == L["wrtorhs"] then
				self.frameTexture:SetTexture("Interface\\Icons\\INV_Stone_04") -- healthstone
				--self.frameTexture2:SetTexture("Interface\\Icons\\INV_Misc_Food_55") -- whipper root
			elseif consumableslist[self.consumableseq] == L["shadowpotandbandage"] then
				self.frameTexture:SetTexture("Interface\\Icons\\INV_Potion_23") --greater shadow protection
				self.frameTexture2:SetTexture("Interface\\Icons\\INV_Misc_Bandage_12") -- heavy runecloth
			elseif consumableslist[self.consumableseq] == L["noconsumable"] then
				self.frameTexture:SetTexture(nil)
				self.frameTexture2:SetTexture(nil)
			end
			self.frameIcon.texture = self.frameTexture
			self.frameTexture:SetTexCoord(0.0,1.0,0.0,1.0)
			self.frameIcon:SetPoint("CENTER",200,100)
			self.frameIcon:Show()

			self.frameIcon2.texture = self.frameTexture2
			self.frameTexture2:SetTexCoord(0.0,1.0,0.0,1.0)
			self.frameIcon2:SetPoint("CENTER",200,0)
			self.frameIcon2:Show()

			self:ScheduleEvent(function()
				self.frameIcon:Hide()
				self.frameIcon2:Hide()
			end, 5)
		end
		if self.db.profile.sound then
			if consumableslist[self.consumableseq] == L["shadowpot"] then
				PlaySoundFile(L["soundshadowpot"])
			elseif consumableslist[self.consumableseq] == L["bandage"] then
				PlaySoundFile(L["soundbandage"])
			elseif consumableslist[self.consumableseq] == L["wrtorhs"] then
				PlaySoundFile(L["soundwrtorhs"])
			elseif consumableslist[self.consumableseq] == L["shadowpotandbandage"] then
				PlaySoundFile(L["soundshadowpotandbandage"])
			end
		end
	end
end