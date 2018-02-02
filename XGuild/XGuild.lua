------------------------------------------------------------------------------
-- XGuild 1.2 by Xgale@CWOW 一区卡扎克 极光旅团 Alex
--A Little Func from X-Perl UnitFrames by Zek
------------------------------------------------------------------------------

XGUILD_LOC_CLASS_WARRIOR  = "Warrior"
XGUILD_LOC_CLASS_MAGE	  = "Mage"
XGUILD_LOC_CLASS_ROGUE	  = "Rogue"
XGUILD_LOC_CLASS_DRUID	  = "Druid"
XGUILD_LOC_CLASS_HUNTER	  = "Hunter"
XGUILD_LOC_CLASS_SHAMAN	  = "Shaman"
XGUILD_LOC_CLASS_PRIEST	  = "Priest"
XGUILD_LOC_CLASS_WARLOCK  = "Warlock"
XGUILD_LOC_CLASS_PALADIN  = "Paladin"

if (GetLocale() == "zhCN") then
	XGUILD_LOC_CLASS_DRUID	 = "德鲁伊"
	XGUILD_LOC_CLASS_HUNTER	 = "猎人"
	XGUILD_LOC_CLASS_MAGE	 = "法师"
	XGUILD_LOC_CLASS_PALADIN = "圣骑士"
	XGUILD_LOC_CLASS_PRIEST	 = "牧师"
	XGUILD_LOC_CLASS_ROGUE	 = "盗贼"
	XGUILD_LOC_CLASS_SHAMAN	 = "萨满祭司"
	XGUILD_LOC_CLASS_WARLOCK = "术士"
	XGUILD_LOC_CLASS_WARRIOR = "战士"
end

if (GetLocale() == "zhTW") then
	XGUILD_LOC_CLASS_WARRIOR = "戰士"
	XGUILD_LOC_CLASS_MAGE    = "法師"
	XGUILD_LOC_CLASS_ROGUE   = "盜賊"
	XGUILD_LOC_CLASS_DRUID   = "德魯伊"
	XGUILD_LOC_CLASS_HUNTER  = "獵人"
	XGUILD_LOC_CLASS_SHAMAN  = "薩滿"
	XGUILD_LOC_CLASS_PRIEST  = "牧師"
	XGUILD_LOC_CLASS_WARLOCK = "術士"
	XGUILD_LOC_CLASS_PALADIN = "聖騎士"
end
	
local colourList = {
		[XGUILD_LOC_CLASS_WARRIOR]	= "WARRIOR",
		[XGUILD_LOC_CLASS_MAGE]		= "MAGE",
		[XGUILD_LOC_CLASS_ROGUE]	= "ROGUE",
		[XGUILD_LOC_CLASS_DRUID]	= "DRUID",
		[XGUILD_LOC_CLASS_HUNTER]	= "HUNTER",
		[XGUILD_LOC_CLASS_SHAMAN]	= "SHAMAN",
		[XGUILD_LOC_CLASS_PRIEST]	= "PRIEST",
		[XGUILD_LOC_CLASS_WARLOCK]	= "WARLOCK",
		[XGUILD_LOC_CLASS_PALADIN]	= "PALADIN"}

local ColorGuildList = 1  --选项：是否彩色公会列表：0-否 1-是 默认：1
local ColorWhoISList = 1  --选项：是否彩色查询列表：0-否 1-是 默认：1
local ColorFriendsList = 1  --选项：是否彩色好友列表：0-否 1-是 默认：1
		
-- XGuild_ColorGuildRank  Edited From XPerl
local r,g,b
function XGuild_ColorGuildRank(rankIndex)
	local red = RED_FONT_COLOR;				-- 1.0, 0.10, 0.1
	local yellow = NORMAL_FONT_COLOR;	-- 1.0, 0.82, 0.0
	local green = GREEN_FONT_COLOR;		-- 0.1, 1.00, 0.1
	local nRanks = GuildControlGetNumRanks();
	local pct = ((rankIndex*100)/nRanks)/100;

	if (rankIndex == 0) then
		r = red.r; g = red.g; b = red.b;
	elseif (rankIndex == (nRanks/2)) then
		r = yellow.r; g = yellow.g; b = yellow.b;
	elseif (rankIndex == nRanks) then
		r = green.r; g = green.g; b = green.b;
	elseif (rankIndex > (nRanks/2)) then
		local pctmod = (1.0 - pct) * 2;
		r = (yellow.r - green.r)*pctmod + green.r;
		g = (yellow.g - green.g)*pctmod + green.g;
		b = (yellow.b - green.b)*pctmod + green.b;
	elseif (rankIndex < (nRanks/2)) then
		local pctmod = (0.5 - pct) * 2;	
		r = (red.r - yellow.r)*pctmod + yellow.r;
		g = (red.g - yellow.g)*pctmod + yellow.g;
		b = (red.b - yellow.b)*pctmod + yellow.b;
	end

	return r, g, b;
end

-- XGuild_GetClassColour
function XGuild_GetClassColour(class)
	if (class) then
		local color = RAID_CLASS_COLORS[class];		-- Now using the WoW class color table
		if (color) then
			return color
		end
	end
	return {r = 0.5, g = 0.5, b = 1}
end

-- XGuild_GuildStatusUpdate Edited From XPerl
function XGuild_GuildStatusUpdate()
	oldGuildStatus_Update()

	local myZone = GetRealZoneText()

	local guildOffset = FauxScrollFrame_GetOffset(GuildListScrollFrame)
	for i=1, GUILDMEMBERS_TO_DISPLAY, 1 do
		local guildIndex = guildOffset + i

		local button = getglobal("GuildFrameButton"..i);
		button.guildIndex = guildIndex;
		local name, rank, rankIndex, level, class, zone, note, officernote, online = GetGuildRosterInfo(guildIndex)
		if (not name) then
			break
		end
			
		class = colourList[class]

		if (class) then
			local color = XGuild_GetClassColour(class)
			if (color) then
				if (online) then
					getglobal("GuildFrameButton"..i.."Class"):SetTextColor(color.r, color.g, color.b)
					getglobal("GuildFrameButton"..i.."Name"):SetTextColor(color.r, color.g, color.b)
					getglobal("GuildFrameGuildStatusButton"..i.."Name"):SetTextColor(color.r, color.g, color.b)
				else
					getglobal("GuildFrameButton"..i.."Class"):SetTextColor(color.r / 2, color.g / 2, color.b / 2)
					getglobal("GuildFrameButton"..i.."Name"):SetTextColor(color.r / 2, color.g / 2, color.b / 2)
					getglobal("GuildFrameGuildStatusButton"..i.."Name"):SetTextColor(color.r / 2, color.g / 2, color.b / 2)
				end
			end
		end
				
		r,g,b = XGuild_ColorGuildRank(rankIndex)
		if (rank) then
			if (online) then 
				getglobal("GuildFrameGuildStatusButton"..i.."Rank"):SetTextColor(r, g, b)
			else
				getglobal("GuildFrameGuildStatusButton"..i.."Rank"):SetTextColor(r / 2, g / 2, b / 2)
			end
		end

		if (note) then
			getglobal("GuildFrameGuildStatusButton"..i.."Note"):SetTextColor(0.54, 0.54, 0.54)
		end

		if (zone == myZone) then
			if (online) then
				getglobal("GuildFrameButton"..i.."Zone"):SetTextColor(0, 1, 0)
			else
				getglobal("GuildFrameButton"..i.."Zone"):SetTextColor(0, 0.5, 0)
			end
		end

		local color = GetDifficultyColor(level)
		if (online) then
			getglobal("GuildFrameButton"..i.."Level"):SetTextColor(color.r, color.g, color.b)
		else
			getglobal("GuildFrameButton"..i.."Level"):SetTextColor(color.r / 2, color.g / 2, color.b / 2)
		end
	end
end

if (ColorGuildList == 1 and GuildStatus_Update ~= XGuild_GuildStatusUpdate) then
	oldGuildStatus_Update = GuildStatus_Update
	GuildStatus_Update = XGuild_GuildStatusUpdate
end

-- XGuild_WhoList_Update Edited From XPerl
function XGuild_WhoList_Update()
	oldWhoList_Update()

	local numWhos, totalCount = GetNumWhoResults()
	local whoOffset = FauxScrollFrame_GetOffset(WhoListScrollFrame)

	local myZone = GetRealZoneText()
	local myRace = UnitRace("player")
	local myGuild = GetGuildInfo("player")

	for i=1, WHOS_TO_DISPLAY, 1 do
		local name, guild, level, race, class, zone = GetWhoInfo(whoOffset + i)
		local color
		if (not name) then
			break
		end

		if (UIDropDownMenu_GetSelectedID(WhoFrameDropDown) == 1) then
			-- Zone
			if (zone == myZone) then
				getglobal("WhoFrameButton"..i.."Variable"):SetTextColor(0, 1, 0)
			else
				getglobal("WhoFrameButton"..i.."Variable"):SetTextColor(1, 1, 1)
			end
		elseif (UIDropDownMenu_GetSelectedID(WhoFrameDropDown) == 2) then
			if (guild == myGuild) then
				getglobal("WhoFrameButton"..i.."Variable"):SetTextColor(0, 1, 0)
			else
				getglobal("WhoFrameButton"..i.."Variable"):SetTextColor(1, 1, 1)
			end
		elseif (UIDropDownMenu_GetSelectedID(WhoFrameDropDown) == 3) then
			if (race == myRace) then
				getglobal("WhoFrameButton"..i.."Variable"):SetTextColor(0, 1, 0)
			else
				getglobal("WhoFrameButton"..i.."Variable"):SetTextColor(1, 1, 1)
			end
		end

		class = colourList[class]
		if (class) then
			local color = XGuild_GetClassColour(class)
			if (color) then
				getglobal("WhoFrameButton"..i.."Class"):SetTextColor(color.r, color.g, color.b)
				getglobal("WhoFrameButton"..i.."Name"):SetTextColor(color.r, color.g, color.b)
			end
		end

		local color = GetDifficultyColor(level)
		getglobal("WhoFrameButton"..i.."Level"):SetTextColor(color.r, color.g, color.b)
	end
end

if (ColorWhoISList == 1 and WhoList_Update ~= XGuild_WhoList_Update) then
	oldWhoList_Update = WhoList_Update
	WhoList_Update = XGuild_WhoList_Update
end

-- XGuild_FriendsList_Update Write By Xgale@CWOW
function XGuild_FriendsList_Update()
	oldFriendsList_Update()

	local nameLocationText;
	local infoText;

	local numFriends = GetNumFriends();
	local friendOffset = FauxScrollFrame_GetOffset(FriendsFrameFriendsScrollFrame)
	
	local myZone = GetRealZoneText()

	for i=1, FRIENDS_TO_DISPLAY, 1 do
		local name, level, class, zone, online = GetFriendInfo(friendOffset + i)
		local color
		if (not name) then
			break
		end
		
		nameLocationText = getglobal("FriendsFrameFriendButton"..i.."ButtonTextNameLocation");
		infoText = getglobal("FriendsFrameFriendButton"..i.."ButtonTextInfo");
		
		if ( online ) then
			--nameLocationText:SetText(format(TEXT(FRIENDS_LIST_TEMPLATE), name, class));
			--infoText:SetText(format(TEXT(FRIENDS_LEVEL_TEMPLATE), area, level));
						
			if (zone == myZone) then
				infoText:SetTextColor(0, 1, 0)
			else
				infoText:SetTextColor(1, 1, 1)
			end
						
			class = colourList[class]
			if (class) then
				local color = XGuild_GetClassColour(class)
				if (color) then
					nameLocationText:SetTextColor(color.r, color.g, color.b)
				end
			end
		else
			infoText:SetTextColor(0.5, 0.5, 0.5)
		end
		
	end
end

if (ColorFriendsList == 1 and FriendsList_Update ~= XGuild_FriendsList_Update) then
	oldFriendsList_Update = FriendsList_Update
	FriendsList_Update = XGuild_FriendsList_Update
end



