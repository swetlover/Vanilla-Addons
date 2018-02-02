function EUF_PartyInfo_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("PARTY_MEMBERS_CHANGED");
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
end;

function EUF_PartyInfo_OnEvent(event)
	if event == "VARIABLES_LOADED" or event == "PLAYER_ENTERING_WORLD" or event == "PARTY_MEMBERS_CHANGED" then
		--EN_Msg(event, arg1);
		EUF_FramePartyInfo_Update();
	end;
end;

function EUF_PartyInfo_Update(unit)
	if not unit then
		return;
	end;
	local unitExists, _,unitId = string.find(unit, "^party(%d)$");
	if not unitExists then
		return;
	end;
	
	-- Set class
	if EUF_CurrentOptions["PARTYCLASS"] == 1 then
		local class = UnitClass(unit);
		if class then
			if EUF_CurrentOptions["PARTYCLASSABRV"] == 1 then
				class = string.sub(class, 1, 4);
			end;
			getglobal("EUF_PartyInfo"..unitId.."Class"):SetText(class);
		end;
	else
		getglobal("EUF_PartyInfo"..unitId.."Class"):SetText("");
	end;
	

	-- Set level
	if EUF_CurrentOptions["PARTYLEVEL"] == 1 then
		local level= UnitLevel(unit);
		if level then
			if level < 1 then
				level = "??";
			end;
			getglobal("EUF_PartyInfo"..unitId.."Level"):SetText(level);
		end;
	else
		getglobal("EUF_PartyInfo"..unitId.."Level"):SetText("");
	end;

end

function EUF_FramePartyInfo_Update()
	local i;
	for i = 1, GetNumPartyMembers(), 1 do
		EUF_PartyInfo_Update("party"..i);
	end;
end;