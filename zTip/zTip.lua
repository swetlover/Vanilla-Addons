--[[
	zTip by Zero Fire from Beijing, China
	思路来源于TinyTip(Thrae)，参考了★捣蛋精灵★的汉化
	后代码有九成多被重新实现，遂更名为zTip
--]]

-- 以下为参数设置

local zAnchor = 3			-- Default: 3
-- [nil 或 false 使用系统默认位置(屏幕右下角)]
-- [1为人物信息跟随鼠标，非人物（按钮之类）使用默认位置（屏幕右下角）]
-- [2为屏幕上方，注意用zOffsetX和zOffsetY调整相对位置，非人物为默认位置（屏幕右下角）]
-- [3为全部跟随鼠标，非人物(按钮之类)为对象右上]
-- [4为屏幕上方，注意用zOffsetX和zOffsetY调整相对位置，非人物为对象右上]
-- [5为全部跟随鼠标，并向上延展，要正上方，将Offset调为0,0即可]

local zOffsetX, zOffsetY = 30,30	-- 位置偏移值（系统位置无效） Default: 30,30

local zOrigPosX, zOrigPosY = 100, 150 -- 系统默认位置的偏移值，要使用游戏默认设置为: nil, nil

local zScale = nil					-- 提示缩放 Default: nil 取值：0~N.x		Game's Default: 1.0

local zGuildColorAlpha = 0.86		-- 公会名和姓名的明暗度调整 Default: 0.86 暗一点（不可超过1！）

local zFade = nil					-- 是否渐隐 Default: nil

local zDisplayPvPRank = 3			-- 显示军衔[nil 不显示 1显示文字，2显示图标 3显示文字和图标] Default: 3

local zShowIsPlayer = nil			-- 是否在等级行显示“（玩家）”字样	Default: nil

local zDisplayFaction = true		-- 是否显示NPC声望等级(注意如果声望面板中折叠了该阵营有可能无法区分崇敬和崇拜！)。

local zPlayerServer = true			-- 是否显示玩家所属服务器. Default: true

local zTargetOfMouse = true		-- 显示对象的目标. Default: true

-- 各个职业颜色列表
local zRAID_CLASS_COLORS = {
	["HUNTER"] = { r = 0, g = 1, b = 0 },
	["WARLOCK"] = { r = 0.6, g = 0.33, b = 1 },
	["PRIEST"] = { r = 1.0, g = 1.0, b = 1.0 },
	["PALADIN"] = { r = 1, g = 0.5, b = 0.8 },
	["MAGE"] = { r = 0.0, g = 1, b = 1 },
	["ROGUE"] = { r = 1, g = 1, b = 0.0 },
	["DRUID"] = { r = 1.0, g = 0.5, b = 0.0 },
	["SHAMAN"] = { r = 0.0, g = 0.44, b = 0.87 },
	["WARRIOR"] = { r = 0.85, g = 0.61, b = 0.43 },
}

--------------------------------------------------------------------
-- Don't change these locals here, change them below.
local locRare
local locTargeting
local locYOU
local locSelf
local locNotSpecified

-- Localization
local tmp = GetLocale()
if tmp == "zhCN" then
	locRare			= "稀有"
	locTargeting	= "目标"
	locYOU			= "> 你 <"
	locSelf			= "自己"
	locNotSpecified	= "未指定"
	locSpecified	= "变异生物"
elseif tmp == "zhTW" then
	locRare			= "稀有"
	locTargeting	= "目標"
	locYOU			= "> 你 <"
	locSelf			= "自己"
	locNotSpecified	= "未指定" -- 也許不正確？
	locSpecified	= "變異生物"
elseif tmp == "enUS" then
	locRare			= "Rare"
	locTargeting	= "Targeting"
	locYOU			= ">> U <<"
	locSelf			= "Self"
	locNotSpecified	= "Not specified" -- maybe not correct
	locSpecified	= "Freak"
end
--[[
	file locals
--]]
-- translate a color object into hex color string
local function zGetHexColor(color)
	if not color then
		return "FFFFFF"
	else
		return string.format("%2x%2x%2x",color.r*255,color.g*255,color.b*255)
	end
end
local function zGetUnitFaction(unit)
	local id = UnitReaction(unit, "player")
	if not id then return "" end
	if id > 6 then
		local label
		for i = GameTooltip:NumLines(), 1, -1 do
			label = getglobal("GameTooltipTextLeft"..i):GetText()
			if label and label ~= PVP_ENABLED then break end
		end
		local name, standingId, isHeader
		for i = 1, GetNumFactions() do
			name, _, standingId, _, _, _, _,_, isHeader, _, _ = GetFactionInfo(i)
			if isHeader == nil and name == label then
				id = standingId
				break
			end
		end
	end
	local ret = GetText("FACTION_STANDING_LABEL"..id, UnitSex("player"))
	if id == 5 then ret = format("|cff33CC33%s|r", ret)
	elseif id == 6 then ret = format("|cff33CCCC%s|r", ret)
	elseif id == 7 then ret = format("|cffFF6633%s|r", ret)
	elseif id == 8 then ret = format("|cffDD33DD%s|r", ret) end

	return ret
end
--[[ before show ]]
local RankIcon, targetlinenum
local function zTipOnShow()
	local found
	local trueNum = GameTooltip:NumLines()
	for i = 3, trueNum do
		--~ 删除PVP字符
		if getglobal("GameTooltipTextLeft"..i):GetText() == PVP_ENABLED then
			getglobal("GameTooltipTextLeft"..i):SetText()
			found = true
		end
	end
	
	if not zTargetOfMouse then return end
	targetlinenum = trueNum
	if not found then
		GameTooltip:AddLine("zTip -- target line")
		targetlinenum = targetlinenum + 1
	end
	tmp = getglobal("GameTooltipTextLeft"..targetlinenum)
	if tmp then
		tmp:SetText()
	else
		targetlinenum = nil
	end
end
--[[
	tip format
--]]
local tmp2, tip, text, levelline		-- var continually used, local in file
function zTipFormat(unit)
--[[
	local values and initials
--]]
	local r, g, b
	local bplayer = UnitIsPlayer(unit)
	
	--~ 尸体，排除猎人假死
	local bdead = UnitHealth(unit) <= 0 and (not bplayer or UnitIsDeadOrGhost(unit))
	local tapped = UnitIsTapped(unit) and (not UnitIsTappedByPlayer(unit))
	
	-- 1 憎恶 2 敌对 3 不善 4 中立 5 友好 6 尊敬 7 崇拜 8 ？？
	local reaction = UnitReaction(unit, "player")
	
--[[
	New Way
--]]
	tip, text, levelline, tmp, tmp2 = nil
	
	--[[ Serch and Delete ]]
	for i = 2, GameTooltip:NumLines() do
		text = getglobal(GameTooltip:GetName().."TextLeft"..i)
		tip = text:GetText()
		if tip then
			--~ 查找等级行
			if string.find(tip, LEVEL) then
				if not levelline then
					levelline = i
				end
			-- 能否驯服
			elseif tip == TAMEABLE then
				text:SetText( format("|cff00FF00%s|r", tip) )
			elseif tip == NOT_TAMEABLE then
				text:SetText( format("|cffFF6035%s|r", tip) )
			end
		end
	end
	
	--[[ Level Line Rewrite ]]
	if levelline then
		-- level, and corpse if dead
		tmp = UnitLevel(unit)
		tmp2 = ""
		if bdead then
			if tmp > 0 then
				tmp2 = format("|cff888888%d %s|r", tmp, CORPSE)
			else
				tmp2 = format("|cff888888?? %s|r", CORPSE)
			end
		elseif ( tmp > 0 ) then
			-- Color level number
			if UnitCanAttack("player", unit) or UnitCanAttack(unit, "player") then
				tmp2 = format("|cff%s%d|r",zGetHexColor(GetDifficultyColor(tmp)),tmp)
			else
				-- normal color
				tmp2 = format("|cff3377CC%d|r",tmp)
			end
		else
			-- Target is too high level to tell
			tmp2 = "|cffFF0000 ??|r"
		end
		
		-- race, class/ creature type/ creature family(pet)
		if UnitRace(unit) and bplayer then
			--race, it is a player
			if UnitFactionGroup(unit) == UnitFactionGroup("player") then
				tmp = "00FF33"
			else
				tmp = "FF3300"  -- 敌对阵营种族为暗红
			end
			tmp2 = format("%s |cff%s%s|r", tmp2, tmp, UnitRace(unit))
			-- class
			_, tmp = UnitClass(unit)
			tmp = zGetHexColor(zRAID_CLASS_COLORS[(tmp or "")])
			tmp2 = format("%s |cff%s%s|r", tmp2, tmp, UnitClass(unit))
		elseif UnitPlayerControlled(unit) then
			--creature family, its is a pet
			-- 非战斗宠没有物种的用类型
			tmp2 = format("%s %s ",tmp2,(UnitCreatureFamily(unit) or UnitCreatureType(unit) or "") )
		elseif UnitCreatureType(unit) then
			--creature type, it is a mob or npc
			if zDisplayFaction and reaction and reaction > 4 then
				tmp2 = format("%s |cffFFFFFF%s|r %s ", tmp2, UnitCreatureType(unit), zGetUnitFaction(unit))
			elseif UnitCreatureType(unit) == locNotSpecified then
				tmp2 = format("%s %s ", tmp2, locSpecified)
			else
				tmp2 = format("%s %s ", tmp2, UnitCreatureType(unit))
			end
		else
			tmp2 = format("%s %s ",tmp2,UKNOWNBEING)
		end
		tip = tmp2
		
		-- special info
		tmp = nil
		tmp2 = ""
		if bplayer then
			if zShowIsPlayer then
				tmp2 = format("(%s)",PLAYER)
			end
		elseif not UnitPlayerControlled(unit) then
			tmp = UnitClassification(unit) -- Elite status
			if tmp and tmp ~= "normal" and UnitHealth(unit) > 0 then
				if tmp == "elite" then
					tmp2 = format("|cffFFFF33(%s)|r", ELITE)
				elseif tmp == "worldboss" then
					tmp2 = format("|cffFF0000(%s)|r", BOSS)
				elseif tmp == "rare" then
					tmp2 = format("|cffFF66FF(%s)|r", locRare)
				elseif tmp == "rareelite" then
					tmp2 = format("|cffFFAAFF(%s %s)|r", locRare, ELITE)
				else
					tmp2 = format("(%s)", tmp) -- unknown type
				end
			end
		end
		getglobal("GameTooltipTextLeft"..levelline):SetText( tip..tmp2 )
	end
	
	--[[ First Line ]]
	text = GameTooltipTextLeft1
	tip = text:GetText()
	if bplayer then
		-- 军衔
		if not zDisplayPvPRank then
			text:SetText( UnitName(unit) )
		elseif zDisplayPvPRank > 0 then
			tmp = UnitPVPRank(unit)
			if tmp > 0 then
				tmp, tmp2 = GetPVPRankInfo(tmp,unit)
				if zDisplayPvPRank == 1 then
					text:SetText( UnitName(unit).." |cffCCCC33"..tmp.."|r")
				else
					if zDisplayPvPRank == 2 then
						text:SetText( "    "..UnitName(unit))
					elseif zDisplayPvPRank == 3 then
						text:SetText( "    "..UnitName(unit).." |cffCCCC33"..tmp.."|r")
					end
					RankIcon:SetTexture(format("%s%02d","Interface\\PvPRankBadges\\PvPRank", tmp2))
					if tmp2 > 5 then RankIcon:SetAlpha(1) else RankIcon:SetAlpha(0.66) end
					RankIcon:Show()
				end
			end
		end
	end
	
	--[[ Second Line Rewrite / Insert ]]
	tip = nil
	if bplayer then
		-- 工会
		tmp2 = GetGuildInfo(unit)
		if tmp2 then
			tip = "<"..tmp2..">"
		end
		-- 服务器
		_, tmp = UnitName(unit)
		if zPlayerServer and (tmp or tip) then
			if tmp and tip then
				tmp2 = " @ "
			else
				tmp2 = ""
			end
			tip = format("%s|cff00EEEE%s%s|r", tip or "", tmp2, tmp or "")
		end
	end
	if tip then
		tmp = GameTooltip:NumLines()
		GameTooltip:AddLine("zTip -- this is Add Line")
		for i = tmp, 2, -1 do
			text = getglobal("GameTooltipTextLeft"..i+1)
			text:SetText(getglobal("GameTooltipTextLeft"..i):GetText())
		end
		GameTooltipTextLeft2:SetText(tip)
		if zTargetOfMouse and targetlinenum then
			targetlinenum = targetlinenum + 1
		end
	end
	
	--[[ Colors ]]
--~ 第一行名字上色
	if tapped or bdead then
		r = 0.55;g = 0.55;b = 0.55
	elseif (UnitIsPlayer(unit) or UnitPlayerControlled(unit) ) then
		if ( UnitCanAttack(unit, "player") ) then
			if ( not UnitCanAttack("player", unit) ) then
				--purple, caution, only they can attack
				r = 1.0;g = 0.4;b = 1.0
			else
				-- Hostile players are red
				r = 1.0;g = 0.0;b = 0.0
			end
		elseif ( UnitCanAttack("player", unit) ) then
			-- Players we can attack but which are not hostile are yellow
			r = 1.0;g = 1.0;b = 0.0
		elseif ( UnitIsPVP(unit) ) then
			-- Players we can assist but are PvP flagged are green
			r = 0.0;g = 1.0;b = 0.0
		else
			-- All other players are blue (the usual state on the "blue" server)
			r = 0;g = 0.7;b = 1.0
		end
	elseif reaction then
		-- mob/npc use system default color
		if reaction < 4 then
			r,g,b = 1,0.3,0.22
		elseif reaction > 4 then
			r,g,b = 0,1,0
		else
			r,g,b = 1,1,0
		end
	else
		r,g,b = 1,1,1
	end

--~ 给第二行上色
	if tip or (levelline and levelline > 2) then
		if bdead or tapped then -- 尸体或已被攻击
			GameTooltipTextLeft2:SetTextColor(0.55,0.55,0.55)
		else
			GameTooltipTextLeft2:SetTextColor(r*zGuildColorAlpha,g*zGuildColorAlpha,b*zGuildColorAlpha)
		end
	end
--~ 标记本工会为亮色
	if bplayer and GetGuildInfo(unit) == GetGuildInfo("player") then
		GameTooltipTextLeft2:SetTextColor(0.9, 0.5, 0.9)
	end
	
--[[
	done
--]]

	GameTooltip:Show()
	
	return r, g, b
end

-----------------------------------------------------------------------
local zIsOnUnitFrame
local x, y, scale
local zOld_GameTooltip_SetDefaultAnchor
local function SetDefaultAnchor(tooltip,owner)
	if tooltip ~= GameTooltip then -- debug message
		zOld_GameTooltip_SetDefaultAnchor(tooltip,owner)
		return
	end
		
	if owner == UIParent then
		if UnitExists("mouseover") then
			if zAnchor == 1 or zAnchor == 3 then -- follow cursor
				tooltip:SetOwner(owner, "ANCHOR_NONE")
			else -- on top
				scale = UIParent:GetScale()
				if not scale or scale == 0 then scale = 1 end
				tmp = GameTooltip:GetScale() or 1
				x = zOffsetX / tmp / scale
				y = zOffsetY / tmp / scale
				tooltip:SetOwner(owner, "ANCHOR_NONE")
				tooltip:SetPoint("TOP",UIParent,"TOP", x, -y)
			end
		else -- not unit 像是熔炉，信箱
			tooltip:SetOwner(owner, "ANCHOR_CURSOR")
		end
	else -- not a unit tip, buttons or other
		if zAnchor > 2 or zIsOnUnitFrame or owner:GetParent() == RaidFrame then
			tooltip:SetOwner(owner,"ANCHOR_RIGHT")
		else -- use default anchor (BottomRight to Screen)
			zOld_GameTooltip_SetDefaultAnchor(tooltip,owner)
		end
	end
end

-----------------------------------------------------------------------
-- Overriden
--
local lastUpdate
local isUnitTipShown
local mouseTarget

-- Initial
GameTooltip:RegisterEvent("PLAYER_ENTERING_WORLD")
GameTooltip:SetScript("OnEvent", function()
	if ( event == "UPDATE_MOUSEOVER_UNIT" ) then
		getglobal(this:GetName().."TextLeft1"):SetTextColor(GameTooltip_UnitColor("mouseover"))
	elseif event == "PLAYER_ENTERING_WORLD" then
		if zScale then GameTooltip:SetScale(zScale) end
		GameTooltip_UnitColor = zTipFormat
		
		RankIcon = GameTooltip:CreateTexture("RankIcon","ARTWORK")
		RankIcon:SetWidth(14) RankIcon:SetHeight(14) 
		RankIcon:SetPoint("LEFT",GameTooltipTextLeft1,"LEFT", 1, 0)
		
		GameTooltip.zoldSetOwner = GameTooltip.SetOwner
		function GameTooltip:SetOwner(owner,anchor)
			self.zoldSetOwner(self,owner,anchor)
			if owner == UIParent and UnitExists("mouseover") then
				isUnitTipShown = true
			else
				isUnitTipShown = nil
			end
			if zDisplayPvPRank and zDisplayPvPRank > 1 then
				RankIcon:Hide()
			end
		end
		function GetDifficultyColor(level)
			-- this function copyed from FastQuest
			local lDiff = level - UnitLevel("player");
			if (lDiff >= 0) then
				for i= 1.00, 0.10, -0.10 do
					color = {r = 1.00, g = i, b = 0.00};
					if ((i/0.10)==(10-lDiff)) then return color; end
				end
			elseif ( -lDiff < GetQuestGreenRange() ) then
				for i= 0.90, 0.10, -0.10 do
					color = {r = i, g = 1.00, b = 0.00};
					if ((9-i/0.10)==(-1*lDiff)) then return color; end
				end
			elseif ( -lDiff == GetQuestGreenRange() ) then
				color = {r = 0.50, g = 1.00, b = 0.50};
			else
				color = {r = 0.75, g = 0.75, b = 0.75};
			end
			return color;
		end
		local zOld_UnitFrame_OnEnter = UnitFrame_OnEnter
		UnitFrame_OnEnter = function()
			zIsOnUnitFrame = true
			local newbieTip = SHOW_NEWBIE_TIPS
			SHOW_NEWBIE_TIPS = "0"
			zOld_UnitFrame_OnEnter()
			SHOW_NEWBIE_TIPS = newbieTip
		end
		local zOld_UnitFrame_OnLeave = UnitFrame_OnLeave
		UnitFrame_OnLeave = function()
			zOld_UnitFrame_OnLeave()
			zIsOnUnitFrame = nil
			if not zFade then GameTooltip:Hide() end
		end
		-- default anchor
		local func = GameTooltip_SetDefaultAnchor
		GameTooltip_SetDefaultAnchor = function(tooltip, parent)
			if not zOrigPosX or not zOrigPosY then
				func(tooltip, parent)
				return
			end
			local containerOffsetX = CONTAINER_OFFSET_X
			local containerOffsetY = CONTAINER_OFFSET_Y
			CONTAINER_OFFSET_X = zOrigPosX
			CONTAINER_OFFSET_Y = zOrigPosY
			func(tooltip, parent)
			CONTAINER_OFFSET_X = containerOffsetX
			CONTAINER_OFFSET_Y = containerOffsetY
		end
		if zAnchor then
			zOld_GameTooltip_SetDefaultAnchor = GameTooltip_SetDefaultAnchor
			GameTooltip_SetDefaultAnchor = SetDefaultAnchor
		else
			SetDefaultAnchor = nil
		end

		local zOld_GameTooltip_OnShow = GameTooltip:GetScript("OnShow") or function() end
		GameTooltip:SetScript("OnShow", function()
			zTipOnShow()
			zOld_GameTooltip_OnShow()
		end)

		this:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end
end)

-- New Update Way
local targetline
GameTooltip:SetScript("OnUpdate", function()

	if not UnitExists("mouseover") then
		if zDisplayPvPRank and zDisplayPvPRank > 1 and
			not strfind(GameTooltipTextLeft1:GetText(), "    ") then
			RankIcon:Hide()
		end
		if isUnitTipShown then
			if not zFade then
				GameTooltip:Hide()
			end
		end
		targetlinenum = nil
		mouseTarget = nil
		isUnitTipShown = nil
		return
	end
	
	-- offset to mouse
	if zAnchor == 1 or zAnchor == 3 or zAnchor == 5 then
		x,y = GetCursorPosition()
		scale = UIParent:GetScale()
		if(scale and scale ~= 0) then
			tmp = GameTooltip:GetScale() or 1
			x = (x + zOffsetX) / tmp / scale
			if zAnchor == 5 then
				y = (y + zOffsetY) / tmp / scale
			else
				y = (y - zOffsetY) / tmp / scale
			end
		end
		GameTooltip:ClearAllPoints()
		if zAnchor == 5 then
			GameTooltip:SetPoint("BOTTOM", UIParent, "BOTTOMLEFT", x, y)
		else
			GameTooltip:SetPoint("TOPLEFT",UIParent,"BOTTOMLEFT", x, y)
		end
	end
	
	-- add target of mouse over unit
	if not zTargetOfMouse or not targetlinenum then return end
	
	targetline = getglobal("GameTooltipTextLeft"..targetlinenum)
	if not targetline then return end
	
	tip, tmp, tmp2 = nil, nil, nil
	if not UnitExists("mouseovertarget") then
		mouseTarget = nil
		targetline:SetText()
		GameTooltip:Show()
	elseif UnitName("mouseovertarget") ~= mouseTarget then
		mouseTarget = UnitName("mouseovertarget") or UNKNOWNOBJECT
		tip = format("|cffFFFF00%s [|r", locTargeting)
		-- 指向我自己
		if UnitIsUnit("mouseovertarget", "player") then
			tip = format("%s |c00FF0000%s|r", tip, locYOU)
		-- 指向他自己
		elseif UnitIsUnit("mouseovertarget", "mouseover") then
			tip = format("%s |cffFFFFFF%s|r", tip, locSelf)
		-- 指向其它玩家
		elseif UnitIsPlayer("mouseovertarget") then
			tmp, tmp2 = UnitClass("mouseovertarget")
			tip = format("%s |cffFFFFFF%s|r |cff%s(%s)|r", tip,
				mouseTarget, zGetHexColor(zRAID_CLASS_COLORS[(tmp2 or "")]), tmp)
		else
			tip = format("%s |cffFFFFFF%s|r", tip, mouseTarget)
		end
		tip = tip.." |cffFFFF00]|r"
		targetline:SetText(tip)
		GameTooltip:Show()
	end

end)