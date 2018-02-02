---MerDKP  2.0.2 by Mermaid 03/24

MerDKP_Table = MerDKP_Table or {};

--For MerDKP V1
if ( Mer_DKP_Table ) then
	MerDKP_Table = {};
	for k, v in pairs(Mer_DKP_Table) do
		v.title = k;
		v.key = k;
		tinsert(MerDKP_Table, v);
	end
end
--For DkpTable
if ( DKP_tables ) then
	local size = getn(MerDKP_Table);
	for i = 1, getn(DKP_tables) do
		MerDKP_Table[size+i] = {};
		MerDKP_Table[size+i].title = DKP_tables[i].title;
		MerDKP_Table[size+i].key = DKP_tables[i].title;
		for k, v in ipairs(DKP_tables[i]) do
			tinsert(MerDKP_Table[size+i], { name = MER.Functions.UCFirst(v.nick), class = v.class, dkp = v.current, online = 1,});
		end
	end
end
--For Dkp_Matrix
if ( DKP_ROLL_PLAYERS ) then
	local size = getn(MerDKP_Table) + 1;
	MerDKP_Table[size] = {};
	MerDKP_Table[size].title = "From Dkp_Matrix";
	MerDKP_Table[size].key = "";
	for k, v in pairs(DKP_ROLL_PLAYERS) do
		local class = v.Class or UNKNOWN;
		local dkp = v.RaidPoints or 0;
		tinsert(MerDKP_Table[size], { name = MER.Functions.UCFirst(k), class = class, dkp = dkp, online = 1,});
	end
end


---Saved Variables
----------------------------------------
MerDKP_SavedVars = {
	Config = {
		Enablewhisper = true,
		Hidewhisper = true,	
		Savedkplist = true,
		Outputmax = 40,
		Datafrom = 1,
		Minimap = 325,
		Logsnum = 50,
	},
	Logs = {},
};

---Temp Variables
---------------------------------------------
MerDKP_PREFIX = " \- ";
MerDKP_ShownTotals = 0;
MerDKP_ShownMinDkp = -5000;
MerDKP_ShownSortKey = "dkp";
MerDKP_ShownSortWay = "desc";
MerDKP_ShownSendChan = "SAY";
MerDKP_ShownRegpattern = "^%s*([^%s]+)%s+([^%s]+)%s+(%-?%d+%.?%d*)";
MerDKP_DKPLIST = {};
MerDKP_DKPSHOWN = {};
MerDKP_RaidMembersTable = {};
MerDKP_ClassesTable = {};

MerDKP_SHOWN_NUM = 13;
MerDKP_SHOWN_HEIGHT = 16;

function Mer_DKPFrame_OnVarsLoaded()
	local p = "Mer_DKPOptionsFrameCheckButton";
	for i = 1, getn(MerDKP_OptionsTable) do
		getglobal(p..i):Show();
		getglobal(p..i.."Text"):SetText(MerDKP_OptionsTable[i][1]);
		getglobal(p..i).tooltipText = MerDKP_OptionsTable[i][2];
		getglobal(p..i).key = MerDKP_OptionsTable[i][3];
		if ( MerDKP_SavedVars.Config[ MerDKP_OptionsTable[i][3] ] ) then
			getglobal(p..i):SetChecked(1);
		end
	end
	MER.Functions.MinimapButton("Mer_DKPMiniMapButton", MerDKP_SavedVars.Config.Minimap);
	MerDKP_SetDkpFrom();
end

function Mer_DKPFrame_OnLoad()
	PanelTemplates_SetNumTabs(this, 4);
	PanelTemplates_SetTab(this, 4);
	PanelTemplates_UpdateTabs(this);
	SlashCmdList["MerDKP"] = function() Mer_DKPFrame_BGFrame:Show(); end
	SLASH_MerDKP1 = "/merdkp";
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("PLAYER_LEAVING_WORLD");
	this:RegisterEvent("CHAT_MSG_WHISPER");
	this:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE");
end

function Mer_DKPFrame_OnEvent(event)
	if ( event == "VARIABLES_LOADED" ) then
		Mer_DKPFrame_OnVarsLoaded();
		return
	end
	if ( event == "PLAYER_ENTERING_WORLD" ) then
		GuildRoster();
		Mer_DKPFrame:UnregisterEvent("PLAYER_ENTERING_WORLD");
		return
	end
	if ( event == "PLAYER_LEAVING_WORLD" ) then
		if ( MerDKP_SavedVars.Config.Savedkplist ) then
			MerDKP_SavedVars.Dkplist = MerDKP_DKPLIST;
		end
		MerDKP_SavedVars.Datatime = time();
		return
	end
	if ( event == "CHAT_MSG_WHISPER" ) then
		if ( not MerDKP_SavedVars.Config.Enablewhisper ) then return end
		if ( strlower(strsub(arg1,1,6)) == "rplist" ) then
			for i = 1, getn(MerDKP_DKPLIST) do
				local replytext = MerDKP_DKPLIST[i]["title"] .. MerDKP_LUA_WATCHWORD .. "rp" ..i;
				if ( MerDKP_DKPLIST[i]["whisper"] ) then
					replytext = replytext .. MerDKP_LUA_OR .. MerDKP_DKPLIST[i]["whisper"];
				end
				SendChatMessage(MerDKP_PREFIX..replytext, "WHISPER", this.language, arg2);
			end
			return
		end
		if ( strlower(strsub(arg1,1,5)) == "mydkp" ) then
			for i = 1, getn(MerDKP_DKPLIST) do
				for k, v in ipairs(MerDKP_DKPLIST[i]) do
					if ( strlower(v.name) == strlower(arg2) ) then
						SendChatMessage(MerDKP_PREFIX.."<"..MerDKP_DKPLIST[i]["title"].."> "..arg2.."："..v.dkp.." DKP", "WHISPER", this.language, arg2);
						break
					end
				end
			end
			return
		end
		if ( strfind(strlower(arg1), "^rp%d+$") ) then
			local _, _, rp_id = strfind(strlower(arg1), "^rp(%d+)$");
			rp_id = tonumber(rp_id);
			if ( not rp_id or not MerDKP_DKPLIST[rp_id] ) then return end
			for k, v in ipairs(MerDKP_DKPLIST[rp_id]) do
				if ( strlower(v.name) == strlower(arg2) ) then
					SendChatMessage(MerDKP_PREFIX.."<"..MerDKP_DKPLIST[rp_id]["title"].."> "..arg2.."："..v.dkp.." DKP", "WHISPER", this.language, arg2);
					break
				end
			end
			return
		end
		if ( strfind(strlower(arg1), "^rp%d+ .+") ) then
			local _, _, rp_id, rp_text = strfind(strlower(arg1), "^rp(%d+) (.+)");			
			rp_id = tonumber(rp_id);
			if ( not rp_id or not MerDKP_DKPLIST[rp_id] ) then return end
			local whisper_class = {};
			local whisper_key = {};
			for word in string.gmatch(rp_text, "%S+") do
				if ( MER.Local.Classes[MER.Functions.UCFirst(word)] ) then
					tinsert(whisper_class, MER.Local.Classes[MER.Functions.UCFirst(word)]["class"]);
				else
					tinsert(whisper_key, word);
				end
			end
			if ( MerDKP_SavedVars.Config.Currentraid ) then				
				if ( getn(whisper_class) > 0 ) then
					for k, v in pairs(whisper_class) do
						for k1, v1 in pairs(MerDKP_RaidMembersTable) do
							if ( strlower(v) == strlower(v1.class) ) then
								SendChatMessage(MerDKP_PREFIX.."<"..v1.class.."> "..k1.."："..v1.dkp.." DKP", "WHISPER", this.language, arg2);
							end
						end
					end
					return
				end
				if ( getn(whisper_key) > 0 ) then
					for k, v in pairs(whisper_key) do
						for k1, v1 in pairs(MerDKP_RaidMembersTable) do
							if ( strfind(strlower(k1),v) ) then
								SendChatMessage(MerDKP_PREFIX.."<"..v1.class.."> "..k1.."："..v1.dkp.." DKP", "WHISPER", this.language, arg2);
							end
						end
					end
					return
				end
				return
			end
			local j = 0;
			if ( getn(whisper_class) > 0 ) then
				for k, v in pairs(whisper_class) do
					for k1, v1 in ipairs(MerDKP_DKPLIST[rp_id]) do
						if ( strlower(v) == strlower(v1.class) ) then
							SendChatMessage(MerDKP_PREFIX.."<"..MerDKP_DKPLIST[rp_id]["title"].."><www.dkper.com><"..v1.class.."> "..v1.name.."："..v1.dkp.." DKP", "WHISPER", this.language, arg2);
							j = j + 1;
							if (j>=10) then j=0; break end
						end
					end
				end
				return
			end
			if ( getn(whisper_key) > 0 ) then
				for k, v in pairs(whisper_key) do
					for k1, v1 in ipairs(MerDKP_DKPLIST[rp_id]) do
						if ( strfind(strlower(v1.name),v) ) then
							SendChatMessage(MerDKP_PREFIX.."<"..MerDKP_DKPLIST[rp_id]["title"].."><www.dkper.com><"..v1.class.."> "..v1.name.."："..v1.dkp.." DKP", "WHISPER", this.language, arg2);
							j = j + 1;
							if (j>=10) then j=0; break end
						end
					end
				end
				return
			end
			return
		end
		local text = strlower(arg1);
		for i = 1, getn(MerDKP_DKPLIST) do 
			if ( MerDKP_DKPLIST[i]["whisper"] and strlower(MerDKP_DKPLIST[i]["whisper"]) == text ) then
				for k, v in ipairs(MerDKP_DKPLIST[i]) do
					if ( strlower(v.name) == strlower(arg2) ) then
						SendChatMessage(MerDKP_PREFIX.."<"..MerDKP_DKPLIST[i]["title"].."> "..arg2.."："..v.dkp.." DKP", "WHISPER", this.language, arg2);
						break
					end
				end
			end
		end
		return
	end
	if ( event == "RAID_ROSTER_UPDATE" ) then
		MerDKP_InitDKP();
		return
	end
	if ( event == "CHAT_MSG_CHANNEL_NOTICE" ) then
		if ( arg1 == "YOU_JOINED" or arg1 == "YOU_CHANGED" ) then
			for k, v in pairs(MerDKP_ChanTable) do
				if ( v[1] == "CHANNEL"..arg8 ) then
					v[2] = arg8..". "..arg9;
					return
				end
			end
			tinsert(MerDKP_ChanTable, { "CHANNEL"..arg8, arg8..". "..arg9 });
		elseif ( arg1 == "YOU_LEFT" ) then
			for k, v in pairs(MerDKP_ChanTable) do
				if ( v[1] == "CHANNEL"..arg8 ) then
					tremove(MerDKP_ChanTable, k);
				end
			end
		end
		return
	end	
end

local Mer_DKPFrame_SubFrames = { 
	"Mer_DKPOptionsFrame",	
	"Mer_DKPFrameHistory",
	"Mer_DKPFrameIE",
	"Mer_DKPFrameShown",
};

function Mer_DKPFrame_SelectTab(id)
	PanelTemplates_SetTab(Mer_DKPFrame, id);
	for k, v in ipairs(Mer_DKPFrame_SubFrames) do
		if ( k == id ) then
			getglobal(v):Show();
		else
			getglobal(v):Hide();
		end
	end
end


function MerDKP_InitDKP()
	if ( not Mer_DKPFrameShown.id or not MerDKP_DKPLIST[Mer_DKPFrameShown.id] ) then
		return
	end	
	MerDKP_DKPSHOWN = {};
	if ( Mer_DKPFrameRaidCheckButton:GetChecked() ) then
		MerDKP_GetRaidMembers();
		for k, v in pairs(MerDKP_RaidMembersTable) do	
			if ( MerDKP_ClassesTable[v.class] and ( v.dkp >= MerDKP_ShownMinDkp ) and not ( MerDKP_SavedVars.Config.Ignoreoffline and v.online ~= 1 ) ) then				
				tinsert(MerDKP_DKPSHOWN, v);
			end	
		end	
	else
		for k, v in ipairs(MerDKP_DKPLIST[Mer_DKPFrameShown.id]) do
			if ( MerDKP_ClassesTable[v.class] and ( v.dkp >= MerDKP_ShownMinDkp ) ) then				
				tinsert(MerDKP_DKPSHOWN, v);
			end	
		end	
	end	
	MerDKP_ShownTotals = getn(MerDKP_DKPLIST[Mer_DKPFrameShown.id]);
	if ( MerDKP_ShownSortWay == "desc" ) then
		table.sort(MerDKP_DKPSHOWN, function(a,b)
			if ( a[MerDKP_ShownSortKey] and b[MerDKP_ShownSortKey] ) then
				return ( a[MerDKP_ShownSortKey] < b[MerDKP_ShownSortKey] );
			end
		end);	
	else
		table.sort(MerDKP_DKPSHOWN, function(a,b)
			if ( a[MerDKP_ShownSortKey] and b[MerDKP_ShownSortKey] ) then
				return ( a[MerDKP_ShownSortKey] > b[MerDKP_ShownSortKey] );
			end
		end);
	end
	Mer_DKPFrameShown_Update();
end

function Mer_DKPFrameShown_Update()
	local size = getn(MerDKP_DKPSHOWN);	
	local offset = FauxScrollFrame_GetOffset(Mer_DKPFrameScrollFrame);		
	local listid, button, list;
	local p = "Mer_DKPFrameButton";
	Mer_DKPFrameShownTotals:SetText(MerDKP_LUA_SHOWNINFO .. " (|cff3FFF3F"..size.."/"..MerDKP_ShownTotals.."|r)");
	for i = 1, MerDKP_SHOWN_NUM do
		listid = i + offset;
		button = getglobal(p..i);
		list = MerDKP_DKPSHOWN[listid];		
		if ( size > MerDKP_SHOWN_NUM ) then
			button:SetWidth(350);
			getglobal(p..i.."bg"):SetWidth(350);
		else
			button:SetWidth(370);
			getglobal(p..i.."bg"):SetWidth(370);
		end
		if ( listid <= size ) then		
			button.id = listid;
			button.name = list.name;			
			button.dkp = list.dkp;
			button.class = list.class;
			--getglobal(p..i.."Num"):SetText(MER.Functions.FixZero(ButtonId));
			getglobal(p..i.."Name"):SetText(list.name);		
			getglobal(p..i.."Class"):SetText(list.class);
			getglobal(p..i.."DKP"):SetText(MER.Functions.ColorValue(format("%.2f",list.dkp)));
			if ( MER.Local.Classes[list.class] ) then
				local color = MER.Local.Classes[list.class];	
				getglobal(p..i.."Name"):SetTextColor(color.r, color.g, color.b);
				getglobal(p..i.."Class"):SetTextColor(color.r, color.g, color.b);	
				getglobal(p..i.."bg"):SetVertexColor(color.r, color.g, color.b);
			else
				getglobal(p..i.."Name"):SetTextColor(1.0, 0.95, 0.2);	
				getglobal(p..i.."Class"):SetTextColor(1.0, 1.0, 0.9);
				getglobal(p..i.."bg"):SetVertexColor(0.8, 0.8, 0.8);
			end
			if ( list.online ~= 1 ) then				
				getglobal(p..i.."Name"):SetTextColor(0.6, 0.6, 0.6);		
				getglobal(p..i.."Class"):SetTextColor(0.6, 0.6, 0.6);
			end
			button:Show();
		else
			button:Hide();
		end	
	end	
	FauxScrollFrame_Update(Mer_DKPFrameScrollFrame, size, MerDKP_SHOWN_NUM, MerDKP_SHOWN_HEIGHT);
end

-- classes
function Mer_DKPFrame_DkpClass_OnLoad(id)
	if ( MerDKP_Classes.tbc[5][id] ) then
		getglobal(this:GetName().."Text"):SetText(MerDKP_Classes.tbc[5][id]);
		this:Show();
	else
		this:Hide();
	end	
end
function Mer_DKPFrame_DkpClass_OnClick(id)
	local classText = MerDKP_Classes.tbc[5][id];
	if ( this:GetChecked() ) then
		if ( not MerDKP_ClassesTable[classText] ) then
			MerDKP_ClassesTable[classText] = classText;
		end
	else
		MerDKP_ClassesTable[classText] = nil;		
	end
	MerDKP_InitDKP();
end
function Mer_DKPFrameClothButton_OnLoad(id)
	if ( MerDKP_Classes.tbc[id] ) then
		getglobal(this:GetName().."Text"):SetText(MerDKP_Classes.tbc[id]["text"]);	
		this:Show();
	else
		this:Hide();
	end
end
function Mer_DKPFrameClothButton_OnClick(id)
	MerDKP_ClassesTable = {};
	if ( this:GetChecked() ) then		
		for k, v in ipairs(MerDKP_Classes.tbc[id]) do
			MerDKP_ClassesTable[v] = v;
		end
		for i = 1, getn(MerDKP_Classes.tbc[5]) do
			local class = getglobal("Mer_DKPFrameCheckButton"..i.."Text"):GetText();
			if ( MerDKP_ClassesTable[class] ) then
				getglobal("Mer_DKPFrameCheckButton"..i):SetChecked(1);
			else
				getglobal("Mer_DKPFrameCheckButton"..i):SetChecked(0);
			end
		end			
		for i = 1, getn(MerDKP_Classes.tbc) do
			if ( i ~= id ) then
				getglobal("Mer_DKPFrameClothButton"..i):SetChecked(0);
			end
		end
	else
		for i = 1, getn(MerDKP_Classes.tbc[5]) do
			getglobal("Mer_DKPFrameCheckButton"..i):SetChecked(0);
		end
	end
	MerDKP_InitDKP();
end

--DropDown （dkpType & mindkp & channel ）
function Mer_DKPFrameDropDownDkpType_Init()
	local info;
	for i = 1, getn(MerDKP_DKPLIST) do
		info = {};
		info.text = MerDKP_DKPLIST[i]["title"];
		info.value = MerDKP_DKPLIST[i]["title"];
		info.func = function()
			local id = this:GetID();
			UIDropDownMenu_SetSelectedID(Mer_DKPFrameColumnHeader3, id);
			Mer_DKPFrameShown.title = MerDKP_DKPLIST[id]["title"];
			Mer_DKPFrameShown.key = MerDKP_DKPLIST[id]["key"];
			Mer_DKPFrameShown.id = id;
			MerDKP_InitDKP();
		end;
		UIDropDownMenu_AddButton(info);
	end
end
function Mer_DKPFrameDropDownDkpType_OnLoad()
	UIDropDownMenu_Initialize(this, Mer_DKPFrameDropDownDkpType_Init);
	UIDropDownMenu_SetWidth(120);
	UIDropDownMenu_SetButtonWidth(22);
end
function Mer_DKPFrameDropDownMinDKP_Init()
	local info;
	for i = 1, getn(MerDKP_MinDkpTable) do
		info = {};
		info.text = MerDKP_MinDkpTable[i][2];
		info.value = MerDKP_MinDkpTable[i][1];
		info.func = function()
			local id = this:GetID();
			UIDropDownMenu_SetSelectedID(Mer_DKPFrameDropDownMinDKP, id);
			MerDKP_ShownMinDkp = MerDKP_MinDkpTable[id][1];
			MerDKP_InitDKP();
		end;
		UIDropDownMenu_AddButton(info);
	end
end
function Mer_DKPFrameDropDownMinDKP_OnLoad()
	UIDropDownMenu_Initialize(this, Mer_DKPFrameDropDownMinDKP_Init);		
	UIDropDownMenu_SetSelectedID(this, 1);
	UIDropDownMenu_SetWidth(84);
	UIDropDownMenu_SetButtonWidth(22);
end
function Mer_DKPFrameDropDownChan_Init()
	local info;
	for i = 1, getn(MerDKP_ChanTable) do
		info = {};
		info.text = MerDKP_ChanTable[i][2];
		info.value = MerDKP_ChanTable[i][1];
		info.func = function()
			local id = this:GetID();
			UIDropDownMenu_SetSelectedID(Mer_DKPFrameDropDownChan, id);
			MerDKP_ShownSendChan = this.value;			
			if ( not MerDKP_ShownSendChan or ( ( MerDKP_ShownSendChan == "GUILD" or MerDKP_ShownSendChan == "OFFICER" ) and not IsInGuild() ) or ( MerDKP_ShownSendChan == "RAID" and GetNumRaidMembers() < 1 ) or ( MerDKP_ShownSendChan == "PARTY" and GetNumPartyMembers() < 1 ) ) then			
				Mer_DKPFrameSendButton:Disable();
			else
				Mer_DKPFrameSendButton:Enable();
			end
		end;
		UIDropDownMenu_AddButton(info);
	end
end
function Mer_DKPFrameDropDownChan_OnLoad()
	UIDropDownMenu_Initialize(this, Mer_DKPFrameDropDownChan_Init);		
	UIDropDownMenu_SetSelectedID(this, 1);
	UIDropDownMenu_SetWidth(120);
	UIDropDownMenu_SetButtonWidth(22);
end

--member
function Mer_DKPFrameButton_OnClick(button)
	if ( button == "LeftButton" ) then
		if ( IsShiftKeyDown() and ChatFrameEditBox:IsVisible() ) then
			ChatFrameEditBox:Insert("<"..Mer_DKPFrameShown.title.."DKPER查询系统 http://www.dkper.com" .. this.class .."> ".. this.name .."：".. this.dkp.." DKP");
		end
	elseif ( button == "RightButton" ) then
		HideDropDownMenu(1);		
		Mer_DKPFrameDropDown.initialize = function()
			local info;
			info = {};
			info.text = this.name .. "  (" .. this.class .. ")";
			info.isTitle = true;
			info.notCheckable = 1;
			UIDropDownMenu_AddButton(info);
			info = {};
			info.text = MerDKP_LUA_WHISPERDKP;
			info.notCheckable = 1;
			info.value = { this.name, this.dkp, this.class };
			info.func = function()
				local name = this.value[1];
				local dkp = this.value[2];
				local class = this.value[3];
				SendChatMessage(MerDKP_PREFIX.."<"..Mer_DKPFrameShown.title.."> "..name.."："..dkp.." DKP", "WHISPER", this.language, name);
			end
			UIDropDownMenu_AddButton(info);
			info = {};
			info.text = MerDKP_LUA_EDITDKP;
			info.notCheckable = 1;
			info.value = { this.name, this.dkp, this.class, Mer_DKPFrameShown.id };	
			info.func = function()
				local name = this.value[1];
				local dkp = this.value[2];
				local class = this.value[3];
				local dkpId = this.value[4];
				Mer_DKPEditFrame:Show();
				Mer_DKPEditFrame.action = "edit";
				Mer_DKPEditFrame.dkpId = dkpId;
				Mer_DKPEditFrameTypeText:SetText(Mer_DKPFrameShown.title);				
				Mer_DKPEditFrameNameText:SetText(name);
				Mer_DKPEditFrameNameText:Show();
				Mer_DKPEditFrameNameBox:Hide();
				Mer_DKPEditFrameClassText:SetText(class);
				Mer_DKPEditFrameClassText:Hide();
				Mer_DKPEditFrameClassBox:SetText(class);
				Mer_DKPEditFrameDKPText:SetText(dkp);
				Mer_DKPEditFrameDKPText:Hide();
				Mer_DKPEditFrameDKPBox:SetText("");
				Mer_DKPEditFrameDKPBox:SetFocus();
			end
			UIDropDownMenu_AddButton(info);	
			info = {};
			info.text = DELETE;
			info.notCheckable = 1;
			info.value = { this.name, this.dkp, this.class, Mer_DKPFrameShown.id };	
			info.func = function()
				local name = this.value[1];
				local dkp = this.value[2];
				local class = this.value[3];
				local dkpId = this.value[4];				
				StaticPopup_Show("MerDKP_Delmember",name,dkpId,name);
				HideDropDownMenu(1);
			end
			UIDropDownMenu_AddButton(info);	
			info = {};
			info.text = CANCEL;
			info.notCheckable = 1;					
			info.func = function() HideDropDownMenu(1) end;
			UIDropDownMenu_AddButton(info);			
		end
		Mer_DKPFrameDropDown.displayMode = "MENU";
		ToggleDropDownMenu(1, nil, Mer_DKPFrameDropDown, "cursor");
	end
end
function Mer_DKPFrameButton_OnDoubleClick()
	Mer_DKPEditFrame:Show();
	Mer_DKPEditFrame.action = "edit";
	Mer_DKPEditFrame.dkpId = Mer_DKPFrameShown.id;
	Mer_DKPEditFrameTypeText:SetText(Mer_DKPFrameShown.title);
	Mer_DKPEditFrameNameText:SetText(this.name);
	Mer_DKPEditFrameNameText:Show();
	Mer_DKPEditFrameNameBox:Hide();
	Mer_DKPEditFrameClassText:SetText(this.class);
	Mer_DKPEditFrameClassText:Hide();
	Mer_DKPEditFrameClassBox:SetText(this.class);
	Mer_DKPEditFrameDKPText:SetText(this.dkp);
	Mer_DKPEditFrameDKPText:Hide();
	Mer_DKPEditFrameDKPBox:SetText("");
	Mer_DKPEditFrameDKPBox:SetFocus();
end

--checkraid
function Mer_DKPFrameRaidCheckButton_OnClick()
	if ( this:GetChecked() ) then
		Mer_DKPFrameWhisperButton:Show();
		Mer_DKPFrame:RegisterEvent("RAID_ROSTER_UPDATE");
	else
		Mer_DKPFrameWhisperButton:Hide();
		Mer_DKPFrame:UnregisterEvent("RAID_ROSTER_UPDATE");
	end
	MerDKP_InitDKP();
end
--sortTable
function Mer_DKPFrameColumnHeader_OnClick(key)
	if ( MerDKP_ShownSortWay == "desc" ) then
		MerDKP_ShownSortWay = "asc";
		table.sort(MerDKP_DKPSHOWN, function(a,b) if (a[key] and b[key]) then return (a[key]>b[key]); end end);
	else
		MerDKP_ShownSortWay = "desc";
		table.sort(MerDKP_DKPSHOWN, function(a,b) if (a[key] and b[key]) then return (a[key]<b[key]); end end);
	end
	MerDKP_ShownSortKey = key;
	Mer_DKPFrameShown_Update();
end
--send Rez
function Mer_DKPFrameSendButton_OnClick(yes)
	if ( not yes and MerDKP_SavedVars.Config.Confirmsend ) then
		StaticPopup_Show("MerDKP_ConfirmSend");
		return
	end
	local i = 1;
	if ( MerDKP_ShownSendChan == "GUILD" or MerDKP_ShownSendChan == "RAID" or MerDKP_ShownSendChan == "PARTY" or MerDKP_ShownSendChan == "SAY" or MerDKP_ShownSendChan == "OFFICER" ) then		
		for k, v in pairs(MerDKP_DKPSHOWN) do
			SendChatMessage("<"..Mer_DKPFrameShown.title.."><www.dkper.com><"..v.class.."> "..v.name.."："..v.dkp.." DKP", MerDKP_ShownSendChan);
			i = i + 1;
			if ( i > MerDKP_SavedVars.Config.Outputmax ) then return end
		end
	elseif ( strfind(MerDKP_ShownSendChan, "CHANNEL%d+") ) then
		local _, _, chanID = strfind(MerDKP_ShownSendChan, "CHANNEL(%d+)");		
		for k, v in pairs(MerDKP_DKPSHOWN) do			
			SendChatMessage("<"..Mer_DKPFrameShown.title.."><www.dkper.com><"..v.class.."> "..v.name.."："..v.dkp.." DKP", "CHANNEL", this.language, chanID);
			i = i + 1;
			if ( i > MerDKP_SavedVars.Config.Outputmax ) then return end
		end
	end
end
-- whisper raid
function Mer_DKPFrameWhisperButton_OnClick()
	for k, v in pairs(MerDKP_DKPSHOWN) do			
		if ( v.online == 1 ) then
		SendChatMessage(MerDKP_PREFIX .."<"..Mer_DKPFrameShown.title.."> "..v.name.."："..v.dkp.." DKP", "WHISPER", this.language, v.name);
		end
	end
end
--options Button
function Mer_DKPOptionsFrameCheckButton_OnClick()
	if ( this:GetChecked() ) then
		MerDKP_SavedVars.Config[this.key] = true;
	else
		MerDKP_SavedVars.Config[this.key] = nil;
	end
end
--add&edit button
function Mer_DKPEditFrame_OnClick()
	local dkpType = Mer_DKPEditFrameTypeText:GetText();
	local dkpId = Mer_DKPEditFrame.dkpId;
	local nameText = Mer_DKPEditFrameNameText:GetText();
	local nameInput = Mer_DKPEditFrameNameBox:GetText();
	local class = Mer_DKPEditFrameClassBox:GetText();
	local dkp = Mer_DKPEditFrameDKPBox:GetText();
	_, _, dkp = strfind(dkp, "(%-?%d+%.?%d*)");
	if ( Mer_DKPEditFrame.action == "add" ) then
		MerDKP_AddNewMember(dkpId, nameInput, class, dkp);
	elseif ( Mer_DKPEditFrame.action == "edit" ) then
		MerDKP_EditMember(dkpId, nameText, class, dkp);	
	end
	Mer_DKPEditFrame:Hide();
	MerDKP_InitDKP();
end
function Mer_DKPFrameBatEditButton_OnClick()
	StaticPopup_Show("MerDKP_BatEditDkp");
end
function Mer_DKPFrameAddMemberButton_OnClick()
	Mer_DKPEditFrame:Show();
	Mer_DKPEditFrame.action = "add";
	Mer_DKPEditFrame.dkpId = Mer_DKPFrameShown.id;
	Mer_DKPEditFrameTypeText:SetText(Mer_DKPFrameShown.title);
	Mer_DKPEditFrameNameText:Hide();
	Mer_DKPEditFrameNameBox:SetText("");
	Mer_DKPEditFrameNameBox:Show();
	Mer_DKPEditFrameClassText:Hide();
	Mer_DKPEditFrameClassBox:SetText("");
	Mer_DKPEditFrameDKPText:Hide();
	Mer_DKPEditFrameDKPBox:SetText("");
end

---dkp from
function MerDKP_SetDkpFrom()
	if ( MerDKP_FromTable[MerDKP_SavedVars.Config.Datafrom][1] == "webhost" ) then
		MerDKP_DKPLIST = MerDKP_Table or {};
		Mer_GuildRosterDKPButton:Hide();
	elseif ( MerDKP_FromTable[MerDKP_SavedVars.Config.Datafrom][1] == "localhost" ) then
		MerDKP_DKPLIST = MerDKP_SavedVars.Dkplist or {};
		Mer_GuildRosterDKPButton:Hide();
	elseif ( MerDKP_FromTable[MerDKP_SavedVars.Config.Datafrom][1] == "publicnote" or MerDKP_FromTable[MerDKP_SavedVars.Config.Datafrom][1] == "officernote" ) then
		Mer_GuildRosterDKPButton:Show();
	end
	for i = 1, getn(MerDKP_DKPLIST) do
		table.sort(MerDKP_DKPLIST[i], function(a,b)
			return (a.class<b.class) or (a.class==b.class and a.dkp>b.dkp)
		end);
	end
end
--raid info
function MerDKP_GetRaidMembers()
	local numMembers = GetNumRaidMembers();
	local name, class, online;
	MerDKP_RaidMembersTable = {};
	if ( numMembers > 0 ) then
		for i = 1, numMembers do
		name, _, _, _, class, _, _, online = GetRaidRosterInfo(i);
		if ( not online ) then online = 0; end
		if ( not class ) then class = UNKNOWN; end
		MerDKP_RaidMembersTable[name] = { name = name, class = class, online = online, };
		MerDKP_RaidMembersTable[name]["dkp"] = MerDKP_GetDKPByName(name, class);
		end
	end
end
--getdkp by name
function MerDKP_GetDKPByName(name, class)	
	if ( not Mer_DKPFrameShown.id or not MerDKP_DKPLIST[Mer_DKPFrameShown.id] ) then
		return 0, class;
	end
	for k, v in ipairs(MerDKP_DKPLIST[Mer_DKPFrameShown.id]) do
		if ( strlower(v.name) == strlower(name) ) then
			v.class = class;
			return v.dkp, v.class;
		end
	end	
	tinsert(MerDKP_DKPLIST[Mer_DKPFrameShown.id], { name=name, class=class, dkp=0, online=1 } );
	return 0, class;
end
--add&edit&del
function MerDKP_AddNewMember(dkpId, name, class, dkp)
	if ( not dkpId or not MerDKP_DKPLIST[dkpId] ) then return end
	name = gsub(MER.Functions.UCFirst(name),"%s","");
	if ( strlen(name) == 0 ) then return end
	if ( class and MER.Local.Classes[class] ) then
		class = MER.Local.Classes[class]["class"];
	else
		class = UNKNOWN;
	end
	dkp = tonumber(dkp) or 0;
	dkp = tonumber(format("%.2f",dkp));
	for k, v in ipairs(MerDKP_DKPLIST[dkpId]) do
		if ( strlower(v.name) == strlower(name) ) then
			
			v.dkp = dkp;
			MerDKP_GuildRoster_UpdateNote(name); --For GuildRosterDKP
			MerDKP_SaveHistory(dkpId, name, class, dkp, desc, "reset"); --For SaveLogs
			
			return true;
		end
	end
	tinsert(MerDKP_DKPLIST[dkpId], { name=name, class=class, dkp=dkp, online=1 } );
	MerDKP_GuildRoster_UpdateNote(name); --For GuildRosterDKP
	MerDKP_SaveHistory(dkpId, name, class, dkp, desc, "add"); --For SaveLogs
end
function MerDKP_EditMember(dkpId, name, class, dkp)
	if ( not dkpId or not MerDKP_DKPLIST[dkpId] ) then return end
	name = gsub(MER.Functions.UCFirst(name),"%s","");
	if ( strlen(name) == 0 ) then return end
	if ( class and MER.Local.Classes[class] ) then
		class = MER.Local.Classes[class]["class"];
	else
		class = UNKNOWN;
	end
	dkp = tonumber(dkp) or 0;
	dkp = tonumber(format("%.2f",dkp));	
	for k, v in ipairs(MerDKP_DKPLIST[dkpId]) do
		if ( strlower(v.name) == strlower(name) ) then
			v.dkp = v.dkp + dkp;
			if ( v.class ~= class ) then
				v.class = class;
			end
			if ( dkp ~= 0 ) then
				MerDKP_GuildRoster_UpdateNote(name); --For GuildRosterDKP
				MerDKP_SaveHistory(dkpId, name, class, dkp); --For SaveLogs
			end
			return true;
		end
	end
	tinsert(MerDKP_DKPLIST[dkpId], { name=name, class=class, dkp=dkp, online=1 } );
	MerDKP_GuildRoster_UpdateNote(name); --For GuildRosterDKP
	MerDKP_SaveHistory(dkpId, name, class, dkp, "from RT", "add"); --For SaveLogs
end
function MerDKP_DeleteMember(dkpId, name)
	if ( not dkpId or not MerDKP_DKPLIST[dkpId] ) then return end
	for k, v in ipairs(MerDKP_DKPLIST[dkpId]) do
		if ( strlower(v.name) == strlower(name) ) then
			MerDKP_SaveHistory(dkpId, name, v.class, v.dkp, desc, "delete"); --For SaveLogs
			tremove(MerDKP_DKPLIST[dkpId], k);			
		end
	end
end
--logs
function MerDKP_SaveHistory(dkpId, name, class, dkp, desc, key)
	key = key or "edit";
	desc = desc or "Manual input";
	local timer = date("%m/%d/20%y");
	local dkpTitle = MerDKP_DKPLIST[dkpId]["title"];	
	local element = {
		dkpId = dkpId, dkpTitle = dkpTitle,
		name = name, class = class, dkp = dkp,
		timer = timer, desc = desc, key = key,
	};
	tinsert(MerDKP_SavedVars.Logs, 1, element);
	local size = getn(MerDKP_SavedVars.Logs) - MerDKP_SavedVars.Config.Logsnum;
	if ( size > 0 ) then
		for i = 1, size do
			tremove(MerDKP_SavedVars.Logs, MerDKP_SavedVars.Config.Logsnum + 1);
		end
	end
end
function MerDKP_SavedLogs_Update()
	local size = getn(MerDKP_SavedVars.Logs);
	local offset = FauxScrollFrame_GetOffset(Mer_DKPFrameHistoryScrollFrame);
	FauxScrollFrame_Update(Mer_DKPFrameHistoryScrollFrame, size, 15, 20);
	local listid, button, list, flag, dkp;
	for i = 1, 15 do
		listid = i + offset;
		button = getglobal("Mer_DKPFrameHistoryButton"..i);
		list = MerDKP_SavedVars.Logs[listid];
		if (listid <= size) then			
			if ( tonumber(list.dkp) >= 0 ) then
				dkp = "|cff3fff3f+" .. list.dkp .. "|r";
			else
				dkp = "|cffff3f3f" .. list.dkp .. "|r";
			end
			if ( list.key == "delete" ) then
				flag = "|cffFF4F4F[".. DELETE .."]|r";
				dkp = list.dkp;
			elseif ( list.key == "edit" ) then
				flag = "|cffDF8D00[".. MerDKP_LUA_EDIT .."]|r";
			elseif ( list.key == "add" ) then
				flag = "|cff3FDF3F[".. MerDKP_LUA_ADD .."]|r";
			elseif ( list.key == "reset" ) then
				flag = "|cffDD3F3F[".. MerDKP_LUA_RESET .."]|r";
			else
				flag = "[".. MER_unknown .."]";
			end			
			button.id = listid;
			getglobal("Mer_DKPFrameHistoryButton"..i.."Flag"):SetText(flag);
			getglobal("Mer_DKPFrameHistoryButton"..i.."Name"):SetText(list.name);
			getglobal("Mer_DKPFrameHistoryButton"..i.."Class"):SetText(list.class);
			getglobal("Mer_DKPFrameHistoryButton"..i.."Log"):SetText(dkp);		
			getglobal("Mer_DKPFrameHistoryButton"..i.."Time"):SetText(list.timer);
			button:Show();
		else
			button:Hide();
		end
	end	
end

----Hook
MerDKP_Old_ChatFrame_OnEvent = ChatFrame_OnEvent;
function ChatFrame_OnEvent(event)
	if ( event == "CHAT_MSG_WHISPER" and MerDKP_SavedVars.Config.Hidewhisper ) then
		if ( strfind(arg1,"^rp%d+") or strlower(arg1)=="rplist" or strlower(arg1)=="mydkp" ) then
			return
		end
	end
	if ( event == "CHAT_MSG_WHISPER_INFORM" and MerDKP_SavedVars.Config.Hidewhisper ) then
		if ( string.find(arg1,"^"..MerDKP_PREFIX) ) then
			return
		end
	end
	MerDKP_Old_ChatFrame_OnEvent(event);
end

---import&export
function Mer_DKPFrameIESaveButton_OnClick(yes)
	if ( not yes ) then
		StaticPopup_Show("MerDKP_Savelist");
		return
	end
	local title = Mer_DKPFrameIEInputTitle:GetText();
	local key = Mer_DKPFrameIEInputKey:GetText();
	local reg = Mer_DKPFrameIEInputReg:GetText();
	local text = Mer_DKPFrameIEScrollFrameText:GetText();
	if ( strlen(gsub(title,"%s","")) == 0 ) then return end
	if ( strlen(gsub(reg,"%s","")) == 0 ) then return end
	local dkpId;
	for i = 1, getn(MerDKP_DKPLIST) do
		if ( MerDKP_DKPLIST[i]["title"] == title ) then
			dkpId = i;
		end
	end
	if ( not dkpId ) then
		tinsert(MerDKP_DKPLIST, {});
		dkpId = getn(MerDKP_DKPLIST);
	end	
	MerDKP_DKPLIST[dkpId]["title"] = title;
	MerDKP_DKPLIST[dkpId]["key"] = key;
	for line in string.gmatch(text, "[^\n]+") do
		local _, _, name, class, dkp = strfind(line, reg);		
		if ( name and class and dkp ) then		
			MerDKP_AddNewMember(dkpId, name, class, dkp);
		end
	end
	MerDKP_InitDKP();
end
function Mer_DKPFrameIEOutputButton_OnClick()
	local title = Mer_DKPFrameIEInputTitle:GetText();
	local outText = "";
	for i = 1, getn(MerDKP_DKPLIST) do
		if ( title == MerDKP_DKPLIST[i]["title"] ) then			
			outText = outText .. MerDKP_DKPLIST[i]["title"] .. " <" .. MerDKP_DKPLIST[i]["key"] .. "> - " .. date("%m/%d/20%y") .. "\n\n";
			for k, v in ipairs(MerDKP_DKPLIST[i]) do
				outText = outText .. v.name .. "  " .. v.class .. "  " .. v.dkp .."\n";
			end
		end
	end
	Mer_DKPFrameIEScrollFrameText:SetText(outText);
end
function Mer_DKPFrameIEInputTitleDropDown_OnClick()
	HideDropDownMenu(1);		
	Mer_DKPFrameDropDown.initialize = function()
		for k, v in pairs(MerDKP_DKPLIST) do
			info = {};
			info.text = v.title;
			info.value = {v.title, v.key};
			info.func = function()
				Mer_DKPFrameIEInputTitle:SetText(this.value[1]);
				Mer_DKPFrameIEInputKey:SetText(this.value[2]);
			end
			UIDropDownMenu_AddButton(info);
		end
	end
	ToggleDropDownMenu(1, nil, Mer_DKPFrameDropDown, this);
end
function Mer_DKPFrameIEDelButton_OnClick(yes)
	if ( not yes ) then
		StaticPopup_Show("MerDKP_Dellist");
		return
	end
	local title = Mer_DKPFrameIEInputTitle:GetText();
	for k, v in pairs(MerDKP_DKPLIST) do
		if ( title == v.title ) then
			tremove(MerDKP_DKPLIST, k);
		end
	end
end

---- GuildRosterDKP 
function MerDKP_GuildRoster_init()		
	if ( not IsInGuild() ) then return end
	local numMembers = GetNumGuildMembers(true);
	local name, rank, rankIndex, level, class, zone, note, officernote, online, status, element;
	if ( numMembers == 0 ) then return end	
	local tab = {};
	for k, v in pairs(MerDKP_GuildRosterDkpTable) do
		tab[k] = {};
		tab[k]["title"] = v.title;
		tab[k]["key"] = v.key;
		tab[k]["whisper"] = v.whisper;
		for i = 1, numMembers do
			name, rank, rankIndex, level, class, zone, note, officernote, online, status = GetGuildRosterInfo(i);
			local element = { name = name, class=class, dkp=0, online=1 };
			if ( MerDKP_FromTable[MerDKP_SavedVars.Config.Datafrom][1] == "officernote" ) then
				element.dkp = MerDKP_GuildRoster_GetDKP(officernote, v.title);
			elseif ( MerDKP_FromTable[MerDKP_SavedVars.Config.Datafrom][1] == "publicnote" ) then
				element.dkp = MerDKP_GuildRoster_GetDKP(note, v.title);
			end
			if ( MER.Local.Classes[class] ) then
			    element.class = MER.Local.Classes[class]["class"];
			else
				element.class = UNKNOWN;
			end
			tinsert(tab[k], element);
		end
	end
	return tab;
end
function MerDKP_GuildRoster_GetDKP(note, val)	
	local dkp = 0;
	for str in string.gmatch(note, "[^#]+") do	
		if ( strfind(str, val.."(%-?%d+%.?%d*)") ) then			
			_, _, dkp = strfind(str, val.."(%-?%d+%.?%d*)");
			dkp = tonumber(dkp) or 0;
			dkp = tonumber(format("%.2f",dkp));
			return dkp;
		end		
	end
	return dkp;
end
function MerDKP_GuildRoster_GetMemberRank(player)
	local numMembers = GetNumGuildMembers(true);
	local name, rank, rankIndex, level, class, zone, note, officernote, online, status;
	for i = 1, numMembers do
		name, rank, rankIndex, level, class, zone, note, officernote, online, status = GetGuildRosterInfo(i);
		if ( strlower(name) == strlower(player) ) then
			return i;
		end
	end
	return nil;
end
function MerDKP_GuildRoster_GetNewNote(player)
	local note = "";
	for i = 1, getn(MerDKP_DKPLIST) do
		local dkp = 0;
		for k, v in ipairs(MerDKP_DKPLIST[i]) do
			if ( strlower(player) == strlower(v.name) ) then
				dkp = v.dkp;
				break;
			end
		end
		note = note.."#"..MerDKP_DKPLIST[i]["title"]..dkp;
	end	
	return note;
end
function MerDKP_GuildRoster_UpdateNote(player)
	if ( not MerDKP_SavedVars.Config.Autoupdatenote or MerDKP_SavedVars.Config.Datafrom < 3 ) then
		return
	end	
	local rank = MerDKP_GuildRoster_GetMemberRank(player);
	if ( rank ) then
		local note = MerDKP_GuildRoster_GetNewNote(player);
		if ( MerDKP_FromTable[MerDKP_SavedVars.Config.Datafrom][1] == "officernote" ) then
			GuildRosterSetOfficerNote(rank, note);
		elseif ( MerDKP_FromTable[MerDKP_SavedVars.Config.Datafrom][1] == "publicnote" ) then
			GuildRosterSetPublicNote(rank, note);
		end
	end
end

---StaticPopupDialogs
StaticPopupDialogs["MerDKP_ConfirmSend"] = {
	text = MerDKP_LUA_CONFIRMSEND,
	button1 = TEXT(YES),
	button2 = TEXT(NO),
	OnAccept = function()
		Mer_DKPFrameSendButton_OnClick(true);
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1,
};
StaticPopupDialogs["MerDKP_BatEditDkp"] = {
	text = MerDKP_LUA_BATEDITDKP,
	button1 = TEXT(ACCEPT),
	button2 = TEXT(CANCEL),
	hasEditBox = 1,
	maxLetters = 12,
	OnAccept = function()
		local editBox = getglobal(this:GetParent():GetName().."EditBox");
		local dkp = editBox:GetText();
		_, _, dkp = strfind(dkp, "(%-?%d+%.?%d*)");
		dkp = tonumber(dkp);
		if ( not dkp or dkp==0 or not Mer_DKPFrameShown.id or not MerDKP_DKPLIST[Mer_DKPFrameShown.id] ) then
			return
		end
		for k, v in pairs(MerDKP_DKPSHOWN) do
			for k1, v1 in ipairs(MerDKP_DKPLIST[Mer_DKPFrameShown.id]) do
				if ( strlower(v.name) == strlower(v1.name) ) then
					v1.dkp = v1.dkp + dkp;
					MerDKP_GuildRoster_UpdateNote(v.name); --For GuildRosterDKP
					MerDKP_SaveHistory(Mer_DKPFrameShown.id, v1.name, v1.class, dkp, nil, "edit"); --For SaveLogs
					break;
				end
			end
		end
		MerDKP_InitDKP();
		this:GetParent():Hide();
	end,
	OnShow = function()
		getglobal(this:GetName().."EditBox"):SetFocus();
	end,
	OnHide = function()
		if ( ChatFrameEditBox:IsVisible() ) then
			ChatFrameEditBox:SetFocus();
		end
		getglobal(this:GetName().."EditBox"):SetText("");
	end,
	EditBoxOnEnterPressed = function()
		local editBox = getglobal(this:GetParent():GetName().."EditBox");
		local dkp = editBox:GetText();
		_, _, dkp = strfind(dkp, "(%-?%d+%.?%d*)");
		dkp = tonumber(dkp);
		if ( not dkp or dkp==0 or not Mer_DKPFrameShown.id or not MerDKP_DKPLIST[Mer_DKPFrameShown.id] ) then
			return
		end
		for k, v in pairs(MerDKP_DKPSHOWN) do
			for k1, v1 in ipairs(MerDKP_DKPLIST[Mer_DKPFrameShown.id]) do
				if ( strlower(v.name) == strlower(v1.name) ) then
					v1.dkp = v1.dkp + dkp;
					MerDKP_GuildRoster_UpdateNote(v.name); --For GuildRosterDKP
					MerDKP_SaveHistory(Mer_DKPFrameShown.id, v1.name, v1.class, dkp, nil, "edit"); --For SaveLogs
					break;
				end
			end
		end
		MerDKP_InitDKP();
		this:GetParent():Hide();
	end,
	EditBoxOnEscapePressed = function()
		this:GetParent():Hide();
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1
};
StaticPopupDialogs["MerDKP_Delmember"] = {
	text = MerDKP_LUA_DELMEMBER,
	button1 = TEXT(YES),
	button2 = TEXT(NO),
	OnAccept = function()
		local editBox = getglobal(this:GetParent():GetName().."Text");
		local text = editBox:GetText();
		local _, _, name, dkpId = strfind(text,"<(.-)>#(%d+)");
		dkpId = tonumber(dkpId);
		MerDKP_DeleteMember(dkpId, name);
		MerDKP_InitDKP();
	end,
	timeout = 0,
	whileDead = 1,
	showAlert = 1,
	hideOnEscape = 1,
};
StaticPopupDialogs["MerDKP_Dellist"] = {
	text = MerDKP_LUA_DELLIST,
	button1 = TEXT(YES),
	button2 = TEXT(NO),
	OnAccept = function()
		Mer_DKPFrameIEDelButton_OnClick(true);
	end,
	timeout = 0,
	whileDead = 1,
	showAlert = 1,
	hideOnEscape = 1,
};
StaticPopupDialogs["MerDKP_Savelist"] = {
	text = MerDKP_LUA_SAVELIST,
	button1 = TEXT(YES),
	button2 = TEXT(NO),
	OnAccept = function()
		Mer_DKPFrameIESaveButton_OnClick(true);
	end,
	timeout = 0,
	whileDead = 1,
	showAlert = 1,
	hideOnEscape = 1,
};
StaticPopupDialogs["MerDKP_GuildRosterDKP"] = {
	text = MerDKP_LUA_GUILDROSTERDKP,
	button1 = TEXT(YES),
	button2 = TEXT(NO),
	OnAccept = function()
		MerDKP_DKPLIST = MerDKP_GuildRoster_init() or {};
		for i = 1, getn(MerDKP_DKPLIST) do
			table.sort(MerDKP_DKPLIST[i], function(a,b)
				return (a.class<b.class) or (a.class==b.class and a.dkp>b.dkp)
			end);
		end
	end,
	timeout = 0,
	whileDead = 1,
	showAlert = 1,
	hideOnEscape = 1,
};