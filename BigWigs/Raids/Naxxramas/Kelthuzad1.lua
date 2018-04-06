
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Kel'Thuzad", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Kelthuzad",

	KELTHUZADCHAMBERLOCALIZEDLOLHAX = "克尔苏加德的大厅",

	phase_cmd = "phase",
	phase_name = "每阶段警报",
	phase_desc = "阶段性警报.",

	mc_cmd = "mindcontrol",
	mc_name = "精神控制警报",
	mc_desc = "当玩家被精神控制时发出警报.",

	fissure_cmd = "fissure",
	fissure_name = "暗影裂隙",
	fissure_desc = "暗影裂隙即将来临时发出警报.",

	frostblast_cmd = "frostblast",
	frostblast_name = "冰霜冲击",
	frostblast_desc = "当玩家受到冰霜冲击时发出警报.",

	frostbolt_cmd = "frostbolt",
	frostbolt_name = "寒冰箭警报",
	frostbolt_desc = "警报当寒冰箭来临时",

	frostboltbar_cmd = "frostboltbar",
	frostboltbar_name = "寒冰箭的条",
	frostboltbar_desc = "显示一个寒冰箭的释放条",

	detonate_cmd = "detonate",
	detonate_name = "自爆法力警报",
	detonate_desc = "自爆法力即将发动时发出警报.",

	detonateicon_cmd = "detonateicon",
	detonateicon_name = "标记自爆法力",
	detonateicon_desc = "使用团队图标标记将自爆法力的玩家.",

	guardians_cmd = "guardians",
	guardians_name = "寒冰皇冠卫士刷新",
	guardians_desc = "第三阶段召唤寒冰皇冠卫士发出警报.",

	fbvolley_cmd = "fbvolley",
	fbvolley_name = "可能乱射",
	fbvolley_desc = "寒冰箭乱射/多重的计时条",

	addcount_cmd = "addcount",
	addcount_name = "P1 小怪计数",
	addcount_desc = "在P1增加计数小怪的死亡",

	mc_trigger1 = "Your soul, is bound to me now!",
	mc_trigger2 = "There will be no escape!",
	mc_warning = "精神控制!",
	mc_bar = "精神控制!",

	start_trigger = "Minions, servants, soldiers of the cold dark, obey the call of Kel'Thuzad!",
	start_trigger1 = "Minions, servants, soldiers of the cold dark! Obey the call of Kel'Thuzad!",
	start_warning = "克尔苏加德开始相遇! 他将在~5分钟后激活!",
	start_bar = "阶段 1 计时",
	attack_trigger1 = "克尔苏加德发起攻击",
	attack_trigger2 = "克尔苏加德没有击中",
	attack_trigger3 = "克尔苏加德击中",
	attack_trigger4 = "克尔苏加德的致命一击",
	kick_trigger1 = "脚踢击中克尔苏加德",
	kick_trigger2 = "脚踢对克尔苏加德造成",
	kick_trigger3 = "脚踢被克尔苏加德格挡",
	pummel_trigger1 = "拳击击中克尔苏加德",
	pummel_trigger2 = "拳击对克尔苏加德造成",
	pummel_trigger3 = "拳击被克尔苏加德格挡",
	shieldbash_trigger1 = "盾击击中克尔苏加德",
	shieldbash_trigger2 = "盾击对克尔苏加德造成",
	shieldbash_trigger3 = "盾击被克尔苏加德格挡",
	earthshock_trigger1 = "地震术击中克尔苏加德",
	earthshock_trigger2 = "地震术对克尔苏加德造成",

	phase1_warn = "20秒后阶段 1结束!",

	phase2_trigger1 = "Pray for mercy!",
	phase2_trigger2 = "Scream your dying breath!",
	phase2_trigger3 = "The end is upon you!",
	phase2_warning = "阶段 2, 克尔苏加德降临!",
	phase2_bar = "克尔苏加德激活!",

	phase3_soon_warning = "第三阶段 即将来临！",
	phase3_trigger = "Master! I require aid!",
	phase3_warning = "进入第三阶段，寒冰皇冠卫士降临！",

	guardians_bar = "寒冰皇冠卫士 %d",

	fissure_trigger = "施放了暗影裂隙",
	fissure_trigger2 = "施放了暗影裂隙",
	fissure_warning = "暗影裂隙!",
	fissure_bar = "暗影裂隙 CD",

	frostbolt_trigger = "克尔苏加德开始施放寒冰箭。",
	frostbolt_warning = "寒冰箭! 打断他!",
	frostbolt_bar = "寒冰箭",


	frostbolt_volley = "可能乱射",
	frostbolt_volley_trigger = "寒冰箭效果的影响",

	add_dead_trigger = "(.*)死亡",
	add_bar = "%d/14 %s",
	add_bar2 = "%d/10 %s",

	frostblast_bar = "可能冰霜冲击",
	frostblast_trigger1 = "I will freeze the blood in your veins!",
	frostblast_trigger2 = "^([^%s]+)([^%s]+)冰霜冲击效果的影响。",
	frostblast_warning = "冰霜冲击!",
	frostblast_soon_message = "可能冰霜冲击 ~5秒!",

	phase2_frostblast_warning = "可能冰霜冲击 ~5秒!",
	phase2_mc_warning = "可能精神控制 ~5秒!",
	phase2_detonate_warning = "自爆法力大约 ~5秒!",

	detonate_trigger = "^([^%s]+)([^%s]+)了自爆法力效果的影响。",
	detonate_bar = "自爆法力 - %s",
	detonate_possible_bar = "自爆法力",
	detonate_warning = "%s 中了自爆法力!",
	detonate_onme = "对+.施放了自爆法力",

	you = "你",
	are = "受到了",

	proximity_cmd = "proximity",
	proximity_name = "附近警报",
	proximity_desc = "显示附近玩家警报框架",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20009 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"frostbolt", "frostboltbar", -1, "frostblast", "proximity", "fissure", "mc", -1, "fbvolley", -1, "detonate", "detonateicon", -1 ,"guardians", -1, "addcount", "phase", "bosskill"}

-- Proximity Plugin
module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
module.proximitySilent = true


-- locals
local timer = {
	phase1 = 320,
	firstFrostboltVolley = 30,
	frostboltVolley = {15,30},
	frostbolt = 2,
	phase2 = 15,
	firstDetonate = 20,
	detonate = 5,
	nextDetonate = {20,25},
	firstFrostblast = 50,
	frostblast = {30,60},
	firstMindcontrol = {30,60},
	mindcontrol = {60,90},
	firstGuardians = 5,
	guardians = 7,
	fissure = {10,15},
}
local icon = {
	abomination = "",
	soulWeaver = "",
	frostboltVolley = "Spell_Frost_FrostWard",
	mindcontrol = "Inv_Belt_18",
	phase1 = "",
	phase2 = "",
	guardians = "inv_misc_ahnqirajtrinket_01",
	frostblast = "Spell_Frost_FreezingBreath",
	detonate = "Spell_Nature_WispSplode",
	frostbolt = "Spell_Frost_FrostBolt02",
	fissure = "Spell_Shadow_CreepingPlague",
}
local syncName = {
	detonate = "KelDetonate"..module.revision,
	frostblast = "KelFrostBlast"..module.revision,
	frostbolt = "KelFrostbolt"..module.revision,
	frostboltOver = "KelFrostboltStop"..module.revision,
	fissure = "KelFissure"..module.revision,
	mindcontrol = "KelMindControl"..module.revision,
	abomination = "KelAddDiesAbom"..module.revision,
	soulWeaver = "KelAddDiesSoul"..module.revision,
	phase2 = "KelPhase2"..module.revision,
	phase3 = "KelPhase3"..module.revision,
}

local timeLastFrostboltVolley = 0    -- saves time of first frostbolt
local numFrostboltVolleyHits = 0	-- counts the number of people hit by frostbolt
local numAbominations = 0	-- counter for Unstoppable Abomination's
local numWeavers = 0 	-- counter for Soul Weaver's
local timePhase1Start = 0    -- time of p1 start, used for tracking add count


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["start_trigger"])
module:RegisterYellEngage(L["start_trigger1"])

-- Big evul hack to enable the module when entering Kel'Thuzads chamber.
function module:OnRegister()
	self:RegisterEvent("MINIMAP_ZONE_CHANGED")
end

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")

	self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("UNIT_HEALTH")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "FissureEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Affliction")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Affliction")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Affliction")

	self:ThrottleSync(5, syncName.detonate)
	self:ThrottleSync(0, syncName.frostblast)
	self:ThrottleSync(2, syncName.frostbolt)
	self:ThrottleSync(2, syncName.frostboltOver)
	self:ThrottleSync(2, syncName.fissure)
	self:ThrottleSync(2, syncName.abomination)
	self:ThrottleSync(2, syncName.soulWeaver)
	self:ThrottleSync(5, syncName.phase2)
	self:ThrottleSync(5, syncName.phase3)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self.warnedAboutPhase3Soon = nil
	frostbolttime = 0
	self.lastFrostBlast=0
end

-- called after boss is engaged
function module:OnEngage()
	self.lastFrostBlast=0
	self:Message(L["start_warning"], "Attention")
	self:Bar(L["start_bar"], timer.phase1, icon.phase1)
	self:DelayedMessage(timer.phase1 - 20, L["phase1_warn"], "Important")

	if self.db.profile.addcount then
		timePhase1Start = GetTime() 	-- start of p1, used for tracking add counts
		numAbominations = 0
		numWeavers = 0
		self:Bar(string.format(L["add_bar"], numAbominations, "无法阻止的憎恶"), timer.phase1, icon.abomination)
		self:Bar(string.format(L["add_bar2"], numWeavers, "织魂者"), timer.phase1, icon.soulWeaver)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
	self:RemoveProximity()
	BigWigsFrostBlast:FBClose()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:MINIMAP_ZONE_CHANGED(msg)
	if GetMinimapZoneText() ~= L["KELTHUZADCHAMBERLOCALIZEDLOLHAX"] or self.core:IsModuleActive(module.translatedName) then
		return
	end

	-- Activate the Kel'Thuzad mod!
	self.core:EnableModule(module.translatedName)
end

-- check for phase 3
function module:UNIT_HEALTH(msg)
	if self.db.profile.phase then
		if UnitName(msg) == self.translatedName then
			local health = UnitHealth(msg)
			local maxHealth = UnitHealthMax(msg)
			if math.ceil(100*health/maxHealth) > 35 and math.ceil(100*health/maxHealth) <= 40 and not self.warnedAboutPhase3Soon then
				self:Message(L["phase3_soon_warning"], "Attention")
				self.warnedAboutPhase3Soon = true
			elseif math.ceil(100*health/maxHealth) > 40 and self.warnedAboutPhase3Soon then
				self.warnedAboutPhase3Soon = nil
			end
		end
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if ((msg == L["phase2_trigger1"]) or (msg == L["phase2_trigger2"]) or (msg == L["phase2_trigger3"])) then
		self:Sync(syncName.phase2)
	elseif string.find(msg, L["phase3_trigger"]) then
		self:Sync(syncName.phase3)
	elseif msg == L["mc_trigger1"] or msg == L["mc_trigger2"] then
		self:Sync(syncName.mindcontrol)
		--elseif msg == L["frostblast_trigger1"] then
		--	self:Sync(syncName.frostblast)
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE( msg )
	if string.find(msg, L["frostbolt_trigger"]) then
		self:Sync(syncName.frostbolt)
	-- shadow fissure
	elseif string.find(msg, L["fissure_trigger"]) then
		self:Sync(syncName.fissure)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	local _,_, mob = string.find(msg, L["add_dead_trigger"])
	if self.db.profile.addcount and (mob == "无法阻止的憎恶") then
		self:Sync(syncName.abomination .. " " .. mob)
	elseif self.db.profile.addcount and (mob == "织魂者") then
		self:Sync(syncName.soulWeaver .. " " .. mob)
	elseif self.db.profile.bosskill and (mob == "克尔苏加德") then
		self:SendBossDeathSync()
	end
end

--[[function module:Volley()
self:Bar(L["frostbolt_volley"], 15, icon.frostboltVolley)
end]]
function module:Affliction(msg)
	local _, _, sPlayer, sType = string.find(msg, L["frostblast_trigger2"])
	if ( sPlayer and sType ) then
		if ( sPlayer == "You" and sType == "are" ) then
			self:Sync(syncName.frostblast.." "..UnitName("player"))
		else
			self:Sync(syncName.frostblast.." "..sPlayer)
		end
	end

	if string.find(msg, L["detonate_trigger"]) then
		local _,_, dplayer, dtype = string.find( msg, L["detonate_trigger"])
		if dplayer and dtype then
			if dplayer == L["you"] and dtype == L["are"] then
				dplayer = UnitName("player")
			end
			self:Sync(syncName.detonate .. " ".. dplayer)
		end
	end

	if self.db.profile.fbvolley and string.find(msg, L["frostbolt_volley_trigger"]) then
		local now = GetTime()

		-- only warn if there are more than 4 players hit by frostbolt volley within 4s
		if now - timeLastFrostboltVolley > 4 then
			timeLastFrostboltVolley = now
			numFrostboltVolleyHits = 1
		else
			numFrostboltVolleyHits = numFrostboltVolleyHits + 1
		end

		if numFrostboltVolleyHits == 4 then

			self:IntervalBar(L["frostbolt_volley"], timer.frostboltVolley[1], timer.frostboltVolley[2], icon.frostboltVolley)

			--[[self:CancelScheduledEvent("bwfbvolley30")
			self:CancelScheduledEvent("bwfbvolley45")
			self:CancelScheduledEvent("bwfbvolley60")
			self:ScheduleEvent("bwfbvolley30", self.Volley, 15, self)
			self:ScheduleEvent("bwfbvolley45", self.Volley, 30, self)
			self:ScheduleEvent("bwfbvolley60", self.Volley, 45, self) ]] -- why 3 times?

			self:CancelDelayedBar(L["frostbolt_volley"])
			self:DelayedIntervalBar(timer.frostboltVolley[2], L["frostbolt_volley"], timer.frostboltVolley[1], timer.frostboltVolley[2], icon.frostboltVolley)
		end
	end
end

function module:Event(msg)
	-- frost bolt
	if GetTime() < frostbolttime + timer.frostbolt then
		if string.find(msg, L["attack_trigger1"]) or string.find(msg, L["attack_trigger2"]) or string.find(msg, L["attack_trigger3"]) or string.find(msg, L["attack_trigger4"]) then
			self:RemoveBar(L["frostbolt_bar"])
			frostbolttime = 0
			self:Sync(syncName.frostboltOver)
		elseif string.find(msg, L["kick_trigger1"]) or string.find(msg, L["kick_trigger2"]) or string.find(msg, L["kick_trigger3"]) -- kicked
			or string.find(msg, L["pummel_trigger1"]) or string.find(msg, L["pummel_trigger2"]) or string.find(msg, L["pummel_trigger3"]) -- pummeled
			or string.find(msg, L["shieldbash_trigger1"]) or string.find(msg, L["shieldbash_trigger2"]) or string.find(msg, L["shieldbash_trigger3"]) -- shield bashed
			or string.find(msg, L["earthshock_trigger1"]) or string.find(msg, L["earthshock_trigger2"]) then -- earth shocked

			self:RemoveBar(L["frostbolt_bar"])
			frostbolttime = 0
			self:Sync(syncName.frostboltOver)
		end
	else
		frostbolttime = 0
	end
end

function module:FissureEvent(msg)
	if string.find(msg, L["fissure_trigger2"]) then
		self:Sync(syncName.fissure)
	end
end
------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.phase2 then
		self:Phase2()
	elseif sync == syncName.phase3 then
		self:Phase3()
	elseif sync == syncName.mindcontrol then
		self:MindControl()
	elseif sync == syncName.frostblast then
		self:FrostBlast(rest)
	elseif sync == syncName.detonate and rest then
		self:Detonate(rest)
	elseif sync == syncName.frostbolt then       -- changed from only frostbolt (thats only alert, if someone still wants to see the bar, it wouldnt work then)
		self:Frostbolt()
	elseif sync == syncName.frostboltOver then
		self:FrostboltOver()
	elseif sync == syncName.fissure then
		self:Fissure()
	elseif sync == syncName.abomination and rest then
		self:AbominationDies(rest)
	elseif sync == syncName.soulWeaver and rest then
		self:WeaverDies(rest)
	end
end


------------------------------
--      Sync Handlers	    --
------------------------------

function module:Phase2()
	self:Bar(L["phase2_bar"], timer.phase2, icon.phase2)
	self:DelayedMessage(timer.phase2, L["phase2_warning"], "Important")
	if self.db.profile.mc then
		self:DelayedIntervalBar(timer.phase2, L["mc_bar"], timer.firstMindcontrol[1], timer.firstMindcontrol[2], icon.mindcontrol, true, "Black")
		self:DelayedMessage(timer.firstMindcontrol[1]  + timer.phase2 - 5, L["phase2_mc_warning"], "Important")
	end
	if self.db.profile.detonate then
		self:DelayedBar(timer.phase2, L["detonate_possible_bar"], timer.firstDetonate, icon.detonate, true, "Gray")
		self:DelayedMessage(timer.firstDetonate + timer.phase2 - 5, L["phase2_detonate_warning"], "Important")
	end
	if self.db.profile.frostblast then
		self:DelayedBar(timer.phase2, L["frostblast_bar"], timer.firstFrostblast, icon.frostblast, true, "Blue")
		self:DelayedMessage(timer.firstFrostblast  + timer.phase2 - 5, L["phase2_frostblast_warning"], "Important")
	end

	if self.db.profile.fbvolley then
		self:DelayedBar(timer.phase2, L["frostbolt_volley"], timer.firstFrostboltVolley, icon.frostboltVolley)
	end

	-- master target should be automatically set, as soon as a raid assistant targets kel'thuzad
	self:KTM_Reset()

	-- proximity silent
	if self.db.profile.proximity then
		self:ScheduleEvent("bwShowProximity", self.Proximity, timer.phase2, self)
	end
	self:ScheduleEvent("bwShowFBFrame", function() BigWigsFrostBlast:FBShow() end, timer.phase2, self)

	local function removeP1Bars()
		self:RemoveBar(L["start_bar"])
		self:RemoveBar(string.format(L["add_bar2"], numWeavers, "织魂者"))
		self:RemoveBar(string.format(L["add_bar"], numAbominations, "无法阻止的憎恶"))
	end
	self:ScheduleEvent("bwKTremoveP1Bars", removeP1Bars, 1, self)

end

function module:Phase3()
	if self.db.profile.phase then
		self:Message(L["phase3_warning"], "Attention", nil, "Beware")
	end
	if self.db.profile.guardians then
		self:Bar(string.format(L["guardians_bar"],1), timer.firstGuardians, icon.guardians)
		self:ScheduleEvent("bwKTwsguardians", self.WarningGuardians, timer.firstGuardians, self)
		for i = 0,3 do
			self:ScheduleEvent("bwKTwsguardians"..i, self.WarningGuardians, timer.firstGuardians+timer.guardians*(i+1), self)
			self:DelayedBar(timer.firstGuardians+timer.guardians*i, string.format(L["guardians_bar"],i+2), timer.guardians, icon.guardians)
		end
	end
end

function module:WarningGuardians()
	self:WarningSign(icon.guardians, 3)
end

function module:MindControl()
	if self.db.profile.mc then
		self:Message(L["mc_warning"], "Urgent")
		self:IntervalBar(L["mc_bar"], timer.mindcontrol[1], timer.mindcontrol[2], icon.mindcontrol, true, "Black")
	end
	self:KTM_Reset()
end

function module:FrostBlast(name)
	if self.db.profile.frostblast then
		if GetTime()-self.lastFrostBlast>5 then
			self:RemoveWarningSign(icon.guardians, true)
			self:WarningSign(icon.frostblast, 5)
			self.lastFrostBlast=GetTime()
			self:Message(L["frostblast_warning"], "Attention")
			self:DelayedMessage(timer.frostblast[1] - 5, L["frostblast_soon_message"])
			self:IntervalBar(L["frostblast_bar"], timer.frostblast[1], timer.frostblast[2], icon.frostblast, true, "Blue")
		end
	end
	if name and name ~= "" then
		BigWigsFrostBlast:AddFrostBlastTarget(name)
	end
end

function module:Detonate(name)
	if name and self.db.profile.detonate then
		self:Message(string.format(L["detonate_warning"], name), "Attention")
		if self.db.profile.detonateicon then
			self:Icon(name)
		end
		if UnitName("player") == name then
			self:SendSay(L["detonate_onme"] .. UnitName("player") .. "!")
			self:WarningSign(icon.detonate, timer.detonate)
			self:Sound("Beware")
		end
		self:Bar(string.format(L["detonate_bar"], name), timer.detonate, icon.detonate)
		self:IntervalBar(L["detonate_possible_bar"], timer.nextDetonate[1], timer.nextDetonate[2], icon.detonate, true, "Gray")
	end
end

function module:Frostbolt()
	if self.db.profile.frostbolt or self.db.profile.frostboltbar then
		frostbolttime = GetTime()
		if self.db.profile.frostbolt then
			self:Message(L["frostbolt_warning"], "Personal")
		end
		if self.db.profile.frostboltbar then
			self:Bar(L["frostbolt_bar"], timer.frostbolt, icon.frostbolt, true, "blue")
		end
	end
end

function module:FrostboltOver()
	if self.db.profile.frostbolt then
		self:RemoveBar(L["frostbolt_bar"])
		frostbolttime = 0
	end
end

function module:Fissure()
	if self.db.profile.fissure then
		self:Message(L["fissure_warning"], "Urgent", true, "Alarm")
		self:IntervalBar(L["fissure_bar"], timer.fissure[1], timer.fissure[2], icon.fissure, true, "Red")
	end
end

function module:AbominationDies(name)
	if name and self.db.profile.addcount then
		self:RemoveBar(string.format(L["add_bar"], numAbominations, name))
		numAbominations = numAbominations + 1
		if numAbominations < 14 then
			self:Bar(string.format(L["add_bar"], numAbominations, name), (timePhase1Start + timer.phase1 - GetTime()), icon.abomination)
		end
	end
	self:KTM_Reset()
end

function module:WeaverDies(name)
	if name and self.db.profile.addcount then
		self:RemoveBar(string.format(L["add_bar2"], numWeavers, name))
		numWeavers = numWeavers + 1
		if numWeavers < 10 then
			self:Bar(string.format(L["add_bar2"], numWeavers, name), (timePhase1Start + timer.phase1 - GetTime()), icon.soulWeaver)
		end
	end
end