--[[
by LYQ(Virose / MOUZU)
https://github.com/MOUZU/BigWigs

This is a small plugin which is inspired by later Bossmod versions which included a module to record
the time in bossfights and displays the time after kill and also a small comparison to your fastest kill.

DB format:
self.db.profile[bossName] = {
numBosskills,
fastestKill,
lastKill,
}
--]]

------------------------------
--      Are you local?      --
------------------------------
local c = {
	name        = "",
	startTime   = 0,
	lastKill    = 0,
}
local prefix = "|cf75DE52f[BigWigs]|r - ";

----------------------------
--      Localization      --
----------------------------
local L = AceLibrary("AceLocale-2.2"):new("BigWigsBossRecords")
L:RegisterTranslations("zhCN", function() return {
    BOSS_ENGAGED    = "%s 正在搞事. 祝你好运，玩得开心! :)",
    BOSS_DOWN		= "%s 击败 %s!",
    BOSS_DOWN_L		= "%s 击败 %s! 上一个是 %s 最快记录是 %s. 你有 %d 总的胜利.",
    BOSS_DOWN_NR	= "%s 击败 %s! 这是一个新记录! (旧纪录是 %s). 你有 %d 总的胜利.",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsBossRecords = BigWigs:NewModule("BossRecords")

------------------------------
--      Initialization      --
------------------------------

function BigWigsBossRecords:OnEnable()

end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsBossRecords:StartBossfight(module)
	-- checking if module is actually a bossmod
	if module and module.bossSync then
		c.name      = module:ToString()
		c.startTime = GetTime()

		DEFAULT_CHAT_FRAME:AddMessage(prefix .. string.format(L["BOSS_ENGAGED"], c.name))
	end
end

function BigWigsBossRecords:EndBossfight(module)
	if c.name == module:ToString() then
		local timeSpent = GetTime() - c.startTime
		c.lastKill      = GetTime()

		if self.db.profile[c.name] then
			if self.db.profile[c.name][2] > timeSpent then
				-- It's a new record!
				DEFAULT_CHAT_FRAME:AddMessage(prefix .. string.format(L["BOSS_DOWN_NR"], c.name, self:FormatTime(timeSpent), self:FormatTime(self.db.profile[c.name][2]), self.db.profile[c.name][1] + 1))
				self.db.profile[c.name][1] = self.db.profile[c.name][1] + 1;
				self.db.profile[c.name][2] = timeSpent
				self.db.profile[c.name][3] = timeSpent
			else
				-- We found data but it's not a new record
				DEFAULT_CHAT_FRAME:AddMessage(prefix .. string.format(L["BOSS_DOWN_L"], c.name, self:FormatTime(timeSpent), self:FormatTime(self.db.profile[c.name][3]), self:FormatTime(self.db.profile[c.name][2]), self.db.profile[c.name][1] + 1))
				self.db.profile[c.name][1] = self.db.profile[c.name][1] + 1;
				self.db.profile[c.name][3] = timeSpent
			end
		else
			-- It's our first kill
			DEFAULT_CHAT_FRAME:AddMessage(prefix .. string.format(L["BOSS_DOWN"], c.name, self:FormatTime(timeSpent)))
			self.db.profile[c.name] = {1, timeSpent, timeSpent}
		end
	end
end

function BigWigsBossRecords:FormatTime(time)
	if not type(time) == "number" then return end
	--[[
	input:  time in seconds
	output: time formated as string (eg. '2min 14s')
	--]]
	time = math.floor(time)

	if time < 60 then
		return tostring(time) .. "s";
	else
		local minutes = 0
		local seconds = 0
		while (time >= 60) do
			time    = time - 60;
			minutes = minutes + 1;
		end
		if time > 0 then
			seconds = time
		end
		return tostring(minutes) .. "min " .. tostring(seconds) .. "s";
	end
end
