UIPanelWindows["CT_RaidTrackerFrame"] = { area = "left", pushable = 1, whileDead = 1 };
CT_RAIDTRACKER_RAIDS = "Raids: %d";
CT_RaidTracker_Online = { };
CT_RaidTracker_PGIes = { };

CT_RaidTracker_Version = "http://www.dkp.com.cn)";
CT_RaidTracker_Events = { };
CT_RaidTracker_RaidLog = { };
CT_RaidTracker_GetCurrentRaid = nil;

CT_RaidTracker_LastPage = { };

CT_RaidTracker_SortOptions = {
	["method"] = "name",
	["way"] = "asc",
	["itemmethod"] = "looted",
	["itemway"] = "asc",
	["itemfilter"] = 1,
	["playerraidway"] = "desc",
	["playeritemfilter"] = 1,
	["playeritemmethod"] = "name",
	["playeritemway"] = "asc",
	["itemhistorymethod"] = "name",
	["itemhistoryway"] = "asc"
};

CT_RaidTracker_RarityTable = {
	["ff9d9d9d"] = 1,
	["ffffffff"] = 2,
	["ff1eff00"] = 3,
	["ff0070dd"] = 4,
	["ffa335ee"] = 5,
	["ffff8000"] = 6,
	["ffe6cc80"] = 7,
};

CT_RaidTracker_Options = 
{
    ["MinQuality"] = 2,         -- 1:poor, 2:common, 3:uncommon, 4:rare, 5:epic, 6:legendary, 7:artifact
    ["AutoRaidCreation"] = 1,   -- on/off
    ["GroupItems"] = 4,         -- 1:poor, 2:common, 3:uncommon, 4:rare, 5:epic, 6:legendary, 7:artifact
    ["GetDkpValue"] = 0,        -- 1:poor, 2:common, 3:uncommon, 4:rare, 5:epic, 6:legendary, 7:artifact
    ["AutoBoss"] = 2,           -- 0,1,2
    ["AutoBossBoss"] = "",      -- just the name of the boss
    ["AutoZone"] = 1,           -- on/off
    ["OldFormat"] = 1,          -- on/off
    ["AskCost"] = 5,            -- 1:poor, 2:common, 3:uncommon, 4:rare, 5:epic, 6:legendary, 7:artifact, asks for cost for items with at least this rarity
    ["Timezone"] = 0,
    ["TimeSync"] = 1,
    ["DebugFlag"] = nil,        -- on/off
    ["LogAttendees"] = 2,       -- 0:off, 1:for each looted item, 2:for each bosskill
    ["SaveExtendedPlayerInfo"] = 1, -- on/off - save race, class and level  
    ["SaveTooltips"] = 1, 			-- on/off - save tooltips of items
    ["ttout"] = 1,
};

CT_RaidTracker_QuickLooter = {"忽略", "银行"};

CT_RaidTracker_TimeOffsetStatus = nil;
CT_RaidTracker_TimeOffset = 0;
CT_RaidTracker_CustomZoneTriggers = {};
CT_RaidTracker_ItemOptions = {};


function CT_RaidTracker_RunVersionFix()
	if(not CT_RaidTracker_VersionFix) then
		CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 1);
		for k, v in CT_RaidTracker_RaidLog do
			if(not CT_RaidTracker_RaidLog[k]["PlayerInfos"]) then
				CT_RaidTracker_RaidLog[k]["PlayerInfos"] = { };
			end
			if ( v["Notes"] ) then
				for notesk, notesv in v["Notes"] do
					if(not CT_RaidTracker_RaidLog[k]["PlayerInfos"][notesk]) then
						CT_RaidTracker_RaidLog[k]["PlayerInfos"][notesk] = { };
					end
					CT_RaidTracker_RaidLog[k]["PlayerInfos"][notesk]["note"] = notesv;
					CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 1, "note", k, notesk, notesv);
				end
				CT_RaidTracker_RaidLog[k]["Notes"] = nil;
			end
		end
		CT_RaidTracker_VersionFix = 1;
	end
	if(CT_RaidTracker_VersionFix == 1) then
		CT_RaidTracker_VersionFix = 2; -- Do not remove tooltips any longer
	end
	if(CT_RaidTracker_VersionFix == 2) then
		if(CT_RaidTracker_MinQuality) then CT_RaidTracker_Options["MinQuality"] = CT_RaidTracker_MinQuality; CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "CT_RaidTracker_MinQuality", CT_RaidTracker_MinQuality); end
		if(CT_RaidTracker_AutoRaidCreation) then CT_RaidTracker_Options["AutoRaidCreation"] = CT_RaidTracker_AutoRaidCreation; CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "CT_RaidTracker_AutoRaidCreation", CT_RaidTracker_AutoRaidCreation); end
		if(CT_RaidTracker_GroupItems) then CT_RaidTracker_Options["GroupItems"] = CT_RaidTracker_GroupItems; CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "CT_RaidTracker_GroupItems", CT_RaidTracker_GroupItems); end
		if(CT_RaidTracker_GetDkpValue) then CT_RaidTracker_Options["GetDkpValue"] = CT_RaidTracker_GetDkpValue; CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "CT_RaidTracker_GetDkpValue", CT_RaidTracker_GetDkpValue); end
		if(CT_RaidTracker_OldFormat) then CT_RaidTracker_Options["OldFormat"] = CT_RaidTracker_OldFormat; CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "CT_RaidTracker_OldFormat", CT_RaidTracker_OldFormat); end
		if(CT_RaidTracker_AutoBoss) then CT_RaidTracker_Options["AutoBoss"] = CT_RaidTracker_AutoBoss; CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "CT_RaidTracker_AutoBoss", CT_RaidTracker_AutoBoss); end
		if(CT_RaidTracker_AutoBossBoss) then CT_RaidTracker_Options["AutoBossBoss"] = CT_RaidTracker_AutoBossBoss; CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "CT_RaidTracker_AutoBossBoss", CT_RaidTracker_AutoBossBoss); end
		if(CT_RaidTracker_AutoZone) then CT_RaidTracker_Options["AutoZone"] = CT_RaidTracker_AutoZone; CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "CT_RaidTracker_AutoZone", CT_RaidTracker_AutoZone); end
		if(CT_RaidTracker_AskCosts) then CT_RaidTracker_Options["AskCost"] = CT_RaidTracker_AskCosts; CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "CT_RaidTracker_AskCosts", CT_RaidTracker_AskCosts); end
		if(CT_RaidTracker_Timezone) then CT_RaidTracker_Options["Timezone"] = CT_RaidTracker_Timezone; CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "CT_RaidTracker_Timezone", CT_RaidTracker_Timezone); end
		if(CT_RaidTracker_TimeSync) then CT_RaidTracker_Options["TimeSync"] = CT_RaidTracker_TimeSync; CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "CT_RaidTracker_TimeSync", CT_RaidTracker_TimeSync); end
		if(CT_RaidTracker_DebugFlag) then CT_RaidTracker_Options["DebugFlag"] = CT_RaidTracker_DebugFlag; CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "CT_RaidTracker_DebugFlag", CT_RaidTracker_DebugFlag); end
		
		for k, v in CT_RaidTracker_RaidLog do
			if(CT_RaidTracker_RaidLog[k]["BossKills"]) then
				local tempbosskills = {};
				for k2, v2 in CT_RaidTracker_RaidLog[k]["BossKills"] do
					tempbosskills[k2] = v2;
				end
				CT_RaidTracker_RaidLog[k]["BossKills"] = {};
				for k2, v2 in tempbosskills do
					tinsert(CT_RaidTracker_RaidLog[k]["BossKills"],
						{
							["boss"] = k2,
							["time"] = v2,
							["attendees"] = {}
						}
					);
					CT_RaidTracker_Debug("CT_RaidTracker_RunVersionFix()", 3, "BossKills", k, k2);
				end
			end
		end
		CT_RaidTracker_VersionFix = 3;
	end
end


function CT_RaidTracker_GetTime(dDate)
	if ( not dDate ) then
		return nil;
	end
	local _, _, mon, day, year, hr, min, sec = string.find(dDate, "(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)");
	local table = date("*t", time());
	local timestamp;
	table["month"] = tonumber(mon);
	table["year"] = tonumber("20" .. year);
	table["day"] = tonumber(day);
	table["hour"] = tonumber(hr);
	table["min"] = tonumber(min);
	table["sec"] = tonumber(sec);
	timestamp = time(table);
	table = date("*t", timestamp);
	if(table["isdst"]) then
		timestamp = timestamp - 3600;
	end
	return timestamp;
end

function CT_RaidTracker_SortRaidTable()
	table.sort(
		CT_RaidTracker_RaidLog,
		function(a1, a2)
			if ( a1 and a2 ) then
				return CT_RaidTracker_GetTime(a1.key) > CT_RaidTracker_GetTime(a2.key);
			end
		end
	);
end

function CT_RaidTracker_GameTimeFrame_Update()
	CT_RaidTracker_GameTimeFrame_Update_Original();
	local hour, minute = GetGameTime();
	local time = ((hour * 60) + minute) * 60;
	if(not CT_RaidTracker_TimeOffsetStatus) then
		CT_RaidTracker_TimeOffsetStatus = time;
	elseif(CT_RaidTracker_TimeOffsetStatus ~= time) then
		local ltimea = date("*t");
		local ltime = (((ltimea["hour"] * 60) + ltimea["min"]) * 60 + ltimea["sec"]) + (CT_RaidTracker_Options["Timezone"] * 3600);
		local timediff;
		if(time > ltime) then
			timediff = time - ltime;
			if(timediff >= 43200) then
				CT_RaidTracker_TimeOffset = timediff - 86400;
			else
				CT_RaidTracker_TimeOffset = timediff;
			end
		elseif(time < ltime) then
			timediff = ltime - time;
			if(timediff >= 43200) then
				CT_RaidTracker_TimeOffset = 86400 - timediff;
			else
				CT_RaidTracker_TimeOffset = timediff * -1;
			end
		else
			CT_RaidTracker_TimeOffset = 0;
		end
		CT_RaidTracker_Debug("CT_RaidTracker_TimeOffset", CT_RaidTracker_TimeOffset);
		GameTimeFrame_Update = CT_RaidTracker_GameTimeFrame_Update_Original;
		CT_RaidTracker_TimeOffsetStatus = nil;
	end
end

function CT_RaidTracker_GetGameTimeOffset()
	if(CT_RaidTracker_TimeOffsetStatus) then
		return;
	end
	if(not CT_RaidTracker_GameTimeFrame_Update_Original) then
		CT_RaidTracker_GameTimeFrame_Update_Original = GameTimeFrame_Update;
	end
	GameTimeFrame_Update = CT_RaidTracker_GameTimeFrame_Update;
	return;
end

function CT_RaidTracker_GetRaidTitle(id, hideid, showzone, shortdate)
	local RaidTitle = "";
	if ( CT_RaidTracker_RaidLog[id] and CT_RaidTracker_RaidLog[id].key ) then
		local _, _, mon, day, year, hr, min, sec = string.find(CT_RaidTracker_RaidLog[id].key, "(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)");
		if ( mon ) then
			local months = {
				"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
			};
			if ( not hideid ) then
				RaidTitle = RaidTitle .. "[" .. (getn(CT_RaidTracker_RaidLog)-id+1) .. "] ";
			end
			if ( not shortdate ) then
				RaidTitle = RaidTitle .. months[tonumber(mon)] .. " " .. day .. " '" .. year .. ", " .. hr .. ":" .. min;
			else
				RaidTitle = RaidTitle .. mon .. "/" .. day .. " " .. hr .. ":" .. min;
			end
			if ( showzone and CT_RaidTracker_RaidLog[id].zone) then
				RaidTitle = RaidTitle .. " " .. CT_RaidTracker_RaidLog[id].zone;
			end
			return RaidTitle;
		else
			return "";
		end
	end
	return "";
end

function CT_RaidTracker_GetLootId(raidid, sPlayer, sItem, sTime)
	CT_RaidTracker_Debug("CT_RaidTracker_GetLootId", raidid, sPlayer, sItem, sTime);
	local lootid = nil;
	for key, val in CT_RaidTracker_RaidLog[raidid]["Loot"] do
		if(val["player"] == sPlayer and val["item"]["id"] == sItem and val["time"] == sTime) then
			lootid = key;
			break;
		end
	end
	return lootid;
end

function CT_RaidTracker_Update()
    if(CT_RaidTracker_GetCurrentRaid) then
      CT_RaidTrackerFrameEndRaidButton:Enable();
      CT_RaidTrackerFrameSnapshotButton:Enable();
    else
        CT_RaidTrackerFrameEndRaidButton:Disable();
        CT_RaidTrackerFrameSnapshotButton:Disable();
    end
    if(GetNumRaidMembers() == 0) then
        CT_RaidTrackerFrameNewRaidButton:Disable();
    else
        CT_RaidTrackerFrameNewRaidButton:Enable();
    end
    
    if ( CT_RaidTrackerFrame.selected ) then
    	CT_RaidTrackerFrameView2Button:Enable();
    else
    	CT_RaidTrackerFrameView2Button:Disable();
    end

	if ( getn(CT_RaidTracker_LastPage) > 0 ) then
		CT_RaidTrackerFrameBackButton:Enable();
	else
		CT_RaidTrackerFrameBackButton:Disable();
	end
	if ( getn(CT_RaidTracker_RaidLog) > 0 ) then
		if ( CT_RaidTrackerFrame.selected ) then
			local selected;
			if ( not CT_RaidTracker_RaidLog[CT_RaidTrackerFrame.selected] ) then
				while ( not selected ) do
					if ( CT_RaidTrackerFrame.selected < 1 ) then
						selected = 1;
						CT_RaidTrackerFrame.selected = nil;
					else
						CT_RaidTrackerFrame.selected = CT_RaidTrackerFrame.selected - 1;
						if ( CT_RaidTracker_RaidLog[CT_RaidTrackerFrame.selected] ) then
							selected = 2;
						end
					end
				end
			end
			if ( not selected or selected == 2 ) then
				if ( not CT_RaidTracker_RaidLog[CT_RaidTrackerFrame.selected] or getn(CT_RaidTracker_RaidLog[CT_RaidTrackerFrame.selected]["Loot"]) == 0 ) then
					CT_RaidTrackerFrame.type = "raids";
					CT_RaidTrackerFrameViewButton:Disable();
				else
					CT_RaidTrackerFrameViewButton:Enable();
				end
			end
		end

		CT_EmptyRaidTrackerFrame:Hide();
		CT_RaidTrackerFrameDeleteButton:Enable();

		local hasItem;
		for k, v in CT_RaidTracker_RaidLog do
			for key, val in v["Loot"] do
				if ( val["player"] == CT_RaidTrackerFrame.player ) then
					hasItem = 1;	
					break;
				end
			end
			if ( hasItem ) then
				break;
			end
		end

		if ( CT_RaidTrackerFrame.type == "raids" or not CT_RaidTrackerFrame.type ) then
			CT_RaidTrackerFrameViewButton:SetText("查看物品");
			CT_RaidTrackerFrameView2Button:SetText("查看击杀");
		elseif ( CT_RaidTrackerFrame.type == "items" ) then
			CT_RaidTrackerFrameViewButton:SetText("查看玩家");
		elseif ( CT_RaidTrackerFrame.type == "player" ) then
			if ( not hasItem ) then
				CT_RaidTrackerFrameViewButton:Disable();
			else
				CT_RaidTrackerFrameViewButton:Enable();
			end
			CT_RaidTrackerFrameViewButton:SetText("查看拾取");
			CT_RaidTrackerFrameDeleteButton:Disable();
		elseif ( CT_RaidTrackerFrame.type == "playeritems" ) then
			CT_RaidTrackerFrameViewButton:SetText("查看Raids");
			CT_RaidTrackerFrameDeleteButton:Disable();
			if ( not hasItem ) then
				CT_RaidTrackerFrame.type = "player";
				CT_RaidTracker_Update();
				CT_RaidTracker_UpdateView();
			end
		elseif ( CT_RaidTrackerFrame.type == "itemhistory" ) then
			CT_RaidTrackerFrameDeleteButton:Disable();
			CT_RaidTrackerFrameViewButton:Disable();
		elseif ( CT_RaidTrackerFrame.type == "bosskills" ) then
			CT_RaidTrackerFrameDeleteButton:Disable();
			CT_RaidTrackerFrameViewButton:Disable();
		end
	else
		CT_EmptyRaidTrackerFrame:Show();
		CT_RaidTrackerDetailScrollFramePlayers:Hide();
		CT_RaidTrackerDetailScrollFrameItems:Hide();
		CT_RaidTrackerDetailScrollFramePlayer:Hide();
		CT_RaidTrackerDetailScrollFrameBossKills:Hide();
		CT_RaidTrackerFrameDeleteButton:Disable();
		CT_RaidTrackerFrameViewButton:Disable();
	end

	local numRaids = getn(CT_RaidTracker_RaidLog);
	local numEntries = numRaids;

	-- ScrollFrame update
	FauxScrollFrame_Update(CT_RaidTrackerListScrollFrame, numEntries, 6, 16, nil, nil, nil, CT_RaidTrackerHighlightFrame, 293, 316 );
	
	CT_RaidTrackerHighlightFrame:Hide();
	for i=1, 6, 1 do
		local title = getglobal("CT_RaidTrackerTitle" .. i);
		local normaltext = getglobal("CT_RaidTrackerTitle" .. i .. "NormalText");
		local highlighttext = getglobal("CT_RaidTrackerTitle" .. i .. "HighlightText");
		local disabledtext = getglobal("CT_RaidTrackerTitle" .. i .. "DisabledText");
		local highlight = getglobal("CT_RaidTrackerTitle" .. i .. "Highlight");

		local index = i + FauxScrollFrame_GetOffset(CT_RaidTrackerListScrollFrame); 
		if ( index <= numEntries ) then
			local raidTitle = CT_RaidTracker_GetRaidTitle(index, nil, 1, 1);
			local raidTag = CT_RaidTracker_RaidLog[index]["note"];
			if ( not raidTag ) then
				raidTag = "";
			else
				raidTag = " (" .. raidTag .. ")";
			end
			if ( raidTitle ) then
				title:SetText(raidTitle .. raidTag);
			else
				title:SetText("");
			end
			title:Show();
			-- Place the highlight and lock the highlight state
			if ( CT_RaidTrackerFrame.selected and CT_RaidTrackerFrame.selected == index ) then
				CT_RaidTrackerSkillHighlight:SetVertexColor(1, 1, 0);
				CT_RaidTrackerHighlightFrame:SetPoint("TOPLEFT", "CT_RaidTrackerTitle"..i, "TOPLEFT", 0, 0);
				CT_RaidTrackerHighlightFrame:Show();
				title:LockHighlight();
			else
				title:UnlockHighlight();
			end
			
		else
			title:Hide();
		end

	end
end

function CT_RaidTracker_SelectRaid(id)
	local raidid = id + FauxScrollFrame_GetOffset(CT_RaidTrackerListScrollFrame);
	CT_RaidTracker_GetPage();
	CT_RaidTrackerFrame.selected = raidid;
	--if ( getn(CT_RaidTracker_RaidLog[raidid]["Loot"]) == 0 or ( CT_RaidTrackerFrame.type and CT_RaidTrackerFrame.type ~= "items" ) ) then
		CT_RaidTrackerFrame.type = "raids";
	--end

	CT_RaidTracker_UpdateView();
	CT_RaidTracker_Update();
end

function CT_RaidTracker_ShowInfo(player)
	CT_RaidTracker_GetPage();

	CT_RaidTrackerFrame.type = "player";
	CT_RaidTrackerFrame.player = player;
	CT_RaidTrackerFrame.selected = nil;
	
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_Delete(id, type, typeid)
	CT_RaidTracker_Debug("DELETE", type, typeid);
	if ( type == "raid" ) then
		table.remove(CT_RaidTracker_RaidLog, id);
		if ( id == CT_RaidTracker_GetCurrentRaid ) then
			CT_RaidTracker_GetCurrentRaid = nil;
		end
		if ( CT_RaidTrackerFrame.selected == id ) then
			CT_RaidTrackerFrame.selected = CT_RaidTrackerFrame.selected - 1;
			if ( CT_RaidTrackerFrame.selected < 1 ) then
				CT_RaidTrackerFrame.selected = 1;
			end
			CT_RaidTrackerFrame.type = "raids";
		end
	elseif ( type == "item" ) then
		local itemplayer, itemitemid, itemtime;
		itemplayer = this:GetParent().itemplayer;
		itemitemid = this:GetParent().itemitemid;
		itemtime = this:GetParent().itemtime;
		local lootid = CT_RaidTracker_GetLootId(id, itemplayer, itemitemid, itemtime);
		table.remove(CT_RaidTracker_RaidLog[id]["Loot"], lootid);
	elseif ( type == "player" ) then
		for key, val in CT_RaidTracker_RaidLog[id]["Join"] do
			if ( val["player"] == typeid ) then
				CT_RaidTracker_Debug("DELETE", "JOIN", "FOUND PLAYER", key, val["player"]);
				CT_RaidTracker_RaidLog[id]["Join"][key] = nil;
			end
		end
		for key, val in CT_RaidTracker_RaidLog[id]["Leave"] do
			if ( val["player"] == typeid ) then
				CT_RaidTracker_Debug("DELETE", "LEAVE", "FOUND PLAYER", key, val["player"]);
				CT_RaidTracker_RaidLog[id]["Leave"][key] = nil;
			end
		end
		if(id == CT_RaidTracker_GetCurrentRaid) then
			CT_RaidTracker_Online[typeid] = nil;
		end
		if(CT_RaidTracker_RaidLog[id]["PlayerInfos"]) then
			CT_RaidTracker_RaidLog[id]["PlayerInfos"][typeid] = nil;
		end
	end
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_Sort(tbl, method, way)
	if ( way == "asc" ) then
		table.sort(
			tbl,
			function(a1, a2)
				return a1[method] < a2[method];
			end
		);
	else
		table.sort(
			tbl,
			function(a1, a2)
				return a1[method] > a2[method];
			end
		);
	end
	return tbl;
end

function CT_RaidTracker_SortPlayerRaids(id)
	if ( CT_RaidTrackerFrame.type == "itemhistory" ) then
		local table = { "name", "looter" };

		if ( CT_RaidTracker_SortOptions["itemhistorymethod"] == table[id] ) then
			if ( CT_RaidTracker_SortOptions["itemhistoryway"] == "asc" ) then
				CT_RaidTracker_SortOptions["itemhistoryway"] = "desc";
			else
				CT_RaidTracker_SortOptions["itemhistoryway"] = "asc";
			end
		else
			CT_RaidTracker_SortOptions["itemhistoryway"] = "asc";
			CT_RaidTracker_SortOptions["itemhistorymethod"] = table[id];
		end
	else		
		if ( CT_RaidTracker_SortOptions["playerraidway"] == "asc" ) then
			CT_RaidTracker_SortOptions["playerraidway"] = "desc";
		else
			CT_RaidTracker_SortOptions["playerraidway"] = "asc";
		end
	end
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_CompareItems(a1, a2)
	-- This function could probably be better, but I can't think of any better way while still maintaining functionality

	local filter, method, way = CT_RaidTracker_SortOptions["itemfilter"], CT_RaidTracker_SortOptions["itemmethod"], CT_RaidTracker_SortOptions["itemway"];
	if ( CT_RaidTrackerFrame.type == "playeritems" ) then
		filter, method, way = CT_RaidTracker_SortOptions["playeritemfilter"], CT_RaidTracker_SortOptions["playeritemmethod"], CT_RaidTracker_SortOptions["playeritemway"];
	end

	-- Check to see if it matches the rarity requirements
	--CT_RaidTracker_Debug(a2["item"]["c"]);
	if ( CT_RaidTracker_RarityTable[a1["item"]["c"]] < filter ) then
		return false;
	elseif ( CT_RaidTracker_RarityTable[a2["item"]["c"]] < filter ) then
		return true;
	end

	if ( method == "name" ) then
		local c1, c2 = a1["item"]["name"], a2["item"]["name"];
		if ( c1 == c2 ) then
			c1, c2 = a1["player"], a2["player"];
		end
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "looter" ) then
		local c1, c2 = a1["player"], a2["player"];
		if ( c1 == c2 ) then
			c1, c2 = CT_RaidTracker_RarityTable[a2["item"]["c"]], CT_RaidTracker_RarityTable[a1["item"]["c"]];
			if ( c1 == c2 ) then
				c1, c2 = a1["item"]["name"], a2["item"]["name"];
			end
		end
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "looted" ) then
		if ( way == "asc" ) then
			return CT_RaidTracker_GetTime(a1["time"]) < CT_RaidTracker_GetTime(a2["time"]);
		else
			return CT_RaidTracker_GetTime(a1["time"]) > CT_RaidTracker_GetTime(a2["time"]);
		end
	else
		local c1, c2 = CT_RaidTracker_RarityTable[a1["item"]["c"]], CT_RaidTracker_RarityTable[a2["item"]["c"]];
		if ( c1 == c2 ) then
			c1, c2 = a1["item"]["name"], a2["item"]["name"];
			if ( c1 == c2 ) then
				c1, c2 = a1["player"], a2["player"];
			else
				return c1 < c2;
			end
		end
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	end
end

function CT_RaidTracker_SortItem(tbl, method, way)
	table.sort(
		tbl,
		CT_RaidTracker_CompareItems
	);
	local newtable = {}
	for key, val in tbl do
		tinsert(newtable, key, val);
	end
	return newtable;
end

function CT_RaidTracker_SortItemBy(id)
	local table = { "name", "looted", "looter", "rarity" };
	local prefix = "";
	if ( CT_RaidTrackerFrame.type == "playeritems" ) then
		prefix = "player";
	end
	if ( CT_RaidTracker_SortOptions[prefix.."itemmethod"] == table[id] ) then
		if ( CT_RaidTracker_SortOptions[prefix.."itemway"] == "asc" ) then
			CT_RaidTracker_SortOptions[prefix.."itemway"] = "desc";
		else
			CT_RaidTracker_SortOptions[prefix.."itemway"] = "asc";
		end
	else
		CT_RaidTracker_SortOptions[prefix.."itemmethod"] = table[id];
		CT_RaidTracker_SortOptions[prefix.."itemway"] = "asc";
	end
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_SortBy(id)
	local table = { "name", "join", "leave" };
	if ( CT_RaidTracker_SortOptions["method"] == table[id] ) then
		if ( CT_RaidTracker_SortOptions["way"] == "asc" ) then
			CT_RaidTracker_SortOptions["way"] = "desc";
		else
			CT_RaidTracker_SortOptions["way"] = "asc";
		end
	else
		CT_RaidTracker_SortOptions["method"] = table[id];
		if ( table[id] ~= "leave" ) then
			CT_RaidTracker_SortOptions["way"] = "asc";
		else
			CT_RaidTracker_SortOptions["way"] = "desc";
		end
	end
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_UpdateView()
	if ( CT_EmptyRaidTrackerFrame:IsVisible() ) then
		return;
	end
	local raidid = CT_RaidTrackerFrame.selected;
	if ( CT_RaidTrackerFrame.type == "raids" or not CT_RaidTrackerFrame.type ) then
		CT_RaidTrackerDetailScrollFramePlayers:Show();
		CT_RaidTrackerDetailScrollFramePlayer:Hide();
		CT_RaidTrackerDetailScrollFrameItems:Hide();
		CT_RaidTrackerDetailScrollFrameBossKills:Hide();
		local players = { };
		if ( CT_RaidTracker_RaidLog[raidid] ) then

			local playerIndexes = { };
			for key, val in CT_RaidTracker_RaidLog[raidid]["Join"] do
				if ( val["player"] ) then
					local id = playerIndexes[val["player"]];
					local time = CT_RaidTracker_GetTime(val["time"]);
					if ( not id or time < players[id]["join"] ) then
						
						if ( playerIndexes[val["player"]] ) then
							players[id] = {
								["join"] = time,
								["name"] = val["player"]
							};
						else
							tinsert(players, {
								["join"] = time,
								["name"] = val["player"]
							});
							playerIndexes[val["player"]] = getn(players);
						end
					end
					id = playerIndexes[val["player"]];
					if ( not players[id]["lastjoin"] or players[id]["lastjoin"] < time ) then
						players[id]["lastjoin"] = time;
					end
				end
			end
			for key, val in CT_RaidTracker_RaidLog[raidid]["Leave"] do
				local id = playerIndexes[val["player"]];
				local time = CT_RaidTracker_GetTime(val["time"]);
				if ( id ) then
					if ( ( not players[id]["leave"] or time > players[id]["leave"] ) and time >= players[id]["lastjoin"] ) then
						players[id]["leave"] = time;
					end
				end
			end
			for k, v in players do
				if ( not v["leave"] ) then
					-- Very ugly hack, I know :(
					players[k]["leave"] = 99999999999;
				end
			end
			players = CT_RaidTracker_Sort(players, CT_RaidTracker_SortOptions["method"], CT_RaidTracker_SortOptions["way"]);
			getglobal("CT_RaidTrackerDetailScrollFramePlayers").raidid = raidid;
			getglobal("CT_RaidTrackerDetailScrollFramePlayers").players = players;
			CT_RaidTracker_DetailScrollFramePlayers_Update();
		end
		CT_RaidTrackerParticipantsText:SetText("参与人员 (" .. getn(players) .. ")");
		CT_RaidTrackerDetailScrollFramePlayers:Show();
	elseif ( CT_RaidTrackerFrame.type == "items" ) then
		CT_RaidTrackerDetailScrollFramePlayers:Hide();
		CT_RaidTrackerDetailScrollFramePlayer:Hide();
		CT_RaidTrackerDetailScrollFrameItems:Show();
		CT_RaidTrackerDetailScrollFrameBossKills:Hide();
		local numItems, numHidden = 0, 0;
		if ( CT_RaidTracker_RaidLog[raidid] ) then
			local keystoremove = {};
			local loot = CT_RaidTracker_SortItem(CT_RaidTracker_RaidLog[raidid]["Loot"], CT_RaidTracker_SortOptions["itemmethod"], CT_RaidTracker_SortOptions["itemway"]);
			for key, val in loot do
				val["thisitemid"] = tonumber(key);
				if((not val["item"]["tooltip"] or getn(val["item"]["tooltip"]) == 0) and CT_RaidTracker_Options["SaveTooltips"] == 1 and GetItemInfo("item:" .. val["item"]["id"])) then
					val["item"]["tooltip"] = CT_RaidTracker_GetItemTooltip(val["item"]["id"]);
					CT_RaidTracker_Debug("TooltipGet", val["item"]["name"]);
				end
				if ( CT_RaidTracker_RarityTable[val["item"]["c"]] >= CT_RaidTracker_SortOptions["itemfilter"] ) then
					numItems = numItems + 1;
				else
					tinsert(keystoremove, key);
					numHidden = numHidden + 1;
				end
			end
			for key, val in keystoremove do
				table.remove(loot, val);
			end
			getglobal("CT_RaidTrackerDetailScrollFrameItems").raidid = raidid;
			getglobal("CT_RaidTrackerDetailScrollFrameItems").loot = loot;
			CT_RaidTracker_DetailScrollFrameItems_Update();
			CT_RaidTrackerDetailScrollFrameItems:Show();
		end
		if ( numHidden == 0 ) then
			CT_RaidTrackerItemsText:SetText("物品 (" .. numItems .. "):");
		else
			CT_RaidTrackerItemsText:SetText("物品 (" .. numItems .. "/" .. numHidden + numItems .. ")");
		end
		UIDropDownMenu_SetSelectedID(CT_RaidTrackerRarityDropDown, CT_RaidTracker_SortOptions["itemfilter"]);
		local colors = {
			"|c009d9d9d劣质|r",
			"|c00ffffff普通|r",
			"|c001eff00优秀|r",
			"|c000070dd精良|r",
			"|c00a335ee史诗|r",
			"|c00ff8000传说|r",
			"|c00e6cc80神器",
		};
			
		CT_RaidTrackerRarityDropDownText:SetText(colors[CT_RaidTracker_SortOptions["itemfilter"]]);
	elseif ( CT_RaidTrackerFrame.type == "player" ) then
		CT_RaidTrackerDetailScrollFramePlayers:Hide();
		CT_RaidTrackerDetailScrollFramePlayer:Show();
		CT_RaidTrackerDetailScrollFrameItems:Hide();
		CT_RaidTrackerDetailScrollFrameBossKills:Hide();
		CT_RaidTrackerPlayerRaidTabLooter:Hide();
		CT_RaidTrackerPlayerRaidTab1:SetWidth(300);
		CT_RaidTrackerPlayerRaidTab1Middle:SetWidth(290);
		local name = CT_RaidTrackerFrame.player;

		local raids = { };
		for k, v in CT_RaidTracker_RaidLog do
			local isInRaid;
			for key, val in v["Join"] do
				if ( val["player"] == name ) then
					tinsert(raids, { k, v });
					break;
				end
			end
		end
		
		table.sort(
			raids,
			function(a1, a2)
				if ( CT_RaidTracker_SortOptions["playerraidway"] == "asc" ) then
					return CT_RaidTracker_GetTime(a1[2]["key"]) < CT_RaidTracker_GetTime(a2[2]["key"]);
				else
					return CT_RaidTracker_GetTime(a1[2]["key"]) > CT_RaidTracker_GetTime(a2[2]["key"]);
				end
			end
		);
		getglobal("CT_RaidTrackerDetailScrollFramePlayer").data = raids;
		getglobal("CT_RaidTrackerDetailScrollFramePlayer").name = name;
		getglobal("CT_RaidTrackerDetailScrollFramePlayer").maxlines = getn(raids);
		CT_RaidTracker_DetailScrollFramePlayer_Update();
		CT_RaidTrackerDetailScrollFramePlayer:Show();
		
		CT_RaidTrackerPlayerText:SetText(name .. "的Raids (" .. getn(raids) .. "):");
	elseif ( CT_RaidTrackerFrame.type == "itemhistory" ) then
		CT_RaidTrackerDetailScrollFramePlayers:Hide();
		CT_RaidTrackerDetailScrollFramePlayer:Show();
		CT_RaidTrackerDetailScrollFrameItems:Hide();
		CT_RaidTrackerDetailScrollFrameBossKills:Hide();
		CT_RaidTrackerPlayerRaidTabLooter:Show();
		CT_RaidTrackerPlayerRaidTab1:SetWidth(163);
		CT_RaidTrackerPlayerRaidTab1Middle:SetWidth(155);

		local name, totalItems = CT_RaidTrackerFrame.itemname, 0;

		local items = { };
		for k, v in CT_RaidTracker_RaidLog do
			for key, val in v["Loot"] do
				if ( val["item"]["name"] == name ) then
					tinsert(items, { k, v, val });
					if ( val["item"]["count"] ) then
						totalItems = totalItems + val["item"]["count"];
					else
						totalItems = totalItems + 1;
					end
				end
			end
		end
		
		table.sort(
			items,
			function(a1, a2)
				if ( CT_RaidTracker_SortOptions["itemhistorymethod"] == "looter" ) then
					if ( CT_RaidTracker_SortOptions["itemhistoryway"] == "asc" ) then
						return a1[3]["player"] < a2[3]["player"];
					else
						return a1[3]["player"] > a2[3]["player"];
					end
				else
					if ( CT_RaidTracker_SortOptions["itemhistoryway"] == "asc" ) then
						return CT_RaidTracker_GetTime(a1[2]["key"]) < CT_RaidTracker_GetTime(a2[2]["key"]);
					else
						return CT_RaidTracker_GetTime(a1[2]["key"]) > CT_RaidTracker_GetTime(a2[2]["key"]);
					end
				end
			end
		);

		getglobal("CT_RaidTrackerDetailScrollFramePlayer").data = items;
		getglobal("CT_RaidTrackerDetailScrollFramePlayer").name = name;
		getglobal("CT_RaidTrackerDetailScrollFramePlayer").maxlines = getn(items);
		CT_RaidTracker_DetailScrollFramePlayer_Update();
		CT_RaidTrackerDetailScrollFramePlayer:Show();
		CT_RaidTrackerPlayerText:SetText(name .. " (" .. getn(items) .. "/" .. totalItems .. "):");
	elseif ( CT_RaidTrackerFrame.type == "bosskills" ) then
		CT_RaidTrackerDetailScrollFramePlayers:Hide();
		CT_RaidTrackerDetailScrollFramePlayer:Hide();
		CT_RaidTrackerDetailScrollFrameBossKills:Show();
		CT_RaidTrackerDetailScrollFrameItems:Hide();
		CT_RaidTrackerPlayerBossesTabBoss:Show();
		CT_RaidTrackerPlayerBossesTab1:SetWidth(163);
		CT_RaidTrackerPlayerBossesTab1Middle:SetWidth(155);

		local kills = {};
		if ( CT_RaidTracker_RaidLog[raidid] and CT_RaidTracker_RaidLog[raidid]["BossKills"] ) then
			for key, val in CT_RaidTracker_RaidLog[raidid]["BossKills"] do
				tinsert(kills, val);
			end
		end
		getglobal("CT_RaidTrackerDetailScrollFrameBossKills").raidid = raidid;
		getglobal("CT_RaidTrackerDetailScrollFrameBossKills").kills = kills;
		
		CT_RaidTrackerBosskillsText:SetText("Boss击杀");
		CT_RaidTracker_DetailScrollFrameBoss_Update();
		CT_RaidTrackerDetailScrollFrameBossKills:Show();
	elseif ( CT_RaidTrackerFrame.type == "playeritems" ) then
		CT_RaidTrackerDetailScrollFramePlayers:Hide();
		CT_RaidTrackerDetailScrollFramePlayer:Hide();
		CT_RaidTrackerDetailScrollFrameItems:Show();
		CT_RaidTrackerDetailScrollFrameBossKills:Hide();
		local name = CT_RaidTrackerFrame.player;

		local loot = { };
		for k, v in CT_RaidTracker_RaidLog do
			for key, val in v["Loot"] do
				if ( val["player"] == name ) then
					tinsert(
						loot,
						{
							["note"] = val["note"],
							["player"] = val["player"],
							["time"] = val["time"],
							["item"] = val["item"],
							["ids"] = { k, key }
						}
					);
				end
			end
		end

		local numItems, numHidden = 0, 0;
		local keystoremove = {};
		loot = CT_RaidTracker_SortItem(loot, CT_RaidTracker_SortOptions["playeritemmethod"], CT_RaidTracker_SortOptions["playeritemway"]);
		for key, val in loot do
			if ( CT_RaidTracker_RarityTable[val["item"]["c"]] >= CT_RaidTracker_SortOptions["playeritemfilter"] ) then
				numItems = numItems + 1;
			else
				tinsert(keystoremove, key);
				numHidden = numHidden + 1;
			end
		end
		for key, val in keystoremove do
			table.remove(loot, val);
		end
		getglobal("CT_RaidTrackerDetailScrollFrameItems").raidid = raidid;
		getglobal("CT_RaidTrackerDetailScrollFrameItems").loot = loot;
		CT_RaidTracker_DetailScrollFrameItems_Update();
		if ( numHidden == 0 ) then
			CT_RaidTrackerItemsText:SetText(name .. "的拾取 (" .. numItems .. "):");
		else
			CT_RaidTrackerItemsText:SetText(name .. "的拾取 (" .. numItems .. "/" .. numHidden + numItems .. "):");
		end

		UIDropDownMenu_SetSelectedID(CT_RaidTrackerRarityDropDown, CT_RaidTracker_SortOptions["playeritemfilter"]);
		local colors = {
			"|c009d9d9d劣质|r",
			"|c00ffffff普通|r",
			"|c001eff00优秀|r",
			"|c000070dd精良|r",
			"|c00a335ee史诗|r",
			"|c00ff8000传说|r",
			"|c00e6cc80神器",
		};
			
		CT_RaidTrackerRarityDropDownText:SetText(colors[CT_RaidTracker_SortOptions["playeritemfilter"]]);
	end
end


function CT_RaidTracker_DetailScrollFramePlayers_Update()
	local raidid = getglobal("CT_RaidTrackerDetailScrollFramePlayers").raidid;
	local players = getglobal("CT_RaidTrackerDetailScrollFramePlayers").players;
	local maxlines = getn(players);
	local line;
	local lineplusoffset;
	FauxScrollFrame_Update(CT_RaidTrackerDetailScrollFramePlayers, maxlines, 11, 18);
	for line=1, 11 do
		lineplusoffset = line+FauxScrollFrame_GetOffset(CT_RaidTrackerDetailScrollFramePlayers);
		if (lineplusoffset <= maxlines) then
			val = players[lineplusoffset];
			getglobal("CT_RaidTrackerPlayerLine" .. line).raidid = raidid;
			getglobal("CT_RaidTrackerPlayerLine" .. line).raidtitle = CT_RaidTracker_GetRaidTitle(raidid, 1);
			getglobal("CT_RaidTrackerPlayerLine" .. line).playername = val["name"];
			local name = getglobal("CT_RaidTrackerPlayerLine" .. line .. "Name");
			local number = getglobal("CT_RaidTrackerPlayerLine" .. line .. "Number");
			local join = getglobal("CT_RaidTrackerPlayerLine" .. line .. "Join");
			local leave = getglobal("CT_RaidTrackerPlayerLine" .. line .. "Leave");
			if ( name ) then
				name:SetText(val["name"]);
				local iNumber = lineplusoffset;
				if ( iNumber < 10 ) then
					iNumber = "  " .. iNumber;
				end
				number:SetText(iNumber);
				--join:SetText(date("%I:%M%p", val["join"]));
				join:SetText(date("%H:%M", val["join"]));
				if ( val["leave"] == 99999999999 ) then
					leave:SetText("");
				else
				    leave:SetText(date("%H:%M", val["leave"]));
					--leave:SetText(date("%I:%M%p", val["leave"]));
				end
				if ( CT_RaidTracker_RaidLog[raidid]["PlayerInfos"][val["name"]] and CT_RaidTracker_RaidLog[raidid]["PlayerInfos"][val["name"]]["note"] ) then
					getglobal("CT_RaidTrackerPlayerLine" .. line .. "NoteButtonNormalTexture"):SetVertexColor(1, 1, 1);
				else
					getglobal("CT_RaidTrackerPlayerLine" .. line .. "NoteButtonNormalTexture"):SetVertexColor(0.5, 0.5, 0.5);
				end
				getglobal("CT_RaidTrackerPlayerLine" .. line .. "NoteButton"):Show();
				getglobal("CT_RaidTrackerPlayerLine" .. line .. "DeleteButton"):Show();
				getglobal("CT_RaidTrackerPlayerLine" .. line):Show();
			end
		else
			getglobal("CT_RaidTrackerPlayerLine" .. line):Hide();
		end
	end
	CT_RaidTrackerDetailScrollFramePlayers:Show();
end

function CT_RaidTracker_DetailScrollFrameItems_Update()
	local raidid = getglobal("CT_RaidTrackerDetailScrollFrameItems").raidid;
	local loot = getglobal("CT_RaidTrackerDetailScrollFrameItems").loot;
	local maxlines = getn(loot);
	local line;
	local lineplusoffset;
	FauxScrollFrame_Update(CT_RaidTrackerDetailScrollFrameItems, maxlines, 5, 41);
	for line=1, 5 do
		lineplusoffset = line+FauxScrollFrame_GetOffset(CT_RaidTrackerDetailScrollFrameItems);
		if (lineplusoffset <= maxlines) then
			val = loot[lineplusoffset];
			if ( CT_RaidTrackerFrame.type == "items" ) then
				getglobal("CT_RaidTrackerItem" .. line).raidid = raidid;
				getglobal("CT_RaidTrackerItem" .. line).itemid = val["thisitemid"];
				getglobal("CT_RaidTrackerItem" .. line).itemname = val["item"]["name"];
				if ( val["item"]["count"] and val["item"]["count"] > 1 ) then
					getglobal("CT_RaidTrackerItem" .. line .. "Count"):Show();
					getglobal("CT_RaidTrackerItem" .. line .. "Count"):SetText(val["item"]["count"]);
				else
					getglobal("CT_RaidTrackerItem" .. line .. "Count"):Hide();
				end
				if ( val["item"]["icon"] ) then
					getglobal("CT_RaidTrackerItem" .. line .. "IconTexture"):SetTexture("Interface\\Icons\\" .. val["item"]["icon"]);
				else
					getglobal("CT_RaidTrackerItem" .. line .. "IconTexture"):SetTexture("Interface\\Icons\\INV_Misc_Gear_08");
				end
				local color = val["item"]["c"];
				if ( color == "ff1eff00" ) then
					color = "ff005D00";
				end
				getglobal("CT_RaidTrackerItem" .. line .. "Description"):SetText("|c" .. color .. val["item"]["name"]);
				getglobal("CT_RaidTrackerItem" .. line .. "Looted"):SetText("拾取者: " .. val["player"]);
	
				if ( val["note"] ) then
					getglobal("CT_RaidTrackerItem" .. line .. "NoteNormalTexture"):SetVertexColor(1, 1, 1);
				else
					getglobal("CT_RaidTrackerItem" .. line .. "NoteNormalTexture"):SetVertexColor(0.5, 0.5, 0.5);
				end
			elseif ( CT_RaidTrackerFrame.type == "playeritems" ) then
				getglobal("CT_RaidTrackerItem" .. line).raidid = val["ids"][1];
				getglobal("CT_RaidTrackerItem" .. line).itemid = val["ids"][2];
				getglobal("CT_RaidTrackerItem" .. line).itemname = val["item"]["name"];

				if ( val["item"]["count"] and val["item"]["count"] > 1 ) then
					getglobal("CT_RaidTrackerItem" .. line .. "Count"):Show();
					getglobal("CT_RaidTrackerItem" .. line .. "Count"):SetText(val["item"]["count"]);
				else
					getglobal("CT_RaidTrackerItem" .. line .. "Count"):Hide();
				end
				if ( val["item"]["icon"] ) then
					getglobal("CT_RaidTrackerItem" .. line .. "IconTexture"):SetTexture("Interface\\Icons\\" .. val["item"]["icon"]);
				else
					getglobal("CT_RaidTrackerItem" .. line .. "IconTexture"):SetTexture("Interface\\Icons\\INV_Misc_Gear_08");
				end
				local color = val["item"]["c"];
				if ( color == "ff1eff00" ) then
					color = "ff005D00";
				end
				getglobal("CT_RaidTrackerItem" .. line .. "Description"):SetText("|c" .. color .. val["item"]["name"]);
				getglobal("CT_RaidTrackerItem" .. line .. "Looted"):SetText("拾取 " .. CT_RaidTracker_GetRaidTitle(val["ids"][1], 1));

				if ( val["note"] ) then
					getglobal("CT_RaidTrackerItem" .. line .. "NoteNormalTexture"):SetVertexColor(1, 1, 1);
				else
					getglobal("CT_RaidTrackerItem" .. line .. "NoteNormalTexture"):SetVertexColor(0.5, 0.5, 0.5);
				end	
			end
			getglobal("CT_RaidTrackerItem" .. line):Show();
		else
			getglobal("CT_RaidTrackerItem" .. line):Hide();
		end
	end
	CT_RaidTrackerDetailScrollFrameItems:Show();
end

function CT_RaidTracker_DetailScrollFramePlayer_Update()
	local data = getglobal("CT_RaidTrackerDetailScrollFramePlayer").data;
	local name = getglobal("CT_RaidTrackerDetailScrollFramePlayer").name;
	local maxlines = getglobal("CT_RaidTrackerDetailScrollFramePlayer").maxlines;
	local line;
	local lineplusoffset;
	FauxScrollFrame_Update(CT_RaidTrackerDetailScrollFramePlayer, maxlines, 11, 18);
	for line=1, 11 do
		lineplusoffset = line+FauxScrollFrame_GetOffset(CT_RaidTrackerDetailScrollFramePlayer);
		if (lineplusoffset <= maxlines) then
			val = data[lineplusoffset];
			if ( CT_RaidTrackerFrame.type == "player" ) then
				getglobal("CT_RaidTrackerPlayerRaid" .. line).raidid = val[1];
				getglobal("CT_RaidTrackerPlayerRaid" .. line).playername = name;
				getglobal("CT_RaidTrackerPlayerRaid" .. line).raidtitle = CT_RaidTracker_GetRaidTitle(val[1], 1);
	
				local iNumber = getn(CT_RaidTracker_RaidLog)-val[1]+1;
				if ( iNumber < 10 ) then
					iNumber = "  " .. iNumber;
				end
	
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "MouseOverLeft"):Hide();
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "MouseOverRight"):Hide();
	
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "HitAreaLeft"):Hide();
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "HitAreaRight"):Hide();
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "HitArea"):Show();
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "Note"):Hide();
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "NoteButton"):Show();
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "DeleteButton"):Show();
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "DeleteText"):Show();
	
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "Number"):SetText(iNumber);
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "Name"):SetWidth(200);
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "Name"):SetText(CT_RaidTracker_GetRaidTitle(val[1], 1));

				if ( val[2]["PlayerInfos"][name] and val[2]["PlayerInfos"][name]["note"] ) then
					getglobal("CT_RaidTrackerPlayerRaid" .. line .. "NoteButtonNormalTexture"):SetVertexColor(1, 1, 1);
				else
					getglobal("CT_RaidTrackerPlayerRaid" .. line .. "NoteButtonNormalTexture"):SetVertexColor(0.5, 0.5, 0.5);
				end
			elseif ( CT_RaidTrackerFrame.type == "itemhistory" ) then
				getglobal("CT_RaidTrackerPlayerRaid" .. line).raidid = val[1];
	
				local iNumber = getn(CT_RaidTracker_RaidLog)-val[1]+1;
				if ( iNumber < 10 ) then
					iNumber = "  " .. iNumber;
				end
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "MouseOver"):Hide();
	
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "HitAreaLeft"):Show();
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "HitAreaRight"):Show();
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "HitArea"):Hide();
	
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "NoteButton"):Hide();
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "Note"):Show();
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "DeleteButton"):Hide();
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "DeleteText"):Hide();
	
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "Number"):SetText(iNumber);
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "Name"):SetWidth(130);
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "Name"):SetText(CT_RaidTracker_GetRaidTitle(val[1], 1));
				getglobal("CT_RaidTrackerPlayerRaid" .. line .. "Note"):SetText(val[3]["player"]);
			end
			getglobal("CT_RaidTrackerPlayerRaid" .. line):Show();
		else
			getglobal("CT_RaidTrackerPlayerRaid" .. line):Hide();
		end
	end
	CT_RaidTrackerDetailScrollFramePlayer:Show();
end

function CT_RaidTracker_DetailScrollFrameBoss_Update()
	local kills = getglobal("CT_RaidTrackerDetailScrollFrameBossKills").kills;
	local maxlines = getn(kills);
	local line;
	local lineplusoffset;
	FauxScrollFrame_Update(CT_RaidTrackerDetailScrollFrameBossKills, maxlines, 11, 18);
	for line=1, 11 do
		lineplusoffset = line+FauxScrollFrame_GetOffset(CT_RaidTrackerDetailScrollFrameBossKills);
		if (lineplusoffset <= maxlines) then
			val = kills[lineplusoffset];
			getglobal("CT_RaidTrackerBosses" .. line .. "MouseOver"):Hide();
			getglobal("CT_RaidTrackerBosses" .. line .. "HitArea"):Show();

			getglobal("CT_RaidTrackerBosses" .. line .. "Boss"):SetText(val["boss"]);
			getglobal("CT_RaidTrackerBosses" .. line .. "Time"):SetText(val["time"]);
			getglobal("CT_RaidTrackerBosses" .. line):Show();
		else
			getglobal("CT_RaidTrackerBosses" .. line):Hide();
		end
	end
	CT_RaidTrackerDetailScrollFrameBossKills:Show();
end

function CT_RaidTracker_ColorToRGB(str)
	str = strlower(strsub(str, 3));
	local tbl = { };
	tbl[1], tbl[2], tbl[3], tbl[4], tbl[5], tbl[6] = strsub(str, 1, 1), strsub(str, 2, 2), strsub(str, 3, 3), strsub(str, 4, 4), strsub(str, 5, 5), strsub(str, 6, 6);
	
	local highvals = { ["a"] = 10, ["b"] = 11, ["c"] = 12, ["d"] = 13, ["e"] = 14, ["f"] = 15 };
	for k, v in tbl do
		if ( highvals[v] ) then
			tbl[k] = highvals[v];
		elseif ( tonumber(v) ) then
			tbl[k] = tonumber(v);
		end
	end
	local r, g, b = (tbl[1]*16+tbl[2])/255, (tbl[3]*16+tbl[4])/255, (tbl[5]*16+tbl[6])/255;
	if ( not r or r > 1 or r < 0 ) then
		r = 1;
	end
	if ( not g or g > 1 or g < 0 ) then
		g = 1;
	end
	if ( not b or b > 1 or b < 0 ) then
		b = 1;
	end
	return r, g, b;
end

function CT_RaidTrackerItem_SetHyperlink()
	local raidid = this.raidid;
	local lootid = this.itemid;
	if ( CT_RaidTracker_RaidLog[raidid] and CT_RaidTracker_RaidLog[raidid]["Loot"][lootid] ) then
		local item = CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"];
		GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
		if (GetItemInfo("item:" .. item["id"])) then
			GameTooltip:SetHyperlink("item:" .. item["id"]);
		else
			rl, gl, bl = CT_RaidTracker_ColorToRGB(item["c"]);
			GameTooltip:AddLine(item["name"], rl, gl, bl);
			GameTooltip:AddLine("该物品没有在你的缓存中,你可以点击右键以获得更多信息 (可能会掉线!)", 1, 1, 1);
		end
		
		GameTooltip:AddLine("拾取时间: "..CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["time"], 1, 1, 0);
		if(CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["zone"]) then
			GameTooltip:AddLine("拾取地点: "..CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["zone"], 1, 1, 0);
		end
		if(CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["boss"]) then
			GameTooltip:AddLine("掉落Boss: "..CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["boss"], 1, 1, 0);
		end
		if(CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["costs"]) then
			GameTooltip:AddLine("装备价值: "..CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["costs"], 1, 1, 0);
		end
		if(CT_RaidTracker_Options["DebugFlag"]) then
			if(CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"]["class"]) then
				GameTooltip:AddLine("装备部位: "..CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"]["class"], 1, 1, 0);
			end
			if(CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"]["subclass"]) then
				GameTooltip:AddLine("物品类型: "..CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"]["subclass"], 1, 1, 0);
			end
		end

		GameTooltip:Show();
		return;
	end
end

function CT_RaidTrackerItem_GetChatHyperlink()
	local raidid = this.raidid;
	local lootid = this.itemid;
	if ( IsShiftKeyDown() and ChatFrameEditBox:IsVisible() and CT_RaidTracker_RaidLog[raidid] and CT_RaidTracker_RaidLog[raidid]["Loot"][lootid] ) then
		local item = CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"];
		ChatFrameEditBox:Insert("|c" .. item.c .. "|Hitem:" .. item.id .. "|h[" .. item.name .. "]|h|r");
	end
end

 function CT_RaidTracker_GetItemTooltip(sItem)
	local tTooltip = { };

	CT_RTTooltip:SetOwner(this, "ANCHOR_LEFT");
	CT_RTTooltip:ClearLines()
	CT_RTTooltip:SetHyperlink("item:" .. sItem);
	CT_RTTooltip.id = sItem;
	for i = 1, CT_RTTooltip:NumLines(), 1 do
		local tl, tr;
		tl = getglobal("CT_RTTooltipTextLeft" .. i):GetText();
		tr = getglobal("CT_RTTooltipTextRight" .. i):GetText();
		tinsert(tTooltip, { ["left"] = tl, ["right"] = tr });
	end
	CT_RTTooltip:Hide();
	return tTooltip;
end

-- Debug function(s)

function CT_RaidTracker_Debug(...)
	if ( CT_RaidTracker_Options["DebugFlag"] ) then
		local sDebug = "#";
		for i = 1, arg.n, 1 do
			if ( arg[i] ) then
				sDebug = sDebug .. arg[i] .. "#";
			end
		end
		DEFAULT_CHAT_FRAME:AddMessage(sDebug, 1, 0.5, 0);
	end
end
		

-- OnFoo functions

function CT_RaidTracker_OnLoad()
	CT_RaidTrackerTitleText:SetText("DKP记录系统");
	-- Register events
	this:RegisterEvent("CHAT_MSG_LOOT");
	this:RegisterEvent("CHAT_MSG_SYSTEM");
	this:RegisterEvent("RAID_ROSTER_UPDATE");
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
	this:RegisterEvent("ZONE_CHANGED_NEW_AREA");
	this:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH");
	this:RegisterEvent("CHAT_MSG_MONSTER_YELL");
end

function CT_RaidTracker_OnEvent(event)
	--CT_RaidTracker_Debug("event fired", event);
	if ( CT_RaidTracker_UpdateFrame.time and CT_RaidTracker_UpdateFrame.time <= 2 ) then
		tinsert(CT_RaidTracker_Events, event);
		return;
	end

	if ( event == "CHAT_MSG_MONSTER_YELL" ) then -- Sorry, Majordomo needs a little hack
		if(arg1 == CT_RaidTracker_lang_BossKills_Majordomo_Yell) then
			CT_RaidTracker_Debug("It's domo!");
			event = "CHAT_MSG_COMBAT_HOSTILE_DEATH";
			arg1 = string.gsub(CT_RaidTracker_ConvertGlobalString(UNITDIESOTHER), "%(%.%+%)", CT_RaidTracker_lang_BossKills_Majordomo_BossName);
		end
	end
	if ( event == "RAID_ROSTER_UPDATE" or event == "PLAYER_ENTERING_WORLD" ) then
		if ( GetNumRaidMembers() == 0 and event == "RAID_ROSTER_UPDATE" and CT_RaidTracker_GetCurrentRaid) then
			local raidendtime = CT_RaidTracker_Date();
			for k, v in CT_RaidTracker_Online do
				CT_RaidTracker_Debug("ADDING LEAVE", k, raidendtime);
				tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
					{
						["player"] = k,
						["time"] = raidendtime,
					}
				);
			end
			if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["End"]) then
				CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["End"] = raidendtime;
			end
			CT_RaidTracker_GetCurrentRaid = nil;
			CT_RaidTracker_Debug("Left raid.");
			CT_RaidTracker_Offline = { };
			CT_RaidTracker_UpdateView();
			CT_RaidTracker_Update();
		elseif ( not CT_RaidTracker_GetCurrentRaid and GetNumRaidMembers() > 0 and event == "RAID_ROSTER_UPDATE" and CT_RaidTracker_Options["AutoRaidCreation"] == 1) then
			CT_RaidTrackerCreateNewRaid();
		end
		if ( not CT_RaidTracker_GetCurrentRaid ) then
			return;
		end
		local updated;
		for i = 1, GetNumRaidMembers(), 1 do
			local name, online = UnitName("raid" .. i), UnitIsConnected("raid" .. i);
			if ( name and name ~= CT_RaidTracker_lang_UnknownEntity) then
				local race = UnitRace("raid" .. i);
				local class = UnitClass("raid" .. i);
				local level = UnitLevel("raid" .. i);
				if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"]) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"] = { };
				end
				if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name] = { };
				end
				if(CT_RaidTracker_Options["SaveExtendedPlayerInfo"] == 1) then
				    if(race) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["race"] = race; end
				    if(class) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["class"] = class; end
				    if(level > 0) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["level"] = level; end
				end
				if ( online ~= CT_RaidTracker_Online[name] ) then
					-- Status isn't updated
					CT_RaidTracker_Debug("Status isn't updated", name, online);
					if ( not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] and CT_RaidTracker_Options["AutoRaidCreation"] == 1) then
						CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] = { 
							["Loot"] = { },
							["Join"] = { },
							["Leave"] = { },
							["PlayerInfos"] = { },
							["BossKills"] = { },
						};
					end
					if( CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] ) then
						if ( not online ) then
							if ( online ~= CT_RaidTracker_Online[name] ) then
								tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
									{
										["player"] = name,
										["time"] = CT_RaidTracker_Date()
									}
								);
								CT_RaidTracker_Debug("OFFLINE", name, CT_RaidTracker_Date());
							end
						else
							tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Join"],
								{
									["player"] = name,
									--["race"] = race,
									--["class"] = class,
									--["level"] = level,
									["time"] = CT_RaidTracker_Date()
								}
								);
							CT_RaidTracker_Debug("ONLINE", name, CT_RaidTracker_Date());
						end
						updated = 1;
					end
				end
				CT_RaidTracker_Online[name] = online;
			end
		end
		if ( updated ) then
			CT_RaidTracker_Update();
			CT_RaidTracker_UpdateView();
		end
	elseif ( event == "CHAT_MSG_LOOT" and CT_RaidTracker_GetCurrentRaid ) then
		if(not testo) then
			testo = {};
		end
		tinsert(testo, arg1);
		local sPlayer, sLink, sPlayerName, sItem, iCount;
		if(string.find(arg1, CT_RaidTracker_lang_ReceivesLoot1)) then
			iStart, iEnd, sPlayerName, sItem = string.find(arg1, CT_RaidTracker_lang_ReceivesLoot1);
			iCount = 1;
			CT_RaidTracker_Debug("itedroped", "format", 1, sPlayerName, sItem, iCount);
		elseif(string.find(arg1, CT_RaidTracker_lang_ReceivesLoot2)) then
			iStart, iEnd, sItem = string.find(arg1, CT_RaidTracker_lang_ReceivesLoot2);
			iCount = 1;
			sPlayerName = CT_RaidTracker_lang_ReceivesLootYou;
			CT_RaidTracker_Debug("itedroped", "format", 2, sPlayerName, sItem, iCount);
		elseif(string.find(arg1, CT_RaidTracker_lang_ReceivesLoot3)) then
			iStart, iEnd, sPlayerName, sItem, iCount = string.find(arg1, CT_RaidTracker_lang_ReceivesLoot3);
			CT_RaidTracker_Debug("itedroped", "format", 3, sPlayerName, sItem, iCount);
		elseif(string.find(arg1, CT_RaidTracker_lang_ReceivesLoot4)) then
			iStart, iEnd, sItem, iCount = string.find(arg1, CT_RaidTracker_lang_ReceivesLoot4);
			sPlayerName = CT_RaidTracker_lang_ReceivesLootYou;
			CT_RaidTracker_Debug("itedroped", "format", 4, sPlayerName, sItem, iCount);
		end
		
		CT_RaidTracker_Debug("itedroped", "link", sItem);
		if ( sPlayerName ) then
			if(sPlayerName == CT_RaidTracker_lang_ReceivesLootYou) then
				CT_RaidTracker_Debug("itedroped", "It's me");
				sPlayer = UnitName("player");
			else
				CT_RaidTracker_Debug("itedroped", "It's sombody else");
				sPlayer = sPlayerName;
			end
			sLink = sItem;
		end
		iCount = tonumber(iCount);
		if(not iCount) then
			iCount = 1;
		end
		CT_RaidTracker_Debug("itedroped", sPlayer, sLink, iCount);
		-- Make sure there is a link
		if ( sLink and sPlayer ) then
			local sColor, sItem, sName = CT_RaidTracker_GetItemInfo(sLink);
			local itemoptions;
			for key, val in CT_RaidTracker_ItemOptions do
				if(string.find(sItem, "^"..val["id"]..":%d+:%d+:%d+")) then
					itemoptions = val;
					CT_RaidTracker_Debug("ItemOptions", "FoundItem", key);
				end
			end
			local iotrack, iogroup, iocostsgrabbing, ioaskcosts
			if ( (itemoptions and itemoptions["status"] and itemoptions["status"] == 1) or ((sColor and sItem and sName and CT_RaidTracker_RarityTable[sColor] >= CT_RaidTracker_Options["MinQuality"]) and (not itemoptions or not itemoptions["status"]))) then
				-- Insert into table
				if ( not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] and CT_RaidTracker_Options["AutoRaidCreation"] == 1) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] = { 
						["Loot"] = { },
						["Join"] = { },
						["Leave"] = { },
						["PlayerInfos"] = { },
						["BossKills"] = { },
					};
				end
				local found = nil;
				if( CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] ) then
					if( (itemoptions and itemoptions["group"] and itemoptions["group"] == 1) or ((CT_RaidTracker_Options["GroupItems"] ~= 0 and CT_RaidTracker_RarityTable[sColor] <= CT_RaidTracker_Options["GroupItems"]) and (not itemoptions or not itemoptions["group"])) ) then
						CT_RaidTracker_Debug("Trying to group", sName, sPlayer);
						for k, v in CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Loot"] do
							if ( v["item"]["name"] == sName and v["player"] == sPlayer ) then
								if ( v["item"]["count"] ) then
									CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Loot"][k]["item"]["count"] = v["item"]["count"]+iCount;
								else
									CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Loot"][k]["item"]["count"] = iCount;
								end
								found = 1;
								CT_RaidTracker_Debug("Grouped", sName, sPlayer, CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Loot"][k]["item"]["count"]);
								break;
							end
						end
					end
					if ( not found ) then
						local nameGIF, linkGIF, qualityGIF, minLevelGIF, classGIF, subclassGIF, maxStackGIF, invtypeGIV, iconGIF = GetItemInfo("item:"..sItem);
						_, _, iconGIF = string.find(iconGIF, "^.*\\(.*)$");
						local splitted = { [0] = 0, [1] = 0, [2] = 0, [3] = 0 };
						local trimed;
						local i = 0;
						local sNote, sCosts, sBoss;
						
						for item in string.gfind(string.gsub(sItem, "^%s*(.-)%s*$", "%1") .. ":", "([^:]*):?") do
							trimed = string.gsub(item, "^%s*(.-)%s*$", "%1");
							if(string.len(trimed) >= 1) then
								splitted[i] = trimed;
								i = i + 1;
							end
						end
						if( (itemoptions and itemoptions["costsgrabbing"] and itemoptions["costsgrabbing"] == 1) or ((CT_RaidTracker_Options["GetDkpValue"] ~= 0 and CT_RaidTracker_RarityTable[sColor] >= CT_RaidTracker_Options["GetDkpValue"]) and (not itemoptions or not itemoptions["costsgrabbing"]))) then
							if(DKPValues and DKPValues[tostring(splitted[0])]) then -- AdvancedItemTooltip
								sCosts = tonumber(DKPValues[tostring(splitted[0])]);
							elseif(HDKP_GetDKP) then -- HoB_DKP
								sCosts = tonumber(HDKP_GetDKP(splitted[0], splitted[1], splitted[2], splitted[3]));
							end
							CT_RaidTracker_Debug("Splitted", splitted[0], splitted[1], splitted[2], splitted[3]);
							if(sCosts == 0) then
								sCosts = nil;
							end
						end
						
						if(CT_RaidTracker_Options["AutoBoss"] >= 1) then
							sBoss = CT_RaidTracker_Options["AutoBossBoss"];
						end
						
						local tAttendees = { };
						if(CT_RaidTracker_Options["LogAttendees"] == 2) then
						    for i = 1, GetNumRaidMembers() do
							    local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
							    local name = UnitName("raid" .. i);
							    if (name and online and name ~= CT_RaidTracker_lang_UnknownEntity) then
								    tinsert(tAttendees, name);
							    end
						    end
						end
						
						local tTooltip = { };
						if(CT_RaidTracker_Options["SaveTooltips"] == 1) then
							tTooltip = CT_RaidTracker_GetItemTooltip(sItem);
						end
						
						local sTime = CT_RaidTracker_Date();
						tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Loot"], 1,
							{
								["player"] = sPlayer,
								["item"] = {						
									["c"] = sColor,
									["id"] = sItem,
									["tooltip"] = tTooltip,
									["name"] = sName,
									["icon"] = iconGIF,
									["count"] = iCount,
									["class"] = classGIF,
									["subclass"] = subclassGIF,
									["subclass"] = subclassGIF,
								},
								["zone"] = GetRealZoneText(),
								["costs"] = sCosts,
								["boss"] = sBoss,
								["time"] = sTime,
								["note"] = sNote,
								["attendees"] = tAttendees,
							}
						);
						
						if ( (itemoptions and itemoptions["askcosts"] and itemoptions["askcosts"] == 1) or ((CT_RaidTracker_Options["AskCost"] ~= 0 and CT_RaidTracker_RarityTable[sColor] >= CT_RaidTracker_Options["AskCost"]) and (not itemoptions or not itemoptions["askcosts"])) ) then -- code and idea from tlund
							CT_RaidTracker_EditCosts(CT_RaidTracker_GetCurrentRaid, 1);
						end
					end
				end
				
				CT_RaidTracker_Debug(sPlayer, sColor, sItem, sName);
				CT_RaidTracker_Update();
				CT_RaidTracker_UpdateView();
			end
		end
	
	elseif ( event == "CHAT_MSG_SYSTEM" and UnitName("player") and UnitName("player") ~= CT_RaidTracker_lang_UnknownEntity and CT_RaidTracker_GetCurrentRaid ) then
		local sDate = CT_RaidTracker_Date();
		local iStart, iEnd, sPlayer = string.find(arg1, CT_RaidTracker_lang_LeftGroup);
		if ( sPlayer and sPlayer ~= UnitName("player") and UnitName("player") and UnitName("player") ~= CT_RaidTracker_lang_UnknownEntity and sPlayer ~= CT_RaidTracker_lang_UnknownEntity and CT_RaidTracker_Online[sPlayer]) then
			tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
				{
					["player"] = sPlayer,
					["time"] = sDate
				}
			);
			CT_RaidTracker_Online[sPlayer] = nil;
			CT_RaidTracker_Debug(sPlayer, "LEFT", sDate);
		end
		--[[
		local race, lass, level;
		local iStart, iEnd, sPlayer = string.find(arg1, CT_RaidTracker_lang_JoinedGroup);
		if ( sPlayer and sPlayer ~= UnitName("player") and sPlayer ~= CT_RaidTracker_lang_UnknownEntity) then
			tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Join"],
				{
					["player"] = sPlayer,
					["time"] = sDate
				}
			);
			CT_RaidTracker_Debug(sPlayer, "JOIN", sDate);
		end
		]]

		CT_RaidTracker_UpdateView();
		CT_RaidTracker_Update();
	
	elseif ( event == "VARIABLES_LOADED" ) then
		CT_RaidTracker_RunVersionFix();
		CT_RaidTracker_GetGameTimeOffset();
	elseif ( event == "UPDATE_MOUSEOVER_UNIT" ) then	
		if(CT_RaidTracker_Options["AutoBoss"] == 1) then
			local autoboss_unitname = UnitName("mouseover");
			local autoboss_newboss;
			if(not UnitIsFriend("mouseover", "player") and not UnitInRaid("mouseover") and not UnitInParty("mouseover")) then
				--CT_RaidTracker_Debug("possible mouseover unit update", autoboss_unitname);
				if(CT_RaidTracker_BossUnitTriggers[autoboss_unitname]) then
					if(CT_RaidTracker_BossUnitTriggers[autoboss_unitname] ~= "IGNORE") then
						autoboss_newboss = CT_RaidTracker_BossUnitTriggers[autoboss_unitname];
					end
				elseif(CT_RaidTracker_BossUnitTriggers["DEFAULTBOSS"]) then
					autoboss_newboss = CT_RaidTracker_BossUnitTriggers["DEFAULTBOSS"];
				else
					autoboss_newboss = nil
				end
				if(autoboss_newboss and CT_RaidTracker_Options["AutoBossBoss"] ~= autoboss_newboss) then
					CT_RaidTracker_Options["AutoBossBoss"] = autoboss_newboss;
					CT_RaidTracker_Print("CT_RaidTracker 自动更新Boss: "..autoboss_newboss, 1, 1, 0);
				end
			end
		end
	elseif ( event == "ZONE_CHANGED_NEW_AREA" ) then
		if(CT_RaidTracker_Options["AutoZone"] == 1) then
			CT_RaidTracker_DoZoneCheck();
		end
	elseif ( event == "CHAT_MSG_COMBAT_HOSTILE_DEATH" ) then
		local bosskilled, autoboss_newboss;
		local sDate = CT_RaidTracker_Date();
		for unit in string.gfind(arg1, CT_RaidTracker_ConvertGlobalString(UNITDIESOTHER)) do
			CT_RaidTracker_Debug("CHAT_MSG_COMBAT_HOSTILE_DEATH","unit", unit);
			if(CT_RaidTracker_Options["AutoBoss"] == 2 and CT_RaidTracker_GetCurrentRaid) then
				if(not CT_RaidTracker_Online[unit]) then
					if(CT_RaidTracker_BossUnitTriggers[unit]) then
						if(CT_RaidTracker_BossUnitTriggers[unit] ~= "IGNORE") then
							autoboss_newboss = CT_RaidTracker_BossUnitTriggers[unit];
						end
					elseif(CT_RaidTracker_BossUnitTriggers["DEFAULTBOSS"]) then
						autoboss_newboss = CT_RaidTracker_BossUnitTriggers["DEFAULTBOSS"];
					else
						autoboss_newboss = nil
					end
					if(autoboss_newboss and CT_RaidTracker_Options["AutoBossBoss"] ~= autoboss_newboss) then
						CT_RaidTracker_Options["AutoBossBoss"] = autoboss_newboss;
						CT_RaidTracker_Print("CT_RaidTracker 自动更新Boss: "..autoboss_newboss, 1, 1, 0);
					end
				end
			end
			
			if(CT_RaidTracker_GetCurrentRaid and CT_RaidTracker_BossUnitTriggers[unit] and CT_RaidTracker_BossUnitTriggers[unit] ~= "IGNORE") then	
				local newboss = 1;
				bosskilled = CT_RaidTracker_BossUnitTriggers[unit];
				if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"]) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"] = { };
				end
				-- is the boss already killed?
				for key, val in CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"] do
				    if(val["boss"] == bosskilled) then
				        newboss = 0;
				    end
				end
				if (newboss == 1) then
				    local tAttendees = { };
					if( CT_RaidTracker_Options["LogAttendees"] == 1) then
						for i = 1, GetNumRaidMembers() do
							local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
							local name = UnitName("raid" .. i);
							-- dont care if the player is online, could have gone LD. players in the raid gets credit for bosskill
							--if (name and online and name ~= CT_RaidTracker_lang_UnknownEntity) then
							if (name and name ~= CT_RaidTracker_lang_UnknownEntity) then
								tinsert(tAttendees, name);
							end
						end
					end
				    tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"],
        				{
        					["boss"] = bosskilled,
        					["time"] = sDate,
        					["attendees"] = tAttendees
        				}
			            );
			        CT_RaidTracker_Print("CT_RaidTracker Boss击杀: 设置 \""..bosskilled.."\" 死亡时间为 "..sDate, 1, 1, 0);
				end
				
				--if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"][bosskilled]) then
				--	CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"][bosskilled] = sDate;
				--	CT_RaidTracker_Print("CT_RaidTracker Boss击杀: 设置 \""..bosskilled.."\" 死亡时间为 "..sDate, 1, 1, 0);
				--end
			end
		end
	end
end

function CT_RaidTracker_DoZoneCheck()
	if(not CT_RaidTracker_GetCurrentRaid) then
		return;
	end
	local newzone = GetRealZoneText();
	if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["zone"]) then
		for k, v in CT_RaidTracker_ZoneTriggers do
			if(newzone == k) then
				CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["zone"] = v;
				CT_RaidTracker_Update();
				CT_RaidTracker_UpdateView();
				break;
			end
		end
	end
	if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["zone"]) then
		for k, v in CT_RaidTracker_CustomZoneTriggers do
			if(newzone == k) then
				CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["zone"] = v;
				CT_RaidTracker_Update();
				CT_RaidTracker_UpdateView();
				break;
			end
		end
	end
	return true;
end

-- Item functions
function CT_RaidTracker_GetItemInfo(sItem)
	-- Thanks to Telo for the following regular expression
	local iStart, iEnd, sColor, sItemName, sName = string.find(sItem, "|c(%x+)|Hitem:(%d+:%d+:%d+:%d+)|h%[(.-)%]|h|r");
	CT_RaidTracker_Debug("sColor:", sColor,"sItemName:", sItemName,"sName:", sName);
	return sColor, sItemName, sName;
end

SlashCmdList["RAIDTRACKER"] = function(msg)
	local _, _, command, args = string.find(msg, "(%w+)%s?(.*)");
	if(command) then
		command = strlower(command);
	end
	
	if(command == "debug") then
		if(args == "1") then
			CT_RaidTracker_Options["DebugFlag"] = 1;
			CT_RaidTracker_Print("调试输出开启", 1, 1, 0);
		elseif(args == "0") then
			CT_RaidTracker_Options["DebugFlag"] = nil;
			CT_RaidTracker_Print("调试输出关闭", 1, 1, 0);
		else
			if(CT_RaidTracker_Options["DebugFlag"] == 1) then
				CT_RaidTracker_Print("调试输出: 开启", 1, 1, 0);
			else
				CT_RaidTracker_Print("调试输出: 关闭", 1, 1, 0);
			end
		end
	elseif(command == "oldformat") then
		if(args == "1") then
			CT_RaidTracker_Options["OldFormat"] = 1;
			CT_RaidTracker_Print("旧格式输出开启", 1, 1, 0);
		elseif(args == "0") then
			CT_RaidTracker_Options["OldFormat"] = 0;
			CT_RaidTracker_Print("旧格式输出关闭", 1, 1, 0);
		else
			if(CT_RaidTracker_Options["OldFormat"] == 1) then
				CT_RaidTracker_Print("旧格式输出: 开启", 1, 1, 0);
			else
				CT_RaidTracker_Print("旧格式输出: 关闭", 1, 1, 0);
			end
		end
	elseif(command == "ttout") then
	  if(args == "1") then
		  CT_RaidTracker_Options["ttout"] = 1;
		  CT_RaidTracker_Print("Tooltip输出开启", 1, 1, 0);
		elseif(args == "0") then
			CT_RaidTracker_Options["ttout"] = 0;
			CT_RaidTracker_Print("Tooltip输出关闭", 1, 1, 0);
		else
			if(CT_RaidTracker_Options["ttout"] == 1) then
				CT_RaidTracker_Print("Tooltip输出: 开启", 1, 1, 0);
			else
				CT_RaidTracker_Print("Tooltip输出: 关闭", 1, 1, 0);
			end
		end
	elseif(command == "deleteall") then
		CT_RaidTracker_Print("删除所有"..getn(CT_RaidTracker_RaidLog).." 次Raids", 1, 1, 0);
		CT_RaidTracker_RaidLog = { };
		CT_RaidTracker_GetCurrentRaid = nil;
		CT_RaidTracker_UpdateView();
		CT_RaidTracker_Update();
	elseif(command == "additem") then
		if(args and args ~= "") then
			local sColor, sItem, sName = CT_RaidTracker_GetItemInfo(args);
			if(sItem and sItem) then
				if(CT_RaidTrackerFrame.selected) then
					local nameGIF, linkGIF, qualityGIF, minLevelGIF, classGIF, subclassGIF, maxStackGIF, invtypeGIV, iconGIF = GetItemInfo("item:"..sItem);
					if(iconGIF) then 
						_, _, iconGIF = string.find(iconGIF, "^.*\\(.*)$");
					end
					
					local tAttendees = { };
					if(CT_RaidTracker_Options["LogAttendees"] == 2) then
					    for i = 1, GetNumRaidMembers() do
						    local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
						    local name = UnitName("raid" .. i);
						    if (name and online and name ~= CT_RaidTracker_lang_UnknownEntity) then
							    tinsert(tAttendees, name);
						    end
					    end
					end
					
					local tTooltip = { };
					if(CT_RaidTracker_Options["SaveTooltips"] == 1) then
						tTooltip = CT_RaidTracker_GetItemTooltip(sItem);
					end
					
					local sTime = CT_RaidTracker_Date();
					tinsert(CT_RaidTracker_RaidLog[CT_RaidTrackerFrame.selected]["Loot"], 1,
						{
							["player"] = "",
							["item"] = {						
								["c"] = sColor,
								["id"] = sItem,
								["tooltip"] = tTooltip,
								["name"] = sName,
								["icon"] = iconGIF,
								["count"] = 1,
								["class"] = classGIF,
								["subclass"] = subclassGIF,
							},
							["zone"] = GetRealZoneText(),
							["time"] = sTime,
							["attendees"] = tAttendees,
						}
					);
					CT_RaidTracker_Print("添加物品: 添加 "..sName, 1, 1, 0);
					CT_RaidTracker_UpdateView();
					CT_RaidTracker_Update();
				else
					CT_RaidTracker_Print("添加物品: 没有选择Raid", 1, 1, 0);
				end
			else
				CT_RaidTracker_Print("添加物品: 无效的物品链接", 1, 1, 0);
			end
		else
			CT_RaidTracker_Print("添加物品: 没有物品链接", 1, 1, 0);
		end
	elseif(command == "io") then
		local idfound;
		for idtoadd in string.gfind(args, "item:(%d+):") do
			idfound = nil;
			idtoadd = tonumber(idtoadd);
			for key, val in CT_RaidTracker_ItemOptions do
				if(val["id"] == idtoadd) then
					idfound = true;
					break;
				end
			end
			if(idfound) then
				CT_RaidTracker_Print(idtoadd.." 已经在物品选项列表", 1, 1, 0);
			else
				tinsert(CT_RaidTracker_ItemOptions, {["id"] = idtoadd});
				CT_RaidTracker_Print("添加 "..idtoadd.." 到物品选项列表", 1, 1, 0);
				idfound = true;
			end
		end
		if(not idfound) then
			for idtoadd in string.gfind(args, "(%d+)%s?") do
				idfound = nil;
				idtoadd = tonumber(idtoadd);
				CT_RaidTracker_Debug("idtoadd", idtoadd);
				for key, val in CT_RaidTracker_ItemOptions do
					if(val["id"] == idtoadd) then
						idfound = true;
						break;
					end
				end
				if(idfound) then
					CT_RaidTracker_Print(idtoadd.." 已经在物品选项列表", 1, 1, 0);
				else
					tinsert(CT_RaidTracker_ItemOptions, {["id"] = idtoadd});
					CT_RaidTracker_Print("添加 "..idtoadd.." 到物品选项列表", 1, 1, 0);
				end
			end
		end
		CT_RaidTracker_ItemOptions_ScrollBar_Update();
		CT_RaidTrackerItemOptionsFrame:Show();
		
    elseif(command == "options") then
	    CT_RaidTrackerOptionsFrame:Show();
	elseif(command == "o") then
		CT_RaidTrackerOptionsFrame:Show();
	elseif(command == "join") then
		if(CT_RaidTrackerFrame.selected) then
			if(args and strlen(args) > 0) then
				CT_RaidTrackerJoinLeaveFrameNameEB:SetText(args);
			end
			CT_RaidTrackerJoinLeaveFrameTitle = "Join";
			CT_RaidTrackerJoinLeaveFrame.type = "Join";
			CT_RaidTrackerJoinLeaveFrame.raidid = CT_RaidTrackerFrame.selected;
			CT_RaidTrackerJoinLeaveFrame:Show();
		else
			CT_RaidTracker_Print("加入: 没有选择Raid", 1, 1, 0);
		end
	elseif(command == "leave") then
		if(CT_RaidTrackerFrame.selected) then
			if(args and strlen(args) > 0) then
				CT_RaidTrackerJoinLeaveFrameNameEB:SetText(args);
			end
			CT_RaidTrackerJoinLeaveFrameTitle = "Leave";
			CT_RaidTrackerJoinLeaveFrame.type = "Leave";
			CT_RaidTrackerJoinLeaveFrame.raidid = CT_RaidTrackerFrame.selected;
			CT_RaidTrackerJoinLeaveFrame:Show();
		else
			CT_RaidTracker_Print("加入: 没有选择Raid", 1, 1, 0);
		end
	elseif(command) then
		CT_RaidTracker_Print("/rt - 显示插件控制面板", 1, 1, 0);
		CT_RaidTracker_Print("/options/o - 显示选项", 1, 1, 0);
		CT_RaidTracker_Print("/rt io - 显示物品选项面板", 1, 1, 0);
		CT_RaidTracker_Print("/rt io [ITEMLINK(S)/ITEMID(S)] - 添加给定物品到物品选项列表", 1, 1, 0);
		CT_RaidTracker_Print("/rt additem [ITEMLINK] - 添加给定物品到你选定的Raid物品拾取列表", 1, 1, 0);
		CT_RaidTracker_Print("/rt join [PLAYER] - 手动添加1个参与人员", 1, 1, 0);
		CT_RaidTracker_Print("/rt leave [PLAYER] - 手动删除1个参与人员", 1, 1, 0);
		CT_RaidTracker_Print("/rt oldformat 0/1 - 关闭/开启旧格式输出", 1, 1, 0);
		CT_RaidTracker_Print("/rt deleteall - 删除所有Raid", 1, 1, 0);
		CT_RaidTracker_Print("/rt debug 0/1 - 关闭/开启调试输出", 1, 1, 0);
	else
		ShowUIPanel(CT_RaidTrackerFrame);	
	end
end

SLASH_RAIDTRACKER1 = "/raidtracker";
SLASH_RAIDTRACKER2 = "/rt";

function CT_RaidTracker_Print(msg, r, g, b)
	if ( CT_Print ) then
		CT_Print(msg, r, g, b);
	else
		DEFAULT_CHAT_FRAME:AddMessage(msg, r, g, b);
	end
end

function CT_RaidTracker_RarityDropDown_OnLoad()
	UIDropDownMenu_Initialize(this, CT_RaidTracker_RarityDropDown_Initialize);
	--UIDropDownMenu_SetWidth(130);
	UIDropDownMenu_SetSelectedID(CT_RaidTrackerRarityDropDown, 1);
end

-- Grey = 9d9d9d
-- White = ffffff
-- Green = 1eff00
-- Blue = 0070dd
-- Purple = a335ee
-- Orange = ff8000
-- Red e6cc80

function CT_RaidTracker_RarityDropDown_Initialize()
	local info = {};
	info.text = "|c009d9d9d劣质|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
	
	local info = {};
	info.text = "|c00ffffff普通|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = "|c001eff00优秀|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);

	info = {};
	info.text = "|c000070dd精良|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);

	info = {};
	info.text = "|c00a335ee史诗|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);

	info = {};
	info.text = "|c00ff8000传说|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
	
	info = {};
	info.text = "|c00e6cc80神器|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
end


function CT_RaidTracker_RarityDropDown_OnClick()
	UIDropDownMenu_SetSelectedID(CT_RaidTrackerRarityDropDown, this:GetID());
	if ( CT_RaidTrackerFrame.type == "items" ) then
		CT_RaidTracker_SortOptions["itemfilter"] = this:GetID();
	else
		CT_RaidTracker_SortOptions["playeritemfilter"] = this:GetID();
	end
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_SelectItem(name)
	CT_RaidTracker_GetPage();
	CT_RaidTrackerFrame.type = "itemhistory";
	CT_RaidTrackerFrame.itemname = name;
	CT_RaidTrackerFrame.selected = nil;
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_GetPage()
	if ( CT_RaidTrackerFrame.type or CT_RaidTrackerFrame.itemname or CT_RaidTrackerFrame.selected or CT_RaidTrackerFrame.player ) then

		tinsert(CT_RaidTracker_LastPage,
			{
				["type"] = CT_RaidTrackerFrame.type,
				["itemname"] = CT_RaidTrackerFrame.itemname,
				["selected"] = CT_RaidTrackerFrame.selected,
				["player"] = CT_RaidTrackerFrame.player
			}
		);
	end

	if ( getn(CT_RaidTracker_LastPage) > 0 ) then
		CT_RaidTrackerFrameBackButton:Enable();
	else
		CT_RaidTrackerFrameBackButton:Disable();
	end
end

function CT_RaidTracker_GoBack()
	local t = table.remove(CT_RaidTracker_LastPage);

	if ( t ) then
		CT_RaidTrackerFrame.type = t["type"];
		CT_RaidTrackerFrame.itemname = t["itemname"];
		CT_RaidTrackerFrame.selected = t["selected"];
		CT_RaidTrackerFrame.player = t["player"];
		CT_RaidTracker_Update();
		CT_RaidTracker_UpdateView();
	end
	if ( getn(CT_RaidTracker_LastPage) > 0 ) then
		CT_RaidTrackerFrameBackButton:Enable();
	else
		CT_RaidTrackerFrameBackButton:Disable();
	end
end

if ( CT_RegisterMod ) then
	CT_RaidTracker_DisplayWindow = function()
		ShowUIPanel(CT_RaidTrackerFrame);
	end
	CT_RegisterMod("Raid Tracker", "Display window", 5, "Interface\\Icons\\INV_Chest_Chain_05", "Displays the Raid Tracker window, which tracks raid loot & attendance.", "switch", "", CT_RaidTracker_DisplayWindow);
else
	--CT_RaidTracker_Print("<CTMod> CT_RaidTracker loaded. Type /rt to show the RaidTracker window.", 1, 1, 0);
end

function CT_RaidTracker_FixZero(num)
	if ( num < 10 ) then
		return "0" .. num;
	else
		return num;
	end
end

function CT_RaidTracker_Date()
	local timestamp;
	if(CT_RaidTracker_Options["TimeSync"] == 1) then
		timestamp = time()+CT_RaidTracker_TimeOffset+(CT_RaidTracker_Options["Timezone"]*3600);
	else
		timestamp = time()+(CT_RaidTracker_Options["Timezone"]*3600);
	end
	local t = date("*t", timestamp);
	return CT_RaidTracker_FixZero(t.month) .. "/" .. CT_RaidTracker_FixZero(t.day) .. "/" .. strsub(t.year, 3) .. " " .. CT_RaidTracker_FixZero(t.hour) .. ":" .. CT_RaidTracker_FixZero(t.min) .. ":" .. CT_RaidTracker_FixZero(t.sec);
end

function CT_RaidTrackerUpdateFrame_OnUpdate(elapsed)
	if ( this.time ) then
		this.time = this.time + elapsed;
		if ( this.time > 2 ) then
			this.time = nil;
			for k, v in CT_RaidTracker_Events do
				CT_RaidTracker_OnEvent(v);
			end
		end
	end
end

function CT_RaidTrackerCreateNewRaid()
	CT_RaidTracker_GetGameTimeOffset();
	local sDate = CT_RaidTracker_Date();
	if(CT_RaidTracker_GetCurrentRaid) then
		for k, v in CT_RaidTracker_Online do
			CT_RaidTracker_Debug("ADDING LEAVE", k, sDate);
			tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
				{
					["player"] = k,
					["time"] = sDate,
				}
			);
		end
		if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["End"]) then
			CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["End"] = sDate;
		end
	end
	CT_RaidTracker_Online = { };
	CT_RaidTracker_Offline = { };
	tinsert(CT_RaidTracker_RaidLog, 1, { 
		["Loot"] = { },
		["Join"] = { },
		["Leave"] = { },
		["PlayerInfos"] = { },
		["BossKills"] = { },
		["key"] = sDate
	});
	CT_RaidTracker_SortRaidTable();
	CT_RaidTracker_GetCurrentRaid = 1;
	for i = 1, GetNumRaidMembers(), 1 do
		local sPlayer = UnitName("raid" .. i);
		local race = UnitRace("raid" .. i);
		local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
		if(sPlayer ~= CT_RaidTracker_lang_UnknownEntity and name and name ~= CT_RaidTracker_lang_UnknownEntity) then
			if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]) then
				CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name] = { };
			end
			if(CT_RaidTracker_Options["SaveExtendedPlayerInfo"] == 1) then
			    if(race) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["race"] = race; end
			    if(fileName) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["class"] = fileName; end
			    if(level > 0) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["level"] = level; end
			end
			tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Join"],
				{
					["player"] = sPlayer,
					["time"] = sDate
				}
			);
			if ( not online ) then
				tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
					{
						["player"] = UnitName("raid" .. i),
						["time"] = sDate
					}
				);
			end
			CT_RaidTracker_Online[name] = online;
		end
	end
	if(CT_RaidTracker_Options["AutoZone"] == 1) then
		CT_RaidTracker_DoZoneCheck()
	end
	CT_RaidTracker_Debug("Joined new raid at " .. sDate);
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTrackerEndRaid()
    local raidendtime = CT_RaidTracker_Date();
    if(CT_RaidTracker_GetCurrentRaid) then
        CT_RaidTracker_Print("当前raid结束时间 "..raidendtime, 1, 1, 0);
    	for k, v in CT_RaidTracker_Online do
    		CT_RaidTracker_Debug("ADDING LEAVE", k, raidendtime);
    		tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
    			{
    				["player"] = k,
    				["time"] = raidendtime,
    			}
    		);
    	end
    	if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["End"]) then
    		CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["End"] = raidendtime;
    	end
    	CT_RaidTracker_GetCurrentRaid = nil;
    	CT_RaidTracker_Debug("Left raid.");
    	CT_RaidTracker_Online = { };
    	CT_RaidTracker_UpdateView();
    	CT_RaidTracker_Update();
    end
end

function CT_RaidTrackerSnapshotRaid()
    local sDate = CT_RaidTracker_Date();
    local newraid = {};
    if(CT_RaidTracker_GetCurrentRaid) then
        CT_RaidTracker_Print("创建当前Raid快照", 1, 1, 0);
        tinsert(CT_RaidTracker_RaidLog, 2, { 
    		["Loot"] = { },
    		["Join"] = { },
    		["Leave"] = { },
    		["PlayerInfos"] = { },
    		["BossKills"] = { },
    		["key"] = sDate,
    		["End"] = sDate,
	        });
	    if(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Zone"]) then
	        CT_RaidTracker_RaidLog[2]["Zone"] = CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Zone"];
	    end
	    
	    for k, v in CT_RaidTracker_Online do
            CT_RaidTracker_RaidLog[2]["PlayerInfos"][k] = {};
            tinsert(CT_RaidTracker_RaidLog[2]["Join"], {
                ["player"] = k,
                ["time"] = sDate 
                });
            tinsert(CT_RaidTracker_RaidLog[2]["Leave"], {
                ["player"] = k,
                ["time"] = sDate 
                });
	    end
	    CT_RaidTracker_UpdateView();
    	CT_RaidTracker_Update();
    end
end
	
function CT_RaidTrackerAddGuild()
	if(CT_RaidTracker_GetCurrentRaid) then
     for i = 1, GetNumGuildMembers() do
        local name, rank, rankIndex, level, class, zone, group, note, officernote, online = GetGuildRosterInfo(i);
       -- CT_RaidTracker_Debug("GUILD", name, online);
        if( online ~= CT_RaidTracker_Online[name] ) then
          if( online ) then
            tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Join"],
            {
               ["player"] = name,
               ["time"] = CT_RaidTracker_Date()
            }
            );
            CT_RaidTracker_Online[name] = online;
            CT_RaidTracker_Debug("GUILD-ONLINE", name);
          elseif ( not online and CT_RaidTracker_Online[name]) then
						tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
							{
								["player"] = name,
								["time"] = CT_RaidTracker_Date()
							}
						);
						CT_RaidTracker_Online[name] = online;
						CT_RaidTracker_Debug("GUILD-OFFLINE", name);
         	end
       	end
     end
  end
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

--PlayerGroupsIndexes = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};

function CT_RaidTracker_GetPlayerIndexes(raidid)
	local PlayerIndexes = { };
	local PlayerFound = nil;
	if(CT_RaidTracker_RaidLog[raidid]) then
		for k, v in CT_RaidTracker_RaidLog[raidid]["Join"] do
			if ( v["player"] ) then
				PlayerFound = false;
				for k2, v2 in PlayerIndexes do
					if(v2 == v["player"]) then
						PlayerFound = true;
						break;
					end
				end
				if(not PlayerFound) then
					tinsert(PlayerIndexes, v["player"]);
				end
			end
		end
	end
	table.sort(PlayerIndexes);
	return PlayerIndexes;
end

function CT_RaidTracker_GetPlayerGroups(raidid)
	local PlayerIndexes = CT_RaidTracker_GetPlayerIndexes(raidid);
	local PlayerGroups = { };
	local PlayerGroup;
	for k, v in PlayerIndexes do
		PlayerGroup = CT_RaidTracker_PlayerGroupIndex(CT_RaidTracker_RaidLog[raidid]["PlayerInfos"][v]["class"]);
		if(not PlayerGroups[PlayerGroup]) then
			PlayerGroups[PlayerGroup] = { };
		end
		tinsert(PlayerGroups[PlayerGroup], v);
	end
	return PlayerGroups;
end

function CT_RaidTracker_PlayerGroupIndex(letter)
--	letter = strupper(letter);
	for k, v in PlayerGroupsIndexes do
		if(v == letter) then
			return k;
		end
	end
	return;
end

--[[
  function CT_RaidTracker_StripSpecialChars(sstring)
	
	sstring = string.gsub(sstring, "\194\161", "!");
	sstring = string.gsub(sstring, "\194\170", "a");
	sstring = string.gsub(sstring, "\194\186", "o");
	sstring = string.gsub(sstring, "\194\191", "?");
	sstring = string.gsub(sstring, "\195\128", "A");
	sstring = string.gsub(sstring, "\195\129", "A");
	sstring = string.gsub(sstring, "\195\130", "A");
	sstring = string.gsub(sstring, "\195\131", "A");
	sstring = string.gsub(sstring, "\195\133", "A");
	sstring = string.gsub(sstring, "\195\135", "C");
	sstring = string.gsub(sstring, "\195\136", "E");
	sstring = string.gsub(sstring, "\195\137", "E");
	sstring = string.gsub(sstring, "\195\138", "E");
	sstring = string.gsub(sstring, "\195\139", "E");
	sstring = string.gsub(sstring, "\195\140", "I");
	sstring = string.gsub(sstring, "\195\141", "I");
	sstring = string.gsub(sstring, "\195\142", "I");
	sstring = string.gsub(sstring, "\195\143", "I");
	sstring = string.gsub(sstring, "\195\144", "D");
	sstring = string.gsub(sstring, "\195\145", "N");
	sstring = string.gsub(sstring, "\195\146", "O");
	sstring = string.gsub(sstring, "\195\147", "O");
	sstring = string.gsub(sstring, "\195\148", "O");
	sstring = string.gsub(sstring, "\195\149", "O");
	sstring = string.gsub(sstring, "\195\152", "O");
	sstring = string.gsub(sstring, "\195\153", "U");
	sstring = string.gsub(sstring, "\195\154", "U");
	sstring = string.gsub(sstring, "\195\155", "U");
	sstring = string.gsub(sstring, "\195\157", "Y");
	sstring = string.gsub(sstring, "\195\160", "a");
	sstring = string.gsub(sstring, "\195\161", "a");
	sstring = string.gsub(sstring, "\195\162", "a");
	sstring = string.gsub(sstring, "\195\163", "a");
	sstring = string.gsub(sstring, "\195\165", "a");
	sstring = string.gsub(sstring, "\195\167", "c");
	sstring = string.gsub(sstring, "\195\168", "e");
	sstring = string.gsub(sstring, "\195\169", "e");
	sstring = string.gsub(sstring, "\195\170", "e");
	sstring = string.gsub(sstring, "\195\171", "e");
	sstring = string.gsub(sstring, "\195\172", "i");
	sstring = string.gsub(sstring, "\195\173", "i");
	sstring = string.gsub(sstring, "\195\174", "i");
	sstring = string.gsub(sstring, "\195\175", "i");
	sstring = string.gsub(sstring, "\195\176", "d");
	sstring = string.gsub(sstring, "\195\177", "n");
	sstring = string.gsub(sstring, "\195\178", "o");
	sstring = string.gsub(sstring, "\195\179", "o");
	sstring = string.gsub(sstring, "\195\180", "o");
	sstring = string.gsub(sstring, "\195\181", "o");
	sstring = string.gsub(sstring, "\195\184", "o");
	sstring = string.gsub(sstring, "\195\185", "u");
	sstring = string.gsub(sstring, "\195\186", "u");
	sstring = string.gsub(sstring, "\195\187", "u");
	sstring = string.gsub(sstring, "\195\189", "y");
	sstring = string.gsub(sstring, "\195\191", "y");
	sstring = string.gsub(sstring, "\195\132", "Ae");
	sstring = string.gsub(sstring, "\195\134", "AE");
	sstring = string.gsub(sstring, "\195\150", "Oe");
	sstring = string.gsub(sstring, "\195\156", "Ue");
	sstring = string.gsub(sstring, "\195\158", "TH");
	sstring = string.gsub(sstring, "\195\159", "ss");
	sstring = string.gsub(sstring, "\195\164", "ae");
	sstring = string.gsub(sstring, "\195\166", "ae");
	sstring = string.gsub(sstring, "\195\182", "oe");
	sstring = string.gsub(sstring, "\195\188", "ue");
	sstring = string.gsub(sstring, "\195\190", "th");
	return sstring;
end
--]]
function CT_RaidTrackerShowDkpLink(link)
	URLFrameEditBox:SetText(link);
	URLFrameEditBox:HighlightText();
	URLFrame:Show();
end

function CT_RaidTrackerGenerateDkpLink(id)
	local race, class, level;
	local link = "<RaidInfo>";
	if(CT_RaidTracker_Options["OldFormat"] == 1) then
		link = link.."<key>"..CT_RaidTracker_RaidLog[id]["key"].."</key>";
	end
	if(CT_RaidTracker_Options["OldFormat"] == 0) then
		link = link.."<start>"..CT_RaidTracker_GetTime(CT_RaidTracker_RaidLog[id]["key"]).."</start>";
	else
		link = link.."<start>"..CT_RaidTracker_RaidLog[id]["key"].."</start>";
	end
	
	if(CT_RaidTracker_RaidLog[id]["End"]) then
		if(CT_RaidTracker_Options["OldFormat"] == 0) then
			link = link.."<end>"..CT_RaidTracker_GetTime(CT_RaidTracker_RaidLog[id]["End"]).."</end>";
		else
			link = link.."<end>"..CT_RaidTracker_RaidLog[id]["End"].."</end>";
		end
	end
	if(CT_RaidTracker_RaidLog[id]["zone"]) then
		link = link.."<zone>"..CT_RaidTracker_RaidLog[id]["zone"].."</zone>";
	end
	if(CT_RaidTracker_RaidLog[id]["PlayerInfos"]) then
		link = link.."<PlayerInfos>";
		local playerinfosindex = 1;
		for key, val in CT_RaidTracker_RaidLog[id]["PlayerInfos"] do
			link = link.."<key"..playerinfosindex..">";
			link = link.."<name>"..key.."</name>";
			for key2, val2 in CT_RaidTracker_RaidLog[id]["PlayerInfos"][key] do
				if(key2 == "note") then
					link = link.."<"..key2.."><![CDATA["..val2.."]]></"..key2..">";
				
				else
					link = link.."<"..key2..">"..val2.."</"..key2..">";
				end
			end
			link = link.."</key"..playerinfosindex..">";
			playerinfosindex = playerinfosindex + 1;
		end
		link = link.."</PlayerInfos>";
	end
	if(CT_RaidTracker_RaidLog[id]["BossKills"]) then
		local bosskillsindex = 1;
		link = link.."<BossKills>";
		for key, val in CT_RaidTracker_RaidLog[id]["BossKills"] do
			link = link.."<key"..bosskillsindex..">";
			link = link.."<name>"..val["boss"].."</name>";
			if(CT_RaidTracker_Options["OldFormat"] == 0) then
				link = link.."<time>"..CT_RaidTracker_GetTime(val["time"]).."</time>";
			else
				link = link.."<time>"..val["time"].."</time>";
			end
			link = link.."</key"..bosskillsindex..">";
			bosskillsindex = bosskillsindex + 1;
		end
		link = link.."</BossKills>";
	end
	if(CT_RaidTracker_Options["OldFormat"] == 1) then
			local sNote = "<note><![CDATA[";
			if(CT_RaidTracker_RaidLog[id]["note"]) then sNote = sNote..CT_RaidTracker_RaidLog[id]["note"]; end
			if(CT_RaidTracker_RaidLog[id]["zone"]) then sNote = sNote.." - Zone: "..CT_RaidTracker_RaidLog[id]["zone"]; end
			sNote = sNote.."]]></note>";
			link = link..sNote;
		else
			if(CT_RaidTracker_RaidLog[id]["note"]) then link = link.."<note><![CDATA["..CT_RaidTracker_RaidLog[id]["note"].."]]></note>"; end
		end
	link = link.."<Join>";
	for key, val in CT_RaidTracker_RaidLog[id]["Join"] do
		link = link.."<key"..key..">";
		link = link.."<player>"..val["player"].."</player>";
		if(CT_RaidTracker_Options["OldFormat"] == 1) then
			if(val["race"]) then
				race = val["race"]; 
			elseif(CT_RaidTracker_RaidLog[id]["PlayerInfos"] and CT_RaidTracker_RaidLog[id]["PlayerInfos"][val["player"]] and CT_RaidTracker_RaidLog[id]["PlayerInfos"][val["player"]]["race"]) then
				race = CT_RaidTracker_RaidLog[id]["PlayerInfos"][val["player"]]["race"]; 
			else
				race = nil;
			end
			if(val["class"]) then
				class = val["class"]; 
			elseif(CT_RaidTracker_RaidLog[id]["PlayerInfos"] and CT_RaidTracker_RaidLog[id]["PlayerInfos"][val["player"]] and CT_RaidTracker_RaidLog[id]["PlayerInfos"][val["player"]]["class"]) then
				class = CT_RaidTracker_RaidLog[id]["PlayerInfos"][val["player"]]["class"]; 
			else
				class = nil;
			end
			if(val["level"]) then
				level = val["level"]; 
			elseif(CT_RaidTracker_RaidLog[id]["PlayerInfos"] and CT_RaidTracker_RaidLog[id]["PlayerInfos"][val["player"]] and CT_RaidTracker_RaidLog[id]["PlayerInfos"][val["player"]]["level"]) then
				level = CT_RaidTracker_RaidLog[id]["PlayerInfos"][val["player"]]["level"]; 
			else
				level = nil;
			end
			if(race) then link = link.."<race>"..race.."</race>"; end
			if(class) then link = link.."<class>"..class.."</class>"; end
			if(level) then link = link.."<level>"..level.."</level>"; end
		end
		if(CT_RaidTracker_Options["OldFormat"] == 1 and CT_RaidTracker_RaidLog[id]["PlayerInfos"][val["player"]] and CT_RaidTracker_RaidLog[id]["PlayerInfos"][val["player"]]["note"]) then link = link.."<note>"..CT_RaidTracker_RaidLog[id]["PlayerInfos"][val["player"]]["note"].."</note>"; end
		if(CT_RaidTracker_Options["OldFormat"] == 0) then
			link = link.."<time>"..CT_RaidTracker_GetTime(val["time"]).."</time>";
		else
			link = link.."<time>"..val["time"].."</time>";
		end
		link = link.."</key"..key..">";
	end
	link = link.."</Join>";
	link = link.."<Leave>";
	for key, val in CT_RaidTracker_RaidLog[id]["Leave"] do
		link = link.."<key"..key..">";
		link = link.."<player>"..val["player"].."</player>";
		if(CT_RaidTracker_Options["OldFormat"] == 0) then
			link = link.."<time>"..CT_RaidTracker_GetTime(val["time"]).."</time>";
		else
			link = link.."<time>"..val["time"].."</time>";
		end
		link = link.."</key"..key..">";
	end
	link = link.."</Leave>";
	link = link.."<Loot>";
	for key, val in CT_RaidTracker_RaidLog[id]["Loot"] do
		link = link.."<key"..key..">";
		link = link.."<ItemName>"..val["item"]["name"].."</ItemName>";
		link = link.."<ItemID>"..val["item"]["id"].."</ItemID>";
		if(val["item"]["icon"]) then link = link.."<Icon>"..val["item"]["icon"].."</Icon>"; end
		if(val["item"]["class"]) then link = link.."<Class>"..val["item"]["class"].."</Class>"; end
		if(val["item"]["subclass"]) then link = link.."<SubClass>"..val["item"]["subclass"].."</SubClass>"; end
		link = link.."<Color>"..val["item"]["c"].."</Color>";
		link = link.."<Count>"..val["item"]["count"].."</Count>";
		link = link.."<Player>"..val["player"].."</Player>";
		if(val["costs"]) then
			link = link.."<Costs>"..val["costs"].."</Costs>";
		end
		if(CT_RaidTracker_Options["OldFormat"] == 0) then
			link = link.."<Time>"..CT_RaidTracker_GetTime(val["time"]).."</Time>";
		else
			link = link.."<Time>"..val["time"].."</Time>";
		end
		if(val["zone"]) then link = link.."<Zone>"..val["zone"].."</Zone>"; end
		if(val["boss"]) then link = link.."<Boss>"..val["boss"].."</Boss>"; end
		if(CT_RaidTracker_Options["OldFormat"] == 1) then
			local sNote = "<Note><![CDATA[";
			if(val["note"]) then sNote = sNote..val["note"]; end
			if(val["zone"]) then sNote = sNote.." - Zone: "..val["zone"]; end
			if(val["boss"]) then sNote = sNote.." - Boss: "..val["boss"]; end
			if(val["costs"]) then sNote = sNote.." - "..val["costs"].." DKP"; end
			sNote = sNote.."]]></Note>";
			link = link..sNote;
		else
			if(val["note"]) then link = link.."<Note><![CDATA["..val["note"].."]]></Note>"; end
		end
		if ( CT_RaidTracker_Options["ttout"] == 1 ) then
				
				link = link.."<tooltip>";
				if ( not CT_RaidTracker_RaidLog[id]["Loot"][key]["item"]["tooltip"] or not CT_RaidTracker_RaidLog[id]["Loot"][key]["item"]["tooltip"][1] or not CT_RaidTracker_RaidLog[id]["Loot"][key]["item"]["tooltip"][1]["left"] ) then
					local tTooltip = { };
					if( CT_RaidTracker_Options["SaveTooltips"] == 1 ) then
						CT_RaidTracker_RaidLog[id]["Loot"][key]["item"]["tooltip"] = CT_RaidTracker_GetItemTooltip(val["item"]["id"]);
					end
					for k, v in CT_RaidTracker_GetItemTooltip(val["item"]["id"]) do
						if (v["right"]) then
							link = link..v["left"].."|"..v["right"]..";";
						else
							link = link..v["left"]..";";
						end
					end
				else
					for k, v in CT_RaidTracker_RaidLog[id]["Loot"][key]["item"]["tooltip"] do
						if (v["right"]) then
							link = link..v["left"].."|"..v["right"]..";";
						else
							link = link..v["left"]..";";
						end
					end
				end
				link = link.."</tooltip>";
			end
		link = link.."</key"..key..">";
	end
	link = link.."</Loot>";
	link = link.."</RaidInfo>";
	CT_RaidTrackerShowDkpLink(link);
end

-- Editing
function CT_RaidTracker_EditPlayerNote(raidid, playerid)
    CT_RaidTrackerEditNoteFrame.type = "playernote";
    CT_RaidTrackerEditNoteFrame.raidid = raidid;
    CT_RaidTrackerEditNoteFrame.playerid = playerid;
    CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditRaidNote(raidid)
	CT_RaidTrackerEditNoteFrame:Hide();
	CT_RaidTrackerEditNoteFrame.type = "raidnote";
	CT_RaidTrackerEditNoteFrame.raidid = raidid;
	CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditItemNote(raidid, itemid)
    CT_RaidTrackerEditNoteFrame.type = "itemnote";
    CT_RaidTrackerEditNoteFrame.raidid = raidid;
    CT_RaidTrackerEditNoteFrame.itemid = itemid;
    CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditItemCount(raidid, itemid)
    CT_RaidTrackerEditNoteFrame.type = "itemcount";
    CT_RaidTrackerEditNoteFrame.raidid = raidid;
    CT_RaidTrackerEditNoteFrame.itemid = itemid;
    CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditCosts(raidid, itemid)
    CT_RaidTrackerEditNoteFrame.type = "itemcost";
    CT_RaidTrackerEditNoteFrame.raidid = raidid;
    CT_RaidTrackerEditNoteFrame.itemid = itemid;
    CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditLooter(raidid, itemid)
	CT_RaidTracker_Debug("CT_RaidTracker_EditLooter", raidid, itemid);
	CT_RaidTrackerEditNoteFrame.type = "looter";
    CT_RaidTrackerEditNoteFrame.raidid = raidid;
    CT_RaidTrackerEditNoteFrame.itemid = itemid;
    CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditTime(raidid, what)
	-- what: raidend/raidstart
 	CT_RaidTrackerEditNoteFrame.type = "time";
 	CT_RaidTrackerEditNoteFrame.what = what;
	CT_RaidTrackerEditNoteFrame.raidid = raidid;
	CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditItemTime(raidid, itemid)
 	CT_RaidTrackerEditNoteFrame.type = "time";
 	CT_RaidTrackerEditNoteFrame.what = "item";
	CT_RaidTrackerEditNoteFrame.raidid = raidid;
	CT_RaidTrackerEditNoteFrame.itemid = itemid;
	CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditZone(raidid)
	CT_RaidTrackerEditNoteFrame.type = "zone";
	CT_RaidTrackerEditNoteFrame.raidid = raidid;
	CT_RaidTrackerEditNoteFrame:Show();
end


function CT_RaidTracker_EditNote_OnShow()
	local text;
	
	if ( this.itemid ) then
		CT_RaidTrackerEditNoteFrame.itemitemid = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["id"];
		CT_RaidTrackerEditNoteFrame.itemtime = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["time"];
		CT_RaidTrackerEditNoteFrame.itemplayer = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["player"];
	end
	
	if ( this.type == "raidnote" ) then
	    local raidkey = CT_RaidTracker_RaidLog[this.raidid]["key"];
	    getglobal(this:GetName() .. "Title"):SetText("编辑备注");
	    getglobal(this:GetName() .. "Editing"):SetText("为 \"|c" .. "0000ff00" .. "" .. raidkey .. "|r\"编辑备注");
			text = CT_RaidTracker_RaidLog[this.raidid]["note"];
	
	elseif ( this.type == "itemnote" ) then
	    local itemname = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["name"];
	    local itemcolor = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["c"];
	    getglobal(this:GetName() .. "Title"):SetText("编辑备注");
	    getglobal(this:GetName() .. "Editing"):SetText("为 \"|c" .. itemcolor .. "" .. itemname .. "|r\"编辑备注");
			text = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["note"];
	
	elseif ( this.type == "itemcount" ) then
	    local itemname = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["name"];
	    local itemcolor = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["c"];
	    getglobal(this:GetName() .. "Title"):SetText("编辑数量");
	    getglobal(this:GetName() .. "Editing"):SetText("为 \"|c" .. itemcolor .. "" .. itemname .. "|r\"编辑数量");
			text = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["count"];
	
	elseif ( this.type == "playernote") then
	    getglobal(this:GetName() .. "Title"):SetText("编辑备注");
	    getglobal(this:GetName() .. "Editing"):SetText("为 \"" .. this.playerid .. "\"编辑备注");
	    if( CT_RaidTracker_RaidLog[this.raidid]["PlayerInfos"][this.playerid] and CT_RaidTracker_RaidLog[this.raidid]["PlayerInfos"][this.playerid]["note"] ) then
		    text = CT_RaidTracker_RaidLog[this.raidid]["PlayerInfos"][this.playerid]["note"];
			end
	
	elseif(this.type == "itemcost") then
	    local itemname = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["name"];
	    local itemcolor = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["c"];
	    getglobal(this:GetName() .. "Title"):SetText("编辑价值");
	    getglobal(this:GetName() .. "Editing"):SetText("为 \"|c" .. itemcolor .. "" .. itemname .. "|r\"编辑价值");
			text = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["costs"];
	
	elseif(this.type == "looter") then
	    local itemname = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["name"];
	    local itemcolor = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["c"];
	    local looter = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["player"];
	    getglobal(this:GetName() .. "Title"):SetText("编辑拾取者");
	    getglobal(this:GetName() .. "Editing"):SetText("为 \"|c" .. itemcolor .. "" .. itemname .. "|r\"编辑拾取者");
	    text = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["player"];
	
	elseif(this.type == "time") then
	    getglobal(this:GetName() .. "Title"):SetText("编辑时间");
	    if(this.what == "raidend") then
	        getglobal(this:GetName() .. "Editing"):SetText("编辑结束时间");
		    text = CT_RaidTracker_RaidLog[this.raidid]["End"];
	    elseif(this.what == "raidstart") then
	      getglobal(this:GetName() .. "Editing"):SetText("编辑开始时间");
		    text = CT_RaidTracker_RaidLog[this.raidid]["key"];
		  elseif(this.what == "item") then
	      getglobal(this:GetName() .. "Editing"):SetText("编辑拾取时间");
		    text = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["time"];
	    end
	    
	elseif(this.type == "zone") then
	    local raidkey = CT_RaidTracker_RaidLog[this.raidid]["key"];
	    text = CT_RaidTracker_RaidLog[this.raidid]["zone"];
	    getglobal(this:GetName() .. "Title"):SetText("编辑地点");
	    getglobal(this:GetName() .. "Editing"):SetText("为 \"|c" .. "0000ff00" .. "" .. raidkey .. "|r\"编辑地点");
	end
	
	if ( text ) then
		getglobal(this:GetName() .. "NoteEB"):SetText(text);
		getglobal(this:GetName() .. "NoteEB"):HighlightText();
	else
		getglobal(this:GetName() .. "NoteEB"):SetText("");
	end
end

function CT_RaidTracker_SaveNote()
	local text = CT_RaidTrackerEditNoteFrameNoteEB:GetText();
	local raidid = CT_RaidTrackerEditNoteFrame.raidid;
	local type = CT_RaidTrackerEditNoteFrame.type;
	local lootid;
	if(CT_RaidTrackerEditNoteFrame.itemplayer and CT_RaidTrackerEditNoteFrame.itemitemid and CT_RaidTrackerEditNoteFrame.itemtime) then
		lootid = CT_RaidTracker_GetLootId(raidid, CT_RaidTrackerEditNoteFrame.itemplayer, CT_RaidTrackerEditNoteFrame.itemitemid, CT_RaidTrackerEditNoteFrame.itemtime)
	end
	
	CT_RaidTracker_Debug("CT_RaidTracker_SaveNote", raidid, type, lootid);
	
	if ( strlen(text) == 0 ) then
		text = nil;
	end
	
	if (type == "itemnote") then
		CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["note"] = text;
		
	elseif (type == "itemcount") then
		if(not text or not string.find(text, "^(%d+)$") ) then
			CT_RaidTracker_Print("CT_RaidTracker编辑数量: 未知数量", 1, 1, 0);
		else
			CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"]["count"] = tonumber(text);
		end
	
	elseif (type == "raidnote" ) then
		CT_RaidTracker_RaidLog[raidid]["note"] = text;
	
	elseif(type == "playernote") then
	    local playerid = CT_RaidTrackerEditNoteFrame.playerid;
		if ( not CT_RaidTracker_RaidLog[raidid]["PlayerInfos"][playerid] ) then
			CT_RaidTracker_RaidLog[raidid]["PlayerInfos"][playerid] = {};
		end
		CT_RaidTracker_RaidLog[raidid]["PlayerInfos"][playerid]["note"] = text;
	
	elseif(type == "itemcost") then
	    if(text and not string.find(text, "^(%d+%.?%d*)$") ) then
		    CT_RaidTracker_Print("CT_RaidTracker编辑价值: 未知价值", 1, 1, 0);
		  else
		  	CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["costs"] = text;
	    end
	
	elseif(type == "looter") then
	    if(text and strlen(text) > 0) then
	        CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["player"] = text;
	    end
	
	elseif(type == "time") then
	    local what = CT_RaidTrackerEditNoteFrame.what;
	    if(text and not string.find(text, "^(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)$")) then
		    CT_RaidTracker_Print("CT_RaidTracker编辑时间: 未知的时间格式", 1, 1, 0);
		  else
		  	if(what == "raidend") then
			    CT_RaidTracker_RaidLog[raidid]["End"] = text;
		    elseif(what == "raidstart") then
			    CT_RaidTracker_RaidLog[raidid]["key"] = text;
			  elseif(what == "item") then
			  	CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["time"] = text;
		    end
	    end
	    
	elseif(type == "zone") then
	    CT_RaidTracker_SaveZone(raidid, text);
	end
	
	CT_RaidTrackerEditNoteFrame.type = nil;
	CT_RaidTrackerEditNoteFrame.raidid = nil;
	CT_RaidTrackerEditNoteFrame.playerid = nil;
	CT_RaidTrackerEditNoteFrame.what = nil;
	CT_RaidTrackerEditNoteFrame.itemid = nil;
	CT_RaidTrackerEditNoteFrame.itemplayer = nil;
	CT_RaidTrackerEditNoteFrame.itemitemid = nil;
	CT_RaidTrackerEditNoteFrame.itemtime = nil;
	
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_SaveZone(raidid, text)
	local zone, zonetrigger, zonefound;
	if (text == nil or strlen(text) == 0 ) then
		text = nil;
		zone = nil;
		zonetrigger = nil;
	elseif( string.find(text, "^(.+)%-(.+)$") ) then
		_, _, zone, zonetrigger = string.find(text, "^(.+)%-(.+)$");
	else
		zone = text;
		zonetrigger = text;
	end
	if(zone and zonetrigger) then
		if(not CT_RaidTracker_RaidLog[raidid]["zone"] or CT_RaidTracker_RaidLog[raidid]["zone"] ~= zone) then
			for k, v in CT_RaidTracker_ZoneTriggers do
				if(zonetrigger == k) then
					zonefound = 1;
					break;
				end
			end
			if(not zonefound) then
				for k, v in CT_RaidTracker_CustomZoneTriggers do
					if(zonetrigger == k) then
						zonefound = 1;
						break;
					end
				end
			end
			if(not zonefound) then
				CT_RaidTracker_Print("CT_RaidTracker自定地区: 添加 \""..zone.."\" (触发: \""..zonetrigger.."\")", 1, 1, 0);
				CT_RaidTracker_CustomZoneTriggers[zonetrigger] = zone;
			end
		end
	elseif(not zone and not zonetrigger and CT_RaidTracker_RaidLog[raidid]["zone"]) then
		for k, v in CT_RaidTracker_CustomZoneTriggers do
			if(v == CT_RaidTracker_RaidLog[raidid]["zone"]) then
				CT_RaidTracker_CustomZoneTriggers[k] = nil;
				CT_RaidTracker_Print("CT_RaidTracker自定地区: 删除 \""..v.."\" (触发: \""..k.."\")", 1, 1, 0);
			end
		end
	end
	
	CT_RaidTracker_RaidLog[raidid]["zone"] = zone;
end

function CT_RaidTracker_LootSetBoss(raidid, itemitemid, itemtime, itemplayer, boss)

	local lootid = CT_RaidTracker_GetLootId(raidid, itemplayer, itemitemid, itemtime);
	CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["boss"] = boss;
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_LootSetLooter(raidid, itemitemid, itemtime, itemplayer, player)
	local lootid = CT_RaidTracker_GetLootId(raidid, itemplayer, itemitemid, itemtime);
	CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["player"] = player;
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_RaidSetZone(raidid, zone)
	CT_RaidTracker_RaidLog[raidid]["zone"] = zone;
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_ItemsRightClickMenu_Initialize(level)
	if(not level) then
		return;
	end
	local raidid, itemid = 0, 0;
	local dropdown, info;
	if ( UIDROPDOWNMENU_OPEN_MENU ) then
		dropdown = getglobal(UIDROPDOWNMENU_OPEN_MENU);
	else
		dropdown = this;
	end
	
	if (level == 1) then
		raidid = this:GetParent().raidid;
		itemid = this:GetParent().itemid;
		local itemitemid = CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["item"]["id"];
		local itemtime = CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["time"];
		local itemplayer = CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["player"];
		
		info = {};
		info.text = "编辑拾取者";
		info.hasArrow = 1;
		info.value = { ["opt"] = "quick_looter", ["raidid"] = raidid, ["itemid"] = itemid, ["itemitemid"] = itemitemid, ["itemtime"] = itemtime, ["itemplayer"] = itemplayer, ["cplayer"] = CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["player"] };
		info.func = function()
			HideDropDownMenu(1);
			local lootid = CT_RaidTracker_GetLootId(this.value["raidid"], this.value["itemplayer"], this.value["itemitemid"], this.value["itemtime"]);
			CT_RaidTracker_EditLooter(this.value["raidid"], lootid);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		if(CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["costs"]) then
			info.text = "编辑价值("..CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["costs"]..")";
		else
			info.text = "编辑价值";
		end
		info.value = { ["raidid"] = raidid, ["itemid"] = itemid, ["itemitemid"] = itemitemid, ["itemtime"] = itemtime, ["itemplayer"] = itemplayer };
		info.func = function()
			HideDropDownMenu(1);
			local lootid = CT_RaidTracker_GetLootId(this.value["raidid"], this.value["itemplayer"], this.value["itemitemid"], this.value["itemtime"]);
			CT_RaidTracker_EditCosts(this.value.raidid, lootid);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		if(CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["item"]["count"]) then
			info.text = "编辑数量("..CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["item"]["count"]..")";
		else
			info.text = "编辑数量";
		end
		info.value = { ["raidid"] = raidid, ["itemid"] = itemid, ["itemitemid"] = itemitemid, ["itemtime"] = itemtime, ["itemplayer"] = itemplayer };
		info.func = function()
			HideDropDownMenu(1);
			local lootid = CT_RaidTracker_GetLootId(this.value["raidid"], this.value["itemplayer"], this.value["itemitemid"], this.value["itemtime"]);
			CT_RaidTracker_EditItemCount(this.value.raidid, lootid);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		info.text = "编辑时间";
		info.value = { ["raidid"] = raidid, ["itemid"] = itemid, ["itemitemid"] = itemitemid, ["itemtime"] = itemtime, ["itemplayer"] = itemplayer };
		info.func = function()
			HideDropDownMenu(1);
			local lootid = CT_RaidTracker_GetLootId(this.value["raidid"], this.value["itemplayer"], this.value["itemitemid"], this.value["itemtime"]);
			CT_RaidTracker_EditItemTime(this.value.raidid, lootid);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		info.text = "掉落于:";
		info.hasArrow = 1;
		info.value = { ["opt"] = "dropped_from_zones", ["raidid"] = raidid, ["itemid"] = itemid, ["itemitemid"] = itemitemid, ["itemtime"] = itemtime, ["itemplayer"] = itemplayer };
		if(CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["boss"]) then
			info.text = "掉落于: "..CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["boss"];
			info.value["cboss"] = CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["boss"];
			info.checked = 1;
		else
			info.text = "掉落于: 未知";
		end
		UIDropDownMenu_AddButton(info, level);
		
	elseif (level == 2) then
		if(this.value) then
			if(this.value["opt"] == "dropped_from_zones") then
				for k, v in CT_RaidTracker_Bosses do
					info = {};
					if(v == 1) then
						info.text = k;
						info.value = { ["raidid"] = this.value["raidid"], ["itemid"] = this.value["itemid"], ["zone"] = this.value["zone"], ["boss"] = k, ["itemitemid"] = this.value["itemitemid"], ["itemtime"] = this.value["itemtime"], ["itemplayer"] = this.value["itemplayer"] };
						info.func = function()
							HideDropDownMenu(1);
							CT_RaidTracker_LootSetBoss(this.value["raidid"], this.value["itemitemid"], this.value["itemtime"], this.value["itemplayer"], this.value["boss"])
						end;
						if(this.value["cboss"] == k) then
							info.checked = 1;
						end
					else
						info.text = k;
						info.hasArrow = 1;
						info.value = { ["opt"] = "dropped_from_bosses", ["raidid"] = this.value["raidid"], ["itemid"] = this.value["itemid"], ["zone"] = k, ["cboss"] = this.value["cboss"], ["itemitemid"] = this.value["itemitemid"], ["itemtime"] = this.value["itemtime"], ["itemplayer"] = this.value["itemplayer"] };
						if(this.value["cboss"]) then
							for k2, v2 in CT_RaidTracker_Bosses[k] do
								if(this.value["cboss"] == v2) then
									info.checked = 1;
									break;
								end
							end
						end
					end
					UIDropDownMenu_AddButton(info, level);
				end
				
				info = {};
				info.text = "无";
				info.value = this.value;
				info.func = function()
					HideDropDownMenu(1);
					CT_RaidTracker_LootSetBoss(this.value["raidid"], this.value["itemitemid"], this.value["itemtime"], this.value["itemplayer"], nil)
				end;
				UIDropDownMenu_AddButton(info, level);
			elseif(this.value["opt"] == "quick_looter") then
				if(CT_RaidTracker_QuickLooter and getn(CT_RaidTracker_QuickLooter) >= 1) then
					for k, v in CT_RaidTracker_QuickLooter do
						info = {};
						info.text = v;
						info.value = { ["raidid"] = this.value["raidid"], ["itemid"] = this.value["itemid"], ["itemitemid"] = this.value["itemitemid"], ["itemtime"] = this.value["itemtime"], ["itemplayer"] = this.value["itemplayer"], ["player"] = v, ["cplayer"] = this.value["cplayer"] };
						info.func = function()
							HideDropDownMenu(1);
							CT_RaidTracker_LootSetLooter(this.value["raidid"], this.value["itemitemid"], this.value["itemtime"], this.value["itemplayer"], this.value["player"]);
						end;
						if(this.value["cplayer"] == v) then
							info.checked = 1;
						end
						UIDropDownMenu_AddButton(info, level);
					end
					info = {};
					info.disabled = 1;
					UIDropDownMenu_AddButton(info, level);
				end
				
				PlayerGroups = CT_RaidTracker_GetPlayerGroups(this.value["raidid"]);
				for k, v in PlayerGroups do 
				  local c = CT_RaidTracker_lang_Class_Colors[PlayerGroupsIndexes[k]];
					info = {};
					info.text = PlayerGroupsIndexes[k];
					info.hasArrow = 1;
					info.textR = c.r;
					info.textG = c.g;
					info.textB = c.b;
					info.value = { ["opt"] = "quick_looter_subplayers", ["raidid"] = this.value["raidid"], ["itemid"] = this.value["itemid"], ["playergroupsindex"] = k, ["itemitemid"] = this.value["itemitemid"], ["itemtime"] = this.value["itemtime"], ["itemplayer"] = this.value["itemplayer"], ["players"] = v, ["cplayer"] = this.value["cplayer"] };
					for k2, v2 in v do
						if(this.value["cplayer"] == v2) then
							info.checked = 1;
							break;
						end
					end
					UIDropDownMenu_AddButton(info, level);
				end
				CT_RaidTracker_PGIes = {};
			end
		end
	elseif (level == 3) then
		if(this.value) then
			if(this.value["opt"] == "dropped_from_bosses") then
				for k, v in CT_RaidTracker_Bosses[this.value["zone"]] do
					info = {};
					info.text = v;
					info.value = { ["raidid"] = this.value["raidid"], ["itemid"] = this.value["itemid"], ["zone"] = this.value["zone"], ["itemitemid"] = this.value["itemitemid"], ["itemtime"] = this.value["itemtime"], ["itemplayer"] = this.value["itemplayer"], ["boss"] = v };
					info.func = function()
						HideDropDownMenu(1);
						CT_RaidTracker_LootSetBoss(this.value["raidid"], this.value["itemitemid"], this.value["itemtime"], this.value["itemplayer"], this.value["boss"])
					end;
					if(this.value["cboss"] == v) then
						info.checked = 1;
					end
					UIDropDownMenu_AddButton(info, level);
				end
			elseif(this.value["opt"] == "quick_looter_subplayers") then
				for k, v in this.value["players"] do
					info = {};
					info.text = v;
					info.value = { ["raidid"] = this.value["raidid"], ["itemid"] = this.value["itemid"], ["itemitemid"] = this.value["itemitemid"], ["itemtime"] = this.value["itemtime"], ["itemplayer"] = this.value["itemplayer"], ["player"] = v };
					info.func = function()
						HideDropDownMenu(1);
						CT_RaidTracker_LootSetLooter(this.value["raidid"], this.value["itemitemid"], this.value["itemtime"], this.value["itemplayer"], this.value["player"]);
					end;
					if(CT_RaidTracker_RaidLog[this.value["raidid"]]["Loot"][this.value["itemid"]]["player"] == v) then
						info.checked = 1;
					end
					UIDropDownMenu_AddButton(info, level);
				end
			end
		end
	end
end

function CT_RaidTracker_ItemsRightClickMenu_Toggle()
	local menu = getglobal(this:GetParent():GetName().."RightClickMenu");
	menu.point = "TOPLEFT";
	menu.relativePoint = "BOTTOMLEFT";
	ToggleDropDownMenu(1, nil, menu, "cursor", 0, 0);
end

function CT_RaidTracker_RaidsRightClickMenu_Initialize(level)
	if(not level) then
		return;
	end
	local raidid, itemid = 0, 0;
	local dropdown, info;
	if ( UIDROPDOWNMENU_OPEN_MENU ) then
		dropdown = getglobal(UIDROPDOWNMENU_OPEN_MENU);
	else
		dropdown = this;
	end
	
	if (level == 1) then
		raidid = this:GetID() + FauxScrollFrame_GetOffset(CT_RaidTrackerListScrollFrame);
		
		info = {};
		if ( CT_RaidTracker_RaidLog[raidid]["key"] ) then
			info.text = "编辑开始时间("..CT_RaidTracker_RaidLog[raidid]["key"]..")";
		else
			info.text = "编辑开始时间";
		end
		info.value = { ["raidid"] = raidid, ["what"] = "raidstart"};
		info.func = function()
			HideDropDownMenu(1);
			CT_RaidTracker_EditTime(this.value["raidid"], this.value["what"]);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		if ( CT_RaidTracker_RaidLog[raidid]["End"] ) then
			info.text = "编辑结束时间("..CT_RaidTracker_RaidLog[raidid]["End"]..")";
		else
			info.text = "编辑结束时间";
		end
		info.value = { ["raidid"] = raidid, ["what"] = "raidend"};
		info.func = function()
			HideDropDownMenu(1);
			CT_RaidTracker_EditTime(this.value["raidid"], this.value["what"]);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		if ( CT_RaidTracker_RaidLog[raidid]["zone"] ) then
			info.text = "编辑地点("..CT_RaidTracker_RaidLog[raidid]["zone"]..")";
		else
			info.text = "编辑地点";
		end
		info.hasArrow = 1;
		info.value = { ["opt"] = "raid_zones", ["raidid"] = raidid};
		info.func = function()
			HideDropDownMenu(1);
			CT_RaidTracker_EditZone(this.value["raidid"]);
		end;
		if ( CT_RaidTracker_RaidLog[raidid]["zone"] ) then
			for k, v in CT_RaidTracker_Zones do
				if(CT_RaidTracker_RaidLog[raidid]["zone"] and CT_RaidTracker_RaidLog[raidid]["zone"] == v) then
					info.checked = 1;
					break;
				end
			end
		end
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		if ( CT_RaidTracker_RaidLog[raidid]["note"] ) then
			info.text = "编辑备注("..CT_RaidTracker_RaidLog[raidid]["note"]..")";
		else
			info.text = "编辑备注";
		end
		info.value = { ["raidid"] = raidid};
		info.func = function()
			HideDropDownMenu(1);
			--CT_RaidTracker_EditNote(this.value["raidid"], "raidnote")
			CT_RaidTracker_EditRaidNote(this.value["raidid"]);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		info.text = "导出到梦幻岛DKP系统";
		info.value = { ["raidid"] = raidid};
		info.func = function()
			HideDropDownMenu(1);
			CT_RaidTrackerGenerateDkpLink(this.value["raidid"]);
		end;
		UIDropDownMenu_AddButton(info, level);
	elseif (level == 2) then
		if(this.value) then
			if(this.value["opt"] == "raid_zones") then
				for k, v in CT_RaidTracker_Zones do
					info = {};
					info.text = v;
					info.value = { ["raidid"] = this.value["raidid"], ["zone"] = v};
					info.func = function()
						HideDropDownMenu(1);
						CT_RaidTracker_RaidSetZone(this.value["raidid"], this.value["zone"]);
					end;
					if(CT_RaidTracker_RaidLog[this.value["raidid"]]["zone"] == v) then
						info.checked = 1;
					end
					UIDropDownMenu_AddButton(info, level);
				end
				
				info = {};
				info.text = "无";
				info.value = { ["raidid"] = this.value["raidid"]};
				info.func = function()
					HideDropDownMenu(1);
					CT_RaidTracker_RaidSetZone(this.value["raidid"], nil);
				end;
				UIDropDownMenu_AddButton(info, level);
				
				local CT_RaidTracker_CustomZoneTriggersSpacer = false;
					
				for k, v in CT_RaidTracker_CustomZoneTriggers do
					if(not CT_RaidTracker_CustomZoneTriggersSpacer) then
						info = {};
						info.disabled = 1;
						UIDropDownMenu_AddButton(info, level);
						CT_RaidTracker_CustomZoneTriggersSpacer = true;
					end
					info = {};
					info.text = v;
					info.value = { ["raidid"] = this.value["raidid"], ["zone"] = v};
					info.func = function()
						HideDropDownMenu(1);
						CT_RaidTracker_RaidSetZone(this.value["raidid"], this.value["zone"]);
					end;
					if(CT_RaidTracker_RaidLog[this.value["raidid"]]["zone"] == v) then
						info.checked = 1;
					end
					UIDropDownMenu_AddButton(info, level);
				end
			end
		end
	end
end

function CT_RaidTracker_RaidsRightClickMenu_Toggle()
	local menu = getglobal(this:GetName().."RightClickMenu");
	menu.point = "TOPLEFT";
	menu.relativePoint = "BOTTOMLEFT";
	ToggleDropDownMenu(1, nil, menu, "cursor", 0, 0);
end

function CT_RaidTracker_ConvertGlobalString(globalString)
	-- Stolen from nurfed (and fixed for german clients)
	globalString = string.gsub(globalString, "%%%d%$", "%%"); 
	globalString = string.gsub(globalString, "%%s", "(.+)");
	globalString = string.gsub(globalString, "%%d", "(%%d+)");
	return globalString;
end

function CT_RaidTracker_JoinLeaveSave()
    local player_name = CT_RaidTrackerJoinLeaveFrameNameEB:GetText();
	local player_note = CT_RaidTrackerJoinLeaveFrameNoteEB:GetText();
	local player_time = CT_RaidTrackerJoinLeaveFrameTimeEB:GetText();
	
	if(player_name == nil or strlen(player_name) == 0) then
	    CT_RaidTracker_Print("CT_RaidTracker 加入/离开: 没有玩家", 1, 1, 0);
	    return nil;
	end
	if(not string.find(player_time, "^(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)$")) then
	    CT_RaidTracker_Print("CT_RaidTracker 加入/离开: 未知的时间格式", 1, 1, 0);
	    return nil;
    end
	
    if((strlen(player_name) > 0)) then
        local sDate = CT_RaidTracker_Date();
        CT_RaidTracker_Debug("CT_RaidTracker_JoinLeave", player_name, player_note);
        if (CT_RaidTrackerJoinLeaveFrame.type == "Join") then 
            tinsert(CT_RaidTracker_RaidLog[CT_RaidTrackerJoinLeaveFrame.raidid]["Join"],
            {
               ["player"] = player_name,
               ["time"] = player_time
            }
            );
            CT_RaidTracker_Online[player_name] = 1;
            CT_RaidTracker_Print(player_name.." 于 "..player_time.."加入", 1, 1, 0);
        elseif (CT_RaidTrackerJoinLeaveFrame.type == "Leave") then
            tinsert(CT_RaidTracker_RaidLog[CT_RaidTrackerJoinLeaveFrame.raidid]["Leave"],
            {
               ["player"] = player_name,
               ["time"] = player_time
            }
            );
            CT_RaidTracker_Online[player_name] = nil;
            CT_RaidTracker_Print(player_name.." 于 "..player_time.."离开", 1, 1, 0);
        end
        if(strlen(player_note) > 0) then
            if( not CT_RaidTracker_RaidLog[CT_RaidTrackerJoinLeaveFrame.raidid]["PlayerInfos"][player_name]) then
	            CT_RaidTracker_RaidLog[CT_RaidTrackerJoinLeaveFrame.raidid]["PlayerInfos"][player_name] = {};
            end
            CT_RaidTracker_RaidLog[CT_RaidTrackerJoinLeaveFrame.raidid]["PlayerInfos"][player_name]["note"] = player_note;
        end
        CT_RaidTracker_Update();
        CT_RaidTracker_UpdateView();
    end
end