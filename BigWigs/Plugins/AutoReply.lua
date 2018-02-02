--[[
by LYQ(Virose / MOUZU)
https://github.com/MOUZU/BigWigs

This is a small plugin which is inspired by later Bossmod versions which included a module to reply
to whispers incoming during encounters.
It can be used to inform that the player can not reply at the moment or to get a status of the
current fight.
--]]

------------------------------
--      Are you local?      --
------------------------------
local L = AceLibrary("AceLocale-2.2"):new("BigWigsAutoReply")
local c = {
	replied = {
	-- this is a list of players which we've already informed once to prevent spam
	}
}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("zhCN", function() return {
    
    statusRequest_cmd = "statusRequest",
	statusRequest_name = "状态请求",
	statusRequest_desc = "允许查询BOSS状态",
            
    healthStatus_cmd = "healthStatus",
	healthStatus_name = "血量状况",
	healthStatus_desc = "让玩家知道当前BOSS 血量",
            
    playersAlive_cmd = "playersAlive",
	playersAlive_name = "玩家还活着",
	playersAlive_desc = "让玩家知道多少团员活着",

} end )


----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsAutoReply = BigWigs:NewModule("AutoReply")
BigWigsAutoReply.toggleoptions = { "statusRequest", "healthStatus", "playersAlive" }

------------------------------
--      Initialization      --
------------------------------

function BigWigsAutoReply:OnEnable()
	self:RegisterEvent("CHAT_MSG_WHISPER")
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsAutoReply:CHAT_MSG_WHISPER()
	-- arg1 = msg / arg2 = unitName
	if arg1 == "status" and self.db.profile.statusRequest then
	-- if we allow others to request our status

	-- send whisper
	else
		for i=1, table.getn(c.replied) do
			if c.replied[i] == arg2 then return end
		end

		-- send whisper
		tinsert(c.replied, arg2)
	end
end

function BigWigsAutoReply:EndBossfight()
	-- send whisper that the fight ended to c.replied and then reset c.replied

	-- reset replied list
	for i=1, table.getn(c.replied) do
		c.replied[i] = nil  -- if I make this, does tinsert overwrite those again?
	end
end
