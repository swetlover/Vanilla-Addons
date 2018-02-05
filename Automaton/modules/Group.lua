local L = AceLibrary("AceLocale-2.2"):new("Automaton_Group")
Automaton_Group = Automaton:NewModule("组队邀请设置", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")
local module = Automaton_Group

L:RegisterTranslations("enUS", function() return {
    ["Group"] = true,
	["Options for accepting or declining group invites."] = true,
	["Enabled"] = true,
    ["Accepts party invites from your friends or guild members automatically."] = true,
    ["Who"] = true,
    ["Perform a /who on incoming party invites from unknown sources."] = true,
    ["Decline"] = true,
    ["Decline party invites from unknown sources."] = true,
	["Delay"] = true,
	["With this option enabled, automatic joining or declining is delayed for 55 seconds."] = true,
    ["Declining party invitation..."] = true,
	["Accepting invite in 55..."] = true,
	["Declining invite in 55..."] = true,
} end)

L:RegisterTranslations("esES", function() return {
    ["Group"] = "Grupo",
	["Options for accepting or declining group invites."] = "Opciones para aceptar o declinar invitaciones a grupos",
	["Enabled"] = "Activado",
    ["Accepts party invites from your friends or guild members automatically."] = "Acepta invtaciones para grupo de tus amigos o miembros de hermandad autom\195\161ticamente",
    ["Who"] = "Qui\195\169n",
    ["Perform a /who on incoming party invites from unknown sources."] = "Realiza un /quien al que te invita si no lo conoces",
    ["Decline"] = "Declinar",
    ["Decline party invites from unknown sources."] = "Declina una invitaci\195\179n a grupo de personas que no conoces",
	["Delay"] = "Retraso",
	["With this option enabled, automatic joining or declining is delayed for 55 seconds."] = "Con esta opci\195\179n activada la uni\195\179n o declinaci\195\179n autom\195\161tica a grupos es retrasada 55 segundos",
    ["Declining party invitation..."] = "Declinando invitaci\195\179n a grupo...",
	["Accepting invite in 55..."] = "Aceptando invitaci\195\179n en 55seg...",
	["Declining invite in 55..."] = "Declinando invitaci\195\179n en 55seg...",
} end)

L:RegisterTranslations("koKR", function() return {
    ["Group"] = "그룹 초대",
	["Options for accepting or declining group invites."] = "그룹 초대에 관한 옵션을 설정합니다.",
	["Enabled"] = "활성화",
    ["Accepts party invites from your friends or guild members automatically."] = "파티 초대자가 친구 목록에 등록되어 있거나 길드 멤버일때 자동으로 수락합니다.",
    ["Who"] = "누구",
    ["Perform a /who on incoming party invites from unknown sources."] = "알수없는 플레이어로 부터 파티 초대시 '/누구'를 실행합니다.",
    ["Decline"] = "거절",
    ["Decline party invites from unknown sources."] = "알수없는 플레이어로 부터 파티 초대시 거절합니다.",
	["Delay"] = "지연",
	["With this option enabled, automatic joining or declining is delayed for 55 seconds."] = "이 옵션이 활성화시, 자동 참가나 거절하는 것이 55초 동안 지연시킵니다.",
    ["Declining party invitation..."] = "파티 초대 거절...",
	["Accepting invite in 55..."] = "초대 수락 55...",
	["Declining invite in 55..."] = "초대 거절 55...",
} end)

L:RegisterTranslations("zhTW", function() return {
    ["Group"] = "自動組隊",
	["Options for accepting or declining group invites."] = "自動接受和拒絕組隊邀請",
	["Enabled"] = "允許",
    ["Accepts party invites from your friends or guild members automatically."] = "自動接受好友或公會成員的組隊邀請",
    ["Who"] = "自動查詢",
    ["Perform a /who on incoming party invites from unknown sources."] = "自動使用 /who查詢發出邀請方的詳細信息",
    ["Decline"] = "拒絕",
    ["Decline party invites from unknown sources."] = "拒絕未知來源的邀請",
	["Delay"] = "延遲",
	["With this option enabled, automatic joining or declining is delayed for 55 seconds."] = "啟用後延遲55秒後進入戰場",
    ["Declining party invitation..."] = "自動拒絕組隊未知邀請...",
	["Accepting invite in 55..."] = "55秒後接受邀請",
	["Declining invite in 55..."] = "55秒後拒絕邀請",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Options for accepting or declining group invites."] = "允许自动接受或者拒绝组队邀请",
	["Enabled"] = "启用",
    ["Accepts party invites from your friends or guild members automatically."] = "自动接受好友或者公会会员组队邀请",
    ["Who"] = "自动查询",
    ["Perform a /who on incoming party invites from unknown sources."] = "使用/who命令自动查询是谁在邀请你组队",
    ["Decline"] = "拒绝",
    ["Decline party invites from unknown sources."] = "拒绝未知人员的组队邀请",
	["Delay"] = "延迟",
	["With this option enabled, automatic joining or declining is delayed for 55 seconds."] = "当开启这个选项，55秒后自动接受或者拒绝组队邀请。",
    ["Declining party invitation..."] = "组队邀请已拒绝……",
	["Accepting invite in 55..."] = "55秒后接受组队邀请……",
	["Declining invite in 55..."] = "55秒后拒绝组队邀请……",
} end)

Automaton_Group.description = L["Options for accepting or declining group invites."]
Automaton_Group.options = {
	who = {
		type = 'toggle',
		name = L["Who"],
		desc = L["Perform a /who on incoming party invites from unknown sources."],
		get = function() return module.db.profile.who end,
		set = function(v) module.db.profile.who = v end,
	},
	decline = {
		type = 'toggle',
		name = L["Decline"],
		desc = L["Decline party invites from unknown sources."],
		get = function() return module.db.profile.decline end,
		set = function(v) module.db.profile.decline = v end,
	},
	delay = {
		type = 'toggle',
		name = L["Delay"],
		desc = L["With this option enabled, automatic joining or declining is delayed for 55 seconds."],
		get = function() return module.db.profile.delay end,
		set = function(v) module.db.profile.delay = v end,
	},
}

function Automaton_Group:OnInitialize()
	self.db = Automaton:AcquireDBNamespace("Group")
	Automaton:RegisterDefaults('Group', 'profile', {
		who = true,
		decline = false,
		delay = false,
	})
	self:RegisterOptions(self.options)
end

function Automaton_Group:OnEnable()
	self:RegisterEvent("PARTY_INVITE_REQUEST")
end

function Automaton_Group:ProcessInvite(accept)
	if accept then
		self:Debug("Accepting an invite")
		AcceptGroup()
	else
		self:Print(L["Declining party invitation..."])
		DeclineGroup()	
	end
	StaticPopup_Hide("PARTY_INVITE")
end

function Automaton_Group:PARTY_INVITE_REQUEST()
	self:Debug("Processing invite...")
	local from = arg1
	local acceptFrom = {}
	GuildRoster()
	
	for i=1,GetNumGuildMembers() do
		local name = GetGuildRosterInfo(i)
		tinsert(acceptFrom,name)
	end

	for i=1,GetNumFriends() do
		local name = GetFriendInfo(i)
		tinsert(acceptFrom,name)
	end

	if foreachi(acceptFrom, function(i,v) if v==from then return true end end) then
		if self.db.profile.delay then
			self:Print(L["Accepting invite in 55..."])
			self:ScheduleEvent("Automaton_GroupAccept", self.ProcessInvite, 55, self, true)
		else
			self:ProcessInvite(true)
		end
		return
	end
	
	if self.db.profile.decline then
		if self.db.profile.delay then
			self:Print(L["Declining invite in 55..."])
			self:ScheduleEvent("Automaton_GroupDecline", self.ProcessInvite, 55, self, false)
		else
			self:ProcessInvite(false)
		end
	elseif self.db.profile.who then
		SendWho("n-\""..from.."\"")
	end
end