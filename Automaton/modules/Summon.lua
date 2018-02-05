Automaton_Summon = Automaton:NewModule("自动接受召唤", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")
local module = Automaton_Summon
local abacus = AceLibrary("Abacus-2.0")
local seconds

--
--	NOTE TO TRANSLATORS:
--	Use koKR as a guide for what text strings need translations; other locales are incomplete!
--
local L
local locale = GetLocale()
if locale == "esES" then
	L = setmetatable({
		["Summon"] = "Invocaci\195\179n",
		["Options for accepting summons."] = "Opciones para aceptar invocaciones",
		["Enabled"] = "Activado",
		["Accept warlock or meeting stone summons automatically."] = "Acepta las invocaciones de brujos o piedras de encuentro de forma autom\195\161tica",
		["Delay"] = "Retraso",
		["With this option enabled, automatic summons are delayed."] = "Las invocaciones son retrasadas.",
		["Accepting summon in %s..."] = "Aceptando invocaci\195\179n en %s...",
		["Accepting summon..."] = "Aceptando invocaci\195\179n...",
	})
elseif locale == "koKR" then
	L = {
		["Summon"] = "자동 소환",
		["Options for accepting summons."] = "소환에 관한 옵션을 설정합니다",
		["Delay"] = "지연",
		["With this option enabled, automatic summons are delayed."] = "이 옵션 사용시, 자동 소환을 지연시킵니다.",
		["Delay Time"] = "지연 시간",
		["Set the time in seconds to delay automatic summon acceptance."] = "자동 소환을 수락할 시간을 설정합니다",
		["Combat Delay"] = "전투 지연",
		["If summoned while in combat, accept the summon after combat ends."] = "전투 종료후 소환을 받아드립니다.",
		["Combat Delay Time"] = "전투 지연 시간",
		["Set the time in seconds to delay automatic summon acceptance after combat ends."] = "전투 종료 후 자동 소환을 수락할 시간을 설정합니다.",
		["Be Quiet!"] = "알림 해제!",
		["Suppress chat frame output from the Summon module."] = "소환 모듈의 대화창 출력을 사용하지 않습니다.",
		["Cancelling summon..."] = "소환 취소...",
		["In combat! Accepting summon after combat ends..."] = "전투 중입니다! 전투 종료 후 소환을 수락합니다...",
		["Left combat. Accepting summon in %s..."] = "전투가 종료되었습니다. %s님의 소환을 수락합니다...",
		["Summon expired!"] = "소환 종료!",
		["Accepting summon in %s..."] = "%s님의 소환 수락...",
		["Accepting summon..."] = "소환 수락...",
	}
elseif locale == "zhTW" then
	L = {
		["Options for accepting summons."] = "自動接受召喚",
		["Delay Time"] = "延遲長度",
		["Set the time in seconds to delay automatic summon acceptance."] = "設置在自動接受召喚前所等待的秒數。",
		["Combat Delay"] = "戰鬥等待",
		["If summoned while in combat, accept the summon after combat ends."] = "如果正處於戰鬥中，那麼當戰鬥結束後再接受召喚。",
		["Combat Delay Time"] = "戰鬥後延遲長度",
		["Set the time in seconds to delay automatic summon acceptance after combat ends."] = "設置在戰鬥後自動接受召喚前所等待的秒數。",
		["Be Quiet!"] = "安靜！",
		["Suppress chat frame output from the Summon module."] = "暫停召喚模塊輸出信息到聊天框。",
		["Cancelling summon..."] = "召喚已取消……",
		["In combat! Accepting summon after combat ends..."] = "正在戰鬥中！當戰鬥結束後會接受召喚……",
		["Left combat. Accepting summon in %s..."] = "已離開戰鬥，%s秒後接受召喚……",
		["Summon expired!"] = "召喚已經過期！",
		
		["Summon"] = "召喚",
		["Options for accepting summons."] = "自動接受召喚",
		["Enabled"] = "啟用",
		["Accept warlock or meeting stone summons automatically."] = "自動接受召喚",
		["Delay"] = "延遲",
		["With this option enabled, automatic summons are delayed."] = "啟用後延遲%s自動接受召喚",
		["Accepting summon in %s..."] = "%s後自動接受召喚",
		["Accepting summon..."] = "接受召喚...",
	}
elseif locale == "zhCN" then
	L = {
		["Options for accepting summons."] = "自动接受来自友方的召唤",
		["Delay"] = "延时",
		["With this option enabled, automatic summons are delayed."] = "当本选项开启时，会自动延时一段时间再接受召唤。",
		["Delay Time"] = "延时长度",
		["Set the time in seconds to delay automatic summon acceptance."] = "设置在自动接受召唤前所等待的秒数。",
		["Combat Delay"] = "战斗等待",
		["If summoned while in combat, accept the summon after combat ends."] = "如果正处于战斗中，那么当战斗结束后再接受召唤。",
		["Combat Delay Time"] = "战斗后延时长度",
		["Set the time in seconds to delay automatic summon acceptance after combat ends."] = "设置在战斗后自动接受召唤前所等待的秒数。",
		["Be Quiet!"] = "安静！",
		["Suppress chat frame output from the Summon module."] = "暂停召唤模块输出信息到聊天框。",
		["Cancelling summon..."] = "召唤已取消……",
		["In combat! Accepting summon after combat ends..."] = "正在战斗中！当战斗结束后会接受召唤……",
		["Left combat. Accepting summon in %s..."] = "已离开战斗，%s秒后接受召唤……",
		["Summon expired!"] = "召唤已经过期！",
		["Accepting summon in %s..."] = "%s秒后自动接收召唤……",
		["Accepting summon..."] = "正在接受召唤……",
	}
end
L = setmetatable(L or {}, { __index = function(self, key) rawset(self, key, key) return key end })

module.description = L["Options for accepting summons."]
module.options = {
	delay = {
		type = "toggle",
		name = L["Delay"],
		desc = L["With this option enabled, automatic summons are delayed."],
		get = function() return module.db.profile.delay end,
		set = function(v) module.db.profile.delay = v end,
	},
	delayTime = {
		type = "range",
		name = L["Delay Time"],
		desc = L["Set the time in seconds to delay automatic summon acceptance."],
		get = function() return module.db.profile.delayTime end,
		set = function(v) module.db.profile.delayTime = v end,
		min = 5,
		max = 105,
		step = 1,
		bigStep = 5,
	},
	combatDelay = {
		type = "toggle",
		name = L["Combat Delay"],
		desc = L["If summoned while in combat, accept the summon after combat ends."],
		get = function() return module.db.profile.combatDelay end,
		set = function(v) module.db.profile.combatDelay = v end,
	},
	combatDelayTime = {
		type = "range",
		name = L["Combat Delay Time"],
		desc = L["Set the time in seconds to delay automatic summon acceptance after combat ends."],
		get = function() return module.db.profile.combatDelayTime end,
		set = function(v) module.db.profile.combatDelayTime = v end,
		min = 5,
		max = 30,
		step = 1,
		bigStep = 5,
	},
	quiet = {
		type = "toggle",
		name = L["Be Quiet!"],
		desc = L["Suppress chat frame output from the Summon module."],
		get = function() return module.db.profile.quiet end,
		set = function(v) module.db.profile.quiet = v end,
	},
}

function module:OnInitialize()
	self.db = Automaton:AcquireDBNamespace("Summon")
	Automaton:RegisterDefaults("Summon", "profile", {
		disabled = true,
		delay = true,
		delayTime = 100,
		combatDelay = true,
		combatDelayTime = 10,
		quiet = false,
	})
	Automaton:SetDisabledAsDefault(self, "Summon")
	self:RegisterOptions(self.options)
end

function module:OnEnable()
	self:RegisterEvent("CONFIRM_SUMMON")

	StaticPopupDialogs["CONFIRM_SUMMON"].OnHide = function()
		if Automaton_Summon:IsEventScheduled("Automaton_SummonAccept") then
			Automaton_Summon:CancelScheduledEvent("Automaton_SummonAccept")
			Automaton_Summon:Print(L["Cancelling summon..."])
		end
		if Automaton_Summon:IsEventScheduled("Automaton_SummonTimeout") then
			Automaton_Summon:CancelScheduledEvent("Automaton_SummonTimeout")
		end
	end
end

function module:OnDisable()
	StaticPopupDialogs["CONFIRM_SUMMON"].OnHide = nil
end

function module:Spam(text)
	if not module.db.profile.quiet then
		self:Print(text)
	end
end

function module:Confirm()
	if UnitAffectingCombat("player") then
		self:Spam(L["In combat! Accepting summon after combat ends..."])
		self:RegisterEvent("PLAYER_REGEN_ENABLED", "LeaveCombat")
		self:ScheduleEvent("Automaton_SummonTimeout", self.Timeout, GetSummonConfirmTimeLeft(), self)
		return
	end
	if self:IsEventScheduled("Automaton_SummonTimeout") then
		self:CancelScheduledEvent("Automaton_SummonTimeout")
	end
	ConfirmSummon()
	StaticPopup_Hide("CONFIRM_SUMMON")
end

function module:LeaveCombat()
	seconds = module.db.profile.combatDelayTime
	self:Spam(L["Left combat. Accepting summon in %s..."]:format(abacus:FormatDurationExtended(seconds):lower()))
	self:ScheduleEvent("Automaton_SummonAccept", self.Confirm, seconds, self)
	if self:IsEventRegistered("PLAYER_REGEN_ENABLED") then
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	end
end

function module:Timeout()
	self:Spam(L["Summon expired!"])
	if self:IsEventScheduled("Automaton_SummonAccept") then
		self:CancelScheduledEvent("Automaton_SummonAccept")
	end
	if self:IsEventRegistered("PLAYER_REGEN_ENABLED") then
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	end
end

function module:CONFIRM_SUMMON()
	if module.db.profile.delay and not self:IsEventScheduled("Automaton_SummonAccept") then
		seconds = module.db.profile.delayTime
		self:Spam(L["Accepting summon in %s..."]:format(abacus:FormatDurationExtended(seconds):lower()))
		self:ScheduleEvent("Automaton_SummonAccept", self.Confirm, seconds, self)
	elseif not self:IsEventScheduled("Automaton_SummonAccept") then
		self:Spam(L["Accepting summon..."])
		self:Confirm()
	end
end