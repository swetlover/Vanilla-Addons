
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Grobbulus", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	cmd = "Grobbulus",

	enrage_cmd = "enrage",
	enrage_name = "激怒警报",
	enrage_desc = "激怒的警报",

	youinjected_cmd = "youinjected",
	youinjected_name = "玩家变异注射警报",
	youinjected_desc = "警报当你中变异注射时",

	otherinjected_cmd = "otherinjected",
	otherinjected_name = "队友是变异注射警报",
	otherinjected_desc = "警报当队友中变异注射时",

	icon_cmd = "icon",
	icon_name = "放置团队标志",
	icon_desc = "中变异注射的人标记骷髅图标. (需要权限)",

	cloud_cmd = "cloud",
	cloud_name = "毒性云雾",
	cloud_desc = "毒性云雾警报",

	inject_trigger = "^([^%s]+)([^%s]+)变异注射效果的影响",
	inject_fade = "变异注射效果从你身上消失了。",

	you = "你",
	are = "受到了",

	startwarn = "葛罗巴斯来势汹汹, 12分钟后进入激怒!",
	enragebar = "激怒(伤害,攻速提高)",
	enrage10min = "激怒 10分钟",
	enrage5min = "激怒 5分钟",
	enrage1min = "激怒 1分钟",
	enrage30sec = "激怒 30秒",
	enrage10sec = "激怒 10秒",
	bomb_message_you = "你中了变异注射!",
	bomb_message_other = "%s 变异注射!",
	bomb_bar = "%s 变异注射",

	cloud_trigger = "葛罗巴斯施放了毒性云雾。",
	cloud_warn = "下个毒性云雾大约 15 秒!",
	cloud_bar = "毒性云雾(近战走位)",
	bomb_onme = "对+.施放了毒性云雾",

	slimespray_cmd = "slimespray",
	slimespray_name = "软泥喷射",
	slimespray_desc = "显示软泥喷射计时",

	slimeSpray_bar = "可能软泥喷射(锥形AOE自然)",
	slimeSpray_trigger = "软泥喷射",

} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20003 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"youinjected", "otherinjected", "slimespray",  "icon", "cloud", -1, "enrage", "bosskill"}

-- Proximity Plugin
-- module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
-- module.proximitySilent = false


-- locals
local timer = {
	enrage = 720,
	inject = 10,
	cloud = 15,
	firstSlimeSpray = {20, 30},
	slimeSpray = {30, 35},
}
local icon = {
	enrage = "INV_Shield_01",
	inject = "Spell_Shadow_CallofBone",
	cloud = "Ability_Creature_Disease_02",
	slimeSpray = "INV_Misc_Slime_01",
}
local syncName = {
	inject = "GrobbulusInject"..module.revision,
	cloud = "GrobbulusCloud"..module.revision,
	slimeSpray = "GrobbulusSlimeSpray"..module.revision,
}

local berserkannounced = nil


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "InjectEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "InjectEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "InjectEvent")
    self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CheckSpray")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "CheckSpray")

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")

	self:ThrottleSync(3, syncName.inject)
	self:ThrottleSync(5, syncName.cloud)
	self:ThrottleSync(10, syncName.slimeSpray)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.enrage then
		self:Message(L["startwarn"], "Attention")
		self:Bar(L["enragebar"], timer.enrage, icon.enrage)
		self:DelayedMessage(timer.enrage - 10 * 60, L["enrage10min"], "Attention")
		self:DelayedMessage(timer.enrage - 5 * 60, L["enrage5min"], "Urgent")
		self:DelayedMessage(timer.enrage - 1 * 50, L["enrage1min"], "Important")
		self:DelayedMessage(timer.enrage - 30, L["enrage30sec"], "Important")
		self:DelayedMessage(timer.enrage - 10, L["enrage10sec"], "Important")
	end
	if self.db.profile.slimespray then
		self:IntervalBar(L["slimeSpray_bar"], timer.firstSlimeSpray[1], timer.firstSlimeSpray[2], icon.slimeSpray)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF( msg )
	if string.find( msg, L["cloud_trigger"] ) then
		self:Sync(syncName.cloud)
	end
end

function module:InjectEvent( msg )
	local _, _, eplayer, etype = string.find(msg, L["inject_trigger"])
	if eplayer and etype then
		if eplayer == L["you"] and etype == L["are"] then
			eplayer = UnitName("player")
		end
		self:Sync(syncName.inject .. " " .. eplayer)
	end
end

function module:CheckSpray( msg )
	if string.find( msg, L["slimeSpray_trigger"]) then
		self:Sync(syncName.slimeSpray)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync( sync, rest, nick )
	if sync == syncName.inject and rest then
		self:Inject(rest)
	elseif sync == syncName.cloud then
		self:Cloud()
	elseif sync == syncName.slimeSpray then
		if self.db.profile.slimespray then
			self:RemoveBar(L["slimeSpray_bar"])
			self:IntervalBar(L["slimeSpray_bar"], timer.slimeSpray[1], timer.slimeSpray[2], icon.slimeSpray)
		end
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------
function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, L["inject_fade"]) then
		self:RemoveWarningSign(icon.inject)
	end
end

function module:Inject(player)
	if player then
		if self.db.profile.youinjected and player == UnitName("player") then
			self:Message(L["bomb_message_you"], "Personal", true, "Beware")
			self:WarningSign(icon.inject, timer.inject)

			self:Message(string.format(L["bomb_message_other"], player), "Attention", nil, nil, true)
			self:Bar(string.format(L["bomb_bar"], player), timer.inject, icon.inject)
		elseif self.db.profile.otherinjected then
			self:Message(string.format(L["bomb_message_other"], player), "Attention")
			--self:TriggerEvent("BigWigs_SendTell", player, L["bomb_message_you"]) -- can cause whisper bug on nefarian
			self:Bar(string.format(L["bomb_bar"], player), timer.inject, icon.inject)
		end
		if self.db.profile.icon then
			self:Icon(player)
		end
	end
end

function module:Cloud()
	if self.db.profile.cloud then
		self:Message(L["cloud_warn"], "Urgent")
		self:Bar(L["cloud_bar"], timer.cloud, icon.cloud)
	end
end
