Automaton_Rez = Automaton:NewModule("自动复活", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")
local module = Automaton_Rez
local abacus = AceLibrary("Abacus-2.0")

--
--	NOTE TO TRANSLATORS:
--	Use koKR as a guide for what text strings need translations; other locales are incomplete!
--
local L
local locale = GetLocale()
if locale == "esES" then
	L = {
		["Rez"] = "Resucitar",
		["Options for accepting resurrection requests."] = "Opciones para aceptar las ofertas de resurrecci\195\179n",
		["Enabled"] = "Activado",
		["Accept resurrection requests. If the persist option is Off, AutoRez will disable itself after the first resurrection."] = "Acepta las ofertas de resurrecci\195\179n. Si la opci\195\179n Persistir est\195\161 Desactivada se desactivar\195\161 la resurrecci\195\179n autom\195\161tica tras la primera resurrecci\195\179n",
		["Persist"] = "Persistir",
		["With this option enabled, AutoRez will persist for every resurrection request."] = "La resurrecci\195\179n autom\195\161tica seguir\195\161 activa para todas las ofertas de resurrecci\195\179n",
		["Delay"] = "Retraso",
		["With this option enabled, automatic resurrection accept is delayed."] = "La aceptaci\195\179n de la resurrecci\195\179n autom\195\161tica se retrasa.",
		["Accepting resurrect in %s..."] = "Aceptando resurrecci\195\179n en %s...",
	}
elseif locale == "koKR" then
	L = {
		["Rez"] = "자동 부활",
		["Options for accepting resurrection requests."] = "부활에 관한 옵션을 설정합니다.",
		["Persist"] = "지속",
		["With this option enabled, AutoRez will persist for every resurrection request."] = "이 옵션 사용시, AutoRez은 모든 부활 요구가 지속됩니다.",
		["Delay"] = "지연",
		["With this option enabled, automatic resurrection accept is delayed."] = "이 옵션 사용시, 자동 부활 수락을 동안 지연시킵니다.",
		["Delay Time"] = "지연 시간",
		["Set the time, in seconds, to wait before automatically accepting resurrections."] = "자동 부활을 수락할 시간을 설정합니다.",
		["Ignore Battle Resurrections"] = "전투 부활 무시",
		["With this option enabled, resurrections from druids will not be automatically accepted."] = "이 옵션 사용시, 드루이드의 부활을 자동으로 수락하지 않습니다.",
		["Accepting resurrect in %s..."] = "부활 수락 %s",
	}
elseif locale == "zhTW" then
	L = {
		["Rez"] = "自動復活",
		["Options for accepting resurrection requests."] = "自動接受復活",
		["Enabled"] = "啟用",
		["Accept resurrection requests. If the persist option is Off, AutoRez will disable itself after the first resurrection."] = "自動接受復活",
		["Persist"] = "持續",
		["With this option enabled, AutoRez will persist for every resurrection request."] = "此項開啟將自動接受復活",
		["Delay"] = "延遲",
		["With this option enabled, automatic resurrection accept is delayed."] = "當提示出現後延遲後自動接受復活",
		["Accepting resurrect in %s..."] = "%s後自動接受復活",
		["Delay Time"] = "延遲時間",
		["Set the time, in seconds, to wait before automatically accepting resurrections."] = "設置在自動復活前所等待的秒數。",
		["Ignore Battle Resurrections"] = "忽略戰鬥復活",
	}
elseif locale == "zhCN" then
	L = {
		["Rez"] = "自动复活",
		["Options for accepting resurrection requests."] = "自动接受复活（若想副本内接受自动接受复活请勾选保持）",
		["Persist"] = "保持",
		["With this option enabled, AutoRez will persist for every resurrection request."] = "当本选项开启时，本模块将自动接受所有的复活请求。",
		["Delay"] = "延时",
		["With this option enabled, automatic resurrection accept is delayed."] = "当本选项开启时，会自动延时一段时间再接受复活。",
		["Delay Time"] = "延时长度",
		["Set the time, in seconds, to wait before automatically accepting resurrections."] = "设置在自动复活前所等待的秒数。",
		["Ignore Battle Resurrections"] = "忽略战斗复活",
		["With this option enabled, resurrections from druids will not be automatically accepted."] = "当本选项开启时，来自于德鲁伊的复活将不会被自动接受。",
		["Accepting resurrect in %s..."] = "%s秒后自动接收复活……",
	}
end
L = setmetatable(L or {}, { __index = function(self, key) rawset(self, key, key) return key end })

module.description = L["Options for accepting resurrection requests."]
module.options = {
	persist = {
		name = L["Persist"],
		desc = L["With this option enabled, AutoRez will persist for every resurrection request."],
		type = "toggle",
		get = function() return module.db.profile.persist end,
		set = function(v) module.db.profile.persist = v end,
	},
	delay = {
		name = L["Delay"],
		desc = L["With this option enabled, automatic resurrection accept is delayed."],
		type = "toggle",
		get = function() return module.db.profile.delay end,
		set = function(v) module.db.profile.delay = v end,
	},
	delayTime = {
		name = L["Delay Time"],
		desc = L["Set the time, in seconds, to wait before automatically accepting resurrections."],
		get = function() return module.db.profile.delayTime end,
		set = function(v) module.db.profile.delayTime = v end,
		type = "range",
		min = 5,
		max = 105,
	},
	ignoreBattleRes = {
		name = L["Ignore Battle Resurrections"],
		desc = L["With this option enabled, resurrections from druids will not be automatically accepted."],
		type = "toggle",
		get = function() return module.db.profile.ignoreBattleRes end,
		set = function(v) module.db.profile.ignoreBattleRes = v end,
	}
}

function module:OnInitialize()
    self.db = Automaton:AcquireDBNamespace("Rez")
    Automaton:RegisterDefaults("Rez", "profile", {
		disabled = true,
        persist = false,
        delay = false,
        delayTime = 100,
        ignoreBattleRes = true,
    })
	Automaton:SetDisabledAsDefault(self, "Rez")
	self:RegisterOptions(self.options)
end

function module:OnEnable()
	self:RegisterEvent("RESURRECT_REQUEST")

	StaticPopupDialogs["RESURRECT_NO_SICKNESS"].OnCancel = function()
		if Automaton_Rez:IsEventScheduled("Automaton_Rez") then
			Automaton_Rez:CancelScheduledEvent("Automaton_Rez")
		end
		DeclineResurrect()
		if UnitIsDead("player") then
			StaticPopup_Show("DEATH")
		end
	end
end

function Automaton_Rez:OnDisable()
	StaticPopupDialogs["RESURRECT_NO_SICKNESS"].OnCancel = function()
		DeclineResurrect()
		if UnitIsDead("player") then
			StaticPopup_Show("DEATH")
		end
	end
end

local n, class, seconds
function module:RESURRECT_REQUEST(source)
	if module.db.profile.ignoreBattleRes then
		n = GetNumRaidMembers()
		if n > 0 then
			for i = 1, n do
				if UnitName("raid"..i) == source then
					_, class = UnitClass("raid"..i)
					if class == "DRUID" then
						self:Print(L["%s is a druid! Not auto-accepting this resurrection."]:format(source))
						return
					end
					break
				end
			end
		else
			n = GetNumPartyMembers()
			if n > 0 then
				for i = 1, n do
					if UnitName("party"..i) == source then
						_, class = UnitClass("party"..i)
						if class == "DRUID" then
							self:Print(L["%s is a druid! Not auto-accepting this resurrection."]:format(source))
							return
						end
						break
					end
				end
			end
		end
	end
	if module.db.profile.delay and not self:IsEventScheduled("module") then
		seconds = module.db.profile.delayTime
		self:Print(L["Accepting resurrect in %s..."]:format(abacus:FormatDurationExtended(seconds):lower()))
		self:ScheduleEvent("module", function()
			AcceptResurrect()
			StaticPopup_Hide("RESURRECT_NO_SICKNESS")
		end, seconds)
	elseif not self:IsEventScheduled("module")  and (IsInInstance() == nil) then
		AcceptResurrect()
		StaticPopup_Hide("RESURRECT_NO_SICKNESS")
	end
	if not module.db.profile.persist then
		Automaton:ToggleModuleActive("Rez",false)
	end
end