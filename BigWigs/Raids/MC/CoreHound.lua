
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Ancient Core Hound", "Molten Core")

module.revision = 20002
module.enabletrigger = module.translatedName
module.toggleoptions = {"bars"--[[, "bosskill"]]}

------------------------------
--      Locals 			    --
------------------------------

local timer = {
	earliestFirstDebuff = 7,
 	latestFirstDebuff = 12,
	debuff = 14,
}
local icon = {
	debuff = "Spell_Shadow_UnholyFrenzy"
}
local syncName = {
	debuff = "CoreHoundDebuff"..module.revision,
}


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
	Debuff = "随机减益影响",

	trigger1 = "受到了%s效果的影响",
	trigger2 = "施放失败。(.+)对此免疫。",
	trigger3 = "%s被抵抗了。",


	-- AceConsole strings
	cmd = "Corehound",

	bars_cmd = "bars",
	bars_name = "切换条",
	bars_desc = "切换为工具栏的计时器.",


} end )

L:RegisterTranslations("deDE", function() return {
	Debuff = "Debuff",

	trigger1 = "afflicted by %s",
	trigger2 = "%s fail(.+) immune.",
	trigger3 = "%s was resisted",


	-- AceConsole strings
	cmd = "Corehound",

	bars_cmd = "bars",
	bars_name = "Toggle bars",
	bars_desc = "Toggles showing bars for timers.",


} end )

local debuffTable = {
	"上古恐慌",
	"上古绝望",
	"大地践踏",
	"灼烧之焰",
	"枯萎热浪",
	"上古狂乱"
}

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Debuff")


	self:ThrottleSync(2, syncName.debuff)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = false
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.bars then
		self:IntervalBar(L["Debuff"], timer.earliestFirstDebuff, timer.latestFirstDebuff, icon.debuff)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()

end


------------------------------
--      Event Handlers	    --
------------------------------

function module:Debuff(msg)
	for k,v in pairs(debuffTable) do
		t1 = string.format(L["trigger1"], v)
		t2 = string.format(L["trigger2"], v)
		t3 = string.format(L["trigger3"], v)
		if ((string.find(msg, t1)) or (string.find(msg, t2)) or (string.find(msg, t3))) then
			self:RemoveBar(L["Debuff"])
 			--self:Sync(syncName.debuff)
		end
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync( sync, rest, nick )
	if sync == syncName.debuff then
		if self.db.profile.bars then
			self:Bar(L["Debuff"], timer.debuff, icon.debuff)
		end
	end
end
