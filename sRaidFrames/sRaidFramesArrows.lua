sRaidFramesArrows = sRaidFrames:NewModule("sRaidFramesArrows", "AceEvent-2.0")
sRaidFramesArrows.update = CreateFrame("Frame", "UpdateFrame")

sRaidFramesArrows.cx = 0
sRaidFramesArrows.cy = 0
sRaidFramesArrows.direction = 0
sRaidFramesArrows.ZoneUnit = {}


function sRaidFramesArrows:OnEnable()
	UpdateFrame:SetScript("OnUpdate", UpdateFrame_OnUpdate)
	self:RegisterEvent("SRF_ZoneCheck", self.ZoneCheck)
	self:ScheduleRepeatingEvent("SRFA_ZoneCheck", self.CheckRoster, 30, self)
	self.cx, self.cy = GetPlayerMapPosition("player")
end

function UpdateFrame_OnUpdate()
	if sRaidFrames.MapEnable then
		sRaidFramesArrows:CheckDist()
	end	
end

function sRaidFramesArrows:CheckRoster()
	if UnitInRaid("player") then
		for id = 1, MAX_RAID_MEMBERS do
			if UnitExists("raid" .. id) and not UnitIsUnit("player", "raid" .. id) then
				local name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML = GetRaidRosterInfo(id)
				if zone == GetRealZoneText() then
					self.ZoneUnit["raid"..id] = true
				else
					self.ZoneUnit["raid"..id] = false
				end
			end
		end
	end	
end

function sRaidFramesArrows:ZoneCheck()
	sRaidFramesArrows.cx, sRaidFramesArrows.cy = GetPlayerMapPosition("player")
	sRaidFramesArrows.direction = 0
	sRaidFramesArrows:CheckRoster()
	sRaidFrames:SetDegTex(true)
end

function sRaidFramesArrows:CalcDeg(oldx, oldy, newx, newy)
	local vecx, vecy = oldx - newx, oldy - newy
	local goaldeg = math.deg(math.atan2(vecx,-vecy))
	return goaldeg
end

function sRaidFramesArrows:CalcDegUnit(unit)
	local px1, py1 = GetPlayerMapPosition("player")
	local dx1, dy1 = GetPlayerMapPosition(unit)
	local vecx, vecy = dx1 - px1, dy1 - py1
	local goaldeg = math.deg(math.atan2(vecx,-vecy))
	return goaldeg
end

function sRaidFramesArrows:CheckDist()
	local tx, ty = GetPlayerMapPosition("player")
	local dx = self.cx - tx;
    local dy = self.cy - ty;

    if ((dx*dx + dy*dy)*1000000 >= 1) then
		self.direction = sRaidFramesArrows:CalcDeg(self.cx, self.cy, tx, ty)
		self.cx, self.cy = tx, ty
     end
end